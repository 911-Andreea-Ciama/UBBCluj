cmake_minimum_required(VERSION 3.21)
project(3_4 C)

set(CMAKE_C_STANDARD 11)

include_directories(3-4/3-4)

add_executable(3_4
        3-4/3-4/domain.c
        3-4/3-4/domain.h
        3-4/3-4/main.c
        3-4/3-4/repository.c
        3-4/3-4/repository.h
        3-4/3-4/service.c
        3-4/3-4/service.h
        3-4/3-4/ui.c
        3-4/3-4/ui.h
        3-4/3-4/undoRedo.c
        3-4/3-4/undoRedo.h)
