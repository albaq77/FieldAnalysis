source_filename = "functions.c"
target datalayout = "e-m:e-i64:64-i128:128-n32:64-S128"
@value = global i32 0

define i32 @helper(ptr nocapture readonly %p) nofree nosync nounwind willreturn memory(argmem: read) {
  %x = load i32, ptr %p
  ret i32 %x
}

define i32 @main() {
  store i32 7, ptr @value
  %x = call i32 @helper(ptr nocapture readonly @value) nofree nosync nounwind willreturn memory(argmem: read)
  call void @fa_worker()
  ret i32 0
}

define void @fa_worker() {
  store i32 9, ptr @value
  ret void
}
