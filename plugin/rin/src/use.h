#ifndef USE_H_INCLUDED_8OUC1ZNR
#define USE_H_INCLUDED_8OUC1ZNR

#include "rin.h"
#include "option.h"


namespace rin {

struct Preset
{
  using Getter_Function = std::function<Str ( const Option_Set &  /* config */
                                            , const Option_Set &  /* options from source code */
                                            ,       Option_Set &  /* cache */
                                            )>;

  Getter_Function compile_flags;
  Getter_Function link_flags;
};


attr_export
Opt<Preset> query_preset(const Str &use);


attr_export
void process_option_set(Option_Set &target,
                  const Option_Set &config,
                  const Option_Set &options,
                        Option_Set &cache);

attr_export
void apply_preset(const Preset     &preset,
                        Option_Set &target,
                  const Option_Set &config,
                  const Option_Set &options,
                        Option_Set &cache);

attr_export
void apply_preset(const Str        &use,
                        Option_Set &target,
                  const Option_Set &config,
                  const Option_Set &options,
                        Option_Set &cache);


} // namespace rin

#endif // end of include guard: USE_H_INCLUDED_8OUC1ZNR

