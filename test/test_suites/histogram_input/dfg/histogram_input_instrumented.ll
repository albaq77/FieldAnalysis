; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/histogram_input/dfg/histogram_input.ll'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/histogram_input/hist-pthread.c"
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
    #dbg_assign(i1 undef, !277, !DIExpression(), !295, ptr undef, !DIExpression(), !293)
    #dbg_assign(i1 undef, !278, !DIExpression(), !296, ptr undef, !DIExpression(), !293)
    #dbg_assign(i1 undef, !279, !DIExpression(), !297, ptr undef, !DIExpression(), !293)
    #dbg_value(i32 %0, !223, !DIExpression(), !293)
    #dbg_value(ptr %1, !224, !DIExpression(), !293)
  call void @llvm.lifetime.start.p0(i64 144, ptr nonnull %3) #14, !dbg !298
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %4) #14, !dbg !299
    #dbg_value(i32 4, !280, !DIExpression(), !293)
  %5 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !300
  call void @__record_field_access_full(i32 1, ptr %5, i32 0), !dbg !300
  %6 = load ptr, ptr %5, align 8, !dbg !300, !tbaa !302
  %7 = icmp eq ptr %6, null, !dbg !303
  br i1 %7, label %8, label %11, !dbg !304

8:                                                ; preds = %2
  call void @__record_field_access_full(i32 6, ptr %1, i32 0), !dbg !305
  %9 = load ptr, ptr %1, align 8, !dbg !305, !tbaa !302
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, ptr noundef %9), !dbg !307
  tail call void @exit(i32 noundef 1) #15, !dbg !308
  unreachable, !dbg !308

11:                                               ; preds = %2
    #dbg_value(ptr %6, !268, !DIExpression(), !293)
  %12 = tail call i32 (ptr, i32, ...) @open(ptr noundef nonnull %6, i32 noundef 0) #14, !dbg !309
    #dbg_value(i32 %12, !227, !DIExpression(), !293)
  %13 = icmp slt i32 %12, 0, !dbg !309
  br i1 %13, label %14, label %15, !dbg !311

14:                                               ; preds = %11
  tail call void @perror(ptr noundef nonnull @.str.2) #16, !dbg !312
  tail call void @exit(i32 noundef 1) #15, !dbg !312
  unreachable, !dbg !312

15:                                               ; preds = %11
  %16 = call i32 @fstat(i32 noundef %12, ptr noundef nonnull %3) #14, !dbg !314
  %17 = icmp slt i32 %16, 0, !dbg !314
  br i1 %17, label %18, label %19, !dbg !316

18:                                               ; preds = %15
  tail call void @perror(ptr noundef nonnull @.str.3) #16, !dbg !317
  tail call void @exit(i32 noundef 1) #15, !dbg !317
  unreachable, !dbg !317

19:                                               ; preds = %15
  %20 = getelementptr inbounds i8, ptr %3, i64 48, !dbg !319
  call void @__record_field_access_full(i32 7, ptr %20, i32 0), !dbg !319
  %21 = load i64, ptr %20, align 8, !dbg !319, !tbaa !321
  %22 = add nsw i64 %21, 1, !dbg !319
  %23 = tail call ptr @mmap(ptr noundef null, i64 noundef %22, i32 noundef 3, i32 noundef 2, i32 noundef %12, i64 noundef 0) #14, !dbg !319
    #dbg_value(ptr %23, !228, !DIExpression(), !293)
  %24 = icmp eq ptr %23, null, !dbg !319
  br i1 %24, label %25, label %26, !dbg !324

25:                                               ; preds = %19
  tail call void @perror(ptr noundef nonnull @.str.4) #16, !dbg !325
  tail call void @exit(i32 noundef 1) #15, !dbg !325
  unreachable, !dbg !325

26:                                               ; preds = %19
  %27 = load i8, ptr %23, align 1, !dbg !327, !tbaa !156
  %28 = icmp eq i8 %27, 66, !dbg !329
  br i1 %28, label %29, label %33, !dbg !330

29:                                               ; preds = %26
  %30 = getelementptr inbounds i8, ptr %23, i64 1, !dbg !331
  call void @__record_field_access_full(i32 1, ptr %30, i32 0), !dbg !331
  %31 = load i8, ptr %30, align 1, !dbg !331, !tbaa !156
  %32 = icmp eq i8 %31, 77, !dbg !332
  br i1 %32, label %35, label %33, !dbg !333

33:                                               ; preds = %29, %26
  %34 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.15), !dbg !334
  tail call void @exit(i32 noundef 1) #15, !dbg !336
  unreachable, !dbg !336

35:                                               ; preds = %29
    #dbg_value(i8 120, !119, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !337)
    #dbg_value(i24 1193046, !119, !DIExpression(DW_OP_LLVM_fragment, 8, 24), !337)
    #dbg_value(ptr undef, !120, !DIExpression(), !337)
  call void @__record_field_access_full(i32 0, ptr @swap, i32 1), !dbg !339
  store i32 0, ptr @swap, align 4, !dbg !339, !tbaa !125
  %36 = getelementptr inbounds i8, ptr %23, i64 28, !dbg !340
    #dbg_value(ptr %36, !283, !DIExpression(), !293)
  call void @__record_field_access_full(i32 1, ptr %36, i32 0), !dbg !341
  %37 = load i16, ptr %36, align 2, !dbg !341, !tbaa !343
  %38 = icmp eq i16 %37, 24, !dbg !345
  br i1 %38, label %42, label %39, !dbg !346

