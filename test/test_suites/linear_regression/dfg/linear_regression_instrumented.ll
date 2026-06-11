; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/linear_regression/dfg/linear_regression.ll'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/linear_regression/linear_regression_pthread.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.POINT_T = type { i8, i8 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%union.pthread_attr_t = type { i64, [48 x i8] }

@.str = private unnamed_addr constant [22 x i8] c"USAGE: %s <filename>\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [59 x i8] c"Error at line\0A\09(fd = open(fname, O_RDONLY)) < 0\0ASystem Msg\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [48 x i8] c"Error at line\0A\09fstat(fd, &finfo) < 0\0ASystem Msg\00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [115 x i8] c"Error at line\0A\09(fdata = mmap(0, finfo.st_size + 1, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0)) == NULL\0ASystem Msg\00", align 1, !dbg !17
@.str.4 = private unnamed_addr constant [33 x i8] c"The number of processors is %d\0A\0A\00", align 1, !dbg !22
@.str.6 = private unnamed_addr constant [112 x i8] c"Error at line\0A\09pthread_create(&tmps[i], &attr, linear_regression_pthread, (void *)&tid_args[i]) != 0\0ASystem Msg\00", align 1, !dbg !27
@.str.7 = private unnamed_addr constant [87 x i8] c"Error at line\0A\09pthread_join(tid_args[i].tid, (void **)(void*)&ret_val) != 0\0ASystem Msg\00", align 1, !dbg !32
@.str.8 = private unnamed_addr constant [39 x i8] c"Error at line\0A\09ret_val != 0\0ASystem Msg\00", align 1, !dbg !37
@.str.10 = private unnamed_addr constant [13 x i8] c"\09a    = %lf\0A\00", align 1, !dbg !42
@.str.11 = private unnamed_addr constant [13 x i8] c"\09b    = %lf\0A\00", align 1, !dbg !47
@.str.12 = private unnamed_addr constant [13 x i8] c"\09xbar = %lf\0A\00", align 1, !dbg !49
@.str.13 = private unnamed_addr constant [13 x i8] c"\09ybar = %lf\0A\00", align 1, !dbg !51
@.str.14 = private unnamed_addr constant [13 x i8] c"\09r2   = %lf\0A\00", align 1, !dbg !53
@.str.15 = private unnamed_addr constant [14 x i8] c"\09SX   = %lld\0A\00", align 1, !dbg !55
@.str.16 = private unnamed_addr constant [14 x i8] c"\09SY   = %lld\0A\00", align 1, !dbg !60
@.str.17 = private unnamed_addr constant [14 x i8] c"\09SXX  = %lld\0A\00", align 1, !dbg !62
@.str.18 = private unnamed_addr constant [14 x i8] c"\09SYY  = %lld\0A\00", align 1, !dbg !64
@.str.19 = private unnamed_addr constant [14 x i8] c"\09SXY  = %lld\0A\00", align 1, !dbg !66
@.str.20 = private unnamed_addr constant [58 x i8] c"Error at line\0A\09pthread_attr_destroy(&attr) < 0\0ASystem Msg\00", align 1, !dbg !68
@.str.21 = private unnamed_addr constant [63 x i8] c"Error at line\0A\09munmap(fdata, finfo.st_size + 1) < 0\0ASystem Msg\00", align 1, !dbg !73
@.str.22 = private unnamed_addr constant [40 x i8] c"Error at line\0A\09close(fd) < 0\0ASystem Msg\00", align 1, !dbg !78
@str = private unnamed_addr constant [40 x i8] c"Linear Regression P-Threads: Running...\00", align 1
@str.23 = private unnamed_addr constant [37 x i8] c"Linear Regression P-Threads Results:\00", align 1

; Function Attrs: nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable
define dso_local noalias noundef ptr @linear_regression_pthread(ptr nocapture noundef %0) #0 !dbg !138 {
    #dbg_value(ptr %0, !142, !DIExpression(), !146)
    #dbg_value(ptr %0, !143, !DIExpression(), !146)
  %2 = getelementptr inbounds i8, ptr %0, i64 24, !dbg !147
  call void @__record_field_access_full(i32 0, ptr %2, i32 1), !dbg !148
  %3 = getelementptr inbounds i8, ptr %0, i64 40, !dbg !148
  call void @__record_field_access_full(i32 1, ptr %3, i32 1), !dbg !149
  %4 = getelementptr inbounds i8, ptr %0, i64 32, !dbg !149
  call void @__record_field_access_full(i32 2, ptr %4, i32 1), !dbg !150
  %5 = getelementptr inbounds i8, ptr %0, i64 48, !dbg !150
  call void @__record_field_access_full(i32 3, ptr %5, i32 1), !dbg !151
  %6 = getelementptr inbounds i8, ptr %0, i64 56, !dbg !151
    #dbg_value(i32 0, !145, !DIExpression(), !146)
  call void @__record_field_access_full(i32 4, ptr %6, i32 1)
  %7 = getelementptr inbounds i8, ptr %0, i64 16
  call void @__record_field_access_full(i32 5, ptr %7, i32 0), !dbg !152
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(40) %2, i8 0, i64 40, i1 false), !dbg !152
  %8 = load i32, ptr %7, align 8, !tbaa !153
  %9 = icmp sgt i32 %8, 0
    #dbg_value(i32 0, !145, !DIExpression(), !146)
  %10 = getelementptr inbounds i8, ptr %0, i64 8
  call void @__record_field_access_full(i32 6, ptr %10, i32 0)
  %11 = zext i32 %8 to i64
  %12 = and i64 %11, 1
  %13 = icmp eq i32 %8, 1
  %14 = and i64 %11, 2147483646
  %15 = icmp eq i64 %12, 0
  br label %16, !dbg !161

16:                                               ; preds = %110, %1
  %17 = phi i64 [ 0, %1 ], [ %111, %110 ]
  %18 = phi i64 [ 0, %1 ], [ %112, %110 ]
  %19 = phi i64 [ 0, %1 ], [ %113, %110 ]
  %20 = phi i64 [ 0, %1 ], [ %114, %110 ]
  %21 = phi i64 [ 0, %1 ], [ %115, %110 ]
  %22 = phi i32 [ 0, %1 ], [ %116, %110 ]
    #dbg_value(i32 %22, !145, !DIExpression(), !146)
    #dbg_value(i32 0, !144, !DIExpression(), !146)
  br i1 %9, label %23, label %110, !dbg !163

23:                                               ; preds = %16
  %24 = load ptr, ptr %10, align 8, !tbaa !167
  br i1 %13, label %73, label %25, !dbg !163

25:                                               ; preds = %25, %23
  %26 = phi i64 [ %70, %25 ], [ 0, %23 ], !dbg !168
  %27 = phi i64 [ %69, %25 ], [ %17, %23 ], !dbg !168
  %28 = phi i64 [ %67, %25 ], [ %18, %23 ], !dbg !168
  %29 = phi i64 [ %63, %25 ], [ %19, %23 ], !dbg !168
  %30 = phi i64 [ %59, %25 ], [ %20, %23 ], !dbg !168
  %31 = phi i64 [ %55, %25 ], [ %21, %23 ], !dbg !168
  %32 = phi i64 [ %71, %25 ], [ 0, %23 ]
    #dbg_value(i64 %26, !144, !DIExpression(), !146)
  %33 = getelementptr inbounds %struct.POINT_T, ptr %24, i64 %26, !dbg !168
  call void @__record_field_access_full(i32 7, ptr %33, i32 0), !dbg !171
  %34 = load i8, ptr %33, align 1, !dbg !171, !tbaa !172
  %35 = sext i8 %34 to i64, !dbg !168
  %36 = add nsw i64 %31, %35, !dbg !174
  %37 = sext i8 %34 to i32, !dbg !175
  %38 = mul nsw i32 %37, %37, !dbg !176
  %39 = zext nneg i32 %38 to i64, !dbg !175
  %40 = add nsw i64 %30, %39, !dbg !177
  %41 = getelementptr inbounds %struct.POINT_T, ptr %24, i64 %26, i32 1, !dbg !178
  call void @__record_field_access_full(i32 6, ptr %41, i32 0), !dbg !178
  %42 = load i8, ptr %41, align 1, !dbg !178, !tbaa !179
  %43 = sext i8 %42 to i64, !dbg !180
  %44 = add nsw i64 %29, %43, !dbg !181
  %45 = sext i8 %42 to i32, !dbg !182
  %46 = mul nsw i32 %45, %45, !dbg !183
  %47 = zext nneg i32 %46 to i64, !dbg !182
  %48 = add nsw i64 %28, %47, !dbg !184
  %49 = mul nsw i64 %43, %35, !dbg !185
  %50 = add nsw i64 %49, %27, !dbg !186
  %51 = or disjoint i64 %26, 1, !dbg !187
    #dbg_value(i64 %51, !144, !DIExpression(), !146)
  %52 = getelementptr inbounds %struct.POINT_T, ptr %24, i64 %51, !dbg !168
  call void @__record_field_access_full(i32 7, ptr %52, i32 0), !dbg !171
  %53 = load i8, ptr %52, align 1, !dbg !171, !tbaa !172
  %54 = sext i8 %53 to i64, !dbg !168
  %55 = add nsw i64 %36, %54, !dbg !174
  %56 = sext i8 %53 to i32, !dbg !175
  %57 = mul nsw i32 %56, %56, !dbg !176
  %58 = zext nneg i32 %57 to i64, !dbg !175
  %59 = add nsw i64 %40, %58, !dbg !177
  %60 = getelementptr inbounds %struct.POINT_T, ptr %24, i64 %51, i32 1, !dbg !178
  call void @__record_field_access_full(i32 6, ptr %60, i32 0), !dbg !178
  %61 = load i8, ptr %60, align 1, !dbg !178, !tbaa !179
  %62 = sext i8 %61 to i64, !dbg !180
  %63 = add nsw i64 %44, %62, !dbg !181
  %64 = sext i8 %61 to i32, !dbg !182
  %65 = mul nsw i32 %64, %64, !dbg !183
  %66 = zext nneg i32 %65 to i64, !dbg !182
  %67 = add nsw i64 %48, %66, !dbg !184
  %68 = mul nsw i64 %62, %54, !dbg !185
  %69 = add nsw i64 %68, %50, !dbg !186
  %70 = add nuw nsw i64 %26, 2, !dbg !187
    #dbg_value(i64 %70, !144, !DIExpression(), !146)
  %71 = add nuw i64 %32, 2, !dbg !163
  %72 = icmp eq i64 %71, %14, !dbg !163
  br i1 %72, label %73, label %25, !dbg !163, !llvm.loop !188

