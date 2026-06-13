; ModuleID = 'test_struct.c'
source_filename = "test_struct.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Foo = type { i32, float, double, [16 x i8], i64 }
%struct.Outer = type { i32, %struct.Inner, i64 }
%struct.Inner = type { float, double }
%struct.WithArray = type { i32, [4 x float], double }

@g_foo = dso_local global %struct.Foo zeroinitializer, align 8, !dbg !0
@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1, !dbg !32
@.str.1 = private unnamed_addr constant [11 x i8] c"ab: %d %f\0A\00", align 1, !dbg !37
@.str.2 = private unnamed_addr constant [11 x i8] c"cd: %f %s\0A\00", align 1, !dbg !42
@.str.3 = private unnamed_addr constant [12 x i8] c"ae: %d %ld\0A\00", align 1, !dbg !44
@.str.4 = private unnamed_addr constant [12 x i8] c"hot: %d %f\0A\00", align 1, !dbg !49
@.str.5 = private unnamed_addr constant [6 x i8] c"local\00", align 1, !dbg !51
@.str.6 = private unnamed_addr constant [24 x i8] c"stack: %d %f %f %s %ld\0A\00", align 1, !dbg !53
@.str.7 = private unnamed_addr constant [5 x i8] c"heap\00", align 1, !dbg !58
@.str.8 = private unnamed_addr constant [23 x i8] c"heap: %d %f %f %s %ld\0A\00", align 1, !dbg !63
@.str.9 = private unnamed_addr constant [15 x i8] c"bar: %d %d %d\0A\00", align 1, !dbg !68
@g_outer = dso_local local_unnamed_addr global %struct.Outer zeroinitializer, align 8, !dbg !95
@.str.10 = private unnamed_addr constant [22 x i8] c"nested: %d %f %f %ld\0A\00", align 1, !dbg !73
@g_witharr = dso_local local_unnamed_addr global %struct.WithArray zeroinitializer, align 8, !dbg !97
@.str.11 = private unnamed_addr constant [23 x i8] c"array_field: %d %f %f\0A\00", align 1, !dbg !78
@g_arr = dso_local local_unnamed_addr global [5 x %struct.Foo] zeroinitializer, align 16, !dbg !107
@.str.12 = private unnamed_addr constant [20 x i8] c"arr[%d]: %d %f %ld\0A\00", align 1, !dbg !80
@.str.13 = private unnamed_addr constant [27 x i8] c"heap_nested: %d %f %f %ld\0A\00", align 1, !dbg !85
@.str.14 = private unnamed_addr constant [18 x i8] c"harr[%d]: %d %ld\0A\00", align 1, !dbg !90

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable
define dso_local void @init_global() local_unnamed_addr #0 !dbg !118 {
  store i32 1, ptr @g_foo, align 8, !dbg !121, !tbaa !122
  store float 2.000000e+00, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !dbg !130, !tbaa !131
  store double 3.000000e+00, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), align 8, !dbg !132, !tbaa !133
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(6) getelementptr inbounds (i8, ptr @g_foo, i64 16), ptr noundef nonnull align 1 dereferenceable(6) @.str, i64 6, i1 false) #9, !dbg !134
  store i64 42, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), align 8, !dbg !135, !tbaa !136
  ret void, !dbg !137
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @access_global_ab() local_unnamed_addr #1 !dbg !138 {
    #dbg_value(i32 0, !140, !DIExpression(), !143)
    #dbg_value(i32 0, !141, !DIExpression(), !144)
  %1 = load i32, ptr @g_foo, align 8, !tbaa !122
  %2 = load float, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !tbaa !131
    #dbg_value(i32 0, !141, !DIExpression(), !144)
    #dbg_value(i32 poison, !140, !DIExpression(), !143)
  br label %7, !dbg !145

3:                                                ; preds = %7
  %4 = add i32 %1, 4950, !dbg !145
  store i32 %4, ptr @g_foo, align 8, !dbg !146, !tbaa !122
  store float %23, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !dbg !149, !tbaa !131
  %5 = fpext float %23 to double, !dbg !150
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %4, double noundef %5), !dbg !151
  ret void, !dbg !152

7:                                                ; preds = %7, %0
  %8 = phi i32 [ 0, %0 ], [ %24, %7 ]
  %9 = phi float [ %2, %0 ], [ %23, %7 ]
    #dbg_value(i32 %8, !141, !DIExpression(), !144)
  %10 = uitofp nneg i32 %8 to float, !dbg !153
  %11 = tail call float @llvm.fmuladd.f32(float %10, float 5.000000e-01, float %9), !dbg !149
    #dbg_value(!DIArgList(i32 poison, i32 poison), !140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !143)
  %12 = add nuw nsw i32 %8, 1, !dbg !154
    #dbg_value(i32 poison, !140, !DIExpression(), !143)
    #dbg_value(i32 %12, !141, !DIExpression(), !144)
  %13 = uitofp nneg i32 %12 to float, !dbg !153
  %14 = tail call float @llvm.fmuladd.f32(float %13, float 5.000000e-01, float %11), !dbg !149
    #dbg_value(!DIArgList(i32 poison, i32 poison), !140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !143)
  %15 = add nuw nsw i32 %8, 2, !dbg !154
    #dbg_value(i32 poison, !140, !DIExpression(), !143)
    #dbg_value(i32 %15, !141, !DIExpression(), !144)
  %16 = uitofp nneg i32 %15 to float, !dbg !153
  %17 = tail call float @llvm.fmuladd.f32(float %16, float 5.000000e-01, float %14), !dbg !149
    #dbg_value(!DIArgList(i32 poison, i32 poison), !140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !143)
  %18 = add nuw nsw i32 %8, 3, !dbg !154
    #dbg_value(i32 poison, !140, !DIExpression(), !143)
    #dbg_value(i32 %18, !141, !DIExpression(), !144)
  %19 = uitofp nneg i32 %18 to float, !dbg !153
  %20 = tail call float @llvm.fmuladd.f32(float %19, float 5.000000e-01, float %17), !dbg !149
    #dbg_value(!DIArgList(i32 poison, i32 poison), !140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !143)
  %21 = add nuw nsw i32 %8, 4, !dbg !154
    #dbg_value(i32 poison, !140, !DIExpression(), !143)
    #dbg_value(i32 %21, !141, !DIExpression(), !144)
  %22 = uitofp nneg i32 %21 to float, !dbg !153
  %23 = tail call float @llvm.fmuladd.f32(float %22, float 5.000000e-01, float %20), !dbg !149
    #dbg_value(!DIArgList(i32 poison, i32 poison), !140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !143)
  %24 = add nuw nsw i32 %8, 5, !dbg !154
    #dbg_value(i32 %24, !141, !DIExpression(), !144)
    #dbg_value(i32 poison, !140, !DIExpression(), !143)
  %25 = icmp eq i32 %24, 100, !dbg !155
  br i1 %25, label %3, label %7, !dbg !145, !llvm.loop !156
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nofree nounwind
declare !dbg !159 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind uwtable
define dso_local void @access_global_cd() local_unnamed_addr #1 !dbg !166 {
    #dbg_value(i32 0, !168, !DIExpression(), !170)
  %1 = load double, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), align 8, !tbaa !133
    #dbg_value(i32 0, !168, !DIExpression(), !170)
  br label %4, !dbg !171

2:                                                ; preds = %4
  store double %19, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), align 8, !dbg !172, !tbaa !133
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %19, ptr noundef nonnull getelementptr inbounds (i8, ptr @g_foo, i64 16)), !dbg !175
  ret void, !dbg !176

4:                                                ; preds = %4, %0
  %5 = phi i32 [ 0, %0 ], [ %28, %4 ]
  %6 = phi double [ %1, %0 ], [ %19, %4 ]
    #dbg_value(i32 %5, !168, !DIExpression(), !170)
  %7 = uitofp nneg i32 %5 to double, !dbg !177
  %8 = tail call double @llvm.fmuladd.f64(double %7, double 1.500000e+00, double %6), !dbg !172
  %9 = add nuw nsw i32 %5, 230, !dbg !178
  %10 = icmp ult i32 %5, 26, !dbg !178
  %11 = select i1 %10, i32 %5, i32 %9, !dbg !178
  %12 = trunc i32 %11 to i8, !dbg !179
  %13 = add nuw i8 %12, 97, !dbg !179
  %14 = and i32 %5, 14, !dbg !180
  %15 = zext nneg i32 %14 to i64, !dbg !181
  %16 = getelementptr inbounds [16 x i8], ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i64 0, i64 %15, !dbg !181
  store i8 %13, ptr %16, align 2, !dbg !182, !tbaa !183
  %17 = or disjoint i32 %5, 1, !dbg !184
    #dbg_value(i32 %5, !168, !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value), !170)
  %18 = uitofp nneg i32 %17 to double, !dbg !177
  %19 = tail call double @llvm.fmuladd.f64(double %18, double 1.500000e+00, double %8), !dbg !172
  %20 = add nuw nsw i32 %5, 231, !dbg !178
  %21 = icmp ult i32 %5, 26, !dbg !178
  %22 = select i1 %21, i32 %17, i32 %20, !dbg !178
  %23 = trunc i32 %22 to i8, !dbg !179
  %24 = add nuw i8 %23, 97, !dbg !179
  %25 = and i32 %17, 15, !dbg !180
  %26 = zext nneg i32 %25 to i64, !dbg !181
  %27 = getelementptr inbounds [16 x i8], ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i64 0, i64 %26, !dbg !181
  store i8 %24, ptr %27, align 1, !dbg !182, !tbaa !183
  %28 = add nuw nsw i32 %5, 2, !dbg !184
    #dbg_value(i32 %28, !168, !DIExpression(), !170)
  %29 = icmp eq i32 %28, 50, !dbg !185
  br i1 %29, label %2, label %4, !dbg !171, !llvm.loop !186
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #3

