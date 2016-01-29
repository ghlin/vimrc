#ifndef EXECUTE_H_INCLUDED_2WND7EOU
#define EXECUTE_H_INCLUDED_2WND7EOU

#include "rin.h"

namespace rin {

struct Exec_Result
{
  Str         out;
  Str         err;

  int         exit_status = -1;


  inline operator bool() const
  {
    return exit_status == 0;
  }
};



attr_export
Opt<Exec_Result> execute(const Str &command);


attr_export
Opt<Exec_Result> execute(const Str &program,
                         const Str_List &args);

attr_export
Opt<Exec_Result> execute_with_input(const Str &command,
                                    const Str &input);

attr_export
Opt<Exec_Result> execute_with_input_file(const Str &command,
                                         const Str &input_file);

} // namespace rin


#endif // end of include guard: EXECUTE_H_INCLUDED_2WND7EOU

