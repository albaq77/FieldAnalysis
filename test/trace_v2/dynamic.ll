target triple = "aarch64-unknown-linux-gnu"
@a = global [32 x i8] zeroinitializer
@b = global [32 x i8] zeroinitializer
declare void @llvm.memcpy.p0.p0.i64(ptr, ptr, i64, i1 immarg)
define void @copy_n(i64 %n) {
  call void @llvm.memcpy.p0.p0.i64(ptr @a, ptr @b, i64 %n, i1 false)
  ret void
}
define i32 @main() {
  call void @copy_n(i64 6)
  call void @copy_n(i64 0)
  ret i32 0
}
