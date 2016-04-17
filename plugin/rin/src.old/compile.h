#ifndef COMPILE_H_INCLUDED_TXOL4RT6
#define COMPILE_H_INCLUDED_TXOL4RT6

#include "rin.h"
#include "option.h"

namespace rin {

#define DECL_GET_XXX(XXX) \
attr_export \
const Str &RIN_JOIN(get_, XXX)(const Option_Set &config, \
                               const Option_Set &options, \
                                     Option_Set &cache)

DECL_GET_XXX(compile_command);
DECL_GET_XXX(compiler);
DECL_GET_XXX(toolchain);
DECL_GET_XXX(language);
DECL_GET_XXX(input_filename);
DECL_GET_XXX(output_filename);
DECL_GET_XXX(incl);
DECL_GET_XXX(libs);
DECL_GET_XXX(inclpath);
DECL_GET_XXX(libpath);
DECL_GET_XXX(compile_flags);
DECL_GET_XXX(link_flags);

#undef DECL_GET_XXX
} // namespace rin


#endif // end of include guard: COMPILE_H_INCLUDED_TXOL4RT6

