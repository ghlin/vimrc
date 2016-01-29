#include "use.h"

namespace rin {

static inline
Preset::Getter_Function make_getter(const Str &flags)
{
  return [=] ( const Option_Set &
             , const Option_Set &
             ,       Option_Set &)
  { return flags; };
}

struct Presets
{
  std::map<Str, Preset> presets;

  Presets()
  {
#define add(k, c, l) \
    presets.insert({ k, { make_getter(c), make_getter(l) } })

    add("debug", "-Wall -Wextra -W -O0 -DDEBUG=1 -D_DEBUG=1", "");
    add("home", "-I$HOME/.local/include", "-L$HOME/.local/lib");
    add("brew", "-I/usr/local/include", "-L/usr/local/lib");
    add("c++11", "-std=c++11", "");
    add("c++14", "-std=c++14", "");
    add("c++1y", "-std=c++1y", "");
    add("c99", "-std=c99", "");
    add("c11", "-std=c11", "");
  }
};


Opt<Preset> query_preset(const Str &use)
{
  static Presets _;

  return find(_.presets, use);
}



void apply_preset(const Preset     &preset,
                        Option_Set &target,
                  const Option_Set &config,
                  const Option_Set &options,
                        Option_Set &cache)
{
  target.append("compile", " " + preset.compile_flags(config, options, cache));
  target.append("link", " " + preset.link_flags(config, options, cache));
}

void apply_preset(const Str        &use,
                        Option_Set &target,
                  const Option_Set &config,
                  const Option_Set &options,
                        Option_Set &cache)
{
  if (auto preset = query_preset(use))
    apply_preset(*preset, target, config, options, cache);
}

void process_option_set(Option_Set &target,
                  const Option_Set &config,
                  const Option_Set &options,
                        Option_Set &cache)
{
  if (auto presets = target.query("use"))
  {
    auto use_list = split(*presets, " ,;/");

    for (auto &&use : use_list)
      apply_preset(trim(use), target, config, options, cache);
  }
}

} // namespace rin

