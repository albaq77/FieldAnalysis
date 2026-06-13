; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/histogram/dfg/histogram.ll'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/histogram/hist-pthread.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%union.pthread_attr_t = type { i64, [48 x i8] }

@swap = dso_local local_unnamed_addr global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [29 x i8] c"USAGE: %s <bitmap filename>\0A\00", align 1, !dbg !45
@.str.2 = private unnamed_addr constant [59 x i8] c"Error at line\0A\09(fd = open(fname, O_RDONLY)) < 0\0ASystem Msg\00", align 1, !dbg !50
@.str.3 = private unnamed_addr constant [48 x i8] c"Error at line\0A\09fstat(fd, &finfo) < 0\0ASystem Msg\00", align 1, !dbg !55
@.str.4 = private unnamed_addr constant [115 x i8] c"Error at line\0A\09(fdata = mmap(0, finfo.st_size + 1, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0)) == NULL\0ASystem Msg\00", align 1, !dbg !60
@.str.6 = private unnamed_addr constant [32 x i8] c"Error: Invalid bitmap format - \00", align 1, !dbg !70
@.str.8 = private unnamed_addr constant [49 x i8] c"This file has %d bytes of image data, %d pixels\0A\00", align 1, !dbg !80
@.str.10 = private unnamed_addr constant [93 x i8] c"Error at line\0A\09(pid = (pthread_t *)malloc(sizeof(pthread_t) * num_procs)) == NULL\0ASystem Msg\00", align 1, !dbg !87
@.str.11 = private unnamed_addr constant [98 x i8] c"Error at line\0A\09(arg = (thread_arg_t *)malloc(sizeof(thread_arg_t)* num_procs)) == NULL\0ASystem Msg\00", align 1, !dbg !92
@.str.12 = private unnamed_addr constant [63 x i8] c"Error at line\0A\09munmap(fdata, finfo.st_size + 1) < 0\0ASystem Msg\00", align 1, !dbg !97
@.str.13 = private unnamed_addr constant [40 x i8] c"Error at line\0A\09close(fd) < 0\0ASystem Msg\00", align 1, !dbg !102
@str = private unnamed_addr constant [28 x i8] c"Starting pthreads histogram\00", align 1
@str.14 = private unnamed_addr constant [55 x i8] c"This application only accepts 24-bit pictures. Exiting\00", align 1
@str.15 = private unnamed_addr constant [41 x i8] c"File is not a valid bitmap file. Exiting\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define dso_local void @test_endianess() local_unnamed_addr #0 !dbg !115 {
    #dbg_value(i8 120, !119, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !121)
    #dbg_value(i24 1193046, !119, !DIExpression(DW_OP_LLVM_fragment, 8, 24), !121)
    #dbg_value(ptr undef, !120, !DIExpression(), !121)
  call void @__record_field_access_full(i32 0, ptr @swap, i32 1), !dbg !122
  store i32 0, ptr @swap, align 4, !dbg !122, !tbaa !125
  ret void, !dbg !129
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree nounwind
declare !dbg !130 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare !dbg !137 void @exit(i32 noundef) local_unnamed_addr #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @swap_bytes(ptr nocapture noundef %0, i32 noundef %1) local_unnamed_addr #4 !dbg !141 {
    #dbg_value(ptr %0, !145, !DIExpression(), !149)
    #dbg_value(i32 %1, !146, !DIExpression(), !149)
    #dbg_value(i32 0, !147, !DIExpression(), !149)
    #dbg_value(i32 0, !147, !DIExpression(), !149)
  %3 = icmp sgt i32 %1, 1, !dbg !150
  br i1 %3, label %4, label %39, !dbg !153

4:                                                ; preds = %2
  %5 = lshr i32 %1, 1
  %6 = zext nneg i32 %1 to i64, !dbg !153
  %7 = zext nneg i32 %5 to i64, !dbg !150
  %8 = getelementptr i8, ptr %0, i64 %6, !dbg !153
  call void @__record_field_access_full(i32 1, ptr %8, i32 0), !dbg !153
  %9 = and i64 %7, 1, !dbg !153
  %10 = icmp eq i32 %5, 1, !dbg !153
  br i1 %10, label %30, label %11, !dbg !153

11:                                               ; preds = %4
  %12 = and i64 %7, 1073741822, !dbg !153
  br label %13, !dbg !153

13:                                               ; preds = %13, %11
  %14 = phi i64 [ 0, %11 ], [ %27, %13 ]
  %15 = phi i64 [ 0, %11 ], [ %28, %13 ]
    #dbg_value(i64 %14, !147, !DIExpression(), !149)
  %16 = getelementptr inbounds i8, ptr %0, i64 %14, !dbg !154
  call void @__record_field_access_full(i32 1, ptr %16, i32 1), !dbg !154
  %17 = load i8, ptr %16, align 1, !dbg !154, !tbaa !156
    #dbg_value(i8 %17, !148, !DIExpression(), !149)
  %18 = xor i64 %14, -1, !dbg !157
  %19 = getelementptr i8, ptr %8, i64 %18, !dbg !158
  call void @__record_field_access_full(i32 1, ptr %19, i32 0), !dbg !158
  %20 = load i8, ptr %19, align 1, !dbg !158, !tbaa !156
  store i8 %20, ptr %16, align 1, !dbg !159, !tbaa !156
  store i8 %17, ptr %19, align 1, !dbg !160, !tbaa !156
  %21 = or disjoint i64 %14, 1, !dbg !161
    #dbg_value(i64 %21, !147, !DIExpression(), !149)
  %22 = getelementptr inbounds i8, ptr %0, i64 %21, !dbg !154
  call void @__record_field_access_full(i32 1, ptr %22, i32 1), !dbg !154
  %23 = load i8, ptr %22, align 1, !dbg !154, !tbaa !156
    #dbg_value(i8 %23, !148, !DIExpression(), !149)
  %24 = xor i64 %14, -2, !dbg !157
  %25 = getelementptr i8, ptr %8, i64 %24, !dbg !158
  call void @__record_field_access_full(i32 1, ptr %25, i32 0), !dbg !158
  %26 = load i8, ptr %25, align 1, !dbg !158, !tbaa !156
  store i8 %26, ptr %22, align 1, !dbg !159, !tbaa !156
  store i8 %23, ptr %25, align 1, !dbg !160, !tbaa !156
  %27 = add nuw nsw i64 %14, 2, !dbg !161
    #dbg_value(i64 %27, !147, !DIExpression(), !149)
  %28 = add i64 %15, 2, !dbg !153
  %29 = icmp eq i64 %28, %12, !dbg !153
  br i1 %29, label %30, label %13, !dbg !153, !llvm.loop !162

30:                                               ; preds = %13, %4
  %31 = phi i64 [ 0, %4 ], [ %27, %13 ]
  %32 = icmp eq i64 %9, 0, !dbg !153
  br i1 %32, label %39, label %33, !dbg !153

33:                                               ; preds = %30
    #dbg_value(i64 %31, !147, !DIExpression(), !149)
  %34 = getelementptr inbounds i8, ptr %0, i64 %31, !dbg !154
  call void @__record_field_access_full(i32 1, ptr %34, i32 1), !dbg !154
  %35 = load i8, ptr %34, align 1, !dbg !154, !tbaa !156
    #dbg_value(i8 %35, !148, !DIExpression(), !149)
  %36 = xor i64 %31, -1, !dbg !157
  %37 = getelementptr i8, ptr %8, i64 %36, !dbg !158
  call void @__record_field_access_full(i32 1, ptr %37, i32 0), !dbg !158
  %38 = load i8, ptr %37, align 1, !dbg !158, !tbaa !156
  store i8 %38, ptr %34, align 1, !dbg !159, !tbaa !156
  store i8 %35, ptr %37, align 1, !dbg !160, !tbaa !156
    #dbg_value(i64 %31, !147, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !149)
  br label %39, !dbg !165

39:                                               ; preds = %33, %30, %2
  ret void, !dbg !165
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable
define dso_local noalias noundef ptr @calc_hist(ptr nocapture noundef %0) #5 !dbg !166 {
    #dbg_value(ptr %0, !170, !DIExpression(), !179)
    #dbg_value(ptr %0, !177, !DIExpression(), !179)
  %2 = getelementptr inbounds i8, ptr %0, i64 24, !dbg !180
    #dbg_value(ptr %2, !171, !DIExpression(), !179)
  call void @__record_field_access_full(i32 1, ptr %2, i32 0), !dbg !181
  %3 = getelementptr inbounds i8, ptr %0, i64 1048, !dbg !181
    #dbg_value(ptr %3, !173, !DIExpression(), !179)
  call void @__record_field_access_full(i32 1, ptr %3, i32 0), !dbg !182
  %4 = getelementptr inbounds i8, ptr %0, i64 2072, !dbg !182
    #dbg_value(ptr %4, !174, !DIExpression(), !179)
    #dbg_value(i32 0, !176, !DIExpression(), !179)
  call void @__record_field_access_full(i32 1, ptr %4, i32 0)
  %5 = getelementptr inbounds i8, ptr %0, i64 8
  call void @__record_field_access_full(i32 2, ptr %5, i32 0)
  %6 = load i64, ptr %5, align 8, !tbaa !183
  %7 = getelementptr inbounds i8, ptr %0, i64 16
  call void @__record_field_access_full(i32 3, ptr %7, i32 0)
  %8 = load i64, ptr %7, align 8, !tbaa !187
  %9 = add nsw i64 %8, %6
  %10 = shl i64 %6, 32
  %11 = ashr exact i64 %10, 32
  %12 = icmp sgt i64 %9, %11
    #dbg_value(i32 0, !176, !DIExpression(), !179)
  br label %13, !dbg !188

13:                                               ; preds = %39, %1
  %14 = phi i32 [ 0, %1 ], [ %40, %39 ]
    #dbg_value(i32 %14, !176, !DIExpression(), !179)
    #dbg_value(i64 %6, !175, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !179)
    #dbg_value(i64 %6, !175, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !179)
  br i1 %12, label %15, label %39, !dbg !190

