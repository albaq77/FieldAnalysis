; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/pca/dfg/phoenix_pca.ll'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/pca/pca-pthread.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { ptr, ptr }
%union.pthread_attr_t = type { i64, [48 x i8] }
%struct.mean_arg_t = type { i32, i32 }

@num_rows = dso_local local_unnamed_addr global i32 0, align 4, !dbg !0
@num_cols = dso_local local_unnamed_addr global i32 0, align 4, !dbg !303
@grid_size = dso_local local_unnamed_addr global i32 0, align 4, !dbg !305
@.str = private unnamed_addr constant [7 x i8] c"r:c:s:\00", align 1, !dbg !251
@optarg = external local_unnamed_addr global ptr, align 8
@.str.1 = private unnamed_addr constant [54 x i8] c"Usage: %s -r <num_rows> -c <num_cols> -s <max value>\0A\00", align 1, !dbg !256
@.str.3 = private unnamed_addr constant [21 x i8] c"Number of rows = %d\0A\00", align 1, !dbg !266
@.str.4 = private unnamed_addr constant [21 x i8] c"Number of cols = %d\0A\00", align 1, !dbg !271
@.str.5 = private unnamed_addr constant [33 x i8] c"Max value for each element = %d\0A\00", align 1, !dbg !273
@matrix = dso_local local_unnamed_addr global ptr null, align 8, !dbg !311
@mean = dso_local local_unnamed_addr global ptr null, align 8, !dbg !315
@row_lock = dso_local global %union.pthread_mutex_t zeroinitializer, align 8, !dbg !317
@next_row = dso_local local_unnamed_addr global i32 0, align 4, !dbg !309
@cov = dso_local local_unnamed_addr global ptr null, align 8, !dbg !313
@num_procs = dso_local local_unnamed_addr global i32 0, align 4, !dbg !307
@.str.6 = private unnamed_addr constant [75 x i8] c"Error at line\0A\09(num_procs = sysconf(_SC_NPROCESSORS_ONLN)) <= 0\0ASystem Msg\00", align 1, !dbg !278
@.str.7 = private unnamed_addr constant [32 x i8] c"The number of processors is %d\0A\00", align 1, !dbg !283
@.str.8 = private unnamed_addr constant [100 x i8] c"Error at line\0A\09pthread_create(&tid[i], &attr, calc_mean, (void *)(&(mean_args[i]))) != 0\0ASystem Msg\00", align 1, !dbg !288
@.str.9 = private unnamed_addr constant [58 x i8] c"Error at line\0A\09pthread_join(tid[i], NULL) != 0\0ASystem Msg\00", align 1, !dbg !293
@.str.10 = private unnamed_addr constant [78 x i8] c"Error at line\0A\09pthread_create(&tid[i], &attr, calc_cov, NULL) != 0\0ASystem Msg\00", align 1, !dbg !298
@.str.11 = private unnamed_addr constant [5 x i8] c"temp\00", align 1, !dbg !348
@.str.12 = private unnamed_addr constant [97 x i8] c"/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/pca/stddefines.h\00", align 1, !dbg !354
@__PRETTY_FUNCTION__.MALLOC = private unnamed_addr constant [21 x i8] c"void *MALLOC(size_t)\00", align 1, !dbg !359
@str = private unnamed_addr constant [70 x i8] c"Illegal argument value. All values must be numeric and greater than 0\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @parse_args(i32 noundef %0, ptr noundef %1) local_unnamed_addr #0 !dbg !371 {
    #dbg_value(i32 %0, !375, !DIExpression(), !378)
    #dbg_value(ptr %1, !376, !DIExpression(), !378)
  call void @__record_field_access_full(i32 0, ptr @num_rows, i32 1), !dbg !379
  store i32 10, ptr @num_rows, align 4, !dbg !379, !tbaa !380
  call void @__record_field_access_full(i32 0, ptr @num_cols, i32 1), !dbg !384
  store i32 10, ptr @num_cols, align 4, !dbg !384, !tbaa !380
  call void @__record_field_access_full(i32 0, ptr @grid_size, i32 1), !dbg !385
  store i32 100, ptr @grid_size, align 4, !dbg !385, !tbaa !380
  br label %3, !dbg !386

3:                                                ; preds = %15, %2
  %4 = tail call i32 @getopt(i32 noundef %0, ptr noundef %1, ptr noundef nonnull @.str) #13, !dbg !387
    #dbg_value(i32 %4, !377, !DIExpression(), !378)
  switch i32 %4, label %15 [
    i32 -1, label %16
    i32 114, label %10
    i32 99, label %5
    i32 115, label %6
    i32 63, label %7
  ], !dbg !386

5:                                                ; preds = %3
    #dbg_value(ptr %12, !388, !DIExpression(), !395)
  br label %10, !dbg !399

6:                                                ; preds = %3
    #dbg_value(ptr %12, !388, !DIExpression(), !400)
  br label %10, !dbg !402

7:                                                ; preds = %3
  call void @__record_field_access_full(i32 1, ptr %1, i32 0), !dbg !403
  %8 = load ptr, ptr %1, align 8, !dbg !403, !tbaa !404
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, ptr noundef %8), !dbg !406
  tail call void @exit(i32 noundef 1) #14, !dbg !407
  unreachable, !dbg !407

10:                                               ; preds = %6, %5, %3
  %11 = phi ptr [ @grid_size, %6 ], [ @num_cols, %5 ], [ @num_rows, %3 ]
  call void @__record_field_access_full(i32 1, ptr @optarg, i32 0), !dbg !408
  %12 = load ptr, ptr @optarg, align 8, !dbg !408, !tbaa !404
  %13 = tail call i64 @strtol(ptr nocapture noundef nonnull %12, ptr noundef null, i32 noundef 10) #13, !dbg !409
  %14 = trunc i64 %13 to i32, !dbg !410
  call void @__record_field_access_full(i32 0, ptr %11, i32 1), !dbg !408
  store i32 %14, ptr %11, align 4, !dbg !408, !tbaa !380
  br label %15, !dbg !386

15:                                               ; preds = %10, %3
  br label %3, !dbg !387, !llvm.loop !411

16:                                               ; preds = %3
  call void @__record_field_access_full(i32 0, ptr @num_rows, i32 0), !dbg !414
  %17 = load i32, ptr @num_rows, align 4, !dbg !414, !tbaa !380
  %18 = icmp slt i32 %17, 1, !dbg !416
  %19 = load i32, ptr @num_cols, align 4
  %20 = icmp slt i32 %19, 1
  %21 = select i1 %18, i1 true, i1 %20, !dbg !417
  %22 = load i32, ptr @grid_size, align 4
  %23 = icmp slt i32 %22, 1
  %24 = select i1 %21, i1 true, i1 %23, !dbg !417
  br i1 %24, label %25, label %27, !dbg !417

25:                                               ; preds = %16
  %26 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !418
  tail call void @exit(i32 noundef 1) #14, !dbg !420
  unreachable, !dbg !420

27:                                               ; preds = %16
  %28 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %17), !dbg !421
  call void @__record_field_access_full(i32 0, ptr @num_cols, i32 0), !dbg !422
  %29 = load i32, ptr @num_cols, align 4, !dbg !422, !tbaa !380
  %30 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, i32 noundef %29), !dbg !423
  call void @__record_field_access_full(i32 0, ptr @grid_size, i32 0), !dbg !424
  %31 = load i32, ptr @grid_size, align 4, !dbg !424, !tbaa !380
  %32 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.5, i32 noundef %31), !dbg !425
  ret void, !dbg !426
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind
declare !dbg !427 i32 @getopt(i32 noundef, ptr noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare !dbg !433 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare !dbg !438 void @exit(i32 noundef) local_unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local void @dump_points(ptr nocapture noundef readnone %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #5 !dbg !441 {
    #dbg_value(ptr %0, !445, !DIExpression(), !450)
    #dbg_value(i32 %1, !446, !DIExpression(), !450)
    #dbg_value(i32 %2, !447, !DIExpression(), !450)
    #dbg_value(i32 0, !448, !DIExpression(), !450)
  ret void, !dbg !451
}

; Function Attrs: nounwind uwtable
define dso_local void @generate_points(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 !dbg !452 {
    #dbg_value(ptr %0, !454, !DIExpression(), !459)
    #dbg_value(i32 %1, !455, !DIExpression(), !459)
    #dbg_value(i32 %2, !456, !DIExpression(), !459)
    #dbg_value(i32 0, !457, !DIExpression(), !459)
  %4 = icmp sgt i32 %1, 0, !dbg !460
  br i1 %4, label %5, label %25, !dbg !463

5:                                                ; preds = %3
  %6 = icmp sgt i32 %2, 0
  %7 = zext nneg i32 %1 to i64, !dbg !460
  %8 = zext nneg i32 %2 to i64
  br label %9, !dbg !463

9:                                                ; preds = %22, %5
  %10 = phi i64 [ 0, %5 ], [ %23, %22 ]
    #dbg_value(i64 %10, !457, !DIExpression(), !459)
    #dbg_value(i32 0, !458, !DIExpression(), !459)
  br i1 %6, label %11, label %22, !dbg !464

11:                                               ; preds = %9
  %12 = getelementptr inbounds ptr, ptr %0, i64 %10
  call void @__record_field_access_full(i32 2, ptr %12, i32 0), !dbg !464
  br label %13, !dbg !464

13:                                               ; preds = %13, %11
  %14 = phi i64 [ 0, %11 ], [ %20, %13 ]
    #dbg_value(i64 %14, !458, !DIExpression(), !459)
  %15 = tail call i32 @rand() #13, !dbg !467
  call void @__record_field_access_full(i32 0, ptr @grid_size, i32 0), !dbg !470
  %16 = load i32, ptr @grid_size, align 4, !dbg !470, !tbaa !380
  %17 = srem i32 %15, %16, !dbg !471
  %18 = load ptr, ptr %12, align 8, !dbg !472, !tbaa !404
  %19 = getelementptr inbounds i32, ptr %18, i64 %14, !dbg !472
  call void @__record_field_access_full(i32 3, ptr %19, i32 1), !dbg !473
  store i32 %17, ptr %19, align 4, !dbg !473, !tbaa !380
  %20 = add nuw nsw i64 %14, 1, !dbg !474
    #dbg_value(i64 %20, !458, !DIExpression(), !459)
  %21 = icmp eq i64 %20, %8, !dbg !475
  br i1 %21, label %22, label %13, !dbg !464, !llvm.loop !476

22:                                               ; preds = %13, %9
  %23 = add nuw nsw i64 %10, 1, !dbg !478
    #dbg_value(i64 %23, !457, !DIExpression(), !459)
  %24 = icmp eq i64 %23, %7, !dbg !460
  br i1 %24, label %25, label %9, !dbg !463, !llvm.loop !479

25:                                               ; preds = %22, %3
  ret void, !dbg !481
}

; Function Attrs: nounwind
declare !dbg !482 i32 @rand() local_unnamed_addr #2

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define dso_local noalias noundef ptr @calc_mean(ptr nocapture noundef readonly %0) #6 !dbg !485 {
    #dbg_value(ptr %0, !489, !DIExpression(), !494)
    #dbg_value(i32 0, !492, !DIExpression(), !494)
    #dbg_value(ptr %0, !493, !DIExpression(), !494)
  call void @__record_field_access_full(i32 4, ptr %0, i32 0), !dbg !495
  %2 = load i32, ptr %0, align 4, !dbg !495, !tbaa !497
    #dbg_value(i32 %2, !490, !DIExpression(), !494)
  %3 = getelementptr inbounds i8, ptr %0, i64 4
  call void @__record_field_access_full(i32 5, ptr %3, i32 0), !dbg !499
  %4 = load i32, ptr %3, align 4, !dbg !499, !tbaa !501
  %5 = icmp slt i32 %2, %4, !dbg !502
  br i1 %5, label %6, label %56, !dbg !503

6:                                                ; preds = %1
  %7 = load ptr, ptr @matrix, align 8
  call void @__record_field_access_full(i32 1, ptr @mean, i32 0)
  %8 = load ptr, ptr @mean, align 8, !tbaa !404
  %9 = sext i32 %2 to i64, !dbg !503
  br label %10, !dbg !503

10:                                               ; preds = %48, %6
  %11 = phi i64 [ %9, %6 ], [ %52, %48 ]
    #dbg_value(i64 %11, !490, !DIExpression(), !494)
  call void @__record_field_access_full(i32 0, ptr @num_cols, i32 0)
  %12 = load i32, ptr @num_cols, align 4, !tbaa !380
    #dbg_value(i32 0, !492, !DIExpression(), !494)
    #dbg_value(i32 0, !491, !DIExpression(), !494)
  %13 = icmp sgt i32 %12, 0, !dbg !504
  br i1 %13, label %14, label %48, !dbg !508

14:                                               ; preds = %10
  %15 = getelementptr inbounds ptr, ptr %7, i64 %11
  call void @__record_field_access_full(i32 6, ptr %15, i32 0)
  %16 = load ptr, ptr %15, align 8, !tbaa !404
  %17 = zext nneg i32 %12 to i64, !dbg !504
  %18 = icmp ult i32 %12, 8, !dbg !508
  br i1 %18, label %37, label %19, !dbg !508

19:                                               ; preds = %14
  %20 = and i64 %17, 2147483640, !dbg !508
  br label %21, !dbg !508

21:                                               ; preds = %21, %19
  %22 = phi i64 [ 0, %19 ], [ %31, %21 ], !dbg !509
  %23 = phi <4 x i32> [ zeroinitializer, %19 ], [ %29, %21 ]
  %24 = phi <4 x i32> [ zeroinitializer, %19 ], [ %30, %21 ]
  %25 = getelementptr inbounds i32, ptr %16, i64 %22, !dbg !510
  call void @__record_field_access_full(i32 3, ptr %25, i32 0), !dbg !510
  %26 = getelementptr inbounds i8, ptr %25, i64 16, !dbg !510
  %27 = load <4 x i32>, ptr %25, align 4, !dbg !510, !tbaa !380
  call void @__record_field_access_full(i32 7, ptr %26, i32 0), !dbg !510
  %28 = load <4 x i32>, ptr %26, align 4, !dbg !510, !tbaa !380
  %29 = add <4 x i32> %27, %23, !dbg !512
  %30 = add <4 x i32> %28, %24, !dbg !512
  %31 = add nuw i64 %22, 8, !dbg !509
  %32 = icmp eq i64 %31, %20, !dbg !509
  br i1 %32, label %33, label %21, !dbg !509, !llvm.loop !513

33:                                               ; preds = %21
  %34 = add <4 x i32> %30, %29, !dbg !508
  %35 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %34), !dbg !508
  %36 = icmp eq i64 %20, %17, !dbg !508
  br i1 %36, label %48, label %37, !dbg !508

37:                                               ; preds = %33, %14
  %38 = phi i64 [ 0, %14 ], [ %20, %33 ]
  %39 = phi i32 [ 0, %14 ], [ %35, %33 ]
  br label %40, !dbg !508

40:                                               ; preds = %40, %37
  %41 = phi i64 [ %46, %40 ], [ %38, %37 ]
  %42 = phi i32 [ %45, %40 ], [ %39, %37 ]
    #dbg_value(i32 %42, !492, !DIExpression(), !494)
    #dbg_value(i64 %41, !491, !DIExpression(), !494)
  %43 = getelementptr inbounds i32, ptr %16, i64 %41, !dbg !510
  call void @__record_field_access_full(i32 3, ptr %43, i32 0), !dbg !510
  %44 = load i32, ptr %43, align 4, !dbg !510, !tbaa !380
  %45 = add nsw i32 %44, %42, !dbg !512
    #dbg_value(i32 %45, !492, !DIExpression(), !494)
  %46 = add nuw nsw i64 %41, 1, !dbg !509
    #dbg_value(i64 %46, !491, !DIExpression(), !494)
  %47 = icmp eq i64 %46, %17, !dbg !504
  br i1 %47, label %48, label %40, !dbg !508, !llvm.loop !517

48:                                               ; preds = %40, %33, %10
  %49 = phi i32 [ 0, %10 ], [ %35, %33 ], [ %45, %40 ], !dbg !518
  %50 = sdiv i32 %49, %12, !dbg !519
  %51 = getelementptr inbounds i32, ptr %8, i64 %11, !dbg !520
  call void @__record_field_access_full(i32 8, ptr %51, i32 1), !dbg !521
  store i32 %50, ptr %51, align 4, !dbg !521, !tbaa !380
  %52 = add nsw i64 %11, 1, !dbg !522
    #dbg_value(i64 %52, !490, !DIExpression(), !494)
  %53 = load i32, ptr %3, align 4, !dbg !499, !tbaa !501
  %54 = sext i32 %53 to i64, !dbg !502
  %55 = icmp slt i64 %52, %54, !dbg !502
  br i1 %55, label %10, label %56, !dbg !503, !llvm.loop !523

56:                                               ; preds = %48, %1
  ret ptr null, !dbg !525
}

