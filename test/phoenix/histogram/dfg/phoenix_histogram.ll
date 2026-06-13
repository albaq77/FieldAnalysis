; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/histogram/hist-pthread.c'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/histogram/hist-pthread.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%union.pthread_attr_t = type { i64, [48 x i8] }
%struct.thread_arg_t = type { ptr, i64, i64, [256 x i32], [256 x i32], [256 x i32] }

@swap = dso_local local_unnamed_addr global i32 0, align 4, !dbg !0
@.str.1 = private unnamed_addr constant [29 x i8] c"USAGE: %s <bitmap filename>\0A\00", align 1, !dbg !265
@.str.2 = private unnamed_addr constant [59 x i8] c"Error at line\0A\09(fd = open(fname, O_RDONLY)) < 0\0ASystem Msg\00", align 1, !dbg !270
@.str.3 = private unnamed_addr constant [48 x i8] c"Error at line\0A\09fstat(fd, &finfo) < 0\0ASystem Msg\00", align 1, !dbg !275
@.str.4 = private unnamed_addr constant [115 x i8] c"Error at line\0A\09(fdata = mmap(0, finfo.st_size + 1, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0)) == NULL\0ASystem Msg\00", align 1, !dbg !280
@.str.6 = private unnamed_addr constant [32 x i8] c"Error: Invalid bitmap format - \00", align 1, !dbg !290
@.str.8 = private unnamed_addr constant [49 x i8] c"This file has %d bytes of image data, %d pixels\0A\00", align 1, !dbg !300
@.str.10 = private unnamed_addr constant [75 x i8] c"Error at line\0A\09(num_procs = sysconf(_SC_NPROCESSORS_ONLN)) <= 0\0ASystem Msg\00", align 1, !dbg !307
@.str.11 = private unnamed_addr constant [93 x i8] c"Error at line\0A\09(pid = (pthread_t *)malloc(sizeof(pthread_t) * num_procs)) == NULL\0ASystem Msg\00", align 1, !dbg !312
@.str.12 = private unnamed_addr constant [98 x i8] c"Error at line\0A\09(arg = (thread_arg_t *)calloc(sizeof(thread_arg_t), num_procs)) == NULL\0ASystem Msg\00", align 1, !dbg !317
@.str.13 = private unnamed_addr constant [63 x i8] c"Error at line\0A\09munmap(fdata, finfo.st_size + 1) < 0\0ASystem Msg\00", align 1, !dbg !322
@.str.14 = private unnamed_addr constant [40 x i8] c"Error at line\0A\09close(fd) < 0\0ASystem Msg\00", align 1, !dbg !327
@str = private unnamed_addr constant [28 x i8] c"Starting pthreads histogram\00", align 1
@str.15 = private unnamed_addr constant [55 x i8] c"This application only accepts 24-bit pictures. Exiting\00", align 1
@str.16 = private unnamed_addr constant [41 x i8] c"File is not a valid bitmap file. Exiting\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable
define dso_local void @test_endianess() local_unnamed_addr #0 !dbg !340 {
    #dbg_value(i8 120, !344, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !346)
    #dbg_value(i24 1193046, !344, !DIExpression(DW_OP_LLVM_fragment, 8, 24), !346)
    #dbg_value(ptr undef, !345, !DIExpression(), !346)
  store i32 0, ptr @swap, align 4, !dbg !347, !tbaa !350
  ret void, !dbg !354
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree nounwind
declare !dbg !355 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
declare !dbg !362 void @exit(i32 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @swap_bytes(ptr nocapture noundef %0, i32 noundef %1) local_unnamed_addr #4 !dbg !366 {
    #dbg_value(ptr %0, !370, !DIExpression(), !374)
    #dbg_value(i32 %1, !371, !DIExpression(), !374)
    #dbg_value(i32 0, !372, !DIExpression(), !374)
    #dbg_value(i32 0, !372, !DIExpression(), !374)
  %3 = icmp sgt i32 %1, 1, !dbg !375
  br i1 %3, label %4, label %39, !dbg !378

4:                                                ; preds = %2
  %5 = lshr i32 %1, 1
  %6 = zext nneg i32 %1 to i64, !dbg !378
  %7 = zext nneg i32 %5 to i64, !dbg !375
  %8 = getelementptr i8, ptr %0, i64 %6, !dbg !378
  %9 = and i64 %7, 1, !dbg !378
  %10 = icmp eq i32 %5, 1, !dbg !378
  br i1 %10, label %30, label %11, !dbg !378

11:                                               ; preds = %4
  %12 = and i64 %7, 1073741822, !dbg !378
  br label %13, !dbg !378

13:                                               ; preds = %13, %11
  %14 = phi i64 [ 0, %11 ], [ %27, %13 ]
  %15 = phi i64 [ 0, %11 ], [ %28, %13 ]
    #dbg_value(i64 %14, !372, !DIExpression(), !374)
  %16 = getelementptr inbounds i8, ptr %0, i64 %14, !dbg !379
  %17 = load i8, ptr %16, align 1, !dbg !379, !tbaa !381
    #dbg_value(i8 %17, !373, !DIExpression(), !374)
  %18 = xor i64 %14, -1, !dbg !382
  %19 = getelementptr i8, ptr %8, i64 %18, !dbg !383
  %20 = load i8, ptr %19, align 1, !dbg !383, !tbaa !381
  store i8 %20, ptr %16, align 1, !dbg !384, !tbaa !381
  store i8 %17, ptr %19, align 1, !dbg !385, !tbaa !381
  %21 = or disjoint i64 %14, 1, !dbg !386
    #dbg_value(i64 %21, !372, !DIExpression(), !374)
  %22 = getelementptr inbounds i8, ptr %0, i64 %21, !dbg !379
  %23 = load i8, ptr %22, align 1, !dbg !379, !tbaa !381
    #dbg_value(i8 %23, !373, !DIExpression(), !374)
  %24 = xor i64 %14, -2, !dbg !382
  %25 = getelementptr i8, ptr %8, i64 %24, !dbg !383
  %26 = load i8, ptr %25, align 1, !dbg !383, !tbaa !381
  store i8 %26, ptr %22, align 1, !dbg !384, !tbaa !381
  store i8 %23, ptr %25, align 1, !dbg !385, !tbaa !381
  %27 = add nuw nsw i64 %14, 2, !dbg !386
    #dbg_value(i64 %27, !372, !DIExpression(), !374)
  %28 = add i64 %15, 2, !dbg !378
  %29 = icmp eq i64 %28, %12, !dbg !378
  br i1 %29, label %30, label %13, !dbg !378, !llvm.loop !387

30:                                               ; preds = %13, %4
  %31 = phi i64 [ 0, %4 ], [ %27, %13 ]
  %32 = icmp eq i64 %9, 0, !dbg !378
  br i1 %32, label %39, label %33, !dbg !378

33:                                               ; preds = %30
    #dbg_value(i64 %31, !372, !DIExpression(), !374)
  %34 = getelementptr inbounds i8, ptr %0, i64 %31, !dbg !379
  %35 = load i8, ptr %34, align 1, !dbg !379, !tbaa !381
    #dbg_value(i8 %35, !373, !DIExpression(), !374)
  %36 = xor i64 %31, -1, !dbg !382
  %37 = getelementptr i8, ptr %8, i64 %36, !dbg !383
  %38 = load i8, ptr %37, align 1, !dbg !383, !tbaa !381
  store i8 %38, ptr %34, align 1, !dbg !384, !tbaa !381
  store i8 %35, ptr %37, align 1, !dbg !385, !tbaa !381
    #dbg_value(i64 %31, !372, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !374)
  br label %39, !dbg !390

39:                                               ; preds = %33, %30, %2
  ret void, !dbg !390
}

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable
define dso_local noalias noundef ptr @calc_hist(ptr nocapture noundef %0) #5 !dbg !391 {
    #dbg_value(ptr %0, !395, !DIExpression(), !403)
    #dbg_value(ptr %0, !401, !DIExpression(), !403)
  %2 = getelementptr inbounds i8, ptr %0, i64 24, !dbg !404
    #dbg_value(ptr %2, !396, !DIExpression(), !403)
  %3 = getelementptr inbounds i8, ptr %0, i64 1048, !dbg !405
    #dbg_value(ptr %3, !398, !DIExpression(), !403)
  %4 = getelementptr inbounds i8, ptr %0, i64 2072, !dbg !406
    #dbg_value(ptr %4, !399, !DIExpression(), !403)
  %5 = getelementptr inbounds i8, ptr %0, i64 8, !dbg !407
  %6 = load i64, ptr %5, align 8, !dbg !407, !tbaa !409
    #dbg_value(i64 %6, !400, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !403)
  %7 = getelementptr inbounds i8, ptr %0, i64 16
  %8 = load i64, ptr %7, align 8, !tbaa !413
  %9 = add nsw i64 %8, %6
    #dbg_value(i64 %6, !400, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !403)
  %10 = shl i64 %6, 32, !dbg !414
  %11 = ashr exact i64 %10, 32, !dbg !414
  %12 = icmp sgt i64 %9, %11, !dbg !416
  br i1 %12, label %13, label %37, !dbg !417

13:                                               ; preds = %1
    #dbg_value(i64 %6, !400, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !403)
  %14 = load ptr, ptr %0, align 8, !tbaa !418
  br label %15, !dbg !417

15:                                               ; preds = %13, %15
  %16 = phi i64 [ %11, %13 ], [ %35, %15 ]
    #dbg_value(i64 %16, !400, !DIExpression(), !403)
  %17 = getelementptr inbounds i8, ptr %14, i64 %16, !dbg !419
    #dbg_value(ptr %17, !402, !DIExpression(), !403)
  %18 = load i8, ptr %17, align 1, !dbg !421, !tbaa !381
  %19 = zext i8 %18 to i64, !dbg !422
  %20 = getelementptr inbounds i32, ptr %4, i64 %19, !dbg !422
  %21 = load i32, ptr %20, align 4, !dbg !423, !tbaa !350
  %22 = add nsw i32 %21, 1, !dbg !423
  store i32 %22, ptr %20, align 4, !dbg !423, !tbaa !350
  %23 = getelementptr i8, ptr %17, i64 1, !dbg !424
    #dbg_value(ptr %23, !402, !DIExpression(), !403)
  %24 = load i8, ptr %23, align 1, !dbg !425, !tbaa !381
  %25 = zext i8 %24 to i64, !dbg !426
  %26 = getelementptr inbounds i32, ptr %3, i64 %25, !dbg !426
  %27 = load i32, ptr %26, align 4, !dbg !427, !tbaa !350
  %28 = add nsw i32 %27, 1, !dbg !427
  store i32 %28, ptr %26, align 4, !dbg !427, !tbaa !350
  %29 = getelementptr i8, ptr %17, i64 2, !dbg !428
    #dbg_value(ptr %29, !402, !DIExpression(), !403)
  %30 = load i8, ptr %29, align 1, !dbg !429, !tbaa !381
  %31 = zext i8 %30 to i64, !dbg !430
  %32 = getelementptr inbounds i32, ptr %2, i64 %31, !dbg !430
  %33 = load i32, ptr %32, align 4, !dbg !431, !tbaa !350
  %34 = add nsw i32 %33, 1, !dbg !431
  store i32 %34, ptr %32, align 4, !dbg !431, !tbaa !350
  %35 = add nsw i64 %16, 3, !dbg !432
    #dbg_value(i64 %35, !400, !DIExpression(), !403)
  %36 = icmp sgt i64 %9, %35, !dbg !416
  br i1 %36, label %15, label %37, !dbg !417, !llvm.loop !433

