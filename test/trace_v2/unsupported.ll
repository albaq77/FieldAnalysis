target triple = "aarch64-unknown-linux-gnu"
%struct.Scalable = type { <vscale x 4 x i32>, <vscale x 4 x i32> }
define <vscale x 4 x i32> @scalable(ptr %p) {
  %v = load <vscale x 4 x i32>, ptr %p
  ret <vscale x 4 x i32> %v
}
define i32 @other_address_space(ptr addrspace(1) %p) {
  %v = load i32, ptr addrspace(1) %p
  ret i32 %v
}
define %struct.Scalable @scalable_struct(ptr %p) {
  %v = load %struct.Scalable, ptr %p
  ret %struct.Scalable %v
}
