; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_structs/src/test_struct.c'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_structs/src/test_struct.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Foo = type { i32, float, double, [16 x i8], i64 }
%struct.Outer = type { i32, %struct.Inner, i64 }
%struct.Inner = type { float, double }
%struct.WithArray = type { i32, [4 x float], double }

@g_foo = dso_local global %struct.Foo zeroinitializer, align 8, !dbg !0
@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1, !dbg !33
@.str.1 = private unnamed_addr constant [11 x i8] c"ab: %d %f\0A\00", align 1, !dbg !38
@.str.2 = private unnamed_addr constant [11 x i8] c"cd: %f %s\0A\00", align 1, !dbg !43
@.str.3 = private unnamed_addr constant [12 x i8] c"ae: %d %ld\0A\00", align 1, !dbg !45
@.str.4 = private unnamed_addr constant [12 x i8] c"hot: %d %f\0A\00", align 1, !dbg !50
@.str.5 = private unnamed_addr constant [6 x i8] c"local\00", align 1, !dbg !52
@.str.6 = private unnamed_addr constant [24 x i8] c"stack: %d %f %f %s %ld\0A\00", align 1, !dbg !54
@.str.7 = private unnamed_addr constant [5 x i8] c"heap\00", align 1, !dbg !59
@.str.8 = private unnamed_addr constant [23 x i8] c"heap: %d %f %f %s %ld\0A\00", align 1, !dbg !64
@.str.9 = private unnamed_addr constant [15 x i8] c"bar: %d %d %d\0A\00", align 1, !dbg !69
@g_outer = dso_local local_unnamed_addr global %struct.Outer zeroinitializer, align 8, !dbg !96
@.str.10 = private unnamed_addr constant [22 x i8] c"nested: %d %f %f %ld\0A\00", align 1, !dbg !74
@g_witharr = dso_local local_unnamed_addr global %struct.WithArray zeroinitializer, align 8, !dbg !98
@.str.11 = private unnamed_addr constant [23 x i8] c"array_field: %d %f %f\0A\00", align 1, !dbg !79
@g_arr = dso_local local_unnamed_addr global [5 x %struct.Foo] zeroinitializer, align 16, !dbg !108
@.str.12 = private unnamed_addr constant [20 x i8] c"arr[%d]: %d %f %ld\0A\00", align 1, !dbg !81
@.str.13 = private unnamed_addr constant [27 x i8] c"heap_nested: %d %f %f %ld\0A\00", align 1, !dbg !86
@.str.14 = private unnamed_addr constant [18 x i8] c"harr[%d]: %d %ld\0A\00", align 1, !dbg !91

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, argmem: none, inaccessiblemem: none) uwtable
define dso_local void @init_global() local_unnamed_addr #0 !dbg !119 {
  call void @__record_field_access_full(i32 0, ptr @g_foo, i32 1), !dbg !122
  store i32 1, ptr @g_foo, align 8, !dbg !122, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), i32 1), !dbg !131
  store float 2.000000e+00, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !dbg !131, !tbaa !132
  call void @__record_field_access_full(i32 2, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), i32 1), !dbg !133
  store double 3.000000e+00, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), align 8, !dbg !133, !tbaa !134
  call void @__record_field_access_full(i32 3, ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i32 2), !dbg !135
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(6) getelementptr inbounds (i8, ptr @g_foo, i64 16), ptr noundef nonnull align 1 dereferenceable(6) @.str, i64 6, i1 false) #9, !dbg !135
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), i32 1), !dbg !136
  store i64 42, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), align 8, !dbg !136, !tbaa !137
  ret void, !dbg !138
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @access_global_ab() local_unnamed_addr #1 !dbg !139 {
    #dbg_value(i32 0, !141, !DIExpression(), !144)
    #dbg_value(i32 0, !142, !DIExpression(), !145)
  call void @__record_field_access_full(i32 0, ptr @g_foo, i32 0)
  %1 = load i32, ptr @g_foo, align 8, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), i32 0)
  %2 = load float, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !tbaa !132
    #dbg_value(i32 0, !142, !DIExpression(), !145)
    #dbg_value(i32 poison, !141, !DIExpression(), !144)
  br label %7, !dbg !146

3:                                                ; preds = %7
  %4 = add i32 %1, 4950, !dbg !146
  call void @__record_field_access_full(i32 0, ptr @g_foo, i32 1), !dbg !147
  store i32 %4, ptr @g_foo, align 8, !dbg !147, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), i32 1), !dbg !150
  store float %23, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !dbg !150, !tbaa !132
  %5 = fpext float %23 to double, !dbg !151
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %4, double noundef %5), !dbg !152
  ret void, !dbg !153

7:                                                ; preds = %7, %0
  %8 = phi i32 [ 0, %0 ], [ %24, %7 ]
  %9 = phi float [ %2, %0 ], [ %23, %7 ]
    #dbg_value(i32 %8, !142, !DIExpression(), !145)
  %10 = uitofp nneg i32 %8 to float, !dbg !154
  %11 = tail call float @llvm.fmuladd.f32(float %10, float 5.000000e-01, float %9), !dbg !150
    #dbg_value(!DIArgList(i32 poison, i32 poison), !141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !144)
  %12 = add nuw nsw i32 %8, 1, !dbg !155
    #dbg_value(i32 poison, !141, !DIExpression(), !144)
    #dbg_value(i32 %12, !142, !DIExpression(), !145)
  %13 = uitofp nneg i32 %12 to float, !dbg !154
  %14 = tail call float @llvm.fmuladd.f32(float %13, float 5.000000e-01, float %11), !dbg !150
    #dbg_value(!DIArgList(i32 poison, i32 poison), !141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !144)
  %15 = add nuw nsw i32 %8, 2, !dbg !155
    #dbg_value(i32 poison, !141, !DIExpression(), !144)
    #dbg_value(i32 %15, !142, !DIExpression(), !145)
  %16 = uitofp nneg i32 %15 to float, !dbg !154
  %17 = tail call float @llvm.fmuladd.f32(float %16, float 5.000000e-01, float %14), !dbg !150
    #dbg_value(!DIArgList(i32 poison, i32 poison), !141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !144)
  %18 = add nuw nsw i32 %8, 3, !dbg !155
    #dbg_value(i32 poison, !141, !DIExpression(), !144)
    #dbg_value(i32 %18, !142, !DIExpression(), !145)
  %19 = uitofp nneg i32 %18 to float, !dbg !154
  %20 = tail call float @llvm.fmuladd.f32(float %19, float 5.000000e-01, float %17), !dbg !150
    #dbg_value(!DIArgList(i32 poison, i32 poison), !141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !144)
  %21 = add nuw nsw i32 %8, 4, !dbg !155
    #dbg_value(i32 poison, !141, !DIExpression(), !144)
    #dbg_value(i32 %21, !142, !DIExpression(), !145)
  %22 = uitofp nneg i32 %21 to float, !dbg !154
  %23 = tail call float @llvm.fmuladd.f32(float %22, float 5.000000e-01, float %20), !dbg !150
    #dbg_value(!DIArgList(i32 poison, i32 poison), !141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !144)
  %24 = add nuw nsw i32 %8, 5, !dbg !155
    #dbg_value(i32 %24, !142, !DIExpression(), !145)
    #dbg_value(i32 poison, !141, !DIExpression(), !144)
  %25 = icmp eq i32 %24, 100, !dbg !156
  br i1 %25, label %3, label %7, !dbg !146, !llvm.loop !157
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fmuladd.f32(float, float, float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nofree nounwind
declare !dbg !160 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: nofree nounwind uwtable
define dso_local void @access_global_cd() local_unnamed_addr #1 !dbg !167 {
    #dbg_value(i32 0, !169, !DIExpression(), !171)
  call void @__record_field_access_full(i32 2, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), i32 0)
  %1 = load double, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), align 8, !tbaa !134
    #dbg_value(i32 0, !169, !DIExpression(), !171)
  br label %4, !dbg !172

2:                                                ; preds = %4
  call void @__record_field_access_full(i32 2, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), i32 1), !dbg !173
  store double %19, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), align 8, !dbg !173, !tbaa !134
  call void @__record_field_access_full(i32 3, ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i32 0), !dbg !176
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %19, ptr noundef nonnull getelementptr inbounds (i8, ptr @g_foo, i64 16)), !dbg !176
  ret void, !dbg !177

4:                                                ; preds = %4, %0
  %5 = phi i32 [ 0, %0 ], [ %28, %4 ]
  %6 = phi double [ %1, %0 ], [ %19, %4 ]
    #dbg_value(i32 %5, !169, !DIExpression(), !171)
  %7 = uitofp nneg i32 %5 to double, !dbg !178
  %8 = tail call double @llvm.fmuladd.f64(double %7, double 1.500000e+00, double %6), !dbg !173
  %9 = add nuw nsw i32 %5, 230, !dbg !179
  %10 = icmp ult i32 %5, 26, !dbg !179
  %11 = select i1 %10, i32 %5, i32 %9, !dbg !179
  %12 = trunc i32 %11 to i8, !dbg !180
  %13 = add nuw i8 %12, 97, !dbg !180
  %14 = and i32 %5, 14, !dbg !181
  %15 = zext nneg i32 %14 to i64, !dbg !182
  call void @__record_field_access_full(i32 3, ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i32 0), !dbg !182
  %16 = getelementptr inbounds [16 x i8], ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i64 0, i64 %15, !dbg !182
  store i8 %13, ptr %16, align 2, !dbg !183, !tbaa !184
  %17 = or disjoint i32 %5, 1, !dbg !185
    #dbg_value(i32 %5, !169, !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value), !171)
  %18 = uitofp nneg i32 %17 to double, !dbg !178
  %19 = tail call double @llvm.fmuladd.f64(double %18, double 1.500000e+00, double %8), !dbg !173
  %20 = add nuw nsw i32 %5, 231, !dbg !179
  %21 = icmp ult i32 %5, 26, !dbg !179
  %22 = select i1 %21, i32 %17, i32 %20, !dbg !179
  %23 = trunc i32 %22 to i8, !dbg !180
  %24 = add nuw i8 %23, 97, !dbg !180
  %25 = and i32 %17, 15, !dbg !181
  %26 = zext nneg i32 %25 to i64, !dbg !182
  call void @__record_field_access_full(i32 3, ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i32 0), !dbg !182
  %27 = getelementptr inbounds [16 x i8], ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i64 0, i64 %26, !dbg !182
  store i8 %24, ptr %27, align 1, !dbg !183, !tbaa !184
  %28 = add nuw nsw i32 %5, 2, !dbg !185
    #dbg_value(i32 %28, !169, !DIExpression(), !171)
  %29 = icmp eq i32 %28, 50, !dbg !186
  br i1 %29, label %2, label %4, !dbg !172, !llvm.loop !187
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #3

