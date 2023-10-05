gcc main.c main.S -o main -z noexecstack -O3 \
    && ./main

# -z noexecstack shuts up the compiler warnings :D