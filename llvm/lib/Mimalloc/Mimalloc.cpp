#if LLVM_ENABLE_MIMALLOC
// Including mimalloc-new-delete.h overrides new/delete operators.
// We need it only when we are using mimalloc as a dynamic library.
# include <mimalloc-new-delete.h>


// Silence mimalloc warning messages that users can just ignore.
# include <mimalloc.h>
#endif

namespace llvm {

namespace mimalloc {

#if LLVM_ENABLE_MIMALLOC
void set_mimalloc_options() {
  mi_option_disable(mi_option_verbose);
  mi_option_disable(mi_option_show_errors);
}
#else
void set_mimalloc_options() {}
#endif
}
}