; Function Attrs: nofree nounwind uwtable
define dso_local void @access_global_ae() local_unnamed_addr #1 !dbg !189 {
    #dbg_value(i32 0, !191, !DIExpression(), !193)
  call void @__record_field_access_full(i32 0, ptr @g_foo, i32 0)
  %1 = load i32, ptr @g_foo, align 8, !tbaa !123
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), i32 0)
  %2 = load i64, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), align 8, !tbaa !137
    #dbg_value(i32 0, !191, !DIExpression(), !193)
  %3 = add i32 %1, 19900, !dbg !194
    #dbg_value(i64 undef, !191, !DIExpression(), !193)
  %4 = add i64 %2, 59700, !dbg !194
  call void @__record_field_access_full(i32 0, ptr @g_foo, i32 1), !dbg !195
  store i32 %3, ptr @g_foo, align 8, !dbg !195, !tbaa !123
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), i32 1), !dbg !198
  store i64 %4, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), align 8, !dbg !198, !tbaa !137
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %3, i64 noundef %4), !dbg !199
  ret void, !dbg !200
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @hot_alternate_fields() local_unnamed_addr #1 !dbg !201 {
    #dbg_value(i32 0, !203, !DIExpression(), !205)
  call void @__record_field_access_full(i32 0, ptr @g_foo, i32 0)
  %1 = load i32, ptr @g_foo, align 8, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), i32 0)
  %2 = load float, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !tbaa !132
    #dbg_value(i32 0, !203, !DIExpression(), !205)
  br label %6, !dbg !206

3:                                                ; preds = %6
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), i32 1), !dbg !207
  store float %18, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !dbg !207, !tbaa !132
  %4 = fpext float %18 to double, !dbg !210
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, i32 noundef %1, double noundef %4), !dbg !211
  ret void, !dbg !212

6:                                                ; preds = %6, %0
  %7 = phi i32 [ 0, %0 ], [ %19, %6 ]
  %8 = phi float [ %2, %0 ], [ %18, %6 ]
    #dbg_value(i32 %7, !203, !DIExpression(), !205)
  %9 = fadd float %8, 1.000000e+00, !dbg !213
  %10 = fadd float %9, -1.000000e+00, !dbg !214
    #dbg_value(i32 %7, !203, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !205)
  %11 = fadd float %10, 1.000000e+00, !dbg !213
  %12 = fadd float %11, -1.000000e+00, !dbg !214
    #dbg_value(i32 %7, !203, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !205)
  %13 = fadd float %12, 1.000000e+00, !dbg !213
  %14 = fadd float %13, -1.000000e+00, !dbg !214
    #dbg_value(i32 %7, !203, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !205)
  %15 = fadd float %14, 1.000000e+00, !dbg !213
  %16 = fadd float %15, -1.000000e+00, !dbg !214
    #dbg_value(i32 %7, !203, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !205)
  %17 = fadd float %16, 1.000000e+00, !dbg !213
  %18 = fadd float %17, -1.000000e+00, !dbg !214
  %19 = add nuw nsw i32 %7, 5, !dbg !215
    #dbg_value(i32 %19, !203, !DIExpression(), !205)
  %20 = icmp eq i32 %19, 500, !dbg !216
  br i1 %20, label %3, label %6, !dbg !206, !llvm.loop !217
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @stack_struct() local_unnamed_addr #1 !dbg !219 {
  %1 = alloca %struct.Foo, align 8, !DIAssignID !222
    #dbg_assign(i1 undef, !221, !DIExpression(), !222, ptr %1, !DIExpression(), !223)
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %1) #9, !dbg !224
  call void @__record_field_access_full(i32 0, ptr %1, i32 1), !dbg !225
  store i32 10, ptr %1, align 8, !dbg !225, !tbaa !123, !DIAssignID !226
    #dbg_assign(i32 10, !221, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !226, ptr %1, !DIExpression(), !223)
  %2 = getelementptr inbounds i8, ptr %1, i64 4, !dbg !227
  call void @__record_field_access_full(i32 1, ptr %2, i32 1), !dbg !228
  store float 2.000000e+01, ptr %2, align 4, !dbg !228, !tbaa !132, !DIAssignID !229
    #dbg_assign(float 2.000000e+01, !221, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !229, ptr %2, !DIExpression(), !223)
  %3 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !230
  call void @__record_field_access_full(i32 2, ptr %3, i32 1), !dbg !231
  store double 3.000000e+01, ptr %3, align 8, !dbg !231, !tbaa !134, !DIAssignID !232
    #dbg_assign(double 3.000000e+01, !221, !DIExpression(DW_OP_LLVM_fragment, 64, 64), !232, ptr %3, !DIExpression(), !223)
  %4 = getelementptr inbounds i8, ptr %1, i64 16, !dbg !233
  call void @__record_field_access_full(i32 3, ptr %4, i32 2), !dbg !234
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(6) %4, ptr noundef nonnull align 1 dereferenceable(6) @.str.5, i64 6, i1 false) #9, !dbg !234
  %5 = getelementptr inbounds i8, ptr %1, i64 32, !dbg !235
  call void @__record_field_access_full(i32 4, ptr %5, i32 1), !dbg !236
  store i64 99, ptr %5, align 8, !dbg !236, !tbaa !137, !DIAssignID !237
    #dbg_assign(i64 99, !221, !DIExpression(DW_OP_LLVM_fragment, 256, 64), !237, ptr %5, !DIExpression(), !223)
  call void @__record_field_access_full(i32 3, ptr %4, i32 0), !dbg !238
  %6 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef 10, double noundef 2.000000e+01, double noundef 3.000000e+01, ptr noundef nonnull %4, i64 noundef 99), !dbg !238
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %1) #9, !dbg !239
  ret void, !dbg !239
}

; Function Attrs: nounwind uwtable
define dso_local void @heap_struct() local_unnamed_addr #5 !dbg !240 {
  %1 = tail call noalias dereferenceable_or_null(40) ptr @malloc(i64 noundef 40) #10, !dbg !243
    #dbg_value(ptr %1, !242, !DIExpression(), !244)
  %2 = icmp eq ptr %1, null, !dbg !245
  br i1 %2, label %9, label %3, !dbg !247

3:                                                ; preds = %0
  call void @__record_field_access_full(i32 0, ptr %1, i32 1), !dbg !248
  store i32 100, ptr %1, align 8, !dbg !248, !tbaa !123
  %4 = getelementptr inbounds i8, ptr %1, i64 4, !dbg !249
  call void @__record_field_access_full(i32 1, ptr %4, i32 1), !dbg !250
  store float 2.000000e+02, ptr %4, align 4, !dbg !250, !tbaa !132
  %5 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !251
  call void @__record_field_access_full(i32 2, ptr %5, i32 1), !dbg !252
  store double 3.000000e+02, ptr %5, align 8, !dbg !252, !tbaa !134
  %6 = getelementptr inbounds i8, ptr %1, i64 16, !dbg !253
  call void @__record_field_access_full(i32 3, ptr %6, i32 2), !dbg !254
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(5) %6, ptr noundef nonnull align 1 dereferenceable(5) @.str.7, i64 5, i1 false) #9, !dbg !254
  %7 = getelementptr inbounds i8, ptr %1, i64 32, !dbg !255
  call void @__record_field_access_full(i32 4, ptr %7, i32 1), !dbg !256
  store i64 999, ptr %7, align 8, !dbg !256, !tbaa !137
  call void @__record_field_access_full(i32 3, ptr %6, i32 0), !dbg !257
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.8, i32 noundef 100, double noundef 2.000000e+02, double noundef 3.000000e+02, ptr noundef nonnull %6, i64 noundef 999), !dbg !257
  tail call void @free(ptr noundef nonnull %1) #9, !dbg !258
  br label %9, !dbg !259

9:                                                ; preds = %0, %3
  ret void, !dbg !259
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare !dbg !260 noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare !dbg !268 void @free(ptr allocptr nocapture noundef) local_unnamed_addr #7

; Function Attrs: nofree nounwind uwtable
define dso_local void @bar_access() local_unnamed_addr #1 !dbg !271 {
    #dbg_value(i32 1, !273, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !279)
    #dbg_value(i32 2, !273, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !279)
    #dbg_value(i32 3, !273, !DIExpression(DW_OP_LLVM_fragment, 64, 32), !279)
  %1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, i32 noundef 1, i32 noundef 2, i32 noundef 3), !dbg !280
  ret void, !dbg !281
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @nested_struct_access() local_unnamed_addr #1 !dbg !282 {
  call void @__record_field_access_full(i32 5, ptr @g_outer, i32 1), !dbg !286
  store i32 1, ptr @g_outer, align 8, !dbg !286, !tbaa !287
  call void @__record_field_access_full(i32 6, ptr getelementptr inbounds (i8, ptr @g_outer, i64 24), i32 1), !dbg !290
  store i64 100, ptr getelementptr inbounds (i8, ptr @g_outer, i64 24), align 8, !dbg !290, !tbaa !291
    #dbg_value(i32 0, !284, !DIExpression(), !292)
    #dbg_value(i32 0, !284, !DIExpression(), !292)
  br label %4, !dbg !293

1:                                                ; preds = %4
  call void @__record_field_access_full(i32 7, ptr getelementptr inbounds (i8, ptr @g_outer, i64 8), i32 1), !dbg !294
  store float %14, ptr getelementptr inbounds (i8, ptr @g_outer, i64 8), align 8, !dbg !294, !tbaa !297
  call void @__record_field_access_full(i32 8, ptr getelementptr inbounds (i8, ptr @g_outer, i64 16), i32 1), !dbg !298
  store double %16, ptr getelementptr inbounds (i8, ptr @g_outer, i64 16), align 8, !dbg !298, !tbaa !299
  %2 = fpext float %14 to double, !dbg !300
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.10, i32 noundef 1, double noundef %2, double noundef %16, i64 noundef 100), !dbg !301
  ret void, !dbg !302

