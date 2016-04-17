#include "rin.h"
#include "execute.h"

#include <unistd.h>

namespace rin {

struct Exec_Details
{
  // 对于新的进程来说的out,err,in
  int in;
  int out;
  int err;

  pid_t pid;
};

static
Opt<Exec_Details> open_process(const Str &command)
{
  int pin[2], pout[2], perr[2];

  ::pipe(pin);
  ::pipe(pout);
  ::pipe(perr);

  pid_t pid = ::fork();

  if (pid == 0)
  {
    // child process.
    ::close(pin[1]);
    ::dup2(pin[0], STDIN_FILENO);
    ::close(pin[0]);

    ::close(pout[0]);
    ::dup2(pout[1], STDOUT_FILENO);
    ::close(pout[1]);

    ::close(perr[0]);
    ::dup2(perr[1], STDERR_FILENO);
    ::close(perr[1]);

    ::setpgid(0, 0);

    ::execl("/bin/sh", "sh", "-c", command.c_str(), (char *)0);
    ::exit(-1);
  }

  if (pid == -1)
    return { };

  ::close(pin[0]);
  ::close(pout[1]);
  ::close(perr[1]);

  return { { pin[1], pout[0], perr[0] , pid } };
}


Opt<Exec_Result> execute_with_input(const Str &command,
                                    const Str &input)
{
  auto exec_ctx = open_process(command);

  if (!exec_ctx)
    return { };

  Exec_Result er;

  auto in   = exec_ctx->in,
       out  = exec_ctx->out,
       err  = exec_ctx->err;

  pid_t pid = exec_ctx->pid;

  ::write(in, input.c_str(), input.length());
  ::close(in);

  constexpr size_t buff_size = 1024;
  char read_buff[buff_size + 1];

  for (ssize_t nr; (nr = ::read(out, read_buff, buff_size)) > 0; )
    er.out += { read_buff, read_buff + nr };

  for (ssize_t nr; (nr = ::read(err, read_buff, buff_size)) > 0; )
    er.err += { read_buff, read_buff + nr };

  ::close(out);
  ::close(err);

  ::waitpid(pid, &er.exit_status, 0);

  return { er };
}



Opt<Exec_Result> execute(const Str &command)
{
  return execute_with_input(command, "");
}



Opt<Exec_Result> execute_with_input_file(const Str &command,
                                         const Str &input_file)
{
  Str input;

  std::ifstream in(input_file);

  if (!in)
  {
    log_error("Cannot read file [%s].", input_file);

    return { };
  }

  for (Str line; std::getline(in, line); input += '\n')
    input += line;

  return execute_with_input(command, input);
}


} // namespace rin


int test(int argc, char **argv)
{
  (void)argc;
  (void)argv;

  using namespace rin;

  for (Str line; std::getline(std::cin, line); )
  {
    auto result = execute(line);

    log_message("exit-status: [%d]", result->exit_status);
    log_message("stdout: [%s]", result->out);
    log_message("stderr: [%s]", result->err);
  }

  return 0;
}