; Function Attrs: nofree nounwind uwtable
define dso_local void @access_global_ae() local_unnamed_addr #1 !dbg !188 {
    #dbg_value(i32 0, !190, !DIExpression(), !192)
  %1 = load i32, ptr @g_foo, align 8, !tbaa !122
  %2 = load i64, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), align 8, !tbaa !136
    #dbg_value(i32 0, !190, !DIExpression(), !192)
  %3 = add i32 %1, 19900, !dbg !193
    #dbg_value(i64 undef, !190, !DIExpression(), !192)
  %4 = add i64 %2, 59700, !dbg !193
  store i32 %3, ptr @g_foo, align 8, !dbg !194, !tbaa !122
  store i64 %4, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), align 8, !dbg !197, !tbaa !136
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %3, i64 noundef %4), !dbg !198
  ret void, !dbg !199
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @hot_alternate_fields() local_unnamed_addr #1 !dbg !200 {
    #dbg_value(i32 0, !202, !DIExpression(), !204)
  %1 = load i32, ptr @g_foo, align 8, !tbaa !122
  %2 = load float, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !tbaa !131
    #dbg_value(i32 0, !202, !DIExpression(), !204)
  br label %6, !dbg !205

3:                                                ; preds = %6
  store float %18, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !dbg !206, !tbaa !131
  %4 = fpext float %18 to double, !dbg !209
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, i32 noundef %1, double noundef %4), !dbg !210
  ret void, !dbg !211

6:                                                ; preds = %6, %0
  %7 = phi i32 [ 0, %0 ], [ %19, %6 ]
  %8 = phi float [ %2, %0 ], [ %18, %6 ]
    #dbg_value(i32 %7, !202, !DIExpression(), !204)
  %9 = fadd float %8, 1.000000e+00, !dbg !212
  %10 = fadd float %9, -1.000000e+00, !dbg !213
    #dbg_value(i32 %7, !202, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !204)
  %11 = fadd float %10, 1.000000e+00, !dbg !212
  %12 = fadd float %11, -1.000000e+00, !dbg !213
    #dbg_value(i32 %7, !202, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !204)
  %13 = fadd float %12, 1.000000e+00, !dbg !212
  %14 = fadd float %13, -1.000000e+00, !dbg !213
    #dbg_value(i32 %7, !202, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !204)
  %15 = fadd float %14, 1.000000e+00, !dbg !212
  %16 = fadd float %15, -1.000000e+00, !dbg !213
    #dbg_value(i32 %7, !202, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !204)
  %17 = fadd float %16, 1.000000e+00, !dbg !212
  %18 = fadd float %17, -1.000000e+00, !dbg !213
  %19 = add nuw nsw i32 %7, 5, !dbg !214
    #dbg_value(i32 %19, !202, !DIExpression(), !204)
  %20 = icmp eq i32 %19, 500, !dbg !215
  br i1 %20, label %3, label %6, !dbg !205, !llvm.loop !216
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @stack_struct() local_unnamed_addr #1 !dbg !218 {
  %1 = alloca %struct.Foo, align 8, !DIAssignID !221
    #dbg_assign(i1 undef, !220, !DIExpression(), !221, ptr %1, !DIExpression(), !222)
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %1) #9, !dbg !223
  store i32 10, ptr %1, align 8, !dbg !224, !tbaa !122, !DIAssignID !225
    #dbg_assign(i32 10, !220, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !225, ptr %1, !DIExpression(), !222)
  %2 = getelementptr inbounds i8, ptr %1, i64 4, !dbg !226
  store float 2.000000e+01, ptr %2, align 4, !dbg !227, !tbaa !131, !DIAssignID !228
    #dbg_assign(float 2.000000e+01, !220, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !228, ptr %2, !DIExpression(), !222)
  %3 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !229
  store double 3.000000e+01, ptr %3, align 8, !dbg !230, !tbaa !133, !DIAssignID !231
    #dbg_assign(double 3.000000e+01, !220, !DIExpression(DW_OP_LLVM_fragment, 64, 64), !231, ptr %3, !DIExpression(), !222)
  %4 = getelementptr inbounds i8, ptr %1, i64 16, !dbg !232
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(6) %4, ptr noundef nonnull align 1 dereferenceable(6) @.str.5, i64 6, i1 false) #9, !dbg !233
  %5 = getelementptr inbounds i8, ptr %1, i64 32, !dbg !234
  store i64 99, ptr %5, align 8, !dbg !235, !tbaa !136, !DIAssignID !236
    #dbg_assign(i64 99, !220, !DIExpression(DW_OP_LLVM_fragment, 256, 64), !236, ptr %5, !DIExpression(), !222)
  %6 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef 10, double noundef 2.000000e+01, double noundef 3.000000e+01, ptr noundef nonnull %4, i64 noundef 99), !dbg !237
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %1) #9, !dbg !238
  ret void, !dbg !238
}

; Function Attrs: nounwind uwtable
define dso_local void @heap_struct() local_unnamed_addr #5 !dbg !239 {
  %1 = tail call noalias dereferenceable_or_null(40) ptr @malloc(i64 noundef 40) #10, !dbg !242
    #dbg_value(ptr %1, !241, !DIExpression(), !243)
  %2 = icmp eq ptr %1, null, !dbg !244
  br i1 %2, label %9, label %3, !dbg !246

3:                                                ; preds = %0
  store i32 100, ptr %1, align 8, !dbg !247, !tbaa !122
  %4 = getelementptr inbounds i8, ptr %1, i64 4, !dbg !248
  store float 2.000000e+02, ptr %4, align 4, !dbg !249, !tbaa !131
  %5 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !250
  store double 3.000000e+02, ptr %5, align 8, !dbg !251, !tbaa !133
  %6 = getelementptr inbounds i8, ptr %1, i64 16, !dbg !252
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(5) %6, ptr noundef nonnull align 1 dereferenceable(5) @.str.7, i64 5, i1 false) #9, !dbg !253
  %7 = getelementptr inbounds i8, ptr %1, i64 32, !dbg !254
  store i64 999, ptr %7, align 8, !dbg !255, !tbaa !136
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.8, i32 noundef 100, double noundef 2.000000e+02, double noundef 3.000000e+02, ptr noundef nonnull %6, i64 noundef 999), !dbg !256
  tail call void @free(ptr noundef nonnull %1) #9, !dbg !257
  br label %9, !dbg !258

9:                                                ; preds = %0, %3
  ret void, !dbg !258
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare !dbg !259 noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare !dbg !267 void @free(ptr allocptr nocapture noundef) local_unnamed_addr #7

; Function Attrs: nofree nounwind uwtable
define dso_local void @bar_access() local_unnamed_addr #1 !dbg !270 {
    #dbg_value(i32 1, !272, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !278)
    #dbg_value(i32 2, !272, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !278)
    #dbg_value(i32 3, !272, !DIExpression(DW_OP_LLVM_fragment, 64, 32), !278)
  %1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, i32 noundef 1, i32 noundef 2, i32 noundef 3), !dbg !279
  ret void, !dbg !280
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @nested_struct_access() local_unnamed_addr #1 !dbg !281 {
  store i32 1, ptr @g_outer, align 8, !dbg !285, !tbaa !286
  store i64 100, ptr getelementptr inbounds (i8, ptr @g_outer, i64 24), align 8, !dbg !289, !tbaa !290
    #dbg_value(i32 0, !283, !DIExpression(), !291)
    #dbg_value(i32 0, !283, !DIExpression(), !291)
  br label %4, !dbg !292

1:                                                ; preds = %4
  store float %14, ptr getelementptr inbounds (i8, ptr @g_outer, i64 8), align 8, !dbg !293, !tbaa !296
  store double %16, ptr getelementptr inbounds (i8, ptr @g_outer, i64 16), align 8, !dbg !297, !tbaa !298
  %2 = fpext float %14 to double, !dbg !299
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.10, i32 noundef 1, double noundef %2, double noundef %16, i64 noundef 100), !dbg !300
  ret void, !dbg !301

