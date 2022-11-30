cmake_minimum_required(VERSION 3.21)
project(A3_4 C)

set(CMAKE_C_STANDARD 11)

include_directories(A3-4/A3-4/Refrigerator)

add_executable(A3_4
        A3-4/A3-4/Refrigerator/domain.c
        A3-4/A3-4/Refrigerator/domain.h
        A3-4/A3-4/Refrigerator/dynamicArray.c
        A3-4/A3-4/Refrigerator/dynamicArray.h
        A3-4/A3-4/Refrigerator/main.c
        A3-4/A3-4/Refrigerator/repository.c
        A3-4/A3-4/Refrigerator/repository.h
        A3-4/A3-4/Refrigerator/service.c
        A3-4/A3-4/Refrigerator/service.h
        A3-4/A3-4/Refrigerator/ui.c
        A3-4/A3-4/Refrigerator/ui.h
        A3-4/A3-4/Refrigerator/undoRedo.c
        A3-4/A3-4/Refrigerator/undoRedo.h)
