Step:

prev step: 
1. export NOOP_HOME=$(pwd); export NEMU_HOME=$(pwd)

2. prepare envionment to compile xs, like mill, verilator, gcc/g++

test step:
1. make emu -j9 EMU_THREADS=8 CONFIG=MinimalConfig EMU_TRACE=1

2. ./build/emu -i debug/priv-test1.bin --diff ready-to-run/riscv64-nemu-interpreter-so --dump-wave

The wave file locates ./build/**.vcd if execute emu with '--dump-wave'. GtkWave can be used to open wave file.