37:                                               ; preds = %15, %1
  ret ptr null, !dbg !435
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #6 !dbg !436 {
  %3 = alloca %struct.stat, align 8, !DIAssignID !506
    #dbg_assign(i1 undef, !447, !DIExpression(), !506, ptr %3, !DIExpression(), !507)
  %4 = alloca %union.pthread_attr_t, align 8, !DIAssignID !508
    #dbg_assign(i1 undef, !488, !DIExpression(), !508, ptr %4, !DIExpression(), !507)
  %5 = alloca [256 x i32], align 16, !DIAssignID !509
    #dbg_assign(i1 undef, !495, !DIExpression(), !509, ptr %5, !DIExpression(), !507)
  %6 = alloca [256 x i32], align 16, !DIAssignID !510
    #dbg_assign(i1 undef, !496, !DIExpression(), !510, ptr %6, !DIExpression(), !507)
  %7 = alloca [256 x i32], align 16, !DIAssignID !511
    #dbg_assign(i1 undef, !497, !DIExpression(), !511, ptr %7, !DIExpression(), !507)
    #dbg_value(i32 %0, !441, !DIExpression(), !507)
    #dbg_value(ptr %1, !442, !DIExpression(), !507)
  call void @llvm.lifetime.start.p0(i64 144, ptr nonnull %3) #16, !dbg !512
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %4) #16, !dbg !513
  call void @llvm.lifetime.start.p0(i64 1024, ptr nonnull %5) #16, !dbg !514
  call void @llvm.lifetime.start.p0(i64 1024, ptr nonnull %6) #16, !dbg !515
  call void @llvm.lifetime.start.p0(i64 1024, ptr nonnull %7) #16, !dbg !516
  %8 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !517
  %9 = load ptr, ptr %8, align 8, !dbg !517, !tbaa !519
  %10 = icmp eq ptr %9, null, !dbg !520
  br i1 %10, label %11, label %14, !dbg !521

11:                                               ; preds = %2
  %12 = load ptr, ptr %1, align 8, !dbg !522, !tbaa !519
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, ptr noundef %12), !dbg !524
  tail call void @exit(i32 noundef 1) #17, !dbg !525
  unreachable, !dbg !525

14:                                               ; preds = %2
    #dbg_value(ptr %9, !486, !DIExpression(), !507)
  %15 = tail call i32 (ptr, i32, ...) @open(ptr noundef nonnull %9, i32 noundef 0) #16, !dbg !526
    #dbg_value(i32 %15, !445, !DIExpression(), !507)
  %16 = icmp slt i32 %15, 0, !dbg !526
  br i1 %16, label %17, label %18, !dbg !528

17:                                               ; preds = %14
  tail call void @perror(ptr noundef nonnull @.str.2) #18, !dbg !529
  tail call void @exit(i32 noundef 1) #17, !dbg !529
  unreachable, !dbg !529

18:                                               ; preds = %14
  %19 = call i32 @fstat(i32 noundef %15, ptr noundef nonnull %3) #16, !dbg !531
  %20 = icmp slt i32 %19, 0, !dbg !531
  br i1 %20, label %21, label %22, !dbg !533

21:                                               ; preds = %18
  tail call void @perror(ptr noundef nonnull @.str.3) #18, !dbg !534
  tail call void @exit(i32 noundef 1) #17, !dbg !534
  unreachable, !dbg !534

22:                                               ; preds = %18
  %23 = getelementptr inbounds i8, ptr %3, i64 48, !dbg !536
  %24 = load i64, ptr %23, align 8, !dbg !536, !tbaa !538
  %25 = add nsw i64 %24, 1, !dbg !536
  %26 = tail call ptr @mmap(ptr noundef null, i64 noundef %25, i32 noundef 3, i32 noundef 2, i32 noundef %15, i64 noundef 0) #16, !dbg !536
    #dbg_value(ptr %26, !446, !DIExpression(), !507)
  %27 = icmp eq ptr %26, null, !dbg !536
  br i1 %27, label %28, label %29, !dbg !541

28:                                               ; preds = %22
  tail call void @perror(ptr noundef nonnull @.str.4) #18, !dbg !542
  tail call void @exit(i32 noundef 1) #17, !dbg !542
  unreachable, !dbg !542

29:                                               ; preds = %22
  %30 = load i8, ptr %26, align 1, !dbg !544, !tbaa !381
  %31 = icmp eq i8 %30, 66, !dbg !546
  br i1 %31, label %32, label %36, !dbg !547

32:                                               ; preds = %29
  %33 = getelementptr inbounds i8, ptr %26, i64 1, !dbg !548
  %34 = load i8, ptr %33, align 1, !dbg !548, !tbaa !381
  %35 = icmp eq i8 %34, 77, !dbg !549
  br i1 %35, label %38, label %36, !dbg !550

36:                                               ; preds = %32, %29
  %37 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.16), !dbg !551
  tail call void @exit(i32 noundef 1) #17, !dbg !553
  unreachable, !dbg !553

38:                                               ; preds = %32
    #dbg_value(i8 120, !344, !DIExpression(DW_OP_LLVM_fragment, 0, 8), !554)
    #dbg_value(i24 1193046, !344, !DIExpression(DW_OP_LLVM_fragment, 8, 24), !554)
    #dbg_value(ptr undef, !345, !DIExpression(), !554)
  store i32 0, ptr @swap, align 4, !dbg !556, !tbaa !350
  %39 = getelementptr inbounds i8, ptr %26, i64 28, !dbg !557
    #dbg_value(ptr %39, !501, !DIExpression(), !507)
  %40 = load i16, ptr %39, align 2, !dbg !558, !tbaa !560
  %41 = icmp eq i16 %40, 24, !dbg !562
  br i1 %41, label %45, label %42, !dbg !563

42:                                               ; preds = %38
  %43 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6), !dbg !564
  %44 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.15), !dbg !566
  tail call void @exit(i32 noundef 1) #17, !dbg !567
  unreachable, !dbg !567

45:                                               ; preds = %38
  %46 = getelementptr inbounds i8, ptr %26, i64 10, !dbg !568
    #dbg_value(ptr %46, !502, !DIExpression(), !507)
  %47 = load i16, ptr %46, align 2, !dbg !569, !tbaa !560
  %48 = trunc i64 %24 to i32, !dbg !570
  %49 = zext i16 %47 to i32, !dbg !571
  %50 = sub nsw i32 %48, %49, !dbg !572
    #dbg_value(i32 %50, !503, !DIExpression(), !507)
  %51 = sdiv i32 %50, 3, !dbg !573
    #dbg_value(i32 %51, !504, !DIExpression(), !507)
  %52 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.8, i32 noundef %50, i32 noundef %51), !dbg !574
  %53 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !575
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1024) %5, i8 0, i64 1024, i1 false), !dbg !576, !DIAssignID !577
    #dbg_assign(i8 0, !495, !DIExpression(), !577, ptr %5, !DIExpression(), !507)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1024) %6, i8 0, i64 1024, i1 false), !dbg !578, !DIAssignID !579
    #dbg_assign(i8 0, !496, !DIExpression(), !579, ptr %6, !DIExpression(), !507)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(1024) %7, i8 0, i64 1024, i1 false), !dbg !580, !DIAssignID !581
    #dbg_assign(i8 0, !497, !DIExpression(), !581, ptr %7, !DIExpression(), !507)
  %54 = call i32 @pthread_attr_init(ptr noundef nonnull %4) #16, !dbg !582
  %55 = call i32 @pthread_attr_setscope(ptr noundef nonnull %4, i32 noundef 0) #16, !dbg !583
  %56 = call i64 @sysconf(i32 noundef 84) #16, !dbg !584
  %57 = trunc i64 %56 to i32, !dbg !584
    #dbg_value(i32 %57, !498, !DIExpression(), !507)
  %58 = icmp slt i32 %57, 1, !dbg !584
  br i1 %58, label %59, label %60, !dbg !586

59:                                               ; preds = %45
  call void @perror(ptr noundef nonnull @.str.10) #18, !dbg !587
  call void @exit(i32 noundef 1) #17, !dbg !587
  unreachable, !dbg !587

60:                                               ; preds = %45
  %61 = sdiv i32 %51, %57, !dbg !589
    #dbg_value(i32 %61, !499, !DIExpression(), !507)
  %62 = srem i32 %51, %57, !dbg !590
    #dbg_value(i32 %62, !500, !DIExpression(), !507)
  %63 = and i64 %56, 2147483647, !dbg !591
  %64 = shl nuw nsw i64 %63, 3, !dbg !591
  %65 = call noalias ptr @malloc(i64 noundef %64) #19, !dbg !591
    #dbg_value(ptr %65, !487, !DIExpression(), !507)
  %66 = icmp eq ptr %65, null, !dbg !591
  br i1 %66, label %67, label %68, !dbg !593

67:                                               ; preds = %60
  call void @perror(ptr noundef nonnull @.str.11) #18, !dbg !594
  call void @exit(i32 noundef 1) #17, !dbg !594
  unreachable, !dbg !594

68:                                               ; preds = %60
  %69 = call noalias ptr @calloc(i64 noundef 3096, i64 noundef %63) #20, !dbg !596
    #dbg_value(ptr %69, !494, !DIExpression(), !507)
  %70 = icmp eq ptr %69, null, !dbg !596
  br i1 %70, label %71, label %72, !dbg !598

71:                                               ; preds = %68
  call void @perror(ptr noundef nonnull @.str.12) #18, !dbg !599
  call void @exit(i32 noundef 1) #17, !dbg !599
  unreachable, !dbg !599

72:                                               ; preds = %68
    #dbg_value(i16 poison, !505, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value), !507)
    #dbg_value(i32 0, !443, !DIExpression(), !507)
    #dbg_value(i32 %62, !500, !DIExpression(), !507)
  %73 = load i16, ptr %46, align 2, !dbg !601, !tbaa !560
    #dbg_value(i16 %73, !505, !DIExpression(DW_OP_LLVM_convert, 16, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_stack_value), !507)
  %74 = zext i16 %73 to i64, !dbg !602
    #dbg_value(i64 %74, !505, !DIExpression(), !507)
  %75 = sext i32 %61 to i64
  %76 = and i64 %56, 2147483647, !dbg !603
  br label %80, !dbg !606

77:                                               ; preds = %80
    #dbg_value(i32 0, !443, !DIExpression(), !507)
  %78 = call i32 @llvm.smax.i32(i32 %57, i32 1), !dbg !607
  %79 = zext nneg i32 %78 to i64, !dbg !609
  br label %101, !dbg !607

