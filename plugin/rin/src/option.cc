#include "option.h"

namespace rin {

static inline
Opt<Option_Pair> try_extract_option(const Option_Set &config,
                                    const Str        &line)
{
  auto indicator_str = config.query("indicator-str", "@@@");

  auto indicator_pos = line.find(indicator_str);

  if (indicator_pos == line.npos)
    return { };

  auto col_pos = line.find_first_of(":.", indicator_pos);

  if (col_pos == line.npos)
    return { };

  auto key = trim({ line.cbegin() + indicator_pos + indicator_str.length(),
                    line.cbegin() + col_pos });

  auto value = trim(line.substr(col_pos + 1));

  return { { key, value } };
}



Option_List collect_options_from_source_code(
  const Option_Set &config,
  const Str_List   &source_code)
{
  Option_List opts;

  for (auto &&line : source_code)
  {
    if (auto option = try_extract_option(config, line))
      opts.emplace_back(std::move(*option));
  }

  return opts;
}



Option_List collect_options_from_file(const Option_Set &config,
                                      const Str        &filename)
{
  auto file = std::ifstream { filename };

  if (!file)
  {
    log_print(std::cerr, "Cannot open file [%s]!\n", filename);

    return { };
  }

  Option_List opts;

  for (Str line; std::getline(file, line); )
  {
    if (auto option = try_extract_option(config, line))
      opts.emplace_back(std::move(*option));
  }

  return opts;
}



Option_Set make_option_set(const Option_List &opts)
{
  Option_Set optset;

  for (auto &&option : opts)
    optset.append(option.first, option.second);

  return optset;
}


} // namespace rin


