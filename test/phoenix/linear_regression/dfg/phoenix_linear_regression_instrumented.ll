; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/linear_regression/dfg/phoenix_linear_regression.ll'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/linear_regression/linear_regression_pthread.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.POINT_T = type { i8, i8 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%union.pthread_attr_t = type { i64, [48 x i8] }
%struct.lreg_args = type { i64, ptr, i32, i64, i64, i64, i64, i64 }

@.str = private unnamed_addr constant [22 x i8] c"USAGE: %s <filename>\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [59 x i8] c"Error at line\0A\09(fd = open(fname, O_RDONLY)) < 0\0ASystem Msg\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [48 x i8] c"Error at line\0A\09fstat(fd, &finfo) < 0\0ASystem Msg\00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [115 x i8] c"Error at line\0A\09(fdata = mmap(0, finfo.st_size + 1, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0)) == NULL\0ASystem Msg\00", align 1, !dbg !17
@.str.4 = private unnamed_addr constant [75 x i8] c"Error at line\0A\09(num_procs = sysconf(_SC_NPROCESSORS_ONLN)) <= 0\0ASystem Msg\00", align 1, !dbg !22
@.str.5 = private unnamed_addr constant [33 x i8] c"The number of processors is %d\0A\0A\00", align 1, !dbg !27
@.str.7 = private unnamed_addr constant [119 x i8] c"Error at line\0A\09pthread_create(&tid_args[i].tid, &attr, linear_regression_pthread, (void*)&tid_args[i]) != 0\0ASystem Msg\00", align 1, !dbg !32
@.str.8 = private unnamed_addr constant [87 x i8] c"Error at line\0A\09pthread_join(tid_args[i].tid, (void **)(void*)&ret_val) != 0\0ASystem Msg\00", align 1, !dbg !37
@.str.9 = private unnamed_addr constant [39 x i8] c"Error at line\0A\09ret_val != 0\0ASystem Msg\00", align 1, !dbg !42
@.str.11 = private unnamed_addr constant [13 x i8] c"\09a    = %lf\0A\00", align 1, !dbg !47
@.str.12 = private unnamed_addr constant [13 x i8] c"\09b    = %lf\0A\00", align 1, !dbg !52
@.str.13 = private unnamed_addr constant [13 x i8] c"\09xbar = %lf\0A\00", align 1, !dbg !54
@.str.14 = private unnamed_addr constant [13 x i8] c"\09ybar = %lf\0A\00", align 1, !dbg !56
@.str.15 = private unnamed_addr constant [13 x i8] c"\09r2   = %lf\0A\00", align 1, !dbg !58
@.str.16 = private unnamed_addr constant [14 x i8] c"\09SX   = %lld\0A\00", align 1, !dbg !60
@.str.17 = private unnamed_addr constant [14 x i8] c"\09SY   = %lld\0A\00", align 1, !dbg !65
@.str.18 = private unnamed_addr constant [14 x i8] c"\09SXX  = %lld\0A\00", align 1, !dbg !67
@.str.19 = private unnamed_addr constant [14 x i8] c"\09SYY  = %lld\0A\00", align 1, !dbg !69
@.str.20 = private unnamed_addr constant [14 x i8] c"\09SXY  = %lld\0A\00", align 1, !dbg !71
@.str.21 = private unnamed_addr constant [58 x i8] c"Error at line\0A\09pthread_attr_destroy(&attr) < 0\0ASystem Msg\00", align 1, !dbg !73
@.str.22 = private unnamed_addr constant [63 x i8] c"Error at line\0A\09munmap(fdata, finfo.st_size + 1) < 0\0ASystem Msg\00", align 1, !dbg !78
@.str.23 = private unnamed_addr constant [40 x i8] c"Error at line\0A\09close(fd) < 0\0ASystem Msg\00", align 1, !dbg !83
@.str.24 = private unnamed_addr constant [5 x i8] c"temp\00", align 1, !dbg !88
@.str.25 = private unnamed_addr constant [111 x i8] c"/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/linear_regression/stddefines.h\00", align 1, !dbg !94
@__PRETTY_FUNCTION__.CALLOC = private unnamed_addr constant [29 x i8] c"void *CALLOC(size_t, size_t)\00", align 1, !dbg !99
@str = private unnamed_addr constant [40 x i8] c"Linear Regression P-Threads: Running...\00", align 1
@str.26 = private unnamed_addr constant [37 x i8] c"Linear Regression P-Threads Results:\00", align 1

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable
define dso_local noalias noundef ptr @linear_regression_pthread(ptr nocapture noundef %0) #0 !dbg !380 {
    #dbg_value(ptr %0, !384, !DIExpression(), !387)
    #dbg_value(ptr %0, !385, !DIExpression(), !387)
  %2 = getelementptr inbounds i8, ptr %0, i64 24, !dbg !388
  call void @__record_field_access_full(i32 0, ptr %2, i32 1), !dbg !389
  %3 = getelementptr inbounds i8, ptr %0, i64 40, !dbg !389
  call void @__record_field_access_full(i32 1, ptr %3, i32 1), !dbg !390
  %4 = getelementptr inbounds i8, ptr %0, i64 32, !dbg !390
  call void @__record_field_access_full(i32 2, ptr %4, i32 1), !dbg !391
  %5 = getelementptr inbounds i8, ptr %0, i64 48, !dbg !391
  call void @__record_field_access_full(i32 3, ptr %5, i32 1), !dbg !392
  %6 = getelementptr inbounds i8, ptr %0, i64 56, !dbg !392
    #dbg_value(i32 0, !386, !DIExpression(), !387)
  call void @__record_field_access_full(i32 4, ptr %6, i32 1)
  %7 = getelementptr inbounds i8, ptr %0, i64 16
  call void @__record_field_access_full(i32 5, ptr %7, i32 0), !dbg !393
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(40) %2, i8 0, i64 40, i1 false), !dbg !393
  %8 = load i32, ptr %7, align 8, !tbaa !394
    #dbg_value(i32 0, !386, !DIExpression(), !387)
  %9 = icmp sgt i32 %8, 0, !dbg !402
  br i1 %9, label %10, label %104, !dbg !405

10:                                               ; preds = %1
  %11 = getelementptr inbounds i8, ptr %0, i64 8
  call void @__record_field_access_full(i32 6, ptr %11, i32 0)
  %12 = load ptr, ptr %11, align 8, !tbaa !406
  %13 = zext nneg i32 %8 to i64, !dbg !402
  %14 = and i64 %13, 1, !dbg !405
  %15 = icmp eq i32 %8, 1, !dbg !405
  br i1 %15, label %66, label %16, !dbg !405

16:                                               ; preds = %10
  %17 = and i64 %13, 2147483646, !dbg !405
  br label %18, !dbg !405

18:                                               ; preds = %18, %16
  %19 = phi i64 [ 0, %16 ], [ %63, %18 ], !dbg !407
  %20 = phi i64 [ 0, %16 ], [ %62, %18 ], !dbg !407
  %21 = phi i64 [ 0, %16 ], [ %60, %18 ], !dbg !407
  %22 = phi i64 [ 0, %16 ], [ %56, %18 ], !dbg !407
  %23 = phi i64 [ 0, %16 ], [ %52, %18 ], !dbg !407
  %24 = phi i64 [ 0, %16 ], [ %48, %18 ], !dbg !407
  %25 = phi i64 [ 0, %16 ], [ %64, %18 ]
    #dbg_value(i64 %19, !386, !DIExpression(), !387)
  %26 = getelementptr inbounds %struct.POINT_T, ptr %12, i64 %19, !dbg !407
  call void @__record_field_access_full(i32 7, ptr %26, i32 0), !dbg !409
  %27 = load i8, ptr %26, align 1, !dbg !409, !tbaa !410
  %28 = sext i8 %27 to i64, !dbg !407
  %29 = add nsw i64 %24, %28, !dbg !412
  %30 = sext i8 %27 to i32, !dbg !413
  %31 = mul nsw i32 %30, %30, !dbg !414
  %32 = zext nneg i32 %31 to i64, !dbg !413
  %33 = add nuw nsw i64 %23, %32, !dbg !415
  %34 = getelementptr inbounds %struct.POINT_T, ptr %12, i64 %19, i32 1, !dbg !416
  call void @__record_field_access_full(i32 6, ptr %34, i32 0), !dbg !416
  %35 = load i8, ptr %34, align 1, !dbg !416, !tbaa !417
  %36 = sext i8 %35 to i64, !dbg !418
  %37 = add nsw i64 %22, %36, !dbg !419
  %38 = sext i8 %35 to i32, !dbg !420
  %39 = mul nsw i32 %38, %38, !dbg !421
  %40 = zext nneg i32 %39 to i64, !dbg !420
  %41 = add nuw nsw i64 %21, %40, !dbg !422
  %42 = mul nsw i64 %36, %28, !dbg !423
  %43 = add nsw i64 %42, %20, !dbg !424
  %44 = or disjoint i64 %19, 1, !dbg !425
    #dbg_value(i64 %44, !386, !DIExpression(), !387)
  %45 = getelementptr inbounds %struct.POINT_T, ptr %12, i64 %44, !dbg !407
  call void @__record_field_access_full(i32 7, ptr %45, i32 0), !dbg !409
  %46 = load i8, ptr %45, align 1, !dbg !409, !tbaa !410
  %47 = sext i8 %46 to i64, !dbg !407
  %48 = add nsw i64 %29, %47, !dbg !412
  %49 = sext i8 %46 to i32, !dbg !413
  %50 = mul nsw i32 %49, %49, !dbg !414
  %51 = zext nneg i32 %50 to i64, !dbg !413
  %52 = add nuw nsw i64 %33, %51, !dbg !415
  %53 = getelementptr inbounds %struct.POINT_T, ptr %12, i64 %44, i32 1, !dbg !416
  call void @__record_field_access_full(i32 6, ptr %53, i32 0), !dbg !416
  %54 = load i8, ptr %53, align 1, !dbg !416, !tbaa !417
  %55 = sext i8 %54 to i64, !dbg !418
  %56 = add nsw i64 %37, %55, !dbg !419
  %57 = sext i8 %54 to i32, !dbg !420
  %58 = mul nsw i32 %57, %57, !dbg !421
  %59 = zext nneg i32 %58 to i64, !dbg !420
  %60 = add nuw nsw i64 %41, %59, !dbg !422
  %61 = mul nsw i64 %55, %47, !dbg !423
  %62 = add nsw i64 %61, %43, !dbg !424
  %63 = add nuw nsw i64 %19, 2, !dbg !425
    #dbg_value(i64 %63, !386, !DIExpression(), !387)
  %64 = add nuw i64 %25, 2, !dbg !405
  %65 = icmp eq i64 %64, %17, !dbg !405
  br i1 %65, label %66, label %18, !dbg !405, !llvm.loop !426