; Function Attrs: nounwind uwtable
define dso_local noalias noundef ptr @calc_cov(ptr nocapture readnone %0) #0 !dbg !526 {
    #dbg_value(ptr poison, !528, !DIExpression(), !533)
  %2 = tail call i32 @pthread_mutex_lock(ptr noundef nonnull @row_lock) #13, !dbg !534
  call void @__record_field_access_full(i32 0, ptr @next_row, i32 0), !dbg !535
  %3 = load i32, ptr @next_row, align 4, !dbg !535, !tbaa !380
    #dbg_value(i32 %3, !529, !DIExpression(), !533)
  %4 = add nsw i32 %3, 1, !dbg !536
  call void @__record_field_access_full(i32 0, ptr @next_row, i32 1), !dbg !536
  store i32 %4, ptr @next_row, align 4, !dbg !536, !tbaa !380
  %5 = tail call i32 @pthread_mutex_unlock(ptr noundef nonnull @row_lock) #13, !dbg !537
  call void @__record_field_access_full(i32 0, ptr @num_rows, i32 0), !dbg !538
  %6 = load i32, ptr @num_rows, align 4, !dbg !538, !tbaa !380
  %7 = icmp slt i32 %3, %6, !dbg !539
  br i1 %7, label %8, label %101, !dbg !540

8:                                                ; preds = %94, %1
  %9 = phi i32 [ %99, %94 ], [ %6, %1 ], !dbg !541
  %10 = phi i32 [ %96, %94 ], [ %3, %1 ]
    #dbg_value(i32 %10, !529, !DIExpression(), !533)
    #dbg_value(i32 %10, !530, !DIExpression(), !533)
  %11 = icmp slt i32 %10, %9, !dbg !545
  br i1 %11, label %12, label %94, !dbg !546

12:                                               ; preds = %8
  %13 = load ptr, ptr @matrix, align 8
  %14 = sext i32 %10 to i64
  %15 = getelementptr inbounds ptr, ptr %13, i64 %14
  call void @__record_field_access_full(i32 6, ptr %15, i32 0)
  %16 = load ptr, ptr @mean, align 8
  %17 = getelementptr inbounds i32, ptr %16, i64 %14
  call void @__record_field_access_full(i32 8, ptr %17, i32 0)
  call void @__record_field_access_full(i32 1, ptr @cov, i32 0)
  %18 = load ptr, ptr @cov, align 8, !tbaa !404
  %19 = getelementptr inbounds ptr, ptr %18, i64 %14
  call void @__record_field_access_full(i32 9, ptr %19, i32 0)
  %20 = load ptr, ptr %19, align 8, !tbaa !404
  br label %21, !dbg !546

21:                                               ; preds = %82, %12
  %22 = phi i64 [ %14, %12 ], [ %90, %82 ]
    #dbg_value(i64 %22, !530, !DIExpression(), !533)
  call void @__record_field_access_full(i32 0, ptr @num_cols, i32 0)
  %23 = load i32, ptr @num_cols, align 4, !tbaa !380
    #dbg_value(i32 0, !532, !DIExpression(), !533)
    #dbg_value(i32 0, !531, !DIExpression(), !533)
  %24 = icmp sgt i32 %23, 0, !dbg !547
  br i1 %24, label %25, label %82, !dbg !551

25:                                               ; preds = %21
  %26 = load ptr, ptr %15, align 8, !tbaa !404
  %27 = load i32, ptr %17, align 4, !tbaa !380
  %28 = getelementptr inbounds ptr, ptr %13, i64 %22
  call void @__record_field_access_full(i32 6, ptr %28, i32 0)
  %29 = load ptr, ptr %28, align 8, !tbaa !404
  %30 = getelementptr inbounds i32, ptr %16, i64 %22
  call void @__record_field_access_full(i32 8, ptr %30, i32 0)
  %31 = load i32, ptr %30, align 4, !tbaa !380
  %32 = zext nneg i32 %23 to i64, !dbg !547
  %33 = icmp ult i32 %23, 8, !dbg !551
  br i1 %33, label %66, label %34, !dbg !551

34:                                               ; preds = %25
  %35 = and i64 %32, 2147483640, !dbg !551
  %36 = insertelement <4 x i32> poison, i32 %27, i64 0, !dbg !551
  %37 = shufflevector <4 x i32> %36, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !551
  %38 = insertelement <4 x i32> poison, i32 %31, i64 0, !dbg !551
  %39 = shufflevector <4 x i32> %38, <4 x i32> poison, <4 x i32> zeroinitializer, !dbg !551
  br label %40, !dbg !551

40:                                               ; preds = %40, %34
  %41 = phi i64 [ 0, %34 ], [ %60, %40 ], !dbg !552
  %42 = phi <4 x i32> [ zeroinitializer, %34 ], [ %58, %40 ]
  %43 = phi <4 x i32> [ zeroinitializer, %34 ], [ %59, %40 ]
  %44 = getelementptr inbounds i32, ptr %26, i64 %41, !dbg !553
  call void @__record_field_access_full(i32 3, ptr %44, i32 0), !dbg !553
  %45 = getelementptr inbounds i8, ptr %44, i64 16, !dbg !553
  %46 = load <4 x i32>, ptr %44, align 4, !dbg !553, !tbaa !380
  call void @__record_field_access_full(i32 7, ptr %45, i32 0), !dbg !553
  %47 = load <4 x i32>, ptr %45, align 4, !dbg !553, !tbaa !380
  %48 = sub nsw <4 x i32> %46, %37, !dbg !555
  %49 = sub nsw <4 x i32> %47, %37, !dbg !555
  %50 = getelementptr inbounds i32, ptr %29, i64 %41, !dbg !556
  call void @__record_field_access_full(i32 3, ptr %50, i32 0), !dbg !556
  %51 = getelementptr inbounds i8, ptr %50, i64 16, !dbg !556
  %52 = load <4 x i32>, ptr %50, align 4, !dbg !556, !tbaa !380
  call void @__record_field_access_full(i32 7, ptr %51, i32 0), !dbg !556
  %53 = load <4 x i32>, ptr %51, align 4, !dbg !556, !tbaa !380
  %54 = sub nsw <4 x i32> %52, %39, !dbg !557
  %55 = sub nsw <4 x i32> %53, %39, !dbg !557
  %56 = mul nsw <4 x i32> %54, %48, !dbg !558
  %57 = mul nsw <4 x i32> %55, %49, !dbg !558
  %58 = add <4 x i32> %56, %42, !dbg !559
  %59 = add <4 x i32> %57, %43, !dbg !559
  %60 = add nuw i64 %41, 8, !dbg !552
  %61 = icmp eq i64 %60, %35, !dbg !552
  br i1 %61, label %62, label %40, !dbg !552, !llvm.loop !560

62:                                               ; preds = %40
  %63 = add <4 x i32> %59, %58, !dbg !551
  %64 = tail call i32 @llvm.vector.reduce.add.v4i32(<4 x i32> %63), !dbg !551
  %65 = icmp eq i64 %35, %32, !dbg !551
  br i1 %65, label %82, label %66, !dbg !551

66:                                               ; preds = %62, %25
  %67 = phi i64 [ 0, %25 ], [ %35, %62 ]
  %68 = phi i32 [ 0, %25 ], [ %64, %62 ]
  br label %69, !dbg !551

69:                                               ; preds = %69, %66
  %70 = phi i64 [ %80, %69 ], [ %67, %66 ]
  %71 = phi i32 [ %79, %69 ], [ %68, %66 ]
    #dbg_value(i32 %71, !532, !DIExpression(), !533)
    #dbg_value(i64 %70, !531, !DIExpression(), !533)
  %72 = getelementptr inbounds i32, ptr %26, i64 %70, !dbg !553
  call void @__record_field_access_full(i32 3, ptr %72, i32 0), !dbg !553
  %73 = load i32, ptr %72, align 4, !dbg !553, !tbaa !380
  %74 = sub nsw i32 %73, %27, !dbg !555
  %75 = getelementptr inbounds i32, ptr %29, i64 %70, !dbg !556
  call void @__record_field_access_full(i32 3, ptr %75, i32 0), !dbg !556
  %76 = load i32, ptr %75, align 4, !dbg !556, !tbaa !380
  %77 = sub nsw i32 %76, %31, !dbg !557
  %78 = mul nsw i32 %77, %74, !dbg !558
  %79 = add nsw i32 %78, %71, !dbg !559
    #dbg_value(i32 %79, !532, !DIExpression(), !533)
  %80 = add nuw nsw i64 %70, 1, !dbg !552
    #dbg_value(i64 %80, !531, !DIExpression(), !533)
  %81 = icmp eq i64 %80, %32, !dbg !547
  br i1 %81, label %82, label %69, !dbg !551, !llvm.loop !562

82:                                               ; preds = %69, %62, %21
  %83 = phi i32 [ 0, %21 ], [ %64, %62 ], [ %79, %69 ], !dbg !563
  %84 = add nsw i32 %23, -1, !dbg !564
  %85 = sdiv i32 %83, %84, !dbg !565
  %86 = getelementptr inbounds ptr, ptr %18, i64 %22, !dbg !566
  call void @__record_field_access_full(i32 9, ptr %86, i32 0), !dbg !566
  %87 = load ptr, ptr %86, align 8, !dbg !566, !tbaa !404
  %88 = getelementptr inbounds i32, ptr %87, i64 %14, !dbg !566
  call void @__record_field_access_full(i32 3, ptr %88, i32 1), !dbg !567
  store i32 %85, ptr %88, align 4, !dbg !567, !tbaa !380
  %89 = getelementptr inbounds i32, ptr %20, i64 %22, !dbg !568
  call void @__record_field_access_full(i32 3, ptr %89, i32 1), !dbg !569
  store i32 %85, ptr %89, align 4, !dbg !569, !tbaa !380
  %90 = add nsw i64 %22, 1, !dbg !570
    #dbg_value(i64 %90, !530, !DIExpression(), !533)
  call void @__record_field_access_full(i32 0, ptr @num_rows, i32 0), !dbg !541
  %91 = load i32, ptr @num_rows, align 4, !dbg !541, !tbaa !380
  %92 = sext i32 %91 to i64, !dbg !545
  %93 = icmp slt i64 %90, %92, !dbg !545
  br i1 %93, label %21, label %94, !dbg !546, !llvm.loop !571

94:                                               ; preds = %82, %8
  %95 = tail call i32 @pthread_mutex_lock(ptr noundef nonnull @row_lock) #13, !dbg !573
  call void @__record_field_access_full(i32 0, ptr @next_row, i32 0), !dbg !574
  %96 = load i32, ptr @next_row, align 4, !dbg !574, !tbaa !380
    #dbg_value(i32 %96, !529, !DIExpression(), !533)
  %97 = add nsw i32 %96, 1, !dbg !575
  call void @__record_field_access_full(i32 0, ptr @next_row, i32 1), !dbg !575
  store i32 %97, ptr @next_row, align 4, !dbg !575, !tbaa !380
  %98 = tail call i32 @pthread_mutex_unlock(ptr noundef nonnull @row_lock) #13, !dbg !576
  call void @__record_field_access_full(i32 0, ptr @num_rows, i32 0), !dbg !538
  %99 = load i32, ptr @num_rows, align 4, !dbg !538, !tbaa !380
  %100 = icmp slt i32 %96, %99, !dbg !539
  br i1 %100, label %8, label %101, !dbg !540, !llvm.loop !577

101:                                              ; preds = %94, %1
  ret ptr null, !dbg !579
}

; Function Attrs: nounwind
declare !dbg !580 i32 @pthread_mutex_lock(ptr noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare !dbg !584 i32 @pthread_mutex_unlock(ptr noundef) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local void @pthread_mean() local_unnamed_addr #0 !dbg !585 {
  %1 = alloca %union.pthread_attr_t, align 8, !DIAssignID !604
    #dbg_assign(i1 undef, !589, !DIExpression(), !604, ptr %1, !DIExpression(), !605)
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %1) #13, !dbg !606
  %2 = tail call i64 @sysconf(i32 noundef 84) #13, !dbg !607
  %3 = trunc i64 %2 to i32, !dbg !607
  call void @__record_field_access_full(i32 0, ptr @num_procs, i32 1), !dbg !607
  store i32 %3, ptr @num_procs, align 4, !dbg !607, !tbaa !380
  %4 = icmp slt i32 %3, 1, !dbg !607
  br i1 %4, label %5, label %6, !dbg !609

5:                                                ; preds = %0
  tail call void @perror(ptr noundef nonnull @.str.6) #15, !dbg !610
  tail call void @exit(i32 noundef 1) #14, !dbg !610
  unreachable, !dbg !610

6:                                                ; preds = %0
  %7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %3), !dbg !612
  call void @__record_field_access_full(i32 0, ptr @num_procs, i32 0), !dbg !613
  %8 = load i32, ptr @num_procs, align 4, !dbg !613, !tbaa !380
  %9 = sext i32 %8 to i64, !dbg !613
  %10 = shl nsw i64 %9, 3, !dbg !614
    #dbg_value(i64 %10, !615, !DIExpression(), !623)
  %11 = tail call noalias ptr @malloc(i64 noundef %10) #16, !dbg !625
    #dbg_value(ptr %11, !622, !DIExpression(), !623)
  %12 = icmp eq ptr %11, null, !dbg !626
  br i1 %12, label %13, label %14, !dbg !629

13:                                               ; preds = %6
  tail call void @__assert_fail(ptr noundef nonnull @.str.11, ptr noundef nonnull @.str.12, i32 noundef 46, ptr noundef nonnull @__PRETTY_FUNCTION__.MALLOC) #14, !dbg !626
  unreachable, !dbg !626

