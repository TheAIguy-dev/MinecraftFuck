./meta_brain_fuck --charset "[]<>+-,.%$" && gdb ./systemf -iex="set pagination off" -ex="break BF_DEBUGGING_BREAK" -ex="run out.bf" -ex="info reg r13" -ex="x/32ub &tape"