4:                                                ; preds = %4, %0
  %5 = phi i32 [ 0, %0 ], [ %17, %4 ]
  %6 = phi float [ 0x40091EB860000000, %0 ], [ %14, %4 ]
  %7 = phi double [ 2.718000e+00, %0 ], [ %16, %4 ]
    #dbg_value(i32 %5, !284, !DIExpression(), !292)
  %8 = uitofp nneg i32 %5 to float, !dbg !303
  %9 = tail call float @llvm.fmuladd.f32(float %8, float 0x3FB99999A0000000, float %6), !dbg !294
  %10 = uitofp nneg i32 %5 to double, !dbg !304
  %11 = tail call double @llvm.fmuladd.f64(double %10, double 1.000000e-02, double %7), !dbg !298
  %12 = or disjoint i32 %5, 1, !dbg !305
    #dbg_value(i32 %12, !284, !DIExpression(), !292)
  %13 = uitofp nneg i32 %12 to float, !dbg !303
  %14 = tail call float @llvm.fmuladd.f32(float %13, float 0x3FB99999A0000000, float %9), !dbg !294
  %15 = uitofp nneg i32 %12 to double, !dbg !304
  %16 = tail call double @llvm.fmuladd.f64(double %15, double 1.000000e-02, double %11), !dbg !298
  %17 = add nuw nsw i32 %5, 2, !dbg !305
    #dbg_value(i32 %17, !284, !DIExpression(), !292)
  %18 = icmp eq i32 %17, 80, !dbg !306
  br i1 %18, label %1, label %4, !dbg !293, !llvm.loop !307
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @array_field_access() local_unnamed_addr #1 !dbg !309 {
  call void @__record_field_access_full(i32 9, ptr @g_witharr, i32 1), !dbg !315
  store i32 42, ptr @g_witharr, align 8, !dbg !315, !tbaa !316
    #dbg_value(i32 0, !311, !DIExpression(), !318)
    #dbg_value(i64 0, !311, !DIExpression(), !318)
    #dbg_value(i64 1, !311, !DIExpression(), !318)
    #dbg_value(i64 2, !311, !DIExpression(), !318)
    #dbg_value(i64 3, !311, !DIExpression(), !318)
  call void @__record_field_access_full(i32 10, ptr getelementptr inbounds (i8, ptr @g_witharr, i64 4), i32 1), !dbg !319
  store <4 x float> <float 0.000000e+00, float 1.000000e+01, float 2.000000e+01, float 3.000000e+01>, ptr getelementptr inbounds (i8, ptr @g_witharr, i64 4), align 4, !dbg !319, !tbaa !322
    #dbg_value(i64 4, !311, !DIExpression(), !318)
    #dbg_value(i32 0, !313, !DIExpression(), !323)
    #dbg_value(i64 0, !313, !DIExpression(), !323)
    #dbg_value(i64 1, !313, !DIExpression(), !323)
    #dbg_value(i64 2, !313, !DIExpression(), !323)
    #dbg_value(i64 3, !313, !DIExpression(), !323)
    #dbg_value(i64 4, !313, !DIExpression(), !323)
  call void @__record_field_access_full(i32 11, ptr getelementptr inbounds (i8, ptr @g_witharr, i64 24), i32 1), !dbg !324
  store double 6.000000e+01, ptr getelementptr inbounds (i8, ptr @g_witharr, i64 24), align 8, !dbg !324, !tbaa !327
  %1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, i32 noundef 42, double noundef 0.000000e+00, double noundef 6.000000e+01), !dbg !328
  ret void, !dbg !329
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @struct_array_access() local_unnamed_addr #1 !dbg !330 {
    #dbg_value(i32 0, !332, !DIExpression(), !336)
    #dbg_value(i64 0, !332, !DIExpression(), !336)
  call void @__record_field_access_full(i32 0, ptr @g_arr, i32 1), !dbg !337
  store i32 0, ptr @g_arr, align 16, !dbg !337, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_arr, i64 4), i32 1), !dbg !340
  store float 0.000000e+00, ptr getelementptr inbounds (i8, ptr @g_arr, i64 4), align 4, !dbg !340, !tbaa !132
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_arr, i64 32), i32 1), !dbg !341
  store i64 0, ptr getelementptr inbounds (i8, ptr @g_arr, i64 32), align 16, !dbg !341, !tbaa !137
    #dbg_value(i64 1, !332, !DIExpression(), !336)
  call void @__record_field_access_full(i32 0, ptr getelementptr inbounds (i8, ptr @g_arr, i64 40), i32 1), !dbg !337
  store i32 10, ptr getelementptr inbounds (i8, ptr @g_arr, i64 40), align 8, !dbg !337, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_arr, i64 44), i32 1), !dbg !340
  store float 1.500000e+00, ptr getelementptr inbounds (i8, ptr @g_arr, i64 44), align 4, !dbg !340, !tbaa !132
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_arr, i64 72), i32 1), !dbg !341
  store i64 100, ptr getelementptr inbounds (i8, ptr @g_arr, i64 72), align 8, !dbg !341, !tbaa !137
    #dbg_value(i64 2, !332, !DIExpression(), !336)
  call void @__record_field_access_full(i32 0, ptr getelementptr inbounds (i8, ptr @g_arr, i64 80), i32 1), !dbg !337
  store i32 20, ptr getelementptr inbounds (i8, ptr @g_arr, i64 80), align 16, !dbg !337, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_arr, i64 84), i32 1), !dbg !340
  store float 3.000000e+00, ptr getelementptr inbounds (i8, ptr @g_arr, i64 84), align 4, !dbg !340, !tbaa !132
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_arr, i64 112), i32 1), !dbg !341
  store i64 200, ptr getelementptr inbounds (i8, ptr @g_arr, i64 112), align 16, !dbg !341, !tbaa !137
    #dbg_value(i64 3, !332, !DIExpression(), !336)
  call void @__record_field_access_full(i32 0, ptr getelementptr inbounds (i8, ptr @g_arr, i64 120), i32 1), !dbg !337
  store i32 30, ptr getelementptr inbounds (i8, ptr @g_arr, i64 120), align 8, !dbg !337, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_arr, i64 124), i32 1), !dbg !340
  store float 4.500000e+00, ptr getelementptr inbounds (i8, ptr @g_arr, i64 124), align 4, !dbg !340, !tbaa !132
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_arr, i64 152), i32 1), !dbg !341
  store i64 300, ptr getelementptr inbounds (i8, ptr @g_arr, i64 152), align 8, !dbg !341, !tbaa !137
    #dbg_value(i64 4, !332, !DIExpression(), !336)
  call void @__record_field_access_full(i32 0, ptr getelementptr inbounds (i8, ptr @g_arr, i64 160), i32 1), !dbg !337
  store i32 40, ptr getelementptr inbounds (i8, ptr @g_arr, i64 160), align 16, !dbg !337, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_arr, i64 164), i32 1), !dbg !340
  store float 6.000000e+00, ptr getelementptr inbounds (i8, ptr @g_arr, i64 164), align 4, !dbg !340, !tbaa !132
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_arr, i64 192), i32 1), !dbg !341
  store i64 400, ptr getelementptr inbounds (i8, ptr @g_arr, i64 192), align 16, !dbg !341, !tbaa !137
    #dbg_value(i64 5, !332, !DIExpression(), !336)
    #dbg_value(i64 0, !334, !DIExpression(), !342)
  %1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef 0, i32 noundef 0, double noundef 0.000000e+00, i64 noundef 0), !dbg !343
    #dbg_value(i64 1, !334, !DIExpression(), !342)
  call void @__record_field_access_full(i32 0, ptr getelementptr inbounds (i8, ptr @g_arr, i64 40), i32 0), !dbg !346
  %2 = load i32, ptr getelementptr inbounds (i8, ptr @g_arr, i64 40), align 8, !dbg !346, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_arr, i64 44), i32 0), !dbg !347
  %3 = load float, ptr getelementptr inbounds (i8, ptr @g_arr, i64 44), align 4, !dbg !347, !tbaa !132
  %4 = fpext float %3 to double, !dbg !348
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_arr, i64 72), i32 0), !dbg !349
  %5 = load i64, ptr getelementptr inbounds (i8, ptr @g_arr, i64 72), align 8, !dbg !349, !tbaa !137
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef 1, i32 noundef %2, double noundef %4, i64 noundef %5), !dbg !343
    #dbg_value(i64 2, !334, !DIExpression(), !342)
  call void @__record_field_access_full(i32 0, ptr getelementptr inbounds (i8, ptr @g_arr, i64 80), i32 0), !dbg !346
  %7 = load i32, ptr getelementptr inbounds (i8, ptr @g_arr, i64 80), align 16, !dbg !346, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_arr, i64 84), i32 0), !dbg !347
  %8 = load float, ptr getelementptr inbounds (i8, ptr @g_arr, i64 84), align 4, !dbg !347, !tbaa !132
  %9 = fpext float %8 to double, !dbg !348
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_arr, i64 112), i32 0), !dbg !349
  %10 = load i64, ptr getelementptr inbounds (i8, ptr @g_arr, i64 112), align 16, !dbg !349, !tbaa !137
  %11 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef 2, i32 noundef %7, double noundef %9, i64 noundef %10), !dbg !343
    #dbg_value(i64 3, !334, !DIExpression(), !342)
  call void @__record_field_access_full(i32 0, ptr getelementptr inbounds (i8, ptr @g_arr, i64 120), i32 0), !dbg !346
  %12 = load i32, ptr getelementptr inbounds (i8, ptr @g_arr, i64 120), align 8, !dbg !346, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_arr, i64 124), i32 0), !dbg !347
  %13 = load float, ptr getelementptr inbounds (i8, ptr @g_arr, i64 124), align 4, !dbg !347, !tbaa !132
  %14 = fpext float %13 to double, !dbg !348
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_arr, i64 152), i32 0), !dbg !349
  %15 = load i64, ptr getelementptr inbounds (i8, ptr @g_arr, i64 152), align 8, !dbg !349, !tbaa !137
  %16 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef 3, i32 noundef %12, double noundef %14, i64 noundef %15), !dbg !343
    #dbg_value(i64 4, !334, !DIExpression(), !342)
  call void @__record_field_access_full(i32 0, ptr getelementptr inbounds (i8, ptr @g_arr, i64 160), i32 0), !dbg !346
  %17 = load i32, ptr getelementptr inbounds (i8, ptr @g_arr, i64 160), align 16, !dbg !346, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_arr, i64 164), i32 0), !dbg !347
  %18 = load float, ptr getelementptr inbounds (i8, ptr @g_arr, i64 164), align 4, !dbg !347, !tbaa !132
  %19 = fpext float %18 to double, !dbg !348
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_arr, i64 192), i32 0), !dbg !349
  %20 = load i64, ptr getelementptr inbounds (i8, ptr @g_arr, i64 192), align 16, !dbg !349, !tbaa !137
  %21 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef 4, i32 noundef %17, double noundef %19, i64 noundef %20), !dbg !343
    #dbg_value(i64 5, !334, !DIExpression(), !342)
  ret void, !dbg !350
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @heap_nested_struct() local_unnamed_addr #1 !dbg !351 {
    #dbg_value(ptr poison, !353, !DIExpression(), !354)
  %1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.13, i32 noundef 2, double noundef 1.000000e+00, double noundef 2.000000e+00, i64 noundef 50), !dbg !355
  ret void, !dbg !356
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @heap_struct_array() local_unnamed_addr #1 !dbg !357 {
    #dbg_value(ptr poison, !359, !DIExpression(), !364)
    #dbg_value(i64 0, !362, !DIExpression(), !365)
  %1 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 0, i32 noundef 0, i64 noundef 0), !dbg !366
    #dbg_value(i64 1, !362, !DIExpression(), !365)
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 1, i32 noundef 1, i64 noundef 7), !dbg !366
    #dbg_value(i64 2, !362, !DIExpression(), !365)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 2, i32 noundef 2, i64 noundef 14), !dbg !366
    #dbg_value(i64 3, !362, !DIExpression(), !365)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 3, i32 noundef 3, i64 noundef 21), !dbg !366
    #dbg_value(i64 4, !362, !DIExpression(), !365)
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 4, i32 noundef 4, i64 noundef 28), !dbg !366
    #dbg_value(i64 5, !362, !DIExpression(), !365)
  ret void, !dbg !369
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #5 !dbg !370 {
  %1 = alloca %struct.Foo, align 8, !DIAssignID !373
  call void @__record_field_access_full(i32 2, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), i32 1), !dbg !374
  store double 3.000000e+00, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), align 8, !dbg !374, !tbaa !134
  call void @__record_field_access_full(i32 3, ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i32 2), !dbg !376
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(6) getelementptr inbounds (i8, ptr @g_foo, i64 16), ptr noundef nonnull align 1 dereferenceable(6) @.str, i64 6, i1 false) #9, !dbg !376
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), i32 1), !dbg !377
  store i64 42, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), align 8, !dbg !377, !tbaa !137
    #dbg_value(i32 0, !141, !DIExpression(), !378)
    #dbg_value(i32 0, !142, !DIExpression(), !380)
    #dbg_value(i32 0, !142, !DIExpression(), !380)
    #dbg_value(i32 poison, !141, !DIExpression(), !378)
  br label %2, !dbg !381