66:                                               ; preds = %18, %10
  %67 = phi i64 [ poison, %10 ], [ %48, %18 ]
  %68 = phi i64 [ poison, %10 ], [ %52, %18 ]
  %69 = phi i64 [ poison, %10 ], [ %56, %18 ]
  %70 = phi i64 [ poison, %10 ], [ %60, %18 ]
  %71 = phi i64 [ poison, %10 ], [ %62, %18 ]
  %72 = phi i64 [ 0, %10 ], [ %63, %18 ]
  %73 = phi i64 [ 0, %10 ], [ %62, %18 ]
  %74 = phi i64 [ 0, %10 ], [ %60, %18 ]
  %75 = phi i64 [ 0, %10 ], [ %56, %18 ]
  %76 = phi i64 [ 0, %10 ], [ %52, %18 ]
  %77 = phi i64 [ 0, %10 ], [ %48, %18 ]
  %78 = icmp eq i64 %14, 0, !dbg !405
  br i1 %78, label %98, label %79, !dbg !405

79:                                               ; preds = %66
    #dbg_value(i64 %72, !386, !DIExpression(), !387)
  %80 = getelementptr inbounds %struct.POINT_T, ptr %12, i64 %72, !dbg !407
  call void @__record_field_access_full(i32 7, ptr %80, i32 0), !dbg !409
  %81 = load i8, ptr %80, align 1, !dbg !409, !tbaa !410
  %82 = sext i8 %81 to i64, !dbg !407
  %83 = add nsw i64 %77, %82, !dbg !412
  %84 = sext i8 %81 to i32, !dbg !413
  %85 = mul nsw i32 %84, %84, !dbg !414
  %86 = zext nneg i32 %85 to i64, !dbg !413
  %87 = add nuw nsw i64 %76, %86, !dbg !415
  %88 = getelementptr inbounds %struct.POINT_T, ptr %12, i64 %72, i32 1, !dbg !416
  call void @__record_field_access_full(i32 6, ptr %88, i32 0), !dbg !416
  %89 = load i8, ptr %88, align 1, !dbg !416, !tbaa !417
  %90 = sext i8 %89 to i64, !dbg !418
  %91 = add nsw i64 %75, %90, !dbg !419
  %92 = sext i8 %89 to i32, !dbg !420
  %93 = mul nsw i32 %92, %92, !dbg !421
  %94 = zext nneg i32 %93 to i64, !dbg !420
  %95 = add nuw nsw i64 %74, %94, !dbg !422
  %96 = mul nsw i64 %90, %82, !dbg !423
  %97 = add nsw i64 %96, %73, !dbg !424
    #dbg_value(i64 %72, !386, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !387)
  br label %98, !dbg !412

98:                                               ; preds = %79, %66
  %99 = phi i64 [ %67, %66 ], [ %83, %79 ], !dbg !412
  %100 = phi i64 [ %68, %66 ], [ %87, %79 ], !dbg !415
  %101 = phi i64 [ %69, %66 ], [ %91, %79 ], !dbg !419
  %102 = phi i64 [ %70, %66 ], [ %95, %79 ], !dbg !422
  %103 = phi i64 [ %71, %66 ], [ %97, %79 ], !dbg !424
  store i64 %99, ptr %2, align 8, !dbg !412, !tbaa !429
  store i64 %100, ptr %3, align 8, !dbg !415, !tbaa !430
  store i64 %101, ptr %4, align 8, !dbg !419, !tbaa !431
  store i64 %102, ptr %5, align 8, !dbg !422, !tbaa !432
  store i64 %103, ptr %6, align 8, !dbg !424, !tbaa !433
  br label %104, !dbg !405

104:                                              ; preds = %98, %1
  ret ptr null, !dbg !434
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #2 !dbg !435 {
  %3 = alloca %struct.stat, align 8, !DIAssignID !521
    #dbg_assign(i1 undef, !446, !DIExpression(), !521, ptr %3, !DIExpression(), !522)
  %4 = alloca %union.pthread_attr_t, align 8, !DIAssignID !523
    #dbg_assign(i1 undef, !490, !DIExpression(), !523, ptr %4, !DIExpression(), !522)
  %5 = alloca i32, align 4, !DIAssignID !524
    #dbg_assign(i1 undef, !507, !DIExpression(), !524, ptr %5, !DIExpression(), !525)
    #dbg_value(i32 %0, !441, !DIExpression(), !522)
    #dbg_value(ptr %1, !442, !DIExpression(), !522)
  call void @llvm.lifetime.start.p0(i64 144, ptr nonnull %3) #13, !dbg !526
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %4) #13, !dbg !527
  %6 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !528
  call void @__record_field_access_full(i32 8, ptr %6, i32 0), !dbg !528
  %7 = load ptr, ptr %6, align 8, !dbg !528, !tbaa !530
  %8 = icmp eq ptr %7, null, !dbg !531
  br i1 %8, label %9, label %12, !dbg !532

9:                                                ; preds = %2
  call void @__record_field_access_full(i32 9, ptr %1, i32 0), !dbg !533
  %10 = load ptr, ptr %1, align 8, !dbg !533, !tbaa !530
  %11 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, ptr noundef %10), !dbg !535
  tail call void @exit(i32 noundef 1) #14, !dbg !536
  unreachable, !dbg !536

12:                                               ; preds = %2
    #dbg_value(ptr %7, !445, !DIExpression(), !522)
  %13 = tail call i32 (ptr, i32, ...) @open(ptr noundef nonnull %7, i32 noundef 0) #13, !dbg !537
    #dbg_value(i32 %13, !443, !DIExpression(), !522)
  %14 = icmp slt i32 %13, 0, !dbg !537
  br i1 %14, label %15, label %16, !dbg !539

15:                                               ; preds = %12
  tail call void @perror(ptr noundef nonnull @.str.1) #15, !dbg !540
  tail call void @exit(i32 noundef 1) #14, !dbg !540
  unreachable, !dbg !540

16:                                               ; preds = %12
  %17 = call i32 @fstat(i32 noundef %13, ptr noundef nonnull %3) #13, !dbg !542
  %18 = icmp slt i32 %17, 0, !dbg !542
  br i1 %18, label %19, label %20, !dbg !544

19:                                               ; preds = %16
  tail call void @perror(ptr noundef nonnull @.str.2) #15, !dbg !545
  tail call void @exit(i32 noundef 1) #14, !dbg !545
  unreachable, !dbg !545

20:                                               ; preds = %16
  %21 = getelementptr inbounds i8, ptr %3, i64 48, !dbg !547
  call void @__record_field_access_full(i32 10, ptr %21, i32 0), !dbg !547
  %22 = load i64, ptr %21, align 8, !dbg !547, !tbaa !549
  %23 = add nsw i64 %22, 1, !dbg !547
  %24 = tail call ptr @mmap(ptr noundef null, i64 noundef %23, i32 noundef 3, i32 noundef 2, i32 noundef %13, i64 noundef 0) #13, !dbg !547
    #dbg_value(ptr %24, !444, !DIExpression(), !522)
  %25 = icmp eq ptr %24, null, !dbg !547
  br i1 %25, label %26, label %27, !dbg !552

26:                                               ; preds = %20
  tail call void @perror(ptr noundef nonnull @.str.3) #15, !dbg !553
  tail call void @exit(i32 noundef 1) #14, !dbg !553
  unreachable, !dbg !553

27:                                               ; preds = %20
  %28 = tail call i64 @sysconf(i32 noundef 84) #13, !dbg !555
  %29 = trunc i64 %28 to i32, !dbg !555
    #dbg_value(i32 %29, !488, !DIExpression(), !522)
  %30 = icmp slt i32 %29, 1, !dbg !555
  br i1 %30, label %31, label %32, !dbg !557

31:                                               ; preds = %27
  tail call void @perror(ptr noundef nonnull @.str.4) #15, !dbg !558
  tail call void @exit(i32 noundef 1) #14, !dbg !558
  unreachable, !dbg !558

32:                                               ; preds = %27
  %33 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %29), !dbg !560
  %34 = call i32 @pthread_attr_init(ptr noundef nonnull %4) #13, !dbg !561
  %35 = call i32 @pthread_attr_setscope(ptr noundef nonnull %4, i32 noundef 0) #13, !dbg !562
    #dbg_value(i32 %29, !487, !DIExpression(), !522)
  %36 = call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !563
    #dbg_value(ptr %24, !500, !DIExpression(), !522)
  %37 = lshr i64 %22, 1, !dbg !564
    #dbg_value(i64 %37, !501, !DIExpression(), !522)
  %38 = and i64 %28, 2147483647, !dbg !565
  %39 = udiv i64 %37, %38, !dbg !566
  %40 = trunc i64 %39 to i32, !dbg !567
    #dbg_value(i32 %40, !486, !DIExpression(), !522)
    #dbg_value(i64 64, !568, !DIExpression(), !577)
    #dbg_value(i64 %38, !575, !DIExpression(), !577)
  %41 = call noalias ptr @calloc(i64 noundef 64, i64 noundef %38) #16, !dbg !579
    #dbg_value(ptr %41, !576, !DIExpression(), !577)
  %42 = icmp eq ptr %41, null, !dbg !580
  br i1 %42, label %50, label %43, !dbg !583

43:                                               ; preds = %32
    #dbg_value(i32 0, !489, !DIExpression(), !522)
  %44 = add i64 %28, 4294967295
  %45 = trunc i64 %37 to i32
  %46 = shl i64 %39, 32, !dbg !584
  %47 = ashr exact i64 %46, 32, !dbg !584
  %48 = and i64 %44, 4294967295, !dbg !584
  %49 = and i64 %28, 2147483647, !dbg !586
  br label %57, !dbg !584

50:                                               ; preds = %32
  call void @__assert_fail(ptr noundef nonnull @.str.24, ptr noundef nonnull @.str.25, i32 noundef 53, ptr noundef nonnull @__PRETTY_FUNCTION__.CALLOC) #14, !dbg !580
  unreachable, !dbg !580

51:                                               ; preds = %57
  %52 = add nuw nsw i64 %58, 1, !dbg !588
    #dbg_value(i64 %52, !489, !DIExpression(), !522)
  %53 = icmp eq i64 %52, %49, !dbg !586
  br i1 %53, label %54, label %57, !dbg !584, !llvm.loop !589

54:                                               ; preds = %51
    #dbg_value(i32 0, !489, !DIExpression(), !522)
    #dbg_value(i64 0, !502, !DIExpression(), !522)
    #dbg_value(i64 0, !503, !DIExpression(), !522)
    #dbg_value(i64 0, !504, !DIExpression(), !522)
    #dbg_value(i64 0, !505, !DIExpression(), !522)
    #dbg_value(i64 0, !506, !DIExpression(), !522)
  %55 = call i32 @llvm.smax.i32(i32 %29, i32 1), !dbg !591
  %56 = zext nneg i32 %55 to i64, !dbg !592
  br label %71, !dbg !591