15:                                               ; preds = %13
  call void @__record_field_access_full(i32 4, ptr %0, i32 0)
  %16 = load ptr, ptr %0, align 8, !tbaa !194
  br label %17, !dbg !190

17:                                               ; preds = %17, %15
  %18 = phi i64 [ %11, %15 ], [ %37, %17 ]
    #dbg_value(i64 %18, !175, !DIExpression(), !179)
  %19 = getelementptr inbounds i8, ptr %16, i64 %18, !dbg !195
    #dbg_value(ptr %19, !178, !DIExpression(), !179)
  call void @__record_field_access_full(i32 1, ptr %19, i32 0), !dbg !198
  %20 = load i8, ptr %19, align 1, !dbg !198, !tbaa !156
  %21 = zext i8 %20 to i64, !dbg !199
  %22 = getelementptr inbounds i32, ptr %4, i64 %21, !dbg !199
  call void @__record_field_access_full(i32 5, ptr %22, i32 0), !dbg !200
  %23 = load i32, ptr %22, align 4, !dbg !200, !tbaa !125
  %24 = add nsw i32 %23, 1, !dbg !200
  store i32 %24, ptr %22, align 4, !dbg !200, !tbaa !125
  %25 = getelementptr i8, ptr %19, i64 1, !dbg !201
    #dbg_value(ptr %25, !178, !DIExpression(), !179)
  call void @__record_field_access_full(i32 1, ptr %25, i32 0), !dbg !202
  %26 = load i8, ptr %25, align 1, !dbg !202, !tbaa !156
  %27 = zext i8 %26 to i64, !dbg !203
  %28 = getelementptr inbounds i32, ptr %3, i64 %27, !dbg !203
  call void @__record_field_access_full(i32 5, ptr %28, i32 0), !dbg !204
  %29 = load i32, ptr %28, align 4, !dbg !204, !tbaa !125
  %30 = add nsw i32 %29, 1, !dbg !204
  store i32 %30, ptr %28, align 4, !dbg !204, !tbaa !125
  %31 = getelementptr i8, ptr %19, i64 2, !dbg !205
    #dbg_value(ptr %31, !178, !DIExpression(), !179)
  call void @__record_field_access_full(i32 1, ptr %31, i32 0), !dbg !206
  %32 = load i8, ptr %31, align 1, !dbg !206, !tbaa !156
  %33 = zext i8 %32 to i64, !dbg !207
  %34 = getelementptr inbounds i32, ptr %2, i64 %33, !dbg !207
  call void @__record_field_access_full(i32 5, ptr %34, i32 0), !dbg !208
  %35 = load i32, ptr %34, align 4, !dbg !208, !tbaa !125
  %36 = add nsw i32 %35, 1, !dbg !208
  store i32 %36, ptr %34, align 4, !dbg !208, !tbaa !125
  %37 = add nsw i64 %18, 3, !dbg !209
    #dbg_value(i64 %37, !175, !DIExpression(), !179)
  %38 = icmp sgt i64 %9, %37, !dbg !210
  br i1 %38, label %17, label %39, !dbg !190, !llvm.loop !211

39:                                               ; preds = %17, %13
  %40 = add nuw nsw i32 %14, 1, !dbg !213
    #dbg_value(i32 %40, !176, !DIExpression(), !179)
  %41 = icmp eq i32 %40, 60, !dbg !214
  br i1 %41, label %42, label %13, !dbg !188, !llvm.loop !215

42:                                               ; preds = %39
  ret ptr null, !dbg !217
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #6 !dbg !218 {
  %3 = alloca %struct.stat, align 8, !DIAssignID !292
    #dbg_assign(i1 undef, !229, !DIExpression(), !292, ptr %3, !DIExpression(), !293)
  %4 = alloca %union.pthread_attr_t, align 8, !DIAssignID !294
    #dbg_assign(i1 undef, !270, !DIExpression(), !294, ptr %4, !DIExpression(), !293)
  %5 = alloca [256 x i32], align 16, !DIAssignID !295
    #dbg_assign(i1 undef, !277, !DIExpression(), !295, ptr %5, !DIExpression(), !293)
  %6 = alloca [256 x i32], align 16, !DIAssignID !296
    #dbg_assign(i1 undef, !278, !DIExpression(), !296, ptr %6, !DIExpression(), !293)
  %7 = alloca [256 x i32], align 16, !DIAssignID !297
    #dbg_assign(i1 undef, !279, !DIExpression(), !297, ptr %7, !DIExpression(), !293)
    #dbg_value(i32 %0, !223, !DIExpression(), !293)
    #dbg_value(ptr %1, !224, !DIExpression(), !293)
  call void @llvm.lifetime.start.p0(i64 144, ptr nonnull %3) #15, !dbg !298
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %4) #15, !dbg !299
  call void @llvm.lifetime.start.p0(i64 1024, ptr nonnull %5) #15, !dbg !300
  call void @llvm.lifetime.start.p0(i64 1024, ptr nonnull %6) #15, !dbg !301
  call void @llvm.lifetime.start.p0(i64 1024, ptr nonnull %7) #15, !dbg !302
    #dbg_value(i32 4, !280, !DIExpression(), !293)
  %8 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !303
  call void @__record_field_access_full(i32 1, ptr %8, i32 0), !dbg !303
  %9 = load ptr, ptr %8, align 8, !dbg !303, !tbaa !305
  %10 = icmp eq ptr %9, null, !dbg !306
  br i1 %10, label %11, label %14, !dbg !307

11:                                               ; preds = %2
  call void @__record_field_access_full(i32 6, ptr %1, i32 0), !dbg !308
  %12 = load ptr, ptr %1, align 8, !dbg !308, !tbaa !305
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, ptr noundef %12), !dbg !310
  tail call void @exit(i32 noundef 1) #16, !dbg !311
  unreachable, !dbg !311

14:                                               ; preds = %2
    #dbg_value(ptr %9, !268, !DIExpression(), !293)
  %15 = tail call i32 (ptr, i32, ...) @open(ptr noundef nonnull %9, i32 noundef 0) #15, !dbg !312
    #dbg_value(i32 %15, !227, !DIExpression(), !293)
  %16 = icmp slt i32 %15, 0, !dbg !312
  br i1 %16, label %17, label %18, !dbg !314

17:                                               ; preds = %14
  tail call void @perror(ptr noundef nonnull @.str.2) #17, !dbg !315
  tail call void @exit(i32 noundef 1) #16, !dbg !315
  unreachable, !dbg !315

18:                                               ; preds = %14
  %19 = call i32 @fstat(i32 noundef %15, ptr noundef nonnull %3) #15, !dbg !317
  %20 = icmp slt i32 %19, 0, !dbg !317
  br i1 %20, label %21, label %22, !dbg !319

21:                                               ; preds = %18
  tail call void @perror(ptr noundef nonnull @.str.3) #17, !dbg !320
  tail call void @exit(i32 noundef 1) #16, !dbg !320
  unreachable, !dbg !320

22:                                               ; preds = %18
  %23 = getelementptr inbounds i8, ptr %3, i64 48, !dbg !322
  call void @__record_field_access_full(i32 7, ptr %23, i32 0), !dbg !322
  %24 = load i64, ptr %23, align 8, !dbg !322, !tbaa !324
  %25 = add nsw i64 %24, 1, !dbg !322
  %26 = tail call ptr @mmap(ptr noundef null, i64 noundef %25, i32 noundef 3, i32 noundef 2, i32 noundef %15, i64 noundef 0) #15, !dbg !322
    #dbg_value(ptr %26, !228, !DIExpression(), !293)
  %27 = icmp eq ptr %26, null, !dbg !322
  br i1 %27, label %28, label %29, !dbg !327

28:                                               ; preds = %22
  tail call void @perror(ptr noundef nonnull @.str.4) #17, !dbg !328
  tail call void @exit(i32 noundef 1) #16, !dbg !328
  unreachable, !dbg !328

29:                                               ; preds = %22
  %30 = load i8, ptr %26, align 1, !dbg !330, !tbaa !156
  %31 = icmp eq i8 %30, 66, !dbg !332
  br i1 %31, label %32, label %36, !dbg !333

32:                                               ; preds = %29
  %33 = getelementptr inbounds i8, ptr %26, i64 1, !dbg !334
  call void @__record_field_access_full(i32 1, ptr %33, i32 0), !dbg !334
  %34 = load i8, ptr %33, align 1, !dbg !334, !tbaa !156
  %35 = icmp eq i8 %34, 77, !dbg !335
  br i1 %35, label %38, label %36, !dbg !336

36:                                               ; preds = %32, %29
  %37 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.15), !dbg !337
  tail call void @exit(i32 noundef 1) #16, !dbg !339
  unreachable, !dbg !339

38:                                               ; preds = %32
    #dbg_value(i8 120, !119, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !340)
    #dbg_value(i24 1193046, !119, !DIExpression(DW_OP_LLVM_fragment, 8, 24), !340)
    #dbg_value(ptr undef, !120, !DIExpression(), !340)
  call void @__record_field_access_full(i32 0, ptr @swap, i32 1), !dbg !342
  store i32 0, ptr @swap, align 4, !dbg !342, !tbaa !125
  %39 = getelementptr inbounds i8, ptr %26, i64 28, !dbg !343
    #dbg_value(ptr %39, !283, !DIExpression(), !293)
  call void @__record_field_access_full(i32 1, ptr %39, i32 0), !dbg !344
  %40 = load i16, ptr %39, align 2, !dbg !344, !tbaa !346
  %41 = icmp eq i16 %40, 24, !dbg !348
  br i1 %41, label %45, label %42, !dbg !349

42:                                               ; preds = %38
  %43 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6), !dbg !350
  %44 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.14), !dbg !352
  tail call void @exit(i32 noundef 1) #16, !dbg !353
  unreachable, !dbg !353