73:                                               ; preds = %25, %23
  %74 = phi i64 [ poison, %23 ], [ %55, %25 ]
  %75 = phi i64 [ poison, %23 ], [ %59, %25 ]
  %76 = phi i64 [ poison, %23 ], [ %63, %25 ]
  %77 = phi i64 [ poison, %23 ], [ %67, %25 ]
  %78 = phi i64 [ poison, %23 ], [ %69, %25 ]
  %79 = phi i64 [ 0, %23 ], [ %70, %25 ]
  %80 = phi i64 [ %17, %23 ], [ %69, %25 ]
  %81 = phi i64 [ %18, %23 ], [ %67, %25 ]
  %82 = phi i64 [ %19, %23 ], [ %63, %25 ]
  %83 = phi i64 [ %20, %23 ], [ %59, %25 ]
  %84 = phi i64 [ %21, %23 ], [ %55, %25 ]
  br i1 %15, label %104, label %85, !dbg !163

85:                                               ; preds = %73
    #dbg_value(i64 %79, !144, !DIExpression(), !146)
  %86 = getelementptr inbounds %struct.POINT_T, ptr %24, i64 %79, !dbg !168
  call void @__record_field_access_full(i32 7, ptr %86, i32 0), !dbg !171
  %87 = load i8, ptr %86, align 1, !dbg !171, !tbaa !172
  %88 = sext i8 %87 to i64, !dbg !168
  %89 = add nsw i64 %84, %88, !dbg !174
  %90 = sext i8 %87 to i32, !dbg !175
  %91 = mul nsw i32 %90, %90, !dbg !176
  %92 = zext nneg i32 %91 to i64, !dbg !175
  %93 = add nsw i64 %83, %92, !dbg !177
  %94 = getelementptr inbounds %struct.POINT_T, ptr %24, i64 %79, i32 1, !dbg !178
  call void @__record_field_access_full(i32 6, ptr %94, i32 0), !dbg !178
  %95 = load i8, ptr %94, align 1, !dbg !178, !tbaa !179
  %96 = sext i8 %95 to i64, !dbg !180
  %97 = add nsw i64 %82, %96, !dbg !181
  %98 = sext i8 %95 to i32, !dbg !182
  %99 = mul nsw i32 %98, %98, !dbg !183
  %100 = zext nneg i32 %99 to i64, !dbg !182
  %101 = add nsw i64 %81, %100, !dbg !184
  %102 = mul nsw i64 %96, %88, !dbg !185
  %103 = add nsw i64 %102, %80, !dbg !186
    #dbg_value(i64 %79, !144, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !146)
  br label %104, !dbg !174

104:                                              ; preds = %85, %73
  %105 = phi i64 [ %74, %73 ], [ %89, %85 ], !dbg !174
  %106 = phi i64 [ %75, %73 ], [ %93, %85 ], !dbg !177
  %107 = phi i64 [ %76, %73 ], [ %97, %85 ], !dbg !181
  %108 = phi i64 [ %77, %73 ], [ %101, %85 ], !dbg !184
  %109 = phi i64 [ %78, %73 ], [ %103, %85 ], !dbg !186
  store i64 %105, ptr %2, align 8, !dbg !174, !tbaa !191
  store i64 %106, ptr %3, align 8, !dbg !177, !tbaa !192
  store i64 %107, ptr %4, align 8, !dbg !181, !tbaa !193
  store i64 %108, ptr %5, align 8, !dbg !184, !tbaa !194
  store i64 %109, ptr %6, align 8, !dbg !186, !tbaa !195
  br label %110, !dbg !163

110:                                              ; preds = %104, %16
  %111 = phi i64 [ %109, %104 ], [ %17, %16 ]
  %112 = phi i64 [ %108, %104 ], [ %18, %16 ]
  %113 = phi i64 [ %107, %104 ], [ %19, %16 ]
  %114 = phi i64 [ %106, %104 ], [ %20, %16 ]
  %115 = phi i64 [ %105, %104 ], [ %21, %16 ]
  %116 = add nuw nsw i32 %22, 1, !dbg !196
    #dbg_value(i32 %116, !145, !DIExpression(), !146)
  %117 = icmp eq i32 %116, 100, !dbg !197
  br i1 %117, label %118, label %16, !dbg !161, !llvm.loop !198

118:                                              ; preds = %110
  ret ptr null, !dbg !200
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #2 !dbg !201 {
  %3 = alloca %struct.stat, align 8, !DIAssignID !295
    #dbg_assign(i1 undef, !212, !DIExpression(), !295, ptr %3, !DIExpression(), !296)
  %4 = alloca %union.pthread_attr_t, align 8, !DIAssignID !297
    #dbg_assign(i1 undef, !256, !DIExpression(), !297, ptr %4, !DIExpression(), !296)
  %5 = alloca [64 x i64], align 16, !DIAssignID !298
    #dbg_assign(i1 undef, !268, !DIExpression(), !298, ptr %5, !DIExpression(), !296)
  %6 = alloca i64, align 8, !DIAssignID !299
    #dbg_assign(i1 undef, !281, !DIExpression(), !299, ptr %6, !DIExpression(), !300)
    #dbg_value(i32 %0, !207, !DIExpression(), !296)
    #dbg_value(ptr %1, !208, !DIExpression(), !296)
  call void @llvm.lifetime.start.p0(i64 144, ptr nonnull %3) #13, !dbg !301
    #dbg_value(i32 4, !254, !DIExpression(), !296)
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %4) #13, !dbg !302
  %7 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !303
  call void @__record_field_access_full(i32 8, ptr %7, i32 0), !dbg !303
  %8 = load ptr, ptr %7, align 8, !dbg !303, !tbaa !305
  %9 = icmp eq ptr %8, null, !dbg !306
  br i1 %9, label %10, label %13, !dbg !307

10:                                               ; preds = %2
  call void @__record_field_access_full(i32 9, ptr %1, i32 0), !dbg !308
  %11 = load ptr, ptr %1, align 8, !dbg !308, !tbaa !305
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, ptr noundef %11), !dbg !310
  tail call void @exit(i32 noundef 1) #14, !dbg !311
  unreachable, !dbg !311

13:                                               ; preds = %2
    #dbg_value(ptr %8, !211, !DIExpression(), !296)
  %14 = tail call i32 (ptr, i32, ...) @open(ptr noundef nonnull %8, i32 noundef 0) #13, !dbg !312
    #dbg_value(i32 %14, !209, !DIExpression(), !296)
  %15 = icmp slt i32 %14, 0, !dbg !312
  br i1 %15, label %16, label %17, !dbg !314

16:                                               ; preds = %13
  tail call void @perror(ptr noundef nonnull @.str.1) #15, !dbg !315
  tail call void @exit(i32 noundef 1) #14, !dbg !315
  unreachable, !dbg !315

17:                                               ; preds = %13
  %18 = call i32 @fstat(i32 noundef %14, ptr noundef nonnull %3) #13, !dbg !317
  %19 = icmp slt i32 %18, 0, !dbg !317
  br i1 %19, label %20, label %21, !dbg !319

20:                                               ; preds = %17
  tail call void @perror(ptr noundef nonnull @.str.2) #15, !dbg !320
  tail call void @exit(i32 noundef 1) #14, !dbg !320
  unreachable, !dbg !320

21:                                               ; preds = %17
  %22 = getelementptr inbounds i8, ptr %3, i64 48, !dbg !322
  call void @__record_field_access_full(i32 10, ptr %22, i32 0), !dbg !322
  %23 = load i64, ptr %22, align 8, !dbg !322, !tbaa !324
  %24 = add nsw i64 %23, 1, !dbg !322
  %25 = tail call ptr @mmap(ptr noundef null, i64 noundef %24, i32 noundef 3, i32 noundef 2, i32 noundef %14, i64 noundef 0) #13, !dbg !322
    #dbg_value(ptr %25, !210, !DIExpression(), !296)
  %26 = icmp eq ptr %25, null, !dbg !322
  br i1 %26, label %27, label %28, !dbg !327

27:                                               ; preds = %21
  tail call void @perror(ptr noundef nonnull @.str.3) #15, !dbg !328
  tail call void @exit(i32 noundef 1) #14, !dbg !328
  unreachable, !dbg !328