57:                                               ; preds = %51, %43
  %58 = phi i64 [ 0, %43 ], [ %52, %51 ]
    #dbg_value(i64 %58, !489, !DIExpression(), !522)
  %59 = mul nsw i64 %58, %47, !dbg !593
  %60 = getelementptr inbounds %struct.POINT_T, ptr %24, i64 %59, !dbg !595
  call void @__record_field_access_full(i32 6, ptr %60, i32 1), !dbg !596
  %61 = getelementptr inbounds %struct.lreg_args, ptr %41, i64 %58, !dbg !596
  call void @__record_field_access_full(i32 11, ptr %61, i32 0), !dbg !597
  %62 = getelementptr inbounds i8, ptr %61, i64 8, !dbg !597
  call void @__record_field_access_full(i32 6, ptr %62, i32 1), !dbg !598
  store ptr %60, ptr %62, align 8, !dbg !598, !tbaa !406
  %63 = getelementptr inbounds i8, ptr %61, i64 16, !dbg !599
  %64 = icmp eq i64 %58, %48, !dbg !600
  %65 = trunc nsw i64 %59 to i32, !dbg !602
  %66 = sub i32 %45, %65, !dbg !602
  %67 = select i1 %64, i32 %66, i32 %40, !dbg !602
  call void @__record_field_access_full(i32 5, ptr %63, i32 1), !dbg !603
  store i32 %67, ptr %63, align 8, !dbg !603, !tbaa !394
  %68 = call i32 @pthread_create(ptr noundef nonnull %61, ptr noundef nonnull %4, ptr noundef nonnull @linear_regression_pthread, ptr noundef nonnull %61) #13, !dbg !604
  %69 = icmp eq i32 %68, 0, !dbg !604
    #dbg_value(i64 %58, !489, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !522)
  br i1 %69, label %51, label %70, !dbg !606

70:                                               ; preds = %57
  call void @perror(ptr noundef nonnull @.str.7) #15, !dbg !607
  call void @exit(i32 noundef 1) #14, !dbg !607
  unreachable, !dbg !607

71:                                               ; preds = %87, %54
  %72 = phi i64 [ 0, %54 ], [ %103, %87 ]
  %73 = phi i64 [ 0, %54 ], [ %90, %87 ]
  %74 = phi i64 [ 0, %54 ], [ %93, %87 ]
  %75 = phi i64 [ 0, %54 ], [ %96, %87 ]
  %76 = phi i64 [ 0, %54 ], [ %99, %87 ]
  %77 = phi i64 [ 0, %54 ], [ %102, %87 ]
    #dbg_value(i64 %72, !489, !DIExpression(), !522)
    #dbg_value(i64 %73, !502, !DIExpression(), !522)
    #dbg_value(i64 %74, !503, !DIExpression(), !522)
    #dbg_value(i64 %75, !504, !DIExpression(), !522)
    #dbg_value(i64 %76, !505, !DIExpression(), !522)
    #dbg_value(i64 %77, !506, !DIExpression(), !522)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %5) #13, !dbg !609
  %78 = getelementptr inbounds %struct.lreg_args, ptr %41, i64 %72, !dbg !610
  call void @__record_field_access_full(i32 7, ptr %78, i32 0), !dbg !610
  %79 = load i64, ptr %78, align 8, !dbg !610, !tbaa !612
  %80 = call i32 @pthread_join(i64 noundef %79, ptr noundef nonnull %5) #13, !dbg !610
  %81 = icmp eq i32 %80, 0, !dbg !610
  br i1 %81, label %83, label %82, !dbg !613

82:                                               ; preds = %71
  call void @perror(ptr noundef nonnull @.str.8) #15, !dbg !614
  call void @exit(i32 noundef 1) #14, !dbg !614
  unreachable, !dbg !614

83:                                               ; preds = %71
  call void @__record_field_access_full(i32 12, ptr %5, i32 0), !dbg !616
  %84 = load i32, ptr %5, align 4, !dbg !616, !tbaa !618
  %85 = icmp eq i32 %84, 0, !dbg !616
  br i1 %85, label %87, label %86, !dbg !619

86:                                               ; preds = %83
  call void @perror(ptr noundef nonnull @.str.9) #15, !dbg !620
  call void @exit(i32 noundef 1) #14, !dbg !620
  unreachable, !dbg !620

87:                                               ; preds = %83
  %88 = getelementptr inbounds i8, ptr %78, i64 24, !dbg !622
  call void @__record_field_access_full(i32 0, ptr %88, i32 0), !dbg !622
  %89 = load i64, ptr %88, align 8, !dbg !622, !tbaa !429
  %90 = add nsw i64 %89, %73, !dbg !623
    #dbg_value(i64 %90, !502, !DIExpression(), !522)
  %91 = getelementptr inbounds i8, ptr %78, i64 32, !dbg !624
  call void @__record_field_access_full(i32 2, ptr %91, i32 0), !dbg !624
  %92 = load i64, ptr %91, align 8, !dbg !624, !tbaa !431
  %93 = add nsw i64 %92, %74, !dbg !625
    #dbg_value(i64 %93, !503, !DIExpression(), !522)
  %94 = getelementptr inbounds i8, ptr %78, i64 40, !dbg !626
  call void @__record_field_access_full(i32 1, ptr %94, i32 0), !dbg !626
  %95 = load i64, ptr %94, align 8, !dbg !626, !tbaa !430
  %96 = add nsw i64 %95, %75, !dbg !627
    #dbg_value(i64 %96, !504, !DIExpression(), !522)
  %97 = getelementptr inbounds i8, ptr %78, i64 48, !dbg !628
  call void @__record_field_access_full(i32 3, ptr %97, i32 0), !dbg !628
  %98 = load i64, ptr %97, align 8, !dbg !628, !tbaa !432
  %99 = add nsw i64 %98, %76, !dbg !629
    #dbg_value(i64 %99, !505, !DIExpression(), !522)
  %100 = getelementptr inbounds i8, ptr %78, i64 56, !dbg !630
  call void @__record_field_access_full(i32 4, ptr %100, i32 0), !dbg !630
  %101 = load i64, ptr %100, align 8, !dbg !630, !tbaa !433
  %102 = add nsw i64 %101, %77, !dbg !631
    #dbg_value(i64 %102, !506, !DIExpression(), !522)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %5) #13, !dbg !632
  %103 = add nuw nsw i64 %72, 1, !dbg !633
    #dbg_value(i64 %103, !489, !DIExpression(), !522)
  %104 = icmp eq i64 %103, %56, !dbg !592
  br i1 %104, label %105, label %71, !dbg !591, !llvm.loop !634

105:                                              ; preds = %87
  call void @free(ptr noundef nonnull %41) #13, !dbg !636
  %106 = sitofp i64 %90 to double, !dbg !637
    #dbg_value(double %106, !516, !DIExpression(), !522)
  %107 = sitofp i64 %93 to double, !dbg !638
    #dbg_value(double %107, !517, !DIExpression(), !522)
  %108 = sitofp i64 %96 to double, !dbg !639
    #dbg_value(double %108, !518, !DIExpression(), !522)
  %109 = sitofp i64 %99 to double, !dbg !640
    #dbg_value(double %109, !519, !DIExpression(), !522)
  %110 = sitofp i64 %102 to double, !dbg !641
    #dbg_value(double %110, !520, !DIExpression(), !522)
  %111 = uitofp nneg i64 %37 to double, !dbg !642
  %112 = fneg double %106, !dbg !643
  %113 = fmul double %107, %112, !dbg !643
  %114 = call double @llvm.fmuladd.f64(double %111, double %110, double %113), !dbg !643
  %115 = fmul double %112, %106, !dbg !644
  %116 = call double @llvm.fmuladd.f64(double %111, double %108, double %115), !dbg !644
  %117 = fdiv double %114, %116, !dbg !645
    #dbg_value(double %117, !512, !DIExpression(), !522)
  %118 = fneg double %117, !dbg !646
  %119 = call double @llvm.fmuladd.f64(double %118, double %106, double %107), !dbg !646
  %120 = fdiv double %119, %111, !dbg !647
    #dbg_value(double %120, !511, !DIExpression(), !522)
  %121 = fdiv double %106, %111, !dbg !648
    #dbg_value(double %121, !513, !DIExpression(), !522)
  %122 = fdiv double %107, %111, !dbg !649
    #dbg_value(double %122, !514, !DIExpression(), !522)
  %123 = fmul double %114, %114, !dbg !650
  %124 = fneg double %107, !dbg !651
  %125 = fmul double %124, %107, !dbg !651
  %126 = call double @llvm.fmuladd.f64(double %111, double %109, double %125), !dbg !651
  %127 = fmul double %126, %116, !dbg !652
  %128 = fdiv double %123, %127, !dbg !653
    #dbg_value(double %128, !515, !DIExpression(), !522)
  %129 = call i32 @puts(ptr nonnull dereferenceable(1) @str.26), !dbg !654
  %130 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, double noundef %120), !dbg !655
  %131 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, double noundef %117), !dbg !656
  %132 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.13, double noundef %121), !dbg !657
  %133 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, double noundef %122), !dbg !658
  %134 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.15, double noundef %128), !dbg !659
  %135 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.16, i64 noundef %90), !dbg !660
  %136 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.17, i64 noundef %93), !dbg !661
  %137 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.18, i64 noundef %96), !dbg !662
  %138 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.19, i64 noundef %99), !dbg !663
  %139 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.20, i64 noundef %102), !dbg !664
  %140 = call i32 @pthread_attr_destroy(ptr noundef nonnull %4) #13, !dbg !665
  %141 = icmp slt i32 %140, 0, !dbg !665
  br i1 %141, label %142, label %143, !dbg !667

142:                                              ; preds = %105
  call void @perror(ptr noundef nonnull @.str.21) #15, !dbg !668
  call void @exit(i32 noundef 1) #14, !dbg !668
  unreachable, !dbg !668

143:                                              ; preds = %105
  %144 = call i32 @munmap(ptr noundef nonnull %24, i64 noundef %23) #13, !dbg !670
  %145 = icmp slt i32 %144, 0, !dbg !670
  br i1 %145, label %146, label %147, !dbg !672

146:                                              ; preds = %143
  call void @perror(ptr noundef nonnull @.str.22) #15, !dbg !673
  call void @exit(i32 noundef 1) #14, !dbg !673
  unreachable, !dbg !673

147:                                              ; preds = %143
  %148 = call i32 @close(i32 noundef %13) #13, !dbg !675
  %149 = icmp slt i32 %148, 0, !dbg !675
  br i1 %149, label %150, label %151, !dbg !677

150:                                              ; preds = %147
  call void @perror(ptr noundef nonnull @.str.23) #15, !dbg !678
  call void @exit(i32 noundef 1) #14, !dbg !678
  unreachable, !dbg !678

151:                                              ; preds = %147
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %4) #13, !dbg !680
  call void @llvm.lifetime.end.p0(i64 144, ptr nonnull %3) #13, !dbg !680
  ret i32 0, !dbg !681
}

; Function Attrs: nofree nounwind
declare !dbg !682 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare !dbg !688 void @exit(i32 noundef) local_unnamed_addr #4

; Function Attrs: nofree
declare !dbg !692 noundef i32 @open(ptr nocapture noundef readonly, i32 noundef, ...) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare !dbg !696 void @perror(ptr nocapture noundef readonly) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare !dbg !699 noundef i32 @fstat(i32 noundef, ptr nocapture noundef) local_unnamed_addr #3