2:                                                ; preds = %2, %0
  %3 = phi i32 [ 0, %0 ], [ %19, %2 ]
  %4 = phi float [ 2.000000e+00, %0 ], [ %18, %2 ]
    #dbg_value(i32 %3, !142, !DIExpression(), !380)
  %5 = uitofp nneg i32 %3 to float, !dbg !382
  %6 = tail call float @llvm.fmuladd.f32(float %5, float 5.000000e-01, float %4), !dbg !383
    #dbg_value(!DIArgList(i32 poison, i32 poison), !141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !378)
  %7 = add nuw nsw i32 %3, 1, !dbg !384
    #dbg_value(i32 poison, !141, !DIExpression(), !378)
    #dbg_value(i32 %7, !142, !DIExpression(), !380)
  %8 = uitofp nneg i32 %7 to float, !dbg !382
  %9 = tail call float @llvm.fmuladd.f32(float %8, float 5.000000e-01, float %6), !dbg !383
    #dbg_value(!DIArgList(i32 poison, i32 poison), !141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !378)
  %10 = add nuw nsw i32 %3, 2, !dbg !384
    #dbg_value(i32 poison, !141, !DIExpression(), !378)
    #dbg_value(i32 %10, !142, !DIExpression(), !380)
  %11 = uitofp nneg i32 %10 to float, !dbg !382
  %12 = tail call float @llvm.fmuladd.f32(float %11, float 5.000000e-01, float %9), !dbg !383
    #dbg_value(!DIArgList(i32 poison, i32 poison), !141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !378)
  %13 = add nuw nsw i32 %3, 3, !dbg !384
    #dbg_value(i32 poison, !141, !DIExpression(), !378)
    #dbg_value(i32 %13, !142, !DIExpression(), !380)
  %14 = uitofp nneg i32 %13 to float, !dbg !382
  %15 = tail call float @llvm.fmuladd.f32(float %14, float 5.000000e-01, float %12), !dbg !383
    #dbg_value(!DIArgList(i32 poison, i32 poison), !141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !378)
  %16 = add nuw nsw i32 %3, 4, !dbg !384
    #dbg_value(i32 poison, !141, !DIExpression(), !378)
    #dbg_value(i32 %16, !142, !DIExpression(), !380)
  %17 = uitofp nneg i32 %16 to float, !dbg !382
  %18 = tail call float @llvm.fmuladd.f32(float %17, float 5.000000e-01, float %15), !dbg !383
    #dbg_value(!DIArgList(i32 poison, i32 poison), !141, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !378)
  %19 = add nuw nsw i32 %3, 5, !dbg !384
    #dbg_value(i32 %19, !142, !DIExpression(), !380)
    #dbg_value(i32 poison, !141, !DIExpression(), !378)
  %20 = icmp eq i32 %19, 100, !dbg !385
  br i1 %20, label %21, label %2, !dbg !381, !llvm.loop !386

21:                                               ; preds = %2
  call void @__record_field_access_full(i32 0, ptr @g_foo, i32 1), !dbg !388
  store i32 4951, ptr @g_foo, align 8, !dbg !388, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), i32 1), !dbg !383
  store float %18, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !dbg !383, !tbaa !132
  %22 = fpext float %18 to double, !dbg !389
  %23 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 4951, double noundef %22), !dbg !390
    #dbg_value(i32 0, !169, !DIExpression(), !391)
  call void @__record_field_access_full(i32 2, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), i32 0)
  %24 = load double, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), align 8, !tbaa !134
    #dbg_value(i32 0, !169, !DIExpression(), !391)
  br label %25, !dbg !393

25:                                               ; preds = %25, %21
  %26 = phi i32 [ 0, %21 ], [ %49, %25 ]
  %27 = phi double [ %24, %21 ], [ %40, %25 ]
    #dbg_value(i32 %26, !169, !DIExpression(), !391)
  %28 = uitofp nneg i32 %26 to double, !dbg !394
  %29 = tail call double @llvm.fmuladd.f64(double %28, double 1.500000e+00, double %27), !dbg !395
  %30 = add nuw nsw i32 %26, 230, !dbg !396
  %31 = icmp ult i32 %26, 26, !dbg !396
  %32 = select i1 %31, i32 %26, i32 %30, !dbg !396
  %33 = trunc i32 %32 to i8, !dbg !397
  %34 = add nuw i8 %33, 97, !dbg !397
  %35 = and i32 %26, 14, !dbg !398
  %36 = zext nneg i32 %35 to i64, !dbg !399
  call void @__record_field_access_full(i32 3, ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i32 0), !dbg !399
  %37 = getelementptr inbounds [16 x i8], ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i64 0, i64 %36, !dbg !399
  store i8 %34, ptr %37, align 2, !dbg !400, !tbaa !184
  %38 = or disjoint i32 %26, 1, !dbg !401
    #dbg_value(i32 %26, !169, !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value), !391)
  %39 = uitofp nneg i32 %38 to double, !dbg !394
  %40 = tail call double @llvm.fmuladd.f64(double %39, double 1.500000e+00, double %29), !dbg !395
  %41 = add nuw nsw i32 %26, 231, !dbg !396
  %42 = icmp ult i32 %26, 26, !dbg !396
  %43 = select i1 %42, i32 %38, i32 %41, !dbg !396
  %44 = trunc i32 %43 to i8, !dbg !397
  %45 = add nuw i8 %44, 97, !dbg !397
  %46 = and i32 %38, 15, !dbg !398
  %47 = zext nneg i32 %46 to i64, !dbg !399
  call void @__record_field_access_full(i32 3, ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i32 0), !dbg !399
  %48 = getelementptr inbounds [16 x i8], ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i64 0, i64 %47, !dbg !399
  store i8 %45, ptr %48, align 1, !dbg !400, !tbaa !184
  %49 = add nuw nsw i32 %26, 2, !dbg !401
    #dbg_value(i32 %49, !169, !DIExpression(), !391)
  %50 = icmp eq i32 %49, 50, !dbg !402
  br i1 %50, label %51, label %25, !dbg !393, !llvm.loop !403

51:                                               ; preds = %25
  call void @__record_field_access_full(i32 2, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), i32 1), !dbg !395
  store double %40, ptr getelementptr inbounds (i8, ptr @g_foo, i64 8), align 8, !dbg !395, !tbaa !134
  call void @__record_field_access_full(i32 3, ptr getelementptr inbounds (i8, ptr @g_foo, i64 16), i32 0), !dbg !405
  %52 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, double noundef %40, ptr noundef nonnull getelementptr inbounds (i8, ptr @g_foo, i64 16)), !dbg !405
    #dbg_value(i32 0, !191, !DIExpression(), !406)
  call void @__record_field_access_full(i32 0, ptr @g_foo, i32 0)
  %53 = load i32, ptr @g_foo, align 8, !tbaa !123
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), i32 0)
  %54 = load i64, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), align 8, !tbaa !137
    #dbg_value(i32 0, !191, !DIExpression(), !406)
  %55 = add i32 %53, 19900, !dbg !408
    #dbg_value(i64 undef, !191, !DIExpression(), !406)
  %56 = add i64 %54, 59700, !dbg !408
  call void @__record_field_access_full(i32 0, ptr @g_foo, i32 1), !dbg !409
  store i32 %55, ptr @g_foo, align 8, !dbg !409, !tbaa !123
  call void @__record_field_access_full(i32 4, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), i32 1), !dbg !410
  store i64 %56, ptr getelementptr inbounds (i8, ptr @g_foo, i64 32), align 8, !dbg !410, !tbaa !137
  %57 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %55, i64 noundef %56), !dbg !411
    #dbg_value(i32 0, !203, !DIExpression(), !412)
  call void @__record_field_access_full(i32 0, ptr @g_foo, i32 0)
  %58 = load i32, ptr @g_foo, align 8, !tbaa !123
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), i32 0)
  %59 = load float, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !tbaa !132
    #dbg_value(i32 0, !203, !DIExpression(), !412)
  br label %60, !dbg !414

60:                                               ; preds = %60, %51
  %61 = phi i32 [ 0, %51 ], [ %73, %60 ]
  %62 = phi float [ %59, %51 ], [ %72, %60 ]
    #dbg_value(i32 %61, !203, !DIExpression(), !412)
  %63 = fadd float %62, 1.000000e+00, !dbg !415
  %64 = fadd float %63, -1.000000e+00, !dbg !416
    #dbg_value(i32 %61, !203, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !412)
  %65 = fadd float %64, 1.000000e+00, !dbg !415
  %66 = fadd float %65, -1.000000e+00, !dbg !416
    #dbg_value(i32 %61, !203, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !412)
  %67 = fadd float %66, 1.000000e+00, !dbg !415
  %68 = fadd float %67, -1.000000e+00, !dbg !416
    #dbg_value(i32 %61, !203, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !412)
  %69 = fadd float %68, 1.000000e+00, !dbg !415
  %70 = fadd float %69, -1.000000e+00, !dbg !416
    #dbg_value(i32 %61, !203, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !412)
  %71 = fadd float %70, 1.000000e+00, !dbg !415
  %72 = fadd float %71, -1.000000e+00, !dbg !416
  %73 = add nuw nsw i32 %61, 5, !dbg !417
    #dbg_value(i32 %73, !203, !DIExpression(), !412)
  %74 = icmp eq i32 %73, 500, !dbg !418
  br i1 %74, label %75, label %60, !dbg !414, !llvm.loop !419