45:                                               ; preds = %38
  %46 = getelementptr inbounds i8, ptr %26, i64 10, !dbg !354
    #dbg_value(ptr %46, !284, !DIExpression(), !293)
  call void @__record_field_access_full(i32 1, ptr %46, i32 0), !dbg !355
  %47 = load i16, ptr %46, align 2, !dbg !355, !tbaa !346
  %48 = trunc i64 %24 to i32, !dbg !356
  %49 = zext i16 %47 to i32, !dbg !357
  %50 = sub nsw i32 %48, %49, !dbg !358
    #dbg_value(i32 %50, !285, !DIExpression(), !293)
  %51 = sdiv i32 %50, 3, !dbg !359
    #dbg_value(i32 %51, !286, !DIExpression(), !293)
  %52 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.8, i32 noundef %50, i32 noundef %51), !dbg !360
  %53 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !361
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1024) %5, i8 0, i64 1024, i1 false), !dbg !362, !DIAssignID !363
    #dbg_assign(i8 0, !277, !DIExpression(), !363, ptr %5, !DIExpression(), !293)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1024) %6, i8 0, i64 1024, i1 false), !dbg !364, !DIAssignID !365
    #dbg_assign(i8 0, !278, !DIExpression(), !365, ptr %6, !DIExpression(), !293)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1024) %7, i8 0, i64 1024, i1 false), !dbg !366, !DIAssignID !367
    #dbg_assign(i8 0, !279, !DIExpression(), !367, ptr %7, !DIExpression(), !293)
  %54 = call i32 @pthread_attr_init(ptr noundef nonnull %4) #15, !dbg !368
  %55 = call i32 @pthread_attr_setscope(ptr noundef nonnull %4, i32 noundef 0) #15, !dbg !369
  %56 = sdiv i32 %50, 12, !dbg !370
    #dbg_value(i32 %56, !281, !DIExpression(), !293)
  %57 = srem i32 %51, 4, !dbg !371
    #dbg_value(i32 %57, !282, !DIExpression(), !293)
  %58 = call noalias dereferenceable_or_null(32) ptr @malloc(i64 noundef 32) #18, !dbg !372
    #dbg_value(ptr %58, !269, !DIExpression(), !293)
  %59 = icmp eq ptr %58, null, !dbg !372
  br i1 %59, label %60, label %61, !dbg !374

60:                                               ; preds = %45
  call void @perror(ptr noundef nonnull @.str.10) #17, !dbg !375
  call void @exit(i32 noundef 1) #16, !dbg !375
  unreachable, !dbg !375

61:                                               ; preds = %45
  %62 = call dereferenceable_or_null(12384) ptr @calloc(i64 1, i64 12384), !dbg !377
    #dbg_value(ptr %62, !276, !DIExpression(), !293)
  %63 = icmp eq ptr %62, null, !dbg !377
  br i1 %63, label %64, label %65, !dbg !379

64:                                               ; preds = %61
  call void @perror(ptr noundef nonnull @.str.11) #17, !dbg !380
  call void @exit(i32 noundef 1) #16, !dbg !380
  unreachable, !dbg !380

65:                                               ; preds = %61
  %66 = load i16, ptr %46, align 2, !dbg !382, !tbaa !346
  %67 = zext i16 %66 to i64, !dbg !383
    #dbg_value(i64 %67, !287, !DIExpression(), !293)
    #dbg_value(i32 0, !225, !DIExpression(), !293)
  %68 = sext i32 %56 to i64
    #dbg_value(i64 0, !225, !DIExpression(), !293)
    #dbg_value(i32 %57, !282, !DIExpression(), !293)
  call void @__record_field_access_full(i32 4, ptr %62, i32 1), !dbg !384
  store ptr %26, ptr %62, align 8, !dbg !384, !tbaa !194
  %69 = getelementptr inbounds i8, ptr %62, i64 8, !dbg !385
  call void @__record_field_access_full(i32 2, ptr %69, i32 1), !dbg !386
  store i64 %67, ptr %69, align 8, !dbg !386, !tbaa !183
    #dbg_value(i64 %68, !288, !DIExpression(), !387)
  %70 = icmp sgt i32 %57, 0, !dbg !388
  %71 = sext i1 %70 to i32, !dbg !390
  %72 = add nsw i32 %57, %71, !dbg !390
  %73 = zext i1 %70 to i64, !dbg !390
  %74 = add nsw i64 %73, %68, !dbg !390
    #dbg_value(i64 %74, !288, !DIExpression(), !387)
    #dbg_value(i32 %72, !282, !DIExpression(), !293)
  %75 = getelementptr inbounds i8, ptr %62, i64 16, !dbg !391
  call void @__record_field_access_full(i32 3, ptr %75, i32 1), !dbg !392
  %76 = mul nsw i64 %74, 3, !dbg !392
  store i64 %76, ptr %75, align 8, !dbg !392, !tbaa !187
  %77 = add nsw i64 %76, %67, !dbg !393
    #dbg_value(i64 %77, !287, !DIExpression(), !293)
  %78 = call i32 @pthread_create(ptr noundef nonnull %58, ptr noundef nonnull %4, ptr noundef nonnull @calc_hist, ptr noundef nonnull %62) #15, !dbg !394
    #dbg_value(i64 1, !225, !DIExpression(), !293)
  %79 = getelementptr inbounds i8, ptr %62, i64 3096, !dbg !395
  call void @__record_field_access_full(i32 4, ptr %79, i32 1), !dbg !384
  store ptr %26, ptr %79, align 8, !dbg !384, !tbaa !194
  %80 = getelementptr inbounds i8, ptr %62, i64 3104, !dbg !385
  call void @__record_field_access_full(i32 2, ptr %80, i32 1), !dbg !386
  store i64 %77, ptr %80, align 8, !dbg !386, !tbaa !183
    #dbg_value(i64 %68, !288, !DIExpression(), !387)
  %81 = icmp sgt i32 %72, 0, !dbg !388
  %82 = sext i1 %81 to i32, !dbg !390
  %83 = add nsw i32 %72, %82, !dbg !390
  %84 = zext i1 %81 to i64, !dbg !390
  %85 = add nsw i64 %84, %68, !dbg !390
    #dbg_value(i64 %85, !288, !DIExpression(), !387)
    #dbg_value(i32 %83, !282, !DIExpression(), !293)
  %86 = getelementptr inbounds i8, ptr %62, i64 3112, !dbg !391
  call void @__record_field_access_full(i32 3, ptr %86, i32 1), !dbg !392
  %87 = mul nsw i64 %85, 3, !dbg !392
  store i64 %87, ptr %86, align 8, !dbg !392, !tbaa !187
  %88 = add nsw i64 %87, %77, !dbg !393
    #dbg_value(i64 %88, !287, !DIExpression(), !293)
  %89 = getelementptr inbounds i8, ptr %58, i64 8, !dbg !396
  call void @__record_field_access_full(i32 1, ptr %89, i32 0), !dbg !394
  %90 = call i32 @pthread_create(ptr noundef nonnull %89, ptr noundef nonnull %4, ptr noundef nonnull @calc_hist, ptr noundef nonnull %79) #15, !dbg !394
    #dbg_value(i64 2, !225, !DIExpression(), !293)
  %91 = getelementptr inbounds i8, ptr %62, i64 6192, !dbg !395
  call void @__record_field_access_full(i32 4, ptr %91, i32 1), !dbg !384
  store ptr %26, ptr %91, align 8, !dbg !384, !tbaa !194
  %92 = getelementptr inbounds i8, ptr %62, i64 6200, !dbg !385
  call void @__record_field_access_full(i32 2, ptr %92, i32 1), !dbg !386
  store i64 %88, ptr %92, align 8, !dbg !386, !tbaa !183
    #dbg_value(i64 %68, !288, !DIExpression(), !387)
  %93 = icmp sgt i32 %83, 0, !dbg !388
  %94 = sext i1 %93 to i32, !dbg !390
  %95 = add nsw i32 %83, %94, !dbg !390
  %96 = zext i1 %93 to i64, !dbg !390
  %97 = add nsw i64 %96, %68, !dbg !390
    #dbg_value(i64 %97, !288, !DIExpression(), !387)
    #dbg_value(i32 %95, !282, !DIExpression(), !293)
  %98 = getelementptr inbounds i8, ptr %62, i64 6208, !dbg !391
  call void @__record_field_access_full(i32 3, ptr %98, i32 1), !dbg !392
  %99 = mul nsw i64 %97, 3, !dbg !392
  store i64 %99, ptr %98, align 8, !dbg !392, !tbaa !187
  %100 = add nsw i64 %99, %88, !dbg !393
    #dbg_value(i64 %100, !287, !DIExpression(), !293)
  %101 = getelementptr inbounds i8, ptr %58, i64 16, !dbg !396
  call void @__record_field_access_full(i32 1, ptr %101, i32 0), !dbg !394
  %102 = call i32 @pthread_create(ptr noundef nonnull %101, ptr noundef nonnull %4, ptr noundef nonnull @calc_hist, ptr noundef nonnull %91) #15, !dbg !394
    #dbg_value(i64 3, !225, !DIExpression(), !293)
  %103 = getelementptr inbounds i8, ptr %62, i64 9288, !dbg !395
  call void @__record_field_access_full(i32 4, ptr %103, i32 1), !dbg !384
  store ptr %26, ptr %103, align 8, !dbg !384, !tbaa !194
  %104 = getelementptr inbounds i8, ptr %62, i64 9296, !dbg !385
  call void @__record_field_access_full(i32 2, ptr %104, i32 1), !dbg !386
  store i64 %100, ptr %104, align 8, !dbg !386, !tbaa !183
    #dbg_value(i64 %68, !288, !DIExpression(), !387)
  %105 = icmp sgt i32 %95, 0, !dbg !388
  %106 = zext i1 %105 to i64, !dbg !390
  %107 = add nsw i64 %106, %68, !dbg !390
    #dbg_value(i64 %107, !288, !DIExpression(), !387)
    #dbg_value(!DIArgList(i32 %95, i1 %105), !282, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 1, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_plus, DW_OP_stack_value), !293)
  %108 = getelementptr inbounds i8, ptr %62, i64 9304, !dbg !391
  call void @__record_field_access_full(i32 3, ptr %108, i32 1), !dbg !392
  %109 = mul nsw i64 %107, 3, !dbg !392
  store i64 %109, ptr %108, align 8, !dbg !392, !tbaa !187
    #dbg_value(!DIArgList(i64 %109, i64 %100), !287, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !293)
  %110 = getelementptr inbounds i8, ptr %58, i64 24, !dbg !396
  call void @__record_field_access_full(i32 1, ptr %110, i32 0), !dbg !394
  %111 = call i32 @pthread_create(ptr noundef nonnull %110, ptr noundef nonnull %4, ptr noundef nonnull @calc_hist, ptr noundef nonnull %103) #15, !dbg !394
    #dbg_value(i64 0, !225, !DIExpression(), !293)
  call void @__record_field_access_full(i32 8, ptr %58, i32 0), !dbg !397
  %112 = load i64, ptr %58, align 8, !dbg !397, !tbaa !401
  %113 = call i32 @pthread_join(i64 noundef %112, ptr noundef null) #15, !dbg !402
    #dbg_value(i64 1, !225, !DIExpression(), !293)
  %114 = load i64, ptr %89, align 8, !dbg !397, !tbaa !401
  %115 = call i32 @pthread_join(i64 noundef %114, ptr noundef null) #15, !dbg !402
    #dbg_value(i64 2, !225, !DIExpression(), !293)
  %116 = load i64, ptr %101, align 8, !dbg !397, !tbaa !401
  %117 = call i32 @pthread_join(i64 noundef %116, ptr noundef null) #15, !dbg !402
    #dbg_value(i64 3, !225, !DIExpression(), !293)
  %118 = load i64, ptr %110, align 8, !dbg !397, !tbaa !401
  %119 = call i32 @pthread_join(i64 noundef %118, ptr noundef null) #15, !dbg !402
    #dbg_value(i64 0, !225, !DIExpression(), !293)
  %120 = getelementptr inbounds i8, ptr %62, i64 24
  call void @__record_field_access_full(i32 1, ptr %120, i32 0)
  %121 = getelementptr inbounds i8, ptr %62, i64 1048
  call void @__record_field_access_full(i32 1, ptr %121, i32 0)
  %122 = getelementptr inbounds i8, ptr %62, i64 2072
    #dbg_value(i32 0, !226, !DIExpression(), !293)
  call void @__record_field_access_full(i32 1, ptr %122, i32 0), !dbg !403
  br label %123, !dbg !403