28:                                               ; preds = %21
  %29 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, i32 noundef 4), !dbg !330
  %30 = call i32 @pthread_attr_init(ptr noundef nonnull %4) #13, !dbg !331
  %31 = call i32 @pthread_attr_setscope(ptr noundef nonnull %4, i32 noundef 0) #13, !dbg !332
    #dbg_value(i32 4, !253, !DIExpression(), !296)
  %32 = call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !333
    #dbg_value(ptr %25, !266, !DIExpression(), !296)
  %33 = lshr i64 %23, 1, !dbg !334
    #dbg_value(i64 %33, !267, !DIExpression(), !296)
  %34 = lshr i64 %23, 3, !dbg !335
  %35 = trunc i64 %34 to i32, !dbg !336
    #dbg_value(i32 %35, !252, !DIExpression(), !296)
  %36 = call dereferenceable_or_null(256) ptr @calloc(i64 1, i64 256), !dbg !337
    #dbg_value(ptr %36, !265, !DIExpression(), !296)
  call void @llvm.lifetime.start.p0(i64 512, ptr nonnull %5) #13, !dbg !338
    #dbg_value(i32 0, !255, !DIExpression(), !296)
  %37 = trunc i64 %33 to i32
    #dbg_value(i32 0, !255, !DIExpression(), !296)
  %38 = shl i64 %34, 32, !dbg !339
  %39 = ashr exact i64 %38, 32, !dbg !339
    #dbg_value(i64 0, !255, !DIExpression(), !296)
  %40 = getelementptr inbounds i8, ptr %36, i64 8, !dbg !340
  call void @__record_field_access_full(i32 6, ptr %40, i32 1), !dbg !341
  store ptr %25, ptr %40, align 8, !dbg !341, !tbaa !167
    #dbg_value(i32 %35, !272, !DIExpression(), !342)
    #dbg_value(i32 %35, !272, !DIExpression(), !342)
  %41 = getelementptr inbounds i8, ptr %36, i64 16, !dbg !343
  call void @__record_field_access_full(i32 5, ptr %41, i32 1), !dbg !344
  store i32 %35, ptr %41, align 8, !dbg !344, !tbaa !153
  call void @__record_field_access_full(i32 11, ptr %5, i32 1), !dbg !345
  store i64 0, ptr %5, align 16, !dbg !345, !tbaa !346
  %42 = call i32 @pthread_create(ptr noundef nonnull %5, ptr noundef nonnull %4, ptr noundef nonnull @linear_regression_pthread, ptr noundef nonnull %36) #13, !dbg !347
  %43 = icmp eq i32 %42, 0, !dbg !347
  br i1 %43, label %45, label %44, !dbg !349

44:                                               ; preds = %66, %55, %45, %28
  call void @perror(ptr noundef nonnull @.str.6) #15, !dbg !350
  call void @exit(i32 noundef 1) #14, !dbg !350
  unreachable, !dbg !350

45:                                               ; preds = %28
  call void @__record_field_access_full(i32 11, ptr %5, i32 0), !dbg !352
  %46 = load i64, ptr %5, align 16, !dbg !352, !tbaa !346
  call void @__record_field_access_full(i32 7, ptr %36, i32 1), !dbg !353
  store i64 %46, ptr %36, align 8, !dbg !353, !tbaa !354
    #dbg_value(i64 1, !255, !DIExpression(), !296)
  %47 = getelementptr inbounds %struct.POINT_T, ptr %25, i64 %39, !dbg !355
  call void @__record_field_access_full(i32 6, ptr %47, i32 1), !dbg !356
  %48 = getelementptr inbounds i8, ptr %36, i64 64, !dbg !356
  call void @__record_field_access_full(i32 7, ptr %48, i32 1), !dbg !340
  %49 = getelementptr inbounds i8, ptr %36, i64 72, !dbg !340
  call void @__record_field_access_full(i32 6, ptr %49, i32 1), !dbg !341
  store ptr %47, ptr %49, align 8, !dbg !341, !tbaa !167
    #dbg_value(i32 %35, !272, !DIExpression(), !342)
    #dbg_value(i32 %35, !272, !DIExpression(), !342)
  %50 = getelementptr inbounds i8, ptr %36, i64 80, !dbg !343
  call void @__record_field_access_full(i32 5, ptr %50, i32 1), !dbg !344
  store i32 %35, ptr %50, align 8, !dbg !344, !tbaa !153
  %51 = load i64, ptr %48, align 8, !dbg !357, !tbaa !354
  %52 = getelementptr inbounds i8, ptr %5, i64 8, !dbg !358
  call void @__record_field_access_full(i32 8, ptr %52, i32 1), !dbg !345
  store i64 %51, ptr %52, align 8, !dbg !345, !tbaa !346
  %53 = call i32 @pthread_create(ptr noundef nonnull %52, ptr noundef nonnull %4, ptr noundef nonnull @linear_regression_pthread, ptr noundef nonnull %48) #13, !dbg !347
  %54 = icmp eq i32 %53, 0, !dbg !347
  br i1 %54, label %55, label %44, !dbg !349

55:                                               ; preds = %45
  %56 = load i64, ptr %52, align 8, !dbg !352, !tbaa !346
  store i64 %56, ptr %48, align 8, !dbg !353, !tbaa !354
    #dbg_value(i64 2, !255, !DIExpression(), !296)
  %57 = ashr exact i64 %38, 30, !dbg !355
  %58 = getelementptr inbounds i8, ptr %25, i64 %57, !dbg !355
  call void @__record_field_access_full(i32 6, ptr %58, i32 1), !dbg !356
  %59 = getelementptr inbounds i8, ptr %36, i64 128, !dbg !356
  call void @__record_field_access_full(i32 7, ptr %59, i32 1), !dbg !340
  %60 = getelementptr inbounds i8, ptr %36, i64 136, !dbg !340
  call void @__record_field_access_full(i32 6, ptr %60, i32 1), !dbg !341
  store ptr %58, ptr %60, align 8, !dbg !341, !tbaa !167
    #dbg_value(i32 %35, !272, !DIExpression(), !342)
    #dbg_value(i32 %35, !272, !DIExpression(), !342)
  %61 = getelementptr inbounds i8, ptr %36, i64 144, !dbg !343
  call void @__record_field_access_full(i32 5, ptr %61, i32 1), !dbg !344
  store i32 %35, ptr %61, align 8, !dbg !344, !tbaa !153
  %62 = load i64, ptr %59, align 8, !dbg !357, !tbaa !354
  %63 = getelementptr inbounds i8, ptr %5, i64 16, !dbg !358
  call void @__record_field_access_full(i32 8, ptr %63, i32 1), !dbg !345
  store i64 %62, ptr %63, align 16, !dbg !345, !tbaa !346
  %64 = call i32 @pthread_create(ptr noundef nonnull %63, ptr noundef nonnull %4, ptr noundef nonnull @linear_regression_pthread, ptr noundef nonnull %59) #13, !dbg !347
  %65 = icmp eq i32 %64, 0, !dbg !347
  br i1 %65, label %66, label %44, !dbg !349

66:                                               ; preds = %55
  %67 = load i64, ptr %63, align 16, !dbg !352, !tbaa !346
  store i64 %67, ptr %59, align 8, !dbg !353, !tbaa !354
    #dbg_value(i64 3, !255, !DIExpression(), !296)
  %68 = mul nsw i64 %39, 3, !dbg !359
  %69 = getelementptr inbounds %struct.POINT_T, ptr %25, i64 %68, !dbg !355
  call void @__record_field_access_full(i32 6, ptr %69, i32 1), !dbg !356
  %70 = getelementptr inbounds i8, ptr %36, i64 192, !dbg !356
  call void @__record_field_access_full(i32 7, ptr %70, i32 1), !dbg !340
  %71 = getelementptr inbounds i8, ptr %36, i64 200, !dbg !340
  call void @__record_field_access_full(i32 6, ptr %71, i32 1), !dbg !341
  store ptr %69, ptr %71, align 8, !dbg !341, !tbaa !167
    #dbg_value(i32 %35, !272, !DIExpression(), !342)
  %72 = trunc nsw i64 %68 to i32, !dbg !360
  %73 = sub i32 %37, %72, !dbg !360
    #dbg_value(i32 %73, !272, !DIExpression(), !342)
  %74 = getelementptr inbounds i8, ptr %36, i64 208, !dbg !343
  call void @__record_field_access_full(i32 5, ptr %74, i32 1), !dbg !344
  store i32 %73, ptr %74, align 8, !dbg !344, !tbaa !153
  %75 = load i64, ptr %70, align 8, !dbg !357, !tbaa !354
  %76 = getelementptr inbounds i8, ptr %5, i64 24, !dbg !358
  call void @__record_field_access_full(i32 8, ptr %76, i32 1), !dbg !345
  store i64 %75, ptr %76, align 8, !dbg !345, !tbaa !346
  %77 = call i32 @pthread_create(ptr noundef nonnull %76, ptr noundef nonnull %4, ptr noundef nonnull @linear_regression_pthread, ptr noundef nonnull %70) #13, !dbg !347
  %78 = icmp eq i32 %77, 0, !dbg !347
  br i1 %78, label %79, label %44, !dbg !349