4:                                                ; preds = %4, %0
  %5 = phi i32 [ 0, %0 ], [ %17, %4 ]
  %6 = phi float [ 0x40091EB860000000, %0 ], [ %14, %4 ]
  %7 = phi double [ 2.718000e+00, %0 ], [ %16, %4 ]
    #dbg_value(i32 %5, !283, !DIExpression(), !291)
  %8 = uitofp nneg i32 %5 to float, !dbg !302
  %9 = tail call float @llvm.fmuladd.f32(float %8, float 0x3FB99999A0000000, float %6), !dbg !293
  %10 = uitofp nneg i32 %5 to double, !dbg !303
  %11 = tail call double @llvm.fmuladd.f64(double %10, double 1.000000e-02, double %7), !dbg !297
  %12 = or disjoint i32 %5, 1, !dbg !304
    #dbg_value(i32 %12, !283, !DIExpression(), !291)
  %13 = uitofp nneg i32 %12 to float, !dbg !302
  %14 = tail call float @llvm.fmuladd.f32(float %13, float 0x3FB99999A0000000, float %9), !dbg !293
  %15 = uitofp nneg i32 %12 to double, !dbg !303
  %16 = tail call double @llvm.fmuladd.f64(double %15, double 1.000000e-02, double %11), !dbg !297
  %17 = add nuw nsw i32 %5, 2, !dbg !304
    #dbg_value(i32 %17, !283, !DIExpression(), !291)
  %18 = icmp eq i32 %17, 80, !dbg !305
  br i1 %18, label %1, label %4, !dbg !292, !llvm.loop !306
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @array_field_access() local_unnamed_addr #1 !dbg !308 {
  store i32 42, ptr @g_witharr, align 8, !dbg !314, !tbaa !315
    #dbg_value(i32 0, !310, !DIExpression(), !317)
    #dbg_value(i64 0, !310, !DIExpression(), !317)
    #dbg_value(i64 1, !310, !DIExpression(), !317)
    #dbg_value(i64 2, !310, !DIExpression(), !317)
    #dbg_value(i64 3, !310, !DIExpression(), !317)
  store <4 x float> <float 0.000000e+00, float 1.000000e+01, float 2.000000e+01, float 3.000000e+01>, ptr getelementptr inbounds (i8, ptr @g_witharr, i64 4), align 4, !dbg !318, !tbaa !321
    #dbg_value(i64 4, !310, !DIExpression(), !317)
    #dbg_value(i32 0, !312, !DIExpression(), !322)
    #dbg_value(i64 0, !312, !DIExpression(), !322)
    #dbg_value(i64 1, !312, !DIExpression(), !322)
    #dbg_value(i64 2, !312, !DIExpression(), !322)
    #dbg_value(i64 3, !312, !DIExpression(), !322)
    #dbg_value(i64 4, !312, !DIExpression(), !322)
  store double 6.000000e+01, ptr getelementptr inbounds (i8, ptr @g_witharr, i64 24), align 8, !dbg !323, !tbaa !326
  %1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, i32 noundef 42, double noundef 0.000000e+00, double noundef 6.000000e+01), !dbg !327
  ret void, !dbg !328
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @struct_array_access() local_unnamed_addr #1 !dbg !329 {
    #dbg_value(i32 0, !331, !DIExpression(), !335)
    #dbg_value(i64 0, !331, !DIExpression(), !335)
  store i32 0, ptr @g_arr, align 16, !dbg !336, !tbaa !122
  store float 0.000000e+00, ptr getelementptr inbounds (i8, ptr @g_arr, i64 4), align 4, !dbg !339, !tbaa !131
  store i64 0, ptr getelementptr inbounds (i8, ptr @g_arr, i64 32), align 16, !dbg !340, !tbaa !136
    #dbg_value(i64 1, !331, !DIExpression(), !335)
  store i32 10, ptr getelementptr inbounds (i8, ptr @g_arr, i64 40), align 8, !dbg !336, !tbaa !122
  store float 1.500000e+00, ptr getelementptr inbounds (i8, ptr @g_arr, i64 44), align 4, !dbg !339, !tbaa !131
  store i64 100, ptr getelementptr inbounds (i8, ptr @g_arr, i64 72), align 8, !dbg !340, !tbaa !136
    #dbg_value(i64 2, !331, !DIExpression(), !335)
  store i32 20, ptr getelementptr inbounds (i8, ptr @g_arr, i64 80), align 16, !dbg !336, !tbaa !122
  store float 3.000000e+00, ptr getelementptr inbounds (i8, ptr @g_arr, i64 84), align 4, !dbg !339, !tbaa !131
  store i64 200, ptr getelementptr inbounds (i8, ptr @g_arr, i64 112), align 16, !dbg !340, !tbaa !136
    #dbg_value(i64 3, !331, !DIExpression(), !335)
  store i32 30, ptr getelementptr inbounds (i8, ptr @g_arr, i64 120), align 8, !dbg !336, !tbaa !122
  store float 4.500000e+00, ptr getelementptr inbounds (i8, ptr @g_arr, i64 124), align 4, !dbg !339, !tbaa !131
  store i64 300, ptr getelementptr inbounds (i8, ptr @g_arr, i64 152), align 8, !dbg !340, !tbaa !136
    #dbg_value(i64 4, !331, !DIExpression(), !335)
  store i32 40, ptr getelementptr inbounds (i8, ptr @g_arr, i64 160), align 16, !dbg !336, !tbaa !122
  store float 6.000000e+00, ptr getelementptr inbounds (i8, ptr @g_arr, i64 164), align 4, !dbg !339, !tbaa !131
  store i64 400, ptr getelementptr inbounds (i8, ptr @g_arr, i64 192), align 16, !dbg !340, !tbaa !136
    #dbg_value(i64 5, !331, !DIExpression(), !335)
    #dbg_value(i64 0, !333, !DIExpression(), !341)
  %1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef 0, i32 noundef 0, double noundef 0.000000e+00, i64 noundef 0), !dbg !342
    #dbg_value(i64 1, !333, !DIExpression(), !341)
  %2 = load i32, ptr getelementptr inbounds (i8, ptr @g_arr, i64 40), align 8, !dbg !345, !tbaa !122
  %3 = load float, ptr getelementptr inbounds (i8, ptr @g_arr, i64 44), align 4, !dbg !346, !tbaa !131
  %4 = fpext float %3 to double, !dbg !347
  %5 = load i64, ptr getelementptr inbounds (i8, ptr @g_arr, i64 72), align 8, !dbg !348, !tbaa !136
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef 1, i32 noundef %2, double noundef %4, i64 noundef %5), !dbg !342
    #dbg_value(i64 2, !333, !DIExpression(), !341)
  %7 = load i32, ptr getelementptr inbounds (i8, ptr @g_arr, i64 80), align 16, !dbg !345, !tbaa !122
  %8 = load float, ptr getelementptr inbounds (i8, ptr @g_arr, i64 84), align 4, !dbg !346, !tbaa !131
  %9 = fpext float %8 to double, !dbg !347
  %10 = load i64, ptr getelementptr inbounds (i8, ptr @g_arr, i64 112), align 16, !dbg !348, !tbaa !136
  %11 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef 2, i32 noundef %7, double noundef %9, i64 noundef %10), !dbg !342
    #dbg_value(i64 3, !333, !DIExpression(), !341)
  %12 = load i32, ptr getelementptr inbounds (i8, ptr @g_arr, i64 120), align 8, !dbg !345, !tbaa !122
  %13 = load float, ptr getelementptr inbounds (i8, ptr @g_arr, i64 124), align 4, !dbg !346, !tbaa !131
  %14 = fpext float %13 to double, !dbg !347
  %15 = load i64, ptr getelementptr inbounds (i8, ptr @g_arr, i64 152), align 8, !dbg !348, !tbaa !136
  %16 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef 3, i32 noundef %12, double noundef %14, i64 noundef %15), !dbg !342
    #dbg_value(i64 4, !333, !DIExpression(), !341)
  %17 = load i32, ptr getelementptr inbounds (i8, ptr @g_arr, i64 160), align 16, !dbg !345, !tbaa !122
  %18 = load float, ptr getelementptr inbounds (i8, ptr @g_arr, i64 164), align 4, !dbg !346, !tbaa !131
  %19 = fpext float %18 to double, !dbg !347
  %20 = load i64, ptr getelementptr inbounds (i8, ptr @g_arr, i64 192), align 16, !dbg !348, !tbaa !136
  %21 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef 4, i32 noundef %17, double noundef %19, i64 noundef %20), !dbg !342
    #dbg_value(i64 5, !333, !DIExpression(), !341)
  ret void, !dbg !349
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @heap_nested_struct() local_unnamed_addr #1 !dbg !350 {
    #dbg_value(ptr poison, !352, !DIExpression(), !353)
  %1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.13, i32 noundef 2, double noundef 1.000000e+00, double noundef 2.000000e+00, i64 noundef 50), !dbg !354
  ret void, !dbg !355
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @heap_struct_array() local_unnamed_addr #1 !dbg !356 {
    #dbg_value(ptr poison, !358, !DIExpression(), !363)
    #dbg_value(i64 0, !361, !DIExpression(), !364)
  %1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 0, i32 noundef 0, i64 noundef 0), !dbg !365
    #dbg_value(i64 1, !361, !DIExpression(), !364)
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 1, i32 noundef 1, i64 noundef 7), !dbg !365
    #dbg_value(i64 2, !361, !DIExpression(), !364)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 2, i32 noundef 2, i64 noundef 14), !dbg !365
    #dbg_value(i64 3, !361, !DIExpression(), !364)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 3, i32 noundef 3, i64 noundef 21), !dbg !365
    #dbg_value(i64 4, !361, !DIExpression(), !364)
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 4, i32 noundef 4, i64 noundef 28), !dbg !365
    #dbg_value(i64 5, !361, !DIExpression(), !364)
  ret void, !dbg !368
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #5 !dbg !369 {
  %1 = alloca %struct.Foo, align 8, !DIAssignID !372
  store double 3.000000e+00, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), align 8, !dbg !373, !tbaa !133
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(6) getelementptr inbounds (i8, ptr @g_foo, i64 16), ptr noundef nonnull align 1 dereferenceable(6) @.str, i64 6, i1 false) #9, !dbg !375
  store i64 42, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), align 8, !dbg !376, !tbaa !136
    #dbg_value(i32 0, !140, !DIExpression(), !377)
    #dbg_value(i32 0, !141, !DIExpression(), !379)
    #dbg_value(i32 0, !141, !DIExpression(), !379)
    #dbg_value(i32 poison, !140, !DIExpression(), !377)
  br label %2, !dbg !380

2:                                                ; preds = %2, %0
  %3 = phi i32 [ 0, %0 ], [ %19, %2 ]
  %4 = phi float [ 2.000000e+00, %0 ], [ %18, %2 ]
    #dbg_value(i32 %3, !141, !DIExpression(), !379)
  %5 = uitofp nneg i32 %3 to float, !dbg !381
  %6 = tail call float @llvm.fmuladd.f32(float %5, float 5.000000e-01, float %4), !dbg !382
    #dbg_value(!DIArgList(i32 poison, i32 poison), !140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !377)
  %7 = add nuw nsw i32 %3, 1, !dbg !383
    #dbg_value(i32 poison, !140, !DIExpression(), !377)
    #dbg_value(i32 %7, !141, !DIExpression(), !379)
  %8 = uitofp nneg i32 %7 to float, !dbg !381
  %9 = tail call float @llvm.fmuladd.f32(float %8, float 5.000000e-01, float %6), !dbg !382
    #dbg_value(!DIArgList(i32 poison, i32 poison), !140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !377)
  %10 = add nuw nsw i32 %3, 2, !dbg !383
    #dbg_value(i32 poison, !140, !DIExpression(), !377)
    #dbg_value(i32 %10, !141, !DIExpression(), !379)
  %11 = uitofp nneg i32 %10 to float, !dbg !381
  %12 = tail call float @llvm.fmuladd.f32(float %11, float 5.000000e-01, float %9), !dbg !382
    #dbg_value(!DIArgList(i32 poison, i32 poison), !140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !377)
  %13 = add nuw nsw i32 %3, 3, !dbg !383
    #dbg_value(i32 poison, !140, !DIExpression(), !377)
    #dbg_value(i32 %13, !141, !DIExpression(), !379)
  %14 = uitofp nneg i32 %13 to float, !dbg !381
  %15 = tail call float @llvm.fmuladd.f32(float %14, float 5.000000e-01, float %12), !dbg !382
    #dbg_value(!DIArgList(i32 poison, i32 poison), !140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !377)
  %16 = add nuw nsw i32 %3, 4, !dbg !383
    #dbg_value(i32 poison, !140, !DIExpression(), !377)
    #dbg_value(i32 %16, !141, !DIExpression(), !379)
  %17 = uitofp nneg i32 %16 to float, !dbg !381
  %18 = tail call float @llvm.fmuladd.f32(float %17, float 5.000000e-01, float %15), !dbg !382
    #dbg_value(!DIArgList(i32 poison, i32 poison), !140, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !377)
  %19 = add nuw nsw i32 %3, 5, !dbg !383
    #dbg_value(i32 %19, !141, !DIExpression(), !379)
    #dbg_value(i32 poison, !140, !DIExpression(), !377)
  %20 = icmp eq i32 %19, 100, !dbg !384
  br i1 %20, label %21, label %2, !dbg !380, !llvm.loop !385

