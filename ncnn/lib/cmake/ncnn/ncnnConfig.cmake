set(NCNN_OPENMP ON)
set(NCNN_VULKAN ON)
set(NCNN_SYSTEM_GLSLANG OFF)

if(NCNN_OPENMP)
    find_package(OpenMP)
endif()

if(NCNN_VULKAN)
    find_package(Vulkan REQUIRED)

    if(NCNN_SYSTEM_GLSLANG)
        set(GLSLANG_TARGET_DIR "")
    else()
        set(GLSLANG_TARGET_DIR "${CMAKE_CURRENT_LIST_DIR}/..")
    endif(NCNN_SYSTEM_GLSLANG)

    find_package(Threads)

    include(${GLSLANG_TARGET_DIR}/OSDependentTargets.cmake)
    include(${GLSLANG_TARGET_DIR}/OGLCompilerTargets.cmake)
    if(EXISTS "${GLSLANG_TARGET_DIR}/HLSLTargets.cmake")
        # hlsl support can be optional
        include("${GLSLANG_TARGET_DIR}/HLSLTargets.cmake")
    endif()
    include(${GLSLANG_TARGET_DIR}/glslangTargets.cmake)
    include(${GLSLANG_TARGET_DIR}/SPIRVTargets.cmake)
endif(NCNN_VULKAN)

include(${CMAKE_CURRENT_LIST_DIR}/ncnn.cmake)
