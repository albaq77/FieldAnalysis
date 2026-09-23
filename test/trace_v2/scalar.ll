; W/R, each 4 bytes: no struct or TBAA is needed for tracing.
target triple = "aarch64-unknown-linux-gnu"
@value = global i32 0
define i32 @main() {
  store volatile i32 1, ptr @value
  %v = load volatile i32, ptr @value
  ret i32 0
}