21:                                               ; preds = %2
  store i32 4951, ptr @g_foo, align 8, !dbg !387, !tbaa !122
  store float %18, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !dbg !382, !tbaa !131
  %22 = fpext float %18 to double, !dbg !388
  %23 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 4951, double noundef %22), !dbg !389
    #dbg_value(i32 0, !168, !DIExpression(), !390)
  %24 = load double, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), align 8, !tbaa !133
    #dbg_value(i32 0, !168, !DIExpression(), !390)
  br label %25, !dbg !392

25:                                               ; preds = %25, %21
  %26 = phi i32 [ 0, %21 ], [ %49, %25 ]
  %27 = phi double [ %24, %21 ], [ %40, %25 ]
    #dbg_value(i32 %26, !168, !DIExpression(), !390)
  %28 = uitofp nneg i32 %26 to double, !dbg !393
  %29 = tail call double @llvm.fmuladd.f64(double %28, double 1.500000e+00, double %27), !dbg !394
  %30 = add nuw nsw i32 %26, 230, !dbg !395
  %31 = icmp ult i32 %26, 26, !dbg !395
  %32 = select i1 %31, i32 %26, i32 %30, !dbg !395
  %33 = trunc i32 %32 to i8, !dbg !396
  %34 = add nuw i8 %33, 97, !dbg !396
  %35 = and i32 %26, 14, !dbg !397
  %36 = zext nneg i32 %35 to i64, !dbg !398
  %37 = getelementptr inbounds [16 x i8], ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i64 0, i64 %36, !dbg !398
  store i8 %34, ptr %37, align 2, !dbg !399, !tbaa !183
  %38 = or disjoint i32 %26, 1, !dbg !400
    #dbg_value(i32 %26, !168, !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value), !390)
  %39 = uitofp nneg i32 %38 to double, !dbg !393
  %40 = tail call double @llvm.fmuladd.f64(double %39, double 1.500000e+00, double %29), !dbg !394
  %41 = add nuw nsw i32 %26, 231, !dbg !395
  %42 = icmp ult i32 %26, 26, !dbg !395
  %43 = select i1 %42, i32 %38, i32 %41, !dbg !395
  %44 = trunc i32 %43 to i8, !dbg !396
  %45 = add nuw i8 %44, 97, !dbg !396
  %46 = and i32 %38, 15, !dbg !397
  %47 = zext nneg i32 %46 to i64, !dbg !398
  %48 = getelementptr inbounds [16 x i8], ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i64 0, i64 %47, !dbg !398
  store i8 %45, ptr %48, align 1, !dbg !399, !tbaa !183
  %49 = add nuw nsw i32 %26, 2, !dbg !400
    #dbg_value(i32 %49, !168, !DIExpression(), !390)
  %50 = icmp eq i32 %49, 50, !dbg !401
  br i1 %50, label %51, label %25, !dbg !392, !llvm.loop !402

51:                                               ; preds = %25
  store double %40, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), align 8, !dbg !394, !tbaa !133
  %52 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %40, ptr noundef nonnull getelementptr inbounds (i8, ptr @g_foo, i64 16)), !dbg !404
    #dbg_value(i32 0, !190, !DIExpression(), !405)
  %53 = load i32, ptr @g_foo, align 8, !tbaa !122
  %54 = load i64, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), align 8, !tbaa !136
    #dbg_value(i32 0, !190, !DIExpression(), !405)
  %55 = add i32 %53, 19900, !dbg !407
    #dbg_value(i64 undef, !190, !DIExpression(), !405)
  %56 = add i64 %54, 59700, !dbg !407
  store i32 %55, ptr @g_foo, align 8, !dbg !408, !tbaa !122
  store i64 %56, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), align 8, !dbg !409, !tbaa !136
  %57 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %55, i64 noundef %56), !dbg !410
    #dbg_value(i32 0, !202, !DIExpression(), !411)
  %58 = load i32, ptr @g_foo, align 8, !tbaa !122
  %59 = load float, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !tbaa !131
    #dbg_value(i32 0, !202, !DIExpression(), !411)
  br label %60, !dbg !413

60:                                               ; preds = %60, %51
  %61 = phi i32 [ 0, %51 ], [ %73, %60 ]
  %62 = phi float [ %59, %51 ], [ %72, %60 ]
    #dbg_value(i32 %61, !202, !DIExpression(), !411)
  %63 = fadd float %62, 1.000000e+00, !dbg !414
  %64 = fadd float %63, -1.000000e+00, !dbg !415
    #dbg_value(i32 %61, !202, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !411)
  %65 = fadd float %64, 1.000000e+00, !dbg !414
  %66 = fadd float %65, -1.000000e+00, !dbg !415
    #dbg_value(i32 %61, !202, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !411)
  %67 = fadd float %66, 1.000000e+00, !dbg !414
  %68 = fadd float %67, -1.000000e+00, !dbg !415
    #dbg_value(i32 %61, !202, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !411)
  %69 = fadd float %68, 1.000000e+00, !dbg !414
  %70 = fadd float %69, -1.000000e+00, !dbg !415
    #dbg_value(i32 %61, !202, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !411)
  %71 = fadd float %70, 1.000000e+00, !dbg !414
  %72 = fadd float %71, -1.000000e+00, !dbg !415
  %73 = add nuw nsw i32 %61, 5, !dbg !416
    #dbg_value(i32 %73, !202, !DIExpression(), !411)
  %74 = icmp eq i32 %73, 500, !dbg !417
  br i1 %74, label %75, label %60, !dbg !413, !llvm.loop !418

75:                                               ; preds = %60
  store float %72, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !dbg !420, !tbaa !131
  %76 = fpext float %72 to double, !dbg !421
  %77 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, i32 noundef %58, double noundef %76), !dbg !422
    #dbg_assign(i1 undef, !220, !DIExpression(), !372, ptr %1, !DIExpression(), !423)
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %1) #9, !dbg !425
  store i32 10, ptr %1, align 8, !dbg !426, !tbaa !122, !DIAssignID !427
    #dbg_assign(i32 10, !220, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !427, ptr %1, !DIExpression(), !423)
  %78 = getelementptr inbounds i8, ptr %1, i64 4, !dbg !428
  store float 2.000000e+01, ptr %78, align 4, !dbg !429, !tbaa !131, !DIAssignID !430
    #dbg_assign(float 2.000000e+01, !220, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !430, ptr %78, !DIExpression(), !423)
  %79 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !431
  store double 3.000000e+01, ptr %79, align 8, !dbg !432, !tbaa !133, !DIAssignID !433
    #dbg_assign(double 3.000000e+01, !220, !DIExpression(DW_OP_LLVM_fragment, 64, 64), !433, ptr %79, !DIExpression(), !423)
  %80 = getelementptr inbounds i8, ptr %1, i64 16, !dbg !434
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(6) %80, ptr noundef nonnull align 1 dereferenceable(6) @.str.5, i64 6, i1 false) #9, !dbg !435
  %81 = getelementptr inbounds i8, ptr %1, i64 32, !dbg !436
  store i64 99, ptr %81, align 8, !dbg !437, !tbaa !136, !DIAssignID !438
    #dbg_assign(i64 99, !220, !DIExpression(DW_OP_LLVM_fragment, 256, 64), !438, ptr %81, !DIExpression(), !423)
  %82 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef 10, double noundef 2.000000e+01, double noundef 3.000000e+01, ptr noundef nonnull %80, i64 noundef 99), !dbg !439
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %1) #9, !dbg !440
  %83 = call noalias dereferenceable_or_null(40) ptr @malloc(i64 noundef 40) #10, !dbg !441
    #dbg_value(ptr %83, !241, !DIExpression(), !443)
  %84 = icmp eq ptr %83, null, !dbg !444
  br i1 %84, label %91, label %85, !dbg !445

85:                                               ; preds = %75
  store i32 100, ptr %83, align 8, !dbg !446, !tbaa !122
  %86 = getelementptr inbounds i8, ptr %83, i64 4, !dbg !447
  store float 2.000000e+02, ptr %86, align 4, !dbg !448, !tbaa !131
  %87 = getelementptr inbounds i8, ptr %83, i64 8, !dbg !449
  store double 3.000000e+02, ptr %87, align 8, !dbg !450, !tbaa !133
  %88 = getelementptr inbounds i8, ptr %83, i64 16, !dbg !451
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(5) %88, ptr noundef nonnull align 1 dereferenceable(5) @.str.7, i64 5, i1 false) #9, !dbg !452
  %89 = getelementptr inbounds i8, ptr %83, i64 32, !dbg !453
  store i64 999, ptr %89, align 8, !dbg !454, !tbaa !136
  %90 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.8, i32 noundef 100, double noundef 2.000000e+02, double noundef 3.000000e+02, ptr noundef nonnull %88, i64 noundef 999), !dbg !455
  call void @free(ptr noundef nonnull %83) #9, !dbg !456
  br label %91, !dbg !457

