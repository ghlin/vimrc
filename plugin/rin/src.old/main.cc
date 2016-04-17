#include "rin.h"
#include "option.h"
#include "compile.h"
#include "execute.h"
#include "use.h"

using namespace rin;

int process_file(const Str &input, Option_Set config)
{
  bool nodefaults = config.check("nodefaults");
  bool silent     = config.check("silent");

  Option_Set cache;
  Option_Set options = make_option_set(collect_options_from_file(config, input));

  options.insert("input_filename", input);

  process_option_set(config, config, options, cache);
  process_option_set(options, config, options, cache);

  if (!nodefaults && !options.check("nodefault-std") && !options.check("std")
    && options.query("compile", "").find("-std=") == Str::npos)
  {
    auto language = get_language(config, options, cache);

    if (language == "c")
      apply_preset("c11", config, config, options, cache);
    else if (language == "c++")
      apply_preset("c++1y", config, config, options, cache);
  }

  if (!nodefaults && !options.check("nodefault-debug"))
  {
    apply_preset("debug", config, config, options, cache);
  }

  if (!nodefaults && !options.check("nodefault-home"))
  {
    apply_preset("home", config, config, options, cache);
    apply_preset("brew", config, config, options, cache);
  }

  auto command = get_compile_command(config, options, cache);

  log_message("compile command : [%s]", command);

  if (config.check("just-get-command"))
  {
    std::cout << command << std::endl;

    return 0;
  }

  if (!silent)
    std::cout << "Compile command: " << command << std::endl;

  auto compile_result = execute(command);

  if (!compile_result)
    panic("error execute [%s]", command);

  if (!*compile_result)
  {
    if (!silent)
      log_print(std::cerr, "Compiler raised an error : %d\n", compile_result->exit_status);

    log_print(std::cerr, "%s\n", compile_result->err);

    return compile_result->exit_status;
  }

  if (config.check("run") || options.check("run"))
  {
    auto program = get_output_filename(config, options, cache);

    if (!silent)
      std::cout << "===========================[ running: " << program << " ]=====================" << std::endl;

    return std::system(program.c_str());
  }

  return 0;
}

int main(int argc, char **argv) try
{
  std::basic_string<const char *> args = argv + 1;

  if (args.empty())
    panic("usage %s inputfile", argv[0]);

  Str_List  input_files;

  Option_Set config;

  std::set<Str> acceptable_args = { "-run", "-silent", "-just-get-command", "-nodefaults" };

  for (auto &&arg : args)
  {
    if (has(acceptable_args, arg))
      config.insert(arg + 1 /* skip the '-' */, "YES!!!");
    else if (arg[0] == '-')
      log_print(std::cerr, "!!! WARNING unknown arg : %s\n", arg);
    else
      input_files.push_back(arg);
  }

  if (input_files.empty())
    panic("No input file!");

  for (auto &&input : input_files)
    process_file(input, config);

  return 0;
}
catch (const std::exception &e)
{
  log_error("Ooops : [%s]", e.what());

  return -1;
}
catch (...)
{
  log_error("Ooops.");

  return -1;
}

