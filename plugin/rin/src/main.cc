#include "rin.h"
#include "option.h"
#include "compile.h"
#include "execute.h"
#include "use.h"

using namespace rin;

int process_file(const Str &input, Option_Set config)
{
  bool nodefaults = config.check("no-defaults");
  bool silent     = config.check("quiet");

  Option_Set cache;
  Option_Set options = make_option_set(collect_options_from_file(config, input));

  options.insert("input_filename", input);

  process_option_set(config, config, options, cache);
  process_option_set(options, config, options, cache);

  if (!nodefaults && !options.check("no-defaults-std") && !options.check("std")
    && options.query("compile", "").find("-std=") == Str::npos)
  {
    auto language = get_language(config, options, cache);

    if (language == "c")
      apply_preset("c11", config, config, options, cache);
    else if (language == "c++")
      apply_preset("c++1y", config, config, options, cache);
  }

  if (!nodefaults && !options.check("no-defaults-debug"))
  {
    apply_preset("debug", config, config, options, cache);
  }

  if (!nodefaults && !options.check("no-defaults-home"))
  {
    apply_preset("home", config, config, options, cache);
    apply_preset("brew", config, config, options, cache);
  }

  auto command = get_compile_command(config, options, cache);

  log_message("compile command: [%s]", command);

  if (config.check("command"))
  {
    std::cout << command << std::endl;

    return 0;
  }

  if (!silent) {
    std::cerr << command << std::endl;
  }

  auto compile_result = execute(command);

  if (!compile_result)
    panic("error execute [%s]", command);

  if (!*compile_result)
  {
    if (!silent) {
      std::cerr << "*** compiler failed (" << compile_result->exit_status << ") ***" << std::endl;
    }

    std::cerr << compile_result->err << std::endl;

    return compile_result->exit_status;
  }

  if (compile_result->err.length() != 0 && !silent) {
    std::cerr << "*** compiled with warnings ***" << std::endl;
    std::cerr << compile_result->err;
  }

  if (config.check("run") || options.check("run"))
  {
    auto program = get_output_filename(config, options, cache);

    if (!silent)
      std::cerr << "*** running the program ***" << std::endl;

    return std::system(program.c_str());
  }

  return 0;
}

int main(int argc, char **argv) try
{
  std::basic_string<const char *> args = argv + 1;

  if (args.empty())
    panic("usage: %s inputfile", argv[0]);

  Str_List  input_files;

  Option_Set config;

  std::set<Str> acceptable_args = { "--run", "--quiet", "--command", "--no-defaults" };

  for (auto &&arg : args)
  {
    if (has(acceptable_args, arg))
      config.insert(arg + 2, "YES!!!");
    else if (arg[0] == '-')
      log_print(std::cerr, "WARNING: unknown arg : %s\n", arg);
    else
      input_files.push_back(arg);
  }

  if (input_files.empty())
    panic("No input file!");

  auto last_error = 0;

  for (auto &&input : input_files) {
    auto exit_code = process_file(input, config);
    if (!last_error) last_error = exit_code;
  }

  return !!last_error;
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