80:                                               ; preds = %72, %80
  %81 = phi i64 [ 0, %72 ], [ %96, %80 ]
  %82 = phi i64 [ %74, %72 ], [ %93, %80 ]
  %83 = phi i32 [ %62, %72 ], [ %91, %80 ]
    #dbg_value(i64 %82, !505, !DIExpression(), !507)
    #dbg_value(i64 %81, !443, !DIExpression(), !507)
    #dbg_value(i32 %83, !500, !DIExpression(), !507)
  %84 = getelementptr inbounds %struct.thread_arg_t, ptr %69, i64 %81, !dbg !611
  store ptr %26, ptr %84, align 8, !dbg !613, !tbaa !418
  %85 = getelementptr inbounds i8, ptr %84, i64 8, !dbg !614
  store i64 %82, ptr %85, align 8, !dbg !615, !tbaa !409
  %86 = getelementptr inbounds i8, ptr %84, i64 16, !dbg !616
  %87 = icmp sgt i32 %83, 0, !dbg !617
  %88 = zext i1 %87 to i64, !dbg !619
  %89 = add nsw i64 %75, %88, !dbg !619
  %90 = sext i1 %87 to i32, !dbg !619
  %91 = add nsw i32 %83, %90, !dbg !619
    #dbg_value(i32 %91, !500, !DIExpression(), !507)
  %92 = mul nsw i64 %89, 3, !dbg !620
  store i64 %92, ptr %86, align 8, !dbg !620, !tbaa !413
  %93 = add nsw i64 %92, %82, !dbg !621
    #dbg_value(i64 %93, !505, !DIExpression(), !507)
  %94 = getelementptr inbounds i64, ptr %65, i64 %81, !dbg !622
  %95 = call i32 @pthread_create(ptr noundef nonnull %94, ptr noundef nonnull %4, ptr noundef nonnull @calc_hist, ptr noundef nonnull %84) #16, !dbg !623
  %96 = add nuw nsw i64 %81, 1, !dbg !624
    #dbg_value(i64 %96, !443, !DIExpression(), !507)
  %97 = icmp eq i64 %96, %76, !dbg !603
  br i1 %97, label %77, label %80, !dbg !606, !llvm.loop !625

98:                                               ; preds = %101
    #dbg_value(i32 0, !443, !DIExpression(), !507)
  %99 = call i32 @llvm.smax.i32(i32 %57, i32 1), !dbg !627
  %100 = zext nneg i32 %99 to i64, !dbg !629
  br label %108, !dbg !627

101:                                              ; preds = %77, %101
  %102 = phi i64 [ 0, %77 ], [ %106, %101 ]
    #dbg_value(i64 %102, !443, !DIExpression(), !507)
  %103 = getelementptr inbounds i64, ptr %65, i64 %102, !dbg !631
  %104 = load i64, ptr %103, align 8, !dbg !631, !tbaa !633
  %105 = call i32 @pthread_join(i64 noundef %104, ptr noundef null) #16, !dbg !634
  %106 = add nuw nsw i64 %102, 1, !dbg !635
    #dbg_value(i64 %106, !443, !DIExpression(), !507)
  %107 = icmp eq i64 %106, %79, !dbg !609
  br i1 %107, label %98, label %101, !dbg !607, !llvm.loop !636

108:                                              ; preds = %98, %136
  %109 = phi i64 [ 0, %98 ], [ %137, %136 ]
    #dbg_value(i64 %109, !443, !DIExpression(), !507)
  %110 = getelementptr inbounds %struct.thread_arg_t, ptr %69, i64 %109
  %111 = getelementptr inbounds i8, ptr %110, i64 24
  %112 = getelementptr inbounds i8, ptr %110, i64 1048
  %113 = getelementptr inbounds i8, ptr %110, i64 2072
    #dbg_value(i32 0, !444, !DIExpression(), !507)
  br label %114, !dbg !638

114:                                              ; preds = %114, %108
  %115 = phi i64 [ 0, %108 ], [ %131, %114 ], !dbg !641
  %116 = getelementptr inbounds [256 x i32], ptr %111, i64 0, i64 %115, !dbg !643
  %117 = load <4 x i32>, ptr %116, align 4, !dbg !643, !tbaa !350
  %118 = getelementptr inbounds [256 x i32], ptr %5, i64 0, i64 %115, !dbg !645
  %119 = load <4 x i32>, ptr %118, align 16, !dbg !646, !tbaa !350
  %120 = add nsw <4 x i32> %119, %117, !dbg !646
  store <4 x i32> %120, ptr %118, align 16, !dbg !646, !tbaa !350
  %121 = getelementptr inbounds [256 x i32], ptr %112, i64 0, i64 %115, !dbg !647
  %122 = load <4 x i32>, ptr %121, align 4, !dbg !647, !tbaa !350
  %123 = getelementptr inbounds [256 x i32], ptr %6, i64 0, i64 %115, !dbg !648
  %124 = load <4 x i32>, ptr %123, align 16, !dbg !649, !tbaa !350
  %125 = add nsw <4 x i32> %124, %122, !dbg !649
  store <4 x i32> %125, ptr %123, align 16, !dbg !649, !tbaa !350
  %126 = getelementptr inbounds [256 x i32], ptr %113, i64 0, i64 %115, !dbg !650
  %127 = load <4 x i32>, ptr %126, align 4, !dbg !650, !tbaa !350
  %128 = getelementptr inbounds [256 x i32], ptr %7, i64 0, i64 %115, !dbg !651
  %129 = load <4 x i32>, ptr %128, align 16, !dbg !652, !tbaa !350
  %130 = add nsw <4 x i32> %129, %127, !dbg !652
  store <4 x i32> %130, ptr %128, align 16, !dbg !652, !tbaa !350
  %131 = add nuw i64 %115, 4, !dbg !641
  %132 = icmp eq i64 %131, 256, !dbg !641
  br i1 %132, label %136, label %114, !dbg !641, !llvm.loop !653

133:                                              ; preds = %136
    #dbg_value(i32 poison, !443, !DIExpression(), !507)
  %134 = call i32 @munmap(ptr noundef nonnull %26, i64 noundef %25) #16, !dbg !657
  %135 = icmp slt i32 %134, 0, !dbg !657
  br i1 %135, label %139, label %140, !dbg !659

136:                                              ; preds = %114
  %137 = add nuw nsw i64 %109, 1, !dbg !660
    #dbg_value(i64 %137, !443, !DIExpression(), !507)
  %138 = icmp eq i64 %137, %100, !dbg !629
  br i1 %138, label %133, label %108, !dbg !627, !llvm.loop !661

139:                                              ; preds = %133
  call void @perror(ptr noundef nonnull @.str.13) #18, !dbg !663
  call void @exit(i32 noundef 1) #17, !dbg !663
  unreachable, !dbg !663

140:                                              ; preds = %133
  %141 = call i32 @close(i32 noundef %15) #16, !dbg !665
  %142 = icmp slt i32 %141, 0, !dbg !665
  br i1 %142, label %143, label %144, !dbg !667

143:                                              ; preds = %140
  call void @perror(ptr noundef nonnull @.str.14) #18, !dbg !668
  call void @exit(i32 noundef 1) #17, !dbg !668
  unreachable, !dbg !668

144:                                              ; preds = %140
  call void @free(ptr noundef %65) #16, !dbg !670
    #dbg_value(i32 0, !443, !DIExpression(), !507)
  %145 = call i32 @llvm.smax.i32(i32 %57, i32 1), !dbg !671
  %146 = zext nneg i32 %145 to i64, !dbg !673
  br label %147, !dbg !671

147:                                              ; preds = %144, %147
  %148 = phi i64 [ 0, %144 ], [ %153, %147 ]
    #dbg_value(i64 %148, !443, !DIExpression(), !507)
  %149 = getelementptr inbounds %struct.thread_arg_t, ptr %69, i64 %148, !dbg !675
  %150 = getelementptr inbounds i8, ptr %149, i64 24, !dbg !677
  call void @free(ptr noundef nonnull %150) #16, !dbg !678
  %151 = getelementptr inbounds i8, ptr %149, i64 1048, !dbg !679
  call void @free(ptr noundef nonnull %151) #16, !dbg !680
  %152 = getelementptr inbounds i8, ptr %149, i64 2072, !dbg !681
  call void @free(ptr noundef nonnull %152) #16, !dbg !682
  %153 = add nuw nsw i64 %148, 1, !dbg !683
    #dbg_value(i64 %153, !443, !DIExpression(), !507)
  %154 = icmp eq i64 %153, %146, !dbg !673
  br i1 %154, label %155, label %147, !dbg !671, !llvm.loop !684

155:                                              ; preds = %147
  call void @free(ptr noundef %69) #16, !dbg !686
  %156 = call i32 @pthread_attr_destroy(ptr noundef nonnull %4) #16, !dbg !687
  call void @llvm.lifetime.end.p0(i64 1024, ptr nonnull %7) #16, !dbg !688
  call void @llvm.lifetime.end.p0(i64 1024, ptr nonnull %6) #16, !dbg !688
  call void @llvm.lifetime.end.p0(i64 1024, ptr nonnull %5) #16, !dbg !688
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %4) #16, !dbg !688
  call void @llvm.lifetime.end.p0(i64 144, ptr nonnull %3) #16, !dbg !688
  ret i32 0, !dbg !689
}