14:                                               ; preds = %6
    #dbg_value(ptr %11, !598, !DIExpression(), !605)
  %15 = tail call noalias ptr @malloc(i64 noundef %10) #16, !dbg !630
    #dbg_value(ptr %15, !600, !DIExpression(), !605)
  %16 = call i32 @pthread_attr_init(ptr noundef nonnull %1) #13, !dbg !631
  %17 = call i32 @pthread_attr_setscope(ptr noundef nonnull %1, i32 noundef 0) #13, !dbg !632
  call void @__record_field_access_full(i32 0, ptr @num_rows, i32 0), !dbg !633
  %18 = load i32, ptr @num_rows, align 4, !dbg !633, !tbaa !380
  call void @__record_field_access_full(i32 0, ptr @num_procs, i32 0), !dbg !634
  %19 = load i32, ptr @num_procs, align 4, !dbg !634, !tbaa !380
  %20 = sdiv i32 %18, %19, !dbg !635
  %21 = srem i32 %18, %19, !dbg !636
    #dbg_value(i32 %20, !601, !DIExpression(), !605)
    #dbg_value(!DIArgList(i32 %18, i32 %20, i32 %19), !602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_mul, DW_OP_minus, DW_OP_stack_value), !605)
    #dbg_value(i32 0, !603, !DIExpression(), !605)
    #dbg_value(i32 0, !599, !DIExpression(), !605)
  %22 = icmp sgt i32 %19, 0, !dbg !637
  br i1 %22, label %23, label %62, !dbg !640

23:                                               ; preds = %14
  %24 = mul nsw i32 %20, %19, !dbg !641
    #dbg_value(!DIArgList(i32 %18, i32 %24), !602, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_minus, DW_OP_stack_value), !605)
    #dbg_value(i32 %21, !602, !DIExpression(), !605)
  br label %32, !dbg !640

25:                                               ; preds = %43
  %26 = add nuw nsw i64 %33, 1, !dbg !642
    #dbg_value(i32 %44, !603, !DIExpression(), !605)
    #dbg_value(i32 %45, !602, !DIExpression(), !605)
    #dbg_value(i64 %26, !599, !DIExpression(), !605)
  call void @__record_field_access_full(i32 0, ptr @num_procs, i32 0), !dbg !643
  %27 = load i32, ptr @num_procs, align 4, !dbg !643, !tbaa !380
  %28 = sext i32 %27 to i64, !dbg !637
  %29 = icmp slt i64 %26, %28, !dbg !637
  br i1 %29, label %32, label %30, !dbg !640, !llvm.loop !644

30:                                               ; preds = %25
  %31 = icmp sgt i32 %27, 0, !dbg !646
    #dbg_value(i32 0, !599, !DIExpression(), !605)
  br i1 %31, label %55, label %62, !dbg !649

32:                                               ; preds = %25, %23
  %33 = phi i64 [ 0, %23 ], [ %26, %25 ]
  %34 = phi i32 [ 0, %23 ], [ %44, %25 ]
  %35 = phi i32 [ %21, %23 ], [ %45, %25 ]
    #dbg_value(i32 %34, !603, !DIExpression(), !605)
    #dbg_value(i32 %35, !602, !DIExpression(), !605)
    #dbg_value(i64 %33, !599, !DIExpression(), !605)
  %36 = getelementptr inbounds %struct.mean_arg_t, ptr %15, i64 %33, !dbg !650
  call void @__record_field_access_full(i32 4, ptr %36, i32 1), !dbg !652
  store i32 %34, ptr %36, align 4, !dbg !652, !tbaa !497
  %37 = add nsw i32 %34, %20, !dbg !653
  %38 = getelementptr inbounds i8, ptr %36, i64 4, !dbg !654
  call void @__record_field_access_full(i32 5, ptr %38, i32 1), !dbg !655
  store i32 %37, ptr %38, align 4, !dbg !655, !tbaa !501
  %39 = icmp sgt i32 %35, 0, !dbg !656
  br i1 %39, label %40, label %43, !dbg !658

40:                                               ; preds = %32
  %41 = add nsw i32 %37, 1, !dbg !659
  store i32 %41, ptr %38, align 4, !dbg !659, !tbaa !501
  %42 = add nsw i32 %35, -1, !dbg !661
    #dbg_value(i32 %42, !602, !DIExpression(), !605)
  br label %43, !dbg !662

43:                                               ; preds = %40, %32
  %44 = phi i32 [ %41, %40 ], [ %37, %32 ], !dbg !663
  %45 = phi i32 [ %42, %40 ], [ %35, %32 ], !dbg !605
    #dbg_value(i32 %45, !602, !DIExpression(), !605)
    #dbg_value(i32 %44, !603, !DIExpression(), !605)
  %46 = getelementptr inbounds i64, ptr %11, i64 %33, !dbg !664
  call void @__record_field_access_full(i32 10, ptr %46, i32 0), !dbg !664
  %47 = call i32 @pthread_create(ptr noundef nonnull %46, ptr noundef nonnull %1, ptr noundef nonnull @calc_mean, ptr noundef nonnull %36) #13, !dbg !664
  %48 = icmp eq i32 %47, 0, !dbg !664
    #dbg_value(i64 %33, !599, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !605)
  br i1 %48, label %25, label %49, !dbg !666

49:                                               ; preds = %43
  call void @perror(ptr noundef nonnull @.str.8) #15, !dbg !667
  call void @exit(i32 noundef 1) #14, !dbg !667
  unreachable, !dbg !667

50:                                               ; preds = %55
  %51 = add nuw nsw i64 %56, 1, !dbg !669
    #dbg_value(i64 %51, !599, !DIExpression(), !605)
  call void @__record_field_access_full(i32 0, ptr @num_procs, i32 0), !dbg !670
  %52 = load i32, ptr @num_procs, align 4, !dbg !670, !tbaa !380
  %53 = sext i32 %52 to i64, !dbg !646
  %54 = icmp slt i64 %51, %53, !dbg !646
  br i1 %54, label %55, label %62, !dbg !649, !llvm.loop !671

55:                                               ; preds = %50, %30
  %56 = phi i64 [ %51, %50 ], [ 0, %30 ]
    #dbg_value(i64 %56, !599, !DIExpression(), !605)
  %57 = getelementptr inbounds i64, ptr %11, i64 %56, !dbg !673
  call void @__record_field_access_full(i32 10, ptr %57, i32 0), !dbg !673
  %58 = load i64, ptr %57, align 8, !dbg !673, !tbaa !676
  %59 = call i32 @pthread_join(i64 noundef %58, ptr noundef null) #13, !dbg !673
  %60 = icmp eq i32 %59, 0, !dbg !673
    #dbg_value(i64 %56, !599, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !605)
  br i1 %60, label %50, label %61, !dbg !678

61:                                               ; preds = %55
  call void @perror(ptr noundef nonnull @.str.9) #15, !dbg !679
  call void @exit(i32 noundef 1) #14, !dbg !679
  unreachable, !dbg !679

62:                                               ; preds = %50, %30, %14
  call void @free(ptr noundef %11) #13, !dbg !681
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %1) #13, !dbg !682
  ret void, !dbg !682
}

; Function Attrs: nounwind
declare !dbg !683 i64 @sysconf(i32 noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare !dbg !687 void @perror(ptr nocapture noundef readonly) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare !dbg !690 noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #7

; Function Attrs: nounwind
declare !dbg !691 i32 @pthread_attr_init(ptr noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare !dbg !695 i32 @pthread_attr_setscope(ptr noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
declare !dbg !698 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #2

declare !dbg !707 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare !dbg !711 void @free(ptr allocptr nocapture noundef) local_unnamed_addr #9

; Function Attrs: nounwind uwtable
define dso_local void @pthread_cov() local_unnamed_addr #0 !dbg !714 {
  %1 = alloca %union.pthread_attr_t, align 8, !DIAssignID !719
    #dbg_assign(i1 undef, !717, !DIExpression(), !719, ptr %1, !DIExpression(), !720)
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %1) #13, !dbg !721
  %2 = tail call i32 @pthread_mutex_init(ptr noundef nonnull @row_lock, ptr noundef null) #13, !dbg !722
  %3 = call i32 @pthread_attr_init(ptr noundef nonnull %1) #13, !dbg !723
  %4 = call i32 @pthread_attr_setscope(ptr noundef nonnull %1, i32 noundef 0) #13, !dbg !724
  call void @__record_field_access_full(i32 0, ptr @next_row, i32 1), !dbg !725
  store i32 0, ptr @next_row, align 4, !dbg !725, !tbaa !380
  call void @__record_field_access_full(i32 0, ptr @num_procs, i32 0), !dbg !726
  %5 = load i32, ptr @num_procs, align 4, !dbg !726, !tbaa !380
  %6 = sext i32 %5 to i64, !dbg !726
  %7 = shl nsw i64 %6, 3, !dbg !727
    #dbg_value(i64 %7, !615, !DIExpression(), !728)
  %8 = call noalias ptr @malloc(i64 noundef %7) #16, !dbg !730
    #dbg_value(ptr %8, !622, !DIExpression(), !728)
  %9 = icmp eq ptr %8, null, !dbg !731
  br i1 %9, label %12, label %10, !dbg !732

10:                                               ; preds = %0
    #dbg_value(i32 0, !716, !DIExpression(), !720)
  %11 = icmp sgt i32 %5, 0, !dbg !733
  br i1 %11, label %20, label %38, !dbg !736

12:                                               ; preds = %0
  call void @__assert_fail(ptr noundef nonnull @.str.11, ptr noundef nonnull @.str.12, i32 noundef 46, ptr noundef nonnull @__PRETTY_FUNCTION__.MALLOC) #14, !dbg !731
  unreachable, !dbg !731

13:                                               ; preds = %20
  %14 = add nuw nsw i64 %21, 1, !dbg !737
    #dbg_value(i64 %14, !716, !DIExpression(), !720)
  call void @__record_field_access_full(i32 0, ptr @num_procs, i32 0), !dbg !738
  %15 = load i32, ptr @num_procs, align 4, !dbg !738, !tbaa !380
  %16 = sext i32 %15 to i64, !dbg !733
  %17 = icmp slt i64 %14, %16, !dbg !733
  br i1 %17, label %20, label %18, !dbg !736, !llvm.loop !739

18:                                               ; preds = %13
  %19 = icmp sgt i32 %15, 0, !dbg !741
    #dbg_value(i32 0, !716, !DIExpression(), !720)
  br i1 %19, label %31, label %38, !dbg !744

20:                                               ; preds = %13, %10
  %21 = phi i64 [ %14, %13 ], [ 0, %10 ]
    #dbg_value(i64 %21, !716, !DIExpression(), !720)
  %22 = getelementptr inbounds i64, ptr %8, i64 %21, !dbg !745
  call void @__record_field_access_full(i32 10, ptr %22, i32 0), !dbg !745
  %23 = call i32 @pthread_create(ptr noundef nonnull %22, ptr noundef nonnull %1, ptr noundef nonnull @calc_cov, ptr noundef null) #13, !dbg !745
  %24 = icmp eq i32 %23, 0, !dbg !745
    #dbg_value(i64 %21, !716, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !720)
  br i1 %24, label %13, label %25, !dbg !748

25:                                               ; preds = %20
  call void @perror(ptr noundef nonnull @.str.10) #15, !dbg !749
  call void @exit(i32 noundef 1) #14, !dbg !749
  unreachable, !dbg !749

26:                                               ; preds = %31
  %27 = add nuw nsw i64 %32, 1, !dbg !751
    #dbg_value(i64 %27, !716, !DIExpression(), !720)
  call void @__record_field_access_full(i32 0, ptr @num_procs, i32 0), !dbg !752
  %28 = load i32, ptr @num_procs, align 4, !dbg !752, !tbaa !380
  %29 = sext i32 %28 to i64, !dbg !741
  %30 = icmp slt i64 %27, %29, !dbg !741
  br i1 %30, label %31, label %38, !dbg !744, !llvm.loop !753

31:                                               ; preds = %26, %18
  %32 = phi i64 [ %27, %26 ], [ 0, %18 ]
    #dbg_value(i64 %32, !716, !DIExpression(), !720)
  %33 = getelementptr inbounds i64, ptr %8, i64 %32, !dbg !755
  call void @__record_field_access_full(i32 10, ptr %33, i32 0), !dbg !755
  %34 = load i64, ptr %33, align 8, !dbg !755, !tbaa !676
  %35 = call i32 @pthread_join(i64 noundef %34, ptr noundef null) #13, !dbg !755
  %36 = icmp eq i32 %35, 0, !dbg !755
    #dbg_value(i64 %32, !716, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !720)
  br i1 %36, label %26, label %37, !dbg !758

37:                                               ; preds = %31
  call void @perror(ptr noundef nonnull @.str.9) #15, !dbg !759
  call void @exit(i32 noundef 1) #14, !dbg !759
  unreachable, !dbg !759

38:                                               ; preds = %26, %18, %10
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %1) #13, !dbg !761
  ret void, !dbg !761
}

; Function Attrs: nounwind
declare !dbg !762 i32 @pthread_mutex_init(ptr noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr noundef %1) local_unnamed_addr #0 !dbg !775 {
    #dbg_value(i32 %0, !779, !DIExpression(), !782)
    #dbg_value(ptr %1, !780, !DIExpression(), !782)
  tail call void @parse_args(i32 noundef %0, ptr noundef %1), !dbg !783
  call void @__record_field_access_full(i32 0, ptr @num_rows, i32 0), !dbg !784
  %3 = load i32, ptr @num_rows, align 4, !dbg !784, !tbaa !380
  %4 = sext i32 %3 to i64, !dbg !784
  %5 = shl nsw i64 %4, 3, !dbg !785
  %6 = tail call noalias ptr @malloc(i64 noundef %5) #16, !dbg !786
  call void @__record_field_access_full(i32 1, ptr @matrix, i32 1), !dbg !787
  store ptr %6, ptr @matrix, align 8, !dbg !787, !tbaa !404
    #dbg_value(i32 0, !781, !DIExpression(), !782)
  %7 = icmp sgt i32 %3, 0, !dbg !788
  br i1 %7, label %8, label %47, !dbg !791

8:                                                ; preds = %2
  call void @__record_field_access_full(i32 0, ptr @num_cols, i32 0)
  %9 = load i32, ptr @num_cols, align 4, !tbaa !380
  %10 = sext i32 %9 to i64
  %11 = shl nsw i64 %10, 2
  %12 = zext nneg i32 %3 to i64, !dbg !788
  br label %13, !dbg !791

13:                                               ; preds = %13, %8
  %14 = phi i64 [ 0, %8 ], [ %18, %13 ]
    #dbg_value(i64 %14, !781, !DIExpression(), !782)
  %15 = tail call noalias ptr @malloc(i64 noundef %11) #16, !dbg !792
  call void @__record_field_access_full(i32 1, ptr @matrix, i32 0), !dbg !794
  %16 = load ptr, ptr @matrix, align 8, !dbg !794, !tbaa !404
  %17 = getelementptr inbounds ptr, ptr %16, i64 %14, !dbg !794
  call void @__record_field_access_full(i32 6, ptr %17, i32 1), !dbg !795
  store ptr %15, ptr %17, align 8, !dbg !795, !tbaa !404
  %18 = add nuw nsw i64 %14, 1, !dbg !796
    #dbg_value(i64 %18, !781, !DIExpression(), !782)
  %19 = icmp eq i64 %18, %12, !dbg !788
  br i1 %19, label %20, label %13, !dbg !791, !llvm.loop !797