79:                                               ; preds = %66
  %80 = load i64, ptr %76, align 8, !dbg !352, !tbaa !346
  store i64 %80, ptr %70, align 8, !dbg !353, !tbaa !354
    #dbg_value(i64 4, !255, !DIExpression(), !296)
    #dbg_value(i64 0, !255, !DIExpression(), !296)
    #dbg_value(i64 0, !276, !DIExpression(), !296)
    #dbg_value(i64 0, !277, !DIExpression(), !296)
    #dbg_value(i64 0, !278, !DIExpression(), !296)
    #dbg_value(i64 0, !279, !DIExpression(), !296)
    #dbg_value(i64 0, !280, !DIExpression(), !296)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #13, !dbg !361
  call void @__record_field_access_full(i32 7, ptr %36, i32 0), !dbg !362
  %81 = load i64, ptr %36, align 8, !dbg !362, !tbaa !354
  %82 = call i32 @pthread_join(i64 noundef %81, ptr noundef nonnull %6) #13, !dbg !362
  %83 = icmp eq i32 %82, 0, !dbg !362
  br i1 %83, label %85, label %84, !dbg !364

84:                                               ; preds = %118, %102, %89, %79
  call void @perror(ptr noundef nonnull @.str.7) #15, !dbg !365
  call void @exit(i32 noundef 1) #14, !dbg !365
  unreachable, !dbg !365

85:                                               ; preds = %79
  call void @__record_field_access_full(i32 12, ptr %6, i32 0), !dbg !367
  %86 = load i64, ptr %6, align 8, !dbg !367, !tbaa !369
  %87 = icmp eq i64 %86, 0, !dbg !367
  br i1 %87, label %89, label %88, !dbg !370

88:                                               ; preds = %131, %115, %99, %85
  call void @perror(ptr noundef nonnull @.str.8) #15, !dbg !371
  call void @exit(i32 noundef 1) #14, !dbg !371
  unreachable, !dbg !371

89:                                               ; preds = %85
  %90 = getelementptr inbounds i8, ptr %36, i64 24, !dbg !373
    #dbg_value(i64 poison, !276, !DIExpression(), !296)
    #dbg_value(i64 poison, !277, !DIExpression(), !296)
  call void @__record_field_access_full(i32 8, ptr %90, i32 0), !dbg !374
  %91 = getelementptr inbounds i8, ptr %36, i64 40, !dbg !374
  call void @__record_field_access_full(i32 1, ptr %91, i32 0), !dbg !374
  %92 = load i64, ptr %91, align 8, !dbg !374, !tbaa !192
    #dbg_value(i64 %92, !278, !DIExpression(), !296)
  %93 = getelementptr inbounds i8, ptr %36, i64 48, !dbg !375
    #dbg_value(i64 poison, !279, !DIExpression(), !296)
  call void @__record_field_access_full(i32 8, ptr %93, i32 0), !dbg !373
  %94 = load <2 x i64>, ptr %90, align 8, !dbg !373, !tbaa !369
  %95 = load <2 x i64>, ptr %93, align 8, !dbg !375, !tbaa !369
    #dbg_value(i64 poison, !280, !DIExpression(), !296)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #13, !dbg !376
    #dbg_value(i64 1, !255, !DIExpression(), !296)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #13, !dbg !361
  %96 = load i64, ptr %48, align 8, !dbg !362, !tbaa !354
  %97 = call i32 @pthread_join(i64 noundef %96, ptr noundef nonnull %6) #13, !dbg !362
  %98 = icmp eq i32 %97, 0, !dbg !362
  br i1 %98, label %99, label %84, !dbg !364

99:                                               ; preds = %89
  call void @__record_field_access_full(i32 12, ptr %6, i32 0), !dbg !367
  %100 = load i64, ptr %6, align 8, !dbg !367, !tbaa !369
  %101 = icmp eq i64 %100, 0, !dbg !367
  br i1 %101, label %102, label %88, !dbg !370

102:                                              ; preds = %99
  %103 = getelementptr inbounds i8, ptr %36, i64 88, !dbg !373
    #dbg_value(!DIArgList(i64 poison, i64 poison), !276, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !296)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !277, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !296)
  call void @__record_field_access_full(i32 8, ptr %103, i32 0), !dbg !374
  %104 = getelementptr inbounds i8, ptr %36, i64 104, !dbg !374
  call void @__record_field_access_full(i32 1, ptr %104, i32 0), !dbg !374
  %105 = load i64, ptr %104, align 8, !dbg !374, !tbaa !192
  %106 = add nsw i64 %105, %92, !dbg !377
    #dbg_value(i64 %106, !278, !DIExpression(), !296)
  %107 = getelementptr inbounds i8, ptr %36, i64 112, !dbg !375
    #dbg_value(!DIArgList(i64 poison, i64 poison), !279, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !296)
  call void @__record_field_access_full(i32 8, ptr %107, i32 0), !dbg !373
  %108 = load <2 x i64>, ptr %103, align 8, !dbg !373, !tbaa !369
  %109 = add nsw <2 x i64> %108, %94, !dbg !378
  %110 = load <2 x i64>, ptr %107, align 8, !dbg !375, !tbaa !369
  %111 = add nsw <2 x i64> %110, %95, !dbg !379
    #dbg_value(!DIArgList(i64 poison, i64 poison), !280, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !296)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #13, !dbg !376
    #dbg_value(i64 2, !255, !DIExpression(), !296)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #13, !dbg !361
  %112 = load i64, ptr %59, align 8, !dbg !362, !tbaa !354
  %113 = call i32 @pthread_join(i64 noundef %112, ptr noundef nonnull %6) #13, !dbg !362
  %114 = icmp eq i32 %113, 0, !dbg !362
  br i1 %114, label %115, label %84, !dbg !364

115:                                              ; preds = %102
  call void @__record_field_access_full(i32 12, ptr %6, i32 0), !dbg !367
  %116 = load i64, ptr %6, align 8, !dbg !367, !tbaa !369
  %117 = icmp eq i64 %116, 0, !dbg !367
  br i1 %117, label %118, label %88, !dbg !370

118:                                              ; preds = %115
  %119 = getelementptr inbounds i8, ptr %36, i64 152, !dbg !373
    #dbg_value(!DIArgList(i64 poison, i64 poison), !276, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !296)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !277, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !296)
  call void @__record_field_access_full(i32 8, ptr %119, i32 0), !dbg !374
  %120 = getelementptr inbounds i8, ptr %36, i64 168, !dbg !374
  call void @__record_field_access_full(i32 1, ptr %120, i32 0), !dbg !374
  %121 = load i64, ptr %120, align 8, !dbg !374, !tbaa !192
  %122 = add nsw i64 %121, %106, !dbg !377
    #dbg_value(i64 %122, !278, !DIExpression(), !296)
  %123 = getelementptr inbounds i8, ptr %36, i64 176, !dbg !375
    #dbg_value(!DIArgList(i64 poison, i64 poison), !279, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !296)
  call void @__record_field_access_full(i32 8, ptr %123, i32 0), !dbg !373
  %124 = load <2 x i64>, ptr %119, align 8, !dbg !373, !tbaa !369
  %125 = add nsw <2 x i64> %124, %109, !dbg !378
  %126 = load <2 x i64>, ptr %123, align 8, !dbg !375, !tbaa !369
  %127 = add nsw <2 x i64> %126, %111, !dbg !379
    #dbg_value(!DIArgList(i64 poison, i64 poison), !280, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !296)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #13, !dbg !376
    #dbg_value(i64 3, !255, !DIExpression(), !296)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6) #13, !dbg !361
  %128 = load i64, ptr %70, align 8, !dbg !362, !tbaa !354
  %129 = call i32 @pthread_join(i64 noundef %128, ptr noundef nonnull %6) #13, !dbg !362
  %130 = icmp eq i32 %129, 0, !dbg !362
  br i1 %130, label %131, label %84, !dbg !364

131:                                              ; preds = %118
  call void @__record_field_access_full(i32 12, ptr %6, i32 0), !dbg !367
  %132 = load i64, ptr %6, align 8, !dbg !367, !tbaa !369
  %133 = icmp eq i64 %132, 0, !dbg !367
  br i1 %133, label %134, label %88, !dbg !370

