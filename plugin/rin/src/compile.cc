#include "compile.h"


#define IMPL_GET_XXX(XXX)               \
const Str &RIN_JOIN(get_, XXX)          \
( attr_unused const Option_Set &config  \
, attr_unused const Option_Set &options \
, attr_unused       Option_Set &cache   \
)

#define args config, options, cache

namespace rin {

#define return_if_cached(key) \
  if (cache.check(key)) return cache.get(key)

#define getxxx(xxx) \
  Str xxx = RIN_JOIN(get_, xxx)(args)

IMPL_GET_XXX(compile_command)
{
  return_if_cached("compile_command");

  getxxx(compiler);
  getxxx(input_filename);
  getxxx(output_filename);
  getxxx(compile_flags);
  getxxx(link_flags);

  auto command = compiler + " -o"
    + " " + output_filename
    + " " + input_filename
    + " " + compile_flags
    + " " + link_flags;

  return cache.update("compile_command", trim(command));
}


IMPL_GET_XXX(compiler)
{
  return_if_cached("compiler");

  getxxx(toolchain);
  getxxx(language);

  if (language == "c")
    return cache.update("compiler", "gcc");

  if (language == "c++")
    return cache.update("compiler", "g++");

  panic("not c / c++ file");

  return cache.update("compiler", "echo ERROR");
}


IMPL_GET_XXX(toolchain)
{
  return_if_cached("toolchain");

  Str pref_tc = options.query("toolchain", "gcc");

  if (pref_tc != "llvm" && pref_tc != "gcc")
    return cache.update("toolchain", "gcc");

  return cache.update("toolchain", pref_tc);
}


IMPL_GET_XXX(ext)
{
  return_if_cached("ext");

  getxxx(input_filename);

  auto dot = input_filename.find_last_of(".");

  if (dot == Str::npos)
    return cache.update("ext", "");

  auto ext = input_filename.substr(dot);

  return cache.update("ext", ext);
}


IMPL_GET_XXX(language)
{
  return_if_cached("language");

  if (auto language = options.query("language"))
    return cache.update("language", *language);

  getxxx(ext);

  if (ext == ".c")
    return cache.update("language", "c");

  if (ext == ".cc" || ext == ".c++" || ext == ".cpp" || ext == ".cxx" || ext == ".C")
    return cache.update("language", "c++");

  panic("Unsupported language (ext = %s)", ext);

  return cache.update("language", "");
}


IMPL_GET_XXX(folder)
{
  return_if_cached("folder");

  getxxx(input_filename);

  auto last_slash = input_filename.find_last_of("\\/");

  if (last_slash == Str::npos)
    return cache.update("folder", ".");

  return cache.update("folder", input_filename.substr(0, last_slash));
}


IMPL_GET_XXX(name_part)
{
  return_if_cached("name_part");

  getxxx(input_filename);

  auto last_slash = input_filename.find_last_of("\\/");

  if (last_slash == Str::npos)
    return cache.update("name_part",
                        {
                          input_filename.cbegin(),
                          input_filename.cbegin() + input_filename.find_last_of(".")
                        });

  return cache.update("name_part",
                      {
                          input_filename.cbegin() + last_slash + 1,
                          input_filename.cbegin() + input_filename.find_last_of(".")
                      });
}


IMPL_GET_XXX(input_filename)
{
  return_if_cached("input_filename");

  if (auto input = config.query("input_filename"))
    return cache.update("input_filename", *input);

  if (auto input = options.query("input_filename"))
    return cache.update("input_filename", *input);

  panic("no input");

  return cache.update("input_filename", "");
}

IMPL_GET_XXX(output_filename)
{
  return_if_cached("output_filename");

  if (auto output = options.query("output"))
    return cache.update("output_filename", *output);

  getxxx(folder);

  if (auto output_namepart = options.query("output-namepart"))
    return cache.update("output_filename", folder + "/" + *output_namepart);

  getxxx(name_part);

  return cache.update("output_filename",
                      folder + "/" + name_part + options.query("exec-ext", ".exec"));
}



inline
Str qjoin(const Option_Set &opts,
          const Str        &name,
          const Str        &ssep,
          const Str        &jsep)
{
  Str result;
  if (auto found = opts.query(name))
  {
    auto list = split(*found, ssep);
    for (auto &&item : list)
      result += " " + jsep + trim(item);
  }

  return result;
}

IMPL_GET_XXX(inclpath)
{
  return_if_cached("inclpath");

  auto sep = ";:,";
  return cache.update("inclpath", qjoin(config, "inclpath", sep, "-I")
                      +           qjoin(config, "search", sep, "-I")
                      +           qjoin(options, "inclpath", sep, "-I")
                      +           qjoin(options, "search", sep, "-I"));
}

IMPL_GET_XXX(libpath)
{
  return_if_cached("libpath");

  Str result;

  return cache.update("libpath", qjoin(config, "libpath", ";:,", "-L") + qjoin(options, "libpath", ";:,", "-L"));
}


IMPL_GET_XXX(incl)
{
  return_if_cached("incl");

  return cache.update("incl", qjoin(config, "include", ";:,", "-i") + qjoin(options, "include", ";:,", "-i"));
}

IMPL_GET_XXX(libs)
{
  return_if_cached("libs");

  return cache.update("libs", qjoin(config, "lib", ";:,/", "-l") + qjoin(options, "lib", ";:,/", "-l"));
}

IMPL_GET_XXX(compile_flags)
{
  return_if_cached("compile_flags");

  getxxx(inclpath);
  getxxx(incl);

  return cache.update("compile_flags",
                        " " + config.query("compile", "")
                      + " " + options.query("compile", "")
                      + " " + inclpath
                      + " " + incl);
}


IMPL_GET_XXX(link_flags)
{
  return_if_cached("link_flags");

  getxxx(libpath);
  getxxx(libs);

  return cache.update("link_flags",
                      libpath + " " + libs
                      + " " + config.query("link", "")
                      + " " + options.query("link", ""));
}





} // namespace rin
