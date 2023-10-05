echo Compiling... \
    && nasm -f elf64 main.asm \
    && echo Compiled! \
    && echo Linking and running... \
    && gcc -m64 main.o main.c -o main -z noexecstack \
    && ./main

# -z noexecstack shuts up the compiler warnings :D