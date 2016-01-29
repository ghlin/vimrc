#ifndef OPTION_H_INCLUDED_CABERHSJ
#define OPTION_H_INCLUDED_CABERHSJ

#include "rin.h"

namespace rin {

using Option_Pair = std::pair<Str, Str>;
using Option_List = std::vector<Option_Pair>;
using Option_Table = std::map<Str, Str>;




struct Option_Set
{
  Option_Table table;

  inline
  const Str &update(const Str &key,
                    const Str &value)
  {
    return table[key] = value;
  }

  inline
  Str query(const Str &key, const Str &def) const
  {
    if (auto fnd = query(key))
      return *fnd;

    return def;
  }

  inline
  Opt<Str>   query(const Str &key) const
  {
    return find(table, key);
  }

  inline
  bool       check(const Str &key) const
  {
    return has(table, key);
  }

  inline
  const Str &append(const Str &key, const Str &value, const Str &sep = "")
  {
    if (check(key))
      return table[key] += sep + value;

    return table[key] += value;
  }

  inline
  const Str &insert(const Str &key, const Str &value)
  {
    table.insert({ key, value });
    return table[key];
  }

  inline
  const Str &get(const Str &key) const
  {
    return table.at(key);
  }
};


attr_export
Option_Set make_option_set(const Option_List &opts);


attr_export
Option_List collect_options_from_source_code(const Option_Set   &config,
                                             const Str_List     &source_code);

attr_export
Option_List collect_options_from_file(const Option_Set   &config,
                                      const Str          &file);


} // namespace rin


#endif // end of include guard: OPTION_H_INCLUDED_CABERHSJ

