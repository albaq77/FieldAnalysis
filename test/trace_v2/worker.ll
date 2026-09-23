target triple = "aarch64-unknown-linux-gnu"
%struct.Pair = type { i32, i32 }
define void @trace_worker(ptr %base) {
entry:
  %p = getelementptr %struct.Pair, ptr %base, i64 0, i32 1
  br label %loop
loop:
  %i = phi i32 [0, %entry], [%next, %loop]
  store volatile i32 %i, ptr %p
  %v = load volatile i32, ptr %p
  %next = add i32 %i, 1
  %again = icmp ult i32 %next, 25
  br i1 %again, label %loop, label %done
done:
  ret void
}