; Function Attrs: nounwind
declare !dbg !704 ptr @mmap(ptr noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !708 i64 @sysconf(i32 noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !712 i32 @pthread_attr_init(ptr noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !716 i32 @pthread_attr_setscope(ptr noundef, i32 noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !719 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #6

declare !dbg !729 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #7

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare !dbg !732 void @free(ptr allocptr nocapture noundef) local_unnamed_addr #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #9

; Function Attrs: nounwind
declare !dbg !735 i32 @pthread_attr_destroy(ptr noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !736 i32 @munmap(ptr noundef, i64 noundef) local_unnamed_addr #6

declare !dbg !739 i32 @close(i32 noundef) local_unnamed_addr #7

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare !dbg !742 noalias noundef ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #10

; Function Attrs: noreturn nounwind
declare !dbg !743 void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #11

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #9

declare void @__record_field_access(i32)

declare void @__record_field_access_full(i32, ptr, i32)

attributes #0 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nofree nounwind }
attributes #12 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #13 = { nounwind }
attributes #14 = { noreturn nounwind }
attributes #15 = { cold }
attributes #16 = { nounwind allocsize(0,1) }

!llvm.dbg.cu = !{!105}
!llvm.module.flags = !{!372, !373, !374, !375, !376, !377, !378}
!llvm.ident = !{!379}
!fieldanalysis.instrumented = !{}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 104, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "linear_regression_pthread.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/linear_regression", checksumkind: CSK_MD5, checksum: "dfa9fe81f27a45e9745190271265d338")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 176, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 22)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 111, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 472, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 59)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 113, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 384, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 48)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !2, line: 115, type: !19, isLocal: true, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 920, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 115)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(scope: null, file: !2, line: 118, type: !24, isLocal: true, isDefinition: true)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 600, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 75)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(scope: null, file: !2, line: 119, type: !29, isLocal: true, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 264, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 33)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(scope: null, file: !2, line: 143, type: !34, isLocal: true, isDefinition: true)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 952, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 119)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(scope: null, file: !2, line: 152, type: !39, isLocal: true, isDefinition: true)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 696, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 87)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(scope: null, file: !2, line: 153, type: !44, isLocal: true, isDefinition: true)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 312, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 39)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(scope: null, file: !2, line: 178, type: !49, isLocal: true, isDefinition: true)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 104, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 13)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(scope: null, file: !2, line: 179, type: !49, isLocal: true, isDefinition: true)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(scope: null, file: !2, line: 180, type: !49, isLocal: true, isDefinition: true)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(scope: null, file: !2, line: 181, type: !49, isLocal: true, isDefinition: true)
!58 = !DIGlobalVariableExpression(var: !59, expr: !DIExpression())
!59 = distinct !DIGlobalVariable(scope: null, file: !2, line: 182, type: !49, isLocal: true, isDefinition: true)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(scope: null, file: !2, line: 183, type: !62, isLocal: true, isDefinition: true)
!62 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 112, elements: !63)
!63 = !{!64}
!64 = !DISubrange(count: 14)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(scope: null, file: !2, line: 184, type: !62, isLocal: true, isDefinition: true)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(scope: null, file: !2, line: 185, type: !62, isLocal: true, isDefinition: true)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(scope: null, file: !2, line: 186, type: !62, isLocal: true, isDefinition: true)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(scope: null, file: !2, line: 187, type: !62, isLocal: true, isDefinition: true)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(scope: null, file: !2, line: 189, type: !75, isLocal: true, isDefinition: true)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 464, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 58)
!78 = !DIGlobalVariableExpression(var: !79, expr: !DIExpression())
!79 = distinct !DIGlobalVariable(scope: null, file: !2, line: 190, type: !80, isLocal: true, isDefinition: true)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 504, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 63)
!83 = !DIGlobalVariableExpression(var: !84, expr: !DIExpression())
!84 = distinct !DIGlobalVariable(scope: null, file: !2, line: 191, type: !85, isLocal: true, isDefinition: true)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 40)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(scope: null, file: !90, line: 53, type: !91, isLocal: true, isDefinition: true)
!90 = !DIFile(filename: "stddefines.h", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/linear_regression", checksumkind: CSK_MD5, checksum: "7e9b34be889049501e3ca32135119066")
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 40, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 5)
!94 = !DIGlobalVariableExpression(var: !95, expr: !DIExpression())
!95 = distinct !DIGlobalVariable(scope: null, file: !90, line: 53, type: !96, isLocal: true, isDefinition: true)
!96 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 888, elements: !97)
!97 = !{!98}
!98 = !DISubrange(count: 111)
!99 = !DIGlobalVariableExpression(var: !100, expr: !DIExpression())
!100 = distinct !DIGlobalVariable(scope: null, file: !90, line: 53, type: !101, isLocal: true, isDefinition: true)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 232, elements: !103)
!102 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!103 = !{!104}
!104 = !DISubrange(count: 29)
!105 = distinct !DICompileUnit(language: DW_LANG_C11, file: !106, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !107, retainedTypes: !334, globals: !361, splitDebugInlining: false, nameTableKind: None)
!106 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/linear_regression/linear_regression_pthread.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/linear_regression", checksumkind: CSK_MD5, checksum: "dfa9fe81f27a45e9745190271265d338")
!107 = !{!108, !329}
!108 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !109, line: 71, baseType: !110, size: 32, elements: !111)
!109 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/confname.h", directory: "", checksumkind: CSK_MD5, checksum: "78b98c9476f9b4c41f6f4ea6bcb3195f")
!110 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!111 = !{!112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225, !226, !227, !228, !229, !230, !231, !232, !233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !253, !254, !255, !256, !257, !258, !259, !260, !261, !262, !263, !264, !265, !266, !267, !268, !269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288, !289, !290, !291, !292, !293, !294, !295, !296, !297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !310, !311, !312, !313, !314, !315, !316, !317, !318, !319, !320, !321, !322, !323, !324, !325, !326, !327, !328}
!112 = !DIEnumerator(name: "_SC_ARG_MAX", value: 0)
!113 = !DIEnumerator(name: "_SC_CHILD_MAX", value: 1)
!114 = !DIEnumerator(name: "_SC_CLK_TCK", value: 2)
!115 = !DIEnumerator(name: "_SC_NGROUPS_MAX", value: 3)
!116 = !DIEnumerator(name: "_SC_OPEN_MAX", value: 4)
!117 = !DIEnumerator(name: "_SC_STREAM_MAX", value: 5)
!118 = !DIEnumerator(name: "_SC_TZNAME_MAX", value: 6)
!119 = !DIEnumerator(name: "_SC_JOB_CONTROL", value: 7)
!120 = !DIEnumerator(name: "_SC_SAVED_IDS", value: 8)
!121 = !DIEnumerator(name: "_SC_REALTIME_SIGNALS", value: 9)
!122 = !DIEnumerator(name: "_SC_PRIORITY_SCHEDULING", value: 10)
!123 = !DIEnumerator(name: "_SC_TIMERS", value: 11)
!124 = !DIEnumerator(name: "_SC_ASYNCHRONOUS_IO", value: 12)
!125 = !DIEnumerator(name: "_SC_PRIORITIZED_IO", value: 13)
!126 = !DIEnumerator(name: "_SC_SYNCHRONIZED_IO", value: 14)
!127 = !DIEnumerator(name: "_SC_FSYNC", value: 15)
!128 = !DIEnumerator(name: "_SC_MAPPED_FILES", value: 16)
!129 = !DIEnumerator(name: "_SC_MEMLOCK", value: 17)
!130 = !DIEnumerator(name: "_SC_MEMLOCK_RANGE", value: 18)
!131 = !DIEnumerator(name: "_SC_MEMORY_PROTECTION", value: 19)
!132 = !DIEnumerator(name: "_SC_MESSAGE_PASSING", value: 20)
!133 = !DIEnumerator(name: "_SC_SEMAPHORES", value: 21)
!134 = !DIEnumerator(name: "_SC_SHARED_MEMORY_OBJECTS", value: 22)
!135 = !DIEnumerator(name: "_SC_AIO_LISTIO_MAX", value: 23)
!136 = !DIEnumerator(name: "_SC_AIO_MAX", value: 24)
!137 = !DIEnumerator(name: "_SC_AIO_PRIO_DELTA_MAX", value: 25)
!138 = !DIEnumerator(name: "_SC_DELAYTIMER_MAX", value: 26)
!139 = !DIEnumerator(name: "_SC_MQ_OPEN_MAX", value: 27)
!140 = !DIEnumerator(name: "_SC_MQ_PRIO_MAX", value: 28)
!141 = !DIEnumerator(name: "_SC_VERSION", value: 29)
!142 = !DIEnumerator(name: "_SC_PAGESIZE", value: 30)
!143 = !DIEnumerator(name: "_SC_RTSIG_MAX", value: 31)
!144 = !DIEnumerator(name: "_SC_SEM_NSEMS_MAX", value: 32)
!145 = !DIEnumerator(name: "_SC_SEM_VALUE_MAX", value: 33)
!146 = !DIEnumerator(name: "_SC_SIGQUEUE_MAX", value: 34)
!147 = !DIEnumerator(name: "_SC_TIMER_MAX", value: 35)
!148 = !DIEnumerator(name: "_SC_BC_BASE_MAX", value: 36)
!149 = !DIEnumerator(name: "_SC_BC_DIM_MAX", value: 37)
!150 = !DIEnumerator(name: "_SC_BC_SCALE_MAX", value: 38)
!151 = !DIEnumerator(name: "_SC_BC_STRING_MAX", value: 39)
!152 = !DIEnumerator(name: "_SC_COLL_WEIGHTS_MAX", value: 40)
!153 = !DIEnumerator(name: "_SC_EQUIV_CLASS_MAX", value: 41)
!154 = !DIEnumerator(name: "_SC_EXPR_NEST_MAX", value: 42)
!155 = !DIEnumerator(name: "_SC_LINE_MAX", value: 43)
!156 = !DIEnumerator(name: "_SC_RE_DUP_MAX", value: 44)
!157 = !DIEnumerator(name: "_SC_CHARCLASS_NAME_MAX", value: 45)
!158 = !DIEnumerator(name: "_SC_2_VERSION", value: 46)
!159 = !DIEnumerator(name: "_SC_2_C_BIND", value: 47)
!160 = !DIEnumerator(name: "_SC_2_C_DEV", value: 48)
!161 = !DIEnumerator(name: "_SC_2_FORT_DEV", value: 49)
!162 = !DIEnumerator(name: "_SC_2_FORT_RUN", value: 50)
!163 = !DIEnumerator(name: "_SC_2_SW_DEV", value: 51)
!164 = !DIEnumerator(name: "_SC_2_LOCALEDEF", value: 52)
!165 = !DIEnumerator(name: "_SC_PII", value: 53)
!166 = !DIEnumerator(name: "_SC_PII_XTI", value: 54)
!167 = !DIEnumerator(name: "_SC_PII_SOCKET", value: 55)
!168 = !DIEnumerator(name: "_SC_PII_INTERNET", value: 56)
!169 = !DIEnumerator(name: "_SC_PII_OSI", value: 57)
!170 = !DIEnumerator(name: "_SC_POLL", value: 58)
!171 = !DIEnumerator(name: "_SC_SELECT", value: 59)
!172 = !DIEnumerator(name: "_SC_UIO_MAXIOV", value: 60)
!173 = !DIEnumerator(name: "_SC_IOV_MAX", value: 60)
!174 = !DIEnumerator(name: "_SC_PII_INTERNET_STREAM", value: 61)
!175 = !DIEnumerator(name: "_SC_PII_INTERNET_DGRAM", value: 62)
!176 = !DIEnumerator(name: "_SC_PII_OSI_COTS", value: 63)
!177 = !DIEnumerator(name: "_SC_PII_OSI_CLTS", value: 64)
!178 = !DIEnumerator(name: "_SC_PII_OSI_M", value: 65)
!179 = !DIEnumerator(name: "_SC_T_IOV_MAX", value: 66)
!180 = !DIEnumerator(name: "_SC_THREADS", value: 67)
!181 = !DIEnumerator(name: "_SC_THREAD_SAFE_FUNCTIONS", value: 68)
!182 = !DIEnumerator(name: "_SC_GETGR_R_SIZE_MAX", value: 69)
!183 = !DIEnumerator(name: "_SC_GETPW_R_SIZE_MAX", value: 70)
!184 = !DIEnumerator(name: "_SC_LOGIN_NAME_MAX", value: 71)
!185 = !DIEnumerator(name: "_SC_TTY_NAME_MAX", value: 72)
!186 = !DIEnumerator(name: "_SC_THREAD_DESTRUCTOR_ITERATIONS", value: 73)
!187 = !DIEnumerator(name: "_SC_THREAD_KEYS_MAX", value: 74)
!188 = !DIEnumerator(name: "_SC_THREAD_STACK_MIN", value: 75)
!189 = !DIEnumerator(name: "_SC_THREAD_THREADS_MAX", value: 76)
!190 = !DIEnumerator(name: "_SC_THREAD_ATTR_STACKADDR", value: 77)
!191 = !DIEnumerator(name: "_SC_THREAD_ATTR_STACKSIZE", value: 78)
!192 = !DIEnumerator(name: "_SC_THREAD_PRIORITY_SCHEDULING", value: 79)
!193 = !DIEnumerator(name: "_SC_THREAD_PRIO_INHERIT", value: 80)
!194 = !DIEnumerator(name: "_SC_THREAD_PRIO_PROTECT", value: 81)
!195 = !DIEnumerator(name: "_SC_THREAD_PROCESS_SHARED", value: 82)
!196 = !DIEnumerator(name: "_SC_NPROCESSORS_CONF", value: 83)
!197 = !DIEnumerator(name: "_SC_NPROCESSORS_ONLN", value: 84)
!198 = !DIEnumerator(name: "_SC_PHYS_PAGES", value: 85)
!199 = !DIEnumerator(name: "_SC_AVPHYS_PAGES", value: 86)
!200 = !DIEnumerator(name: "_SC_ATEXIT_MAX", value: 87)
!201 = !DIEnumerator(name: "_SC_PASS_MAX", value: 88)
!202 = !DIEnumerator(name: "_SC_XOPEN_VERSION", value: 89)
!203 = !DIEnumerator(name: "_SC_XOPEN_XCU_VERSION", value: 90)
!204 = !DIEnumerator(name: "_SC_XOPEN_UNIX", value: 91)
!205 = !DIEnumerator(name: "_SC_XOPEN_CRYPT", value: 92)
!206 = !DIEnumerator(name: "_SC_XOPEN_ENH_I18N", value: 93)
!207 = !DIEnumerator(name: "_SC_XOPEN_SHM", value: 94)
!208 = !DIEnumerator(name: "_SC_2_CHAR_TERM", value: 95)
!209 = !DIEnumerator(name: "_SC_2_C_VERSION", value: 96)
!210 = !DIEnumerator(name: "_SC_2_UPE", value: 97)
!211 = !DIEnumerator(name: "_SC_XOPEN_XPG2", value: 98)
!212 = !DIEnumerator(name: "_SC_XOPEN_XPG3", value: 99)
!213 = !DIEnumerator(name: "_SC_XOPEN_XPG4", value: 100)
!214 = !DIEnumerator(name: "_SC_CHAR_BIT", value: 101)
!215 = !DIEnumerator(name: "_SC_CHAR_MAX", value: 102)
!216 = !DIEnumerator(name: "_SC_CHAR_MIN", value: 103)
!217 = !DIEnumerator(name: "_SC_INT_MAX", value: 104)
!218 = !DIEnumerator(name: "_SC_INT_MIN", value: 105)
!219 = !DIEnumerator(name: "_SC_LONG_BIT", value: 106)
!220 = !DIEnumerator(name: "_SC_WORD_BIT", value: 107)
!221 = !DIEnumerator(name: "_SC_MB_LEN_MAX", value: 108)
!222 = !DIEnumerator(name: "_SC_NZERO", value: 109)
!223 = !DIEnumerator(name: "_SC_SSIZE_MAX", value: 110)
!224 = !DIEnumerator(name: "_SC_SCHAR_MAX", value: 111)
!225 = !DIEnumerator(name: "_SC_SCHAR_MIN", value: 112)
!226 = !DIEnumerator(name: "_SC_SHRT_MAX", value: 113)
!227 = !DIEnumerator(name: "_SC_SHRT_MIN", value: 114)
!228 = !DIEnumerator(name: "_SC_UCHAR_MAX", value: 115)
!229 = !DIEnumerator(name: "_SC_UINT_MAX", value: 116)
!230 = !DIEnumerator(name: "_SC_ULONG_MAX", value: 117)
!231 = !DIEnumerator(name: "_SC_USHRT_MAX", value: 118)
!232 = !DIEnumerator(name: "_SC_NL_ARGMAX", value: 119)
!233 = !DIEnumerator(name: "_SC_NL_LANGMAX", value: 120)
!234 = !DIEnumerator(name: "_SC_NL_MSGMAX", value: 121)
!235 = !DIEnumerator(name: "_SC_NL_NMAX", value: 122)
!236 = !DIEnumerator(name: "_SC_NL_SETMAX", value: 123)
!237 = !DIEnumerator(name: "_SC_NL_TEXTMAX", value: 124)
!238 = !DIEnumerator(name: "_SC_XBS5_ILP32_OFF32", value: 125)
!239 = !DIEnumerator(name: "_SC_XBS5_ILP32_OFFBIG", value: 126)
!240 = !DIEnumerator(name: "_SC_XBS5_LP64_OFF64", value: 127)
!241 = !DIEnumerator(name: "_SC_XBS5_LPBIG_OFFBIG", value: 128)
!242 = !DIEnumerator(name: "_SC_XOPEN_LEGACY", value: 129)
!243 = !DIEnumerator(name: "_SC_XOPEN_REALTIME", value: 130)
!244 = !DIEnumerator(name: "_SC_XOPEN_REALTIME_THREADS", value: 131)
!245 = !DIEnumerator(name: "_SC_ADVISORY_INFO", value: 132)
!246 = !DIEnumerator(name: "_SC_BARRIERS", value: 133)
!247 = !DIEnumerator(name: "_SC_BASE", value: 134)
!248 = !DIEnumerator(name: "_SC_C_LANG_SUPPORT", value: 135)
!249 = !DIEnumerator(name: "_SC_C_LANG_SUPPORT_R", value: 136)
!250 = !DIEnumerator(name: "_SC_CLOCK_SELECTION", value: 137)
!251 = !DIEnumerator(name: "_SC_CPUTIME", value: 138)
!252 = !DIEnumerator(name: "_SC_THREAD_CPUTIME", value: 139)
!253 = !DIEnumerator(name: "_SC_DEVICE_IO", value: 140)
!254 = !DIEnumerator(name: "_SC_DEVICE_SPECIFIC", value: 141)
!255 = !DIEnumerator(name: "_SC_DEVICE_SPECIFIC_R", value: 142)
!256 = !DIEnumerator(name: "_SC_FD_MGMT", value: 143)
!257 = !DIEnumerator(name: "_SC_FIFO", value: 144)
!258 = !DIEnumerator(name: "_SC_PIPE", value: 145)
!259 = !DIEnumerator(name: "_SC_FILE_ATTRIBUTES", value: 146)
!260 = !DIEnumerator(name: "_SC_FILE_LOCKING", value: 147)
!261 = !DIEnumerator(name: "_SC_FILE_SYSTEM", value: 148)
!262 = !DIEnumerator(name: "_SC_MONOTONIC_CLOCK", value: 149)
!263 = !DIEnumerator(name: "_SC_MULTI_PROCESS", value: 150)
!264 = !DIEnumerator(name: "_SC_SINGLE_PROCESS", value: 151)
!265 = !DIEnumerator(name: "_SC_NETWORKING", value: 152)
!266 = !DIEnumerator(name: "_SC_READER_WRITER_LOCKS", value: 153)
!267 = !DIEnumerator(name: "_SC_SPIN_LOCKS", value: 154)
!268 = !DIEnumerator(name: "_SC_REGEXP", value: 155)
!269 = !DIEnumerator(name: "_SC_REGEX_VERSION", value: 156)
!270 = !DIEnumerator(name: "_SC_SHELL", value: 157)
!271 = !DIEnumerator(name: "_SC_SIGNALS", value: 158)
!272 = !DIEnumerator(name: "_SC_SPAWN", value: 159)
!273 = !DIEnumerator(name: "_SC_SPORADIC_SERVER", value: 160)
!274 = !DIEnumerator(name: "_SC_THREAD_SPORADIC_SERVER", value: 161)
!275 = !DIEnumerator(name: "_SC_SYSTEM_DATABASE", value: 162)
!276 = !DIEnumerator(name: "_SC_SYSTEM_DATABASE_R", value: 163)
!277 = !DIEnumerator(name: "_SC_TIMEOUTS", value: 164)
!278 = !DIEnumerator(name: "_SC_TYPED_MEMORY_OBJECTS", value: 165)
!279 = !DIEnumerator(name: "_SC_USER_GROUPS", value: 166)
!280 = !DIEnumerator(name: "_SC_USER_GROUPS_R", value: 167)
!281 = !DIEnumerator(name: "_SC_2_PBS", value: 168)
!282 = !DIEnumerator(name: "_SC_2_PBS_ACCOUNTING", value: 169)
!283 = !DIEnumerator(name: "_SC_2_PBS_LOCATE", value: 170)
!284 = !DIEnumerator(name: "_SC_2_PBS_MESSAGE", value: 171)
!285 = !DIEnumerator(name: "_SC_2_PBS_TRACK", value: 172)
!286 = !DIEnumerator(name: "_SC_SYMLOOP_MAX", value: 173)
!287 = !DIEnumerator(name: "_SC_STREAMS", value: 174)
!288 = !DIEnumerator(name: "_SC_2_PBS_CHECKPOINT", value: 175)
!289 = !DIEnumerator(name: "_SC_V6_ILP32_OFF32", value: 176)
!290 = !DIEnumerator(name: "_SC_V6_ILP32_OFFBIG", value: 177)
!291 = !DIEnumerator(name: "_SC_V6_LP64_OFF64", value: 178)
!292 = !DIEnumerator(name: "_SC_V6_LPBIG_OFFBIG", value: 179)
!293 = !DIEnumerator(name: "_SC_HOST_NAME_MAX", value: 180)
!294 = !DIEnumerator(name: "_SC_TRACE", value: 181)
!295 = !DIEnumerator(name: "_SC_TRACE_EVENT_FILTER", value: 182)
!296 = !DIEnumerator(name: "_SC_TRACE_INHERIT", value: 183)
!297 = !DIEnumerator(name: "_SC_TRACE_LOG", value: 184)
!298 = !DIEnumerator(name: "_SC_LEVEL1_ICACHE_SIZE", value: 185)
!299 = !DIEnumerator(name: "_SC_LEVEL1_ICACHE_ASSOC", value: 186)
!300 = !DIEnumerator(name: "_SC_LEVEL1_ICACHE_LINESIZE", value: 187)
!301 = !DIEnumerator(name: "_SC_LEVEL1_DCACHE_SIZE", value: 188)
!302 = !DIEnumerator(name: "_SC_LEVEL1_DCACHE_ASSOC", value: 189)
!303 = !DIEnumerator(name: "_SC_LEVEL1_DCACHE_LINESIZE", value: 190)
!304 = !DIEnumerator(name: "_SC_LEVEL2_CACHE_SIZE", value: 191)
!305 = !DIEnumerator(name: "_SC_LEVEL2_CACHE_ASSOC", value: 192)
!306 = !DIEnumerator(name: "_SC_LEVEL2_CACHE_LINESIZE", value: 193)
!307 = !DIEnumerator(name: "_SC_LEVEL3_CACHE_SIZE", value: 194)
!308 = !DIEnumerator(name: "_SC_LEVEL3_CACHE_ASSOC", value: 195)
!309 = !DIEnumerator(name: "_SC_LEVEL3_CACHE_LINESIZE", value: 196)
!310 = !DIEnumerator(name: "_SC_LEVEL4_CACHE_SIZE", value: 197)
!311 = !DIEnumerator(name: "_SC_LEVEL4_CACHE_ASSOC", value: 198)
!312 = !DIEnumerator(name: "_SC_LEVEL4_CACHE_LINESIZE", value: 199)
!313 = !DIEnumerator(name: "_SC_IPV6", value: 235)
!314 = !DIEnumerator(name: "_SC_RAW_SOCKETS", value: 236)
!315 = !DIEnumerator(name: "_SC_V7_ILP32_OFF32", value: 237)
!316 = !DIEnumerator(name: "_SC_V7_ILP32_OFFBIG", value: 238)
!317 = !DIEnumerator(name: "_SC_V7_LP64_OFF64", value: 239)
!318 = !DIEnumerator(name: "_SC_V7_LPBIG_OFFBIG", value: 240)
!319 = !DIEnumerator(name: "_SC_SS_REPL_MAX", value: 241)
!320 = !DIEnumerator(name: "_SC_TRACE_EVENT_NAME_MAX", value: 242)
!321 = !DIEnumerator(name: "_SC_TRACE_NAME_MAX", value: 243)
!322 = !DIEnumerator(name: "_SC_TRACE_SYS_MAX", value: 244)
!323 = !DIEnumerator(name: "_SC_TRACE_USER_EVENT_MAX", value: 245)
!324 = !DIEnumerator(name: "_SC_XOPEN_STREAMS", value: 246)
!325 = !DIEnumerator(name: "_SC_THREAD_ROBUST_PRIO_INHERIT", value: 247)
!326 = !DIEnumerator(name: "_SC_THREAD_ROBUST_PRIO_PROTECT", value: 248)
!327 = !DIEnumerator(name: "_SC_MINSIGSTKSZ", value: 249)
!328 = !DIEnumerator(name: "_SC_SIGSTKSZ", value: 250)
!329 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !330, line: 134, baseType: !110, size: 32, elements: !331)
!330 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!331 = !{!332, !333}
!332 = !DIEnumerator(name: "PTHREAD_SCOPE_SYSTEM", value: 0)
!333 = !DIEnumerator(name: "PTHREAD_SCOPE_PROCESS", value: 1)
!334 = !{!335, !358, !344, !353, !359, !360}
!335 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !336, size: 64)
!336 = !DIDerivedType(tag: DW_TAG_typedef, name: "lreg_args", file: !2, line: 58, baseType: !337)
!337 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2, line: 48, size: 512, elements: !338)
!338 = !{!339, !343, !350, !352, !354, !355, !356, !357}
!339 = !DIDerivedType(tag: DW_TAG_member, name: "tid", scope: !337, file: !2, line: 50, baseType: !340, size: 64)
!340 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !341, line: 27, baseType: !342)
!341 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!342 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!343 = !DIDerivedType(tag: DW_TAG_member, name: "points", scope: !337, file: !2, line: 51, baseType: !344, size: 64, offset: 64)
!344 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !345, size: 64)
!345 = !DIDerivedType(tag: DW_TAG_typedef, name: "POINT_T", file: !2, line: 46, baseType: !346)
!346 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2, line: 43, size: 16, elements: !347)
!347 = !{!348, !349}
!348 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !346, file: !2, line: 44, baseType: !4, size: 8)
!349 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !346, file: !2, line: 45, baseType: !4, size: 8, offset: 8)
!350 = !DIDerivedType(tag: DW_TAG_member, name: "num_elems", scope: !337, file: !2, line: 52, baseType: !351, size: 32, offset: 128)
!351 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!352 = !DIDerivedType(tag: DW_TAG_member, name: "SX", scope: !337, file: !2, line: 53, baseType: !353, size: 64, offset: 192)
!353 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!354 = !DIDerivedType(tag: DW_TAG_member, name: "SY", scope: !337, file: !2, line: 54, baseType: !353, size: 64, offset: 256)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "SXX", scope: !337, file: !2, line: 55, baseType: !353, size: 64, offset: 320)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "SYY", scope: !337, file: !2, line: 56, baseType: !353, size: 64, offset: 384)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "SXY", scope: !337, file: !2, line: 57, baseType: !353, size: 64, offset: 448)
!358 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!359 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !358, size: 64)
!360 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!361 = !{!0, !7, !12, !17, !22, !27, !362, !32, !37, !42, !367, !47, !52, !54, !56, !58, !60, !65, !67, !69, !71, !73, !78, !83, !88, !94, !99}
!362 = !DIGlobalVariableExpression(var: !363, expr: !DIExpression())
!363 = distinct !DIGlobalVariable(scope: null, file: !2, line: 126, type: !364, isLocal: true, isDefinition: true)
!364 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !365)
!365 = !{!366}
!366 = !DISubrange(count: 41)
!367 = !DIGlobalVariableExpression(var: !368, expr: !DIExpression())
!368 = distinct !DIGlobalVariable(scope: null, file: !2, line: 177, type: !369, isLocal: true, isDefinition: true)
!369 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 304, elements: !370)
!370 = !{!371}
!371 = !DISubrange(count: 38)
!372 = !{i32 7, !"Dwarf Version", i32 5}
!373 = !{i32 2, !"Debug Info Version", i32 3}
!374 = !{i32 1, !"wchar_size", i32 4}
!375 = !{i32 8, !"PIC Level", i32 2}
!376 = !{i32 7, !"PIE Level", i32 2}
!377 = !{i32 7, !"uwtable", i32 2}
!378 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!379 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!380 = distinct !DISubprogram(name: "linear_regression_pthread", scope: !2, file: !2, line: 63, type: !381, scopeLine: 64, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !105, retainedNodes: !383)
!381 = !DISubroutineType(types: !382)
!382 = !{!358, !358}
!383 = !{!384, !385, !386}
!384 = !DILocalVariable(name: "args_in", arg: 1, scope: !380, file: !2, line: 63, type: !358)
!385 = !DILocalVariable(name: "args", scope: !380, file: !2, line: 65, type: !335)
!386 = !DILocalVariable(name: "i", scope: !380, file: !2, line: 66, type: !351)
!387 = !DILocation(line: 0, scope: !380)
!388 = !DILocation(line: 68, column: 10, scope: !380)
!389 = !DILocation(line: 69, column: 10, scope: !380)
!390 = !DILocation(line: 70, column: 10, scope: !380)
!391 = !DILocation(line: 71, column: 10, scope: !380)
!392 = !DILocation(line: 72, column: 10, scope: !380)
!393 = !DILocation(line: 69, column: 14, scope: !380)
!394 = !{!395, !400, i64 16}
!395 = !{!"", !396, i64 0, !399, i64 8, !400, i64 16, !401, i64 24, !401, i64 32, !401, i64 40, !401, i64 48, !401, i64 56}
!396 = !{!"long", !397, i64 0}
!397 = !{!"omnipotent char", !398, i64 0}
!398 = !{!"Simple C/C++ TBAA"}
!399 = !{!"any pointer", !397, i64 0}
!400 = !{!"int", !397, i64 0}
!401 = !{!"long long", !397, i64 0}
!402 = !DILocation(line: 75, column: 18, scope: !403)
!403 = distinct !DILexicalBlock(scope: !404, file: !2, line: 75, column: 4)
!404 = distinct !DILexicalBlock(scope: !380, file: !2, line: 75, column: 4)
!405 = !DILocation(line: 75, column: 4, scope: !404)
!406 = !{!395, !399, i64 8}
!407 = !DILocation(line: 78, column: 20, scope: !408)
!408 = distinct !DILexicalBlock(scope: !403, file: !2, line: 76, column: 4)
!409 = !DILocation(line: 78, column: 36, scope: !408)
!410 = !{!411, !397, i64 0}
!411 = !{!"", !397, i64 0, !397, i64 1}
!412 = !DILocation(line: 78, column: 17, scope: !408)
!413 = !DILocation(line: 79, column: 20, scope: !408)
!414 = !DILocation(line: 79, column: 37, scope: !408)
!415 = !DILocation(line: 79, column: 17, scope: !408)
!416 = !DILocation(line: 80, column: 36, scope: !408)
!417 = !{!411, !397, i64 1}
!418 = !DILocation(line: 80, column: 20, scope: !408)
!419 = !DILocation(line: 80, column: 17, scope: !408)
!420 = !DILocation(line: 81, column: 20, scope: !408)
!421 = !DILocation(line: 81, column: 37, scope: !408)
!422 = !DILocation(line: 81, column: 17, scope: !408)
!423 = !DILocation(line: 82, column: 37, scope: !408)
!424 = !DILocation(line: 82, column: 17, scope: !408)
!425 = !DILocation(line: 75, column: 38, scope: !403)
!426 = distinct !{!426, !405, !427, !428}
!427 = !DILocation(line: 83, column: 4, scope: !404)
!428 = !{!"llvm.loop.mustprogress"}
!429 = !{!395, !401, i64 24}
!430 = !{!395, !401, i64 40}
!431 = !{!395, !401, i64 32}
!432 = !{!395, !401, i64 48}
!433 = !{!395, !401, i64 56}
!434 = !DILocation(line: 85, column: 4, scope: !380)
!435 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 89, type: !436, scopeLine: 90, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !105, retainedNodes: !440)
!436 = !DISubroutineType(types: !437)
!437 = !{!351, !351, !438}
!438 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !439, size: 64)
!439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!440 = !{!441, !442, !443, !444, !445, !446, !486, !487, !488, !489, !490, !499, !500, !501, !502, !503, !504, !505, !506, !507, !511, !512, !513, !514, !515, !516, !517, !518, !519, !520}
!441 = !DILocalVariable(name: "argc", arg: 1, scope: !435, file: !2, line: 89, type: !351)
!442 = !DILocalVariable(name: "argv", arg: 2, scope: !435, file: !2, line: 89, type: !438)
!443 = !DILocalVariable(name: "fd", scope: !435, file: !2, line: 91, type: !351)
!444 = !DILocalVariable(name: "fdata", scope: !435, file: !2, line: 92, type: !439)
!445 = !DILocalVariable(name: "fname", scope: !435, file: !2, line: 93, type: !439)
!446 = !DILocalVariable(name: "finfo", scope: !435, file: !2, line: 94, type: !447)
!447 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !448, line: 26, size: 1152, elements: !449)
!448 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_stat.h", directory: "", checksumkind: CSK_MD5, checksum: "3ba283bc334370fe631cbc82f5229ed7")
!449 = !{!450, !453, !455, !457, !459, !461, !463, !464, !465, !468, !470, !472, !480, !481, !482}
!450 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !447, file: !448, line: 31, baseType: !451, size: 64)
!451 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !452, line: 145, baseType: !342)
!452 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!453 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !447, file: !448, line: 36, baseType: !454, size: 64, offset: 64)
!454 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !452, line: 148, baseType: !342)
!455 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !447, file: !448, line: 44, baseType: !456, size: 64, offset: 128)
!456 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !452, line: 151, baseType: !342)
!457 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !447, file: !448, line: 45, baseType: !458, size: 32, offset: 192)
!458 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !452, line: 150, baseType: !110)
!459 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !447, file: !448, line: 47, baseType: !460, size: 32, offset: 224)
!460 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !452, line: 146, baseType: !110)
!461 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !447, file: !448, line: 48, baseType: !462, size: 32, offset: 256)
!462 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !452, line: 147, baseType: !110)
!463 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !447, file: !448, line: 50, baseType: !351, size: 32, offset: 288)
!464 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !447, file: !448, line: 52, baseType: !451, size: 64, offset: 320)
!465 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !447, file: !448, line: 57, baseType: !466, size: 64, offset: 384)
!466 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !452, line: 152, baseType: !467)
!467 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!468 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !447, file: !448, line: 61, baseType: !469, size: 64, offset: 448)
!469 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !452, line: 175, baseType: !467)
!470 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !447, file: !448, line: 63, baseType: !471, size: 64, offset: 512)
!471 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !452, line: 180, baseType: !467)
!472 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !447, file: !448, line: 74, baseType: !473, size: 128, offset: 576)
!473 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !474, line: 11, size: 128, elements: !475)
!474 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!475 = !{!476, !478}
!476 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !473, file: !474, line: 16, baseType: !477, size: 64)
!477 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !452, line: 160, baseType: !467)
!478 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !473, file: !474, line: 21, baseType: !479, size: 64, offset: 64)
!479 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !452, line: 197, baseType: !467)
!480 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !447, file: !448, line: 75, baseType: !473, size: 128, offset: 704)
!481 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !447, file: !448, line: 76, baseType: !473, size: 128, offset: 832)
!482 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !447, file: !448, line: 89, baseType: !483, size: 192, offset: 960)
!483 = !DICompositeType(tag: DW_TAG_array_type, baseType: !479, size: 192, elements: !484)
!484 = !{!485}
!485 = !DISubrange(count: 3)
!486 = !DILocalVariable(name: "req_units", scope: !435, file: !2, line: 96, type: !351)
!487 = !DILocalVariable(name: "num_threads", scope: !435, file: !2, line: 96, type: !351)
!488 = !DILocalVariable(name: "num_procs", scope: !435, file: !2, line: 96, type: !351)
!489 = !DILocalVariable(name: "i", scope: !435, file: !2, line: 96, type: !351)
!490 = !DILocalVariable(name: "attr", scope: !435, file: !2, line: 97, type: !491)
!491 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !341, line: 62, baseType: !492)
!492 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pthread_attr_t", file: !341, line: 56, size: 448, elements: !493)
!493 = !{!494, !498}
!494 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !492, file: !341, line: 58, baseType: !495, size: 448)
!495 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 448, elements: !496)
!496 = !{!497}
!497 = !DISubrange(count: 56)
!498 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !492, file: !341, line: 59, baseType: !467, size: 64)
!499 = !DILocalVariable(name: "tid_args", scope: !435, file: !2, line: 98, type: !335)
!500 = !DILocalVariable(name: "points", scope: !435, file: !2, line: 129, type: !344)
!501 = !DILocalVariable(name: "n", scope: !435, file: !2, line: 130, type: !353)
!502 = !DILocalVariable(name: "SX_ll", scope: !435, file: !2, line: 146, type: !353)
!503 = !DILocalVariable(name: "SY_ll", scope: !435, file: !2, line: 146, type: !353)
!504 = !DILocalVariable(name: "SXX_ll", scope: !435, file: !2, line: 146, type: !353)
!505 = !DILocalVariable(name: "SYY_ll", scope: !435, file: !2, line: 146, type: !353)
!506 = !DILocalVariable(name: "SXY_ll", scope: !435, file: !2, line: 146, type: !353)
!507 = !DILocalVariable(name: "ret_val", scope: !508, file: !2, line: 151, type: !351)
!508 = distinct !DILexicalBlock(scope: !509, file: !2, line: 150, column: 4)
!509 = distinct !DILexicalBlock(scope: !510, file: !2, line: 149, column: 4)
!510 = distinct !DILexicalBlock(scope: !435, file: !2, line: 149, column: 4)
!511 = !DILocalVariable(name: "a", scope: !435, file: !2, line: 164, type: !360)
!512 = !DILocalVariable(name: "b", scope: !435, file: !2, line: 164, type: !360)
!513 = !DILocalVariable(name: "xbar", scope: !435, file: !2, line: 164, type: !360)
!514 = !DILocalVariable(name: "ybar", scope: !435, file: !2, line: 164, type: !360)
!515 = !DILocalVariable(name: "r2", scope: !435, file: !2, line: 164, type: !360)
!516 = !DILocalVariable(name: "SX", scope: !435, file: !2, line: 165, type: !360)
!517 = !DILocalVariable(name: "SY", scope: !435, file: !2, line: 166, type: !360)
!518 = !DILocalVariable(name: "SXX", scope: !435, file: !2, line: 167, type: !360)
!519 = !DILocalVariable(name: "SYY", scope: !435, file: !2, line: 168, type: !360)
!520 = !DILocalVariable(name: "SXY", scope: !435, file: !2, line: 169, type: !360)
!521 = distinct !DIAssignID()
!522 = !DILocation(line: 0, scope: !435)
!523 = distinct !DIAssignID()
!524 = distinct !DIAssignID()
!525 = !DILocation(line: 0, scope: !508)
!526 = !DILocation(line: 94, column: 4, scope: !435)
!527 = !DILocation(line: 97, column: 4, scope: !435)
!528 = !DILocation(line: 102, column: 8, scope: !529)
!529 = distinct !DILexicalBlock(scope: !435, file: !2, line: 102, column: 8)
!530 = !{!399, !399, i64 0}
!531 = !DILocation(line: 102, column: 16, scope: !529)
!532 = !DILocation(line: 102, column: 8, scope: !435)
!533 = !DILocation(line: 104, column: 40, scope: !534)
!534 = distinct !DILexicalBlock(scope: !529, file: !2, line: 103, column: 4)
!535 = !DILocation(line: 104, column: 7, scope: !534)
!536 = !DILocation(line: 105, column: 7, scope: !534)
!537 = !DILocation(line: 111, column: 4, scope: !538)
!538 = distinct !DILexicalBlock(scope: !435, file: !2, line: 111, column: 4)
!539 = !DILocation(line: 111, column: 4, scope: !435)
!540 = !DILocation(line: 111, column: 4, scope: !541)
!541 = distinct !DILexicalBlock(scope: !538, file: !2, line: 111, column: 4)
!542 = !DILocation(line: 113, column: 4, scope: !543)
!543 = distinct !DILexicalBlock(scope: !435, file: !2, line: 113, column: 4)
!544 = !DILocation(line: 113, column: 4, scope: !435)
!545 = !DILocation(line: 113, column: 4, scope: !546)
!546 = distinct !DILexicalBlock(scope: !543, file: !2, line: 113, column: 4)
!547 = !DILocation(line: 115, column: 4, scope: !548)
!548 = distinct !DILexicalBlock(scope: !435, file: !2, line: 115, column: 4)
!549 = !{!550, !396, i64 48}
!550 = !{!"stat", !396, i64 0, !396, i64 8, !396, i64 16, !400, i64 24, !400, i64 28, !400, i64 32, !400, i64 36, !396, i64 40, !396, i64 48, !396, i64 56, !396, i64 64, !551, i64 72, !551, i64 88, !551, i64 104, !397, i64 120}
!551 = !{!"timespec", !396, i64 0, !396, i64 8}
!552 = !DILocation(line: 115, column: 4, scope: !435)
!553 = !DILocation(line: 115, column: 4, scope: !554)
!554 = distinct !DILexicalBlock(scope: !548, file: !2, line: 115, column: 4)
!555 = !DILocation(line: 118, column: 4, scope: !556)
!556 = distinct !DILexicalBlock(scope: !435, file: !2, line: 118, column: 4)
!557 = !DILocation(line: 118, column: 4, scope: !435)
!558 = !DILocation(line: 118, column: 4, scope: !559)
!559 = distinct !DILexicalBlock(scope: !556, file: !2, line: 118, column: 4)
!560 = !DILocation(line: 119, column: 4, scope: !435)
!561 = !DILocation(line: 121, column: 4, scope: !435)
!562 = !DILocation(line: 122, column: 4, scope: !435)
!563 = !DILocation(line: 126, column: 4, scope: !435)
!564 = !DILocation(line: 130, column: 44, scope: !435)
!565 = !DILocation(line: 132, column: 20, scope: !435)
!566 = !DILocation(line: 132, column: 18, scope: !435)
!567 = !DILocation(line: 132, column: 16, scope: !435)
!568 = !DILocalVariable(name: "num", arg: 1, scope: !569, file: !90, line: 50, type: !572)
!569 = distinct !DISubprogram(name: "CALLOC", scope: !90, file: !90, line: 50, type: !570, scopeLine: 51, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !105, retainedNodes: !574)
!570 = !DISubroutineType(types: !571)
!571 = !{!358, !572, !572}
!572 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !573, line: 18, baseType: !342)
!573 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!574 = !{!568, !575, !576}
!575 = !DILocalVariable(name: "size", arg: 2, scope: !569, file: !90, line: 50, type: !572)
!576 = !DILocalVariable(name: "temp", scope: !569, file: !90, line: 52, type: !358)
!577 = !DILocation(line: 0, scope: !569, inlinedAt: !578)
!578 = distinct !DILocation(line: 133, column: 28, scope: !435)
!579 = !DILocation(line: 52, column: 18, scope: !569, inlinedAt: !578)
!580 = !DILocation(line: 53, column: 4, scope: !581, inlinedAt: !578)
!581 = distinct !DILexicalBlock(scope: !582, file: !90, line: 53, column: 4)
!582 = distinct !DILexicalBlock(scope: !569, file: !90, line: 53, column: 4)
!583 = !DILocation(line: 53, column: 4, scope: !582, inlinedAt: !578)
!584 = !DILocation(line: 136, column: 4, scope: !585)
!585 = distinct !DILexicalBlock(scope: !435, file: !2, line: 136, column: 4)
!586 = !DILocation(line: 136, column: 17, scope: !587)
!587 = distinct !DILexicalBlock(scope: !585, file: !2, line: 136, column: 4)
!588 = !DILocation(line: 136, column: 33, scope: !587)
!589 = distinct !{!589, !584, !590, !428}
!590 = !DILocation(line: 144, column: 4, scope: !585)
!591 = !DILocation(line: 149, column: 4, scope: !510)
!592 = !DILocation(line: 149, column: 18, scope: !509)
!593 = !DILocation(line: 138, column: 35, scope: !594)
!594 = distinct !DILexicalBlock(scope: !587, file: !2, line: 137, column: 4)
!595 = !DILocation(line: 138, column: 27, scope: !594)
!596 = !DILocation(line: 138, column: 5, scope: !594)
!597 = !DILocation(line: 138, column: 17, scope: !594)
!598 = !DILocation(line: 138, column: 24, scope: !594)
!599 = !DILocation(line: 139, column: 17, scope: !594)
!600 = !DILocation(line: 140, column: 10, scope: !601)
!601 = distinct !DILexicalBlock(scope: !594, file: !2, line: 140, column: 8)
!602 = !DILocation(line: 140, column: 8, scope: !594)
!603 = !DILocation(line: 0, scope: !594)
!604 = !DILocation(line: 143, column: 5, scope: !605)
!605 = distinct !DILexicalBlock(scope: !594, file: !2, line: 143, column: 5)
!606 = !DILocation(line: 143, column: 5, scope: !594)
!607 = !DILocation(line: 143, column: 5, scope: !608)
!608 = distinct !DILexicalBlock(scope: !605, file: !2, line: 143, column: 5)
!609 = !DILocation(line: 151, column: 4, scope: !508)
!610 = !DILocation(line: 152, column: 4, scope: !611)
!611 = distinct !DILexicalBlock(scope: !508, file: !2, line: 152, column: 4)
!612 = !{!395, !396, i64 0}
!613 = !DILocation(line: 152, column: 4, scope: !508)
!614 = !DILocation(line: 152, column: 4, scope: !615)
!615 = distinct !DILexicalBlock(scope: !611, file: !2, line: 152, column: 4)
!616 = !DILocation(line: 153, column: 4, scope: !617)
!617 = distinct !DILexicalBlock(scope: !508, file: !2, line: 153, column: 4)
!618 = !{!400, !400, i64 0}
!619 = !DILocation(line: 153, column: 4, scope: !508)
!620 = !DILocation(line: 153, column: 4, scope: !621)
!621 = distinct !DILexicalBlock(scope: !617, file: !2, line: 153, column: 4)
!622 = !DILocation(line: 155, column: 28, scope: !508)
!623 = !DILocation(line: 155, column: 13, scope: !508)
!624 = !DILocation(line: 156, column: 28, scope: !508)
!625 = !DILocation(line: 156, column: 13, scope: !508)
!626 = !DILocation(line: 157, column: 29, scope: !508)
!627 = !DILocation(line: 157, column: 14, scope: !508)
!628 = !DILocation(line: 158, column: 29, scope: !508)
!629 = !DILocation(line: 158, column: 14, scope: !508)
!630 = !DILocation(line: 159, column: 29, scope: !508)
!631 = !DILocation(line: 159, column: 14, scope: !508)
!632 = !DILocation(line: 160, column: 4, scope: !509)
!633 = !DILocation(line: 149, column: 34, scope: !509)
!634 = distinct !{!634, !591, !635, !428}
!635 = !DILocation(line: 160, column: 4, scope: !510)
!636 = !DILocation(line: 162, column: 4, scope: !435)
!637 = !DILocation(line: 165, column: 16, scope: !435)
!638 = !DILocation(line: 166, column: 16, scope: !435)
!639 = !DILocation(line: 167, column: 16, scope: !435)
!640 = !DILocation(line: 168, column: 16, scope: !435)
!641 = !DILocation(line: 169, column: 16, scope: !435)
!642 = !DILocation(line: 171, column: 17, scope: !435)
!643 = !DILocation(line: 171, column: 23, scope: !435)
!644 = !DILocation(line: 171, column: 41, scope: !435)
!645 = !DILocation(line: 171, column: 32, scope: !435)
!646 = !DILocation(line: 172, column: 15, scope: !435)
!647 = !DILocation(line: 172, column: 26, scope: !435)
!648 = !DILocation(line: 173, column: 25, scope: !435)
!649 = !DILocation(line: 174, column: 25, scope: !435)
!650 = !DILocation(line: 175, column: 33, scope: !435)
!651 = !DILocation(line: 175, column: 77, scope: !435)
!652 = !DILocation(line: 175, column: 69, scope: !435)
!653 = !DILocation(line: 175, column: 51, scope: !435)
!654 = !DILocation(line: 177, column: 4, scope: !435)
!655 = !DILocation(line: 178, column: 4, scope: !435)
!656 = !DILocation(line: 179, column: 4, scope: !435)
!657 = !DILocation(line: 180, column: 4, scope: !435)
!658 = !DILocation(line: 181, column: 4, scope: !435)
!659 = !DILocation(line: 182, column: 4, scope: !435)
!660 = !DILocation(line: 183, column: 4, scope: !435)
!661 = !DILocation(line: 184, column: 4, scope: !435)
!662 = !DILocation(line: 185, column: 4, scope: !435)
!663 = !DILocation(line: 186, column: 4, scope: !435)
!664 = !DILocation(line: 187, column: 4, scope: !435)
!665 = !DILocation(line: 189, column: 4, scope: !666)
!666 = distinct !DILexicalBlock(scope: !435, file: !2, line: 189, column: 4)
!667 = !DILocation(line: 189, column: 4, scope: !435)
!668 = !DILocation(line: 189, column: 4, scope: !669)
!669 = distinct !DILexicalBlock(scope: !666, file: !2, line: 189, column: 4)
!670 = !DILocation(line: 190, column: 4, scope: !671)
!671 = distinct !DILexicalBlock(scope: !435, file: !2, line: 190, column: 4)
!672 = !DILocation(line: 190, column: 4, scope: !435)
!673 = !DILocation(line: 190, column: 4, scope: !674)
!674 = distinct !DILexicalBlock(scope: !671, file: !2, line: 190, column: 4)
!675 = !DILocation(line: 191, column: 4, scope: !676)
!676 = distinct !DILexicalBlock(scope: !435, file: !2, line: 191, column: 4)
!677 = !DILocation(line: 191, column: 4, scope: !435)
!678 = !DILocation(line: 191, column: 4, scope: !679)
!679 = distinct !DILexicalBlock(scope: !676, file: !2, line: 191, column: 4)
!680 = !DILocation(line: 193, column: 1, scope: !435)
!681 = !DILocation(line: 192, column: 4, scope: !435)
!682 = !DISubprogram(name: "printf", scope: !683, file: !683, line: 356, type: !684, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!683 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!684 = !DISubroutineType(types: !685)
!685 = !{!351, !686, null}
!686 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !687)
!687 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!688 = !DISubprogram(name: "exit", scope: !689, file: !689, line: 624, type: !690, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!689 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!690 = !DISubroutineType(types: !691)
!691 = !{null, !351}
!692 = !DISubprogram(name: "open", scope: !693, file: !693, line: 181, type: !694, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!693 = !DIFile(filename: "/usr/include/fcntl.h", directory: "", checksumkind: CSK_MD5, checksum: "1a9bb91818c37dc7bc291ca6e49fc221")
!694 = !DISubroutineType(types: !695)
!695 = !{!351, !687, !351, null}
!696 = !DISubprogram(name: "perror", scope: !683, file: !683, line: 804, type: !697, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!697 = !DISubroutineType(types: !698)
!698 = !{null, !687}
!699 = !DISubprogram(name: "fstat", scope: !700, file: !700, line: 210, type: !701, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!700 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/stat.h", directory: "", checksumkind: CSK_MD5, checksum: "1e5cd132abb12ea0c79aeae3bfa4573e")
!701 = !DISubroutineType(types: !702)
!702 = !{!351, !351, !703}
!703 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !447, size: 64)
!704 = !DISubprogram(name: "mmap", scope: !705, file: !705, line: 57, type: !706, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!705 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/mman.h", directory: "", checksumkind: CSK_MD5, checksum: "93a87cc3b0558893646eb0c257165272")
!706 = !DISubroutineType(types: !707)
!707 = !{!358, !358, !572, !351, !351, !351, !466}
!708 = !DISubprogram(name: "sysconf", scope: !709, file: !709, line: 640, type: !710, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!709 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "ed37c2e6f30ba31a8b41e4d70547c39c")
!710 = !DISubroutineType(types: !711)
!711 = !{!467, !351}
!712 = !DISubprogram(name: "pthread_attr_init", scope: !330, file: !330, line: 285, type: !713, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!713 = !DISubroutineType(types: !714)
!714 = !{!351, !715}
!715 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !491, size: 64)
!716 = !DISubprogram(name: "pthread_attr_setscope", scope: !330, file: !330, line: 349, type: !717, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!717 = !DISubroutineType(types: !718)
!718 = !{!351, !715, !351}
!719 = !DISubprogram(name: "pthread_create", scope: !330, file: !330, line: 202, type: !720, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!720 = !DISubroutineType(types: !721)
!721 = !{!351, !722, !724, !727, !728}
!722 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !723)
!723 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !340, size: 64)
!724 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !725)
!725 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !726, size: 64)
!726 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !491)
!727 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !381, size: 64)
!728 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !358)
!729 = !DISubprogram(name: "pthread_join", scope: !330, file: !330, line: 219, type: !730, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!730 = !DISubroutineType(types: !731)
!731 = !{!351, !340, !359}
!732 = !DISubprogram(name: "free", scope: !689, file: !689, line: 555, type: !733, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!733 = !DISubroutineType(types: !734)
!734 = !{null, !358}
!735 = !DISubprogram(name: "pthread_attr_destroy", scope: !330, file: !330, line: 288, type: !713, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!736 = !DISubprogram(name: "munmap", scope: !705, file: !705, line: 76, type: !737, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!737 = !DISubroutineType(types: !738)
!738 = !{!351, !358, !572}
!739 = !DISubprogram(name: "close", scope: !709, file: !709, line: 358, type: !740, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!740 = !DISubroutineType(types: !741)
!741 = !{!351, !351}
!742 = !DISubprogram(name: "calloc", scope: !689, file: !689, line: 543, type: !570, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!743 = !DISubprogram(name: "__assert_fail", scope: !744, file: !744, line: 69, type: !745, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!744 = !DIFile(filename: "/usr/include/assert.h", directory: "", checksumkind: CSK_MD5, checksum: "ab7dc6991d501750085448b20099a5a0")
!745 = !DISubroutineType(types: !746)
!746 = !{null, !687, !687, !110, !687}