20:                                               ; preds = %13
  call void @__record_field_access_full(i32 1, ptr @matrix, i32 0), !dbg !799
  %21 = load ptr, ptr @matrix, align 8, !dbg !799, !tbaa !404
    #dbg_value(ptr %21, !454, !DIExpression(), !800)
    #dbg_value(i32 %3, !455, !DIExpression(), !800)
    #dbg_value(i32 poison, !456, !DIExpression(), !800)
    #dbg_value(i32 0, !457, !DIExpression(), !800)
  br i1 %7, label %22, label %47, !dbg !802

22:                                               ; preds = %20
  call void @__record_field_access_full(i32 0, ptr @num_cols, i32 0), !dbg !803
  %23 = load i32, ptr @num_cols, align 4, !dbg !803, !tbaa !380
    #dbg_value(i32 %23, !456, !DIExpression(), !800)
  %24 = icmp sgt i32 %23, 0
  %25 = zext nneg i32 %3 to i64, !dbg !804
  %26 = zext nneg i32 %23 to i64
  br label %27, !dbg !802

27:                                               ; preds = %40, %22
  %28 = phi i64 [ 0, %22 ], [ %41, %40 ]
    #dbg_value(i64 %28, !457, !DIExpression(), !800)
    #dbg_value(i32 0, !458, !DIExpression(), !800)
  br i1 %24, label %29, label %40, !dbg !805

29:                                               ; preds = %27
  %30 = getelementptr inbounds ptr, ptr %21, i64 %28
  call void @__record_field_access_full(i32 6, ptr %30, i32 0), !dbg !805
  br label %31, !dbg !805

31:                                               ; preds = %31, %29
  %32 = phi i64 [ 0, %29 ], [ %38, %31 ]
    #dbg_value(i64 %32, !458, !DIExpression(), !800)
  %33 = tail call i32 @rand() #13, !dbg !806
  call void @__record_field_access_full(i32 0, ptr @grid_size, i32 0), !dbg !807
  %34 = load i32, ptr @grid_size, align 4, !dbg !807, !tbaa !380
  %35 = srem i32 %33, %34, !dbg !808
  %36 = load ptr, ptr %30, align 8, !dbg !809, !tbaa !404
  %37 = getelementptr inbounds i32, ptr %36, i64 %32, !dbg !809
  call void @__record_field_access_full(i32 3, ptr %37, i32 1), !dbg !810
  store i32 %35, ptr %37, align 4, !dbg !810, !tbaa !380
  %38 = add nuw nsw i64 %32, 1, !dbg !811
    #dbg_value(i64 %38, !458, !DIExpression(), !800)
  %39 = icmp eq i64 %38, %26, !dbg !812
  br i1 %39, label %40, label %31, !dbg !805, !llvm.loop !813

40:                                               ; preds = %31, %27
  %41 = add nuw nsw i64 %28, 1, !dbg !815
    #dbg_value(i64 %41, !457, !DIExpression(), !800)
  %42 = icmp eq i64 %41, %25, !dbg !804
  br i1 %42, label %43, label %27, !dbg !802, !llvm.loop !816

43:                                               ; preds = %40
  call void @__record_field_access_full(i32 0, ptr @num_rows, i32 0), !dbg !818
  %44 = load i32, ptr @num_rows, align 4, !dbg !818, !tbaa !380
  %45 = sext i32 %44 to i64, !dbg !818
  %46 = shl nsw i64 %45, 3, !dbg !819
  br label %47, !dbg !818

47:                                               ; preds = %43, %20, %2
  %48 = phi i64 [ %46, %43 ], [ %5, %20 ], [ %5, %2 ], !dbg !819
  %49 = phi i64 [ %45, %43 ], [ %4, %20 ], [ %4, %2 ], !dbg !818
  %50 = phi i32 [ %44, %43 ], [ %3, %20 ], [ %3, %2 ], !dbg !818
  %51 = shl nsw i64 %49, 2, !dbg !820
  %52 = tail call noalias ptr @malloc(i64 noundef %51) #16, !dbg !821
  call void @__record_field_access_full(i32 1, ptr @mean, i32 1), !dbg !822
  store ptr %52, ptr @mean, align 8, !dbg !822, !tbaa !404
  %53 = tail call noalias ptr @malloc(i64 noundef %48) #16, !dbg !823
  call void @__record_field_access_full(i32 1, ptr @cov, i32 1), !dbg !824
  store ptr %53, ptr @cov, align 8, !dbg !824, !tbaa !404
    #dbg_value(i32 0, !781, !DIExpression(), !782)
  %54 = icmp sgt i32 %50, 0, !dbg !825
  br i1 %54, label %55, label %64, !dbg !828

55:                                               ; preds = %47
  %56 = zext nneg i32 %50 to i64, !dbg !825
  br label %57, !dbg !828

57:                                               ; preds = %57, %55
  %58 = phi i64 [ 0, %55 ], [ %62, %57 ]
    #dbg_value(i64 %58, !781, !DIExpression(), !782)
  %59 = tail call noalias ptr @malloc(i64 noundef %51) #16, !dbg !829
  call void @__record_field_access_full(i32 1, ptr @cov, i32 0), !dbg !831
  %60 = load ptr, ptr @cov, align 8, !dbg !831, !tbaa !404
  %61 = getelementptr inbounds ptr, ptr %60, i64 %58, !dbg !831
  call void @__record_field_access_full(i32 9, ptr %61, i32 1), !dbg !832
  store ptr %59, ptr %61, align 8, !dbg !832, !tbaa !404
  %62 = add nuw nsw i64 %58, 1, !dbg !833
    #dbg_value(i64 %62, !781, !DIExpression(), !782)
  %63 = icmp eq i64 %62, %56, !dbg !825
  br i1 %63, label %64, label %57, !dbg !828, !llvm.loop !834

64:                                               ; preds = %57, %47
  tail call void @pthread_mean(), !dbg !836
  tail call void @pthread_cov(), !dbg !837
    #dbg_value(i32 0, !781, !DIExpression(), !782)
  call void @__record_field_access_full(i32 0, ptr @num_rows, i32 0), !dbg !838
  %65 = load i32, ptr @num_rows, align 4, !dbg !838, !tbaa !380
  %66 = icmp sgt i32 %65, 0, !dbg !841
  br i1 %66, label %67, label %79, !dbg !842

67:                                               ; preds = %67, %64
  %68 = phi i64 [ %75, %67 ], [ 0, %64 ]
    #dbg_value(i64 %68, !781, !DIExpression(), !782)
  call void @__record_field_access_full(i32 1, ptr @cov, i32 0), !dbg !843
  %69 = load ptr, ptr @cov, align 8, !dbg !843, !tbaa !404
  %70 = getelementptr inbounds ptr, ptr %69, i64 %68, !dbg !843
  call void @__record_field_access_full(i32 9, ptr %70, i32 0), !dbg !843
  %71 = load ptr, ptr %70, align 8, !dbg !843, !tbaa !404
  tail call void @free(ptr noundef %71) #13, !dbg !845
  call void @__record_field_access_full(i32 1, ptr @matrix, i32 0), !dbg !846
  %72 = load ptr, ptr @matrix, align 8, !dbg !846, !tbaa !404
  %73 = getelementptr inbounds ptr, ptr %72, i64 %68, !dbg !846
  call void @__record_field_access_full(i32 6, ptr %73, i32 0), !dbg !846
  %74 = load ptr, ptr %73, align 8, !dbg !846, !tbaa !404
  tail call void @free(ptr noundef %74) #13, !dbg !847
  %75 = add nuw nsw i64 %68, 1, !dbg !848
    #dbg_value(i64 %75, !781, !DIExpression(), !782)
  call void @__record_field_access_full(i32 0, ptr @num_rows, i32 0), !dbg !838
  %76 = load i32, ptr @num_rows, align 4, !dbg !838, !tbaa !380
  %77 = sext i32 %76 to i64, !dbg !841
  %78 = icmp slt i64 %75, %77, !dbg !841
  br i1 %78, label %67, label %79, !dbg !842, !llvm.loop !849

79:                                               ; preds = %67, %64
  call void @__record_field_access_full(i32 1, ptr @mean, i32 0), !dbg !851
  %80 = load ptr, ptr @mean, align 8, !dbg !851, !tbaa !404
  tail call void @free(ptr noundef %80) #13, !dbg !852
  call void @__record_field_access_full(i32 1, ptr @cov, i32 0), !dbg !853
  %81 = load ptr, ptr @cov, align 8, !dbg !853, !tbaa !404
  tail call void @free(ptr noundef %81) #13, !dbg !854
  call void @__record_field_access_full(i32 1, ptr @matrix, i32 0), !dbg !855
  %82 = load ptr, ptr @matrix, align 8, !dbg !855, !tbaa !404
  tail call void @free(ptr noundef %82) #13, !dbg !856
  ret i32 0, !dbg !857
}

; Function Attrs: mustprogress nofree nounwind willreturn
declare !dbg !858 i64 @strtol(ptr noundef readonly, ptr nocapture noundef, i32 noundef) local_unnamed_addr #10

; Function Attrs: noreturn nounwind
declare !dbg !862 void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #11

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.vector.reduce.add.v4i32(<4 x i32>) #12

declare void @__record_field_access(i32)