91:                                               ; preds = %75, %85
    #dbg_value(i32 1, !272, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !458)
    #dbg_value(i32 2, !272, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !458)
    #dbg_value(i32 3, !272, !DIExpression(DW_OP_LLVM_fragment, 64, 32), !458)
  %92 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, i32 noundef 1, i32 noundef 2, i32 noundef 3), !dbg !460
  store i32 1, ptr @g_outer, align 8, !dbg !461, !tbaa !286
  store i64 100, ptr getelementptr inbounds (i8, ptr @g_outer, i64 24), align 8, !dbg !463, !tbaa !290
    #dbg_value(i32 0, !283, !DIExpression(), !464)
    #dbg_value(i32 0, !283, !DIExpression(), !464)
  br label %93, !dbg !465

93:                                               ; preds = %93, %91
  %94 = phi i32 [ 0, %91 ], [ %106, %93 ]
  %95 = phi float [ 0x40091EB860000000, %91 ], [ %103, %93 ]
  %96 = phi double [ 2.718000e+00, %91 ], [ %105, %93 ]
    #dbg_value(i32 %94, !283, !DIExpression(), !464)
  %97 = uitofp nneg i32 %94 to float, !dbg !466
  %98 = call float @llvm.fmuladd.f32(float %97, float 0x3FB99999A0000000, float %95), !dbg !467
  %99 = uitofp nneg i32 %94 to double, !dbg !468
  %100 = call double @llvm.fmuladd.f64(double %99, double 1.000000e-02, double %96), !dbg !469
  %101 = or disjoint i32 %94, 1, !dbg !470
    #dbg_value(i32 %101, !283, !DIExpression(), !464)
  %102 = uitofp nneg i32 %101 to float, !dbg !466
  %103 = call float @llvm.fmuladd.f32(float %102, float 0x3FB99999A0000000, float %98), !dbg !467
  %104 = uitofp nneg i32 %101 to double, !dbg !468
  %105 = call double @llvm.fmuladd.f64(double %104, double 1.000000e-02, double %100), !dbg !469
  %106 = add nuw nsw i32 %94, 2, !dbg !470
    #dbg_value(i32 %106, !283, !DIExpression(), !464)
  %107 = icmp eq i32 %106, 80, !dbg !471
  br i1 %107, label %108, label %93, !dbg !465, !llvm.loop !472