75:                                               ; preds = %60
  call void @__record_field_access_full(i32 1, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), i32 1), !dbg !421
  store float %72, ptr getelementptr inbounds (i8, ptr @g_foo, i64 4), align 4, !dbg !421, !tbaa !132
  %76 = fpext float %72 to double, !dbg !422
  %77 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, i32 noundef %58, double noundef %76), !dbg !423
    #dbg_assign(i1 undef, !221, !DIExpression(), !373, ptr %1, !DIExpression(), !424)
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %1) #9, !dbg !426
  call void @__record_field_access_full(i32 0, ptr %1, i32 1), !dbg !427
  store i32 10, ptr %1, align 8, !dbg !427, !tbaa !123, !DIAssignID !428
    #dbg_assign(i32 10, !221, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !428, ptr %1, !DIExpression(), !424)
  %78 = getelementptr inbounds i8, ptr %1, i64 4, !dbg !429
  call void @__record_field_access_full(i32 1, ptr %78, i32 1), !dbg !430
  store float 2.000000e+01, ptr %78, align 4, !dbg !430, !tbaa !132, !DIAssignID !431
    #dbg_assign(float 2.000000e+01, !221, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !431, ptr %78, !DIExpression(), !424)
  %79 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !432
  call void @__record_field_access_full(i32 2, ptr %79, i32 1), !dbg !433
  store double 3.000000e+01, ptr %79, align 8, !dbg !433, !tbaa !134, !DIAssignID !434
    #dbg_assign(double 3.000000e+01, !221, !DIExpression(DW_OP_LLVM_fragment, 64, 64), !434, ptr %79, !DIExpression(), !424)
  %80 = getelementptr inbounds i8, ptr %1, i64 16, !dbg !435
  call void @__record_field_access_full(i32 3, ptr %80, i32 2), !dbg !436
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(6) %80, ptr noundef nonnull align 1 dereferenceable(6) @.str.5, i64 6, i1 false) #9, !dbg !436
  %81 = getelementptr inbounds i8, ptr %1, i64 32, !dbg !437
  call void @__record_field_access_full(i32 4, ptr %81, i32 1), !dbg !438
  store i64 99, ptr %81, align 8, !dbg !438, !tbaa !137, !DIAssignID !439
    #dbg_assign(i64 99, !221, !DIExpression(DW_OP_LLVM_fragment, 256, 64), !439, ptr %81, !DIExpression(), !424)
  call void @__record_field_access_full(i32 3, ptr %80, i32 0), !dbg !440
  %82 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef 10, double noundef 2.000000e+01, double noundef 3.000000e+01, ptr noundef nonnull %80, i64 noundef 99), !dbg !440
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %1) #9, !dbg !441
  %83 = call noalias dereferenceable_or_null(40) ptr @malloc(i64 noundef 40) #10, !dbg !442
    #dbg_value(ptr %83, !242, !DIExpression(), !444)
  %84 = icmp eq ptr %83, null, !dbg !445
  br i1 %84, label %91, label %85, !dbg !446

85:                                               ; preds = %75
  call void @__record_field_access_full(i32 0, ptr %83, i32 1), !dbg !447
  store i32 100, ptr %83, align 8, !dbg !447, !tbaa !123
  %86 = getelementptr inbounds i8, ptr %83, i64 4, !dbg !448
  call void @__record_field_access_full(i32 1, ptr %86, i32 1), !dbg !449
  store float 2.000000e+02, ptr %86, align 4, !dbg !449, !tbaa !132
  %87 = getelementptr inbounds i8, ptr %83, i64 8, !dbg !450
  call void @__record_field_access_full(i32 2, ptr %87, i32 1), !dbg !451
  store double 3.000000e+02, ptr %87, align 8, !dbg !451, !tbaa !134
  %88 = getelementptr inbounds i8, ptr %83, i64 16, !dbg !452
  call void @__record_field_access_full(i32 3, ptr %88, i32 2), !dbg !453
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 1 dereferenceable(5) %88, ptr noundef nonnull align 1 dereferenceable(5) @.str.7, i64 5, i1 false) #9, !dbg !453
  %89 = getelementptr inbounds i8, ptr %83, i64 32, !dbg !454
  call void @__record_field_access_full(i32 4, ptr %89, i32 1), !dbg !455
  store i64 999, ptr %89, align 8, !dbg !455, !tbaa !137
  call void @__record_field_access_full(i32 3, ptr %88, i32 0), !dbg !456
  %90 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.8, i32 noundef 100, double noundef 2.000000e+02, double noundef 3.000000e+02, ptr noundef nonnull %88, i64 noundef 999), !dbg !456
  call void @free(ptr noundef nonnull %83) #9, !dbg !457
  br label %91, !dbg !458

91:                                               ; preds = %75, %85
    #dbg_value(i32 1, !273, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !459)
    #dbg_value(i32 2, !273, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !459)
    #dbg_value(i32 3, !273, !DIExpression(DW_OP_LLVM_fragment, 64, 32), !459)
  %92 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, i32 noundef 1, i32 noundef 2, i32 noundef 3), !dbg !461
  call void @__record_field_access_full(i32 5, ptr @g_outer, i32 1), !dbg !462
  store i32 1, ptr @g_outer, align 8, !dbg !462, !tbaa !287
  call void @__record_field_access_full(i32 6, ptr getelementptr inbounds (i8, ptr @g_outer, i64 24), i32 1), !dbg !464
  store i64 100, ptr getelementptr inbounds (i8, ptr @g_outer, i64 24), align 8, !dbg !464, !tbaa !291
    #dbg_value(i32 0, !284, !DIExpression(), !465)
    #dbg_value(i32 0, !284, !DIExpression(), !465)
  br label %93, !dbg !466

93:                                               ; preds = %93, %91
  %94 = phi i32 [ 0, %91 ], [ %106, %93 ]
  %95 = phi float [ 0x40091EB860000000, %91 ], [ %103, %93 ]
  %96 = phi double [ 2.718000e+00, %91 ], [ %105, %93 ]
    #dbg_value(i32 %94, !284, !DIExpression(), !465)
  %97 = uitofp nneg i32 %94 to float, !dbg !467
  %98 = call float @llvm.fmuladd.f32(float %97, float 0x3FB99999A0000000, float %95), !dbg !468
  %99 = uitofp nneg i32 %94 to double, !dbg !469
  %100 = call double @llvm.fmuladd.f64(double %99, double 1.000000e-02, double %96), !dbg !470
  %101 = or disjoint i32 %94, 1, !dbg !471
    #dbg_value(i32 %101, !284, !DIExpression(), !465)
  %102 = uitofp nneg i32 %101 to float, !dbg !467
  %103 = call float @llvm.fmuladd.f32(float %102, float 0x3FB99999A0000000, float %98), !dbg !468
  %104 = uitofp nneg i32 %101 to double, !dbg !469
  %105 = call double @llvm.fmuladd.f64(double %104, double 1.000000e-02, double %100), !dbg !470
  %106 = add nuw nsw i32 %94, 2, !dbg !471
    #dbg_value(i32 %106, !284, !DIExpression(), !465)
  %107 = icmp eq i32 %106, 80, !dbg !472
  br i1 %107, label %108, label %93, !dbg !466, !llvm.loop !473

108:                                              ; preds = %93
  call void @__record_field_access_full(i32 7, ptr getelementptr inbounds (i8, ptr @g_outer, i64 8), i32 1), !dbg !468
  store float %103, ptr getelementptr inbounds (i8, ptr @g_outer, i64 8), align 8, !dbg !468, !tbaa !297
  call void @__record_field_access_full(i32 8, ptr getelementptr inbounds (i8, ptr @g_outer, i64 16), i32 1), !dbg !470
  store double %105, ptr getelementptr inbounds (i8, ptr @g_outer, i64 16), align 8, !dbg !470, !tbaa !299
  %109 = fpext float %103 to double, !dbg !475
  %110 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.10, i32 noundef 1, double noundef %109, double noundef %105, i64 noundef 100), !dbg !476
  call void @__record_field_access_full(i32 9, ptr @g_witharr, i32 1), !dbg !477
  store i32 42, ptr @g_witharr, align 8, !dbg !477, !tbaa !316
    #dbg_value(i32 0, !311, !DIExpression(), !479)
    #dbg_value(i64 0, !311, !DIExpression(), !479)
    #dbg_value(i64 1, !311, !DIExpression(), !479)
    #dbg_value(i64 2, !311, !DIExpression(), !479)
    #dbg_value(i64 3, !311, !DIExpression(), !479)
  call void @__record_field_access_full(i32 10, ptr getelementptr inbounds (i8, ptr @g_witharr, i64 4), i32 1), !dbg !480
  store <4 x float> <float 0.000000e+00, float 1.000000e+01, float 2.000000e+01, float 3.000000e+01>, ptr getelementptr inbounds (i8, ptr @g_witharr, i64 4), align 4, !dbg !480, !tbaa !322
    #dbg_value(i64 4, !311, !DIExpression(), !479)
    #dbg_value(i32 0, !313, !DIExpression(), !481)
    #dbg_value(i64 0, !313, !DIExpression(), !481)
    #dbg_value(i64 1, !313, !DIExpression(), !481)
    #dbg_value(i64 2, !313, !DIExpression(), !481)
    #dbg_value(i64 3, !313, !DIExpression(), !481)
    #dbg_value(i64 4, !313, !DIExpression(), !481)
  call void @__record_field_access_full(i32 11, ptr getelementptr inbounds (i8, ptr @g_witharr, i64 24), i32 1), !dbg !482
  store double 6.000000e+01, ptr getelementptr inbounds (i8, ptr @g_witharr, i64 24), align 8, !dbg !482, !tbaa !327
  %111 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, i32 noundef 42, double noundef 0.000000e+00, double noundef 6.000000e+01), !dbg !483
  call void @struct_array_access(), !dbg !484
    #dbg_value(ptr poison, !353, !DIExpression(), !485)
  %112 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.13, i32 noundef 2, double noundef 1.000000e+00, double noundef 2.000000e+00, i64 noundef 50), !dbg !487
    #dbg_value(ptr poison, !359, !DIExpression(), !488)
    #dbg_value(i64 0, !362, !DIExpression(), !490)
  %113 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 0, i32 noundef 0, i64 noundef 0), !dbg !491
    #dbg_value(i64 1, !362, !DIExpression(), !490)
  %114 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 1, i32 noundef 1, i64 noundef 7), !dbg !491
    #dbg_value(i64 2, !362, !DIExpression(), !490)
  %115 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 2, i32 noundef 2, i64 noundef 14), !dbg !491
    #dbg_value(i64 3, !362, !DIExpression(), !490)
  %116 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 3, i32 noundef 3, i64 noundef 21), !dbg !491
    #dbg_value(i64 4, !362, !DIExpression(), !490)
  %117 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 4, i32 noundef 4, i64 noundef 28), !dbg !491
    #dbg_value(i64 5, !362, !DIExpression(), !490)
  ret i32 0, !dbg !492
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #8

