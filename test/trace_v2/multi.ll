; Three records: R/W/R, each 4 bytes, all at the same address.
target triple = "aarch64-unknown-linux-gnu"
%struct.Pair = type { i32, i32 }
@pair = global %struct.Pair zeroinitializer
define i32 @main() {
  %p = getelementptr %struct.Pair, ptr @pair, i64 0, i32 1
  %a = load volatile i32, ptr %p
  store volatile i32 7, ptr %p
  %b = load volatile i32, ptr %p
  ret i32 0
}