39:                                               ; preds = %35
  %40 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6), !dbg !347
  %41 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.14), !dbg !349
  tail call void @exit(i32 noundef 1) #15, !dbg !350
  unreachable, !dbg !350

42:                                               ; preds = %35
  %43 = getelementptr inbounds i8, ptr %23, i64 10, !dbg !351
    #dbg_value(ptr %43, !284, !DIExpression(), !293)
  call void @__record_field_access_full(i32 1, ptr %43, i32 0), !dbg !352
  %44 = load i16, ptr %43, align 2, !dbg !352, !tbaa !343
  %45 = trunc i64 %21 to i32, !dbg !353
  %46 = zext i16 %44 to i32, !dbg !354
  %47 = sub nsw i32 %45, %46, !dbg !355
    #dbg_value(i32 %47, !285, !DIExpression(), !293)
  %48 = sdiv i32 %47, 3, !dbg !356
    #dbg_value(i32 %48, !286, !DIExpression(), !293)
  %49 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.8, i32 noundef %47, i32 noundef %48), !dbg !357
  %50 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !358
    #dbg_assign(i8 0, !277, !DIExpression(), !359, ptr undef, !DIExpression(), !293)
    #dbg_assign(i8 0, !278, !DIExpression(), !360, ptr undef, !DIExpression(), !293)
    #dbg_assign(i8 0, !279, !DIExpression(), !361, ptr undef, !DIExpression(), !293)
  %51 = call i32 @pthread_attr_init(ptr noundef nonnull %4) #14, !dbg !362
  %52 = call i32 @pthread_attr_setscope(ptr noundef nonnull %4, i32 noundef 0) #14, !dbg !363
  %53 = sdiv i32 %47, 12, !dbg !364
    #dbg_value(i32 %53, !281, !DIExpression(), !293)
  %54 = srem i32 %48, 4, !dbg !365
    #dbg_value(i32 %54, !282, !DIExpression(), !293)
  %55 = call noalias dereferenceable_or_null(32) ptr @malloc(i64 noundef 32) #17, !dbg !366
    #dbg_value(ptr %55, !269, !DIExpression(), !293)
  %56 = icmp eq ptr %55, null, !dbg !366
  br i1 %56, label %57, label %58, !dbg !368

57:                                               ; preds = %42
  call void @perror(ptr noundef nonnull @.str.10) #16, !dbg !369
  call void @exit(i32 noundef 1) #15, !dbg !369
  unreachable, !dbg !369

58:                                               ; preds = %42
  %59 = call dereferenceable_or_null(12384) ptr @calloc(i64 1, i64 12384), !dbg !371
    #dbg_value(ptr %59, !276, !DIExpression(), !293)
  %60 = icmp eq ptr %59, null, !dbg !371
  br i1 %60, label %61, label %62, !dbg !373

61:                                               ; preds = %58
  call void @perror(ptr noundef nonnull @.str.11) #16, !dbg !374
  call void @exit(i32 noundef 1) #15, !dbg !374
  unreachable, !dbg !374