134:                                              ; preds = %131
  %135 = getelementptr inbounds i8, ptr %36, i64 216, !dbg !373
    #dbg_value(!DIArgList(i64 poison, i64 poison), !276, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !296)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !277, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !296)
  call void @__record_field_access_full(i32 8, ptr %135, i32 0), !dbg !374
  %136 = getelementptr inbounds i8, ptr %36, i64 232, !dbg !374
  call void @__record_field_access_full(i32 1, ptr %136, i32 0), !dbg !374
  %137 = load i64, ptr %136, align 8, !dbg !374, !tbaa !192
  %138 = add nsw i64 %137, %122, !dbg !377
    #dbg_value(i64 %138, !278, !DIExpression(), !296)
  %139 = getelementptr inbounds i8, ptr %36, i64 240, !dbg !375
    #dbg_value(!DIArgList(i64 poison, i64 poison), !279, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !296)
    #dbg_value(!DIArgList(i64 poison, i64 poison), !280, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !296)
  call void @__record_field_access_full(i32 8, ptr %139, i32 0), !dbg !376
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6) #13, !dbg !376
    #dbg_value(i64 4, !255, !DIExpression(), !296)
    #dbg_value(double poison, !290, !DIExpression(), !296)
    #dbg_value(double poison, !291, !DIExpression(), !296)
  %140 = sitofp i64 %138 to double, !dbg !380
    #dbg_value(double %140, !292, !DIExpression(), !296)
    #dbg_value(double poison, !293, !DIExpression(), !296)
    #dbg_value(double poison, !294, !DIExpression(), !296)
  %141 = uitofp nneg i64 %33 to double, !dbg !381
  %142 = load <2 x i64>, ptr %135, align 8, !dbg !373, !tbaa !369
  %143 = add nsw <2 x i64> %142, %125, !dbg !378
  %144 = load <2 x i64>, ptr %139, align 8, !dbg !375, !tbaa !369
  %145 = add nsw <2 x i64> %144, %127, !dbg !379
  call void @free(ptr noundef nonnull %36) #13, !dbg !382
  %146 = sitofp <2 x i64> %143 to <2 x double>, !dbg !383
  %147 = sitofp <2 x i64> %145 to <2 x double>, !dbg !384
  %148 = shufflevector <2 x double> %147, <2 x double> poison, <2 x i32> <i32 1, i32 0>, !dbg !384
    #dbg_value(double %160, !286, !DIExpression(), !296)
    #dbg_value(double %164, !285, !DIExpression(), !296)
    #dbg_value(double %165, !287, !DIExpression(), !296)
    #dbg_value(double %166, !288, !DIExpression(), !296)
  %149 = fneg <2 x double> %146, !dbg !385
  %150 = extractelement <2 x double> %146, i64 0, !dbg !386
  %151 = fmul <2 x double> %149, %146, !dbg !386
  %152 = extractelement <2 x double> %151, i64 0, !dbg !386
  %153 = call double @llvm.fmuladd.f64(double %141, double %140, double %152), !dbg !386
  %154 = shufflevector <2 x double> %146, <2 x double> poison, <2 x i32> <i32 1, i32 1>, !dbg !385
  %155 = fmul <2 x double> %154, %149, !dbg !385
  %156 = insertelement <2 x double> poison, double %141, i64 0, !dbg !385
  %157 = shufflevector <2 x double> %156, <2 x double> poison, <2 x i32> zeroinitializer, !dbg !385
  %158 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %157, <2 x double> %148, <2 x double> %155), !dbg !385
  %159 = extractelement <2 x double> %158, i64 0, !dbg !387
  %160 = fdiv double %159, %153, !dbg !387
  %161 = fneg double %160, !dbg !388
  %162 = extractelement <2 x double> %146, i64 1, !dbg !389
  %163 = call double @llvm.fmuladd.f64(double %161, double %150, double %162), !dbg !388
  %164 = fdiv double %163, %141, !dbg !390
  %165 = fdiv double %150, %141, !dbg !391
  %166 = fdiv double %162, %141, !dbg !389
  %167 = insertelement <2 x double> %158, double %153, i64 1, !dbg !392
  %168 = fmul <2 x double> %158, %167, !dbg !392
  %169 = extractelement <2 x double> %168, i64 0, !dbg !393
  %170 = extractelement <2 x double> %168, i64 1, !dbg !393
  %171 = fdiv double %169, %170, !dbg !393
    #dbg_value(double %171, !289, !DIExpression(), !296)
  %172 = call i32 @puts(ptr nonnull dereferenceable(1) @str.23), !dbg !394
  %173 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.10, double noundef %164), !dbg !395
  %174 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, double noundef %160), !dbg !396
  %175 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, double noundef %165), !dbg !397
  %176 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.13, double noundef %166), !dbg !398
  %177 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, double noundef %171), !dbg !399
  %178 = extractelement <2 x i64> %143, i64 0, !dbg !400
  %179 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.15, i64 noundef %178), !dbg !400
  %180 = extractelement <2 x i64> %143, i64 1, !dbg !401
  %181 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.16, i64 noundef %180), !dbg !401
  %182 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.17, i64 noundef %138), !dbg !402
  %183 = extractelement <2 x i64> %145, i64 0, !dbg !403
  %184 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.18, i64 noundef %183), !dbg !403
  %185 = extractelement <2 x i64> %145, i64 1, !dbg !404
  %186 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.19, i64 noundef %185), !dbg !404
  %187 = call i32 @pthread_attr_destroy(ptr noundef nonnull %4) #13, !dbg !405
  %188 = icmp slt i32 %187, 0, !dbg !405
  br i1 %188, label %189, label %190, !dbg !407

189:                                              ; preds = %134
  call void @perror(ptr noundef nonnull @.str.20) #15, !dbg !408
  call void @exit(i32 noundef 1) #14, !dbg !408
  unreachable, !dbg !408

190:                                              ; preds = %134
  %191 = call i32 @munmap(ptr noundef nonnull %25, i64 noundef %24) #13, !dbg !410
  %192 = icmp slt i32 %191, 0, !dbg !410
  br i1 %192, label %193, label %194, !dbg !412

193:                                              ; preds = %190
  call void @perror(ptr noundef nonnull @.str.21) #15, !dbg !413
  call void @exit(i32 noundef 1) #14, !dbg !413
  unreachable, !dbg !413

194:                                              ; preds = %190
  %195 = call i32 @close(i32 noundef %14) #13, !dbg !415
  %196 = icmp slt i32 %195, 0, !dbg !415
  br i1 %196, label %197, label %198, !dbg !417

197:                                              ; preds = %194
  call void @perror(ptr noundef nonnull @.str.22) #15, !dbg !418
  call void @exit(i32 noundef 1) #14, !dbg !418
  unreachable, !dbg !418

198:                                              ; preds = %194
  call void @llvm.lifetime.end.p0(i64 512, ptr nonnull %5) #13, !dbg !420
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %4) #13, !dbg !420
  call void @llvm.lifetime.end.p0(i64 144, ptr nonnull %3) #13, !dbg !420
  ret i32 0, !dbg !421
}

; Function Attrs: nofree nounwind
declare !dbg !422 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare !dbg !429 void @exit(i32 noundef) local_unnamed_addr #4

; Function Attrs: nofree
declare !dbg !433 noundef i32 @open(ptr nocapture noundef readonly, i32 noundef, ...) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare !dbg !437 void @perror(ptr nocapture noundef readonly) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare !dbg !440 noundef i32 @fstat(i32 noundef, ptr nocapture noundef) local_unnamed_addr #3

