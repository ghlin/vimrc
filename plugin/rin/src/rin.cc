#include "rin.h"

namespace rin {

#define WHITESPACE_CHARS " \n\t"

Str trim_left(const Str &poor_guy)
{
  auto pos = poor_guy.find_first_not_of(WHITESPACE_CHARS);

  return pos == Str::npos ? Str() : poor_guy.substr(pos);
}



Str trim_right(const Str &poor_guy)
{
  auto pos = poor_guy.find_last_not_of(WHITESPACE_CHARS);

  return pos == Str::npos ? Str() : poor_guy.substr(0, pos + 1);
}



Str trim(const Str &poor_poor_guy)
{
  return trim_left(trim_right(poor_poor_guy));
}



Str_List split(const Str &line, const Str &set)
{
  Str_List list;

  Str::size_type npos = Str::npos, f = 0, s = 0;

  while ((s = line.find_first_not_of(set, f)) != npos)
  {
    f = line.find_first_of(set, s);

    list.push_back(line.substr(s, f - s));
  }

  return list;
}




} // namespace rin