123:                                              ; preds = %123, %65
  %124 = phi i64 [ 0, %65 ], [ %140, %123 ], !dbg !408
  %125 = getelementptr inbounds [256 x i32], ptr %120, i64 0, i64 %124, !dbg !410
  call void @__record_field_access_full(i32 5, ptr %125, i32 0), !dbg !410
  %126 = load <4 x i32>, ptr %125, align 4, !dbg !410, !tbaa !125
  %127 = getelementptr inbounds [256 x i32], ptr %5, i64 0, i64 %124, !dbg !412
  call void @__record_field_access_full(i32 5, ptr %127, i32 1), !dbg !413
  %128 = load <4 x i32>, ptr %127, align 16, !dbg !413, !tbaa !125
  %129 = add nsw <4 x i32> %128, %126, !dbg !413
  store <4 x i32> %129, ptr %127, align 16, !dbg !413, !tbaa !125
  %130 = getelementptr inbounds [256 x i32], ptr %121, i64 0, i64 %124, !dbg !414
  call void @__record_field_access_full(i32 5, ptr %130, i32 0), !dbg !414
  %131 = load <4 x i32>, ptr %130, align 4, !dbg !414, !tbaa !125
  %132 = getelementptr inbounds [256 x i32], ptr %6, i64 0, i64 %124, !dbg !415
  call void @__record_field_access_full(i32 5, ptr %132, i32 1), !dbg !416
  %133 = load <4 x i32>, ptr %132, align 16, !dbg !416, !tbaa !125
  %134 = add nsw <4 x i32> %133, %131, !dbg !416
  store <4 x i32> %134, ptr %132, align 16, !dbg !416, !tbaa !125
  %135 = getelementptr inbounds [256 x i32], ptr %122, i64 0, i64 %124, !dbg !417
  call void @__record_field_access_full(i32 5, ptr %135, i32 0), !dbg !417
  %136 = load <4 x i32>, ptr %135, align 4, !dbg !417, !tbaa !125
  %137 = getelementptr inbounds [256 x i32], ptr %7, i64 0, i64 %124, !dbg !418
  call void @__record_field_access_full(i32 5, ptr %137, i32 1), !dbg !419
  %138 = load <4 x i32>, ptr %137, align 16, !dbg !419, !tbaa !125
  %139 = add nsw <4 x i32> %138, %136, !dbg !419
  store <4 x i32> %139, ptr %137, align 16, !dbg !419, !tbaa !125
  %140 = add nuw i64 %124, 4, !dbg !408
  %141 = icmp eq i64 %140, 256, !dbg !408
  br i1 %141, label %142, label %123, !dbg !408, !llvm.loop !420

142:                                              ; preds = %123
    #dbg_value(i64 1, !225, !DIExpression(), !293)
  %143 = getelementptr inbounds i8, ptr %62, i64 3120
  call void @__record_field_access_full(i32 1, ptr %143, i32 0)
  %144 = getelementptr inbounds i8, ptr %62, i64 4144
  call void @__record_field_access_full(i32 1, ptr %144, i32 0)
  %145 = getelementptr inbounds i8, ptr %62, i64 5168
    #dbg_value(i32 0, !226, !DIExpression(), !293)
  call void @__record_field_access_full(i32 1, ptr %145, i32 0), !dbg !403
  br label %146, !dbg !403

146:                                              ; preds = %146, %142
  %147 = phi i64 [ 0, %142 ], [ %163, %146 ], !dbg !408
  %148 = getelementptr inbounds [256 x i32], ptr %143, i64 0, i64 %147, !dbg !410
  call void @__record_field_access_full(i32 5, ptr %148, i32 0), !dbg !410
  %149 = load <4 x i32>, ptr %148, align 4, !dbg !410, !tbaa !125
  %150 = getelementptr inbounds [256 x i32], ptr %5, i64 0, i64 %147, !dbg !412
  call void @__record_field_access_full(i32 5, ptr %150, i32 1), !dbg !413
  %151 = load <4 x i32>, ptr %150, align 16, !dbg !413, !tbaa !125
  %152 = add nsw <4 x i32> %151, %149, !dbg !413
  store <4 x i32> %152, ptr %150, align 16, !dbg !413, !tbaa !125
  %153 = getelementptr inbounds [256 x i32], ptr %144, i64 0, i64 %147, !dbg !414
  call void @__record_field_access_full(i32 5, ptr %153, i32 0), !dbg !414
  %154 = load <4 x i32>, ptr %153, align 4, !dbg !414, !tbaa !125
  %155 = getelementptr inbounds [256 x i32], ptr %6, i64 0, i64 %147, !dbg !415
  call void @__record_field_access_full(i32 5, ptr %155, i32 1), !dbg !416
  %156 = load <4 x i32>, ptr %155, align 16, !dbg !416, !tbaa !125
  %157 = add nsw <4 x i32> %156, %154, !dbg !416
  store <4 x i32> %157, ptr %155, align 16, !dbg !416, !tbaa !125
  %158 = getelementptr inbounds [256 x i32], ptr %145, i64 0, i64 %147, !dbg !417
  call void @__record_field_access_full(i32 5, ptr %158, i32 0), !dbg !417
  %159 = load <4 x i32>, ptr %158, align 4, !dbg !417, !tbaa !125
  %160 = getelementptr inbounds [256 x i32], ptr %7, i64 0, i64 %147, !dbg !418
  call void @__record_field_access_full(i32 5, ptr %160, i32 1), !dbg !419
  %161 = load <4 x i32>, ptr %160, align 16, !dbg !419, !tbaa !125
  %162 = add nsw <4 x i32> %161, %159, !dbg !419
  store <4 x i32> %162, ptr %160, align 16, !dbg !419, !tbaa !125
  %163 = add nuw i64 %147, 4, !dbg !408
  %164 = icmp eq i64 %163, 256, !dbg !408
  br i1 %164, label %165, label %146, !dbg !408, !llvm.loop !424

165:                                              ; preds = %146
    #dbg_value(i64 2, !225, !DIExpression(), !293)
  %166 = getelementptr inbounds i8, ptr %62, i64 6216
  call void @__record_field_access_full(i32 1, ptr %166, i32 0)
  %167 = getelementptr inbounds i8, ptr %62, i64 7240
  call void @__record_field_access_full(i32 1, ptr %167, i32 0)
  %168 = getelementptr inbounds i8, ptr %62, i64 8264
    #dbg_value(i32 0, !226, !DIExpression(), !293)
  call void @__record_field_access_full(i32 1, ptr %168, i32 0), !dbg !403
  br label %169, !dbg !403