; Function Attrs: nounwind
declare !dbg !445 ptr @mmap(ptr noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !451 i32 @pthread_attr_init(ptr noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !455 i32 @pthread_attr_setscope(ptr noundef, i32 noundef) local_unnamed_addr #6

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #7

; Function Attrs: nounwind
declare !dbg !458 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #6

declare !dbg !468 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #8

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare !dbg !471 void @free(ptr allocptr nocapture noundef) local_unnamed_addr #9

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #10

; Function Attrs: nounwind
declare !dbg !474 i32 @pthread_attr_destroy(ptr noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !475 i32 @munmap(ptr noundef, i64 noundef) local_unnamed_addr #6

declare !dbg !478 i32 @close(i32 noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #11

; Function Attrs: nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @llvm.fmuladd.v2f64(<2 x double>, <2 x double>, <2 x double>) #10

declare void @__record_field_access(i32)

declare void @__record_field_access_full(i32, ptr, i32)

attributes #0 = { nofree norecurse nosync nounwind memory(read, argmem: readwrite, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #8 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #11 = { nofree nounwind }
attributes #12 = { nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" }
attributes #13 = { nounwind }
attributes #14 = { noreturn nounwind }
attributes #15 = { cold }

!llvm.dbg.cu = !{!83}
!llvm.module.flags = !{!130, !131, !132, !133, !134, !135, !136}
!llvm.ident = !{!137}
!fieldanalysis.instrumented = !{}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 117, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "linear_regression_pthread.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/linear_regression", checksumkind: CSK_MD5, checksum: "ff44cb1a199948fe8a4a3259e175ea49")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 176, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 22)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 125, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 472, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 59)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 127, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 384, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 48)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !2, line: 129, type: !19, isLocal: true, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 920, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 115)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(scope: null, file: !2, line: 133, type: !24, isLocal: true, isDefinition: true)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 264, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 33)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(scope: null, file: !2, line: 160, type: !29, isLocal: true, isDefinition: true)
!29 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 896, elements: !30)
!30 = !{!31}
!31 = !DISubrange(count: 112)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(scope: null, file: !2, line: 170, type: !34, isLocal: true, isDefinition: true)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 696, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 87)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(scope: null, file: !2, line: 171, type: !39, isLocal: true, isDefinition: true)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 312, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 39)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(scope: null, file: !2, line: 196, type: !44, isLocal: true, isDefinition: true)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 104, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 13)
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(scope: null, file: !2, line: 197, type: !44, isLocal: true, isDefinition: true)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression())
!50 = distinct !DIGlobalVariable(scope: null, file: !2, line: 198, type: !44, isLocal: true, isDefinition: true)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(scope: null, file: !2, line: 199, type: !44, isLocal: true, isDefinition: true)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(scope: null, file: !2, line: 200, type: !44, isLocal: true, isDefinition: true)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression())
!56 = distinct !DIGlobalVariable(scope: null, file: !2, line: 201, type: !57, isLocal: true, isDefinition: true)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 112, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 14)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(scope: null, file: !2, line: 202, type: !57, isLocal: true, isDefinition: true)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(scope: null, file: !2, line: 203, type: !57, isLocal: true, isDefinition: true)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(scope: null, file: !2, line: 204, type: !57, isLocal: true, isDefinition: true)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(scope: null, file: !2, line: 205, type: !57, isLocal: true, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(scope: null, file: !2, line: 207, type: !70, isLocal: true, isDefinition: true)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 464, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 58)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(scope: null, file: !2, line: 208, type: !75, isLocal: true, isDefinition: true)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 504, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 63)
!78 = !DIGlobalVariableExpression(var: !79, expr: !DIExpression())
!79 = distinct !DIGlobalVariable(scope: null, file: !2, line: 209, type: !80, isLocal: true, isDefinition: true)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 40)
!83 = distinct !DICompileUnit(language: DW_LANG_C11, file: !84, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !85, retainedTypes: !92, globals: !119, splitDebugInlining: false, nameTableKind: None)
!84 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/linear_regression/linear_regression_pthread.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/linear_regression", checksumkind: CSK_MD5, checksum: "ff44cb1a199948fe8a4a3259e175ea49")
!85 = !{!86}
!86 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !87, line: 134, baseType: !88, size: 32, elements: !89)
!87 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!88 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!89 = !{!90, !91}
!90 = !DIEnumerator(name: "PTHREAD_SCOPE_SYSTEM", value: 0)
!91 = !DIEnumerator(name: "PTHREAD_SCOPE_PROCESS", value: 1)
!92 = !{!93, !116, !102, !111, !117, !118}
!93 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !94, size: 64)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "lreg_args", file: !2, line: 59, baseType: !95)
!95 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2, line: 48, size: 512, elements: !96)
!96 = !{!97, !101, !108, !110, !112, !113, !114, !115}
!97 = !DIDerivedType(tag: DW_TAG_member, name: "tid", scope: !95, file: !2, line: 50, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !99, line: 27, baseType: !100)
!99 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!100 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "points", scope: !95, file: !2, line: 51, baseType: !102, size: 64, offset: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "POINT_T", file: !2, line: 46, baseType: !104)
!104 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2, line: 43, size: 16, elements: !105)
!105 = !{!106, !107}
!106 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !104, file: !2, line: 44, baseType: !4, size: 8)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !104, file: !2, line: 45, baseType: !4, size: 8, offset: 8)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "num_elems", scope: !95, file: !2, line: 52, baseType: !109, size: 32, offset: 128)
!109 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "SX", scope: !95, file: !2, line: 53, baseType: !111, size: 64, offset: 192)
!111 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "SY", scope: !95, file: !2, line: 54, baseType: !111, size: 64, offset: 256)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "SXX", scope: !95, file: !2, line: 55, baseType: !111, size: 64, offset: 320)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "SYY", scope: !95, file: !2, line: 56, baseType: !111, size: 64, offset: 384)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "SXY", scope: !95, file: !2, line: 57, baseType: !111, size: 64, offset: 448)
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!118 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!119 = !{!0, !7, !12, !17, !22, !120, !27, !32, !37, !125, !42, !47, !49, !51, !53, !55, !60, !62, !64, !66, !68, !73, !78}
!120 = !DIGlobalVariableExpression(var: !121, expr: !DIExpression())
!121 = distinct !DIGlobalVariable(scope: null, file: !2, line: 140, type: !122, isLocal: true, isDefinition: true)
!122 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !123)
!123 = !{!124}
!124 = !DISubrange(count: 41)
!125 = !DIGlobalVariableExpression(var: !126, expr: !DIExpression())
!126 = distinct !DIGlobalVariable(scope: null, file: !2, line: 195, type: !127, isLocal: true, isDefinition: true)
!127 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 304, elements: !128)
!128 = !{!129}
!129 = !DISubrange(count: 38)
!130 = !{i32 7, !"Dwarf Version", i32 5}
!131 = !{i32 2, !"Debug Info Version", i32 3}
!132 = !{i32 1, !"wchar_size", i32 4}
!133 = !{i32 8, !"PIC Level", i32 2}
!134 = !{i32 7, !"PIE Level", i32 2}
!135 = !{i32 7, !"uwtable", i32 2}
!136 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!137 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!138 = distinct !DISubprogram(name: "linear_regression_pthread", scope: !2, file: !2, line: 64, type: !139, scopeLine: 65, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !83, retainedNodes: !141)
!139 = !DISubroutineType(types: !140)
!140 = !{!116, !116}
!141 = !{!142, !143, !144, !145}
!142 = !DILocalVariable(name: "args_in", arg: 1, scope: !138, file: !2, line: 64, type: !116)
!143 = !DILocalVariable(name: "args", scope: !138, file: !2, line: 66, type: !93)
!144 = !DILocalVariable(name: "i", scope: !138, file: !2, line: 67, type: !109)
!145 = !DILocalVariable(name: "j", scope: !138, file: !2, line: 67, type: !109)
!146 = !DILocation(line: 0, scope: !138)
!147 = !DILocation(line: 69, column: 10, scope: !138)
!148 = !DILocation(line: 70, column: 10, scope: !138)
!149 = !DILocation(line: 71, column: 10, scope: !138)
!150 = !DILocation(line: 72, column: 10, scope: !138)
!151 = !DILocation(line: 73, column: 10, scope: !138)
!152 = !DILocation(line: 70, column: 14, scope: !138)
!153 = !{!154, !159, i64 16}
!154 = !{!"", !155, i64 0, !158, i64 8, !159, i64 16, !160, i64 24, !160, i64 32, !160, i64 40, !160, i64 48, !160, i64 56}
!155 = !{!"long", !156, i64 0}
!156 = !{!"omnipotent char", !157, i64 0}
!157 = !{!"Simple C/C++ TBAA"}
!158 = !{!"any pointer", !156, i64 0}
!159 = !{!"int", !156, i64 0}
!160 = !{!"long long", !156, i64 0}
!161 = !DILocation(line: 80, column: 4, scope: !162)
!162 = distinct !DILexicalBlock(scope: !138, file: !2, line: 80, column: 4)
!163 = !DILocation(line: 81, column: 4, scope: !164)
!164 = distinct !DILexicalBlock(scope: !165, file: !2, line: 81, column: 4)
!165 = distinct !DILexicalBlock(scope: !166, file: !2, line: 80, column: 25)
!166 = distinct !DILexicalBlock(scope: !162, file: !2, line: 80, column: 4)
!167 = !{!154, !158, i64 8}
!168 = !DILocation(line: 87, column: 20, scope: !169)
!169 = distinct !DILexicalBlock(scope: !170, file: !2, line: 82, column: 4)
!170 = distinct !DILexicalBlock(scope: !164, file: !2, line: 81, column: 4)
!171 = !DILocation(line: 87, column: 36, scope: !169)
!172 = !{!173, !156, i64 0}
!173 = !{!"", !156, i64 0, !156, i64 1}
!174 = !DILocation(line: 87, column: 17, scope: !169)
!175 = !DILocation(line: 88, column: 20, scope: !169)
!176 = !DILocation(line: 88, column: 37, scope: !169)
!177 = !DILocation(line: 88, column: 17, scope: !169)
!178 = !DILocation(line: 89, column: 36, scope: !169)
!179 = !{!173, !156, i64 1}
!180 = !DILocation(line: 89, column: 20, scope: !169)
!181 = !DILocation(line: 89, column: 17, scope: !169)
!182 = !DILocation(line: 90, column: 20, scope: !169)
!183 = !DILocation(line: 90, column: 37, scope: !169)
!184 = !DILocation(line: 90, column: 17, scope: !169)
!185 = !DILocation(line: 91, column: 37, scope: !169)
!186 = !DILocation(line: 91, column: 17, scope: !169)
!187 = !DILocation(line: 81, column: 38, scope: !170)
!188 = distinct !{!188, !163, !189, !190}
!189 = !DILocation(line: 92, column: 4, scope: !164)
!190 = !{!"llvm.loop.mustprogress"}
!191 = !{!154, !160, i64 24}
!192 = !{!154, !160, i64 40}
!193 = !{!154, !160, i64 32}
!194 = !{!154, !160, i64 48}
!195 = !{!154, !160, i64 56}
!196 = !DILocation(line: 80, column: 22, scope: !166)
!197 = !DILocation(line: 80, column: 15, scope: !166)
!198 = distinct !{!198, !161, !199, !190}
!199 = !DILocation(line: 93, column: 4, scope: !162)
!200 = !DILocation(line: 95, column: 4, scope: !138)
!201 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 99, type: !202, scopeLine: 100, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !83, retainedNodes: !206)
!202 = !DISubroutineType(types: !203)
!203 = !{!109, !109, !204}
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64)
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!206 = !{!207, !208, !209, !210, !211, !212, !252, !253, !254, !255, !256, !265, !266, !267, !268, !272, !276, !277, !278, !279, !280, !281, !285, !286, !287, !288, !289, !290, !291, !292, !293, !294}
!207 = !DILocalVariable(name: "argc", arg: 1, scope: !201, file: !2, line: 99, type: !109)
!208 = !DILocalVariable(name: "argv", arg: 2, scope: !201, file: !2, line: 99, type: !204)
!209 = !DILocalVariable(name: "fd", scope: !201, file: !2, line: 101, type: !109)
!210 = !DILocalVariable(name: "fdata", scope: !201, file: !2, line: 102, type: !205)
!211 = !DILocalVariable(name: "fname", scope: !201, file: !2, line: 103, type: !205)
!212 = !DILocalVariable(name: "finfo", scope: !201, file: !2, line: 104, type: !213)
!213 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !214, line: 26, size: 1152, elements: !215)
!214 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_stat.h", directory: "", checksumkind: CSK_MD5, checksum: "3ba283bc334370fe631cbc82f5229ed7")
!215 = !{!216, !219, !221, !223, !225, !227, !229, !230, !231, !234, !236, !238, !246, !247, !248}
!216 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !213, file: !214, line: 31, baseType: !217, size: 64)
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !218, line: 145, baseType: !100)
!218 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!219 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !213, file: !214, line: 36, baseType: !220, size: 64, offset: 64)
!220 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !218, line: 148, baseType: !100)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !213, file: !214, line: 44, baseType: !222, size: 64, offset: 128)
!222 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !218, line: 151, baseType: !100)
!223 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !213, file: !214, line: 45, baseType: !224, size: 32, offset: 192)
!224 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !218, line: 150, baseType: !88)
!225 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !213, file: !214, line: 47, baseType: !226, size: 32, offset: 224)
!226 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !218, line: 146, baseType: !88)
!227 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !213, file: !214, line: 48, baseType: !228, size: 32, offset: 256)
!228 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !218, line: 147, baseType: !88)
!229 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !213, file: !214, line: 50, baseType: !109, size: 32, offset: 288)
!230 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !213, file: !214, line: 52, baseType: !217, size: 64, offset: 320)
!231 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !213, file: !214, line: 57, baseType: !232, size: 64, offset: 384)
!232 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !218, line: 152, baseType: !233)
!233 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!234 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !213, file: !214, line: 61, baseType: !235, size: 64, offset: 448)
!235 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !218, line: 175, baseType: !233)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !213, file: !214, line: 63, baseType: !237, size: 64, offset: 512)
!237 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !218, line: 180, baseType: !233)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !213, file: !214, line: 74, baseType: !239, size: 128, offset: 576)
!239 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !240, line: 11, size: 128, elements: !241)
!240 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!241 = !{!242, !244}
!242 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !239, file: !240, line: 16, baseType: !243, size: 64)
!243 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !218, line: 160, baseType: !233)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !239, file: !240, line: 21, baseType: !245, size: 64, offset: 64)
!245 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !218, line: 197, baseType: !233)
!246 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !213, file: !214, line: 75, baseType: !239, size: 128, offset: 704)
!247 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !213, file: !214, line: 76, baseType: !239, size: 128, offset: 832)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !213, file: !214, line: 89, baseType: !249, size: 192, offset: 960)
!249 = !DICompositeType(tag: DW_TAG_array_type, baseType: !245, size: 192, elements: !250)
!250 = !{!251}
!251 = !DISubrange(count: 3)
!252 = !DILocalVariable(name: "req_units", scope: !201, file: !2, line: 106, type: !109)
!253 = !DILocalVariable(name: "num_threads", scope: !201, file: !2, line: 106, type: !109)
!254 = !DILocalVariable(name: "num_procs", scope: !201, file: !2, line: 106, type: !109)
!255 = !DILocalVariable(name: "i", scope: !201, file: !2, line: 106, type: !109)
!256 = !DILocalVariable(name: "attr", scope: !201, file: !2, line: 110, type: !257)
!257 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !99, line: 62, baseType: !258)
!258 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pthread_attr_t", file: !99, line: 56, size: 448, elements: !259)
!259 = !{!260, !264}
!260 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !258, file: !99, line: 58, baseType: !261, size: 448)
!261 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 448, elements: !262)
!262 = !{!263}
!263 = !DISubrange(count: 56)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !258, file: !99, line: 59, baseType: !233, size: 64)
!265 = !DILocalVariable(name: "tid_args", scope: !201, file: !2, line: 111, type: !93)
!266 = !DILocalVariable(name: "points", scope: !201, file: !2, line: 143, type: !102)
!267 = !DILocalVariable(name: "n", scope: !201, file: !2, line: 144, type: !111)
!268 = !DILocalVariable(name: "tmps", scope: !201, file: !2, line: 151, type: !269)
!269 = !DICompositeType(tag: DW_TAG_array_type, baseType: !98, size: 4096, elements: !270)
!270 = !{!271}
!271 = !DISubrange(count: 64)
!272 = !DILocalVariable(name: "tmp_req_units", scope: !273, file: !2, line: 155, type: !109)
!273 = distinct !DILexicalBlock(scope: !274, file: !2, line: 153, column: 4)
!274 = distinct !DILexicalBlock(scope: !275, file: !2, line: 152, column: 4)
!275 = distinct !DILexicalBlock(scope: !201, file: !2, line: 152, column: 4)
!276 = !DILocalVariable(name: "SX_ll", scope: !201, file: !2, line: 164, type: !111)
!277 = !DILocalVariable(name: "SY_ll", scope: !201, file: !2, line: 164, type: !111)
!278 = !DILocalVariable(name: "SXX_ll", scope: !201, file: !2, line: 164, type: !111)
!279 = !DILocalVariable(name: "SYY_ll", scope: !201, file: !2, line: 164, type: !111)
!280 = !DILocalVariable(name: "SXY_ll", scope: !201, file: !2, line: 164, type: !111)
!281 = !DILocalVariable(name: "ret_val", scope: !282, file: !2, line: 169, type: !111)
!282 = distinct !DILexicalBlock(scope: !283, file: !2, line: 168, column: 4)
!283 = distinct !DILexicalBlock(scope: !284, file: !2, line: 167, column: 4)
!284 = distinct !DILexicalBlock(scope: !201, file: !2, line: 167, column: 4)
!285 = !DILocalVariable(name: "a", scope: !201, file: !2, line: 182, type: !118)
!286 = !DILocalVariable(name: "b", scope: !201, file: !2, line: 182, type: !118)
!287 = !DILocalVariable(name: "xbar", scope: !201, file: !2, line: 182, type: !118)
!288 = !DILocalVariable(name: "ybar", scope: !201, file: !2, line: 182, type: !118)
!289 = !DILocalVariable(name: "r2", scope: !201, file: !2, line: 182, type: !118)
!290 = !DILocalVariable(name: "SX", scope: !201, file: !2, line: 183, type: !118)
!291 = !DILocalVariable(name: "SY", scope: !201, file: !2, line: 184, type: !118)
!292 = !DILocalVariable(name: "SXX", scope: !201, file: !2, line: 185, type: !118)
!293 = !DILocalVariable(name: "SYY", scope: !201, file: !2, line: 186, type: !118)
!294 = !DILocalVariable(name: "SXY", scope: !201, file: !2, line: 187, type: !118)
!295 = distinct !DIAssignID()
!296 = !DILocation(line: 0, scope: !201)
!297 = distinct !DIAssignID()
!298 = distinct !DIAssignID()
!299 = distinct !DIAssignID()
!300 = !DILocation(line: 0, scope: !282)
!301 = !DILocation(line: 104, column: 4, scope: !201)
!302 = !DILocation(line: 110, column: 4, scope: !201)
!303 = !DILocation(line: 115, column: 8, scope: !304)
!304 = distinct !DILexicalBlock(scope: !201, file: !2, line: 115, column: 8)
!305 = !{!158, !158, i64 0}
!306 = !DILocation(line: 115, column: 16, scope: !304)
!307 = !DILocation(line: 115, column: 8, scope: !201)
!308 = !DILocation(line: 117, column: 40, scope: !309)
!309 = distinct !DILexicalBlock(scope: !304, file: !2, line: 116, column: 4)
!310 = !DILocation(line: 117, column: 7, scope: !309)
!311 = !DILocation(line: 118, column: 7, scope: !309)
!312 = !DILocation(line: 125, column: 4, scope: !313)
!313 = distinct !DILexicalBlock(scope: !201, file: !2, line: 125, column: 4)
!314 = !DILocation(line: 125, column: 4, scope: !201)
!315 = !DILocation(line: 125, column: 4, scope: !316)
!316 = distinct !DILexicalBlock(scope: !313, file: !2, line: 125, column: 4)
!317 = !DILocation(line: 127, column: 4, scope: !318)
!318 = distinct !DILexicalBlock(scope: !201, file: !2, line: 127, column: 4)
!319 = !DILocation(line: 127, column: 4, scope: !201)
!320 = !DILocation(line: 127, column: 4, scope: !321)
!321 = distinct !DILexicalBlock(scope: !318, file: !2, line: 127, column: 4)
!322 = !DILocation(line: 129, column: 4, scope: !323)
!323 = distinct !DILexicalBlock(scope: !201, file: !2, line: 129, column: 4)
!324 = !{!325, !155, i64 48}
!325 = !{!"stat", !155, i64 0, !155, i64 8, !155, i64 16, !159, i64 24, !159, i64 28, !159, i64 32, !159, i64 36, !155, i64 40, !155, i64 48, !155, i64 56, !155, i64 64, !326, i64 72, !326, i64 88, !326, i64 104, !156, i64 120}
!326 = !{!"timespec", !155, i64 0, !155, i64 8}
!327 = !DILocation(line: 129, column: 4, scope: !201)
!328 = !DILocation(line: 129, column: 4, scope: !329)
!329 = distinct !DILexicalBlock(scope: !323, file: !2, line: 129, column: 4)
!330 = !DILocation(line: 133, column: 4, scope: !201)
!331 = !DILocation(line: 135, column: 4, scope: !201)
!332 = !DILocation(line: 136, column: 4, scope: !201)
!333 = !DILocation(line: 140, column: 4, scope: !201)
!334 = !DILocation(line: 144, column: 44, scope: !201)
!335 = !DILocation(line: 146, column: 18, scope: !201)
!336 = !DILocation(line: 146, column: 16, scope: !201)
!337 = !DILocation(line: 147, column: 28, scope: !201)
!338 = !DILocation(line: 151, column: 4, scope: !201)
!339 = !DILocation(line: 152, column: 4, scope: !275)
!340 = !DILocation(line: 154, column: 17, scope: !273)
!341 = !DILocation(line: 154, column: 24, scope: !273)
!342 = !DILocation(line: 0, scope: !273)
!343 = !DILocation(line: 157, column: 17, scope: !273)
!344 = !DILocation(line: 157, column: 27, scope: !273)
!345 = !DILocation(line: 158, column: 16, scope: !273)
!346 = !{!155, !155, i64 0}
!347 = !DILocation(line: 160, column: 5, scope: !348)
!348 = distinct !DILexicalBlock(scope: !273, file: !2, line: 160, column: 5)
!349 = !DILocation(line: 160, column: 5, scope: !273)
!350 = !DILocation(line: 160, column: 5, scope: !351)
!351 = distinct !DILexicalBlock(scope: !348, file: !2, line: 160, column: 5)
!352 = !DILocation(line: 161, column: 24, scope: !273)
!353 = !DILocation(line: 161, column: 22, scope: !273)
!354 = !{!154, !155, i64 0}
!355 = !DILocation(line: 154, column: 27, scope: !273)
!356 = !DILocation(line: 154, column: 5, scope: !273)
!357 = !DILocation(line: 158, column: 30, scope: !273)
!358 = !DILocation(line: 158, column: 8, scope: !273)
!359 = !DILocation(line: 154, column: 35, scope: !273)
!360 = !DILocation(line: 156, column: 12, scope: !273)
!361 = !DILocation(line: 169, column: 4, scope: !282)
!362 = !DILocation(line: 170, column: 4, scope: !363)
!363 = distinct !DILexicalBlock(scope: !282, file: !2, line: 170, column: 4)
!364 = !DILocation(line: 170, column: 4, scope: !282)
!365 = !DILocation(line: 170, column: 4, scope: !366)
!366 = distinct !DILexicalBlock(scope: !363, file: !2, line: 170, column: 4)
!367 = !DILocation(line: 171, column: 4, scope: !368)
!368 = distinct !DILexicalBlock(scope: !282, file: !2, line: 171, column: 4)
!369 = !{!160, !160, i64 0}
!370 = !DILocation(line: 171, column: 4, scope: !282)
!371 = !DILocation(line: 171, column: 4, scope: !372)
!372 = distinct !DILexicalBlock(scope: !368, file: !2, line: 171, column: 4)
!373 = !DILocation(line: 173, column: 28, scope: !282)
!374 = !DILocation(line: 175, column: 29, scope: !282)
!375 = !DILocation(line: 176, column: 29, scope: !282)
!376 = !DILocation(line: 178, column: 4, scope: !283)
!377 = !DILocation(line: 175, column: 14, scope: !282)
!378 = !DILocation(line: 173, column: 13, scope: !282)
!379 = !DILocation(line: 177, column: 14, scope: !282)
!380 = !DILocation(line: 185, column: 16, scope: !201)
!381 = !DILocation(line: 189, column: 17, scope: !201)
!382 = !DILocation(line: 180, column: 4, scope: !201)
!383 = !DILocation(line: 183, column: 16, scope: !201)
!384 = !DILocation(line: 187, column: 16, scope: !201)
!385 = !DILocation(line: 189, column: 23, scope: !201)
!386 = !DILocation(line: 189, column: 41, scope: !201)
!387 = !DILocation(line: 189, column: 32, scope: !201)
!388 = !DILocation(line: 190, column: 15, scope: !201)
!389 = !DILocation(line: 192, column: 25, scope: !201)
!390 = !DILocation(line: 190, column: 26, scope: !201)
!391 = !DILocation(line: 191, column: 25, scope: !201)
!392 = !DILocation(line: 193, column: 33, scope: !201)
!393 = !DILocation(line: 193, column: 51, scope: !201)
!394 = !DILocation(line: 195, column: 4, scope: !201)
!395 = !DILocation(line: 196, column: 4, scope: !201)
!396 = !DILocation(line: 197, column: 4, scope: !201)
!397 = !DILocation(line: 198, column: 4, scope: !201)
!398 = !DILocation(line: 199, column: 4, scope: !201)
!399 = !DILocation(line: 200, column: 4, scope: !201)
!400 = !DILocation(line: 201, column: 4, scope: !201)
!401 = !DILocation(line: 202, column: 4, scope: !201)
!402 = !DILocation(line: 203, column: 4, scope: !201)
!403 = !DILocation(line: 204, column: 4, scope: !201)
!404 = !DILocation(line: 205, column: 4, scope: !201)
!405 = !DILocation(line: 207, column: 4, scope: !406)
!406 = distinct !DILexicalBlock(scope: !201, file: !2, line: 207, column: 4)
!407 = !DILocation(line: 207, column: 4, scope: !201)
!408 = !DILocation(line: 207, column: 4, scope: !409)
!409 = distinct !DILexicalBlock(scope: !406, file: !2, line: 207, column: 4)
!410 = !DILocation(line: 208, column: 4, scope: !411)
!411 = distinct !DILexicalBlock(scope: !201, file: !2, line: 208, column: 4)
!412 = !DILocation(line: 208, column: 4, scope: !201)
!413 = !DILocation(line: 208, column: 4, scope: !414)
!414 = distinct !DILexicalBlock(scope: !411, file: !2, line: 208, column: 4)
!415 = !DILocation(line: 209, column: 4, scope: !416)
!416 = distinct !DILexicalBlock(scope: !201, file: !2, line: 209, column: 4)
!417 = !DILocation(line: 209, column: 4, scope: !201)
!418 = !DILocation(line: 209, column: 4, scope: !419)
!419 = distinct !DILexicalBlock(scope: !416, file: !2, line: 209, column: 4)
!420 = !DILocation(line: 211, column: 1, scope: !201)
!421 = !DILocation(line: 210, column: 4, scope: !201)
!422 = !DISubprogram(name: "printf", scope: !423, file: !423, line: 356, type: !424, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!423 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!424 = !DISubroutineType(types: !425)
!425 = !{!109, !426, null}
!426 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !427)
!427 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !428, size: 64)
!428 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!429 = !DISubprogram(name: "exit", scope: !430, file: !430, line: 624, type: !431, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!430 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!431 = !DISubroutineType(types: !432)
!432 = !{null, !109}
!433 = !DISubprogram(name: "open", scope: !434, file: !434, line: 181, type: !435, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!434 = !DIFile(filename: "/usr/include/fcntl.h", directory: "", checksumkind: CSK_MD5, checksum: "1a9bb91818c37dc7bc291ca6e49fc221")
!435 = !DISubroutineType(types: !436)
!436 = !{!109, !427, !109, null}
!437 = !DISubprogram(name: "perror", scope: !423, file: !423, line: 804, type: !438, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!438 = !DISubroutineType(types: !439)
!439 = !{null, !427}
!440 = !DISubprogram(name: "fstat", scope: !441, file: !441, line: 210, type: !442, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!441 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/stat.h", directory: "", checksumkind: CSK_MD5, checksum: "1e5cd132abb12ea0c79aeae3bfa4573e")
!442 = !DISubroutineType(types: !443)
!443 = !{!109, !109, !444}
!444 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !213, size: 64)
!445 = !DISubprogram(name: "mmap", scope: !446, file: !446, line: 57, type: !447, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!446 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/mman.h", directory: "", checksumkind: CSK_MD5, checksum: "93a87cc3b0558893646eb0c257165272")
!447 = !DISubroutineType(types: !448)
!448 = !{!116, !116, !449, !109, !109, !109, !232}
!449 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !450, line: 18, baseType: !100)
!450 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!451 = !DISubprogram(name: "pthread_attr_init", scope: !87, file: !87, line: 285, type: !452, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!452 = !DISubroutineType(types: !453)
!453 = !{!109, !454}
!454 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !257, size: 64)
!455 = !DISubprogram(name: "pthread_attr_setscope", scope: !87, file: !87, line: 349, type: !456, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!456 = !DISubroutineType(types: !457)
!457 = !{!109, !454, !109}
!458 = !DISubprogram(name: "pthread_create", scope: !87, file: !87, line: 202, type: !459, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!459 = !DISubroutineType(types: !460)
!460 = !{!109, !461, !463, !466, !467}
!461 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !462)
!462 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 64)
!463 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !464)
!464 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !465, size: 64)
!465 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !257)
!466 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!467 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !116)
!468 = !DISubprogram(name: "pthread_join", scope: !87, file: !87, line: 219, type: !469, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!469 = !DISubroutineType(types: !470)
!470 = !{!109, !98, !117}
!471 = !DISubprogram(name: "free", scope: !430, file: !430, line: 555, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!472 = !DISubroutineType(types: !473)
!473 = !{null, !116}
!474 = !DISubprogram(name: "pthread_attr_destroy", scope: !87, file: !87, line: 288, type: !452, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!475 = !DISubprogram(name: "munmap", scope: !446, file: !446, line: 76, type: !476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!476 = !DISubroutineType(types: !477)
!477 = !{!109, !116, !449}
!478 = !DISubprogram(name: "close", scope: !479, file: !479, line: 358, type: !480, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!479 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "ed37c2e6f30ba31a8b41e4d70547c39c")
!480 = !DISubroutineType(types: !481)
!481 = !{!109, !109}