62:                                               ; preds = %58
  %63 = load i16, ptr %43, align 2, !dbg !376, !tbaa !343
  %64 = zext i16 %63 to i64, !dbg !377
    #dbg_value(i64 %64, !287, !DIExpression(), !293)
    #dbg_value(i32 0, !225, !DIExpression(), !293)
  %65 = sext i32 %53 to i64
    #dbg_value(i64 0, !225, !DIExpression(), !293)
    #dbg_value(i32 %54, !282, !DIExpression(), !293)
  call void @__record_field_access_full(i32 4, ptr %59, i32 1), !dbg !378
  store ptr %23, ptr %59, align 8, !dbg !378, !tbaa !194
  %66 = getelementptr inbounds i8, ptr %59, i64 8, !dbg !379
  call void @__record_field_access_full(i32 2, ptr %66, i32 1), !dbg !380
  store i64 %64, ptr %66, align 8, !dbg !380, !tbaa !183
    #dbg_value(i64 %65, !288, !DIExpression(), !381)
  %67 = icmp sgt i32 %54, 0, !dbg !382
  %68 = sext i1 %67 to i32, !dbg !384
  %69 = add nsw i32 %54, %68, !dbg !384
  %70 = zext i1 %67 to i64, !dbg !384
  %71 = add nsw i64 %70, %65, !dbg !384
    #dbg_value(i64 %71, !288, !DIExpression(), !381)
    #dbg_value(i32 %69, !282, !DIExpression(), !293)
  %72 = getelementptr inbounds i8, ptr %59, i64 16, !dbg !385
  call void @__record_field_access_full(i32 3, ptr %72, i32 1), !dbg !386
  %73 = mul nsw i64 %71, 3, !dbg !386
  store i64 %73, ptr %72, align 8, !dbg !386, !tbaa !187
  %74 = add nsw i64 %73, %64, !dbg !387
    #dbg_value(i64 %74, !287, !DIExpression(), !293)
  %75 = call i32 @pthread_create(ptr noundef nonnull %55, ptr noundef nonnull %4, ptr noundef nonnull @calc_hist, ptr noundef nonnull %59) #14, !dbg !388
    #dbg_value(i64 1, !225, !DIExpression(), !293)
  %76 = getelementptr inbounds i8, ptr %59, i64 3096, !dbg !389
  call void @__record_field_access_full(i32 4, ptr %76, i32 1), !dbg !378
  store ptr %23, ptr %76, align 8, !dbg !378, !tbaa !194
  %77 = getelementptr inbounds i8, ptr %59, i64 3104, !dbg !379
  call void @__record_field_access_full(i32 2, ptr %77, i32 1), !dbg !380
  store i64 %74, ptr %77, align 8, !dbg !380, !tbaa !183
    #dbg_value(i64 %65, !288, !DIExpression(), !381)
  %78 = icmp sgt i32 %69, 0, !dbg !382
  %79 = sext i1 %78 to i32, !dbg !384
  %80 = add nsw i32 %69, %79, !dbg !384
  %81 = zext i1 %78 to i64, !dbg !384
  %82 = add nsw i64 %81, %65, !dbg !384
    #dbg_value(i64 %82, !288, !DIExpression(), !381)
    #dbg_value(i32 %80, !282, !DIExpression(), !293)
  %83 = getelementptr inbounds i8, ptr %59, i64 3112, !dbg !385
  call void @__record_field_access_full(i32 3, ptr %83, i32 1), !dbg !386
  %84 = mul nsw i64 %82, 3, !dbg !386
  store i64 %84, ptr %83, align 8, !dbg !386, !tbaa !187
  %85 = add nsw i64 %84, %74, !dbg !387
    #dbg_value(i64 %85, !287, !DIExpression(), !293)
  %86 = getelementptr inbounds i8, ptr %55, i64 8, !dbg !390
  call void @__record_field_access_full(i32 1, ptr %86, i32 0), !dbg !388
  %87 = call i32 @pthread_create(ptr noundef nonnull %86, ptr noundef nonnull %4, ptr noundef nonnull @calc_hist, ptr noundef nonnull %76) #14, !dbg !388
    #dbg_value(i64 2, !225, !DIExpression(), !293)
  %88 = getelementptr inbounds i8, ptr %59, i64 6192, !dbg !389
  call void @__record_field_access_full(i32 4, ptr %88, i32 1), !dbg !378
  store ptr %23, ptr %88, align 8, !dbg !378, !tbaa !194
  %89 = getelementptr inbounds i8, ptr %59, i64 6200, !dbg !379
  call void @__record_field_access_full(i32 2, ptr %89, i32 1), !dbg !380
  store i64 %85, ptr %89, align 8, !dbg !380, !tbaa !183
    #dbg_value(i64 %65, !288, !DIExpression(), !381)
  %90 = icmp sgt i32 %80, 0, !dbg !382
  %91 = sext i1 %90 to i32, !dbg !384
  %92 = add nsw i32 %80, %91, !dbg !384
  %93 = zext i1 %90 to i64, !dbg !384
  %94 = add nsw i64 %93, %65, !dbg !384
    #dbg_value(i64 %94, !288, !DIExpression(), !381)
    #dbg_value(i32 %92, !282, !DIExpression(), !293)
  %95 = getelementptr inbounds i8, ptr %59, i64 6208, !dbg !385
  call void @__record_field_access_full(i32 3, ptr %95, i32 1), !dbg !386
  %96 = mul nsw i64 %94, 3, !dbg !386
  store i64 %96, ptr %95, align 8, !dbg !386, !tbaa !187
  %97 = add nsw i64 %96, %85, !dbg !387
    #dbg_value(i64 %97, !287, !DIExpression(), !293)
  %98 = getelementptr inbounds i8, ptr %55, i64 16, !dbg !390
  call void @__record_field_access_full(i32 1, ptr %98, i32 0), !dbg !388
  %99 = call i32 @pthread_create(ptr noundef nonnull %98, ptr noundef nonnull %4, ptr noundef nonnull @calc_hist, ptr noundef nonnull %88) #14, !dbg !388
    #dbg_value(i64 3, !225, !DIExpression(), !293)
  %100 = getelementptr inbounds i8, ptr %59, i64 9288, !dbg !389
  call void @__record_field_access_full(i32 4, ptr %100, i32 1), !dbg !378
  store ptr %23, ptr %100, align 8, !dbg !378, !tbaa !194
  %101 = getelementptr inbounds i8, ptr %59, i64 9296, !dbg !379
  call void @__record_field_access_full(i32 2, ptr %101, i32 1), !dbg !380
  store i64 %97, ptr %101, align 8, !dbg !380, !tbaa !183
    #dbg_value(i64 %65, !288, !DIExpression(), !381)
  %102 = icmp sgt i32 %92, 0, !dbg !382
  %103 = zext i1 %102 to i64, !dbg !384
  %104 = add nsw i64 %103, %65, !dbg !384
    #dbg_value(i64 %104, !288, !DIExpression(), !381)
    #dbg_value(!DIArgList(i32 %92, i1 %102), !282, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 1, DW_ATE_signed, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_plus, DW_OP_stack_value), !293)
  %105 = getelementptr inbounds i8, ptr %59, i64 9304, !dbg !385
  call void @__record_field_access_full(i32 3, ptr %105, i32 1), !dbg !386
  %106 = mul nsw i64 %104, 3, !dbg !386
  store i64 %106, ptr %105, align 8, !dbg !386, !tbaa !187
    #dbg_value(!DIArgList(i64 %106, i64 %97), !287, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !293)
  %107 = getelementptr inbounds i8, ptr %55, i64 24, !dbg !390
  call void @__record_field_access_full(i32 1, ptr %107, i32 0), !dbg !388
  %108 = call i32 @pthread_create(ptr noundef nonnull %107, ptr noundef nonnull %4, ptr noundef nonnull @calc_hist, ptr noundef nonnull %100) #14, !dbg !388
    #dbg_value(i64 0, !225, !DIExpression(), !293)
  call void @__record_field_access_full(i32 8, ptr %55, i32 0), !dbg !391
  %109 = load i64, ptr %55, align 8, !dbg !391, !tbaa !395
  %110 = call i32 @pthread_join(i64 noundef %109, ptr noundef null) #14, !dbg !396
    #dbg_value(i64 1, !225, !DIExpression(), !293)
  %111 = load i64, ptr %86, align 8, !dbg !391, !tbaa !395
  %112 = call i32 @pthread_join(i64 noundef %111, ptr noundef null) #14, !dbg !396
    #dbg_value(i64 2, !225, !DIExpression(), !293)
  %113 = load i64, ptr %98, align 8, !dbg !391, !tbaa !395
  %114 = call i32 @pthread_join(i64 noundef %113, ptr noundef null) #14, !dbg !396
    #dbg_value(i64 3, !225, !DIExpression(), !293)
  %115 = load i64, ptr %107, align 8, !dbg !391, !tbaa !395
  %116 = call i32 @pthread_join(i64 noundef %115, ptr noundef null) #14, !dbg !396
    #dbg_value(i64 4, !225, !DIExpression(), !293)
  %117 = call i32 @munmap(ptr noundef nonnull %23, i64 noundef %22) #14, !dbg !397
  %118 = icmp slt i32 %117, 0, !dbg !397
  br i1 %118, label %119, label %120, !dbg !399