169:                                              ; preds = %169, %165
  %170 = phi i64 [ 0, %165 ], [ %186, %169 ], !dbg !408
  %171 = getelementptr inbounds [256 x i32], ptr %166, i64 0, i64 %170, !dbg !410
  call void @__record_field_access_full(i32 5, ptr %171, i32 0), !dbg !410
  %172 = load <4 x i32>, ptr %171, align 4, !dbg !410, !tbaa !125
  %173 = getelementptr inbounds [256 x i32], ptr %5, i64 0, i64 %170, !dbg !412
  call void @__record_field_access_full(i32 5, ptr %173, i32 1), !dbg !413
  %174 = load <4 x i32>, ptr %173, align 16, !dbg !413, !tbaa !125
  %175 = add nsw <4 x i32> %174, %172, !dbg !413
  store <4 x i32> %175, ptr %173, align 16, !dbg !413, !tbaa !125
  %176 = getelementptr inbounds [256 x i32], ptr %167, i64 0, i64 %170, !dbg !414
  call void @__record_field_access_full(i32 5, ptr %176, i32 0), !dbg !414
  %177 = load <4 x i32>, ptr %176, align 4, !dbg !414, !tbaa !125
  %178 = getelementptr inbounds [256 x i32], ptr %6, i64 0, i64 %170, !dbg !415
  call void @__record_field_access_full(i32 5, ptr %178, i32 1), !dbg !416
  %179 = load <4 x i32>, ptr %178, align 16, !dbg !416, !tbaa !125
  %180 = add nsw <4 x i32> %179, %177, !dbg !416
  store <4 x i32> %180, ptr %178, align 16, !dbg !416, !tbaa !125
  %181 = getelementptr inbounds [256 x i32], ptr %168, i64 0, i64 %170, !dbg !417
  call void @__record_field_access_full(i32 5, ptr %181, i32 0), !dbg !417
  %182 = load <4 x i32>, ptr %181, align 4, !dbg !417, !tbaa !125
  %183 = getelementptr inbounds [256 x i32], ptr %7, i64 0, i64 %170, !dbg !418
  call void @__record_field_access_full(i32 5, ptr %183, i32 1), !dbg !419
  %184 = load <4 x i32>, ptr %183, align 16, !dbg !419, !tbaa !125
  %185 = add nsw <4 x i32> %184, %182, !dbg !419
  store <4 x i32> %185, ptr %183, align 16, !dbg !419, !tbaa !125
  %186 = add nuw i64 %170, 4, !dbg !408
  %187 = icmp eq i64 %186, 256, !dbg !408
  br i1 %187, label %188, label %169, !dbg !408, !llvm.loop !425

188:                                              ; preds = %169
    #dbg_value(i64 3, !225, !DIExpression(), !293)
  %189 = getelementptr inbounds i8, ptr %62, i64 9312
  call void @__record_field_access_full(i32 1, ptr %189, i32 0)
  %190 = getelementptr inbounds i8, ptr %62, i64 10336
  call void @__record_field_access_full(i32 1, ptr %190, i32 0)
  %191 = getelementptr inbounds i8, ptr %62, i64 11360
    #dbg_value(i32 0, !226, !DIExpression(), !293)
  call void @__record_field_access_full(i32 1, ptr %191, i32 0), !dbg !403
  br label %192, !dbg !403

192:                                              ; preds = %192, %188
  %193 = phi i64 [ 0, %188 ], [ %209, %192 ], !dbg !408
  %194 = getelementptr inbounds [256 x i32], ptr %189, i64 0, i64 %193, !dbg !410
  call void @__record_field_access_full(i32 5, ptr %194, i32 0), !dbg !410
  %195 = load <4 x i32>, ptr %194, align 4, !dbg !410, !tbaa !125
  %196 = getelementptr inbounds [256 x i32], ptr %5, i64 0, i64 %193, !dbg !412
  call void @__record_field_access_full(i32 5, ptr %196, i32 1), !dbg !413
  %197 = load <4 x i32>, ptr %196, align 16, !dbg !413, !tbaa !125
  %198 = add nsw <4 x i32> %197, %195, !dbg !413
  store <4 x i32> %198, ptr %196, align 16, !dbg !413, !tbaa !125
  %199 = getelementptr inbounds [256 x i32], ptr %190, i64 0, i64 %193, !dbg !414
  call void @__record_field_access_full(i32 5, ptr %199, i32 0), !dbg !414
  %200 = load <4 x i32>, ptr %199, align 4, !dbg !414, !tbaa !125
  %201 = getelementptr inbounds [256 x i32], ptr %6, i64 0, i64 %193, !dbg !415
  call void @__record_field_access_full(i32 5, ptr %201, i32 1), !dbg !416
  %202 = load <4 x i32>, ptr %201, align 16, !dbg !416, !tbaa !125
  %203 = add nsw <4 x i32> %202, %200, !dbg !416
  store <4 x i32> %203, ptr %201, align 16, !dbg !416, !tbaa !125
  %204 = getelementptr inbounds [256 x i32], ptr %191, i64 0, i64 %193, !dbg !417
  call void @__record_field_access_full(i32 5, ptr %204, i32 0), !dbg !417
  %205 = load <4 x i32>, ptr %204, align 4, !dbg !417, !tbaa !125
  %206 = getelementptr inbounds [256 x i32], ptr %7, i64 0, i64 %193, !dbg !418
  call void @__record_field_access_full(i32 5, ptr %206, i32 1), !dbg !419
  %207 = load <4 x i32>, ptr %206, align 16, !dbg !419, !tbaa !125
  %208 = add nsw <4 x i32> %207, %205, !dbg !419
  store <4 x i32> %208, ptr %206, align 16, !dbg !419, !tbaa !125
  %209 = add nuw i64 %193, 4, !dbg !408
  %210 = icmp eq i64 %209, 256, !dbg !408
  br i1 %210, label %211, label %192, !dbg !408, !llvm.loop !426

211:                                              ; preds = %192
    #dbg_value(i32 poison, !225, !DIExpression(), !293)
  %212 = call i32 @munmap(ptr noundef nonnull %26, i64 noundef %25) #15, !dbg !427
  %213 = icmp slt i32 %212, 0, !dbg !427
  br i1 %213, label %214, label %215, !dbg !429

214:                                              ; preds = %211
  call void @perror(ptr noundef nonnull @.str.12) #17, !dbg !430
  call void @exit(i32 noundef 1) #16, !dbg !430
  unreachable, !dbg !430

215:                                              ; preds = %211
  %216 = call i32 @close(i32 noundef %15) #15, !dbg !432
  %217 = icmp slt i32 %216, 0, !dbg !432
  br i1 %217, label %218, label %219, !dbg !434

218:                                              ; preds = %215
  call void @perror(ptr noundef nonnull @.str.13) #17, !dbg !435
  call void @exit(i32 noundef 1) #16, !dbg !435
  unreachable, !dbg !435

219:                                              ; preds = %215
  call void @free(ptr noundef %58) #15, !dbg !437
  %220 = call i32 @pthread_attr_destroy(ptr noundef nonnull %4) #15, !dbg !438
  call void @llvm.lifetime.end.p0(i64 1024, ptr nonnull %7) #15, !dbg !439
  call void @llvm.lifetime.end.p0(i64 1024, ptr nonnull %6) #15, !dbg !439
  call void @llvm.lifetime.end.p0(i64 1024, ptr nonnull %5) #15, !dbg !439
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %4) #15, !dbg !439
  call void @llvm.lifetime.end.p0(i64 144, ptr nonnull %3) #15, !dbg !439
  ret i32 0, !dbg !440
}