declare void @__record_field_access_full(i32, ptr, i32)

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
!llvm.module.flags = !{!111, !112, !113, !114, !115, !116, !117}
!llvm.ident = !{!118}
!fieldanalysis.instrumented = !{}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g_foo", scope: !2, file: !10, line: 36, type: !9, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !32, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_structs/src/test_struct.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_structs", checksumkind: CSK_MD5, checksum: "5ee496b328a0db06ba1f18db92463ec6")
!4 = !{!5, !6, !7, !8, !22}
!5 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!6 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!7 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Foo", file: !10, line: 5, size: 320, elements: !11)
!10 = !DIFile(filename: "src/test_struct.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_structs", checksumkind: CSK_MD5, checksum: "5ee496b328a0db06ba1f18db92463ec6")
!11 = !{!12, !14, !15, !16, !21}
!12 = !DIDerivedType(tag: DW_TAG_member, name: "a", scope: !9, file: !10, line: 6, baseType: !13, size: 32)
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !9, file: !10, line: 7, baseType: !5, size: 32, offset: 32)
!15 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !9, file: !10, line: 8, baseType: !6, size: 64, offset: 64)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "d", scope: !9, file: !10, line: 9, baseType: !17, size: 128, offset: 128)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 128, elements: !19)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{!20}
!20 = !DISubrange(count: 16)
!21 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !9, file: !10, line: 10, baseType: !7, size: 64, offset: 256)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Outer", file: !10, line: 24, size: 256, elements: !24)
!24 = !{!25, !26, !31}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "tag", scope: !23, file: !10, line: 25, baseType: !13, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "inner", scope: !23, file: !10, line: 26, baseType: !27, size: 128, offset: 64)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Inner", file: !10, line: 19, size: 128, elements: !28)
!28 = !{!29, !30}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !27, file: !10, line: 20, baseType: !5, size: 32)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !27, file: !10, line: 21, baseType: !6, size: 64, offset: 64)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "extra", scope: !23, file: !10, line: 27, baseType: !7, size: 64, offset: 192)
!32 = !{!33, !38, !43, !45, !50, !52, !54, !59, !64, !69, !74, !79, !81, !86, !91, !0, !96, !98, !108}
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(scope: null, file: !10, line: 45, type: !35, isLocal: true, isDefinition: true)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 48, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 6)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(scope: null, file: !10, line: 56, type: !40, isLocal: true, isDefinition: true)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 88, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 11)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(scope: null, file: !10, line: 64, type: !40, isLocal: true, isDefinition: true)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(scope: null, file: !10, line: 72, type: !47, isLocal: true, isDefinition: true)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 96, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 12)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(scope: null, file: !10, line: 82, type: !47, isLocal: true, isDefinition: true)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(scope: null, file: !10, line: 90, type: !35, isLocal: true, isDefinition: true)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(scope: null, file: !10, line: 92, type: !56, isLocal: true, isDefinition: true)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 192, elements: !57)
!57 = !{!58}
!58 = !DISubrange(count: 24)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(scope: null, file: !10, line: 101, type: !61, isLocal: true, isDefinition: true)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 40, elements: !62)
!62 = !{!63}
!63 = !DISubrange(count: 5)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(scope: null, file: !10, line: 103, type: !66, isLocal: true, isDefinition: true)
!66 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 184, elements: !67)
!67 = !{!68}
!68 = !DISubrange(count: 23)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(scope: null, file: !10, line: 112, type: !71, isLocal: true, isDefinition: true)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 120, elements: !72)
!72 = !{!73}
!73 = !DISubrange(count: 15)
!74 = !DIGlobalVariableExpression(var: !75, expr: !DIExpression())
!75 = distinct !DIGlobalVariable(scope: null, file: !10, line: 124, type: !76, isLocal: true, isDefinition: true)
!76 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 176, elements: !77)
!77 = !{!78}
!78 = !DISubrange(count: 22)
!79 = !DIGlobalVariableExpression(var: !80, expr: !DIExpression())
!80 = distinct !DIGlobalVariable(scope: null, file: !10, line: 136, type: !66, isLocal: true, isDefinition: true)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(scope: null, file: !10, line: 146, type: !83, isLocal: true, isDefinition: true)
!83 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 160, elements: !84)
!84 = !{!85}
!85 = !DISubrange(count: 20)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(scope: null, file: !10, line: 157, type: !88, isLocal: true, isDefinition: true)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 216, elements: !89)
!89 = !{!90}
!90 = !DISubrange(count: 27)
!91 = !DIGlobalVariableExpression(var: !92, expr: !DIExpression())
!92 = distinct !DIGlobalVariable(scope: null, file: !10, line: 169, type: !93, isLocal: true, isDefinition: true)
!93 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 144, elements: !94)
!94 = !{!95}
!95 = !DISubrange(count: 18)
!96 = !DIGlobalVariableExpression(var: !97, expr: !DIExpression())
!97 = distinct !DIGlobalVariable(name: "g_outer", scope: !2, file: !10, line: 37, type: !23, isLocal: false, isDefinition: true)
!98 = !DIGlobalVariableExpression(var: !99, expr: !DIExpression())
!99 = distinct !DIGlobalVariable(name: "g_witharr", scope: !2, file: !10, line: 38, type: !100, isLocal: false, isDefinition: true)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "WithArray", file: !10, line: 30, size: 256, elements: !101)
!101 = !{!102, !103, !107}
!102 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !100, file: !10, line: 31, baseType: !13, size: 32)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "scores", scope: !100, file: !10, line: 32, baseType: !104, size: 128, offset: 32)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 128, elements: !105)
!105 = !{!106}
!106 = !DISubrange(count: 4)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "total", scope: !100, file: !10, line: 33, baseType: !6, size: 64, offset: 192)
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression())
!109 = distinct !DIGlobalVariable(name: "g_arr", scope: !2, file: !10, line: 39, type: !110, isLocal: false, isDefinition: true)
!110 = !DICompositeType(tag: DW_TAG_array_type, baseType: !9, size: 1600, elements: !62)
!111 = !{i32 7, !"Dwarf Version", i32 5}
!112 = !{i32 2, !"Debug Info Version", i32 3}
!113 = !{i32 1, !"wchar_size", i32 4}
!114 = !{i32 8, !"PIC Level", i32 2}
!115 = !{i32 7, !"PIE Level", i32 2}
!116 = !{i32 7, !"uwtable", i32 2}
!117 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!118 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!119 = distinct !DISubprogram(name: "init_global", scope: !10, file: !10, line: 41, type: !120, scopeLine: 41, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!120 = !DISubroutineType(types: !121)
!121 = !{null}
!122 = !DILocation(line: 42, column: 13, scope: !119)
!123 = !{!124, !125, i64 0}
!124 = !{!"Foo", !125, i64 0, !128, i64 4, !129, i64 8, !126, i64 16, !130, i64 32}
!125 = !{!"int", !126, i64 0}
!126 = !{!"omnipotent char", !127, i64 0}
!127 = !{!"Simple C/C++ TBAA"}
!128 = !{!"float", !126, i64 0}
!129 = !{!"double", !126, i64 0}
!130 = !{!"long", !126, i64 0}
!131 = !DILocation(line: 43, column: 13, scope: !119)
!132 = !{!124, !128, i64 4}
!133 = !DILocation(line: 44, column: 13, scope: !119)
!134 = !{!124, !129, i64 8}
!135 = !DILocation(line: 45, column: 5, scope: !119)
!136 = !DILocation(line: 46, column: 13, scope: !119)
!137 = !{!124, !130, i64 32}
!138 = !DILocation(line: 47, column: 1, scope: !119)
!139 = distinct !DISubprogram(name: "access_global_ab", scope: !10, file: !10, line: 49, type: !120, scopeLine: 49, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !140)
!140 = !{!141, !142}
!141 = !DILocalVariable(name: "sum", scope: !139, file: !10, line: 50, type: !13)
!142 = !DILocalVariable(name: "i", scope: !143, file: !10, line: 51, type: !13)
!143 = distinct !DILexicalBlock(scope: !139, file: !10, line: 51, column: 5)
!144 = !DILocation(line: 0, scope: !139)
!145 = !DILocation(line: 0, scope: !143)
!146 = !DILocation(line: 51, column: 5, scope: !143)
!147 = !DILocation(line: 52, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !149, file: !10, line: 51, column: 35)
!149 = distinct !DILexicalBlock(scope: !143, file: !10, line: 51, column: 5)
!150 = !DILocation(line: 53, column: 17, scope: !148)
!151 = !DILocation(line: 56, column: 36, scope: !139)
!152 = !DILocation(line: 56, column: 5, scope: !139)
!153 = !DILocation(line: 57, column: 1, scope: !139)
!154 = !DILocation(line: 53, column: 20, scope: !148)
!155 = !DILocation(line: 51, column: 31, scope: !149)
!156 = !DILocation(line: 51, column: 23, scope: !149)
!157 = distinct !{!157, !146, !158, !159}
!158 = !DILocation(line: 55, column: 5, scope: !143)
!159 = !{!"llvm.loop.mustprogress"}
!160 = !DISubprogram(name: "printf", scope: !161, file: !161, line: 356, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!161 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!162 = !DISubroutineType(types: !163)
!163 = !{!13, !164, null}
!164 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !165)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 64)
!166 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !18)
!167 = distinct !DISubprogram(name: "access_global_cd", scope: !10, file: !10, line: 59, type: !120, scopeLine: 59, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !168)
!168 = !{!169}
!169 = !DILocalVariable(name: "i", scope: !170, file: !10, line: 60, type: !13)
!170 = distinct !DILexicalBlock(scope: !167, file: !10, line: 60, column: 5)
!171 = !DILocation(line: 0, scope: !170)
!172 = !DILocation(line: 60, column: 5, scope: !170)
!173 = !DILocation(line: 61, column: 17, scope: !174)
!174 = distinct !DILexicalBlock(scope: !175, file: !10, line: 60, column: 34)
!175 = distinct !DILexicalBlock(scope: !170, file: !10, line: 60, column: 5)
!176 = !DILocation(line: 64, column: 5, scope: !167)
!177 = !DILocation(line: 65, column: 1, scope: !167)
!178 = !DILocation(line: 61, column: 20, scope: !174)
!179 = !DILocation(line: 62, column: 36, scope: !174)
!180 = !DILocation(line: 62, column: 27, scope: !174)
!181 = !DILocation(line: 62, column: 19, scope: !174)
!182 = !DILocation(line: 62, column: 9, scope: !174)
!183 = !DILocation(line: 62, column: 25, scope: !174)
!184 = !{!126, !126, i64 0}
!185 = !DILocation(line: 60, column: 30, scope: !175)
!186 = !DILocation(line: 60, column: 23, scope: !175)
!187 = distinct !{!187, !172, !188, !159}
!188 = !DILocation(line: 63, column: 5, scope: !170)
!189 = distinct !DISubprogram(name: "access_global_ae", scope: !10, file: !10, line: 67, type: !120, scopeLine: 67, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !190)
!190 = !{!191}
!191 = !DILocalVariable(name: "i", scope: !192, file: !10, line: 68, type: !13)
!192 = distinct !DILexicalBlock(scope: !189, file: !10, line: 68, column: 5)
!193 = !DILocation(line: 0, scope: !192)
!194 = !DILocation(line: 68, column: 5, scope: !192)
!195 = !DILocation(line: 69, column: 17, scope: !196)
!196 = distinct !DILexicalBlock(scope: !197, file: !10, line: 68, column: 35)
!197 = distinct !DILexicalBlock(scope: !192, file: !10, line: 68, column: 5)
!198 = !DILocation(line: 70, column: 17, scope: !196)
!199 = !DILocation(line: 72, column: 5, scope: !189)
!200 = !DILocation(line: 73, column: 1, scope: !189)
!201 = distinct !DISubprogram(name: "hot_alternate_fields", scope: !10, file: !10, line: 75, type: !120, scopeLine: 75, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !202)
!202 = !{!203}
!203 = !DILocalVariable(name: "i", scope: !204, file: !10, line: 76, type: !13)
!204 = distinct !DILexicalBlock(scope: !201, file: !10, line: 76, column: 5)
!205 = !DILocation(line: 0, scope: !204)
!206 = !DILocation(line: 76, column: 5, scope: !204)
!207 = !DILocation(line: 0, scope: !208)
!208 = distinct !DILexicalBlock(scope: !209, file: !10, line: 76, column: 35)
!209 = distinct !DILexicalBlock(scope: !204, file: !10, line: 76, column: 5)
!210 = !DILocation(line: 82, column: 37, scope: !201)
!211 = !DILocation(line: 82, column: 5, scope: !201)
!212 = !DILocation(line: 83, column: 1, scope: !201)
!213 = !DILocation(line: 78, column: 17, scope: !208)
!214 = !DILocation(line: 80, column: 17, scope: !208)
!215 = !DILocation(line: 76, column: 31, scope: !209)
!216 = !DILocation(line: 76, column: 23, scope: !209)
!217 = distinct !{!217, !206, !218, !159}
!218 = !DILocation(line: 81, column: 5, scope: !204)
!219 = distinct !DISubprogram(name: "stack_struct", scope: !10, file: !10, line: 85, type: !120, scopeLine: 85, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !220)
!220 = !{!221}
!221 = !DILocalVariable(name: "local", scope: !219, file: !10, line: 86, type: !9)
!222 = distinct !DIAssignID()
!223 = !DILocation(line: 0, scope: !219)
!224 = !DILocation(line: 86, column: 5, scope: !219)
!225 = !DILocation(line: 87, column: 13, scope: !219)
!226 = distinct !DIAssignID()
!227 = !DILocation(line: 88, column: 11, scope: !219)
!228 = !DILocation(line: 88, column: 13, scope: !219)
!229 = distinct !DIAssignID()
!230 = !DILocation(line: 89, column: 11, scope: !219)
!231 = !DILocation(line: 89, column: 13, scope: !219)
!232 = distinct !DIAssignID()
!233 = !DILocation(line: 90, column: 18, scope: !219)
!234 = !DILocation(line: 90, column: 5, scope: !219)
!235 = !DILocation(line: 91, column: 11, scope: !219)
!236 = !DILocation(line: 91, column: 13, scope: !219)
!237 = distinct !DIAssignID()
!238 = !DILocation(line: 92, column: 5, scope: !219)
!239 = !DILocation(line: 93, column: 1, scope: !219)
!240 = distinct !DISubprogram(name: "heap_struct", scope: !10, file: !10, line: 95, type: !120, scopeLine: 95, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !241)
!241 = !{!242}
!242 = !DILocalVariable(name: "hp", scope: !240, file: !10, line: 96, type: !8)
!243 = !DILocation(line: 96, column: 36, scope: !240)
!244 = !DILocation(line: 0, scope: !240)
!245 = !DILocation(line: 97, column: 10, scope: !246)
!246 = distinct !DILexicalBlock(scope: !240, file: !10, line: 97, column: 9)
!247 = !DILocation(line: 97, column: 9, scope: !240)
!248 = !DILocation(line: 98, column: 11, scope: !240)
!249 = !DILocation(line: 99, column: 9, scope: !240)
!250 = !DILocation(line: 99, column: 11, scope: !240)
!251 = !DILocation(line: 100, column: 9, scope: !240)
!252 = !DILocation(line: 100, column: 11, scope: !240)
!253 = !DILocation(line: 101, column: 16, scope: !240)
!254 = !DILocation(line: 101, column: 5, scope: !240)
!255 = !DILocation(line: 102, column: 9, scope: !240)
!256 = !DILocation(line: 102, column: 11, scope: !240)
!257 = !DILocation(line: 103, column: 5, scope: !240)
!258 = !DILocation(line: 104, column: 5, scope: !240)
!259 = !DILocation(line: 105, column: 1, scope: !240)
!260 = !DISubprogram(name: "malloc", scope: !261, file: !261, line: 540, type: !262, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!261 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!262 = !DISubroutineType(types: !263)
!263 = !{!264, !265}
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!265 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !266, line: 18, baseType: !267)
!266 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!267 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!268 = !DISubprogram(name: "free", scope: !261, file: !261, line: 555, type: !269, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!269 = !DISubroutineType(types: !270)
!270 = !{null, !264}
!271 = distinct !DISubprogram(name: "bar_access", scope: !10, file: !10, line: 107, type: !120, scopeLine: 107, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !272)
!272 = !{!273}
!273 = !DILocalVariable(name: "bar", scope: !271, file: !10, line: 108, type: !274)
!274 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Bar", file: !10, line: 13, size: 96, elements: !275)
!275 = !{!276, !277, !278}
!276 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !274, file: !10, line: 14, baseType: !13, size: 32)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !274, file: !10, line: 15, baseType: !13, size: 32, offset: 32)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !274, file: !10, line: 16, baseType: !13, size: 32, offset: 64)
!279 = !DILocation(line: 0, scope: !271)
!280 = !DILocation(line: 112, column: 5, scope: !271)
!281 = !DILocation(line: 113, column: 1, scope: !271)
!282 = distinct !DISubprogram(name: "nested_struct_access", scope: !10, file: !10, line: 115, type: !120, scopeLine: 115, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !283)
!283 = !{!284}
!284 = !DILocalVariable(name: "i", scope: !285, file: !10, line: 120, type: !13)
!285 = distinct !DILexicalBlock(scope: !282, file: !10, line: 120, column: 5)
!286 = !DILocation(line: 116, column: 17, scope: !282)
!287 = !{!288, !125, i64 0}
!288 = !{!"Outer", !125, i64 0, !289, i64 8, !130, i64 24}
!289 = !{!"Inner", !128, i64 0, !129, i64 8}
!290 = !DILocation(line: 119, column: 19, scope: !282)
!291 = !{!288, !130, i64 24}
!292 = !DILocation(line: 0, scope: !285)
!293 = !DILocation(line: 120, column: 5, scope: !285)
!294 = !DILocation(line: 121, column: 25, scope: !295)
!295 = distinct !DILexicalBlock(scope: !296, file: !10, line: 120, column: 34)
!296 = distinct !DILexicalBlock(scope: !285, file: !10, line: 120, column: 5)
!297 = !{!288, !128, i64 8}
!298 = !DILocation(line: 122, column: 25, scope: !295)
!299 = !{!288, !129, i64 16}
!300 = !DILocation(line: 124, column: 51, scope: !282)
!301 = !DILocation(line: 124, column: 5, scope: !282)
!302 = !DILocation(line: 125, column: 1, scope: !282)
!303 = !DILocation(line: 121, column: 28, scope: !295)
!304 = !DILocation(line: 122, column: 28, scope: !295)
!305 = !DILocation(line: 120, column: 30, scope: !296)
!306 = !DILocation(line: 120, column: 23, scope: !296)
!307 = distinct !{!307, !293, !308, !159}
!308 = !DILocation(line: 123, column: 5, scope: !285)
!309 = distinct !DISubprogram(name: "array_field_access", scope: !10, file: !10, line: 127, type: !120, scopeLine: 127, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !310)
!310 = !{!311, !313}
!311 = !DILocalVariable(name: "i", scope: !312, file: !10, line: 129, type: !13)
!312 = distinct !DILexicalBlock(scope: !309, file: !10, line: 129, column: 5)
!313 = !DILocalVariable(name: "i", scope: !314, file: !10, line: 133, type: !13)
!314 = distinct !DILexicalBlock(scope: !309, file: !10, line: 133, column: 5)
!315 = !DILocation(line: 128, column: 18, scope: !309)
!316 = !{!317, !125, i64 0}
!317 = !{!"WithArray", !125, i64 0, !126, i64 4, !129, i64 24}
!318 = !DILocation(line: 0, scope: !312)
!319 = !DILocation(line: 130, column: 29, scope: !320)
!320 = distinct !DILexicalBlock(scope: !321, file: !10, line: 129, column: 33)
!321 = distinct !DILexicalBlock(scope: !312, file: !10, line: 129, column: 5)
!322 = !{!128, !128, i64 0}
!323 = !DILocation(line: 0, scope: !314)
!324 = !DILocation(line: 134, column: 25, scope: !325)
!325 = distinct !DILexicalBlock(scope: !326, file: !10, line: 133, column: 33)
!326 = distinct !DILexicalBlock(scope: !314, file: !10, line: 133, column: 5)
!327 = !{!317, !129, i64 24}
!328 = !DILocation(line: 136, column: 5, scope: !309)
!329 = !DILocation(line: 137, column: 1, scope: !309)
!330 = distinct !DISubprogram(name: "struct_array_access", scope: !10, file: !10, line: 139, type: !120, scopeLine: 139, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !331)
!331 = !{!332, !334}
!332 = !DILocalVariable(name: "i", scope: !333, file: !10, line: 140, type: !13)
!333 = distinct !DILexicalBlock(scope: !330, file: !10, line: 140, column: 5)
!334 = !DILocalVariable(name: "i", scope: !335, file: !10, line: 145, type: !13)
!335 = distinct !DILexicalBlock(scope: !330, file: !10, line: 145, column: 5)
!336 = !DILocation(line: 0, scope: !333)
!337 = !DILocation(line: 141, column: 20, scope: !338)
!338 = distinct !DILexicalBlock(scope: !339, file: !10, line: 140, column: 33)
!339 = distinct !DILexicalBlock(scope: !333, file: !10, line: 140, column: 5)
!340 = !DILocation(line: 142, column: 20, scope: !338)
!341 = !DILocation(line: 143, column: 20, scope: !338)
!342 = !DILocation(line: 0, scope: !335)
!343 = !DILocation(line: 146, column: 9, scope: !344)
!344 = distinct !DILexicalBlock(scope: !345, file: !10, line: 145, column: 33)
!345 = distinct !DILexicalBlock(scope: !335, file: !10, line: 145, column: 5)
!346 = !DILocation(line: 146, column: 52, scope: !344)
!347 = !DILocation(line: 146, column: 64, scope: !344)
!348 = !DILocation(line: 146, column: 55, scope: !344)
!349 = !DILocation(line: 146, column: 76, scope: !344)
!350 = !DILocation(line: 148, column: 1, scope: !330)
!351 = distinct !DISubprogram(name: "heap_nested_struct", scope: !10, file: !10, line: 150, type: !120, scopeLine: 150, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !352)
!352 = !{!353}
!353 = !DILocalVariable(name: "op", scope: !351, file: !10, line: 151, type: !22)
!354 = !DILocation(line: 0, scope: !351)
!355 = !DILocation(line: 157, column: 5, scope: !351)
!356 = !DILocation(line: 159, column: 1, scope: !351)
!357 = distinct !DISubprogram(name: "heap_struct_array", scope: !10, file: !10, line: 161, type: !120, scopeLine: 161, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !358)
!358 = !{!359, !360, !362}
!359 = !DILocalVariable(name: "arr", scope: !357, file: !10, line: 162, type: !8)
!360 = !DILocalVariable(name: "i", scope: !361, file: !10, line: 164, type: !13)
!361 = distinct !DILexicalBlock(scope: !357, file: !10, line: 164, column: 5)
!362 = !DILocalVariable(name: "i", scope: !363, file: !10, line: 168, type: !13)
!363 = distinct !DILexicalBlock(scope: !357, file: !10, line: 168, column: 5)
!364 = !DILocation(line: 0, scope: !357)
!365 = !DILocation(line: 0, scope: !363)
!366 = !DILocation(line: 169, column: 9, scope: !367)
!367 = distinct !DILexicalBlock(scope: !368, file: !10, line: 168, column: 33)
!368 = distinct !DILexicalBlock(scope: !363, file: !10, line: 168, column: 5)
!369 = !DILocation(line: 172, column: 1, scope: !357)
!370 = distinct !DISubprogram(name: "main", scope: !10, file: !10, line: 174, type: !371, scopeLine: 174, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!371 = !DISubroutineType(types: !372)
!372 = !{!13}
!373 = distinct !DIAssignID()
!374 = !DILocation(line: 44, column: 13, scope: !119, inlinedAt: !375)
!375 = distinct !DILocation(line: 175, column: 5, scope: !370)
!376 = !DILocation(line: 45, column: 5, scope: !119, inlinedAt: !375)
!377 = !DILocation(line: 46, column: 13, scope: !119, inlinedAt: !375)
!378 = !DILocation(line: 0, scope: !139, inlinedAt: !379)
!379 = distinct !DILocation(line: 176, column: 5, scope: !370)
!380 = !DILocation(line: 0, scope: !143, inlinedAt: !379)
!381 = !DILocation(line: 51, column: 5, scope: !143, inlinedAt: !379)
!382 = !DILocation(line: 53, column: 20, scope: !148, inlinedAt: !379)
!383 = !DILocation(line: 53, column: 17, scope: !148, inlinedAt: !379)
!384 = !DILocation(line: 51, column: 31, scope: !149, inlinedAt: !379)
!385 = !DILocation(line: 51, column: 23, scope: !149, inlinedAt: !379)
!386 = distinct !{!386, !381, !387, !159}
!387 = !DILocation(line: 55, column: 5, scope: !143, inlinedAt: !379)
!388 = !DILocation(line: 52, column: 17, scope: !148, inlinedAt: !379)
!389 = !DILocation(line: 56, column: 36, scope: !139, inlinedAt: !379)
!390 = !DILocation(line: 56, column: 5, scope: !139, inlinedAt: !379)
!391 = !DILocation(line: 0, scope: !170, inlinedAt: !392)
!392 = distinct !DILocation(line: 177, column: 5, scope: !370)
!393 = !DILocation(line: 60, column: 5, scope: !170, inlinedAt: !392)
!394 = !DILocation(line: 61, column: 20, scope: !174, inlinedAt: !392)
!395 = !DILocation(line: 61, column: 17, scope: !174, inlinedAt: !392)
!396 = !DILocation(line: 62, column: 36, scope: !174, inlinedAt: !392)
!397 = !DILocation(line: 62, column: 27, scope: !174, inlinedAt: !392)
!398 = !DILocation(line: 62, column: 19, scope: !174, inlinedAt: !392)
!399 = !DILocation(line: 62, column: 9, scope: !174, inlinedAt: !392)
!400 = !DILocation(line: 62, column: 25, scope: !174, inlinedAt: !392)
!401 = !DILocation(line: 60, column: 30, scope: !175, inlinedAt: !392)
!402 = !DILocation(line: 60, column: 23, scope: !175, inlinedAt: !392)
!403 = distinct !{!403, !393, !404, !159}
!404 = !DILocation(line: 63, column: 5, scope: !170, inlinedAt: !392)
!405 = !DILocation(line: 64, column: 5, scope: !167, inlinedAt: !392)
!406 = !DILocation(line: 0, scope: !192, inlinedAt: !407)
!407 = distinct !DILocation(line: 178, column: 5, scope: !370)
!408 = !DILocation(line: 68, column: 5, scope: !192, inlinedAt: !407)
!409 = !DILocation(line: 69, column: 17, scope: !196, inlinedAt: !407)
!410 = !DILocation(line: 70, column: 17, scope: !196, inlinedAt: !407)
!411 = !DILocation(line: 72, column: 5, scope: !189, inlinedAt: !407)
!412 = !DILocation(line: 0, scope: !204, inlinedAt: !413)
!413 = distinct !DILocation(line: 179, column: 5, scope: !370)
!414 = !DILocation(line: 76, column: 5, scope: !204, inlinedAt: !413)
!415 = !DILocation(line: 78, column: 17, scope: !208, inlinedAt: !413)
!416 = !DILocation(line: 80, column: 17, scope: !208, inlinedAt: !413)
!417 = !DILocation(line: 76, column: 31, scope: !209, inlinedAt: !413)
!418 = !DILocation(line: 76, column: 23, scope: !209, inlinedAt: !413)
!419 = distinct !{!419, !414, !420, !159}
!420 = !DILocation(line: 81, column: 5, scope: !204, inlinedAt: !413)
!421 = !DILocation(line: 0, scope: !208, inlinedAt: !413)
!422 = !DILocation(line: 82, column: 37, scope: !201, inlinedAt: !413)
!423 = !DILocation(line: 82, column: 5, scope: !201, inlinedAt: !413)
!424 = !DILocation(line: 0, scope: !219, inlinedAt: !425)
!425 = distinct !DILocation(line: 180, column: 5, scope: !370)
!426 = !DILocation(line: 86, column: 5, scope: !219, inlinedAt: !425)
!427 = !DILocation(line: 87, column: 13, scope: !219, inlinedAt: !425)
!428 = distinct !DIAssignID()
!429 = !DILocation(line: 88, column: 11, scope: !219, inlinedAt: !425)
!430 = !DILocation(line: 88, column: 13, scope: !219, inlinedAt: !425)
!431 = distinct !DIAssignID()
!432 = !DILocation(line: 89, column: 11, scope: !219, inlinedAt: !425)
!433 = !DILocation(line: 89, column: 13, scope: !219, inlinedAt: !425)
!434 = distinct !DIAssignID()
!435 = !DILocation(line: 90, column: 18, scope: !219, inlinedAt: !425)
!436 = !DILocation(line: 90, column: 5, scope: !219, inlinedAt: !425)
!437 = !DILocation(line: 91, column: 11, scope: !219, inlinedAt: !425)
!438 = !DILocation(line: 91, column: 13, scope: !219, inlinedAt: !425)
!439 = distinct !DIAssignID()
!440 = !DILocation(line: 92, column: 5, scope: !219, inlinedAt: !425)
!441 = !DILocation(line: 93, column: 1, scope: !219, inlinedAt: !425)
!442 = !DILocation(line: 96, column: 36, scope: !240, inlinedAt: !443)
!443 = distinct !DILocation(line: 181, column: 5, scope: !370)
!444 = !DILocation(line: 0, scope: !240, inlinedAt: !443)
!445 = !DILocation(line: 97, column: 10, scope: !246, inlinedAt: !443)
!446 = !DILocation(line: 97, column: 9, scope: !240, inlinedAt: !443)
!447 = !DILocation(line: 98, column: 11, scope: !240, inlinedAt: !443)
!448 = !DILocation(line: 99, column: 9, scope: !240, inlinedAt: !443)
!449 = !DILocation(line: 99, column: 11, scope: !240, inlinedAt: !443)
!450 = !DILocation(line: 100, column: 9, scope: !240, inlinedAt: !443)
!451 = !DILocation(line: 100, column: 11, scope: !240, inlinedAt: !443)
!452 = !DILocation(line: 101, column: 16, scope: !240, inlinedAt: !443)
!453 = !DILocation(line: 101, column: 5, scope: !240, inlinedAt: !443)
!454 = !DILocation(line: 102, column: 9, scope: !240, inlinedAt: !443)
!455 = !DILocation(line: 102, column: 11, scope: !240, inlinedAt: !443)
!456 = !DILocation(line: 103, column: 5, scope: !240, inlinedAt: !443)
!457 = !DILocation(line: 104, column: 5, scope: !240, inlinedAt: !443)
!458 = !DILocation(line: 105, column: 1, scope: !240, inlinedAt: !443)
!459 = !DILocation(line: 0, scope: !271, inlinedAt: !460)
!460 = distinct !DILocation(line: 182, column: 5, scope: !370)
!461 = !DILocation(line: 112, column: 5, scope: !271, inlinedAt: !460)
!462 = !DILocation(line: 116, column: 17, scope: !282, inlinedAt: !463)
!463 = distinct !DILocation(line: 183, column: 5, scope: !370)
!464 = !DILocation(line: 119, column: 19, scope: !282, inlinedAt: !463)
!465 = !DILocation(line: 0, scope: !285, inlinedAt: !463)
!466 = !DILocation(line: 120, column: 5, scope: !285, inlinedAt: !463)
!467 = !DILocation(line: 121, column: 28, scope: !295, inlinedAt: !463)
!468 = !DILocation(line: 121, column: 25, scope: !295, inlinedAt: !463)
!469 = !DILocation(line: 122, column: 28, scope: !295, inlinedAt: !463)
!470 = !DILocation(line: 122, column: 25, scope: !295, inlinedAt: !463)
!471 = !DILocation(line: 120, column: 30, scope: !296, inlinedAt: !463)
!472 = !DILocation(line: 120, column: 23, scope: !296, inlinedAt: !463)
!473 = distinct !{!473, !466, !474, !159}
!474 = !DILocation(line: 123, column: 5, scope: !285, inlinedAt: !463)
!475 = !DILocation(line: 124, column: 51, scope: !282, inlinedAt: !463)
!476 = !DILocation(line: 124, column: 5, scope: !282, inlinedAt: !463)
!477 = !DILocation(line: 128, column: 18, scope: !309, inlinedAt: !478)
!478 = distinct !DILocation(line: 184, column: 5, scope: !370)
!479 = !DILocation(line: 0, scope: !312, inlinedAt: !478)
!480 = !DILocation(line: 130, column: 29, scope: !320, inlinedAt: !478)
!481 = !DILocation(line: 0, scope: !314, inlinedAt: !478)
!482 = !DILocation(line: 134, column: 25, scope: !325, inlinedAt: !478)
!483 = !DILocation(line: 136, column: 5, scope: !309, inlinedAt: !478)
!484 = !DILocation(line: 185, column: 5, scope: !370)
!485 = !DILocation(line: 0, scope: !351, inlinedAt: !486)
!486 = distinct !DILocation(line: 186, column: 5, scope: !370)
!487 = !DILocation(line: 157, column: 5, scope: !351, inlinedAt: !486)
!488 = !DILocation(line: 0, scope: !357, inlinedAt: !489)
!489 = distinct !DILocation(line: 187, column: 5, scope: !370)
!490 = !DILocation(line: 0, scope: !363, inlinedAt: !489)
!491 = !DILocation(line: 169, column: 9, scope: !367, inlinedAt: !489)
!492 = !DILocation(line: 188, column: 5, scope: !370)