119:                                              ; preds = %62
  call void @perror(ptr noundef nonnull @.str.12) #16, !dbg !400
  call void @exit(i32 noundef 1) #15, !dbg !400
  unreachable, !dbg !400

120:                                              ; preds = %62
  %121 = call i32 @close(i32 noundef %12) #14, !dbg !402
  %122 = icmp slt i32 %121, 0, !dbg !402
  br i1 %122, label %123, label %124, !dbg !404

123:                                              ; preds = %120
  call void @perror(ptr noundef nonnull @.str.13) #16, !dbg !405
  call void @exit(i32 noundef 1) #15, !dbg !405
  unreachable, !dbg !405

124:                                              ; preds = %120
  call void @free(ptr noundef nonnull %55) #14, !dbg !407
  %125 = call i32 @pthread_attr_destroy(ptr noundef nonnull %4) #14, !dbg !408
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %4) #14, !dbg !409
  call void @llvm.lifetime.end.p0(i64 144, ptr nonnull %3) #14, !dbg !409
  ret i32 0, !dbg !410
}

; Function Attrs: nofree
declare !dbg !411 noundef i32 @open(ptr nocapture noundef readonly, i32 noundef, ...) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare !dbg !415 void @perror(ptr nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare !dbg !418 noundef i32 @fstat(i32 noundef, ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare !dbg !423 ptr @mmap(ptr noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: nounwind
declare !dbg !429 i32 @pthread_attr_init(ptr noundef) local_unnamed_addr #8

; Function Attrs: nounwind
declare !dbg !433 i32 @pthread_attr_setscope(ptr noundef, i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare !dbg !436 noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #9

; Function Attrs: nounwind
declare !dbg !439 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #8

declare !dbg !448 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #10

; Function Attrs: nounwind
declare !dbg !452 i32 @munmap(ptr noundef, i64 noundef) local_unnamed_addr #8

declare !dbg !455 i32 @close(i32 noundef) local_unnamed_addr #10

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare !dbg !459 void @free(ptr allocptr nocapture noundef) local_unnamed_addr #11

; Function Attrs: nounwind
declare !dbg !462 i32 @pthread_attr_destroy(ptr noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #12

; Function Attrs: nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #13

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
attributes #9 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree nounwind }
attributes #13 = { nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #14 = { nounwind }
attributes #15 = { noreturn nounwind }
attributes #16 = { cold }
attributes #17 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!107, !108, !109, !110, !111, !112, !113}
!llvm.ident = !{!114}
!fieldanalysis.instrumented = !{}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "swap", scope: !2, file: !16, line: 45, type: !27, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !11, globals: !39, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/histogram_input/hist-pthread.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/histogram_input", checksumkind: CSK_MD5, checksum: "1a17f2da216c78a660a4941c4668b801")
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
!16 = !DIFile(filename: "hist-pthread.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/histogram_input", checksumkind: CSK_MD5, checksum: "1a17f2da216c78a660a4941c4668b801")
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
!46 = distinct !DIGlobalVariable(scope: null, file: !16, line: 149, type: !47, isLocal: true, isDefinition: true)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 232, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 29)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(scope: null, file: !16, line: 156, type: !52, isLocal: true, isDefinition: true)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 472, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 59)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression())
!56 = distinct !DIGlobalVariable(scope: null, file: !16, line: 158, type: !57, isLocal: true, isDefinition: true)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 384, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 48)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(scope: null, file: !16, line: 160, type: !62, isLocal: true, isDefinition: true)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 920, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 115)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(scope: null, file: !16, line: 164, type: !67, isLocal: true, isDefinition: true)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 336, elements: !68)
!68 = !{!69}
!69 = !DISubrange(count: 42)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(scope: null, file: !16, line: 175, type: !72, isLocal: true, isDefinition: true)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 256, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 32)
!75 = !DIGlobalVariableExpression(var: !76, expr: !DIExpression())
!76 = distinct !DIGlobalVariable(scope: null, file: !16, line: 176, type: !77, isLocal: true, isDefinition: true)
!77 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 448, elements: !78)
!78 = !{!79}
!79 = !DISubrange(count: 56)
!80 = !DIGlobalVariableExpression(var: !81, expr: !DIExpression())
!81 = distinct !DIGlobalVariable(scope: null, file: !16, line: 187, type: !82, isLocal: true, isDefinition: true)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 392, elements: !83)
!83 = !{!84}
!84 = !DISubrange(count: 49)
!85 = !DIGlobalVariableExpression(var: !86, expr: !DIExpression())
!86 = distinct !DIGlobalVariable(scope: null, file: !16, line: 190, type: !47, isLocal: true, isDefinition: true)
!87 = !DIGlobalVariableExpression(var: !88, expr: !DIExpression())
!88 = distinct !DIGlobalVariable(scope: null, file: !16, line: 205, type: !89, isLocal: true, isDefinition: true)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 744, elements: !90)
!90 = !{!91}
!91 = !DISubrange(count: 93)
!92 = !DIGlobalVariableExpression(var: !93, expr: !DIExpression())
!93 = distinct !DIGlobalVariable(scope: null, file: !16, line: 206, type: !94, isLocal: true, isDefinition: true)
!94 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 784, elements: !95)
!95 = !{!96}
!96 = !DISubrange(count: 98)
!97 = !DIGlobalVariableExpression(var: !98, expr: !DIExpression())
!98 = distinct !DIGlobalVariable(scope: null, file: !16, line: 232, type: !99, isLocal: true, isDefinition: true)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 504, elements: !100)
!100 = !{!101}
!101 = !DISubrange(count: 63)
!102 = !DIGlobalVariableExpression(var: !103, expr: !DIExpression())
!103 = distinct !DIGlobalVariable(scope: null, file: !16, line: 233, type: !104, isLocal: true, isDefinition: true)
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
!180 = !DILocation(line: 104, column: 22, scope: !166)
!181 = !DILocation(line: 105, column: 24, scope: !166)
!182 = !DILocation(line: 106, column: 23, scope: !166)
!183 = !{!184, !186, i64 8}
!184 = !{!"", !185, i64 0, !186, i64 8, !186, i64 16, !127, i64 24, !127, i64 1048, !127, i64 2072}
!185 = !{!"any pointer", !127, i64 0}
!186 = !{!"long", !127, i64 0}
!187 = !{!184, !186, i64 16}
!188 = !DILocation(line: 110, column: 4, scope: !189)
!189 = distinct !DILexicalBlock(scope: !166, file: !16, line: 110, column: 4)
!190 = !DILocation(line: 111, column: 4, scope: !191)
!191 = distinct !DILexicalBlock(scope: !192, file: !16, line: 111, column: 4)
!192 = distinct !DILexicalBlock(scope: !193, file: !16, line: 110, column: 23)
!193 = distinct !DILexicalBlock(scope: !189, file: !16, line: 110, column: 4)
!194 = !{!184, !185, i64 0}
!195 = !DILocation(line: 115, column: 15, scope: !196)
!196 = distinct !DILexicalBlock(scope: !197, file: !16, line: 113, column: 15)
!197 = distinct !DILexicalBlock(scope: !191, file: !16, line: 111, column: 4)
!198 = !DILocation(line: 116, column: 12, scope: !196)
!199 = !DILocation(line: 116, column: 7, scope: !196)
!200 = !DILocation(line: 116, column: 17, scope: !196)
!201 = !DILocation(line: 118, column: 15, scope: !196)
!202 = !DILocation(line: 119, column: 13, scope: !196)
!203 = !DILocation(line: 119, column: 7, scope: !196)
!204 = !DILocation(line: 119, column: 18, scope: !196)
!205 = !DILocation(line: 121, column: 15, scope: !196)
!206 = !DILocation(line: 122, column: 11, scope: !196)
!207 = !DILocation(line: 122, column: 7, scope: !196)
!208 = !DILocation(line: 122, column: 16, scope: !196)
!209 = !DILocation(line: 113, column: 10, scope: !197)
!210 = !DILocation(line: 112, column: 11, scope: !197)
!211 = distinct !{!211, !190, !212, !164}
!212 = !DILocation(line: 123, column: 4, scope: !191)
!213 = !DILocation(line: 110, column: 20, scope: !193)
!214 = !DILocation(line: 110, column: 14, scope: !193)
!215 = distinct !{!215, !188, !216, !164}
!216 = !DILocation(line: 124, column: 4, scope: !189)
!217 = !DILocation(line: 125, column: 4, scope: !166)
!218 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 129, type: !219, scopeLine: 129, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !222)
!219 = !DISubroutineType(types: !220)
!220 = !{!27, !27, !221}
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!222 = !{!223, !224, !225, !226, !227, !228, !229, !268, !269, !270, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288}
!223 = !DILocalVariable(name: "argc", arg: 1, scope: !218, file: !16, line: 129, type: !27)
!224 = !DILocalVariable(name: "argv", arg: 2, scope: !218, file: !16, line: 129, type: !221)
!225 = !DILocalVariable(name: "i", scope: !218, file: !16, line: 131, type: !27)
!226 = !DILocalVariable(name: "j", scope: !218, file: !16, line: 131, type: !27)
!227 = !DILocalVariable(name: "fd", scope: !218, file: !16, line: 132, type: !27)
!228 = !DILocalVariable(name: "fdata", scope: !218, file: !16, line: 133, type: !12)
!229 = !DILocalVariable(name: "finfo", scope: !218, file: !16, line: 134, type: !230)
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
!268 = !DILocalVariable(name: "fname", scope: !218, file: !16, line: 135, type: !12)
!269 = !DILocalVariable(name: "pid", scope: !218, file: !16, line: 136, type: !35)
!270 = !DILocalVariable(name: "attr", scope: !218, file: !16, line: 137, type: !271)
!271 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !37, line: 62, baseType: !272)
!272 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pthread_attr_t", file: !37, line: 56, size: 448, elements: !273)
!273 = !{!274, !275}
!274 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !272, file: !37, line: 58, baseType: !77, size: 448)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !272, file: !37, line: 59, baseType: !23, size: 64)
!276 = !DILocalVariable(name: "arg", scope: !218, file: !16, line: 138, type: !14)
!277 = !DILocalVariable(name: "red", scope: !218, file: !16, line: 139, type: !26)
!278 = !DILocalVariable(name: "green", scope: !218, file: !16, line: 140, type: !26)
!279 = !DILocalVariable(name: "blue", scope: !218, file: !16, line: 141, type: !26)
!280 = !DILocalVariable(name: "num_procs", scope: !218, file: !16, line: 142, type: !27)
!281 = !DILocalVariable(name: "num_per_thread", scope: !218, file: !16, line: 143, type: !27)
!282 = !DILocalVariable(name: "excess", scope: !218, file: !16, line: 144, type: !27)
!283 = !DILocalVariable(name: "bitsperpixel", scope: !218, file: !16, line: 170, type: !33)
!284 = !DILocalVariable(name: "data_pos", scope: !218, file: !16, line: 180, type: !33)
!285 = !DILocalVariable(name: "imgdata_bytes", scope: !218, file: !16, line: 185, type: !27)
!286 = !DILocalVariable(name: "num_pixels", scope: !218, file: !16, line: 186, type: !27)
!287 = !DILocalVariable(name: "curr_pos", scope: !218, file: !16, line: 211, type: !23)
!288 = !DILocalVariable(name: "tmp_data_len", scope: !289, file: !16, line: 215, type: !23)
!289 = distinct !DILexicalBlock(scope: !290, file: !16, line: 212, column: 36)
!290 = distinct !DILexicalBlock(scope: !291, file: !16, line: 212, column: 4)
!291 = distinct !DILexicalBlock(scope: !218, file: !16, line: 212, column: 4)
!292 = distinct !DIAssignID()
!293 = !DILocation(line: 0, scope: !218)
!294 = distinct !DIAssignID()
!295 = distinct !DIAssignID()
!296 = distinct !DIAssignID()
!297 = distinct !DIAssignID()
!298 = !DILocation(line: 134, column: 4, scope: !218)
!299 = !DILocation(line: 137, column: 4, scope: !218)
!300 = !DILocation(line: 148, column: 8, scope: !301)
!301 = distinct !DILexicalBlock(scope: !218, file: !16, line: 148, column: 8)
!302 = !{!185, !185, i64 0}
!303 = !DILocation(line: 148, column: 16, scope: !301)
!304 = !DILocation(line: 148, column: 8, scope: !218)
!305 = !DILocation(line: 149, column: 47, scope: !306)
!306 = distinct !DILexicalBlock(scope: !301, file: !16, line: 148, column: 25)
!307 = !DILocation(line: 149, column: 7, scope: !306)
!308 = !DILocation(line: 150, column: 7, scope: !306)
!309 = !DILocation(line: 156, column: 4, scope: !310)
!310 = distinct !DILexicalBlock(scope: !218, file: !16, line: 156, column: 4)
!311 = !DILocation(line: 156, column: 4, scope: !218)
!312 = !DILocation(line: 156, column: 4, scope: !313)
!313 = distinct !DILexicalBlock(scope: !310, file: !16, line: 156, column: 4)
!314 = !DILocation(line: 158, column: 4, scope: !315)
!315 = distinct !DILexicalBlock(scope: !218, file: !16, line: 158, column: 4)
!316 = !DILocation(line: 158, column: 4, scope: !218)
!317 = !DILocation(line: 158, column: 4, scope: !318)
!318 = distinct !DILexicalBlock(scope: !315, file: !16, line: 158, column: 4)
!319 = !DILocation(line: 160, column: 4, scope: !320)
!320 = distinct !DILexicalBlock(scope: !218, file: !16, line: 160, column: 4)
!321 = !{!322, !186, i64 48}
!322 = !{!"stat", !186, i64 0, !186, i64 8, !186, i64 16, !126, i64 24, !126, i64 28, !126, i64 32, !126, i64 36, !186, i64 40, !186, i64 48, !186, i64 56, !186, i64 64, !323, i64 72, !323, i64 88, !323, i64 104, !127, i64 120}
!323 = !{!"timespec", !186, i64 0, !186, i64 8}
!324 = !DILocation(line: 160, column: 4, scope: !218)
!325 = !DILocation(line: 160, column: 4, scope: !326)
!326 = distinct !DILexicalBlock(scope: !320, file: !16, line: 160, column: 4)
!327 = !DILocation(line: 163, column: 9, scope: !328)
!328 = distinct !DILexicalBlock(scope: !218, file: !16, line: 163, column: 8)
!329 = !DILocation(line: 163, column: 18, scope: !328)
!330 = !DILocation(line: 163, column: 26, scope: !328)
!331 = !DILocation(line: 163, column: 30, scope: !328)
!332 = !DILocation(line: 163, column: 39, scope: !328)
!333 = !DILocation(line: 163, column: 8, scope: !218)
!334 = !DILocation(line: 164, column: 7, scope: !335)
!335 = distinct !DILexicalBlock(scope: !328, file: !16, line: 163, column: 48)
!336 = !DILocation(line: 165, column: 7, scope: !335)
!337 = !DILocation(line: 0, scope: !115, inlinedAt: !338)
!338 = distinct !DILocation(line: 168, column: 4, scope: !218)
!339 = !DILocation(line: 65, column: 12, scope: !123, inlinedAt: !338)
!340 = !DILocation(line: 170, column: 56, scope: !218)
!341 = !DILocation(line: 174, column: 8, scope: !342)
!342 = distinct !DILexicalBlock(scope: !218, file: !16, line: 174, column: 8)
!343 = !{!344, !344, i64 0}
!344 = !{!"short", !127, i64 0}
!345 = !DILocation(line: 174, column: 22, scope: !342)
!346 = !DILocation(line: 174, column: 8, scope: !218)
!347 = !DILocation(line: 175, column: 7, scope: !348)
!348 = distinct !DILexicalBlock(scope: !342, file: !16, line: 174, column: 29)
!349 = !DILocation(line: 176, column: 7, scope: !348)
!350 = !DILocation(line: 177, column: 7, scope: !348)
!351 = !DILocation(line: 180, column: 52, scope: !218)
!352 = !DILocation(line: 185, column: 51, scope: !218)
!353 = !DILocation(line: 185, column: 24, scope: !218)
!354 = !DILocation(line: 185, column: 45, scope: !218)
!355 = !DILocation(line: 185, column: 43, scope: !218)
!356 = !DILocation(line: 186, column: 63, scope: !218)
!357 = !DILocation(line: 187, column: 4, scope: !218)
!358 = !DILocation(line: 190, column: 4, scope: !218)
!359 = distinct !DIAssignID()
!360 = distinct !DIAssignID()
!361 = distinct !DIAssignID()
!362 = !DILocation(line: 198, column: 4, scope: !218)
!363 = !DILocation(line: 199, column: 4, scope: !218)
!364 = !DILocation(line: 202, column: 32, scope: !218)
!365 = !DILocation(line: 203, column: 24, scope: !218)
!366 = !DILocation(line: 205, column: 4, scope: !367)
!367 = distinct !DILexicalBlock(scope: !218, file: !16, line: 205, column: 4)
!368 = !DILocation(line: 205, column: 4, scope: !218)
!369 = !DILocation(line: 205, column: 4, scope: !370)
!370 = distinct !DILexicalBlock(scope: !367, file: !16, line: 205, column: 4)
!371 = !DILocation(line: 206, column: 4, scope: !372)
!372 = distinct !DILexicalBlock(scope: !218, file: !16, line: 206, column: 4)
!373 = !DILocation(line: 206, column: 4, scope: !218)
!374 = !DILocation(line: 206, column: 4, scope: !375)
!375 = distinct !DILexicalBlock(scope: !372, file: !16, line: 206, column: 4)
!376 = !DILocation(line: 211, column: 27, scope: !218)
!377 = !DILocation(line: 211, column: 20, scope: !218)
!378 = !DILocation(line: 213, column: 19, scope: !289)
!379 = !DILocation(line: 214, column: 14, scope: !289)
!380 = !DILocation(line: 214, column: 23, scope: !289)
!381 = !DILocation(line: 0, scope: !289)
!382 = !DILocation(line: 216, column: 18, scope: !383)
!383 = distinct !DILexicalBlock(scope: !289, file: !16, line: 216, column: 11)
!384 = !DILocation(line: 216, column: 11, scope: !289)
!385 = !DILocation(line: 220, column: 14, scope: !289)
!386 = !DILocation(line: 222, column: 23, scope: !289)
!387 = !DILocation(line: 223, column: 16, scope: !289)
!388 = !DILocation(line: 225, column: 7, scope: !289)
!389 = !DILocation(line: 213, column: 7, scope: !289)
!390 = !DILocation(line: 225, column: 24, scope: !289)
!391 = !DILocation(line: 229, column: 20, scope: !392)
!392 = distinct !DILexicalBlock(scope: !393, file: !16, line: 228, column: 36)
!393 = distinct !DILexicalBlock(scope: !394, file: !16, line: 228, column: 4)
!394 = distinct !DILexicalBlock(scope: !218, file: !16, line: 228, column: 4)
!395 = !{!186, !186, i64 0}
!396 = !DILocation(line: 229, column: 7, scope: !392)
!397 = !DILocation(line: 232, column: 4, scope: !398)
!398 = distinct !DILexicalBlock(scope: !218, file: !16, line: 232, column: 4)
!399 = !DILocation(line: 232, column: 4, scope: !218)
!400 = !DILocation(line: 232, column: 4, scope: !401)
!401 = distinct !DILexicalBlock(scope: !398, file: !16, line: 232, column: 4)
!402 = !DILocation(line: 233, column: 4, scope: !403)
!403 = distinct !DILexicalBlock(scope: !218, file: !16, line: 233, column: 4)
!404 = !DILocation(line: 233, column: 4, scope: !218)
!405 = !DILocation(line: 233, column: 4, scope: !406)
!406 = distinct !DILexicalBlock(scope: !403, file: !16, line: 233, column: 4)
!407 = !DILocation(line: 235, column: 4, scope: !218)
!408 = !DILocation(line: 236, column: 4, scope: !218)
!409 = !DILocation(line: 239, column: 1, scope: !218)
!410 = !DILocation(line: 238, column: 4, scope: !218)
!411 = !DISubprogram(name: "open", scope: !412, file: !412, line: 181, type: !413, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!412 = !DIFile(filename: "/usr/include/fcntl.h", directory: "", checksumkind: CSK_MD5, checksum: "1a9bb91818c37dc7bc291ca6e49fc221")
!413 = !DISubroutineType(types: !414)
!414 = !{!27, !135, !27, null}
!415 = !DISubprogram(name: "perror", scope: !131, file: !131, line: 804, type: !416, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!416 = !DISubroutineType(types: !417)
!417 = !{null, !135}
!418 = !DISubprogram(name: "fstat", scope: !419, file: !419, line: 210, type: !420, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!419 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/stat.h", directory: "", checksumkind: CSK_MD5, checksum: "1e5cd132abb12ea0c79aeae3bfa4573e")
!420 = !DISubroutineType(types: !421)
!421 = !{!27, !27, !422}
!422 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64)
!423 = !DISubprogram(name: "mmap", scope: !424, file: !424, line: 57, type: !425, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!424 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/mman.h", directory: "", checksumkind: CSK_MD5, checksum: "93a87cc3b0558893646eb0c257165272")
!425 = !DISubroutineType(types: !426)
!426 = !{!32, !32, !427, !27, !27, !27, !249}
!427 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !428, line: 18, baseType: !38)
!428 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!429 = !DISubprogram(name: "pthread_attr_init", scope: !6, file: !6, line: 285, type: !430, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!430 = !DISubroutineType(types: !431)
!431 = !{!27, !432}
!432 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !271, size: 64)
!433 = !DISubprogram(name: "pthread_attr_setscope", scope: !6, file: !6, line: 349, type: !434, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!434 = !DISubroutineType(types: !435)
!435 = !{!27, !432, !27}
!436 = !DISubprogram(name: "malloc", scope: !138, file: !138, line: 540, type: !437, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!437 = !DISubroutineType(types: !438)
!438 = !{!32, !427}
!439 = !DISubprogram(name: "pthread_create", scope: !6, file: !6, line: 202, type: !440, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!440 = !DISubroutineType(types: !441)
!441 = !{!27, !442, !443, !446, !447}
!442 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !35)
!443 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !444)
!444 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !445, size: 64)
!445 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !271)
!446 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!447 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !32)
!448 = !DISubprogram(name: "pthread_join", scope: !6, file: !6, line: 219, type: !449, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!449 = !DISubroutineType(types: !450)
!450 = !{!27, !36, !451}
!451 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!452 = !DISubprogram(name: "munmap", scope: !424, file: !424, line: 76, type: !453, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!453 = !DISubroutineType(types: !454)
!454 = !{!27, !32, !427}
!455 = !DISubprogram(name: "close", scope: !456, file: !456, line: 358, type: !457, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!456 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "ed37c2e6f30ba31a8b41e4d70547c39c")
!457 = !DISubroutineType(types: !458)
!458 = !{!27, !27}
!459 = !DISubprogram(name: "free", scope: !138, file: !138, line: 555, type: !460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!460 = !DISubroutineType(types: !461)
!461 = !{null, !32}
!462 = !DISubprogram(name: "pthread_attr_destroy", scope: !6, file: !6, line: 288, type: !430, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
