; Zero memory events: computing an address is not a load.
target triple = "aarch64-unknown-linux-gnu"
%struct.Pair = type { i32, i32 }
define ptr @address_only(ptr %base) {
  %p = getelementptr %struct.Pair, ptr %base, i64 0, i32 1
  ret ptr %p
}