; Function Attrs: nofree
declare !dbg !690 noundef i32 @open(ptr nocapture noundef readonly, i32 noundef, ...) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare !dbg !694 void @perror(ptr nocapture noundef readonly) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare !dbg !697 noundef i32 @fstat(i32 noundef, ptr nocapture noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare !dbg !702 ptr @mmap(ptr noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #9

; Function Attrs: nounwind
declare !dbg !708 i32 @pthread_attr_init(ptr noundef) local_unnamed_addr #8

; Function Attrs: nounwind
declare !dbg !712 i32 @pthread_attr_setscope(ptr noundef, i32 noundef) local_unnamed_addr #8

; Function Attrs: nounwind
declare !dbg !715 i64 @sysconf(i32 noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare !dbg !719 noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #10

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare !dbg !722 noalias noundef ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #11

; Function Attrs: nounwind
declare !dbg !725 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #8

declare !dbg !734 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #12

; Function Attrs: nounwind
declare !dbg !738 i32 @munmap(ptr noundef, i64 noundef) local_unnamed_addr #8

declare !dbg !741 i32 @close(i32 noundef) local_unnamed_addr #12

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare !dbg !744 void @free(ptr allocptr nocapture noundef) local_unnamed_addr #13

; Function Attrs: nounwind
declare !dbg !747 i32 @pthread_attr_destroy(ptr noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #14

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #15

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(write, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nofree "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #10 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { nofree nounwind }
attributes #15 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #16 = { nounwind }
attributes #17 = { noreturn nounwind }
attributes #18 = { cold }
attributes #19 = { nounwind allocsize(0) }
attributes #20 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!332, !333, !334, !335, !336, !337, !338}
!llvm.ident = !{!339}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "swap", scope: !2, file: !236, line: 45, type: !247, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !231, globals: !259, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/histogram/hist-pthread.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/histogram", checksumkind: CSK_MD5, checksum: "e788c3ef224eaccd29524df5080755af")
!4 = !{!5, !11}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 134, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10}
!9 = !DIEnumerator(name: "PTHREAD_SCOPE_SYSTEM", value: 0)
!10 = !DIEnumerator(name: "PTHREAD_SCOPE_PROCESS", value: 1)
!11 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !12, line: 71, baseType: !7, size: 32, elements: !13)
!12 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/confname.h", directory: "", checksumkind: CSK_MD5, checksum: "78b98c9476f9b4c41f6f4ea6bcb3195f")
!13 = !{!14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230}
!14 = !DIEnumerator(name: "_SC_ARG_MAX", value: 0)
!15 = !DIEnumerator(name: "_SC_CHILD_MAX", value: 1)
!16 = !DIEnumerator(name: "_SC_CLK_TCK", value: 2)
!17 = !DIEnumerator(name: "_SC_NGROUPS_MAX", value: 3)
!18 = !DIEnumerator(name: "_SC_OPEN_MAX", value: 4)
!19 = !DIEnumerator(name: "_SC_STREAM_MAX", value: 5)
!20 = !DIEnumerator(name: "_SC_TZNAME_MAX", value: 6)
!21 = !DIEnumerator(name: "_SC_JOB_CONTROL", value: 7)
!22 = !DIEnumerator(name: "_SC_SAVED_IDS", value: 8)
!23 = !DIEnumerator(name: "_SC_REALTIME_SIGNALS", value: 9)
!24 = !DIEnumerator(name: "_SC_PRIORITY_SCHEDULING", value: 10)
!25 = !DIEnumerator(name: "_SC_TIMERS", value: 11)
!26 = !DIEnumerator(name: "_SC_ASYNCHRONOUS_IO", value: 12)
!27 = !DIEnumerator(name: "_SC_PRIORITIZED_IO", value: 13)
!28 = !DIEnumerator(name: "_SC_SYNCHRONIZED_IO", value: 14)
!29 = !DIEnumerator(name: "_SC_FSYNC", value: 15)
!30 = !DIEnumerator(name: "_SC_MAPPED_FILES", value: 16)
!31 = !DIEnumerator(name: "_SC_MEMLOCK", value: 17)
!32 = !DIEnumerator(name: "_SC_MEMLOCK_RANGE", value: 18)
!33 = !DIEnumerator(name: "_SC_MEMORY_PROTECTION", value: 19)
!34 = !DIEnumerator(name: "_SC_MESSAGE_PASSING", value: 20)
!35 = !DIEnumerator(name: "_SC_SEMAPHORES", value: 21)
!36 = !DIEnumerator(name: "_SC_SHARED_MEMORY_OBJECTS", value: 22)
!37 = !DIEnumerator(name: "_SC_AIO_LISTIO_MAX", value: 23)
!38 = !DIEnumerator(name: "_SC_AIO_MAX", value: 24)
!39 = !DIEnumerator(name: "_SC_AIO_PRIO_DELTA_MAX", value: 25)
!40 = !DIEnumerator(name: "_SC_DELAYTIMER_MAX", value: 26)
!41 = !DIEnumerator(name: "_SC_MQ_OPEN_MAX", value: 27)
!42 = !DIEnumerator(name: "_SC_MQ_PRIO_MAX", value: 28)
!43 = !DIEnumerator(name: "_SC_VERSION", value: 29)
!44 = !DIEnumerator(name: "_SC_PAGESIZE", value: 30)
!45 = !DIEnumerator(name: "_SC_RTSIG_MAX", value: 31)
!46 = !DIEnumerator(name: "_SC_SEM_NSEMS_MAX", value: 32)
!47 = !DIEnumerator(name: "_SC_SEM_VALUE_MAX", value: 33)
!48 = !DIEnumerator(name: "_SC_SIGQUEUE_MAX", value: 34)
!49 = !DIEnumerator(name: "_SC_TIMER_MAX", value: 35)
!50 = !DIEnumerator(name: "_SC_BC_BASE_MAX", value: 36)
!51 = !DIEnumerator(name: "_SC_BC_DIM_MAX", value: 37)
!52 = !DIEnumerator(name: "_SC_BC_SCALE_MAX", value: 38)
!53 = !DIEnumerator(name: "_SC_BC_STRING_MAX", value: 39)
!54 = !DIEnumerator(name: "_SC_COLL_WEIGHTS_MAX", value: 40)
!55 = !DIEnumerator(name: "_SC_EQUIV_CLASS_MAX", value: 41)
!56 = !DIEnumerator(name: "_SC_EXPR_NEST_MAX", value: 42)
!57 = !DIEnumerator(name: "_SC_LINE_MAX", value: 43)
!58 = !DIEnumerator(name: "_SC_RE_DUP_MAX", value: 44)
!59 = !DIEnumerator(name: "_SC_CHARCLASS_NAME_MAX", value: 45)
!60 = !DIEnumerator(name: "_SC_2_VERSION", value: 46)
!61 = !DIEnumerator(name: "_SC_2_C_BIND", value: 47)
!62 = !DIEnumerator(name: "_SC_2_C_DEV", value: 48)
!63 = !DIEnumerator(name: "_SC_2_FORT_DEV", value: 49)
!64 = !DIEnumerator(name: "_SC_2_FORT_RUN", value: 50)
!65 = !DIEnumerator(name: "_SC_2_SW_DEV", value: 51)
!66 = !DIEnumerator(name: "_SC_2_LOCALEDEF", value: 52)
!67 = !DIEnumerator(name: "_SC_PII", value: 53)
!68 = !DIEnumerator(name: "_SC_PII_XTI", value: 54)
!69 = !DIEnumerator(name: "_SC_PII_SOCKET", value: 55)
!70 = !DIEnumerator(name: "_SC_PII_INTERNET", value: 56)
!71 = !DIEnumerator(name: "_SC_PII_OSI", value: 57)
!72 = !DIEnumerator(name: "_SC_POLL", value: 58)
!73 = !DIEnumerator(name: "_SC_SELECT", value: 59)
!74 = !DIEnumerator(name: "_SC_UIO_MAXIOV", value: 60)
!75 = !DIEnumerator(name: "_SC_IOV_MAX", value: 60)
!76 = !DIEnumerator(name: "_SC_PII_INTERNET_STREAM", value: 61)
!77 = !DIEnumerator(name: "_SC_PII_INTERNET_DGRAM", value: 62)
!78 = !DIEnumerator(name: "_SC_PII_OSI_COTS", value: 63)
!79 = !DIEnumerator(name: "_SC_PII_OSI_CLTS", value: 64)
!80 = !DIEnumerator(name: "_SC_PII_OSI_M", value: 65)
!81 = !DIEnumerator(name: "_SC_T_IOV_MAX", value: 66)
!82 = !DIEnumerator(name: "_SC_THREADS", value: 67)
!83 = !DIEnumerator(name: "_SC_THREAD_SAFE_FUNCTIONS", value: 68)
!84 = !DIEnumerator(name: "_SC_GETGR_R_SIZE_MAX", value: 69)
!85 = !DIEnumerator(name: "_SC_GETPW_R_SIZE_MAX", value: 70)
!86 = !DIEnumerator(name: "_SC_LOGIN_NAME_MAX", value: 71)
!87 = !DIEnumerator(name: "_SC_TTY_NAME_MAX", value: 72)
!88 = !DIEnumerator(name: "_SC_THREAD_DESTRUCTOR_ITERATIONS", value: 73)
!89 = !DIEnumerator(name: "_SC_THREAD_KEYS_MAX", value: 74)
!90 = !DIEnumerator(name: "_SC_THREAD_STACK_MIN", value: 75)
!91 = !DIEnumerator(name: "_SC_THREAD_THREADS_MAX", value: 76)
!92 = !DIEnumerator(name: "_SC_THREAD_ATTR_STACKADDR", value: 77)
!93 = !DIEnumerator(name: "_SC_THREAD_ATTR_STACKSIZE", value: 78)
!94 = !DIEnumerator(name: "_SC_THREAD_PRIORITY_SCHEDULING", value: 79)
!95 = !DIEnumerator(name: "_SC_THREAD_PRIO_INHERIT", value: 80)
!96 = !DIEnumerator(name: "_SC_THREAD_PRIO_PROTECT", value: 81)
!97 = !DIEnumerator(name: "_SC_THREAD_PROCESS_SHARED", value: 82)
!98 = !DIEnumerator(name: "_SC_NPROCESSORS_CONF", value: 83)
!99 = !DIEnumerator(name: "_SC_NPROCESSORS_ONLN", value: 84)
!100 = !DIEnumerator(name: "_SC_PHYS_PAGES", value: 85)
!101 = !DIEnumerator(name: "_SC_AVPHYS_PAGES", value: 86)
!102 = !DIEnumerator(name: "_SC_ATEXIT_MAX", value: 87)
!103 = !DIEnumerator(name: "_SC_PASS_MAX", value: 88)
!104 = !DIEnumerator(name: "_SC_XOPEN_VERSION", value: 89)
!105 = !DIEnumerator(name: "_SC_XOPEN_XCU_VERSION", value: 90)
!106 = !DIEnumerator(name: "_SC_XOPEN_UNIX", value: 91)
!107 = !DIEnumerator(name: "_SC_XOPEN_CRYPT", value: 92)
!108 = !DIEnumerator(name: "_SC_XOPEN_ENH_I18N", value: 93)
!109 = !DIEnumerator(name: "_SC_XOPEN_SHM", value: 94)
!110 = !DIEnumerator(name: "_SC_2_CHAR_TERM", value: 95)
!111 = !DIEnumerator(name: "_SC_2_C_VERSION", value: 96)
!112 = !DIEnumerator(name: "_SC_2_UPE", value: 97)
!113 = !DIEnumerator(name: "_SC_XOPEN_XPG2", value: 98)
!114 = !DIEnumerator(name: "_SC_XOPEN_XPG3", value: 99)
!115 = !DIEnumerator(name: "_SC_XOPEN_XPG4", value: 100)
!116 = !DIEnumerator(name: "_SC_CHAR_BIT", value: 101)
!117 = !DIEnumerator(name: "_SC_CHAR_MAX", value: 102)
!118 = !DIEnumerator(name: "_SC_CHAR_MIN", value: 103)
!119 = !DIEnumerator(name: "_SC_INT_MAX", value: 104)
!120 = !DIEnumerator(name: "_SC_INT_MIN", value: 105)
!121 = !DIEnumerator(name: "_SC_LONG_BIT", value: 106)
!122 = !DIEnumerator(name: "_SC_WORD_BIT", value: 107)
!123 = !DIEnumerator(name: "_SC_MB_LEN_MAX", value: 108)
!124 = !DIEnumerator(name: "_SC_NZERO", value: 109)
!125 = !DIEnumerator(name: "_SC_SSIZE_MAX", value: 110)
!126 = !DIEnumerator(name: "_SC_SCHAR_MAX", value: 111)
!127 = !DIEnumerator(name: "_SC_SCHAR_MIN", value: 112)
!128 = !DIEnumerator(name: "_SC_SHRT_MAX", value: 113)
!129 = !DIEnumerator(name: "_SC_SHRT_MIN", value: 114)
!130 = !DIEnumerator(name: "_SC_UCHAR_MAX", value: 115)
!131 = !DIEnumerator(name: "_SC_UINT_MAX", value: 116)
!132 = !DIEnumerator(name: "_SC_ULONG_MAX", value: 117)
!133 = !DIEnumerator(name: "_SC_USHRT_MAX", value: 118)
!134 = !DIEnumerator(name: "_SC_NL_ARGMAX", value: 119)
!135 = !DIEnumerator(name: "_SC_NL_LANGMAX", value: 120)
!136 = !DIEnumerator(name: "_SC_NL_MSGMAX", value: 121)
!137 = !DIEnumerator(name: "_SC_NL_NMAX", value: 122)
!138 = !DIEnumerator(name: "_SC_NL_SETMAX", value: 123)
!139 = !DIEnumerator(name: "_SC_NL_TEXTMAX", value: 124)
!140 = !DIEnumerator(name: "_SC_XBS5_ILP32_OFF32", value: 125)
!141 = !DIEnumerator(name: "_SC_XBS5_ILP32_OFFBIG", value: 126)
!142 = !DIEnumerator(name: "_SC_XBS5_LP64_OFF64", value: 127)
!143 = !DIEnumerator(name: "_SC_XBS5_LPBIG_OFFBIG", value: 128)
!144 = !DIEnumerator(name: "_SC_XOPEN_LEGACY", value: 129)
!145 = !DIEnumerator(name: "_SC_XOPEN_REALTIME", value: 130)
!146 = !DIEnumerator(name: "_SC_XOPEN_REALTIME_THREADS", value: 131)
!147 = !DIEnumerator(name: "_SC_ADVISORY_INFO", value: 132)
!148 = !DIEnumerator(name: "_SC_BARRIERS", value: 133)
!149 = !DIEnumerator(name: "_SC_BASE", value: 134)
!150 = !DIEnumerator(name: "_SC_C_LANG_SUPPORT", value: 135)
!151 = !DIEnumerator(name: "_SC_C_LANG_SUPPORT_R", value: 136)
!152 = !DIEnumerator(name: "_SC_CLOCK_SELECTION", value: 137)
!153 = !DIEnumerator(name: "_SC_CPUTIME", value: 138)
!154 = !DIEnumerator(name: "_SC_THREAD_CPUTIME", value: 139)
!155 = !DIEnumerator(name: "_SC_DEVICE_IO", value: 140)
!156 = !DIEnumerator(name: "_SC_DEVICE_SPECIFIC", value: 141)
!157 = !DIEnumerator(name: "_SC_DEVICE_SPECIFIC_R", value: 142)
!158 = !DIEnumerator(name: "_SC_FD_MGMT", value: 143)
!159 = !DIEnumerator(name: "_SC_FIFO", value: 144)
!160 = !DIEnumerator(name: "_SC_PIPE", value: 145)
!161 = !DIEnumerator(name: "_SC_FILE_ATTRIBUTES", value: 146)
!162 = !DIEnumerator(name: "_SC_FILE_LOCKING", value: 147)
!163 = !DIEnumerator(name: "_SC_FILE_SYSTEM", value: 148)
!164 = !DIEnumerator(name: "_SC_MONOTONIC_CLOCK", value: 149)
!165 = !DIEnumerator(name: "_SC_MULTI_PROCESS", value: 150)
!166 = !DIEnumerator(name: "_SC_SINGLE_PROCESS", value: 151)
!167 = !DIEnumerator(name: "_SC_NETWORKING", value: 152)
!168 = !DIEnumerator(name: "_SC_READER_WRITER_LOCKS", value: 153)
!169 = !DIEnumerator(name: "_SC_SPIN_LOCKS", value: 154)
!170 = !DIEnumerator(name: "_SC_REGEXP", value: 155)
!171 = !DIEnumerator(name: "_SC_REGEX_VERSION", value: 156)
!172 = !DIEnumerator(name: "_SC_SHELL", value: 157)
!173 = !DIEnumerator(name: "_SC_SIGNALS", value: 158)
!174 = !DIEnumerator(name: "_SC_SPAWN", value: 159)
!175 = !DIEnumerator(name: "_SC_SPORADIC_SERVER", value: 160)
!176 = !DIEnumerator(name: "_SC_THREAD_SPORADIC_SERVER", value: 161)
!177 = !DIEnumerator(name: "_SC_SYSTEM_DATABASE", value: 162)
!178 = !DIEnumerator(name: "_SC_SYSTEM_DATABASE_R", value: 163)
!179 = !DIEnumerator(name: "_SC_TIMEOUTS", value: 164)
!180 = !DIEnumerator(name: "_SC_TYPED_MEMORY_OBJECTS", value: 165)
!181 = !DIEnumerator(name: "_SC_USER_GROUPS", value: 166)
!182 = !DIEnumerator(name: "_SC_USER_GROUPS_R", value: 167)
!183 = !DIEnumerator(name: "_SC_2_PBS", value: 168)
!184 = !DIEnumerator(name: "_SC_2_PBS_ACCOUNTING", value: 169)
!185 = !DIEnumerator(name: "_SC_2_PBS_LOCATE", value: 170)
!186 = !DIEnumerator(name: "_SC_2_PBS_MESSAGE", value: 171)
!187 = !DIEnumerator(name: "_SC_2_PBS_TRACK", value: 172)
!188 = !DIEnumerator(name: "_SC_SYMLOOP_MAX", value: 173)
!189 = !DIEnumerator(name: "_SC_STREAMS", value: 174)
!190 = !DIEnumerator(name: "_SC_2_PBS_CHECKPOINT", value: 175)
!191 = !DIEnumerator(name: "_SC_V6_ILP32_OFF32", value: 176)
!192 = !DIEnumerator(name: "_SC_V6_ILP32_OFFBIG", value: 177)
!193 = !DIEnumerator(name: "_SC_V6_LP64_OFF64", value: 178)
!194 = !DIEnumerator(name: "_SC_V6_LPBIG_OFFBIG", value: 179)
!195 = !DIEnumerator(name: "_SC_HOST_NAME_MAX", value: 180)
!196 = !DIEnumerator(name: "_SC_TRACE", value: 181)
!197 = !DIEnumerator(name: "_SC_TRACE_EVENT_FILTER", value: 182)
!198 = !DIEnumerator(name: "_SC_TRACE_INHERIT", value: 183)
!199 = !DIEnumerator(name: "_SC_TRACE_LOG", value: 184)
!200 = !DIEnumerator(name: "_SC_LEVEL1_ICACHE_SIZE", value: 185)
!201 = !DIEnumerator(name: "_SC_LEVEL1_ICACHE_ASSOC", value: 186)
!202 = !DIEnumerator(name: "_SC_LEVEL1_ICACHE_LINESIZE", value: 187)
!203 = !DIEnumerator(name: "_SC_LEVEL1_DCACHE_SIZE", value: 188)
!204 = !DIEnumerator(name: "_SC_LEVEL1_DCACHE_ASSOC", value: 189)
!205 = !DIEnumerator(name: "_SC_LEVEL1_DCACHE_LINESIZE", value: 190)
!206 = !DIEnumerator(name: "_SC_LEVEL2_CACHE_SIZE", value: 191)
!207 = !DIEnumerator(name: "_SC_LEVEL2_CACHE_ASSOC", value: 192)
!208 = !DIEnumerator(name: "_SC_LEVEL2_CACHE_LINESIZE", value: 193)
!209 = !DIEnumerator(name: "_SC_LEVEL3_CACHE_SIZE", value: 194)
!210 = !DIEnumerator(name: "_SC_LEVEL3_CACHE_ASSOC", value: 195)
!211 = !DIEnumerator(name: "_SC_LEVEL3_CACHE_LINESIZE", value: 196)
!212 = !DIEnumerator(name: "_SC_LEVEL4_CACHE_SIZE", value: 197)
!213 = !DIEnumerator(name: "_SC_LEVEL4_CACHE_ASSOC", value: 198)
!214 = !DIEnumerator(name: "_SC_LEVEL4_CACHE_LINESIZE", value: 199)
!215 = !DIEnumerator(name: "_SC_IPV6", value: 235)
!216 = !DIEnumerator(name: "_SC_RAW_SOCKETS", value: 236)
!217 = !DIEnumerator(name: "_SC_V7_ILP32_OFF32", value: 237)
!218 = !DIEnumerator(name: "_SC_V7_ILP32_OFFBIG", value: 238)
!219 = !DIEnumerator(name: "_SC_V7_LP64_OFF64", value: 239)
!220 = !DIEnumerator(name: "_SC_V7_LPBIG_OFFBIG", value: 240)
!221 = !DIEnumerator(name: "_SC_SS_REPL_MAX", value: 241)
!222 = !DIEnumerator(name: "_SC_TRACE_EVENT_NAME_MAX", value: 242)
!223 = !DIEnumerator(name: "_SC_TRACE_NAME_MAX", value: 243)
!224 = !DIEnumerator(name: "_SC_TRACE_SYS_MAX", value: 244)
!225 = !DIEnumerator(name: "_SC_TRACE_USER_EVENT_MAX", value: 245)
!226 = !DIEnumerator(name: "_SC_XOPEN_STREAMS", value: 246)
!227 = !DIEnumerator(name: "_SC_THREAD_ROBUST_PRIO_INHERIT", value: 247)
!228 = !DIEnumerator(name: "_SC_THREAD_ROBUST_PRIO_PROTECT", value: 248)
!229 = !DIEnumerator(name: "_SC_MINSIGSTKSZ", value: 249)
!230 = !DIEnumerator(name: "_SC_SIGSTKSZ", value: 250)
!231 = !{!232, !234, !252, !253, !247, !255, !243, !240}
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !233, size: 64)
!233 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !235, size: 64)
!235 = !DIDerivedType(tag: DW_TAG_typedef, name: "thread_arg_t", file: !236, line: 54, baseType: !237)
!236 = !DIFile(filename: "hist-pthread.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/histogram", checksumkind: CSK_MD5, checksum: "e788c3ef224eaccd29524df5080755af")
!237 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !236, line: 47, size: 24768, elements: !238)
!238 = !{!239, !242, !244, !245, !250, !251}
!239 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !237, file: !236, line: 48, baseType: !240, size: 64)
!240 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !241, size: 64)
!241 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "data_pos", scope: !237, file: !236, line: 49, baseType: !243, size: 64, offset: 64)
!243 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "data_len", scope: !237, file: !236, line: 50, baseType: !243, size: 64, offset: 128)
!245 = !DIDerivedType(tag: DW_TAG_member, name: "red", scope: !237, file: !236, line: 51, baseType: !246, size: 8192, offset: 192)
!246 = !DICompositeType(tag: DW_TAG_array_type, baseType: !247, size: 8192, elements: !248)
!247 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!248 = !{!249}
!249 = !DISubrange(count: 256)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "green", scope: !237, file: !236, line: 52, baseType: !246, size: 8192, offset: 8384)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "blue", scope: !237, file: !236, line: 53, baseType: !246, size: 8192, offset: 16576)
!252 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!253 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !254, size: 64)
!254 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!255 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !256, size: 64)
!256 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !257, line: 27, baseType: !258)
!257 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!258 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!259 = !{!260, !265, !270, !275, !280, !285, !290, !295, !300, !305, !307, !312, !317, !322, !327, !0}
!260 = !DIGlobalVariableExpression(var: !261, expr: !DIExpression())
!261 = distinct !DIGlobalVariable(scope: null, file: !236, line: 71, type: !262, isLocal: true, isDefinition: true)
!262 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 304, elements: !263)
!263 = !{!264}
!264 = !DISubrange(count: 38)
!265 = !DIGlobalVariableExpression(var: !266, expr: !DIExpression())
!266 = distinct !DIGlobalVariable(scope: null, file: !236, line: 156, type: !267, isLocal: true, isDefinition: true)
!267 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 232, elements: !268)
!268 = !{!269}
!269 = !DISubrange(count: 29)
!270 = !DIGlobalVariableExpression(var: !271, expr: !DIExpression())
!271 = distinct !DIGlobalVariable(scope: null, file: !236, line: 163, type: !272, isLocal: true, isDefinition: true)
!272 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 472, elements: !273)
!273 = !{!274}
!274 = !DISubrange(count: 59)
!275 = !DIGlobalVariableExpression(var: !276, expr: !DIExpression())
!276 = distinct !DIGlobalVariable(scope: null, file: !236, line: 165, type: !277, isLocal: true, isDefinition: true)
!277 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 384, elements: !278)
!278 = !{!279}
!279 = !DISubrange(count: 48)
!280 = !DIGlobalVariableExpression(var: !281, expr: !DIExpression())
!281 = distinct !DIGlobalVariable(scope: null, file: !236, line: 167, type: !282, isLocal: true, isDefinition: true)
!282 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 920, elements: !283)
!283 = !{!284}
!284 = !DISubrange(count: 115)
!285 = !DIGlobalVariableExpression(var: !286, expr: !DIExpression())
!286 = distinct !DIGlobalVariable(scope: null, file: !236, line: 171, type: !287, isLocal: true, isDefinition: true)
!287 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 336, elements: !288)
!288 = !{!289}
!289 = !DISubrange(count: 42)
!290 = !DIGlobalVariableExpression(var: !291, expr: !DIExpression())
!291 = distinct !DIGlobalVariable(scope: null, file: !236, line: 182, type: !292, isLocal: true, isDefinition: true)
!292 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 256, elements: !293)
!293 = !{!294}
!294 = !DISubrange(count: 32)
!295 = !DIGlobalVariableExpression(var: !296, expr: !DIExpression())
!296 = distinct !DIGlobalVariable(scope: null, file: !236, line: 183, type: !297, isLocal: true, isDefinition: true)
!297 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 448, elements: !298)
!298 = !{!299}
!299 = !DISubrange(count: 56)
!300 = !DIGlobalVariableExpression(var: !301, expr: !DIExpression())
!301 = distinct !DIGlobalVariable(scope: null, file: !236, line: 194, type: !302, isLocal: true, isDefinition: true)
!302 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 392, elements: !303)
!303 = !{!304}
!304 = !DISubrange(count: 49)
!305 = !DIGlobalVariableExpression(var: !306, expr: !DIExpression())
!306 = distinct !DIGlobalVariable(scope: null, file: !236, line: 197, type: !267, isLocal: true, isDefinition: true)
!307 = !DIGlobalVariableExpression(var: !308, expr: !DIExpression())
!308 = distinct !DIGlobalVariable(scope: null, file: !236, line: 208, type: !309, isLocal: true, isDefinition: true)
!309 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 600, elements: !310)
!310 = !{!311}
!311 = !DISubrange(count: 75)
!312 = !DIGlobalVariableExpression(var: !313, expr: !DIExpression())
!313 = distinct !DIGlobalVariable(scope: null, file: !236, line: 212, type: !314, isLocal: true, isDefinition: true)
!314 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 744, elements: !315)
!315 = !{!316}
!316 = !DISubrange(count: 93)
!317 = !DIGlobalVariableExpression(var: !318, expr: !DIExpression())
!318 = distinct !DIGlobalVariable(scope: null, file: !236, line: 213, type: !319, isLocal: true, isDefinition: true)
!319 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 784, elements: !320)
!320 = !{!321}
!321 = !DISubrange(count: 98)
!322 = !DIGlobalVariableExpression(var: !323, expr: !DIExpression())
!323 = distinct !DIGlobalVariable(scope: null, file: !236, line: 262, type: !324, isLocal: true, isDefinition: true)
!324 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 504, elements: !325)
!325 = !{!326}
!326 = !DISubrange(count: 63)
!327 = !DIGlobalVariableExpression(var: !328, expr: !DIExpression())
!328 = distinct !DIGlobalVariable(scope: null, file: !236, line: 263, type: !329, isLocal: true, isDefinition: true)
!329 = !DICompositeType(tag: DW_TAG_array_type, baseType: !233, size: 320, elements: !330)
!330 = !{!331}
!331 = !DISubrange(count: 40)
!332 = !{i32 7, !"Dwarf Version", i32 5}
!333 = !{i32 2, !"Debug Info Version", i32 3}
!334 = !{i32 1, !"wchar_size", i32 4}
!335 = !{i32 8, !"PIC Level", i32 2}
!336 = !{i32 7, !"PIE Level", i32 2}
!337 = !{i32 7, !"uwtable", i32 2}
!338 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!339 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!340 = distinct !DISubprogram(name: "test_endianess", scope: !236, file: !236, line: 59, type: !341, scopeLine: 59, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !343)
!341 = !DISubroutineType(types: !342)
!342 = !{null}
!343 = !{!344, !345}
!344 = !DILocalVariable(name: "num", scope: !340, file: !236, line: 60, type: !7)
!345 = !DILocalVariable(name: "low", scope: !340, file: !236, line: 61, type: !232)
!346 = !DILocation(line: 0, scope: !340)
!347 = !DILocation(line: 64, column: 12, scope: !348)
!348 = distinct !DILexicalBlock(scope: !349, file: !236, line: 62, column: 23)
!349 = distinct !DILexicalBlock(scope: !340, file: !236, line: 62, column: 8)
!350 = !{!351, !351, i64 0}
!351 = !{!"int", !352, i64 0}
!352 = !{!"omnipotent char", !353, i64 0}
!353 = !{!"Simple C/C++ TBAA"}
!354 = !DILocation(line: 74, column: 1, scope: !340)
!355 = !DISubprogram(name: "printf", scope: !356, file: !356, line: 356, type: !357, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!356 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!357 = !DISubroutineType(types: !358)
!358 = !{!247, !359, null}
!359 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !360)
!360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !361, size: 64)
!361 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !233)
!362 = !DISubprogram(name: "exit", scope: !363, file: !363, line: 624, type: !364, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!363 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!364 = !DISubroutineType(types: !365)
!365 = !{null, !247}
!366 = distinct !DISubprogram(name: "swap_bytes", scope: !236, file: !236, line: 79, type: !367, scopeLine: 79, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !369)
!367 = !DISubroutineType(types: !368)
!368 = !{null, !232, !247}
!369 = !{!370, !371, !372, !373}
!370 = !DILocalVariable(name: "bytes", arg: 1, scope: !366, file: !236, line: 79, type: !232)
!371 = !DILocalVariable(name: "num_bytes", arg: 2, scope: !366, file: !236, line: 79, type: !247)
!372 = !DILocalVariable(name: "i", scope: !366, file: !236, line: 80, type: !247)
!373 = !DILocalVariable(name: "tmp", scope: !366, file: !236, line: 81, type: !233)
!374 = !DILocation(line: 0, scope: !366)
!375 = !DILocation(line: 83, column: 18, scope: !376)
!376 = distinct !DILexicalBlock(scope: !377, file: !236, line: 83, column: 4)
!377 = distinct !DILexicalBlock(scope: !366, file: !236, line: 83, column: 4)
!378 = !DILocation(line: 83, column: 4, scope: !377)
!379 = !DILocation(line: 85, column: 13, scope: !380)
!380 = distinct !DILexicalBlock(scope: !376, file: !236, line: 83, column: 38)
!381 = !{!352, !352, i64 0}
!382 = !DILocation(line: 86, column: 38, scope: !380)
!383 = !DILocation(line: 86, column: 18, scope: !380)
!384 = !DILocation(line: 86, column: 16, scope: !380)
!385 = !DILocation(line: 87, column: 32, scope: !380)
!386 = !DILocation(line: 83, column: 34, scope: !376)
!387 = distinct !{!387, !378, !388, !389}
!388 = !DILocation(line: 88, column: 4, scope: !377)
!389 = !{!"llvm.loop.mustprogress"}
!390 = !DILocation(line: 89, column: 1, scope: !366)
!391 = distinct !DISubprogram(name: "calc_hist", scope: !236, file: !236, line: 95, type: !392, scopeLine: 95, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !394)
!392 = !DISubroutineType(types: !393)
!393 = !{!252, !252}
!394 = !{!395, !396, !398, !399, !400, !401, !402}
!395 = !DILocalVariable(name: "arg", arg: 1, scope: !391, file: !236, line: 95, type: !252)
!396 = !DILocalVariable(name: "red", scope: !391, file: !236, line: 97, type: !397)
!397 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 64)
!398 = !DILocalVariable(name: "green", scope: !391, file: !236, line: 98, type: !397)
!399 = !DILocalVariable(name: "blue", scope: !391, file: !236, line: 99, type: !397)
!400 = !DILocalVariable(name: "i", scope: !391, file: !236, line: 100, type: !247)
!401 = !DILocalVariable(name: "thread_arg", scope: !391, file: !236, line: 101, type: !234)
!402 = !DILocalVariable(name: "val", scope: !391, file: !236, line: 102, type: !240)
!403 = !DILocation(line: 0, scope: !391)
!404 = !DILocation(line: 108, column: 22, scope: !391)
!405 = !DILocation(line: 109, column: 24, scope: !391)
!406 = !DILocation(line: 110, column: 23, scope: !391)
!407 = !DILocation(line: 114, column: 24, scope: !408)
!408 = distinct !DILexicalBlock(scope: !391, file: !236, line: 114, column: 4)
!409 = !{!410, !412, i64 8}
!410 = !{!"", !411, i64 0, !412, i64 8, !412, i64 16, !352, i64 24, !352, i64 1048, !352, i64 2072}
!411 = !{!"any pointer", !352, i64 0}
!412 = !{!"long", !352, i64 0}
!413 = !{!410, !412, i64 16}
!414 = !DILocation(line: 115, column: 9, scope: !415)
!415 = distinct !DILexicalBlock(scope: !408, file: !236, line: 114, column: 4)
!416 = !DILocation(line: 115, column: 11, scope: !415)
!417 = !DILocation(line: 114, column: 4, scope: !408)
!418 = !{!410, !411, i64 0}
!419 = !DILocation(line: 118, column: 15, scope: !420)
!420 = distinct !DILexicalBlock(scope: !415, file: !236, line: 116, column: 15)
!421 = !DILocation(line: 119, column: 12, scope: !420)
!422 = !DILocation(line: 119, column: 7, scope: !420)
!423 = !DILocation(line: 119, column: 17, scope: !420)
!424 = !DILocation(line: 121, column: 15, scope: !420)
!425 = !DILocation(line: 122, column: 13, scope: !420)
!426 = !DILocation(line: 122, column: 7, scope: !420)
!427 = !DILocation(line: 122, column: 18, scope: !420)
!428 = !DILocation(line: 124, column: 15, scope: !420)
!429 = !DILocation(line: 125, column: 11, scope: !420)
!430 = !DILocation(line: 125, column: 7, scope: !420)
!431 = !DILocation(line: 125, column: 16, scope: !420)
!432 = !DILocation(line: 116, column: 10, scope: !415)
!433 = distinct !{!433, !417, !434, !389}
!434 = !DILocation(line: 126, column: 4, scope: !408)
!435 = !DILocation(line: 132, column: 4, scope: !391)
!436 = distinct !DISubprogram(name: "main", scope: !236, file: !236, line: 136, type: !437, scopeLine: 136, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !440)
!437 = !DISubroutineType(types: !438)
!438 = !{!247, !247, !439}
!439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !232, size: 64)
!440 = !{!441, !442, !443, !444, !445, !446, !447, !486, !487, !488, !494, !495, !496, !497, !498, !499, !500, !501, !502, !503, !504, !505}
!441 = !DILocalVariable(name: "argc", arg: 1, scope: !436, file: !236, line: 136, type: !247)
!442 = !DILocalVariable(name: "argv", arg: 2, scope: !436, file: !236, line: 136, type: !439)
!443 = !DILocalVariable(name: "i", scope: !436, file: !236, line: 138, type: !247)
!444 = !DILocalVariable(name: "j", scope: !436, file: !236, line: 138, type: !247)
!445 = !DILocalVariable(name: "fd", scope: !436, file: !236, line: 139, type: !247)
!446 = !DILocalVariable(name: "fdata", scope: !436, file: !236, line: 140, type: !232)
!447 = !DILocalVariable(name: "finfo", scope: !436, file: !236, line: 141, type: !448)
!448 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !449, line: 26, size: 1152, elements: !450)
!449 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_stat.h", directory: "", checksumkind: CSK_MD5, checksum: "3ba283bc334370fe631cbc82f5229ed7")
!450 = !{!451, !454, !456, !458, !460, !462, !464, !465, !466, !468, !470, !472, !480, !481, !482}
!451 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !448, file: !449, line: 31, baseType: !452, size: 64)
!452 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !453, line: 145, baseType: !258)
!453 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!454 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !448, file: !449, line: 36, baseType: !455, size: 64, offset: 64)
!455 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !453, line: 148, baseType: !258)
!456 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !448, file: !449, line: 44, baseType: !457, size: 64, offset: 128)
!457 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !453, line: 151, baseType: !258)
!458 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !448, file: !449, line: 45, baseType: !459, size: 32, offset: 192)
!459 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !453, line: 150, baseType: !7)
!460 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !448, file: !449, line: 47, baseType: !461, size: 32, offset: 224)
!461 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !453, line: 146, baseType: !7)
!462 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !448, file: !449, line: 48, baseType: !463, size: 32, offset: 256)
!463 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !453, line: 147, baseType: !7)
!464 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !448, file: !449, line: 50, baseType: !247, size: 32, offset: 288)
!465 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !448, file: !449, line: 52, baseType: !452, size: 64, offset: 320)
!466 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !448, file: !449, line: 57, baseType: !467, size: 64, offset: 384)
!467 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !453, line: 152, baseType: !243)
!468 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !448, file: !449, line: 61, baseType: !469, size: 64, offset: 448)
!469 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !453, line: 175, baseType: !243)
!470 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !448, file: !449, line: 63, baseType: !471, size: 64, offset: 512)
!471 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !453, line: 180, baseType: !243)
!472 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !448, file: !449, line: 74, baseType: !473, size: 128, offset: 576)
!473 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !474, line: 11, size: 128, elements: !475)
!474 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!475 = !{!476, !478}
!476 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !473, file: !474, line: 16, baseType: !477, size: 64)
!477 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !453, line: 160, baseType: !243)
!478 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !473, file: !474, line: 21, baseType: !479, size: 64, offset: 64)
!479 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !453, line: 197, baseType: !243)
!480 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !448, file: !449, line: 75, baseType: !473, size: 128, offset: 704)
!481 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !448, file: !449, line: 76, baseType: !473, size: 128, offset: 832)
!482 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !448, file: !449, line: 89, baseType: !483, size: 192, offset: 960)
!483 = !DICompositeType(tag: DW_TAG_array_type, baseType: !479, size: 192, elements: !484)
!484 = !{!485}
!485 = !DISubrange(count: 3)
!486 = !DILocalVariable(name: "fname", scope: !436, file: !236, line: 142, type: !232)
!487 = !DILocalVariable(name: "pid", scope: !436, file: !236, line: 143, type: !255)
!488 = !DILocalVariable(name: "attr", scope: !436, file: !236, line: 144, type: !489)
!489 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !257, line: 62, baseType: !490)
!490 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pthread_attr_t", file: !257, line: 56, size: 448, elements: !491)
!491 = !{!492, !493}
!492 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !490, file: !257, line: 58, baseType: !297, size: 448)
!493 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !490, file: !257, line: 59, baseType: !243, size: 64)
!494 = !DILocalVariable(name: "arg", scope: !436, file: !236, line: 145, type: !234)
!495 = !DILocalVariable(name: "red", scope: !436, file: !236, line: 146, type: !246)
!496 = !DILocalVariable(name: "green", scope: !436, file: !236, line: 147, type: !246)
!497 = !DILocalVariable(name: "blue", scope: !436, file: !236, line: 148, type: !246)
!498 = !DILocalVariable(name: "num_procs", scope: !436, file: !236, line: 149, type: !247)
!499 = !DILocalVariable(name: "num_per_thread", scope: !436, file: !236, line: 150, type: !247)
!500 = !DILocalVariable(name: "excess", scope: !436, file: !236, line: 151, type: !247)
!501 = !DILocalVariable(name: "bitsperpixel", scope: !436, file: !236, line: 177, type: !253)
!502 = !DILocalVariable(name: "data_pos", scope: !436, file: !236, line: 187, type: !253)
!503 = !DILocalVariable(name: "imgdata_bytes", scope: !436, file: !236, line: 192, type: !247)
!504 = !DILocalVariable(name: "num_pixels", scope: !436, file: !236, line: 193, type: !247)
!505 = !DILocalVariable(name: "curr_pos", scope: !436, file: !236, line: 216, type: !243)
!506 = distinct !DIAssignID()
!507 = !DILocation(line: 0, scope: !436)
!508 = distinct !DIAssignID()
!509 = distinct !DIAssignID()
!510 = distinct !DIAssignID()
!511 = distinct !DIAssignID()
!512 = !DILocation(line: 141, column: 4, scope: !436)
!513 = !DILocation(line: 144, column: 4, scope: !436)
!514 = !DILocation(line: 146, column: 4, scope: !436)
!515 = !DILocation(line: 147, column: 4, scope: !436)
!516 = !DILocation(line: 148, column: 4, scope: !436)
!517 = !DILocation(line: 155, column: 8, scope: !518)
!518 = distinct !DILexicalBlock(scope: !436, file: !236, line: 155, column: 8)
!519 = !{!411, !411, i64 0}
!520 = !DILocation(line: 155, column: 16, scope: !518)
!521 = !DILocation(line: 155, column: 8, scope: !436)
!522 = !DILocation(line: 156, column: 47, scope: !523)
!523 = distinct !DILexicalBlock(scope: !518, file: !236, line: 155, column: 25)
!524 = !DILocation(line: 156, column: 7, scope: !523)
!525 = !DILocation(line: 157, column: 7, scope: !523)
!526 = !DILocation(line: 163, column: 4, scope: !527)
!527 = distinct !DILexicalBlock(scope: !436, file: !236, line: 163, column: 4)
!528 = !DILocation(line: 163, column: 4, scope: !436)
!529 = !DILocation(line: 163, column: 4, scope: !530)
!530 = distinct !DILexicalBlock(scope: !527, file: !236, line: 163, column: 4)
!531 = !DILocation(line: 165, column: 4, scope: !532)
!532 = distinct !DILexicalBlock(scope: !436, file: !236, line: 165, column: 4)
!533 = !DILocation(line: 165, column: 4, scope: !436)
!534 = !DILocation(line: 165, column: 4, scope: !535)
!535 = distinct !DILexicalBlock(scope: !532, file: !236, line: 165, column: 4)
!536 = !DILocation(line: 167, column: 4, scope: !537)
!537 = distinct !DILexicalBlock(scope: !436, file: !236, line: 167, column: 4)
!538 = !{!539, !412, i64 48}
!539 = !{!"stat", !412, i64 0, !412, i64 8, !412, i64 16, !351, i64 24, !351, i64 28, !351, i64 32, !351, i64 36, !412, i64 40, !412, i64 48, !412, i64 56, !412, i64 64, !540, i64 72, !540, i64 88, !540, i64 104, !352, i64 120}
!540 = !{!"timespec", !412, i64 0, !412, i64 8}
!541 = !DILocation(line: 167, column: 4, scope: !436)
!542 = !DILocation(line: 167, column: 4, scope: !543)
!543 = distinct !DILexicalBlock(scope: !537, file: !236, line: 167, column: 4)
!544 = !DILocation(line: 170, column: 9, scope: !545)
!545 = distinct !DILexicalBlock(scope: !436, file: !236, line: 170, column: 8)
!546 = !DILocation(line: 170, column: 18, scope: !545)
!547 = !DILocation(line: 170, column: 26, scope: !545)
!548 = !DILocation(line: 170, column: 30, scope: !545)
!549 = !DILocation(line: 170, column: 39, scope: !545)
!550 = !DILocation(line: 170, column: 8, scope: !436)
!551 = !DILocation(line: 171, column: 7, scope: !552)
!552 = distinct !DILexicalBlock(scope: !545, file: !236, line: 170, column: 48)
!553 = !DILocation(line: 172, column: 7, scope: !552)
!554 = !DILocation(line: 0, scope: !340, inlinedAt: !555)
!555 = distinct !DILocation(line: 175, column: 4, scope: !436)
!556 = !DILocation(line: 64, column: 12, scope: !348, inlinedAt: !555)
!557 = !DILocation(line: 177, column: 56, scope: !436)
!558 = !DILocation(line: 181, column: 8, scope: !559)
!559 = distinct !DILexicalBlock(scope: !436, file: !236, line: 181, column: 8)
!560 = !{!561, !561, i64 0}
!561 = !{!"short", !352, i64 0}
!562 = !DILocation(line: 181, column: 22, scope: !559)
!563 = !DILocation(line: 181, column: 8, scope: !436)
!564 = !DILocation(line: 182, column: 7, scope: !565)
!565 = distinct !DILexicalBlock(scope: !559, file: !236, line: 181, column: 29)
!566 = !DILocation(line: 183, column: 7, scope: !565)
!567 = !DILocation(line: 184, column: 7, scope: !565)
!568 = !DILocation(line: 187, column: 52, scope: !436)
!569 = !DILocation(line: 192, column: 51, scope: !436)
!570 = !DILocation(line: 192, column: 24, scope: !436)
!571 = !DILocation(line: 192, column: 45, scope: !436)
!572 = !DILocation(line: 192, column: 43, scope: !436)
!573 = !DILocation(line: 193, column: 63, scope: !436)
!574 = !DILocation(line: 194, column: 4, scope: !436)
!575 = !DILocation(line: 197, column: 4, scope: !436)
!576 = !DILocation(line: 200, column: 4, scope: !436)
!577 = distinct !DIAssignID()
!578 = !DILocation(line: 201, column: 4, scope: !436)
!579 = distinct !DIAssignID()
!580 = !DILocation(line: 202, column: 4, scope: !436)
!581 = distinct !DIAssignID()
!582 = !DILocation(line: 205, column: 4, scope: !436)
!583 = !DILocation(line: 206, column: 4, scope: !436)
!584 = !DILocation(line: 208, column: 4, scope: !585)
!585 = distinct !DILexicalBlock(scope: !436, file: !236, line: 208, column: 4)
!586 = !DILocation(line: 208, column: 4, scope: !436)
!587 = !DILocation(line: 208, column: 4, scope: !588)
!588 = distinct !DILexicalBlock(scope: !585, file: !236, line: 208, column: 4)
!589 = !DILocation(line: 209, column: 32, scope: !436)
!590 = !DILocation(line: 210, column: 24, scope: !436)
!591 = !DILocation(line: 212, column: 4, scope: !592)
!592 = distinct !DILexicalBlock(scope: !436, file: !236, line: 212, column: 4)
!593 = !DILocation(line: 212, column: 4, scope: !436)
!594 = !DILocation(line: 212, column: 4, scope: !595)
!595 = distinct !DILexicalBlock(scope: !592, file: !236, line: 212, column: 4)
!596 = !DILocation(line: 213, column: 4, scope: !597)
!597 = distinct !DILexicalBlock(scope: !436, file: !236, line: 213, column: 4)
!598 = !DILocation(line: 213, column: 4, scope: !436)
!599 = !DILocation(line: 213, column: 4, scope: !600)
!600 = distinct !DILexicalBlock(scope: !597, file: !236, line: 213, column: 4)
!601 = !DILocation(line: 216, column: 27, scope: !436)
!602 = !DILocation(line: 216, column: 20, scope: !436)
!603 = !DILocation(line: 217, column: 18, scope: !604)
!604 = distinct !DILexicalBlock(scope: !605, file: !236, line: 217, column: 4)
!605 = distinct !DILexicalBlock(scope: !436, file: !236, line: 217, column: 4)
!606 = !DILocation(line: 217, column: 4, scope: !605)
!607 = !DILocation(line: 232, column: 4, scope: !608)
!608 = distinct !DILexicalBlock(scope: !436, file: !236, line: 232, column: 4)
!609 = !DILocation(line: 232, column: 18, scope: !610)
!610 = distinct !DILexicalBlock(scope: !608, file: !236, line: 232, column: 4)
!611 = !DILocation(line: 218, column: 7, scope: !612)
!612 = distinct !DILexicalBlock(scope: !604, file: !236, line: 217, column: 36)
!613 = !DILocation(line: 218, column: 19, scope: !612)
!614 = !DILocation(line: 219, column: 14, scope: !612)
!615 = !DILocation(line: 219, column: 23, scope: !612)
!616 = !DILocation(line: 220, column: 14, scope: !612)
!617 = !DILocation(line: 221, column: 18, scope: !618)
!618 = distinct !DILexicalBlock(scope: !612, file: !236, line: 221, column: 11)
!619 = !DILocation(line: 221, column: 11, scope: !612)
!620 = !DILocation(line: 226, column: 23, scope: !612)
!621 = !DILocation(line: 227, column: 16, scope: !612)
!622 = !DILocation(line: 229, column: 24, scope: !612)
!623 = !DILocation(line: 229, column: 7, scope: !612)
!624 = !DILocation(line: 217, column: 32, scope: !604)
!625 = distinct !{!625, !606, !626, !389}
!626 = !DILocation(line: 230, column: 4, scope: !605)
!627 = !DILocation(line: 236, column: 4, scope: !628)
!628 = distinct !DILexicalBlock(scope: !436, file: !236, line: 236, column: 4)
!629 = !DILocation(line: 236, column: 18, scope: !630)
!630 = distinct !DILexicalBlock(scope: !628, file: !236, line: 236, column: 4)
!631 = !DILocation(line: 233, column: 20, scope: !632)
!632 = distinct !DILexicalBlock(scope: !610, file: !236, line: 232, column: 36)
!633 = !{!412, !412, i64 0}
!634 = !DILocation(line: 233, column: 7, scope: !632)
!635 = !DILocation(line: 232, column: 32, scope: !610)
!636 = distinct !{!636, !607, !637, !389}
!637 = !DILocation(line: 234, column: 4, scope: !608)
!638 = !DILocation(line: 237, column: 7, scope: !639)
!639 = distinct !DILexicalBlock(scope: !640, file: !236, line: 237, column: 7)
!640 = distinct !DILexicalBlock(scope: !630, file: !236, line: 236, column: 36)
!641 = !DILocation(line: 237, column: 29, scope: !642)
!642 = distinct !DILexicalBlock(scope: !639, file: !236, line: 237, column: 7)
!643 = !DILocation(line: 238, column: 20, scope: !644)
!644 = distinct !DILexicalBlock(scope: !642, file: !236, line: 237, column: 33)
!645 = !DILocation(line: 238, column: 10, scope: !644)
!646 = !DILocation(line: 238, column: 17, scope: !644)
!647 = !DILocation(line: 239, column: 22, scope: !644)
!648 = !DILocation(line: 239, column: 10, scope: !644)
!649 = !DILocation(line: 239, column: 19, scope: !644)
!650 = !DILocation(line: 240, column: 21, scope: !644)
!651 = !DILocation(line: 240, column: 10, scope: !644)
!652 = !DILocation(line: 240, column: 18, scope: !644)
!653 = distinct !{!653, !638, !654, !389, !655, !656}
!654 = !DILocation(line: 241, column: 7, scope: !639)
!655 = !{!"llvm.loop.isvectorized", i32 1}
!656 = !{!"llvm.loop.unroll.runtime.disable"}
!657 = !DILocation(line: 262, column: 4, scope: !658)
!658 = distinct !DILexicalBlock(scope: !436, file: !236, line: 262, column: 4)
!659 = !DILocation(line: 262, column: 4, scope: !436)
!660 = !DILocation(line: 236, column: 32, scope: !630)
!661 = distinct !{!661, !627, !662, !389}
!662 = !DILocation(line: 242, column: 4, scope: !628)
!663 = !DILocation(line: 262, column: 4, scope: !664)
!664 = distinct !DILexicalBlock(scope: !658, file: !236, line: 262, column: 4)
!665 = !DILocation(line: 263, column: 4, scope: !666)
!666 = distinct !DILexicalBlock(scope: !436, file: !236, line: 263, column: 4)
!667 = !DILocation(line: 263, column: 4, scope: !436)
!668 = !DILocation(line: 263, column: 4, scope: !669)
!669 = distinct !DILexicalBlock(scope: !666, file: !236, line: 263, column: 4)
!670 = !DILocation(line: 265, column: 4, scope: !436)
!671 = !DILocation(line: 266, column: 4, scope: !672)
!672 = distinct !DILexicalBlock(scope: !436, file: !236, line: 266, column: 4)
!673 = !DILocation(line: 266, column: 17, scope: !674)
!674 = distinct !DILexicalBlock(scope: !672, file: !236, line: 266, column: 4)
!675 = !DILocation(line: 267, column: 12, scope: !676)
!676 = distinct !DILexicalBlock(scope: !674, file: !236, line: 266, column: 35)
!677 = !DILocation(line: 267, column: 19, scope: !676)
!678 = !DILocation(line: 267, column: 7, scope: !676)
!679 = !DILocation(line: 268, column: 19, scope: !676)
!680 = !DILocation(line: 268, column: 7, scope: !676)
!681 = !DILocation(line: 269, column: 19, scope: !676)
!682 = !DILocation(line: 269, column: 7, scope: !676)
!683 = !DILocation(line: 266, column: 31, scope: !674)
!684 = distinct !{!684, !671, !685, !389}
!685 = !DILocation(line: 270, column: 4, scope: !672)
!686 = !DILocation(line: 271, column: 4, scope: !436)
!687 = !DILocation(line: 272, column: 4, scope: !436)
!688 = !DILocation(line: 275, column: 1, scope: !436)
!689 = !DILocation(line: 274, column: 4, scope: !436)
!690 = !DISubprogram(name: "open", scope: !691, file: !691, line: 181, type: !692, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!691 = !DIFile(filename: "/usr/include/fcntl.h", directory: "", checksumkind: CSK_MD5, checksum: "1a9bb91818c37dc7bc291ca6e49fc221")
!692 = !DISubroutineType(types: !693)
!693 = !{!247, !360, !247, null}
!694 = !DISubprogram(name: "perror", scope: !356, file: !356, line: 804, type: !695, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!695 = !DISubroutineType(types: !696)
!696 = !{null, !360}
!697 = !DISubprogram(name: "fstat", scope: !698, file: !698, line: 210, type: !699, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!698 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/stat.h", directory: "", checksumkind: CSK_MD5, checksum: "1e5cd132abb12ea0c79aeae3bfa4573e")
!699 = !DISubroutineType(types: !700)
!700 = !{!247, !247, !701}
!701 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !448, size: 64)
!702 = !DISubprogram(name: "mmap", scope: !703, file: !703, line: 57, type: !704, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!703 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/mman.h", directory: "", checksumkind: CSK_MD5, checksum: "93a87cc3b0558893646eb0c257165272")
!704 = !DISubroutineType(types: !705)
!705 = !{!252, !252, !706, !247, !247, !247, !467}
!706 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !707, line: 18, baseType: !258)
!707 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!708 = !DISubprogram(name: "pthread_attr_init", scope: !6, file: !6, line: 285, type: !709, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!709 = !DISubroutineType(types: !710)
!710 = !{!247, !711}
!711 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !489, size: 64)
!712 = !DISubprogram(name: "pthread_attr_setscope", scope: !6, file: !6, line: 349, type: !713, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!713 = !DISubroutineType(types: !714)
!714 = !{!247, !711, !247}
!715 = !DISubprogram(name: "sysconf", scope: !716, file: !716, line: 640, type: !717, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!716 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "ed37c2e6f30ba31a8b41e4d70547c39c")
!717 = !DISubroutineType(types: !718)
!718 = !{!243, !247}
!719 = !DISubprogram(name: "malloc", scope: !363, file: !363, line: 540, type: !720, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!720 = !DISubroutineType(types: !721)
!721 = !{!252, !706}
!722 = !DISubprogram(name: "calloc", scope: !363, file: !363, line: 543, type: !723, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!723 = !DISubroutineType(types: !724)
!724 = !{!252, !706, !706}
!725 = !DISubprogram(name: "pthread_create", scope: !6, file: !6, line: 202, type: !726, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!726 = !DISubroutineType(types: !727)
!727 = !{!247, !728, !729, !732, !733}
!728 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !255)
!729 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !730)
!730 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !731, size: 64)
!731 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !489)
!732 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !392, size: 64)
!733 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !252)
!734 = !DISubprogram(name: "pthread_join", scope: !6, file: !6, line: 219, type: !735, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!735 = !DISubroutineType(types: !736)
!736 = !{!247, !256, !737}
!737 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !252, size: 64)
!738 = !DISubprogram(name: "munmap", scope: !703, file: !703, line: 76, type: !739, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!739 = !DISubroutineType(types: !740)
!740 = !{!247, !252, !706}
!741 = !DISubprogram(name: "close", scope: !716, file: !716, line: 358, type: !742, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!742 = !DISubroutineType(types: !743)
!743 = !{!247, !247}
!744 = !DISubprogram(name: "free", scope: !363, file: !363, line: 555, type: !745, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!745 = !DISubroutineType(types: !746)
!746 = !{null, !252}
!747 = !DISubprogram(name: "pthread_attr_destroy", scope: !6, file: !6, line: 288, type: !709, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