; Function Attrs: nofree
declare !dbg !441 noundef i32 @open(ptr nocapture noundef readonly, i32 noundef, ...) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare !dbg !445 void @perror(ptr nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare !dbg !448 noundef i32 @fstat(i32 noundef, ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare !dbg !453 ptr @mmap(ptr noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #9

; Function Attrs: nounwind
declare !dbg !459 i32 @pthread_attr_init(ptr noundef) local_unnamed_addr #8

; Function Attrs: nounwind
declare !dbg !463 i32 @pthread_attr_setscope(ptr noundef, i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare !dbg !466 noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #10

; Function Attrs: nounwind
declare !dbg !469 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #8

declare !dbg !478 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #11

; Function Attrs: nounwind
declare !dbg !482 i32 @munmap(ptr noundef, i64 noundef) local_unnamed_addr #8

declare !dbg !485 i32 @close(i32 noundef) local_unnamed_addr #11

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare !dbg !489 void @free(ptr allocptr nocapture noundef) local_unnamed_addr #12

; Function Attrs: nounwind
declare !dbg !492 i32 @pthread_attr_destroy(ptr noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #13

; Function Attrs: nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #14

declare void @__record_field_access(i32)

declare void @__record_field_access_full(i32, ptr, i32)

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #10 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nofree nounwind }
attributes #14 = { nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #15 = { nounwind }
attributes #16 = { noreturn nounwind }
attributes #17 = { cold }
attributes #18 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!107, !108, !109, !110, !111, !112, !113}
!llvm.ident = !{!114}
!fieldanalysis.instrumented = !{}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "swap", scope: !2, file: !16, line: 45, type: !27, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !11, globals: !39, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/histogram/hist-pthread.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/histogram", checksumkind: CSK_MD5, checksum: "9182eb86e3a452ec79c5b7abdb21335f")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 134, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10}
!9 = !DIEnumerator(name: "PTHREAD_SCOPE_SYSTEM", value: 0)
!10 = !DIEnumerator(name: "PTHREAD_SCOPE_PROCESS", value: 1)
!11 = !{!12, !14, !32, !33, !27, !35, !23, !20}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "thread_arg_t", file: !16, line: 55, baseType: !17)
!16 = !DIFile(filename: "hist-pthread.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/histogram", checksumkind: CSK_MD5, checksum: "9182eb86e3a452ec79c5b7abdb21335f")
!17 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !16, line: 47, size: 24768, elements: !18)
!18 = !{!19, !22, !24, !25, !30, !31}
!19 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !17, file: !16, line: 48, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "data_pos", scope: !17, file: !16, line: 49, baseType: !23, size: 64, offset: 64)
!23 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "data_len", scope: !17, file: !16, line: 50, baseType: !23, size: 64, offset: 128)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "red", scope: !17, file: !16, line: 51, baseType: !26, size: 8192, offset: 192)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 8192, elements: !28)
!27 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!28 = !{!29}
!29 = !DISubrange(count: 256)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "green", scope: !17, file: !16, line: 52, baseType: !26, size: 8192, offset: 8384)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "blue", scope: !17, file: !16, line: 53, baseType: !26, size: 8192, offset: 16576)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 64)
!34 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !37, line: 27, baseType: !38)
!37 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!38 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!39 = !{!40, !45, !50, !55, !60, !65, !70, !75, !80, !85, !87, !92, !97, !102, !0}
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(scope: null, file: !16, line: 72, type: !42, isLocal: true, isDefinition: true)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 304, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 38)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(scope: null, file: !16, line: 162, type: !47, isLocal: true, isDefinition: true)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 232, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 29)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(scope: null, file: !16, line: 169, type: !52, isLocal: true, isDefinition: true)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 472, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 59)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression())
!56 = distinct !DIGlobalVariable(scope: null, file: !16, line: 171, type: !57, isLocal: true, isDefinition: true)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 384, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 48)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(scope: null, file: !16, line: 173, type: !62, isLocal: true, isDefinition: true)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 920, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 115)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(scope: null, file: !16, line: 177, type: !67, isLocal: true, isDefinition: true)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 336, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 42)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(scope: null, file: !16, line: 188, type: !72, isLocal: true, isDefinition: true)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 256, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 32)
!75 = !DIGlobalVariableExpression(var: !76, expr: !DIExpression())
!76 = distinct !DIGlobalVariable(scope: null, file: !16, line: 189, type: !77, isLocal: true, isDefinition: true)
!77 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 448, elements: !78)
!78 = !{!79}
!79 = !DISubrange(count: 56)
!80 = !DIGlobalVariableExpression(var: !81, expr: !DIExpression())
!81 = distinct !DIGlobalVariable(scope: null, file: !16, line: 200, type: !82, isLocal: true, isDefinition: true)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 392, elements: !83)
!83 = !{!84}
!84 = !DISubrange(count: 49)
!85 = !DIGlobalVariableExpression(var: !86, expr: !DIExpression())
!86 = distinct !DIGlobalVariable(scope: null, file: !16, line: 203, type: !47, isLocal: true, isDefinition: true)
!87 = !DIGlobalVariableExpression(var: !88, expr: !DIExpression())
!88 = distinct !DIGlobalVariable(scope: null, file: !16, line: 218, type: !89, isLocal: true, isDefinition: true)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 744, elements: !90)
!90 = !{!91}
!91 = !DISubrange(count: 93)
!92 = !DIGlobalVariableExpression(var: !93, expr: !DIExpression())
!93 = distinct !DIGlobalVariable(scope: null, file: !16, line: 219, type: !94, isLocal: true, isDefinition: true)
!94 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 784, elements: !95)
!95 = !{!96}
!96 = !DISubrange(count: 98)
!97 = !DIGlobalVariableExpression(var: !98, expr: !DIExpression())
!98 = distinct !DIGlobalVariable(scope: null, file: !16, line: 271, type: !99, isLocal: true, isDefinition: true)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 504, elements: !100)
!100 = !{!101}
!101 = !DISubrange(count: 63)
!102 = !DIGlobalVariableExpression(var: !103, expr: !DIExpression())
!103 = distinct !DIGlobalVariable(scope: null, file: !16, line: 272, type: !104, isLocal: true, isDefinition: true)
!104 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 320, elements: !105)
!105 = !{!106}
!106 = !DISubrange(count: 40)
!107 = !{i32 7, !"Dwarf Version", i32 5}
!108 = !{i32 2, !"Debug Info Version", i32 3}
!109 = !{i32 1, !"wchar_size", i32 4}
!110 = !{i32 8, !"PIC Level", i32 2}
!111 = !{i32 7, !"PIE Level", i32 2}
!112 = !{i32 7, !"uwtable", i32 2}
!113 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!114 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!115 = distinct !DISubprogram(name: "test_endianess", scope: !16, file: !16, line: 60, type: !116, scopeLine: 60, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !118)
!116 = !DISubroutineType(types: !117)
!117 = !{null}
!118 = !{!119, !120}
!119 = !DILocalVariable(name: "num", scope: !115, file: !16, line: 61, type: !7)
!120 = !DILocalVariable(name: "low", scope: !115, file: !16, line: 62, type: !12)
!121 = !DILocation(line: 0, scope: !115)
!122 = !DILocation(line: 65, column: 12, scope: !123)
!123 = distinct !DILexicalBlock(scope: !124, file: !16, line: 63, column: 23)
!124 = distinct !DILexicalBlock(scope: !115, file: !16, line: 63, column: 8)
!125 = !{!126, !126, i64 0}
!126 = !{!"int", !127, i64 0}
!127 = !{!"omnipotent char", !128, i64 0}
!128 = !{!"Simple C/C++ TBAA"}
!129 = !DILocation(line: 75, column: 1, scope: !115)
!130 = !DISubprogram(name: "printf", scope: !131, file: !131, line: 356, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!131 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!132 = !DISubroutineType(types: !133)
!133 = !{!27, !134, null}
!134 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !135)
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!137 = !DISubprogram(name: "exit", scope: !138, file: !138, line: 624, type: !139, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!138 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!139 = !DISubroutineType(types: !140)
!140 = !{null, !27}
!141 = distinct !DISubprogram(name: "swap_bytes", scope: !16, file: !16, line: 80, type: !142, scopeLine: 80, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !144)
!142 = !DISubroutineType(types: !143)
!143 = !{null, !12, !27}
!144 = !{!145, !146, !147, !148}
!145 = !DILocalVariable(name: "bytes", arg: 1, scope: !141, file: !16, line: 80, type: !12)
!146 = !DILocalVariable(name: "num_bytes", arg: 2, scope: !141, file: !16, line: 80, type: !27)
!147 = !DILocalVariable(name: "i", scope: !141, file: !16, line: 81, type: !27)
!148 = !DILocalVariable(name: "tmp", scope: !141, file: !16, line: 82, type: !13)
!149 = !DILocation(line: 0, scope: !141)
!150 = !DILocation(line: 84, column: 18, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !16, line: 84, column: 4)
!152 = distinct !DILexicalBlock(scope: !141, file: !16, line: 84, column: 4)
!153 = !DILocation(line: 84, column: 4, scope: !152)
!154 = !DILocation(line: 86, column: 13, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !16, line: 84, column: 38)
!156 = !{!127, !127, i64 0}
!157 = !DILocation(line: 87, column: 38, scope: !155)
!158 = !DILocation(line: 87, column: 18, scope: !155)
!159 = !DILocation(line: 87, column: 16, scope: !155)
!160 = !DILocation(line: 88, column: 32, scope: !155)
!161 = !DILocation(line: 84, column: 34, scope: !151)
!162 = distinct !{!162, !153, !163, !164}
!163 = !DILocation(line: 89, column: 4, scope: !152)
!164 = !{!"llvm.loop.mustprogress"}
!165 = !DILocation(line: 90, column: 1, scope: !141)
!166 = distinct !DISubprogram(name: "calc_hist", scope: !16, file: !16, line: 96, type: !167, scopeLine: 96, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !169)
!167 = !DISubroutineType(types: !168)
!168 = !{!32, !32}
!169 = !{!170, !171, !173, !174, !175, !176, !177, !178}
!170 = !DILocalVariable(name: "arg", arg: 1, scope: !166, file: !16, line: 96, type: !32)
!171 = !DILocalVariable(name: "red", scope: !166, file: !16, line: 98, type: !172)
!172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!173 = !DILocalVariable(name: "green", scope: !166, file: !16, line: 99, type: !172)
!174 = !DILocalVariable(name: "blue", scope: !166, file: !16, line: 100, type: !172)
!175 = !DILocalVariable(name: "i", scope: !166, file: !16, line: 101, type: !27)
!176 = !DILocalVariable(name: "j", scope: !166, file: !16, line: 101, type: !27)
!177 = !DILocalVariable(name: "thread_arg", scope: !166, file: !16, line: 102, type: !14)
!178 = !DILocalVariable(name: "val", scope: !166, file: !16, line: 103, type: !20)
!179 = !DILocation(line: 0, scope: !166)
!180 = !DILocation(line: 109, column: 22, scope: !166)
!181 = !DILocation(line: 110, column: 24, scope: !166)
!182 = !DILocation(line: 111, column: 23, scope: !166)
!183 = !{!184, !186, i64 8}
!184 = !{!"", !185, i64 0, !186, i64 8, !186, i64 16, !127, i64 24, !127, i64 1048, !127, i64 2072}
!185 = !{!"any pointer", !127, i64 0}
!186 = !{!"long", !127, i64 0}
!187 = !{!184, !186, i64 16}
!188 = !DILocation(line: 115, column: 4, scope: !189)
!189 = distinct !DILexicalBlock(scope: !166, file: !16, line: 115, column: 4)
!190 = !DILocation(line: 116, column: 4, scope: !191)
!191 = distinct !DILexicalBlock(scope: !192, file: !16, line: 116, column: 4)
!192 = distinct !DILexicalBlock(scope: !193, file: !16, line: 115, column: 23)
!193 = distinct !DILexicalBlock(scope: !189, file: !16, line: 115, column: 4)
!194 = !{!184, !185, i64 0}
!195 = !DILocation(line: 120, column: 15, scope: !196)
!196 = distinct !DILexicalBlock(scope: !197, file: !16, line: 118, column: 15)
!197 = distinct !DILexicalBlock(scope: !191, file: !16, line: 116, column: 4)
!198 = !DILocation(line: 121, column: 12, scope: !196)
!199 = !DILocation(line: 121, column: 7, scope: !196)
!200 = !DILocation(line: 121, column: 17, scope: !196)
!201 = !DILocation(line: 123, column: 15, scope: !196)
!202 = !DILocation(line: 124, column: 13, scope: !196)
!203 = !DILocation(line: 124, column: 7, scope: !196)
!204 = !DILocation(line: 124, column: 18, scope: !196)
!205 = !DILocation(line: 126, column: 15, scope: !196)
!206 = !DILocation(line: 127, column: 11, scope: !196)
!207 = !DILocation(line: 127, column: 7, scope: !196)
!208 = !DILocation(line: 127, column: 16, scope: !196)
!209 = !DILocation(line: 118, column: 10, scope: !197)
!210 = !DILocation(line: 117, column: 11, scope: !197)
!211 = distinct !{!211, !190, !212, !164}
!212 = !DILocation(line: 128, column: 4, scope: !191)
!213 = !DILocation(line: 115, column: 20, scope: !193)
!214 = !DILocation(line: 115, column: 14, scope: !193)
!215 = distinct !{!215, !188, !216, !164}
!216 = !DILocation(line: 129, column: 4, scope: !189)
!217 = !DILocation(line: 135, column: 4, scope: !166)
!218 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 139, type: !219, scopeLine: 139, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !222)
!219 = !DISubroutineType(types: !220)
!220 = !{!27, !27, !221}
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!222 = !{!223, !224, !225, !226, !227, !228, !229, !268, !269, !270, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288}
!223 = !DILocalVariable(name: "argc", arg: 1, scope: !218, file: !16, line: 139, type: !27)
!224 = !DILocalVariable(name: "argv", arg: 2, scope: !218, file: !16, line: 139, type: !221)
!225 = !DILocalVariable(name: "i", scope: !218, file: !16, line: 141, type: !27)
!226 = !DILocalVariable(name: "j", scope: !218, file: !16, line: 141, type: !27)
!227 = !DILocalVariable(name: "fd", scope: !218, file: !16, line: 142, type: !27)
!228 = !DILocalVariable(name: "fdata", scope: !218, file: !16, line: 143, type: !12)
!229 = !DILocalVariable(name: "finfo", scope: !218, file: !16, line: 144, type: !230)
!230 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !231, line: 26, size: 1152, elements: !232)
!231 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_stat.h", directory: "", checksumkind: CSK_MD5, checksum: "3ba283bc334370fe631cbc82f5229ed7")
!232 = !{!233, !236, !238, !240, !242, !244, !246, !247, !248, !250, !252, !254, !262, !263, !264}
!233 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !230, file: !231, line: 31, baseType: !234, size: 64)
!234 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !235, line: 145, baseType: !38)
!235 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!236 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !230, file: !231, line: 36, baseType: !237, size: 64, offset: 64)
!237 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !235, line: 148, baseType: !38)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !230, file: !231, line: 44, baseType: !239, size: 64, offset: 128)
!239 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !235, line: 151, baseType: !38)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !230, file: !231, line: 45, baseType: !241, size: 32, offset: 192)
!241 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !235, line: 150, baseType: !7)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !230, file: !231, line: 47, baseType: !243, size: 32, offset: 224)
!243 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !235, line: 146, baseType: !7)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !230, file: !231, line: 48, baseType: !245, size: 32, offset: 256)
!245 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !235, line: 147, baseType: !7)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !230, file: !231, line: 50, baseType: !27, size: 32, offset: 288)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !230, file: !231, line: 52, baseType: !234, size: 64, offset: 320)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !230, file: !231, line: 57, baseType: !249, size: 64, offset: 384)
!249 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !235, line: 152, baseType: !23)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !230, file: !231, line: 61, baseType: !251, size: 64, offset: 448)
!251 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !235, line: 175, baseType: !23)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !230, file: !231, line: 63, baseType: !253, size: 64, offset: 512)
!253 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !235, line: 180, baseType: !23)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !230, file: !231, line: 74, baseType: !255, size: 128, offset: 576)
!255 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !256, line: 11, size: 128, elements: !257)
!256 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!257 = !{!258, !260}
!258 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !255, file: !256, line: 16, baseType: !259, size: 64)
!259 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !235, line: 160, baseType: !23)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !255, file: !256, line: 21, baseType: !261, size: 64, offset: 64)
!261 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !235, line: 197, baseType: !23)
!262 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !230, file: !231, line: 75, baseType: !255, size: 128, offset: 704)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !230, file: !231, line: 76, baseType: !255, size: 128, offset: 832)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !230, file: !231, line: 89, baseType: !265, size: 192, offset: 960)
!265 = !DICompositeType(tag: DW_TAG_array_type, baseType: !261, size: 192, elements: !266)
!266 = !{!267}
!267 = !DISubrange(count: 3)
!268 = !DILocalVariable(name: "fname", scope: !218, file: !16, line: 145, type: !12)
!269 = !DILocalVariable(name: "pid", scope: !218, file: !16, line: 146, type: !35)
!270 = !DILocalVariable(name: "attr", scope: !218, file: !16, line: 147, type: !271)
!271 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !37, line: 62, baseType: !272)
!272 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pthread_attr_t", file: !37, line: 56, size: 448, elements: !273)
!273 = !{!274, !275}
!274 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !272, file: !37, line: 58, baseType: !77, size: 448)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !272, file: !37, line: 59, baseType: !23, size: 64)
!276 = !DILocalVariable(name: "arg", scope: !218, file: !16, line: 148, type: !14)
!277 = !DILocalVariable(name: "red", scope: !218, file: !16, line: 149, type: !26)
!278 = !DILocalVariable(name: "green", scope: !218, file: !16, line: 150, type: !26)
!279 = !DILocalVariable(name: "blue", scope: !218, file: !16, line: 151, type: !26)
!280 = !DILocalVariable(name: "num_procs", scope: !218, file: !16, line: 152, type: !27)
!281 = !DILocalVariable(name: "num_per_thread", scope: !218, file: !16, line: 153, type: !27)
!282 = !DILocalVariable(name: "excess", scope: !218, file: !16, line: 154, type: !27)
!283 = !DILocalVariable(name: "bitsperpixel", scope: !218, file: !16, line: 183, type: !33)
!284 = !DILocalVariable(name: "data_pos", scope: !218, file: !16, line: 193, type: !33)
!285 = !DILocalVariable(name: "imgdata_bytes", scope: !218, file: !16, line: 198, type: !27)
!286 = !DILocalVariable(name: "num_pixels", scope: !218, file: !16, line: 199, type: !27)
!287 = !DILocalVariable(name: "curr_pos", scope: !218, file: !16, line: 224, type: !23)
!288 = !DILocalVariable(name: "tmp_data_len", scope: !289, file: !16, line: 228, type: !23)
!289 = distinct !DILexicalBlock(scope: !290, file: !16, line: 225, column: 36)
!290 = distinct !DILexicalBlock(scope: !291, file: !16, line: 225, column: 4)
!291 = distinct !DILexicalBlock(scope: !218, file: !16, line: 225, column: 4)
!292 = distinct !DIAssignID()
!293 = !DILocation(line: 0, scope: !218)
!294 = distinct !DIAssignID()
!295 = distinct !DIAssignID()
!296 = distinct !DIAssignID()
!297 = distinct !DIAssignID()
!298 = !DILocation(line: 144, column: 4, scope: !218)
!299 = !DILocation(line: 147, column: 4, scope: !218)
!300 = !DILocation(line: 149, column: 4, scope: !218)
!301 = !DILocation(line: 150, column: 4, scope: !218)
!302 = !DILocation(line: 151, column: 4, scope: !218)
!303 = !DILocation(line: 161, column: 8, scope: !304)
!304 = distinct !DILexicalBlock(scope: !218, file: !16, line: 161, column: 8)
!305 = !{!185, !185, i64 0}
!306 = !DILocation(line: 161, column: 16, scope: !304)
!307 = !DILocation(line: 161, column: 8, scope: !218)
!308 = !DILocation(line: 162, column: 47, scope: !309)
!309 = distinct !DILexicalBlock(scope: !304, file: !16, line: 161, column: 25)
!310 = !DILocation(line: 162, column: 7, scope: !309)
!311 = !DILocation(line: 163, column: 7, scope: !309)
!312 = !DILocation(line: 169, column: 4, scope: !313)
!313 = distinct !DILexicalBlock(scope: !218, file: !16, line: 169, column: 4)
!314 = !DILocation(line: 169, column: 4, scope: !218)
!315 = !DILocation(line: 169, column: 4, scope: !316)
!316 = distinct !DILexicalBlock(scope: !313, file: !16, line: 169, column: 4)
!317 = !DILocation(line: 171, column: 4, scope: !318)
!318 = distinct !DILexicalBlock(scope: !218, file: !16, line: 171, column: 4)
!319 = !DILocation(line: 171, column: 4, scope: !218)
!320 = !DILocation(line: 171, column: 4, scope: !321)
!321 = distinct !DILexicalBlock(scope: !318, file: !16, line: 171, column: 4)
!322 = !DILocation(line: 173, column: 4, scope: !323)
!323 = distinct !DILexicalBlock(scope: !218, file: !16, line: 173, column: 4)
!324 = !{!325, !186, i64 48}
!325 = !{!"stat", !186, i64 0, !186, i64 8, !186, i64 16, !126, i64 24, !126, i64 28, !126, i64 32, !126, i64 36, !186, i64 40, !186, i64 48, !186, i64 56, !186, i64 64, !326, i64 72, !326, i64 88, !326, i64 104, !127, i64 120}
!326 = !{!"timespec", !186, i64 0, !186, i64 8}
!327 = !DILocation(line: 173, column: 4, scope: !218)
!328 = !DILocation(line: 173, column: 4, scope: !329)
!329 = distinct !DILexicalBlock(scope: !323, file: !16, line: 173, column: 4)
!330 = !DILocation(line: 176, column: 9, scope: !331)
!331 = distinct !DILexicalBlock(scope: !218, file: !16, line: 176, column: 8)
!332 = !DILocation(line: 176, column: 18, scope: !331)
!333 = !DILocation(line: 176, column: 26, scope: !331)
!334 = !DILocation(line: 176, column: 30, scope: !331)
!335 = !DILocation(line: 176, column: 39, scope: !331)
!336 = !DILocation(line: 176, column: 8, scope: !218)
!337 = !DILocation(line: 177, column: 7, scope: !338)
!338 = distinct !DILexicalBlock(scope: !331, file: !16, line: 176, column: 48)
!339 = !DILocation(line: 178, column: 7, scope: !338)
!340 = !DILocation(line: 0, scope: !115, inlinedAt: !341)
!341 = distinct !DILocation(line: 181, column: 4, scope: !218)
!342 = !DILocation(line: 65, column: 12, scope: !123, inlinedAt: !341)
!343 = !DILocation(line: 183, column: 56, scope: !218)
!344 = !DILocation(line: 187, column: 8, scope: !345)
!345 = distinct !DILexicalBlock(scope: !218, file: !16, line: 187, column: 8)
!346 = !{!347, !347, i64 0}
!347 = !{!"short", !127, i64 0}
!348 = !DILocation(line: 187, column: 22, scope: !345)
!349 = !DILocation(line: 187, column: 8, scope: !218)
!350 = !DILocation(line: 188, column: 7, scope: !351)
!351 = distinct !DILexicalBlock(scope: !345, file: !16, line: 187, column: 29)
!352 = !DILocation(line: 189, column: 7, scope: !351)
!353 = !DILocation(line: 190, column: 7, scope: !351)
!354 = !DILocation(line: 193, column: 52, scope: !218)
!355 = !DILocation(line: 198, column: 51, scope: !218)
!356 = !DILocation(line: 198, column: 24, scope: !218)
!357 = !DILocation(line: 198, column: 45, scope: !218)
!358 = !DILocation(line: 198, column: 43, scope: !218)
!359 = !DILocation(line: 199, column: 63, scope: !218)
!360 = !DILocation(line: 200, column: 4, scope: !218)
!361 = !DILocation(line: 203, column: 4, scope: !218)
!362 = !DILocation(line: 206, column: 4, scope: !218)
!363 = distinct !DIAssignID()
!364 = !DILocation(line: 207, column: 4, scope: !218)
!365 = distinct !DIAssignID()
!366 = !DILocation(line: 208, column: 4, scope: !218)
!367 = distinct !DIAssignID()
!368 = !DILocation(line: 211, column: 4, scope: !218)
!369 = !DILocation(line: 212, column: 4, scope: !218)
!370 = !DILocation(line: 215, column: 32, scope: !218)
!371 = !DILocation(line: 216, column: 24, scope: !218)
!372 = !DILocation(line: 218, column: 4, scope: !373)
!373 = distinct !DILexicalBlock(scope: !218, file: !16, line: 218, column: 4)
!374 = !DILocation(line: 218, column: 4, scope: !218)
!375 = !DILocation(line: 218, column: 4, scope: !376)
!376 = distinct !DILexicalBlock(scope: !373, file: !16, line: 218, column: 4)
!377 = !DILocation(line: 219, column: 4, scope: !378)
!378 = distinct !DILexicalBlock(scope: !218, file: !16, line: 219, column: 4)
!379 = !DILocation(line: 219, column: 4, scope: !218)
!380 = !DILocation(line: 219, column: 4, scope: !381)
!381 = distinct !DILexicalBlock(scope: !378, file: !16, line: 219, column: 4)
!382 = !DILocation(line: 224, column: 27, scope: !218)
!383 = !DILocation(line: 224, column: 20, scope: !218)
!384 = !DILocation(line: 226, column: 19, scope: !289)
!385 = !DILocation(line: 227, column: 14, scope: !289)
!386 = !DILocation(line: 227, column: 23, scope: !289)
!387 = !DILocation(line: 0, scope: !289)
!388 = !DILocation(line: 229, column: 18, scope: !389)
!389 = distinct !DILexicalBlock(scope: !289, file: !16, line: 229, column: 11)
!390 = !DILocation(line: 229, column: 11, scope: !289)
!391 = !DILocation(line: 233, column: 14, scope: !289)
!392 = !DILocation(line: 235, column: 23, scope: !289)
!393 = !DILocation(line: 236, column: 16, scope: !289)
!394 = !DILocation(line: 238, column: 7, scope: !289)
!395 = !DILocation(line: 226, column: 7, scope: !289)
!396 = !DILocation(line: 238, column: 24, scope: !289)
!397 = !DILocation(line: 242, column: 20, scope: !398)
!398 = distinct !DILexicalBlock(scope: !399, file: !16, line: 241, column: 36)
!399 = distinct !DILexicalBlock(scope: !400, file: !16, line: 241, column: 4)
!400 = distinct !DILexicalBlock(scope: !218, file: !16, line: 241, column: 4)
!401 = !{!186, !186, i64 0}
!402 = !DILocation(line: 242, column: 7, scope: !398)
!403 = !DILocation(line: 246, column: 7, scope: !404)
!404 = distinct !DILexicalBlock(scope: !405, file: !16, line: 246, column: 7)
!405 = distinct !DILexicalBlock(scope: !406, file: !16, line: 245, column: 36)
!406 = distinct !DILexicalBlock(scope: !407, file: !16, line: 245, column: 4)
!407 = distinct !DILexicalBlock(scope: !218, file: !16, line: 245, column: 4)
!408 = !DILocation(line: 246, column: 29, scope: !409)
!409 = distinct !DILexicalBlock(scope: !404, file: !16, line: 246, column: 7)
!410 = !DILocation(line: 247, column: 20, scope: !411)
!411 = distinct !DILexicalBlock(scope: !409, file: !16, line: 246, column: 33)
!412 = !DILocation(line: 247, column: 10, scope: !411)
!413 = !DILocation(line: 247, column: 17, scope: !411)
!414 = !DILocation(line: 248, column: 22, scope: !411)
!415 = !DILocation(line: 248, column: 10, scope: !411)
!416 = !DILocation(line: 248, column: 19, scope: !411)
!417 = !DILocation(line: 249, column: 21, scope: !411)
!418 = !DILocation(line: 249, column: 10, scope: !411)
!419 = !DILocation(line: 249, column: 18, scope: !411)
!420 = distinct !{!420, !403, !421, !164, !422, !423}
!421 = !DILocation(line: 250, column: 7, scope: !404)
!422 = !{!"llvm.loop.isvectorized", i32 1}
!423 = !{!"llvm.loop.unroll.runtime.disable"}
!424 = distinct !{!424, !403, !421, !164, !422, !423}
!425 = distinct !{!425, !403, !421, !164, !422, !423}
!426 = distinct !{!426, !403, !421, !164, !422, !423}
!427 = !DILocation(line: 271, column: 4, scope: !428)
!428 = distinct !DILexicalBlock(scope: !218, file: !16, line: 271, column: 4)
!429 = !DILocation(line: 271, column: 4, scope: !218)
!430 = !DILocation(line: 271, column: 4, scope: !431)
!431 = distinct !DILexicalBlock(scope: !428, file: !16, line: 271, column: 4)
!432 = !DILocation(line: 272, column: 4, scope: !433)
!433 = distinct !DILexicalBlock(scope: !218, file: !16, line: 272, column: 4)
!434 = !DILocation(line: 272, column: 4, scope: !218)
!435 = !DILocation(line: 272, column: 4, scope: !436)
!436 = distinct !DILexicalBlock(scope: !433, file: !16, line: 272, column: 4)
!437 = !DILocation(line: 274, column: 4, scope: !218)
!438 = !DILocation(line: 281, column: 4, scope: !218)
!439 = !DILocation(line: 284, column: 1, scope: !218)
!440 = !DILocation(line: 283, column: 4, scope: !218)
!441 = !DISubprogram(name: "open", scope: !442, file: !442, line: 181, type: !443, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!442 = !DIFile(filename: "/usr/include/fcntl.h", directory: "", checksumkind: CSK_MD5, checksum: "1a9bb91818c37dc7bc291ca6e49fc221")
!443 = !DISubroutineType(types: !444)
!444 = !{!27, !135, !27, null}
!445 = !DISubprogram(name: "perror", scope: !131, file: !131, line: 804, type: !446, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!446 = !DISubroutineType(types: !447)
!447 = !{null, !135}
!448 = !DISubprogram(name: "fstat", scope: !449, file: !449, line: 210, type: !450, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!449 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/stat.h", directory: "", checksumkind: CSK_MD5, checksum: "1e5cd132abb12ea0c79aeae3bfa4573e")
!450 = !DISubroutineType(types: !451)
!451 = !{!27, !27, !452}
!452 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64)
!453 = !DISubprogram(name: "mmap", scope: !454, file: !454, line: 57, type: !455, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!454 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/mman.h", directory: "", checksumkind: CSK_MD5, checksum: "93a87cc3b0558893646eb0c257165272")
!455 = !DISubroutineType(types: !456)
!456 = !{!32, !32, !457, !27, !27, !27, !249}
!457 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !458, line: 18, baseType: !38)
!458 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!459 = !DISubprogram(name: "pthread_attr_init", scope: !6, file: !6, line: 285, type: !460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!460 = !DISubroutineType(types: !461)
!461 = !{!27, !462}
!462 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!463 = !DISubprogram(name: "pthread_attr_setscope", scope: !6, file: !6, line: 349, type: !464, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!464 = !DISubroutineType(types: !465)
!465 = !{!27, !462, !27}
!466 = !DISubprogram(name: "malloc", scope: !138, file: !138, line: 540, type: !467, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!467 = !DISubroutineType(types: !468)
!468 = !{!32, !457}
!469 = !DISubprogram(name: "pthread_create", scope: !6, file: !6, line: 202, type: !470, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!470 = !DISubroutineType(types: !471)
!471 = !{!27, !472, !473, !476, !477}
!472 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !35)
!473 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !474)
!474 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !475, size: 64)
!475 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !271)
!476 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!477 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !32)
!478 = !DISubprogram(name: "pthread_join", scope: !6, file: !6, line: 219, type: !479, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!479 = !DISubroutineType(types: !480)
!480 = !{!27, !36, !481}
!481 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!482 = !DISubprogram(name: "munmap", scope: !454, file: !454, line: 76, type: !483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!483 = !DISubroutineType(types: !484)
!484 = !{!27, !32, !457}
!485 = !DISubprogram(name: "close", scope: !486, file: !486, line: 358, type: !487, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!486 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "ed37c2e6f30ba31a8b41e4d70547c39c")
!487 = !DISubroutineType(types: !488)
!488 = !{!27, !27}
!489 = !DISubprogram(name: "free", scope: !138, file: !138, line: 555, type: !490, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!490 = !DISubroutineType(types: !491)
!491 = !{null, !32}
!492 = !DISubprogram(name: "pthread_attr_destroy", scope: !6, file: !6, line: 288, type: !460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