108:                                              ; preds = %93
  store float %103, ptr getelementptr inbounds (i8, ptr @g_outer, i64 8), align 8, !dbg !467, !tbaa !296
  store double %105, ptr getelementptr inbounds (i8, ptr @g_outer, i64 16), align 8, !dbg !469, !tbaa !298
  %109 = fpext float %103 to double, !dbg !474
  %110 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.10, i32 noundef 1, double noundef %109, double noundef %105, i64 noundef 100), !dbg !475
  store i32 42, ptr @g_witharr, align 8, !dbg !476, !tbaa !315
    #dbg_value(i32 0, !310, !DIExpression(), !478)
    #dbg_value(i64 0, !310, !DIExpression(), !478)
    #dbg_value(i64 1, !310, !DIExpression(), !478)
    #dbg_value(i64 2, !310, !DIExpression(), !478)
    #dbg_value(i64 3, !310, !DIExpression(), !478)
  store <4 x float> <float 0.000000e+00, float 1.000000e+01, float 2.000000e+01, float 3.000000e+01>, ptr getelementptr inbounds (i8, ptr @g_witharr, i64 4), align 4, !dbg !479, !tbaa !321
    #dbg_value(i64 4, !310, !DIExpression(), !478)
    #dbg_value(i32 0, !312, !DIExpression(), !480)
    #dbg_value(i64 0, !312, !DIExpression(), !480)
    #dbg_value(i64 1, !312, !DIExpression(), !480)
    #dbg_value(i64 2, !312, !DIExpression(), !480)
    #dbg_value(i64 3, !312, !DIExpression(), !480)
    #dbg_value(i64 4, !312, !DIExpression(), !480)
  store double 6.000000e+01, ptr getelementptr inbounds (i8, ptr @g_witharr, i64 24), align 8, !dbg !481, !tbaa !326
  %111 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, i32 noundef 42, double noundef 0.000000e+00, double noundef 6.000000e+01), !dbg !482
  call void @struct_array_access(), !dbg !483
    #dbg_value(ptr poison, !352, !DIExpression(), !484)
  %112 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.13, i32 noundef 2, double noundef 1.000000e+00, double noundef 2.000000e+00, i64 noundef 50), !dbg !486
    #dbg_value(ptr poison, !358, !DIExpression(), !487)
    #dbg_value(i64 0, !361, !DIExpression(), !489)
  %113 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 0, i32 noundef 0, i64 noundef 0), !dbg !490
    #dbg_value(i64 1, !361, !DIExpression(), !489)
  %114 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 1, i32 noundef 1, i64 noundef 7), !dbg !490
    #dbg_value(i64 2, !361, !DIExpression(), !489)
  %115 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 2, i32 noundef 2, i64 noundef 14), !dbg !490
    #dbg_value(i64 3, !361, !DIExpression(), !489)
  %116 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 3, i32 noundef 3, i64 noundef 21), !dbg !490
    #dbg_value(i64 4, !361, !DIExpression(), !489)
  %117 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 4, i32 noundef 4, i64 noundef 28), !dbg !490
    #dbg_value(i64 5, !361, !DIExpression(), !489)
  ret i32 0, !dbg !491
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #8

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { nounwind }
attributes #10 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!110, !111, !112, !113, !114, !115, !116}
!llvm.ident = !{!117}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g_foo", scope: !2, file: !3, line: 36, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang f2a8ee9ab114d73e48028497f044f30306ca08ea)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !31, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "test_struct.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test", checksumkind: CSK_MD5, checksum: "5ee496b328a0db06ba1f18db92463ec6")
!4 = !{!5, !6, !7, !8, !21}
!5 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Foo", file: !3, line: 5, size: 320, elements: !10)
!10 = !{!11, !13, !14, !15, !20}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !9, file: !3, line: 6, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !9, file: !3, line: 7, baseType: !5, size: 32, offset: 32)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !9, file: !3, line: 8, baseType: !6, size: 64, offset: 64)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "d", scope: !9, file: !3, line: 9, baseType: !16, size: 128, offset: 128)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 128, elements: !18)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !{!19}
!19 = !DISubrange(count: 16)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !9, file: !3, line: 10, baseType: !7, size: 64, offset: 256)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Outer", file: !3, line: 24, size: 256, elements: !23)
!23 = !{!24, !25, !30}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "tag", scope: !22, file: !3, line: 25, baseType: !12, size: 32)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "inner", scope: !22, file: !3, line: 26, baseType: !26, size: 128, offset: 64)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Inner", file: !3, line: 19, size: 128, elements: !27)
!27 = !{!28, !29}
!28 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !26, file: !3, line: 20, baseType: !5, size: 32)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !26, file: !3, line: 21, baseType: !6, size: 64, offset: 64)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "extra", scope: !22, file: !3, line: 27, baseType: !7, size: 64, offset: 192)
!31 = !{!32, !37, !42, !44, !49, !51, !53, !58, !63, !68, !73, !78, !80, !85, !90, !0, !95, !97, !107}
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(scope: null, file: !3, line: 45, type: !34, isLocal: true, isDefinition: true)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 48, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 6)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(scope: null, file: !3, line: 56, type: !39, isLocal: true, isDefinition: true)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 88, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 11)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(scope: null, file: !3, line: 64, type: !39, isLocal: true, isDefinition: true)
!44 = !DIGlobalVariableExpression(var: !45, expr: !DIExpression())
!45 = distinct !DIGlobalVariable(scope: null, file: !3, line: 72, type: !46, isLocal: true, isDefinition: true)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 96, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 12)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression())
!50 = distinct !DIGlobalVariable(scope: null, file: !3, line: 82, type: !46, isLocal: true, isDefinition: true)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(scope: null, file: !3, line: 90, type: !34, isLocal: true, isDefinition: true)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(scope: null, file: !3, line: 92, type: !55, isLocal: true, isDefinition: true)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 192, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 24)
!58 = !DIGlobalVariableExpression(var: !59, expr: !DIExpression())
!59 = distinct !DIGlobalVariable(scope: null, file: !3, line: 101, type: !60, isLocal: true, isDefinition: true)
!60 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 40, elements: !61)
!61 = !{!62}
!62 = !DISubrange(count: 5)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression())
!64 = distinct !DIGlobalVariable(scope: null, file: !3, line: 103, type: !65, isLocal: true, isDefinition: true)
!65 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 184, elements: !66)
!66 = !{!67}
!67 = !DISubrange(count: 23)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(scope: null, file: !3, line: 112, type: !70, isLocal: true, isDefinition: true)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 120, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 15)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(scope: null, file: !3, line: 124, type: !75, isLocal: true, isDefinition: true)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 176, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 22)
!78 = !DIGlobalVariableExpression(var: !79, expr: !DIExpression())
!79 = distinct !DIGlobalVariable(scope: null, file: !3, line: 136, type: !65, isLocal: true, isDefinition: true)
!80 = !DIGlobalVariableExpression(var: !81, expr: !DIExpression())
!81 = distinct !DIGlobalVariable(scope: null, file: !3, line: 146, type: !82, isLocal: true, isDefinition: true)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 160, elements: !83)
!83 = !{!84}
!84 = !DISubrange(count: 20)
!85 = !DIGlobalVariableExpression(var: !86, expr: !DIExpression())
!86 = distinct !DIGlobalVariable(scope: null, file: !3, line: 157, type: !87, isLocal: true, isDefinition: true)
!87 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 216, elements: !88)
!88 = !{!89}
!89 = !DISubrange(count: 27)
!90 = !DIGlobalVariableExpression(var: !91, expr: !DIExpression())
!91 = distinct !DIGlobalVariable(scope: null, file: !3, line: 169, type: !92, isLocal: true, isDefinition: true)
!92 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 144, elements: !93)
!93 = !{!94}
!94 = !DISubrange(count: 18)
!95 = !DIGlobalVariableExpression(var: !96, expr: !DIExpression())
!96 = distinct !DIGlobalVariable(name: "g_outer", scope: !2, file: !3, line: 37, type: !22, isLocal: false, isDefinition: true)
!97 = !DIGlobalVariableExpression(var: !98, expr: !DIExpression())
!98 = distinct !DIGlobalVariable(name: "g_witharr", scope: !2, file: !3, line: 38, type: !99, isLocal: false, isDefinition: true)
!99 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "WithArray", file: !3, line: 30, size: 256, elements: !100)
!100 = !{!101, !102, !106}
!101 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !99, file: !3, line: 31, baseType: !12, size: 32)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "scores", scope: !99, file: !3, line: 32, baseType: !103, size: 128, offset: 32)
!103 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 128, elements: !104)
!104 = !{!105}
!105 = !DISubrange(count: 4)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "total", scope: !99, file: !3, line: 33, baseType: !6, size: 64, offset: 192)
!107 = !DIGlobalVariableExpression(var: !108, expr: !DIExpression())
!108 = distinct !DIGlobalVariable(name: "g_arr", scope: !2, file: !3, line: 39, type: !109, isLocal: false, isDefinition: true)
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 1600, elements: !61)
!110 = !{i32 7, !"Dwarf Version", i32 5}
!111 = !{i32 2, !"Debug Info Version", i32 3}
!112 = !{i32 1, !"wchar_size", i32 4}
!113 = !{i32 8, !"PIC Level", i32 2}
!114 = !{i32 7, !"PIE Level", i32 2}
!115 = !{i32 7, !"uwtable", i32 2}
!116 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!117 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang f2a8ee9ab114d73e48028497f044f30306ca08ea)"}
!118 = distinct !DISubprogram(name: "init_global", scope: !3, file: !3, line: 41, type: !119, scopeLine: 41, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!119 = !DISubroutineType(types: !120)
!120 = !{null}
!121 = !DILocation(line: 42, column: 13, scope: !118)
!122 = !{!123, !124, i64 0}
!123 = !{!"Foo", !124, i64 0, !127, i64 4, !128, i64 8, !125, i64 16, !129, i64 32}
!124 = !{!"int", !125, i64 0}
!125 = !{!"omnipotent char", !126, i64 0}
!126 = !{!"Simple C/C++ TBAA"}
!127 = !{!"float", !125, i64 0}
!128 = !{!"double", !125, i64 0}
!129 = !{!"long", !125, i64 0}
!130 = !DILocation(line: 43, column: 13, scope: !118)
!131 = !{!123, !127, i64 4}
!132 = !DILocation(line: 44, column: 13, scope: !118)
!133 = !{!123, !128, i64 8}
!134 = !DILocation(line: 45, column: 5, scope: !118)
!135 = !DILocation(line: 46, column: 13, scope: !118)
!136 = !{!123, !129, i64 32}
!137 = !DILocation(line: 47, column: 1, scope: !118)
!138 = distinct !DISubprogram(name: "access_global_ab", scope: !3, file: !3, line: 49, type: !119, scopeLine: 49, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !139)
!139 = !{!140, !141}
!140 = !DILocalVariable(name: "sum", scope: !138, file: !3, line: 50, type: !12)
!141 = !DILocalVariable(name: "i", scope: !142, file: !3, line: 51, type: !12)
!142 = distinct !DILexicalBlock(scope: !138, file: !3, line: 51, column: 5)
!143 = !DILocation(line: 0, scope: !138)
!144 = !DILocation(line: 0, scope: !142)
!145 = !DILocation(line: 51, column: 5, scope: !142)
!146 = !DILocation(line: 52, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !148, file: !3, line: 51, column: 35)
!148 = distinct !DILexicalBlock(scope: !142, file: !3, line: 51, column: 5)
!149 = !DILocation(line: 53, column: 17, scope: !147)
!150 = !DILocation(line: 56, column: 36, scope: !138)
!151 = !DILocation(line: 56, column: 5, scope: !138)
!152 = !DILocation(line: 57, column: 1, scope: !138)
!153 = !DILocation(line: 53, column: 20, scope: !147)
!154 = !DILocation(line: 51, column: 31, scope: !148)
!155 = !DILocation(line: 51, column: 23, scope: !148)
!156 = distinct !{!156, !145, !157, !158}
!157 = !DILocation(line: 55, column: 5, scope: !142)
!158 = !{!"llvm.loop.mustprogress"}
!159 = !DISubprogram(name: "printf", scope: !160, file: !160, line: 356, type: !161, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!160 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!161 = !DISubroutineType(types: !162)
!162 = !{!12, !163, null}
!163 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !164)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!166 = distinct !DISubprogram(name: "access_global_cd", scope: !3, file: !3, line: 59, type: !119, scopeLine: 59, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !167)
!167 = !{!168}
!168 = !DILocalVariable(name: "i", scope: !169, file: !3, line: 60, type: !12)
!169 = distinct !DILexicalBlock(scope: !166, file: !3, line: 60, column: 5)
!170 = !DILocation(line: 0, scope: !169)
!171 = !DILocation(line: 60, column: 5, scope: !169)
!172 = !DILocation(line: 61, column: 17, scope: !173)
!173 = distinct !DILexicalBlock(scope: !174, file: !3, line: 60, column: 34)
!174 = distinct !DILexicalBlock(scope: !169, file: !3, line: 60, column: 5)
!175 = !DILocation(line: 64, column: 5, scope: !166)
!176 = !DILocation(line: 65, column: 1, scope: !166)
!177 = !DILocation(line: 61, column: 20, scope: !173)
!178 = !DILocation(line: 62, column: 36, scope: !173)
!179 = !DILocation(line: 62, column: 27, scope: !173)
!180 = !DILocation(line: 62, column: 19, scope: !173)
!181 = !DILocation(line: 62, column: 9, scope: !173)
!182 = !DILocation(line: 62, column: 25, scope: !173)
!183 = !{!125, !125, i64 0}
!184 = !DILocation(line: 60, column: 30, scope: !174)
!185 = !DILocation(line: 60, column: 23, scope: !174)
!186 = distinct !{!186, !171, !187, !158}
!187 = !DILocation(line: 63, column: 5, scope: !169)
!188 = distinct !DISubprogram(name: "access_global_ae", scope: !3, file: !3, line: 67, type: !119, scopeLine: 67, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !189)
!189 = !{!190}
!190 = !DILocalVariable(name: "i", scope: !191, file: !3, line: 68, type: !12)
!191 = distinct !DILexicalBlock(scope: !188, file: !3, line: 68, column: 5)
!192 = !DILocation(line: 0, scope: !191)
!193 = !DILocation(line: 68, column: 5, scope: !191)
!194 = !DILocation(line: 69, column: 17, scope: !195)
!195 = distinct !DILexicalBlock(scope: !196, file: !3, line: 68, column: 35)
!196 = distinct !DILexicalBlock(scope: !191, file: !3, line: 68, column: 5)
!197 = !DILocation(line: 70, column: 17, scope: !195)
!198 = !DILocation(line: 72, column: 5, scope: !188)
!199 = !DILocation(line: 73, column: 1, scope: !188)
!200 = distinct !DISubprogram(name: "hot_alternate_fields", scope: !3, file: !3, line: 75, type: !119, scopeLine: 75, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !201)
!201 = !{!202}
!202 = !DILocalVariable(name: "i", scope: !203, file: !3, line: 76, type: !12)
!203 = distinct !DILexicalBlock(scope: !200, file: !3, line: 76, column: 5)
!204 = !DILocation(line: 0, scope: !203)
!205 = !DILocation(line: 76, column: 5, scope: !203)
!206 = !DILocation(line: 0, scope: !207)
!207 = distinct !DILexicalBlock(scope: !208, file: !3, line: 76, column: 35)
!208 = distinct !DILexicalBlock(scope: !203, file: !3, line: 76, column: 5)
!209 = !DILocation(line: 82, column: 37, scope: !200)
!210 = !DILocation(line: 82, column: 5, scope: !200)
!211 = !DILocation(line: 83, column: 1, scope: !200)
!212 = !DILocation(line: 78, column: 17, scope: !207)
!213 = !DILocation(line: 80, column: 17, scope: !207)
!214 = !DILocation(line: 76, column: 31, scope: !208)
!215 = !DILocation(line: 76, column: 23, scope: !208)
!216 = distinct !{!216, !205, !217, !158}
!217 = !DILocation(line: 81, column: 5, scope: !203)
!218 = distinct !DISubprogram(name: "stack_struct", scope: !3, file: !3, line: 85, type: !119, scopeLine: 85, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !219)
!219 = !{!220}
!220 = !DILocalVariable(name: "local", scope: !218, file: !3, line: 86, type: !9)
!221 = distinct !DIAssignID()
!222 = !DILocation(line: 0, scope: !218)
!223 = !DILocation(line: 86, column: 5, scope: !218)
!224 = !DILocation(line: 87, column: 13, scope: !218)
!225 = distinct !DIAssignID()
!226 = !DILocation(line: 88, column: 11, scope: !218)
!227 = !DILocation(line: 88, column: 13, scope: !218)
!228 = distinct !DIAssignID()
!229 = !DILocation(line: 89, column: 11, scope: !218)
!230 = !DILocation(line: 89, column: 13, scope: !218)
!231 = distinct !DIAssignID()
!232 = !DILocation(line: 90, column: 18, scope: !218)
!233 = !DILocation(line: 90, column: 5, scope: !218)
!234 = !DILocation(line: 91, column: 11, scope: !218)
!235 = !DILocation(line: 91, column: 13, scope: !218)
!236 = distinct !DIAssignID()
!237 = !DILocation(line: 92, column: 5, scope: !218)
!238 = !DILocation(line: 93, column: 1, scope: !218)
!239 = distinct !DISubprogram(name: "heap_struct", scope: !3, file: !3, line: 95, type: !119, scopeLine: 95, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !240)
!240 = !{!241}
!241 = !DILocalVariable(name: "hp", scope: !239, file: !3, line: 96, type: !8)
!242 = !DILocation(line: 96, column: 36, scope: !239)
!243 = !DILocation(line: 0, scope: !239)
!244 = !DILocation(line: 97, column: 10, scope: !245)
!245 = distinct !DILexicalBlock(scope: !239, file: !3, line: 97, column: 9)
!246 = !DILocation(line: 97, column: 9, scope: !239)
!247 = !DILocation(line: 98, column: 11, scope: !239)
!248 = !DILocation(line: 99, column: 9, scope: !239)
!249 = !DILocation(line: 99, column: 11, scope: !239)
!250 = !DILocation(line: 100, column: 9, scope: !239)
!251 = !DILocation(line: 100, column: 11, scope: !239)
!252 = !DILocation(line: 101, column: 16, scope: !239)
!253 = !DILocation(line: 101, column: 5, scope: !239)
!254 = !DILocation(line: 102, column: 9, scope: !239)
!255 = !DILocation(line: 102, column: 11, scope: !239)
!256 = !DILocation(line: 103, column: 5, scope: !239)
!257 = !DILocation(line: 104, column: 5, scope: !239)
!258 = !DILocation(line: 105, column: 1, scope: !239)
!259 = !DISubprogram(name: "malloc", scope: !260, file: !260, line: 540, type: !261, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!260 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!261 = !DISubroutineType(types: !262)
!262 = !{!263, !264}
!263 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!264 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !265, line: 18, baseType: !266)
!265 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!266 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!267 = !DISubprogram(name: "free", scope: !260, file: !260, line: 555, type: !268, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!268 = !DISubroutineType(types: !269)
!269 = !{null, !263}
!270 = distinct !DISubprogram(name: "bar_access", scope: !3, file: !3, line: 107, type: !119, scopeLine: 107, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !271)
!271 = !{!272}
!272 = !DILocalVariable(name: "bar", scope: !270, file: !3, line: 108, type: !273)
!273 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Bar", file: !3, line: 13, size: 96, elements: !274)
!274 = !{!275, !276, !277}
!275 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !273, file: !3, line: 14, baseType: !12, size: 32)
!276 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !273, file: !3, line: 15, baseType: !12, size: 32, offset: 32)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !273, file: !3, line: 16, baseType: !12, size: 32, offset: 64)
!278 = !DILocation(line: 0, scope: !270)
!279 = !DILocation(line: 112, column: 5, scope: !270)
!280 = !DILocation(line: 113, column: 1, scope: !270)
!281 = distinct !DISubprogram(name: "nested_struct_access", scope: !3, file: !3, line: 115, type: !119, scopeLine: 115, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !282)
!282 = !{!283}
!283 = !DILocalVariable(name: "i", scope: !284, file: !3, line: 120, type: !12)
!284 = distinct !DILexicalBlock(scope: !281, file: !3, line: 120, column: 5)
!285 = !DILocation(line: 116, column: 17, scope: !281)
!286 = !{!287, !124, i64 0}
!287 = !{!"Outer", !124, i64 0, !288, i64 8, !129, i64 24}
!288 = !{!"Inner", !127, i64 0, !128, i64 8}
!289 = !DILocation(line: 119, column: 19, scope: !281)
!290 = !{!287, !129, i64 24}
!291 = !DILocation(line: 0, scope: !284)
!292 = !DILocation(line: 120, column: 5, scope: !284)
!293 = !DILocation(line: 121, column: 25, scope: !294)
!294 = distinct !DILexicalBlock(scope: !295, file: !3, line: 120, column: 34)
!295 = distinct !DILexicalBlock(scope: !284, file: !3, line: 120, column: 5)
!296 = !{!287, !127, i64 8}
!297 = !DILocation(line: 122, column: 25, scope: !294)
!298 = !{!287, !128, i64 16}
!299 = !DILocation(line: 124, column: 51, scope: !281)
!300 = !DILocation(line: 124, column: 5, scope: !281)
!301 = !DILocation(line: 125, column: 1, scope: !281)
!302 = !DILocation(line: 121, column: 28, scope: !294)
!303 = !DILocation(line: 122, column: 28, scope: !294)
!304 = !DILocation(line: 120, column: 30, scope: !295)
!305 = !DILocation(line: 120, column: 23, scope: !295)
!306 = distinct !{!306, !292, !307, !158}
!307 = !DILocation(line: 123, column: 5, scope: !284)
!308 = distinct !DISubprogram(name: "array_field_access", scope: !3, file: !3, line: 127, type: !119, scopeLine: 127, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !309)
!309 = !{!310, !312}
!310 = !DILocalVariable(name: "i", scope: !311, file: !3, line: 129, type: !12)
!311 = distinct !DILexicalBlock(scope: !308, file: !3, line: 129, column: 5)
!312 = !DILocalVariable(name: "i", scope: !313, file: !3, line: 133, type: !12)
!313 = distinct !DILexicalBlock(scope: !308, file: !3, line: 133, column: 5)
!314 = !DILocation(line: 128, column: 18, scope: !308)
!315 = !{!316, !124, i64 0}
!316 = !{!"WithArray", !124, i64 0, !125, i64 4, !128, i64 24}
!317 = !DILocation(line: 0, scope: !311)
!318 = !DILocation(line: 130, column: 29, scope: !319)
!319 = distinct !DILexicalBlock(scope: !320, file: !3, line: 129, column: 33)
!320 = distinct !DILexicalBlock(scope: !311, file: !3, line: 129, column: 5)
!321 = !{!127, !127, i64 0}
!322 = !DILocation(line: 0, scope: !313)
!323 = !DILocation(line: 134, column: 25, scope: !324)
!324 = distinct !DILexicalBlock(scope: !325, file: !3, line: 133, column: 33)
!325 = distinct !DILexicalBlock(scope: !313, file: !3, line: 133, column: 5)
!326 = !{!316, !128, i64 24}
!327 = !DILocation(line: 136, column: 5, scope: !308)
!328 = !DILocation(line: 137, column: 1, scope: !308)
!329 = distinct !DISubprogram(name: "struct_array_access", scope: !3, file: !3, line: 139, type: !119, scopeLine: 139, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !330)
!330 = !{!331, !333}
!331 = !DILocalVariable(name: "i", scope: !332, file: !3, line: 140, type: !12)
!332 = distinct !DILexicalBlock(scope: !329, file: !3, line: 140, column: 5)
!333 = !DILocalVariable(name: "i", scope: !334, file: !3, line: 145, type: !12)
!334 = distinct !DILexicalBlock(scope: !329, file: !3, line: 145, column: 5)
!335 = !DILocation(line: 0, scope: !332)
!336 = !DILocation(line: 141, column: 20, scope: !337)
!337 = distinct !DILexicalBlock(scope: !338, file: !3, line: 140, column: 33)
!338 = distinct !DILexicalBlock(scope: !332, file: !3, line: 140, column: 5)
!339 = !DILocation(line: 142, column: 20, scope: !337)
!340 = !DILocation(line: 143, column: 20, scope: !337)
!341 = !DILocation(line: 0, scope: !334)
!342 = !DILocation(line: 146, column: 9, scope: !343)
!343 = distinct !DILexicalBlock(scope: !344, file: !3, line: 145, column: 33)
!344 = distinct !DILexicalBlock(scope: !334, file: !3, line: 145, column: 5)
!345 = !DILocation(line: 146, column: 52, scope: !343)
!346 = !DILocation(line: 146, column: 64, scope: !343)
!347 = !DILocation(line: 146, column: 55, scope: !343)
!348 = !DILocation(line: 146, column: 76, scope: !343)
!349 = !DILocation(line: 148, column: 1, scope: !329)
!350 = distinct !DISubprogram(name: "heap_nested_struct", scope: !3, file: !3, line: 150, type: !119, scopeLine: 150, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !351)
!351 = !{!352}
!352 = !DILocalVariable(name: "op", scope: !350, file: !3, line: 151, type: !21)
!353 = !DILocation(line: 0, scope: !350)
!354 = !DILocation(line: 157, column: 5, scope: !350)
!355 = !DILocation(line: 159, column: 1, scope: !350)
!356 = distinct !DISubprogram(name: "heap_struct_array", scope: !3, file: !3, line: 161, type: !119, scopeLine: 161, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !357)
!357 = !{!358, !359, !361}
!358 = !DILocalVariable(name: "arr", scope: !356, file: !3, line: 162, type: !8)
!359 = !DILocalVariable(name: "i", scope: !360, file: !3, line: 164, type: !12)
!360 = distinct !DILexicalBlock(scope: !356, file: !3, line: 164, column: 5)
!361 = !DILocalVariable(name: "i", scope: !362, file: !3, line: 168, type: !12)
!362 = distinct !DILexicalBlock(scope: !356, file: !3, line: 168, column: 5)
!363 = !DILocation(line: 0, scope: !356)
!364 = !DILocation(line: 0, scope: !362)
!365 = !DILocation(line: 169, column: 9, scope: !366)
!366 = distinct !DILexicalBlock(scope: !367, file: !3, line: 168, column: 33)
!367 = distinct !DILexicalBlock(scope: !362, file: !3, line: 168, column: 5)
!368 = !DILocation(line: 172, column: 1, scope: !356)
!369 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 174, type: !370, scopeLine: 174, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!370 = !DISubroutineType(types: !371)
!371 = !{!12}
!372 = distinct !DIAssignID()
!373 = !DILocation(line: 44, column: 13, scope: !118, inlinedAt: !374)
!374 = distinct !DILocation(line: 175, column: 5, scope: !369)
!375 = !DILocation(line: 45, column: 5, scope: !118, inlinedAt: !374)
!376 = !DILocation(line: 46, column: 13, scope: !118, inlinedAt: !374)
!377 = !DILocation(line: 0, scope: !138, inlinedAt: !378)
!378 = distinct !DILocation(line: 176, column: 5, scope: !369)
!379 = !DILocation(line: 0, scope: !142, inlinedAt: !378)
!380 = !DILocation(line: 51, column: 5, scope: !142, inlinedAt: !378)
!381 = !DILocation(line: 53, column: 20, scope: !147, inlinedAt: !378)
!382 = !DILocation(line: 53, column: 17, scope: !147, inlinedAt: !378)
!383 = !DILocation(line: 51, column: 31, scope: !148, inlinedAt: !378)
!384 = !DILocation(line: 51, column: 23, scope: !148, inlinedAt: !378)
!385 = distinct !{!385, !380, !386, !158}
!386 = !DILocation(line: 55, column: 5, scope: !142, inlinedAt: !378)
!387 = !DILocation(line: 52, column: 17, scope: !147, inlinedAt: !378)
!388 = !DILocation(line: 56, column: 36, scope: !138, inlinedAt: !378)
!389 = !DILocation(line: 56, column: 5, scope: !138, inlinedAt: !378)
!390 = !DILocation(line: 0, scope: !169, inlinedAt: !391)
!391 = distinct !DILocation(line: 177, column: 5, scope: !369)
!392 = !DILocation(line: 60, column: 5, scope: !169, inlinedAt: !391)
!393 = !DILocation(line: 61, column: 20, scope: !173, inlinedAt: !391)
!394 = !DILocation(line: 61, column: 17, scope: !173, inlinedAt: !391)
!395 = !DILocation(line: 62, column: 36, scope: !173, inlinedAt: !391)
!396 = !DILocation(line: 62, column: 27, scope: !173, inlinedAt: !391)
!397 = !DILocation(line: 62, column: 19, scope: !173, inlinedAt: !391)
!398 = !DILocation(line: 62, column: 9, scope: !173, inlinedAt: !391)
!399 = !DILocation(line: 62, column: 25, scope: !173, inlinedAt: !391)
!400 = !DILocation(line: 60, column: 30, scope: !174, inlinedAt: !391)
!401 = !DILocation(line: 60, column: 23, scope: !174, inlinedAt: !391)
!402 = distinct !{!402, !392, !403, !158}
!403 = !DILocation(line: 63, column: 5, scope: !169, inlinedAt: !391)
!404 = !DILocation(line: 64, column: 5, scope: !166, inlinedAt: !391)
!405 = !DILocation(line: 0, scope: !191, inlinedAt: !406)
!406 = distinct !DILocation(line: 178, column: 5, scope: !369)
!407 = !DILocation(line: 68, column: 5, scope: !191, inlinedAt: !406)
!408 = !DILocation(line: 69, column: 17, scope: !195, inlinedAt: !406)
!409 = !DILocation(line: 70, column: 17, scope: !195, inlinedAt: !406)
!410 = !DILocation(line: 72, column: 5, scope: !188, inlinedAt: !406)
!411 = !DILocation(line: 0, scope: !203, inlinedAt: !412)
!412 = distinct !DILocation(line: 179, column: 5, scope: !369)
!413 = !DILocation(line: 76, column: 5, scope: !203, inlinedAt: !412)
!414 = !DILocation(line: 78, column: 17, scope: !207, inlinedAt: !412)
!415 = !DILocation(line: 80, column: 17, scope: !207, inlinedAt: !412)
!416 = !DILocation(line: 76, column: 31, scope: !208, inlinedAt: !412)
!417 = !DILocation(line: 76, column: 23, scope: !208, inlinedAt: !412)
!418 = distinct !{!418, !413, !419, !158}
!419 = !DILocation(line: 81, column: 5, scope: !203, inlinedAt: !412)
!420 = !DILocation(line: 0, scope: !207, inlinedAt: !412)
!421 = !DILocation(line: 82, column: 37, scope: !200, inlinedAt: !412)
!422 = !DILocation(line: 82, column: 5, scope: !200, inlinedAt: !412)
!423 = !DILocation(line: 0, scope: !218, inlinedAt: !424)
!424 = distinct !DILocation(line: 180, column: 5, scope: !369)
!425 = !DILocation(line: 86, column: 5, scope: !218, inlinedAt: !424)
!426 = !DILocation(line: 87, column: 13, scope: !218, inlinedAt: !424)
!427 = distinct !DIAssignID()
!428 = !DILocation(line: 88, column: 11, scope: !218, inlinedAt: !424)
!429 = !DILocation(line: 88, column: 13, scope: !218, inlinedAt: !424)
!430 = distinct !DIAssignID()
!431 = !DILocation(line: 89, column: 11, scope: !218, inlinedAt: !424)
!432 = !DILocation(line: 89, column: 13, scope: !218, inlinedAt: !424)
!433 = distinct !DIAssignID()
!434 = !DILocation(line: 90, column: 18, scope: !218, inlinedAt: !424)
!435 = !DILocation(line: 90, column: 5, scope: !218, inlinedAt: !424)
!436 = !DILocation(line: 91, column: 11, scope: !218, inlinedAt: !424)
!437 = !DILocation(line: 91, column: 13, scope: !218, inlinedAt: !424)
!438 = distinct !DIAssignID()
!439 = !DILocation(line: 92, column: 5, scope: !218, inlinedAt: !424)
!440 = !DILocation(line: 93, column: 1, scope: !218, inlinedAt: !424)
!441 = !DILocation(line: 96, column: 36, scope: !239, inlinedAt: !442)
!442 = distinct !DILocation(line: 181, column: 5, scope: !369)
!443 = !DILocation(line: 0, scope: !239, inlinedAt: !442)
!444 = !DILocation(line: 97, column: 10, scope: !245, inlinedAt: !442)
!445 = !DILocation(line: 97, column: 9, scope: !239, inlinedAt: !442)
!446 = !DILocation(line: 98, column: 11, scope: !239, inlinedAt: !442)
!447 = !DILocation(line: 99, column: 9, scope: !239, inlinedAt: !442)
!448 = !DILocation(line: 99, column: 11, scope: !239, inlinedAt: !442)
!449 = !DILocation(line: 100, column: 9, scope: !239, inlinedAt: !442)
!450 = !DILocation(line: 100, column: 11, scope: !239, inlinedAt: !442)
!451 = !DILocation(line: 101, column: 16, scope: !239, inlinedAt: !442)
!452 = !DILocation(line: 101, column: 5, scope: !239, inlinedAt: !442)
!453 = !DILocation(line: 102, column: 9, scope: !239, inlinedAt: !442)
!454 = !DILocation(line: 102, column: 11, scope: !239, inlinedAt: !442)
!455 = !DILocation(line: 103, column: 5, scope: !239, inlinedAt: !442)
!456 = !DILocation(line: 104, column: 5, scope: !239, inlinedAt: !442)
!457 = !DILocation(line: 105, column: 1, scope: !239, inlinedAt: !442)
!458 = !DILocation(line: 0, scope: !270, inlinedAt: !459)
!459 = distinct !DILocation(line: 182, column: 5, scope: !369)
!460 = !DILocation(line: 112, column: 5, scope: !270, inlinedAt: !459)
!461 = !DILocation(line: 116, column: 17, scope: !281, inlinedAt: !462)
!462 = distinct !DILocation(line: 183, column: 5, scope: !369)
!463 = !DILocation(line: 119, column: 19, scope: !281, inlinedAt: !462)
!464 = !DILocation(line: 0, scope: !284, inlinedAt: !462)
!465 = !DILocation(line: 120, column: 5, scope: !284, inlinedAt: !462)
!466 = !DILocation(line: 121, column: 28, scope: !294, inlinedAt: !462)
!467 = !DILocation(line: 121, column: 25, scope: !294, inlinedAt: !462)
!468 = !DILocation(line: 122, column: 28, scope: !294, inlinedAt: !462)
!469 = !DILocation(line: 122, column: 25, scope: !294, inlinedAt: !462)
!470 = !DILocation(line: 120, column: 30, scope: !295, inlinedAt: !462)
!471 = !DILocation(line: 120, column: 23, scope: !295, inlinedAt: !462)
!472 = distinct !{!472, !465, !473, !158}
!473 = !DILocation(line: 123, column: 5, scope: !284, inlinedAt: !462)
!474 = !DILocation(line: 124, column: 51, scope: !281, inlinedAt: !462)
!475 = !DILocation(line: 124, column: 5, scope: !281, inlinedAt: !462)
!476 = !DILocation(line: 128, column: 18, scope: !308, inlinedAt: !477)
!477 = distinct !DILocation(line: 184, column: 5, scope: !369)
!478 = !DILocation(line: 0, scope: !311, inlinedAt: !477)
!479 = !DILocation(line: 130, column: 29, scope: !319, inlinedAt: !477)
!480 = !DILocation(line: 0, scope: !313, inlinedAt: !477)
!481 = !DILocation(line: 134, column: 25, scope: !324, inlinedAt: !477)
!482 = !DILocation(line: 136, column: 5, scope: !308, inlinedAt: !477)
!483 = !DILocation(line: 185, column: 5, scope: !369)
!484 = !DILocation(line: 0, scope: !350, inlinedAt: !485)
!485 = distinct !DILocation(line: 186, column: 5, scope: !369)
!486 = !DILocation(line: 157, column: 5, scope: !350, inlinedAt: !485)
!487 = !DILocation(line: 0, scope: !356, inlinedAt: !488)
!488 = distinct !DILocation(line: 187, column: 5, scope: !369)
!489 = !DILocation(line: 0, scope: !362, inlinedAt: !488)
!490 = !DILocation(line: 169, column: 9, scope: !366, inlinedAt: !488)
!491 = !DILocation(line: 188, column: 5, scope: !369)
