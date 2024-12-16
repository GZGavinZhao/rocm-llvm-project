if(LLVM_ENABLE_MIMALLOC)
  list(APPEND imported_libs mimalloc)
endif()

add_llvm_library(LLVMMimalloc
  Mimalloc.cpp

  LINK_LIBS
  ${imported_libs}
  )