declare void @__record_field_access_full(i32, ptr, i32)

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nofree nounwind }
attributes #12 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #13 = { nounwind }
attributes #14 = { noreturn nounwind }
attributes #15 = { cold }
attributes #16 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!363, !364, !365, !366, !367, !368, !369}
!llvm.ident = !{!370}
!fieldanalysis.instrumented = !{}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "num_rows", scope: !2, file: !234, line: 43, type: !238, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !231, globals: !250, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/pca/pca-pthread.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/pca", checksumkind: CSK_MD5, checksum: "0339769cfbd9057636ab2a2b60ffd158")
!4 = !{!5, !226}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 71, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/confname.h", directory: "", checksumkind: CSK_MD5, checksum: "78b98c9476f9b4c41f6f4ea6bcb3195f")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13, !14, !15, !16, !17, !18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65, !66, !67, !68, !69, !70, !71, !72, !73, !74, !75, !76, !77, !78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148, !149, !150, !151, !152, !153, !154, !155, !156, !157, !158, !159, !160, !161, !162, !163, !164, !165, !166, !167, !168, !169, !170, !171, !172, !173, !174, !175, !176, !177, !178, !179, !180, !181, !182, !183, !184, !185, !186, !187, !188, !189, !190, !191, !192, !193, !194, !195, !196, !197, !198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220, !221, !222, !223, !224, !225}
!9 = !DIEnumerator(name: "_SC_ARG_MAX", value: 0)
!10 = !DIEnumerator(name: "_SC_CHILD_MAX", value: 1)
!11 = !DIEnumerator(name: "_SC_CLK_TCK", value: 2)
!12 = !DIEnumerator(name: "_SC_NGROUPS_MAX", value: 3)
!13 = !DIEnumerator(name: "_SC_OPEN_MAX", value: 4)
!14 = !DIEnumerator(name: "_SC_STREAM_MAX", value: 5)
!15 = !DIEnumerator(name: "_SC_TZNAME_MAX", value: 6)
!16 = !DIEnumerator(name: "_SC_JOB_CONTROL", value: 7)
!17 = !DIEnumerator(name: "_SC_SAVED_IDS", value: 8)
!18 = !DIEnumerator(name: "_SC_REALTIME_SIGNALS", value: 9)
!19 = !DIEnumerator(name: "_SC_PRIORITY_SCHEDULING", value: 10)
!20 = !DIEnumerator(name: "_SC_TIMERS", value: 11)
!21 = !DIEnumerator(name: "_SC_ASYNCHRONOUS_IO", value: 12)
!22 = !DIEnumerator(name: "_SC_PRIORITIZED_IO", value: 13)
!23 = !DIEnumerator(name: "_SC_SYNCHRONIZED_IO", value: 14)
!24 = !DIEnumerator(name: "_SC_FSYNC", value: 15)
!25 = !DIEnumerator(name: "_SC_MAPPED_FILES", value: 16)
!26 = !DIEnumerator(name: "_SC_MEMLOCK", value: 17)
!27 = !DIEnumerator(name: "_SC_MEMLOCK_RANGE", value: 18)
!28 = !DIEnumerator(name: "_SC_MEMORY_PROTECTION", value: 19)
!29 = !DIEnumerator(name: "_SC_MESSAGE_PASSING", value: 20)
!30 = !DIEnumerator(name: "_SC_SEMAPHORES", value: 21)
!31 = !DIEnumerator(name: "_SC_SHARED_MEMORY_OBJECTS", value: 22)
!32 = !DIEnumerator(name: "_SC_AIO_LISTIO_MAX", value: 23)
!33 = !DIEnumerator(name: "_SC_AIO_MAX", value: 24)
!34 = !DIEnumerator(name: "_SC_AIO_PRIO_DELTA_MAX", value: 25)
!35 = !DIEnumerator(name: "_SC_DELAYTIMER_MAX", value: 26)
!36 = !DIEnumerator(name: "_SC_MQ_OPEN_MAX", value: 27)
!37 = !DIEnumerator(name: "_SC_MQ_PRIO_MAX", value: 28)
!38 = !DIEnumerator(name: "_SC_VERSION", value: 29)
!39 = !DIEnumerator(name: "_SC_PAGESIZE", value: 30)
!40 = !DIEnumerator(name: "_SC_RTSIG_MAX", value: 31)
!41 = !DIEnumerator(name: "_SC_SEM_NSEMS_MAX", value: 32)
!42 = !DIEnumerator(name: "_SC_SEM_VALUE_MAX", value: 33)
!43 = !DIEnumerator(name: "_SC_SIGQUEUE_MAX", value: 34)
!44 = !DIEnumerator(name: "_SC_TIMER_MAX", value: 35)
!45 = !DIEnumerator(name: "_SC_BC_BASE_MAX", value: 36)
!46 = !DIEnumerator(name: "_SC_BC_DIM_MAX", value: 37)
!47 = !DIEnumerator(name: "_SC_BC_SCALE_MAX", value: 38)
!48 = !DIEnumerator(name: "_SC_BC_STRING_MAX", value: 39)
!49 = !DIEnumerator(name: "_SC_COLL_WEIGHTS_MAX", value: 40)
!50 = !DIEnumerator(name: "_SC_EQUIV_CLASS_MAX", value: 41)
!51 = !DIEnumerator(name: "_SC_EXPR_NEST_MAX", value: 42)
!52 = !DIEnumerator(name: "_SC_LINE_MAX", value: 43)
!53 = !DIEnumerator(name: "_SC_RE_DUP_MAX", value: 44)
!54 = !DIEnumerator(name: "_SC_CHARCLASS_NAME_MAX", value: 45)
!55 = !DIEnumerator(name: "_SC_2_VERSION", value: 46)
!56 = !DIEnumerator(name: "_SC_2_C_BIND", value: 47)
!57 = !DIEnumerator(name: "_SC_2_C_DEV", value: 48)
!58 = !DIEnumerator(name: "_SC_2_FORT_DEV", value: 49)
!59 = !DIEnumerator(name: "_SC_2_FORT_RUN", value: 50)
!60 = !DIEnumerator(name: "_SC_2_SW_DEV", value: 51)
!61 = !DIEnumerator(name: "_SC_2_LOCALEDEF", value: 52)
!62 = !DIEnumerator(name: "_SC_PII", value: 53)
!63 = !DIEnumerator(name: "_SC_PII_XTI", value: 54)
!64 = !DIEnumerator(name: "_SC_PII_SOCKET", value: 55)
!65 = !DIEnumerator(name: "_SC_PII_INTERNET", value: 56)
!66 = !DIEnumerator(name: "_SC_PII_OSI", value: 57)
!67 = !DIEnumerator(name: "_SC_POLL", value: 58)
!68 = !DIEnumerator(name: "_SC_SELECT", value: 59)
!69 = !DIEnumerator(name: "_SC_UIO_MAXIOV", value: 60)
!70 = !DIEnumerator(name: "_SC_IOV_MAX", value: 60)
!71 = !DIEnumerator(name: "_SC_PII_INTERNET_STREAM", value: 61)
!72 = !DIEnumerator(name: "_SC_PII_INTERNET_DGRAM", value: 62)
!73 = !DIEnumerator(name: "_SC_PII_OSI_COTS", value: 63)
!74 = !DIEnumerator(name: "_SC_PII_OSI_CLTS", value: 64)
!75 = !DIEnumerator(name: "_SC_PII_OSI_M", value: 65)
!76 = !DIEnumerator(name: "_SC_T_IOV_MAX", value: 66)
!77 = !DIEnumerator(name: "_SC_THREADS", value: 67)
!78 = !DIEnumerator(name: "_SC_THREAD_SAFE_FUNCTIONS", value: 68)
!79 = !DIEnumerator(name: "_SC_GETGR_R_SIZE_MAX", value: 69)
!80 = !DIEnumerator(name: "_SC_GETPW_R_SIZE_MAX", value: 70)
!81 = !DIEnumerator(name: "_SC_LOGIN_NAME_MAX", value: 71)
!82 = !DIEnumerator(name: "_SC_TTY_NAME_MAX", value: 72)
!83 = !DIEnumerator(name: "_SC_THREAD_DESTRUCTOR_ITERATIONS", value: 73)
!84 = !DIEnumerator(name: "_SC_THREAD_KEYS_MAX", value: 74)
!85 = !DIEnumerator(name: "_SC_THREAD_STACK_MIN", value: 75)
!86 = !DIEnumerator(name: "_SC_THREAD_THREADS_MAX", value: 76)
!87 = !DIEnumerator(name: "_SC_THREAD_ATTR_STACKADDR", value: 77)
!88 = !DIEnumerator(name: "_SC_THREAD_ATTR_STACKSIZE", value: 78)
!89 = !DIEnumerator(name: "_SC_THREAD_PRIORITY_SCHEDULING", value: 79)
!90 = !DIEnumerator(name: "_SC_THREAD_PRIO_INHERIT", value: 80)
!91 = !DIEnumerator(name: "_SC_THREAD_PRIO_PROTECT", value: 81)
!92 = !DIEnumerator(name: "_SC_THREAD_PROCESS_SHARED", value: 82)
!93 = !DIEnumerator(name: "_SC_NPROCESSORS_CONF", value: 83)
!94 = !DIEnumerator(name: "_SC_NPROCESSORS_ONLN", value: 84)
!95 = !DIEnumerator(name: "_SC_PHYS_PAGES", value: 85)
!96 = !DIEnumerator(name: "_SC_AVPHYS_PAGES", value: 86)
!97 = !DIEnumerator(name: "_SC_ATEXIT_MAX", value: 87)
!98 = !DIEnumerator(name: "_SC_PASS_MAX", value: 88)
!99 = !DIEnumerator(name: "_SC_XOPEN_VERSION", value: 89)
!100 = !DIEnumerator(name: "_SC_XOPEN_XCU_VERSION", value: 90)
!101 = !DIEnumerator(name: "_SC_XOPEN_UNIX", value: 91)
!102 = !DIEnumerator(name: "_SC_XOPEN_CRYPT", value: 92)
!103 = !DIEnumerator(name: "_SC_XOPEN_ENH_I18N", value: 93)
!104 = !DIEnumerator(name: "_SC_XOPEN_SHM", value: 94)
!105 = !DIEnumerator(name: "_SC_2_CHAR_TERM", value: 95)
!106 = !DIEnumerator(name: "_SC_2_C_VERSION", value: 96)
!107 = !DIEnumerator(name: "_SC_2_UPE", value: 97)
!108 = !DIEnumerator(name: "_SC_XOPEN_XPG2", value: 98)
!109 = !DIEnumerator(name: "_SC_XOPEN_XPG3", value: 99)
!110 = !DIEnumerator(name: "_SC_XOPEN_XPG4", value: 100)
!111 = !DIEnumerator(name: "_SC_CHAR_BIT", value: 101)
!112 = !DIEnumerator(name: "_SC_CHAR_MAX", value: 102)
!113 = !DIEnumerator(name: "_SC_CHAR_MIN", value: 103)
!114 = !DIEnumerator(name: "_SC_INT_MAX", value: 104)
!115 = !DIEnumerator(name: "_SC_INT_MIN", value: 105)
!116 = !DIEnumerator(name: "_SC_LONG_BIT", value: 106)
!117 = !DIEnumerator(name: "_SC_WORD_BIT", value: 107)
!118 = !DIEnumerator(name: "_SC_MB_LEN_MAX", value: 108)
!119 = !DIEnumerator(name: "_SC_NZERO", value: 109)
!120 = !DIEnumerator(name: "_SC_SSIZE_MAX", value: 110)
!121 = !DIEnumerator(name: "_SC_SCHAR_MAX", value: 111)
!122 = !DIEnumerator(name: "_SC_SCHAR_MIN", value: 112)
!123 = !DIEnumerator(name: "_SC_SHRT_MAX", value: 113)
!124 = !DIEnumerator(name: "_SC_SHRT_MIN", value: 114)
!125 = !DIEnumerator(name: "_SC_UCHAR_MAX", value: 115)
!126 = !DIEnumerator(name: "_SC_UINT_MAX", value: 116)
!127 = !DIEnumerator(name: "_SC_ULONG_MAX", value: 117)
!128 = !DIEnumerator(name: "_SC_USHRT_MAX", value: 118)
!129 = !DIEnumerator(name: "_SC_NL_ARGMAX", value: 119)
!130 = !DIEnumerator(name: "_SC_NL_LANGMAX", value: 120)
!131 = !DIEnumerator(name: "_SC_NL_MSGMAX", value: 121)
!132 = !DIEnumerator(name: "_SC_NL_NMAX", value: 122)
!133 = !DIEnumerator(name: "_SC_NL_SETMAX", value: 123)
!134 = !DIEnumerator(name: "_SC_NL_TEXTMAX", value: 124)
!135 = !DIEnumerator(name: "_SC_XBS5_ILP32_OFF32", value: 125)
!136 = !DIEnumerator(name: "_SC_XBS5_ILP32_OFFBIG", value: 126)
!137 = !DIEnumerator(name: "_SC_XBS5_LP64_OFF64", value: 127)
!138 = !DIEnumerator(name: "_SC_XBS5_LPBIG_OFFBIG", value: 128)
!139 = !DIEnumerator(name: "_SC_XOPEN_LEGACY", value: 129)
!140 = !DIEnumerator(name: "_SC_XOPEN_REALTIME", value: 130)
!141 = !DIEnumerator(name: "_SC_XOPEN_REALTIME_THREADS", value: 131)
!142 = !DIEnumerator(name: "_SC_ADVISORY_INFO", value: 132)
!143 = !DIEnumerator(name: "_SC_BARRIERS", value: 133)
!144 = !DIEnumerator(name: "_SC_BASE", value: 134)
!145 = !DIEnumerator(name: "_SC_C_LANG_SUPPORT", value: 135)
!146 = !DIEnumerator(name: "_SC_C_LANG_SUPPORT_R", value: 136)
!147 = !DIEnumerator(name: "_SC_CLOCK_SELECTION", value: 137)
!148 = !DIEnumerator(name: "_SC_CPUTIME", value: 138)
!149 = !DIEnumerator(name: "_SC_THREAD_CPUTIME", value: 139)
!150 = !DIEnumerator(name: "_SC_DEVICE_IO", value: 140)
!151 = !DIEnumerator(name: "_SC_DEVICE_SPECIFIC", value: 141)
!152 = !DIEnumerator(name: "_SC_DEVICE_SPECIFIC_R", value: 142)
!153 = !DIEnumerator(name: "_SC_FD_MGMT", value: 143)
!154 = !DIEnumerator(name: "_SC_FIFO", value: 144)
!155 = !DIEnumerator(name: "_SC_PIPE", value: 145)
!156 = !DIEnumerator(name: "_SC_FILE_ATTRIBUTES", value: 146)
!157 = !DIEnumerator(name: "_SC_FILE_LOCKING", value: 147)
!158 = !DIEnumerator(name: "_SC_FILE_SYSTEM", value: 148)
!159 = !DIEnumerator(name: "_SC_MONOTONIC_CLOCK", value: 149)
!160 = !DIEnumerator(name: "_SC_MULTI_PROCESS", value: 150)
!161 = !DIEnumerator(name: "_SC_SINGLE_PROCESS", value: 151)
!162 = !DIEnumerator(name: "_SC_NETWORKING", value: 152)
!163 = !DIEnumerator(name: "_SC_READER_WRITER_LOCKS", value: 153)
!164 = !DIEnumerator(name: "_SC_SPIN_LOCKS", value: 154)
!165 = !DIEnumerator(name: "_SC_REGEXP", value: 155)
!166 = !DIEnumerator(name: "_SC_REGEX_VERSION", value: 156)
!167 = !DIEnumerator(name: "_SC_SHELL", value: 157)
!168 = !DIEnumerator(name: "_SC_SIGNALS", value: 158)
!169 = !DIEnumerator(name: "_SC_SPAWN", value: 159)
!170 = !DIEnumerator(name: "_SC_SPORADIC_SERVER", value: 160)
!171 = !DIEnumerator(name: "_SC_THREAD_SPORADIC_SERVER", value: 161)
!172 = !DIEnumerator(name: "_SC_SYSTEM_DATABASE", value: 162)
!173 = !DIEnumerator(name: "_SC_SYSTEM_DATABASE_R", value: 163)
!174 = !DIEnumerator(name: "_SC_TIMEOUTS", value: 164)
!175 = !DIEnumerator(name: "_SC_TYPED_MEMORY_OBJECTS", value: 165)
!176 = !DIEnumerator(name: "_SC_USER_GROUPS", value: 166)
!177 = !DIEnumerator(name: "_SC_USER_GROUPS_R", value: 167)
!178 = !DIEnumerator(name: "_SC_2_PBS", value: 168)
!179 = !DIEnumerator(name: "_SC_2_PBS_ACCOUNTING", value: 169)
!180 = !DIEnumerator(name: "_SC_2_PBS_LOCATE", value: 170)
!181 = !DIEnumerator(name: "_SC_2_PBS_MESSAGE", value: 171)
!182 = !DIEnumerator(name: "_SC_2_PBS_TRACK", value: 172)
!183 = !DIEnumerator(name: "_SC_SYMLOOP_MAX", value: 173)
!184 = !DIEnumerator(name: "_SC_STREAMS", value: 174)
!185 = !DIEnumerator(name: "_SC_2_PBS_CHECKPOINT", value: 175)
!186 = !DIEnumerator(name: "_SC_V6_ILP32_OFF32", value: 176)
!187 = !DIEnumerator(name: "_SC_V6_ILP32_OFFBIG", value: 177)
!188 = !DIEnumerator(name: "_SC_V6_LP64_OFF64", value: 178)
!189 = !DIEnumerator(name: "_SC_V6_LPBIG_OFFBIG", value: 179)
!190 = !DIEnumerator(name: "_SC_HOST_NAME_MAX", value: 180)
!191 = !DIEnumerator(name: "_SC_TRACE", value: 181)
!192 = !DIEnumerator(name: "_SC_TRACE_EVENT_FILTER", value: 182)
!193 = !DIEnumerator(name: "_SC_TRACE_INHERIT", value: 183)
!194 = !DIEnumerator(name: "_SC_TRACE_LOG", value: 184)
!195 = !DIEnumerator(name: "_SC_LEVEL1_ICACHE_SIZE", value: 185)
!196 = !DIEnumerator(name: "_SC_LEVEL1_ICACHE_ASSOC", value: 186)
!197 = !DIEnumerator(name: "_SC_LEVEL1_ICACHE_LINESIZE", value: 187)
!198 = !DIEnumerator(name: "_SC_LEVEL1_DCACHE_SIZE", value: 188)
!199 = !DIEnumerator(name: "_SC_LEVEL1_DCACHE_ASSOC", value: 189)
!200 = !DIEnumerator(name: "_SC_LEVEL1_DCACHE_LINESIZE", value: 190)
!201 = !DIEnumerator(name: "_SC_LEVEL2_CACHE_SIZE", value: 191)
!202 = !DIEnumerator(name: "_SC_LEVEL2_CACHE_ASSOC", value: 192)
!203 = !DIEnumerator(name: "_SC_LEVEL2_CACHE_LINESIZE", value: 193)
!204 = !DIEnumerator(name: "_SC_LEVEL3_CACHE_SIZE", value: 194)
!205 = !DIEnumerator(name: "_SC_LEVEL3_CACHE_ASSOC", value: 195)
!206 = !DIEnumerator(name: "_SC_LEVEL3_CACHE_LINESIZE", value: 196)
!207 = !DIEnumerator(name: "_SC_LEVEL4_CACHE_SIZE", value: 197)
!208 = !DIEnumerator(name: "_SC_LEVEL4_CACHE_ASSOC", value: 198)
!209 = !DIEnumerator(name: "_SC_LEVEL4_CACHE_LINESIZE", value: 199)
!210 = !DIEnumerator(name: "_SC_IPV6", value: 235)
!211 = !DIEnumerator(name: "_SC_RAW_SOCKETS", value: 236)
!212 = !DIEnumerator(name: "_SC_V7_ILP32_OFF32", value: 237)
!213 = !DIEnumerator(name: "_SC_V7_ILP32_OFFBIG", value: 238)
!214 = !DIEnumerator(name: "_SC_V7_LP64_OFF64", value: 239)
!215 = !DIEnumerator(name: "_SC_V7_LPBIG_OFFBIG", value: 240)
!216 = !DIEnumerator(name: "_SC_SS_REPL_MAX", value: 241)
!217 = !DIEnumerator(name: "_SC_TRACE_EVENT_NAME_MAX", value: 242)
!218 = !DIEnumerator(name: "_SC_TRACE_NAME_MAX", value: 243)
!219 = !DIEnumerator(name: "_SC_TRACE_SYS_MAX", value: 244)
!220 = !DIEnumerator(name: "_SC_TRACE_USER_EVENT_MAX", value: 245)
!221 = !DIEnumerator(name: "_SC_XOPEN_STREAMS", value: 246)
!222 = !DIEnumerator(name: "_SC_THREAD_ROBUST_PRIO_INHERIT", value: 247)
!223 = !DIEnumerator(name: "_SC_THREAD_ROBUST_PRIO_PROTECT", value: 248)
!224 = !DIEnumerator(name: "_SC_MINSIGSTKSZ", value: 249)
!225 = !DIEnumerator(name: "_SC_SIGSTKSZ", value: 250)
!226 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !227, line: 134, baseType: !7, size: 32, elements: !228)
!227 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!228 = !{!229, !230}
!229 = !DIEnumerator(name: "PTHREAD_SCOPE_SYSTEM", value: 0)
!230 = !DIEnumerator(name: "PTHREAD_SCOPE_PROCESS", value: 1)
!231 = !{!232, !240, !241, !245, !246, !238, !247}
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !233, size: 64)
!233 = !DIDerivedType(tag: DW_TAG_typedef, name: "mean_arg_t", file: !234, line: 58, baseType: !235)
!234 = !DIFile(filename: "pca-pthread.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/pca", checksumkind: CSK_MD5, checksum: "0339769cfbd9057636ab2a2b60ffd158")
!235 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !234, line: 55, size: 64, elements: !236)
!236 = !{!237, !239}
!237 = !DIDerivedType(tag: DW_TAG_member, name: "first_row", scope: !235, file: !234, line: 56, baseType: !238, size: 32)
!238 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "last_row", scope: !235, file: !234, line: 57, baseType: !238, size: 32, offset: 32)
!240 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!241 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !242, size: 64)
!242 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !243, line: 27, baseType: !244)
!243 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!244 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!245 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !246, size: 64)
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !238, size: 64)
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !248, size: 64)
!248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !249, size: 64)
!249 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!250 = !{!251, !256, !261, !266, !271, !273, !278, !283, !288, !293, !298, !0, !303, !305, !307, !309, !311, !313, !315, !317, !348, !354, !359}
!251 = !DIGlobalVariableExpression(var: !252, expr: !DIExpression())
!252 = distinct !DIGlobalVariable(scope: null, file: !234, line: 73, type: !253, isLocal: true, isDefinition: true)
!253 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 56, elements: !254)
!254 = !{!255}
!255 = !DISubrange(count: 7)
!256 = !DIGlobalVariableExpression(var: !257, expr: !DIExpression())
!257 = distinct !DIGlobalVariable(scope: null, file: !234, line: 86, type: !258, isLocal: true, isDefinition: true)
!258 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 432, elements: !259)
!259 = !{!260}
!260 = !DISubrange(count: 54)
!261 = !DIGlobalVariableExpression(var: !262, expr: !DIExpression())
!262 = distinct !DIGlobalVariable(scope: null, file: !234, line: 92, type: !263, isLocal: true, isDefinition: true)
!263 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 568, elements: !264)
!264 = !{!265}
!265 = !DISubrange(count: 71)
!266 = !DIGlobalVariableExpression(var: !267, expr: !DIExpression())
!267 = distinct !DIGlobalVariable(scope: null, file: !234, line: 96, type: !268, isLocal: true, isDefinition: true)
!268 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 168, elements: !269)
!269 = !{!270}
!270 = !DISubrange(count: 21)
!271 = !DIGlobalVariableExpression(var: !272, expr: !DIExpression())
!272 = distinct !DIGlobalVariable(scope: null, file: !234, line: 97, type: !268, isLocal: true, isDefinition: true)
!273 = !DIGlobalVariableExpression(var: !274, expr: !DIExpression())
!274 = distinct !DIGlobalVariable(scope: null, file: !234, line: 98, type: !275, isLocal: true, isDefinition: true)
!275 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 264, elements: !276)
!276 = !{!277}
!277 = !DISubrange(count: 33)
!278 = !DIGlobalVariableExpression(var: !279, expr: !DIExpression())
!279 = distinct !DIGlobalVariable(scope: null, file: !234, line: 193, type: !280, isLocal: true, isDefinition: true)
!280 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 600, elements: !281)
!281 = !{!282}
!282 = !DISubrange(count: 75)
!283 = !DIGlobalVariableExpression(var: !284, expr: !DIExpression())
!284 = distinct !DIGlobalVariable(scope: null, file: !234, line: 194, type: !285, isLocal: true, isDefinition: true)
!285 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 256, elements: !286)
!286 = !{!287}
!287 = !DISubrange(count: 32)
!288 = !DIGlobalVariableExpression(var: !289, expr: !DIExpression())
!289 = distinct !DIGlobalVariable(scope: null, file: !234, line: 216, type: !290, isLocal: true, isDefinition: true)
!290 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 800, elements: !291)
!291 = !{!292}
!292 = !DISubrange(count: 100)
!293 = !DIGlobalVariableExpression(var: !294, expr: !DIExpression())
!294 = distinct !DIGlobalVariable(scope: null, file: !234, line: 223, type: !295, isLocal: true, isDefinition: true)
!295 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 464, elements: !296)
!296 = !{!297}
!297 = !DISubrange(count: 58)
!298 = !DIGlobalVariableExpression(var: !299, expr: !DIExpression())
!299 = distinct !DIGlobalVariable(scope: null, file: !234, line: 247, type: !300, isLocal: true, isDefinition: true)
!300 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 624, elements: !301)
!301 = !{!302}
!302 = !DISubrange(count: 78)
!303 = !DIGlobalVariableExpression(var: !304, expr: !DIExpression())
!304 = distinct !DIGlobalVariable(name: "num_cols", scope: !2, file: !234, line: 44, type: !238, isLocal: false, isDefinition: true)
!305 = !DIGlobalVariableExpression(var: !306, expr: !DIExpression())
!306 = distinct !DIGlobalVariable(name: "grid_size", scope: !2, file: !234, line: 45, type: !238, isLocal: false, isDefinition: true)
!307 = !DIGlobalVariableExpression(var: !308, expr: !DIExpression())
!308 = distinct !DIGlobalVariable(name: "num_procs", scope: !2, file: !234, line: 46, type: !238, isLocal: false, isDefinition: true)
!309 = !DIGlobalVariableExpression(var: !310, expr: !DIExpression())
!310 = distinct !DIGlobalVariable(name: "next_row", scope: !2, file: !234, line: 47, type: !238, isLocal: false, isDefinition: true)
!311 = !DIGlobalVariableExpression(var: !312, expr: !DIExpression())
!312 = distinct !DIGlobalVariable(name: "matrix", scope: !2, file: !234, line: 49, type: !245, isLocal: false, isDefinition: true)
!313 = !DIGlobalVariableExpression(var: !314, expr: !DIExpression())
!314 = distinct !DIGlobalVariable(name: "cov", scope: !2, file: !234, line: 49, type: !245, isLocal: false, isDefinition: true)
!315 = !DIGlobalVariableExpression(var: !316, expr: !DIExpression())
!316 = distinct !DIGlobalVariable(name: "mean", scope: !2, file: !234, line: 50, type: !246, isLocal: false, isDefinition: true)
!317 = !DIGlobalVariableExpression(var: !318, expr: !DIExpression())
!318 = distinct !DIGlobalVariable(name: "row_lock", scope: !2, file: !234, line: 51, type: !319, isLocal: false, isDefinition: true)
!319 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_mutex_t", file: !243, line: 72, baseType: !320)
!320 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !243, line: 67, size: 320, elements: !321)
!321 = !{!322, !342, !346}
!322 = !DIDerivedType(tag: DW_TAG_member, name: "__data", scope: !320, file: !243, line: 69, baseType: !323, size: 320)
!323 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_mutex_s", file: !324, line: 22, size: 320, elements: !325)
!324 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h", directory: "", checksumkind: CSK_MD5, checksum: "584baedd80e6041b81caae7f496091c0")
!325 = !{!326, !327, !328, !329, !330, !331, !333, !334}
!326 = !DIDerivedType(tag: DW_TAG_member, name: "__lock", scope: !323, file: !324, line: 24, baseType: !238, size: 32)
!327 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !323, file: !324, line: 25, baseType: !7, size: 32, offset: 32)
!328 = !DIDerivedType(tag: DW_TAG_member, name: "__owner", scope: !323, file: !324, line: 26, baseType: !238, size: 32, offset: 64)
!329 = !DIDerivedType(tag: DW_TAG_member, name: "__nusers", scope: !323, file: !324, line: 28, baseType: !7, size: 32, offset: 96)
!330 = !DIDerivedType(tag: DW_TAG_member, name: "__kind", scope: !323, file: !324, line: 32, baseType: !238, size: 32, offset: 128)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "__spins", scope: !323, file: !324, line: 34, baseType: !332, size: 16, offset: 160)
!332 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!333 = !DIDerivedType(tag: DW_TAG_member, name: "__elision", scope: !323, file: !324, line: 35, baseType: !332, size: 16, offset: 176)
!334 = !DIDerivedType(tag: DW_TAG_member, name: "__list", scope: !323, file: !324, line: 36, baseType: !335, size: 128, offset: 192)
!335 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pthread_list_t", file: !336, line: 55, baseType: !337)
!336 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h", directory: "", checksumkind: CSK_MD5, checksum: "04c81e86d34dad9c99ad006d32e47a0d")
!337 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_internal_list", file: !336, line: 51, size: 128, elements: !338)
!338 = !{!339, !341}
!339 = !DIDerivedType(tag: DW_TAG_member, name: "__prev", scope: !337, file: !336, line: 53, baseType: !340, size: 64)
!340 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !337, size: 64)
!341 = !DIDerivedType(tag: DW_TAG_member, name: "__next", scope: !337, file: !336, line: 54, baseType: !340, size: 64, offset: 64)
!342 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !320, file: !243, line: 70, baseType: !343, size: 320)
!343 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 320, elements: !344)
!344 = !{!345}
!345 = !DISubrange(count: 40)
!346 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !320, file: !243, line: 71, baseType: !347, size: 64)
!347 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!348 = !DIGlobalVariableExpression(var: !349, expr: !DIExpression())
!349 = distinct !DIGlobalVariable(scope: null, file: !350, line: 46, type: !351, isLocal: true, isDefinition: true)
!350 = !DIFile(filename: "stddefines.h", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/pca", checksumkind: CSK_MD5, checksum: "7e9b34be889049501e3ca32135119066")
!351 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 40, elements: !352)
!352 = !{!353}
!353 = !DISubrange(count: 5)
!354 = !DIGlobalVariableExpression(var: !355, expr: !DIExpression())
!355 = distinct !DIGlobalVariable(scope: null, file: !350, line: 46, type: !356, isLocal: true, isDefinition: true)
!356 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 776, elements: !357)
!357 = !{!358}
!358 = !DISubrange(count: 97)
!359 = !DIGlobalVariableExpression(var: !360, expr: !DIExpression())
!360 = distinct !DIGlobalVariable(scope: null, file: !350, line: 46, type: !361, isLocal: true, isDefinition: true)
!361 = !DICompositeType(tag: DW_TAG_array_type, baseType: !362, size: 168, elements: !269)
!362 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !249)
!363 = !{i32 7, !"Dwarf Version", i32 5}
!364 = !{i32 2, !"Debug Info Version", i32 3}
!365 = !{i32 1, !"wchar_size", i32 4}
!366 = !{i32 8, !"PIC Level", i32 2}
!367 = !{i32 7, !"PIE Level", i32 2}
!368 = !{i32 7, !"uwtable", i32 2}
!369 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!370 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!371 = distinct !DISubprogram(name: "parse_args", scope: !234, file: !234, line: 63, type: !372, scopeLine: 64, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !374)
!372 = !DISubroutineType(types: !373)
!373 = !{null, !238, !247}
!374 = !{!375, !376, !377}
!375 = !DILocalVariable(name: "argc", arg: 1, scope: !371, file: !234, line: 63, type: !238)
!376 = !DILocalVariable(name: "argv", arg: 2, scope: !371, file: !234, line: 63, type: !247)
!377 = !DILocalVariable(name: "c", scope: !371, file: !234, line: 65, type: !238)
!378 = !DILocation(line: 0, scope: !371)
!379 = !DILocation(line: 69, column: 13, scope: !371)
!380 = !{!381, !381, i64 0}
!381 = !{!"int", !382, i64 0}
!382 = !{!"omnipotent char", !383, i64 0}
!383 = !{!"Simple C/C++ TBAA"}
!384 = !DILocation(line: 70, column: 13, scope: !371)
!385 = !DILocation(line: 71, column: 14, scope: !371)
!386 = !DILocation(line: 73, column: 4, scope: !371)
!387 = !DILocation(line: 73, column: 16, scope: !371)
!388 = !DILocalVariable(name: "__nptr", arg: 1, scope: !389, file: !390, line: 362, type: !393)
!389 = distinct !DISubprogram(name: "atoi", scope: !390, file: !390, line: 362, type: !391, scopeLine: 363, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !394)
!390 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!391 = !DISubroutineType(types: !392)
!392 = !{!238, !393}
!393 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !362, size: 64)
!394 = !{!388}
!395 = !DILocation(line: 0, scope: !389, inlinedAt: !396)
!396 = distinct !DILocation(line: 80, column: 24, scope: !397)
!397 = distinct !DILexicalBlock(scope: !398, file: !234, line: 75, column: 18)
!398 = distinct !DILexicalBlock(scope: !371, file: !234, line: 74, column: 4)
!399 = !DILocation(line: 81, column: 13, scope: !397)
!400 = !DILocation(line: 0, scope: !389, inlinedAt: !401)
!401 = distinct !DILocation(line: 83, column: 25, scope: !397)
!402 = !DILocation(line: 84, column: 13, scope: !397)
!403 = !DILocation(line: 86, column: 78, scope: !397)
!404 = !{!405, !405, i64 0}
!405 = !{!"any pointer", !382, i64 0}
!406 = !DILocation(line: 86, column: 13, scope: !397)
!407 = !DILocation(line: 87, column: 13, scope: !397)
!408 = !DILocation(line: 0, scope: !397)
!409 = !DILocation(line: 364, column: 16, scope: !389, inlinedAt: !408)
!410 = !DILocation(line: 364, column: 10, scope: !389, inlinedAt: !408)
!411 = distinct !{!411, !386, !412, !413}
!412 = !DILocation(line: 89, column: 4, scope: !371)
!413 = !{!"llvm.loop.mustprogress"}
!414 = !DILocation(line: 91, column: 8, scope: !415)
!415 = distinct !DILexicalBlock(scope: !371, file: !234, line: 91, column: 8)
!416 = !DILocation(line: 91, column: 17, scope: !415)
!417 = !DILocation(line: 91, column: 22, scope: !415)
!418 = !DILocation(line: 92, column: 7, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !234, line: 91, column: 58)
!420 = !DILocation(line: 93, column: 7, scope: !419)
!421 = !DILocation(line: 96, column: 4, scope: !371)
!422 = !DILocation(line: 97, column: 36, scope: !371)
!423 = !DILocation(line: 97, column: 4, scope: !371)
!424 = !DILocation(line: 98, column: 48, scope: !371)
!425 = !DILocation(line: 98, column: 4, scope: !371)
!426 = !DILocation(line: 99, column: 1, scope: !371)
!427 = !DISubprogram(name: "getopt", scope: !428, file: !428, line: 91, type: !429, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!428 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/getopt_core.h", directory: "", checksumkind: CSK_MD5, checksum: "81ab788980ce9d5be2ba931a6ae17301")
!429 = !DISubroutineType(types: !430)
!430 = !{!238, !238, !431, !393}
!431 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !432, size: 64)
!432 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !248)
!433 = !DISubprogram(name: "printf", scope: !434, file: !434, line: 356, type: !435, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!434 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!435 = !DISubroutineType(types: !436)
!436 = !{!238, !437, null}
!437 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !393)
!438 = !DISubprogram(name: "exit", scope: !390, file: !390, line: 624, type: !439, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!439 = !DISubroutineType(types: !440)
!440 = !{null, !238}
!441 = distinct !DISubprogram(name: "dump_points", scope: !234, file: !234, line: 104, type: !442, scopeLine: 105, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !444)
!442 = !DISubroutineType(types: !443)
!443 = !{null, !245, !238, !238}
!444 = !{!445, !446, !447, !448, !449}
!445 = !DILocalVariable(name: "vals", arg: 1, scope: !441, file: !234, line: 104, type: !245)
!446 = !DILocalVariable(name: "rows", arg: 2, scope: !441, file: !234, line: 104, type: !238)
!447 = !DILocalVariable(name: "cols", arg: 3, scope: !441, file: !234, line: 104, type: !238)
!448 = !DILocalVariable(name: "i", scope: !441, file: !234, line: 106, type: !238)
!449 = !DILocalVariable(name: "j", scope: !441, file: !234, line: 106, type: !238)
!450 = !DILocation(line: 0, scope: !441)
!451 = !DILocation(line: 116, column: 1, scope: !441)
!452 = distinct !DISubprogram(name: "generate_points", scope: !234, file: !234, line: 121, type: !442, scopeLine: 122, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !453)
!453 = !{!454, !455, !456, !457, !458}
!454 = !DILocalVariable(name: "pts", arg: 1, scope: !452, file: !234, line: 121, type: !245)
!455 = !DILocalVariable(name: "rows", arg: 2, scope: !452, file: !234, line: 121, type: !238)
!456 = !DILocalVariable(name: "cols", arg: 3, scope: !452, file: !234, line: 121, type: !238)
!457 = !DILocalVariable(name: "i", scope: !452, file: !234, line: 123, type: !238)
!458 = !DILocalVariable(name: "j", scope: !452, file: !234, line: 123, type: !238)
!459 = !DILocation(line: 0, scope: !452)
!460 = !DILocation(line: 125, column: 15, scope: !461)
!461 = distinct !DILexicalBlock(scope: !462, file: !234, line: 125, column: 4)
!462 = distinct !DILexicalBlock(scope: !452, file: !234, line: 125, column: 4)
!463 = !DILocation(line: 125, column: 4, scope: !462)
!464 = !DILocation(line: 127, column: 7, scope: !465)
!465 = distinct !DILexicalBlock(scope: !466, file: !234, line: 127, column: 7)
!466 = distinct !DILexicalBlock(scope: !461, file: !234, line: 126, column: 4)
!467 = !DILocation(line: 129, column: 22, scope: !468)
!468 = distinct !DILexicalBlock(scope: !469, file: !234, line: 128, column: 7)
!469 = distinct !DILexicalBlock(scope: !465, file: !234, line: 127, column: 7)
!470 = !DILocation(line: 129, column: 31, scope: !468)
!471 = !DILocation(line: 129, column: 29, scope: !468)
!472 = !DILocation(line: 129, column: 10, scope: !468)
!473 = !DILocation(line: 129, column: 20, scope: !468)
!474 = !DILocation(line: 127, column: 26, scope: !469)
!475 = !DILocation(line: 127, column: 18, scope: !469)
!476 = distinct !{!476, !464, !477, !413}
!477 = !DILocation(line: 130, column: 7, scope: !465)
!478 = !DILocation(line: 125, column: 23, scope: !461)
!479 = distinct !{!479, !463, !480, !413}
!480 = !DILocation(line: 131, column: 4, scope: !462)
!481 = !DILocation(line: 132, column: 1, scope: !452)
!482 = !DISubprogram(name: "rand", scope: !390, file: !390, line: 454, type: !483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!483 = !DISubroutineType(types: !484)
!484 = !{!238}
!485 = distinct !DISubprogram(name: "calc_mean", scope: !234, file: !234, line: 137, type: !486, scopeLine: 137, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !488)
!486 = !DISubroutineType(types: !487)
!487 = !{!240, !240}
!488 = !{!489, !490, !491, !492, !493}
!489 = !DILocalVariable(name: "arg", arg: 1, scope: !485, file: !234, line: 137, type: !240)
!490 = !DILocalVariable(name: "i", scope: !485, file: !234, line: 138, type: !238)
!491 = !DILocalVariable(name: "j", scope: !485, file: !234, line: 138, type: !238)
!492 = !DILocalVariable(name: "sum", scope: !485, file: !234, line: 139, type: !238)
!493 = !DILocalVariable(name: "mean_arg", scope: !485, file: !234, line: 140, type: !232)
!494 = !DILocation(line: 0, scope: !485)
!495 = !DILocation(line: 142, column: 23, scope: !496)
!496 = distinct !DILexicalBlock(scope: !485, file: !234, line: 142, column: 4)
!497 = !{!498, !381, i64 0}
!498 = !{!"", !381, i64 0, !381, i64 4}
!499 = !DILocation(line: 142, column: 48, scope: !500)
!500 = distinct !DILexicalBlock(scope: !496, file: !234, line: 142, column: 4)
!501 = !{!498, !381, i64 4}
!502 = !DILocation(line: 142, column: 36, scope: !500)
!503 = !DILocation(line: 142, column: 4, scope: !496)
!504 = !DILocation(line: 144, column: 21, scope: !505)
!505 = distinct !DILexicalBlock(scope: !506, file: !234, line: 144, column: 7)
!506 = distinct !DILexicalBlock(scope: !507, file: !234, line: 144, column: 7)
!507 = distinct !DILexicalBlock(scope: !500, file: !234, line: 142, column: 63)
!508 = !DILocation(line: 144, column: 7, scope: !506)
!509 = !DILocation(line: 144, column: 34, scope: !505)
!510 = !DILocation(line: 145, column: 17, scope: !511)
!511 = distinct !DILexicalBlock(scope: !505, file: !234, line: 144, column: 38)
!512 = !DILocation(line: 145, column: 14, scope: !511)
!513 = distinct !{!513, !508, !514, !413, !515, !516}
!514 = !DILocation(line: 146, column: 7, scope: !506)
!515 = !{!"llvm.loop.isvectorized", i32 1}
!516 = !{!"llvm.loop.unroll.runtime.disable"}
!517 = distinct !{!517, !508, !514, !413, !516, !515}
!518 = !DILocation(line: 0, scope: !507)
!519 = !DILocation(line: 147, column: 21, scope: !507)
!520 = !DILocation(line: 147, column: 7, scope: !507)
!521 = !DILocation(line: 147, column: 15, scope: !507)
!522 = !DILocation(line: 142, column: 59, scope: !500)
!523 = distinct !{!523, !503, !524, !413}
!524 = !DILocation(line: 148, column: 4, scope: !496)
!525 = !DILocation(line: 150, column: 4, scope: !485)
!526 = distinct !DISubprogram(name: "calc_cov", scope: !234, file: !234, line: 157, type: !486, scopeLine: 157, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !527)
!527 = !{!528, !529, !530, !531, !532}
!528 = !DILocalVariable(name: "arg", arg: 1, scope: !526, file: !234, line: 157, type: !240)
!529 = !DILocalVariable(name: "i", scope: !526, file: !234, line: 158, type: !238)
!530 = !DILocalVariable(name: "j", scope: !526, file: !234, line: 158, type: !238)
!531 = !DILocalVariable(name: "k", scope: !526, file: !234, line: 158, type: !238)
!532 = !DILocalVariable(name: "sum", scope: !526, file: !234, line: 159, type: !238)
!533 = !DILocation(line: 0, scope: !526)
!534 = !DILocation(line: 161, column: 4, scope: !526)
!535 = !DILocation(line: 162, column: 8, scope: !526)
!536 = !DILocation(line: 163, column: 12, scope: !526)
!537 = !DILocation(line: 164, column: 4, scope: !526)
!538 = !DILocation(line: 166, column: 15, scope: !526)
!539 = !DILocation(line: 166, column: 13, scope: !526)
!540 = !DILocation(line: 166, column: 4, scope: !526)
!541 = !DILocation(line: 167, column: 23, scope: !542)
!542 = distinct !DILexicalBlock(scope: !543, file: !234, line: 167, column: 7)
!543 = distinct !DILexicalBlock(scope: !544, file: !234, line: 167, column: 7)
!544 = distinct !DILexicalBlock(scope: !526, file: !234, line: 166, column: 25)
!545 = !DILocation(line: 167, column: 21, scope: !542)
!546 = !DILocation(line: 167, column: 7, scope: !543)
!547 = !DILocation(line: 169, column: 24, scope: !548)
!548 = distinct !DILexicalBlock(scope: !549, file: !234, line: 169, column: 10)
!549 = distinct !DILexicalBlock(scope: !550, file: !234, line: 169, column: 10)
!550 = distinct !DILexicalBlock(scope: !542, file: !234, line: 167, column: 38)
!551 = !DILocation(line: 169, column: 10, scope: !549)
!552 = !DILocation(line: 169, column: 37, scope: !548)
!553 = !DILocation(line: 170, column: 27, scope: !554)
!554 = distinct !DILexicalBlock(scope: !548, file: !234, line: 169, column: 41)
!555 = !DILocation(line: 170, column: 40, scope: !554)
!556 = !DILocation(line: 170, column: 54, scope: !554)
!557 = !DILocation(line: 170, column: 67, scope: !554)
!558 = !DILocation(line: 170, column: 51, scope: !554)
!559 = !DILocation(line: 170, column: 23, scope: !554)
!560 = distinct !{!560, !551, !561, !413, !515, !516}
!561 = !DILocation(line: 171, column: 10, scope: !549)
!562 = distinct !{!562, !551, !561, !413, !516, !515}
!563 = !DILocation(line: 0, scope: !550)
!564 = !DILocation(line: 172, column: 47, scope: !550)
!565 = !DILocation(line: 172, column: 37, scope: !550)
!566 = !DILocation(line: 172, column: 22, scope: !550)
!567 = !DILocation(line: 172, column: 32, scope: !550)
!568 = !DILocation(line: 172, column: 10, scope: !550)
!569 = !DILocation(line: 172, column: 20, scope: !550)
!570 = !DILocation(line: 167, column: 34, scope: !542)
!571 = distinct !{!571, !546, !572, !413}
!572 = !DILocation(line: 173, column: 7, scope: !543)
!573 = !DILocation(line: 174, column: 7, scope: !544)
!574 = !DILocation(line: 175, column: 11, scope: !544)
!575 = !DILocation(line: 176, column: 15, scope: !544)
!576 = !DILocation(line: 177, column: 7, scope: !544)
!577 = distinct !{!577, !540, !578, !413}
!578 = !DILocation(line: 178, column: 4, scope: !526)
!579 = !DILocation(line: 180, column: 4, scope: !526)
!580 = !DISubprogram(name: "pthread_mutex_lock", scope: !227, file: !227, line: 794, type: !581, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!581 = !DISubroutineType(types: !582)
!582 = !{!238, !583}
!583 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !319, size: 64)
!584 = !DISubprogram(name: "pthread_mutex_unlock", scope: !227, file: !227, line: 835, type: !581, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!585 = distinct !DISubprogram(name: "pthread_mean", scope: !234, file: !234, line: 187, type: !586, scopeLine: 187, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !588)
!586 = !DISubroutineType(types: !587)
!587 = !{null}
!588 = !{!589, !598, !599, !600, !601, !602, !603}
!589 = !DILocalVariable(name: "attr", scope: !585, file: !234, line: 188, type: !590)
!590 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !243, line: 62, baseType: !591)
!591 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pthread_attr_t", file: !243, line: 56, size: 448, elements: !592)
!592 = !{!593, !597}
!593 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !591, file: !243, line: 58, baseType: !594, size: 448)
!594 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 448, elements: !595)
!595 = !{!596}
!596 = !DISubrange(count: 56)
!597 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !591, file: !243, line: 59, baseType: !347, size: 64)
!598 = !DILocalVariable(name: "tid", scope: !585, file: !234, line: 189, type: !241)
!599 = !DILocalVariable(name: "i", scope: !585, file: !234, line: 190, type: !238)
!600 = !DILocalVariable(name: "mean_args", scope: !585, file: !234, line: 191, type: !232)
!601 = !DILocalVariable(name: "rows_per_thread", scope: !585, file: !234, line: 203, type: !238)
!602 = !DILocalVariable(name: "excess", scope: !585, file: !234, line: 204, type: !238)
!603 = !DILocalVariable(name: "curr_row", scope: !585, file: !234, line: 205, type: !238)
!604 = distinct !DIAssignID()
!605 = !DILocation(line: 0, scope: !585)
!606 = !DILocation(line: 188, column: 4, scope: !585)
!607 = !DILocation(line: 193, column: 4, scope: !608)
!608 = distinct !DILexicalBlock(scope: !585, file: !234, line: 193, column: 4)
!609 = !DILocation(line: 193, column: 4, scope: !585)
!610 = !DILocation(line: 193, column: 4, scope: !611)
!611 = distinct !DILexicalBlock(scope: !608, file: !234, line: 193, column: 4)
!612 = !DILocation(line: 194, column: 4, scope: !585)
!613 = !DILocation(line: 196, column: 30, scope: !585)
!614 = !DILocation(line: 196, column: 40, scope: !585)
!615 = !DILocalVariable(name: "size", arg: 1, scope: !616, file: !350, line: 43, type: !619)
!616 = distinct !DISubprogram(name: "MALLOC", scope: !350, file: !350, line: 43, type: !617, scopeLine: 44, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !621)
!617 = !DISubroutineType(types: !618)
!618 = !{!240, !619}
!619 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !620, line: 18, baseType: !244)
!620 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!621 = !{!615, !622}
!622 = !DILocalVariable(name: "temp", scope: !616, file: !350, line: 45, type: !240)
!623 = !DILocation(line: 0, scope: !616, inlinedAt: !624)
!624 = distinct !DILocation(line: 196, column: 23, scope: !585)
!625 = !DILocation(line: 45, column: 18, scope: !616, inlinedAt: !624)
!626 = !DILocation(line: 46, column: 4, scope: !627, inlinedAt: !624)
!627 = distinct !DILexicalBlock(scope: !628, file: !350, line: 46, column: 4)
!628 = distinct !DILexicalBlock(scope: !616, file: !350, line: 46, column: 4)
!629 = !DILocation(line: 46, column: 4, scope: !628, inlinedAt: !624)
!630 = !DILocation(line: 197, column: 30, scope: !585)
!631 = !DILocation(line: 200, column: 4, scope: !585)
!632 = !DILocation(line: 201, column: 4, scope: !585)
!633 = !DILocation(line: 203, column: 26, scope: !585)
!634 = !DILocation(line: 203, column: 37, scope: !585)
!635 = !DILocation(line: 203, column: 35, scope: !585)
!636 = !DILocation(line: 204, column: 26, scope: !585)
!637 = !DILocation(line: 208, column: 14, scope: !638)
!638 = distinct !DILexicalBlock(scope: !639, file: !234, line: 208, column: 4)
!639 = distinct !DILexicalBlock(scope: !585, file: !234, line: 208, column: 4)
!640 = !DILocation(line: 208, column: 4, scope: !639)
!641 = !DILocation(line: 204, column: 45, scope: !585)
!642 = !DILocation(line: 208, column: 27, scope: !638)
!643 = !DILocation(line: 208, column: 15, scope: !638)
!644 = distinct !{!644, !640, !645, !413}
!645 = !DILocation(line: 218, column: 4, scope: !639)
!646 = !DILocation(line: 221, column: 18, scope: !647)
!647 = distinct !DILexicalBlock(scope: !648, file: !234, line: 221, column: 4)
!648 = distinct !DILexicalBlock(scope: !585, file: !234, line: 221, column: 4)
!649 = !DILocation(line: 221, column: 4, scope: !648)
!650 = !DILocation(line: 209, column: 7, scope: !651)
!651 = distinct !DILexicalBlock(scope: !638, file: !234, line: 208, column: 30)
!652 = !DILocation(line: 209, column: 30, scope: !651)
!653 = !DILocation(line: 210, column: 40, scope: !651)
!654 = !DILocation(line: 210, column: 20, scope: !651)
!655 = !DILocation(line: 210, column: 29, scope: !651)
!656 = !DILocation(line: 211, column: 18, scope: !657)
!657 = distinct !DILexicalBlock(scope: !651, file: !234, line: 211, column: 11)
!658 = !DILocation(line: 211, column: 11, scope: !651)
!659 = !DILocation(line: 212, column: 34, scope: !660)
!660 = distinct !DILexicalBlock(scope: !657, file: !234, line: 211, column: 23)
!661 = !DILocation(line: 213, column: 19, scope: !660)
!662 = !DILocation(line: 214, column: 7, scope: !660)
!663 = !DILocation(line: 215, column: 31, scope: !651)
!664 = !DILocation(line: 216, column: 7, scope: !665)
!665 = distinct !DILexicalBlock(scope: !651, file: !234, line: 216, column: 7)
!666 = !DILocation(line: 216, column: 7, scope: !651)
!667 = !DILocation(line: 216, column: 7, scope: !668)
!668 = distinct !DILexicalBlock(scope: !665, file: !234, line: 216, column: 7)
!669 = !DILocation(line: 221, column: 32, scope: !647)
!670 = !DILocation(line: 221, column: 20, scope: !647)
!671 = distinct !{!671, !649, !672, !413}
!672 = !DILocation(line: 224, column: 4, scope: !648)
!673 = !DILocation(line: 223, column: 7, scope: !674)
!674 = distinct !DILexicalBlock(scope: !675, file: !234, line: 223, column: 7)
!675 = distinct !DILexicalBlock(scope: !647, file: !234, line: 222, column: 4)
!676 = !{!677, !677, i64 0}
!677 = !{!"long", !382, i64 0}
!678 = !DILocation(line: 223, column: 7, scope: !675)
!679 = !DILocation(line: 223, column: 7, scope: !680)
!680 = distinct !DILexicalBlock(scope: !674, file: !234, line: 223, column: 7)
!681 = !DILocation(line: 225, column: 4, scope: !585)
!682 = !DILocation(line: 226, column: 1, scope: !585)
!683 = !DISubprogram(name: "sysconf", scope: !684, file: !684, line: 640, type: !685, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!684 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "ed37c2e6f30ba31a8b41e4d70547c39c")
!685 = !DISubroutineType(types: !686)
!686 = !{!347, !238}
!687 = !DISubprogram(name: "perror", scope: !434, file: !434, line: 804, type: !688, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!688 = !DISubroutineType(types: !689)
!689 = !{null, !393}
!690 = !DISubprogram(name: "malloc", scope: !390, file: !390, line: 540, type: !617, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!691 = !DISubprogram(name: "pthread_attr_init", scope: !227, file: !227, line: 285, type: !692, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!692 = !DISubroutineType(types: !693)
!693 = !{!238, !694}
!694 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !590, size: 64)
!695 = !DISubprogram(name: "pthread_attr_setscope", scope: !227, file: !227, line: 349, type: !696, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!696 = !DISubroutineType(types: !697)
!697 = !{!238, !694, !238}
!698 = !DISubprogram(name: "pthread_create", scope: !227, file: !227, line: 202, type: !699, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!699 = !DISubroutineType(types: !700)
!700 = !{!238, !701, !702, !705, !706}
!701 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !241)
!702 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !703)
!703 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !704, size: 64)
!704 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !590)
!705 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !486, size: 64)
!706 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !240)
!707 = !DISubprogram(name: "pthread_join", scope: !227, file: !227, line: 219, type: !708, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!708 = !DISubroutineType(types: !709)
!709 = !{!238, !242, !710}
!710 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64)
!711 = !DISubprogram(name: "free", scope: !390, file: !390, line: 555, type: !712, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!712 = !DISubroutineType(types: !713)
!713 = !{null, !240}
!714 = distinct !DISubprogram(name: "pthread_cov", scope: !234, file: !234, line: 232, type: !586, scopeLine: 232, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !715)
!715 = !{!716, !717, !718}
!716 = !DILocalVariable(name: "i", scope: !714, file: !234, line: 233, type: !238)
!717 = !DILocalVariable(name: "attr", scope: !714, file: !234, line: 234, type: !590)
!718 = !DILocalVariable(name: "tid", scope: !714, file: !234, line: 235, type: !241)
!719 = distinct !DIAssignID()
!720 = !DILocation(line: 0, scope: !714)
!721 = !DILocation(line: 234, column: 4, scope: !714)
!722 = !DILocation(line: 237, column: 4, scope: !714)
!723 = !DILocation(line: 240, column: 4, scope: !714)
!724 = !DILocation(line: 241, column: 4, scope: !714)
!725 = !DILocation(line: 242, column: 13, scope: !714)
!726 = !DILocation(line: 244, column: 30, scope: !714)
!727 = !DILocation(line: 244, column: 40, scope: !714)
!728 = !DILocation(line: 0, scope: !616, inlinedAt: !729)
!729 = distinct !DILocation(line: 244, column: 23, scope: !714)
!730 = !DILocation(line: 45, column: 18, scope: !616, inlinedAt: !729)
!731 = !DILocation(line: 46, column: 4, scope: !627, inlinedAt: !729)
!732 = !DILocation(line: 46, column: 4, scope: !628, inlinedAt: !729)
!733 = !DILocation(line: 246, column: 14, scope: !734)
!734 = distinct !DILexicalBlock(scope: !735, file: !234, line: 246, column: 4)
!735 = distinct !DILexicalBlock(scope: !714, file: !234, line: 246, column: 4)
!736 = !DILocation(line: 246, column: 4, scope: !735)
!737 = !DILocation(line: 246, column: 27, scope: !734)
!738 = !DILocation(line: 246, column: 15, scope: !734)
!739 = distinct !{!739, !736, !740, !413}
!740 = !DILocation(line: 248, column: 4, scope: !735)
!741 = !DILocation(line: 251, column: 18, scope: !742)
!742 = distinct !DILexicalBlock(scope: !743, file: !234, line: 251, column: 4)
!743 = distinct !DILexicalBlock(scope: !714, file: !234, line: 251, column: 4)
!744 = !DILocation(line: 251, column: 4, scope: !743)
!745 = !DILocation(line: 247, column: 7, scope: !746)
!746 = distinct !DILexicalBlock(scope: !747, file: !234, line: 247, column: 7)
!747 = distinct !DILexicalBlock(scope: !734, file: !234, line: 246, column: 30)
!748 = !DILocation(line: 247, column: 7, scope: !747)
!749 = !DILocation(line: 247, column: 7, scope: !750)
!750 = distinct !DILexicalBlock(scope: !746, file: !234, line: 247, column: 7)
!751 = !DILocation(line: 251, column: 32, scope: !742)
!752 = !DILocation(line: 251, column: 20, scope: !742)
!753 = distinct !{!753, !744, !754, !413}
!754 = !DILocation(line: 253, column: 4, scope: !743)
!755 = !DILocation(line: 252, column: 7, scope: !756)
!756 = distinct !DILexicalBlock(scope: !757, file: !234, line: 252, column: 7)
!757 = distinct !DILexicalBlock(scope: !742, file: !234, line: 251, column: 36)
!758 = !DILocation(line: 252, column: 7, scope: !757)
!759 = !DILocation(line: 252, column: 7, scope: !760)
!760 = distinct !DILexicalBlock(scope: !756, file: !234, line: 252, column: 7)
!761 = !DILocation(line: 254, column: 1, scope: !714)
!762 = !DISubprogram(name: "pthread_mutex_init", scope: !227, file: !227, line: 781, type: !763, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!763 = !DISubroutineType(types: !764)
!764 = !{!238, !583, !765}
!765 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !766, size: 64)
!766 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !767)
!767 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_mutexattr_t", file: !243, line: 36, baseType: !768)
!768 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !243, line: 32, size: 32, elements: !769)
!769 = !{!770, !774}
!770 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !768, file: !243, line: 34, baseType: !771, size: 32)
!771 = !DICompositeType(tag: DW_TAG_array_type, baseType: !249, size: 32, elements: !772)
!772 = !{!773}
!773 = !DISubrange(count: 4)
!774 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !768, file: !243, line: 35, baseType: !238, size: 32)
!775 = distinct !DISubprogram(name: "main", scope: !234, file: !234, line: 258, type: !776, scopeLine: 258, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !778)
!776 = !DISubroutineType(types: !777)
!777 = !{!238, !238, !247}
!778 = !{!779, !780, !781}
!779 = !DILocalVariable(name: "argc", arg: 1, scope: !775, file: !234, line: 258, type: !238)
!780 = !DILocalVariable(name: "argv", arg: 2, scope: !775, file: !234, line: 258, type: !247)
!781 = !DILocalVariable(name: "i", scope: !775, file: !234, line: 260, type: !238)
!782 = !DILocation(line: 0, scope: !775)
!783 = !DILocation(line: 262, column: 4, scope: !775)
!784 = !DILocation(line: 265, column: 44, scope: !775)
!785 = !DILocation(line: 265, column: 42, scope: !775)
!786 = !DILocation(line: 265, column: 21, scope: !775)
!787 = !DILocation(line: 265, column: 11, scope: !775)
!788 = !DILocation(line: 266, column: 15, scope: !789)
!789 = distinct !DILexicalBlock(scope: !790, file: !234, line: 266, column: 4)
!790 = distinct !DILexicalBlock(scope: !775, file: !234, line: 266, column: 4)
!791 = !DILocation(line: 266, column: 4, scope: !790)
!792 = !DILocation(line: 268, column: 26, scope: !793)
!793 = distinct !DILexicalBlock(scope: !789, file: !234, line: 267, column: 4)
!794 = !DILocation(line: 268, column: 7, scope: !793)
!795 = !DILocation(line: 268, column: 17, scope: !793)
!796 = !DILocation(line: 266, column: 27, scope: !789)
!797 = distinct !{!797, !791, !798, !413}
!798 = !DILocation(line: 269, column: 4, scope: !790)
!799 = !DILocation(line: 271, column: 20, scope: !775)
!800 = !DILocation(line: 0, scope: !452, inlinedAt: !801)
!801 = distinct !DILocation(line: 271, column: 4, scope: !775)
!802 = !DILocation(line: 125, column: 4, scope: !462, inlinedAt: !801)
!803 = !DILocation(line: 271, column: 38, scope: !775)
!804 = !DILocation(line: 125, column: 15, scope: !461, inlinedAt: !801)
!805 = !DILocation(line: 127, column: 7, scope: !465, inlinedAt: !801)
!806 = !DILocation(line: 129, column: 22, scope: !468, inlinedAt: !801)
!807 = !DILocation(line: 129, column: 31, scope: !468, inlinedAt: !801)
!808 = !DILocation(line: 129, column: 29, scope: !468, inlinedAt: !801)
!809 = !DILocation(line: 129, column: 10, scope: !468, inlinedAt: !801)
!810 = !DILocation(line: 129, column: 20, scope: !468, inlinedAt: !801)
!811 = !DILocation(line: 127, column: 26, scope: !469, inlinedAt: !801)
!812 = !DILocation(line: 127, column: 18, scope: !469, inlinedAt: !801)
!813 = distinct !{!813, !805, !814, !413}
!814 = !DILocation(line: 130, column: 7, scope: !465, inlinedAt: !801)
!815 = !DILocation(line: 125, column: 23, scope: !461, inlinedAt: !801)
!816 = distinct !{!816, !802, !817, !413}
!817 = !DILocation(line: 131, column: 4, scope: !462, inlinedAt: !801)
!818 = !DILocation(line: 277, column: 39, scope: !775)
!819 = !DILocation(line: 278, column: 39, scope: !775)
!820 = !DILocation(line: 277, column: 37, scope: !775)
!821 = !DILocation(line: 277, column: 18, scope: !775)
!822 = !DILocation(line: 277, column: 9, scope: !775)
!823 = !DILocation(line: 278, column: 18, scope: !775)
!824 = !DILocation(line: 278, column: 8, scope: !775)
!825 = !DILocation(line: 279, column: 15, scope: !826)
!826 = distinct !DILexicalBlock(scope: !827, file: !234, line: 279, column: 4)
!827 = distinct !DILexicalBlock(scope: !775, file: !234, line: 279, column: 4)
!828 = !DILocation(line: 279, column: 4, scope: !827)
!829 = !DILocation(line: 281, column: 23, scope: !830)
!830 = distinct !DILexicalBlock(scope: !826, file: !234, line: 280, column: 4)
!831 = !DILocation(line: 281, column: 7, scope: !830)
!832 = !DILocation(line: 281, column: 14, scope: !830)
!833 = !DILocation(line: 279, column: 27, scope: !826)
!834 = distinct !{!834, !828, !835, !413}
!835 = !DILocation(line: 282, column: 4, scope: !827)
!836 = !DILocation(line: 285, column: 4, scope: !775)
!837 = !DILocation(line: 286, column: 4, scope: !775)
!838 = !DILocation(line: 291, column: 16, scope: !839)
!839 = distinct !DILexicalBlock(scope: !840, file: !234, line: 291, column: 4)
!840 = distinct !DILexicalBlock(scope: !775, file: !234, line: 291, column: 4)
!841 = !DILocation(line: 291, column: 15, scope: !839)
!842 = !DILocation(line: 291, column: 4, scope: !840)
!843 = !DILocation(line: 293, column: 12, scope: !844)
!844 = distinct !DILexicalBlock(scope: !839, file: !234, line: 292, column: 4)
!845 = !DILocation(line: 293, column: 7, scope: !844)
!846 = !DILocation(line: 294, column: 12, scope: !844)
!847 = !DILocation(line: 294, column: 7, scope: !844)
!848 = !DILocation(line: 291, column: 27, scope: !839)
!849 = distinct !{!849, !842, !850, !413}
!850 = !DILocation(line: 295, column: 4, scope: !840)
!851 = !DILocation(line: 296, column: 9, scope: !775)
!852 = !DILocation(line: 296, column: 4, scope: !775)
!853 = !DILocation(line: 297, column: 9, scope: !775)
!854 = !DILocation(line: 297, column: 4, scope: !775)
!855 = !DILocation(line: 298, column: 9, scope: !775)
!856 = !DILocation(line: 298, column: 4, scope: !775)
!857 = !DILocation(line: 299, column: 4, scope: !775)
!858 = !DISubprogram(name: "strtol", scope: !390, file: !390, line: 177, type: !859, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!859 = !DISubroutineType(types: !860)
!860 = !{!347, !437, !861, !238}
!861 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !247)
!862 = !DISubprogram(name: "__assert_fail", scope: !863, file: !863, line: 69, type: !864, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!863 = !DIFile(filename: "/usr/include/assert.h", directory: "", checksumkind: CSK_MD5, checksum: "ab7dc6991d501750085448b20099a5a0")
!864 = !DISubroutineType(types: !865)
!865 = !{null, !393, !393, !7, !393}
