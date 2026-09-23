target triple = "aarch64-unknown-linux-gnu"
@x = global i64 0, align 8
@y = global <4 x i32> zeroinitializer, align 16
@bytes = global [32 x i8] zeroinitializer
@src = global [32 x i8] zeroinitializer
declare void @llvm.memcpy.p0.p0.i64(ptr, ptr, i64, i1 immarg)
declare void @llvm.memmove.p0.p0.i64(ptr, ptr, i64, i1 immarg)
declare void @llvm.memset.p0.i64(ptr, i8, i64, i1 immarg)
define i32 @main() {
  store volatile i8 1, ptr @bytes
  %a = load volatile i8, ptr @bytes
  store atomic i64 4, ptr @x seq_cst, align 8
  %b = load atomic i64, ptr @x seq_cst, align 8
  %c = atomicrmw add ptr @x, i64 1 seq_cst
  %d = cmpxchg ptr @x, i64 5, i64 8 seq_cst seq_cst
  %e = cmpxchg ptr @x, i64 5, i64 9 seq_cst seq_cst
  store volatile <4 x i32> zeroinitializer, ptr @y
  %v = load volatile <4 x i32>, ptr @y
  call void @llvm.memcpy.p0.p0.i64(ptr @bytes, ptr @src, i64 7, i1 false)
  call void @llvm.memmove.p0.p0.i64(ptr @bytes, ptr @src, i64 5, i1 false)
  call void @llvm.memset.p0.i64(ptr @bytes, i8 0, i64 3, i1 false)
  call void @llvm.memset.p0.i64(ptr @bytes, i8 0, i64 0, i1 false)
  ret i32 0
}
