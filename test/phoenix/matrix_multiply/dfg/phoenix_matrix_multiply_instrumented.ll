; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/matrix_multiply/dfg/phoenix_matrix_multiply.ll'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/matrix_multiply/matrix_mult_serial.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [8 x i8] c"data_in\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [117 x i8] c"/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/matrix_multiply/matrix_mult_serial.c\00", align 1, !dbg !7
@__PRETTY_FUNCTION__.matrix_mult = private unnamed_addr constant [30 x i8] c"void matrix_mult(mm_data_t *)\00", align 1, !dbg !12
@.str.2 = private unnamed_addr constant [28 x i8] c"USAGE: %s [side of matrix]\0A\00", align 1, !dbg !18
@.str.3 = private unnamed_addr constant [18 x i8] c"matrix_file_A.txt\00", align 1, !dbg !23
@.str.4 = private unnamed_addr constant [18 x i8] c"matrix_file_B.txt\00", align 1, !dbg !28
@.str.5 = private unnamed_addr constant [27 x i8] c"matrix_file_out_serial.txt\00", align 1, !dbg !30
@.str.6 = private unnamed_addr constant [59 x i8] c"Error at line\0A\09(matrix_len = atoi(argv[1])) < 0\0ASystem Msg\00", align 1, !dbg !35
@.str.7 = private unnamed_addr constant [39 x i8] c"MatrixMult: Side of the matrix is %d \0A\00", align 1, !dbg !40
@.str.9 = private unnamed_addr constant [62 x i8] c"Error at line\0A\09(fd_A = open(fname_A,O_RDONLY)) < 0\0ASystem Msg\00", align 1, !dbg !45
@.str.10 = private unnamed_addr constant [52 x i8] c"Error at line\0A\09fstat(fd_A, &finfo_A) < 0\0ASystem Msg\00", align 1, !dbg !50
@.str.11 = private unnamed_addr constant [114 x i8] c"Error at line\0A\09(fdata_A= mmap(0, file_size + 1, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd_A, 0)) == NULL\0ASystem Msg\00", align 1, !dbg !55
@.str.12 = private unnamed_addr constant [62 x i8] c"Error at line\0A\09(fd_B = open(fname_B,O_RDONLY)) < 0\0ASystem Msg\00", align 1, !dbg !60
@.str.13 = private unnamed_addr constant [52 x i8] c"Error at line\0A\09fstat(fd_B, &finfo_B) < 0\0ASystem Msg\00", align 1, !dbg !62
@.str.14 = private unnamed_addr constant [114 x i8] c"Error at line\0A\09(fdata_B= mmap(0, file_size + 1, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd_B, 0)) == NULL\0ASystem Msg\00", align 1, !dbg !64
@.str.15 = private unnamed_addr constant [82 x i8] c"Error at line\0A\09(fd_out = open(fname_out,O_CREAT | O_RDWR,S_IRWXU)) < 0\0ASystem Msg\00", align 1, !dbg !66
@.str.16 = private unnamed_addr constant [59 x i8] c"Error at line\0A\09ftruncate(fd_out, file_size) < 0\0ASystem Msg\00", align 1, !dbg !71
@.str.17 = private unnamed_addr constant [118 x i8] c"Error at line\0A\09(fdata_out= mmap(0, file_size + 1, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd_out, 0)) == NULL\0ASystem Msg\00", align 1, !dbg !73
@.str.19 = private unnamed_addr constant [61 x i8] c"Error at line\0A\09munmap(fdata_A, file_size + 1) < 0\0ASystem Msg\00", align 1, !dbg !78
@.str.20 = private unnamed_addr constant [42 x i8] c"Error at line\0A\09close(fd_A) < 0\0ASystem Msg\00", align 1, !dbg !83
@.str.21 = private unnamed_addr constant [61 x i8] c"Error at line\0A\09munmap(fdata_B, file_size + 1) < 0\0ASystem Msg\00", align 1, !dbg !88
@.str.22 = private unnamed_addr constant [42 x i8] c"Error at line\0A\09close(fd_B) < 0\0ASystem Msg\00", align 1, !dbg !90
@.str.23 = private unnamed_addr constant [44 x i8] c"Error at line\0A\09close(fd_out) < 0\0ASystem Msg\00", align 1, !dbg !92
@str = private unnamed_addr constant [23 x i8] c"MatrixMult: Running...\00", align 1
@str.24 = private unnamed_addr constant [49 x i8] c"MatrixMult: Calling Serial Matrix Multiplication\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @matrix_mult(ptr noundef readonly %0) local_unnamed_addr #0 !dbg !125 {
    #dbg_value(ptr %0, !137, !DIExpression(), !147)
  %2 = icmp eq ptr %0, null, !dbg !148
  br i1 %2, label %7, label %3, !dbg !151

3:                                                ; preds = %1
    #dbg_value(i32 poison, !138, !DIExpression(), !147)
    #dbg_value(i32 poison, !138, !DIExpression(), !147)
  %4 = getelementptr inbounds i8, ptr %0, i64 24
    #dbg_value(i32 0, !138, !DIExpression(), !147)
  call void @__record_field_access_full(i32 0, ptr %4, i32 0), !dbg !152
  %5 = load i32, ptr %4, align 8, !dbg !152, !tbaa !155
  %6 = icmp sgt i32 %5, 0, !dbg !161
  br i1 %6, label %8, label %83, !dbg !162

7:                                                ; preds = %1
  tail call void @__assert_fail(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 56, ptr noundef nonnull @__PRETTY_FUNCTION__.matrix_mult) #10, !dbg !148
  unreachable, !dbg !148

8:                                                ; preds = %3
  %9 = getelementptr inbounds i8, ptr %0, i64 8
  call void @__record_field_access_full(i32 1, ptr %9, i32 0)
  %10 = getelementptr inbounds i8, ptr %0, i64 16
  call void @__record_field_access_full(i32 2, ptr %10, i32 0), !dbg !162
  br label %11, !dbg !162

11:                                               ; preds = %78, %8
  %12 = phi i32 [ %5, %8 ], [ %79, %78 ]
  %13 = phi i32 [ 100, %8 ], [ %82, %78 ]
  %14 = phi i32 [ 0, %8 ], [ %80, %78 ]
    #dbg_value(i32 %14, !138, !DIExpression(), !147)
    #dbg_value(i32 0, !139, !DIExpression(), !147)
  %15 = icmp sgt i32 %12, 0, !dbg !163
  br i1 %15, label %16, label %78, !dbg !166

16:                                               ; preds = %72, %11
  %17 = phi i32 [ %73, %72 ], [ %12, %11 ]
  %18 = phi i32 [ %74, %72 ], [ %12, %11 ]
  %19 = phi i32 [ %77, %72 ], [ 100, %11 ]
  %20 = phi i32 [ %75, %72 ], [ 0, %11 ]
    #dbg_value(i32 %20, !139, !DIExpression(), !147)
    #dbg_value(i32 0, !140, !DIExpression(), !147)
  %21 = icmp sgt i32 %18, 0, !dbg !167
  br i1 %21, label %22, label %72, !dbg !170

22:                                               ; preds = %68, %16
  %23 = phi i32 [ %71, %68 ], [ 100, %16 ]
  %24 = phi i32 [ %25, %68 ], [ 0, %16 ]
    #dbg_value(i32 %24, !140, !DIExpression(), !147)
    #dbg_value(i32 %14, !144, !DIExpression(DW_OP_plus_uconst, 100, DW_OP_stack_value), !147)
    #dbg_value(i32 %20, !145, !DIExpression(DW_OP_plus_uconst, 100, DW_OP_stack_value), !147)
  %25 = add nuw nsw i32 %24, 100, !dbg !171
    #dbg_value(i32 %25, !146, !DIExpression(), !147)
    #dbg_value(i32 %14, !141, !DIExpression(), !147)
  br label %26, !dbg !173

26:                                               ; preds = %63, %22
  %27 = phi i32 [ %14, %22 ], [ %64, %63 ]
    #dbg_value(i32 %27, !141, !DIExpression(), !147)
  %28 = load i32, ptr %4, align 8, !dbg !176, !tbaa !155
  %29 = icmp slt i32 %27, %28, !dbg !177
  br i1 %29, label %30, label %68, !dbg !178

30:                                               ; preds = %60, %26
  %31 = phi i32 [ %61, %60 ], [ %20, %26 ]
    #dbg_value(i32 %31, !142, !DIExpression(), !147)
  %32 = load i32, ptr %4, align 8, !dbg !179, !tbaa !155
  %33 = icmp slt i32 %31, %32, !dbg !182
  br i1 %33, label %34, label %63, !dbg !183

34:                                               ; preds = %38, %30
  %35 = phi i32 [ %58, %38 ], [ %24, %30 ]
    #dbg_value(i32 %35, !143, !DIExpression(), !147)
  %36 = load i32, ptr %4, align 8, !dbg !184, !tbaa !155
  %37 = icmp slt i32 %35, %36, !dbg !187
  br i1 %37, label %38, label %60, !dbg !188

38:                                               ; preds = %34
  call void @__record_field_access_full(i32 3, ptr %0, i32 0), !dbg !189
  %39 = load ptr, ptr %0, align 8, !dbg !189, !tbaa !191
  %40 = mul nsw i32 %36, %27, !dbg !192
  %41 = add nsw i32 %40, %35, !dbg !193
  %42 = sext i32 %41 to i64, !dbg !194
  %43 = getelementptr inbounds i32, ptr %39, i64 %42, !dbg !194
  call void @__record_field_access_full(i32 4, ptr %43, i32 0), !dbg !194
  %44 = load i32, ptr %43, align 4, !dbg !194, !tbaa !195
  %45 = load ptr, ptr %9, align 8, !dbg !196, !tbaa !197
  %46 = mul nsw i32 %36, %35, !dbg !198
  %47 = add nsw i32 %46, %31, !dbg !199
  %48 = sext i32 %47 to i64, !dbg !200
  %49 = getelementptr inbounds i32, ptr %45, i64 %48, !dbg !200
  call void @__record_field_access_full(i32 4, ptr %49, i32 0), !dbg !200
  %50 = load i32, ptr %49, align 4, !dbg !200, !tbaa !195
  %51 = mul nsw i32 %50, %44, !dbg !201
  %52 = load ptr, ptr %10, align 8, !dbg !202, !tbaa !203
  %53 = add nsw i32 %40, %31, !dbg !204
  %54 = sext i32 %53 to i64, !dbg !205
  %55 = getelementptr inbounds i32, ptr %52, i64 %54, !dbg !205
  call void @__record_field_access_full(i32 4, ptr %55, i32 1), !dbg !206
  %56 = load i32, ptr %55, align 4, !dbg !206, !tbaa !195
  %57 = add nsw i32 %56, %51, !dbg !206
  store i32 %57, ptr %55, align 4, !dbg !206, !tbaa !195
  %58 = add nuw nsw i32 %35, 1, !dbg !207
    #dbg_value(i32 %58, !143, !DIExpression(), !147)
  %59 = icmp eq i32 %58, %23, !dbg !208
  br i1 %59, label %60, label %34, !dbg !209, !llvm.loop !210

60:                                               ; preds = %38, %34
  %61 = add nuw nsw i32 %31, 1, !dbg !213
    #dbg_value(i32 %61, !142, !DIExpression(), !147)
  %62 = icmp eq i32 %61, %19, !dbg !214
  br i1 %62, label %63, label %30, !dbg !215, !llvm.loop !216

63:                                               ; preds = %60, %30
  %64 = add nuw nsw i32 %27, 1, !dbg !218
    #dbg_value(i32 %64, !141, !DIExpression(), !147)
  %65 = icmp eq i32 %64, %13, !dbg !219
  br i1 %65, label %66, label %26, !dbg !173, !llvm.loop !220

66:                                               ; preds = %63
  %67 = load i32, ptr %4, align 8, !dbg !222, !tbaa !155
  br label %68, !dbg !173

68:                                               ; preds = %66, %26
  %69 = phi i32 [ %67, %66 ], [ %28, %26 ], !dbg !222
    #dbg_value(i32 %25, !140, !DIExpression(), !147)
  %70 = icmp slt i32 %25, %69, !dbg !167
  %71 = add nuw i32 %23, 100, !dbg !170
  br i1 %70, label %22, label %72, !dbg !170, !llvm.loop !223

72:                                               ; preds = %68, %16
  %73 = phi i32 [ %17, %16 ], [ %69, %68 ]
  %74 = phi i32 [ %18, %16 ], [ %69, %68 ], !dbg !225
  %75 = add nuw nsw i32 %20, 100, !dbg !226
    #dbg_value(i32 %75, !139, !DIExpression(), !147)
  %76 = icmp slt i32 %75, %74, !dbg !163
  %77 = add nuw i32 %19, 100, !dbg !166
  br i1 %76, label %16, label %78, !dbg !166, !llvm.loop !227

78:                                               ; preds = %72, %11
  %79 = phi i32 [ %12, %11 ], [ %73, %72 ], !dbg !152
  %80 = add nuw nsw i32 %14, 100, !dbg !229
    #dbg_value(i32 %80, !138, !DIExpression(), !147)
  %81 = icmp slt i32 %80, %79, !dbg !161
  %82 = add nuw i32 %13, 100, !dbg !162
  br i1 %81, label %11, label %83, !dbg !162, !llvm.loop !230

83:                                               ; preds = %78, %3
  ret void, !dbg !232
}

; Function Attrs: noreturn nounwind
declare !dbg !233 void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #0 !dbg !238 {
  %3 = alloca %struct.stat, align 8, !DIAssignID !301
    #dbg_assign(i1 undef, !252, !DIExpression(), !301, ptr %3, !DIExpression(), !302)
  %4 = alloca %struct.stat, align 8, !DIAssignID !303
    #dbg_assign(i1 undef, !293, !DIExpression(), !303, ptr %4, !DIExpression(), !302)
    #dbg_value(i32 %0, !242, !DIExpression(), !302)
    #dbg_value(ptr %1, !243, !DIExpression(), !302)
  call void @llvm.lifetime.start.p0(i64 144, ptr nonnull %3) #11, !dbg !304
  call void @llvm.lifetime.start.p0(i64 144, ptr nonnull %4) #11, !dbg !304
  %5 = tail call i64 @time(ptr noundef null) #11, !dbg !305
  %6 = trunc i64 %5 to i32, !dbg !306
  tail call void @srand(i32 noundef %6) #11, !dbg !307
  %7 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !308
  call void @__record_field_access_full(i32 5, ptr %7, i32 0), !dbg !308
  %8 = load ptr, ptr %7, align 8, !dbg !308, !tbaa !310
  %9 = icmp eq ptr %8, null, !dbg !311
  br i1 %9, label %10, label %13, !dbg !312

10:                                               ; preds = %2
  call void @__record_field_access_full(i32 6, ptr %1, i32 0), !dbg !313
  %11 = load ptr, ptr %1, align 8, !dbg !313, !tbaa !310
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, ptr noundef %11), !dbg !315
  tail call void @exit(i32 noundef 1) #10, !dbg !316
  unreachable, !dbg !316

13:                                               ; preds = %2
    #dbg_value(ptr @.str.3, !294, !DIExpression(), !302)
    #dbg_value(ptr @.str.4, !295, !DIExpression(), !302)
    #dbg_value(ptr @.str.5, !296, !DIExpression(), !302)
    #dbg_value(ptr %8, !317, !DIExpression(), !323)
  %14 = tail call i64 @strtol(ptr nocapture noundef nonnull %8, ptr noundef null, i32 noundef 10) #11, !dbg !326
  %15 = trunc i64 %14 to i32, !dbg !327
    #dbg_value(i32 %15, !250, !DIExpression(), !302)
  %16 = icmp slt i32 %15, 0, !dbg !328
  br i1 %16, label %17, label %18, !dbg !329

17:                                               ; preds = %13
  tail call void @perror(ptr noundef nonnull @.str.6) #12, !dbg !330
  tail call void @exit(i32 noundef 1) #10, !dbg !330
  unreachable, !dbg !330

18:                                               ; preds = %13
  %19 = shl i32 %15, 2, !dbg !332
  %20 = mul i32 %19, %15, !dbg !333
    #dbg_value(i32 %20, !251, !DIExpression(), !302)
  %21 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef %15), !dbg !334
  %22 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !335
    #dbg_value(i32 0, !297, !DIExpression(), !302)
  %23 = tail call i32 (ptr, i32, ...) @open(ptr noundef nonnull @.str.3, i32 noundef 0) #11, !dbg !336
    #dbg_value(i32 %23, !244, !DIExpression(), !302)
  %24 = icmp slt i32 %23, 0, !dbg !336
  br i1 %24, label %25, label %26, !dbg !338

25:                                               ; preds = %18
  tail call void @perror(ptr noundef nonnull @.str.9) #12, !dbg !339
  tail call void @exit(i32 noundef 1) #10, !dbg !339
  unreachable, !dbg !339

26:                                               ; preds = %18
  %27 = call i32 @fstat(i32 noundef %23, ptr noundef nonnull %3) #11, !dbg !341
  %28 = icmp slt i32 %27, 0, !dbg !341
  br i1 %28, label %29, label %30, !dbg !343

29:                                               ; preds = %26
  tail call void @perror(ptr noundef nonnull @.str.10) #12, !dbg !344
  tail call void @exit(i32 noundef 1) #10, !dbg !344
  unreachable, !dbg !344

30:                                               ; preds = %26
  %31 = or disjoint i32 %20, 1, !dbg !346
  %32 = sext i32 %31 to i64, !dbg !346
  %33 = tail call ptr @mmap(ptr noundef null, i64 noundef %32, i32 noundef 3, i32 noundef 2, i32 noundef %23, i64 noundef 0) #11, !dbg !346
    #dbg_value(ptr %33, !247, !DIExpression(), !302)
  %34 = icmp eq ptr %33, null, !dbg !346
  br i1 %34, label %35, label %36, !dbg !348

35:                                               ; preds = %30
  tail call void @perror(ptr noundef nonnull @.str.11) #12, !dbg !349
  tail call void @exit(i32 noundef 1) #10, !dbg !349
  unreachable, !dbg !349

36:                                               ; preds = %30
  %37 = tail call i32 (ptr, i32, ...) @open(ptr noundef nonnull @.str.4, i32 noundef 0) #11, !dbg !351
    #dbg_value(i32 %37, !245, !DIExpression(), !302)
  %38 = icmp slt i32 %37, 0, !dbg !351
  br i1 %38, label %39, label %40, !dbg !353

39:                                               ; preds = %36
  tail call void @perror(ptr noundef nonnull @.str.12) #12, !dbg !354
  tail call void @exit(i32 noundef 1) #10, !dbg !354
  unreachable, !dbg !354

40:                                               ; preds = %36
  %41 = call i32 @fstat(i32 noundef %37, ptr noundef nonnull %4) #11, !dbg !356
  %42 = icmp slt i32 %41, 0, !dbg !356
  br i1 %42, label %43, label %44, !dbg !358

43:                                               ; preds = %40
  tail call void @perror(ptr noundef nonnull @.str.13) #12, !dbg !359
  tail call void @exit(i32 noundef 1) #10, !dbg !359
  unreachable, !dbg !359

44:                                               ; preds = %40
  %45 = tail call ptr @mmap(ptr noundef null, i64 noundef %32, i32 noundef 3, i32 noundef 2, i32 noundef %37, i64 noundef 0) #11, !dbg !361
    #dbg_value(ptr %45, !248, !DIExpression(), !302)
  %46 = icmp eq ptr %45, null, !dbg !361
  br i1 %46, label %47, label %48, !dbg !363

47:                                               ; preds = %44
  tail call void @perror(ptr noundef nonnull @.str.14) #12, !dbg !364
  tail call void @exit(i32 noundef 1) #10, !dbg !364
  unreachable, !dbg !364

48:                                               ; preds = %44
  %49 = tail call i32 (ptr, i32, ...) @open(ptr noundef nonnull @.str.5, i32 noundef 66, i32 noundef 448) #11, !dbg !366
    #dbg_value(i32 %49, !246, !DIExpression(), !302)
  %50 = icmp slt i32 %49, 0, !dbg !366
  br i1 %50, label %51, label %52, !dbg !368

51:                                               ; preds = %48
  tail call void @perror(ptr noundef nonnull @.str.15) #12, !dbg !369
  tail call void @exit(i32 noundef 1) #10, !dbg !369
  unreachable, !dbg !369

52:                                               ; preds = %48
  %53 = sext i32 %20 to i64, !dbg !371
  %54 = tail call i32 @ftruncate(i32 noundef %49, i64 noundef %53) #11, !dbg !371
  %55 = icmp slt i32 %54, 0, !dbg !371
  br i1 %55, label %56, label %57, !dbg !373

56:                                               ; preds = %52
  tail call void @perror(ptr noundef nonnull @.str.16) #12, !dbg !374
  tail call void @exit(i32 noundef 1) #10, !dbg !374
  unreachable, !dbg !374

57:                                               ; preds = %52
  %58 = tail call ptr @mmap(ptr noundef null, i64 noundef %32, i32 noundef 3, i32 noundef 2, i32 noundef %49, i64 noundef 0) #11, !dbg !376
    #dbg_value(ptr %58, !249, !DIExpression(), !302)
  %59 = icmp eq ptr %58, null, !dbg !376
  br i1 %59, label %60, label %61, !dbg !378

60:                                               ; preds = %57
  tail call void @perror(ptr noundef nonnull @.str.17) #12, !dbg !379
  tail call void @exit(i32 noundef 1) #10, !dbg !379
  unreachable, !dbg !379

61:                                               ; preds = %57
    #dbg_value(i32 %15, !300, !DIExpression(DW_OP_LLVM_fragment, 192, 32), !302)
    #dbg_value(ptr %33, !300, !DIExpression(DW_OP_LLVM_fragment, 0, 64), !302)
    #dbg_value(ptr %45, !300, !DIExpression(DW_OP_LLVM_fragment, 64, 64), !302)
    #dbg_value(ptr %58, !300, !DIExpression(DW_OP_LLVM_fragment, 128, 64), !302)
  %62 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.24), !dbg !381
  tail call void @llvm.memset.p0.i64(ptr nonnull align 4 %58, i8 0, i64 %53, i1 false), !dbg !382
    #dbg_value(ptr undef, !137, !DIExpression(), !383)
    #dbg_value(i32 0, !138, !DIExpression(), !383)
  %63 = icmp eq i32 %15, 0, !dbg !385
  br i1 %63, label %135, label %64, !dbg !386

64:                                               ; preds = %61
  %65 = and i64 %14, 2147483647, !dbg !386
  %66 = and i64 %14, 2147483647, !dbg !386
  br label %67, !dbg !386

67:                                               ; preds = %130, %64
  %68 = phi i64 [ 100, %64 ], [ %134, %130 ]
  %69 = phi i64 [ 0, %64 ], [ %131, %130 ]
    #dbg_value(i64 %69, !138, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !383)
    #dbg_value(i32 0, !139, !DIExpression(), !383)
  br label %70, !dbg !387

70:                                               ; preds = %125, %67
  %71 = phi i64 [ 100, %67 ], [ %129, %125 ]
  %72 = phi i64 [ 0, %67 ], [ %126, %125 ]
    #dbg_value(i64 %72, !139, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !383)
    #dbg_value(i32 0, !140, !DIExpression(), !383)
  br label %73, !dbg !388

73:                                               ; preds = %122, %70
  %74 = phi i64 [ 100, %70 ], [ %124, %122 ]
  %75 = phi i64 [ 0, %70 ], [ %76, %122 ]
    #dbg_value(i64 %75, !140, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !383)
    #dbg_value(i64 %69, !144, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_plus_uconst, 100, DW_OP_stack_value), !383)
    #dbg_value(i64 %72, !145, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_plus_uconst, 100, DW_OP_stack_value), !383)
  %76 = add nuw nsw i64 %75, 100, !dbg !388
  %77 = trunc i64 %76 to i32, !dbg !389
    #dbg_value(i32 %77, !146, !DIExpression(), !383)
    #dbg_value(i64 %69, !141, !DIExpression(DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !383)
  br label %78, !dbg !390

78:                                               ; preds = %119, %73
  %79 = phi i64 [ %120, %119 ], [ %69, %73 ]
    #dbg_value(i64 %79, !141, !DIExpression(), !383)
  %80 = icmp ult i64 %79, %65, !dbg !391
  br i1 %80, label %81, label %122, !dbg !392

81:                                               ; preds = %78
  %82 = mul nuw nsw i64 %79, %66
  %83 = getelementptr inbounds i32, ptr %58, i64 %82, !dbg !393
  call void @__record_field_access_full(i32 4, ptr %83, i32 0)
  %84 = getelementptr inbounds i32, ptr %33, i64 %82
  call void @__record_field_access_full(i32 4, ptr %84, i32 0), !dbg !393
  br label %85, !dbg !393

85:                                               ; preds = %116, %81
  %86 = phi i64 [ %72, %81 ], [ %117, %116 ]
    #dbg_value(i64 %86, !142, !DIExpression(), !383)
  %87 = icmp ult i64 %86, %65, !dbg !394
  br i1 %87, label %88, label %119, !dbg !393

88:                                               ; preds = %85
  %89 = getelementptr inbounds i32, ptr %83, i64 %86
  %90 = getelementptr inbounds i32, ptr %45, i64 %86, !dbg !395
  call void @__record_field_access_full(i32 4, ptr %90, i32 0), !dbg !395
  br label %91, !dbg !395

91:                                               ; preds = %105, %88
  %92 = phi i64 [ %75, %88 ], [ %114, %105 ]
    #dbg_value(i64 %92, !143, !DIExpression(), !383)
  %93 = icmp ult i64 %92, %65, !dbg !396
  br i1 %93, label %94, label %116, !dbg !395

94:                                               ; preds = %91
  %95 = getelementptr inbounds i32, ptr %84, i64 %92, !dbg !397
  call void @__record_field_access_full(i32 4, ptr %95, i32 0), !dbg !397
  %96 = load i32, ptr %95, align 4, !dbg !397, !tbaa !195
  %97 = mul nuw nsw i64 %92, %66, !dbg !398
  %98 = getelementptr inbounds i32, ptr %90, i64 %97, !dbg !399
  call void @__record_field_access_full(i32 4, ptr %98, i32 0), !dbg !399
  %99 = load i32, ptr %98, align 4, !dbg !399, !tbaa !195
  %100 = mul nsw i32 %99, %96, !dbg !400
  call void @__record_field_access_full(i32 4, ptr %89, i32 0), !dbg !401
  %101 = load i32, ptr %89, align 4, !dbg !401, !tbaa !195
  %102 = add nsw i32 %101, %100, !dbg !401
  store i32 %102, ptr %89, align 4, !dbg !401, !tbaa !195
  %103 = or disjoint i64 %92, 1, !dbg !402
    #dbg_value(i64 %103, !143, !DIExpression(), !383)
  %104 = icmp ult i64 %103, %65, !dbg !396
  br i1 %104, label %105, label %116, !dbg !395

105:                                              ; preds = %94
  %106 = getelementptr inbounds i32, ptr %84, i64 %103, !dbg !397
  call void @__record_field_access_full(i32 4, ptr %106, i32 0), !dbg !397
  %107 = load i32, ptr %106, align 4, !dbg !397, !tbaa !195
  %108 = mul nuw nsw i64 %103, %66, !dbg !398
  %109 = getelementptr inbounds i32, ptr %90, i64 %108, !dbg !399
  call void @__record_field_access_full(i32 4, ptr %109, i32 0), !dbg !399
  %110 = load i32, ptr %109, align 4, !dbg !399, !tbaa !195
  %111 = mul nsw i32 %110, %107, !dbg !400
  %112 = load i32, ptr %89, align 4, !dbg !401, !tbaa !195
  %113 = add nsw i32 %112, %111, !dbg !401
  store i32 %113, ptr %89, align 4, !dbg !401, !tbaa !195
  %114 = add nuw nsw i64 %92, 2, !dbg !402
    #dbg_value(i64 %114, !143, !DIExpression(), !383)
  %115 = icmp eq i64 %114, %74, !dbg !403
  br i1 %115, label %116, label %91, !dbg !404, !llvm.loop !405

116:                                              ; preds = %105, %94, %91
  %117 = add nuw nsw i64 %86, 1, !dbg !407
    #dbg_value(i64 %117, !142, !DIExpression(), !383)
  %118 = icmp eq i64 %117, %71, !dbg !408
  br i1 %118, label %119, label %85, !dbg !409, !llvm.loop !410

119:                                              ; preds = %116, %85
  %120 = add nuw nsw i64 %79, 1, !dbg !412
    #dbg_value(i64 %120, !141, !DIExpression(), !383)
  %121 = icmp eq i64 %120, %68, !dbg !413
  br i1 %121, label %122, label %78, !dbg !390, !llvm.loop !414

122:                                              ; preds = %119, %78
    #dbg_value(i32 %77, !140, !DIExpression(), !383)
  %123 = icmp slt i32 %77, %15, !dbg !416
  %124 = add nuw nsw i64 %74, 100, !dbg !388
  br i1 %123, label %73, label %125, !dbg !388, !llvm.loop !417

125:                                              ; preds = %122
  %126 = add nuw nsw i64 %72, 100, !dbg !387
  %127 = trunc i64 %126 to i32, !dbg !419
    #dbg_value(i32 %127, !139, !DIExpression(), !383)
  %128 = icmp slt i32 %127, %15, !dbg !420
  %129 = add nuw nsw i64 %71, 100, !dbg !387
  br i1 %128, label %70, label %130, !dbg !387, !llvm.loop !421

130:                                              ; preds = %125
  %131 = add nuw nsw i64 %69, 100, !dbg !386
  %132 = trunc i64 %131 to i32, !dbg !423
    #dbg_value(i32 %132, !138, !DIExpression(), !383)
  %133 = icmp slt i32 %132, %15, !dbg !385
  %134 = add nuw nsw i64 %68, 100, !dbg !386
  br i1 %133, label %67, label %135, !dbg !386, !llvm.loop !424

135:                                              ; preds = %130, %61
  %136 = tail call i32 @munmap(ptr noundef nonnull %33, i64 noundef %32) #11, !dbg !426
  %137 = icmp slt i32 %136, 0, !dbg !426
  br i1 %137, label %138, label %139, !dbg !428

138:                                              ; preds = %135
  tail call void @perror(ptr noundef nonnull @.str.19) #12, !dbg !429
  tail call void @exit(i32 noundef 1) #10, !dbg !429
  unreachable, !dbg !429

139:                                              ; preds = %135
  %140 = tail call i32 @close(i32 noundef %23) #11, !dbg !431
  %141 = icmp slt i32 %140, 0, !dbg !431
  br i1 %141, label %142, label %143, !dbg !433

142:                                              ; preds = %139
  tail call void @perror(ptr noundef nonnull @.str.20) #12, !dbg !434
  tail call void @exit(i32 noundef 1) #10, !dbg !434
  unreachable, !dbg !434

143:                                              ; preds = %139
  %144 = tail call i32 @munmap(ptr noundef nonnull %45, i64 noundef %32) #11, !dbg !436
  %145 = icmp slt i32 %144, 0, !dbg !436
  br i1 %145, label %146, label %147, !dbg !438

146:                                              ; preds = %143
  tail call void @perror(ptr noundef nonnull @.str.21) #12, !dbg !439
  tail call void @exit(i32 noundef 1) #10, !dbg !439
  unreachable, !dbg !439

147:                                              ; preds = %143
  %148 = tail call i32 @close(i32 noundef %37) #11, !dbg !441
  %149 = icmp slt i32 %148, 0, !dbg !441
  br i1 %149, label %150, label %151, !dbg !443

150:                                              ; preds = %147
  tail call void @perror(ptr noundef nonnull @.str.22) #12, !dbg !444
  tail call void @exit(i32 noundef 1) #10, !dbg !444
  unreachable, !dbg !444

151:                                              ; preds = %147
  %152 = tail call i32 @close(i32 noundef %49) #11, !dbg !446
  %153 = icmp slt i32 %152, 0, !dbg !446
  br i1 %153, label %154, label %155, !dbg !448

154:                                              ; preds = %151
  tail call void @perror(ptr noundef nonnull @.str.23) #12, !dbg !449
  tail call void @exit(i32 noundef 1) #10, !dbg !449
  unreachable, !dbg !449

155:                                              ; preds = %151
  call void @llvm.lifetime.end.p0(i64 144, ptr nonnull %4) #11, !dbg !451
  call void @llvm.lifetime.end.p0(i64 144, ptr nonnull %3) #11, !dbg !451
  ret i32 0, !dbg !452
}

; Function Attrs: nounwind
declare !dbg !453 void @srand(i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind
declare !dbg !456 i64 @time(ptr noundef) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare !dbg !463 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #4

; Function Attrs: noreturn nounwind
declare !dbg !468 void @exit(i32 noundef) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare !dbg !471 void @perror(ptr nocapture noundef readonly) local_unnamed_addr #4

; Function Attrs: nofree
declare !dbg !474 noundef i32 @open(ptr nocapture noundef readonly, i32 noundef, ...) local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare !dbg !478 noundef i32 @fstat(i32 noundef, ptr nocapture noundef) local_unnamed_addr #4

; Function Attrs: nounwind
declare !dbg !483 ptr @mmap(ptr noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nounwind
declare !dbg !489 i32 @ftruncate(i32 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: nounwind
declare !dbg !493 i32 @munmap(ptr noundef, i64 noundef) local_unnamed_addr #3

declare !dbg !496 i32 @close(i32 noundef) local_unnamed_addr #7

; Function Attrs: mustprogress nofree nounwind willreturn
declare !dbg !499 i64 @strtol(ptr noundef readonly, ptr nocapture noundef, i32 noundef) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #9

declare void @__record_field_access(i32)

declare void @__record_field_access_full(i32, ptr, i32)

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nofree "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nofree nounwind }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind }
attributes #12 = { cold }

!llvm.dbg.cu = !{!97}
!llvm.module.flags = !{!117, !118, !119, !120, !121, !122, !123}
!llvm.ident = !{!124}
!fieldanalysis.instrumented = !{}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 56, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "matrix_mult_serial.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/matrix_multiply", checksumkind: CSK_MD5, checksum: "1fbf2db10e516ce3bfc75a306e428f60")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 8)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 56, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 936, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 117)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 56, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 240, elements: !16)
!15 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!16 = !{!17}
!17 = !DISubrange(count: 30)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(scope: null, file: !2, line: 115, type: !20, isLocal: true, isDefinition: true)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 224, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 28)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(scope: null, file: !2, line: 119, type: !25, isLocal: true, isDefinition: true)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 18)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(scope: null, file: !2, line: 120, type: !25, isLocal: true, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(scope: null, file: !2, line: 121, type: !32, isLocal: true, isDefinition: true)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 27)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(scope: null, file: !2, line: 122, type: !37, isLocal: true, isDefinition: true)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 472, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 59)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(scope: null, file: !2, line: 125, type: !42, isLocal: true, isDefinition: true)
!42 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 312, elements: !43)
!43 = !{!44}
!44 = !DISubrange(count: 39)
!45 = !DIGlobalVariableExpression(var: !46, expr: !DIExpression())
!46 = distinct !DIGlobalVariable(scope: null, file: !2, line: 132, type: !47, isLocal: true, isDefinition: true)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 496, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 62)
!50 = !DIGlobalVariableExpression(var: !51, expr: !DIExpression())
!51 = distinct !DIGlobalVariable(scope: null, file: !2, line: 134, type: !52, isLocal: true, isDefinition: true)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 416, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 52)
!55 = !DIGlobalVariableExpression(var: !56, expr: !DIExpression())
!56 = distinct !DIGlobalVariable(scope: null, file: !2, line: 136, type: !57, isLocal: true, isDefinition: true)
!57 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 912, elements: !58)
!58 = !{!59}
!59 = !DISubrange(count: 114)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(scope: null, file: !2, line: 140, type: !47, isLocal: true, isDefinition: true)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(scope: null, file: !2, line: 142, type: !52, isLocal: true, isDefinition: true)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(scope: null, file: !2, line: 144, type: !57, isLocal: true, isDefinition: true)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(scope: null, file: !2, line: 148, type: !68, isLocal: true, isDefinition: true)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 656, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 82)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(scope: null, file: !2, line: 150, type: !37, isLocal: true, isDefinition: true)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(scope: null, file: !2, line: 152, type: !75, isLocal: true, isDefinition: true)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 944, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 118)
!78 = !DIGlobalVariableExpression(var: !79, expr: !DIExpression())
!79 = distinct !DIGlobalVariable(scope: null, file: !2, line: 174, type: !80, isLocal: true, isDefinition: true)
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 488, elements: !81)
!81 = !{!82}
!82 = !DISubrange(count: 61)
!83 = !DIGlobalVariableExpression(var: !84, expr: !DIExpression())
!84 = distinct !DIGlobalVariable(scope: null, file: !2, line: 175, type: !85, isLocal: true, isDefinition: true)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 336, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 42)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(scope: null, file: !2, line: 177, type: !80, isLocal: true, isDefinition: true)
!90 = !DIGlobalVariableExpression(var: !91, expr: !DIExpression())
!91 = distinct !DIGlobalVariable(scope: null, file: !2, line: 178, type: !85, isLocal: true, isDefinition: true)
!92 = !DIGlobalVariableExpression(var: !93, expr: !DIExpression())
!93 = distinct !DIGlobalVariable(scope: null, file: !2, line: 180, type: !94, isLocal: true, isDefinition: true)
!94 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !95)
!95 = !{!96}
!96 = !DISubrange(count: 44)
!97 = distinct !DICompileUnit(language: DW_LANG_C11, file: !98, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !99, globals: !106, splitDebugInlining: false, nameTableKind: None)
!98 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/matrix_multiply/matrix_mult_serial.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/matrix_multiply", checksumkind: CSK_MD5, checksum: "1fbf2db10e516ce3bfc75a306e428f60")
!99 = !{!100, !101, !102, !103, !104}
!100 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!103 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!104 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!106 = !{!0, !7, !12, !18, !23, !28, !30, !35, !40, !107, !45, !50, !55, !60, !62, !64, !66, !71, !73, !112, !78, !83, !88, !90, !92}
!107 = !DIGlobalVariableExpression(var: !108, expr: !DIExpression())
!108 = distinct !DIGlobalVariable(scope: null, file: !2, line: 126, type: !109, isLocal: true, isDefinition: true)
!109 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 192, elements: !110)
!110 = !{!111}
!111 = !DISubrange(count: 24)
!112 = !DIGlobalVariableExpression(var: !113, expr: !DIExpression())
!113 = distinct !DIGlobalVariable(scope: null, file: !2, line: 163, type: !114, isLocal: true, isDefinition: true)
!114 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !115)
!115 = !{!116}
!116 = !DISubrange(count: 50)
!117 = !{i32 7, !"Dwarf Version", i32 5}
!118 = !{i32 2, !"Debug Info Version", i32 3}
!119 = !{i32 1, !"wchar_size", i32 4}
!120 = !{i32 8, !"PIC Level", i32 2}
!121 = !{i32 7, !"PIE Level", i32 2}
!122 = !{i32 7, !"uwtable", i32 2}
!123 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!124 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!125 = distinct !DISubprogram(name: "matrix_mult", scope: !2, file: !2, line: 54, type: !126, scopeLine: 55, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !97, retainedNodes: !136)
!126 = !DISubroutineType(types: !127)
!127 = !{null, !128}
!128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !129, size: 64)
!129 = !DIDerivedType(tag: DW_TAG_typedef, name: "mm_data_t", file: !2, line: 47, baseType: !130)
!130 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !2, line: 42, size: 256, elements: !131)
!131 = !{!132, !133, !134, !135}
!132 = !DIDerivedType(tag: DW_TAG_member, name: "matrix_A", scope: !130, file: !2, line: 43, baseType: !102, size: 64)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "matrix_B", scope: !130, file: !2, line: 44, baseType: !102, size: 64, offset: 64)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "matrix_out", scope: !130, file: !2, line: 45, baseType: !102, size: 64, offset: 128)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "matrix_len", scope: !130, file: !2, line: 46, baseType: !103, size: 32, offset: 192)
!136 = !{!137, !138, !139, !140, !141, !142, !143, !144, !145, !146}
!137 = !DILocalVariable(name: "data_in", arg: 1, scope: !125, file: !2, line: 54, type: !128)
!138 = !DILocalVariable(name: "i", scope: !125, file: !2, line: 57, type: !103)
!139 = !DILocalVariable(name: "j", scope: !125, file: !2, line: 57, type: !103)
!140 = !DILocalVariable(name: "k", scope: !125, file: !2, line: 57, type: !103)
!141 = !DILocalVariable(name: "a", scope: !125, file: !2, line: 57, type: !103)
!142 = !DILocalVariable(name: "b", scope: !125, file: !2, line: 57, type: !103)
!143 = !DILocalVariable(name: "c", scope: !125, file: !2, line: 57, type: !103)
!144 = !DILocalVariable(name: "end_i", scope: !125, file: !2, line: 57, type: !103)
!145 = !DILocalVariable(name: "end_j", scope: !125, file: !2, line: 57, type: !103)
!146 = !DILocalVariable(name: "end_k", scope: !125, file: !2, line: 57, type: !103)
!147 = !DILocation(line: 0, scope: !125)
!148 = !DILocation(line: 56, column: 2, scope: !149)
!149 = distinct !DILexicalBlock(scope: !150, file: !2, line: 56, column: 2)
!150 = distinct !DILexicalBlock(scope: !125, file: !2, line: 56, column: 2)
!151 = !DILocation(line: 56, column: 2, scope: !150)
!152 = !DILocation(line: 75, column: 28, scope: !153)
!153 = distinct !DILexicalBlock(scope: !154, file: !2, line: 75, column: 4)
!154 = distinct !DILexicalBlock(scope: !125, file: !2, line: 75, column: 4)
!155 = !{!156, !160, i64 24}
!156 = !{!"", !157, i64 0, !157, i64 8, !157, i64 16, !160, i64 24}
!157 = !{!"any pointer", !158, i64 0}
!158 = !{!"omnipotent char", !159, i64 0}
!159 = !{!"Simple C/C++ TBAA"}
!160 = !{!"int", !158, i64 0}
!161 = !DILocation(line: 75, column: 17, scope: !153)
!162 = !DILocation(line: 75, column: 4, scope: !154)
!163 = !DILocation(line: 76, column: 17, scope: !164)
!164 = distinct !DILexicalBlock(scope: !165, file: !2, line: 76, column: 4)
!165 = distinct !DILexicalBlock(scope: !153, file: !2, line: 76, column: 4)
!166 = !DILocation(line: 76, column: 4, scope: !165)
!167 = !DILocation(line: 77, column: 17, scope: !168)
!168 = distinct !DILexicalBlock(scope: !169, file: !2, line: 77, column: 4)
!169 = distinct !DILexicalBlock(scope: !164, file: !2, line: 77, column: 4)
!170 = !DILocation(line: 77, column: 4, scope: !169)
!171 = !DILocation(line: 79, column: 63, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !2, line: 78, column: 4)
!173 = !DILocation(line: 80, column: 29, scope: !174)
!174 = distinct !DILexicalBlock(scope: !175, file: !2, line: 80, column: 7)
!175 = distinct !DILexicalBlock(scope: !172, file: !2, line: 80, column: 7)
!176 = !DILocation(line: 80, column: 45, scope: !174)
!177 = !DILocation(line: 80, column: 34, scope: !174)
!178 = !DILocation(line: 80, column: 7, scope: !175)
!179 = !DILocation(line: 81, column: 45, scope: !180)
!180 = distinct !DILexicalBlock(scope: !181, file: !2, line: 81, column: 7)
!181 = distinct !DILexicalBlock(scope: !174, file: !2, line: 81, column: 7)
!182 = !DILocation(line: 81, column: 34, scope: !180)
!183 = !DILocation(line: 81, column: 7, scope: !181)
!184 = !DILocation(line: 82, column: 45, scope: !185)
!185 = distinct !DILexicalBlock(scope: !186, file: !2, line: 82, column: 7)
!186 = distinct !DILexicalBlock(scope: !180, file: !2, line: 82, column: 7)
!187 = !DILocation(line: 82, column: 34, scope: !185)
!188 = !DILocation(line: 82, column: 7, scope: !186)
!189 = !DILocation(line: 85, column: 30, scope: !190)
!190 = distinct !DILexicalBlock(scope: !185, file: !2, line: 83, column: 7)
!191 = !{!156, !157, i64 0}
!192 = !DILocation(line: 85, column: 61, scope: !190)
!193 = !DILocation(line: 85, column: 64, scope: !190)
!194 = !DILocation(line: 85, column: 21, scope: !190)
!195 = !{!160, !160, i64 0}
!196 = !DILocation(line: 86, column: 30, scope: !190)
!197 = !{!156, !157, i64 8}
!198 = !DILocation(line: 86, column: 61, scope: !190)
!199 = !DILocation(line: 86, column: 64, scope: !190)
!200 = !DILocation(line: 86, column: 21, scope: !190)
!201 = !DILocation(line: 85, column: 69, scope: !190)
!202 = !DILocation(line: 84, column: 25, scope: !190)
!203 = !{!156, !157, i64 16}
!204 = !DILocation(line: 84, column: 60, scope: !190)
!205 = !DILocation(line: 84, column: 16, scope: !190)
!206 = !DILocation(line: 84, column: 65, scope: !190)
!207 = !DILocation(line: 82, column: 58, scope: !185)
!208 = !DILocation(line: 82, column: 21, scope: !185)
!209 = !DILocation(line: 82, column: 29, scope: !185)
!210 = distinct !{!210, !188, !211, !212}
!211 = !DILocation(line: 87, column: 7, scope: !186)
!212 = !{!"llvm.loop.mustprogress"}
!213 = !DILocation(line: 81, column: 58, scope: !180)
!214 = !DILocation(line: 81, column: 21, scope: !180)
!215 = !DILocation(line: 81, column: 29, scope: !180)
!216 = distinct !{!216, !183, !217, !212}
!217 = !DILocation(line: 87, column: 7, scope: !181)
!218 = !DILocation(line: 80, column: 58, scope: !174)
!219 = !DILocation(line: 80, column: 21, scope: !174)
!220 = distinct !{!220, !178, !221, !212}
!221 = !DILocation(line: 87, column: 7, scope: !175)
!222 = !DILocation(line: 77, column: 28, scope: !168)
!223 = distinct !{!223, !170, !224, !212}
!224 = !DILocation(line: 88, column: 4, scope: !169)
!225 = !DILocation(line: 76, column: 28, scope: !164)
!226 = !DILocation(line: 76, column: 42, scope: !164)
!227 = distinct !{!227, !166, !228, !212}
!228 = !DILocation(line: 88, column: 4, scope: !165)
!229 = !DILocation(line: 75, column: 42, scope: !153)
!230 = distinct !{!230, !162, !231, !212}
!231 = !DILocation(line: 88, column: 4, scope: !154)
!232 = !DILocation(line: 99, column: 1, scope: !125)
!233 = !DISubprogram(name: "__assert_fail", scope: !234, file: !234, line: 69, type: !235, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!234 = !DIFile(filename: "/usr/include/assert.h", directory: "", checksumkind: CSK_MD5, checksum: "ab7dc6991d501750085448b20099a5a0")
!235 = !DISubroutineType(types: !236)
!236 = !{null, !237, !237, !100, !237}
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!238 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 101, type: !239, scopeLine: 102, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !97, retainedNodes: !241)
!239 = !DISubroutineType(types: !240)
!240 = !{!103, !103, !104}
!241 = !{!242, !243, !244, !245, !246, !247, !248, !249, !250, !251, !252, !293, !294, !295, !296, !297, !298, !299, !300}
!242 = !DILocalVariable(name: "argc", arg: 1, scope: !238, file: !2, line: 101, type: !103)
!243 = !DILocalVariable(name: "argv", arg: 2, scope: !238, file: !2, line: 101, type: !104)
!244 = !DILocalVariable(name: "fd_A", scope: !238, file: !2, line: 104, type: !103)
!245 = !DILocalVariable(name: "fd_B", scope: !238, file: !2, line: 104, type: !103)
!246 = !DILocalVariable(name: "fd_out", scope: !238, file: !2, line: 104, type: !103)
!247 = !DILocalVariable(name: "fdata_A", scope: !238, file: !2, line: 105, type: !105)
!248 = !DILocalVariable(name: "fdata_B", scope: !238, file: !2, line: 105, type: !105)
!249 = !DILocalVariable(name: "fdata_out", scope: !238, file: !2, line: 105, type: !105)
!250 = !DILocalVariable(name: "matrix_len", scope: !238, file: !2, line: 106, type: !103)
!251 = !DILocalVariable(name: "file_size", scope: !238, file: !2, line: 106, type: !103)
!252 = !DILocalVariable(name: "finfo_A", scope: !238, file: !2, line: 107, type: !253)
!253 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !254, line: 26, size: 1152, elements: !255)
!254 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_stat.h", directory: "", checksumkind: CSK_MD5, checksum: "3ba283bc334370fe631cbc82f5229ed7")
!255 = !{!256, !260, !262, !264, !266, !268, !270, !271, !272, !275, !277, !279, !287, !288, !289}
!256 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !253, file: !254, line: 31, baseType: !257, size: 64)
!257 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !258, line: 145, baseType: !259)
!258 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!259 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !253, file: !254, line: 36, baseType: !261, size: 64, offset: 64)
!261 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !258, line: 148, baseType: !259)
!262 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !253, file: !254, line: 44, baseType: !263, size: 64, offset: 128)
!263 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !258, line: 151, baseType: !259)
!264 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !253, file: !254, line: 45, baseType: !265, size: 32, offset: 192)
!265 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !258, line: 150, baseType: !100)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !253, file: !254, line: 47, baseType: !267, size: 32, offset: 224)
!267 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !258, line: 146, baseType: !100)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !253, file: !254, line: 48, baseType: !269, size: 32, offset: 256)
!269 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !258, line: 147, baseType: !100)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !253, file: !254, line: 50, baseType: !103, size: 32, offset: 288)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !253, file: !254, line: 52, baseType: !257, size: 64, offset: 320)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !253, file: !254, line: 57, baseType: !273, size: 64, offset: 384)
!273 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !258, line: 152, baseType: !274)
!274 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !253, file: !254, line: 61, baseType: !276, size: 64, offset: 448)
!276 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !258, line: 175, baseType: !274)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !253, file: !254, line: 63, baseType: !278, size: 64, offset: 512)
!278 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !258, line: 180, baseType: !274)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !253, file: !254, line: 74, baseType: !280, size: 128, offset: 576)
!280 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !281, line: 11, size: 128, elements: !282)
!281 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!282 = !{!283, !285}
!283 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !280, file: !281, line: 16, baseType: !284, size: 64)
!284 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !258, line: 160, baseType: !274)
!285 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !280, file: !281, line: 21, baseType: !286, size: 64, offset: 64)
!286 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !258, line: 197, baseType: !274)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !253, file: !254, line: 75, baseType: !280, size: 128, offset: 704)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !253, file: !254, line: 76, baseType: !280, size: 128, offset: 832)
!289 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !253, file: !254, line: 89, baseType: !290, size: 192, offset: 960)
!290 = !DICompositeType(tag: DW_TAG_array_type, baseType: !286, size: 192, elements: !291)
!291 = !{!292}
!292 = !DISubrange(count: 3)
!293 = !DILocalVariable(name: "finfo_B", scope: !238, file: !2, line: 107, type: !253)
!294 = !DILocalVariable(name: "fname_A", scope: !238, file: !2, line: 108, type: !105)
!295 = !DILocalVariable(name: "fname_B", scope: !238, file: !2, line: 108, type: !105)
!296 = !DILocalVariable(name: "fname_out", scope: !238, file: !2, line: 108, type: !105)
!297 = !DILocalVariable(name: "value", scope: !238, file: !2, line: 129, type: !103)
!298 = !DILocalVariable(name: "i", scope: !238, file: !2, line: 129, type: !103)
!299 = !DILocalVariable(name: "j", scope: !238, file: !2, line: 129, type: !103)
!300 = !DILocalVariable(name: "mm_data", scope: !238, file: !2, line: 156, type: !129)
!301 = distinct !DIAssignID()
!302 = !DILocation(line: 0, scope: !238)
!303 = distinct !DIAssignID()
!304 = !DILocation(line: 107, column: 4, scope: !238)
!305 = !DILocation(line: 110, column: 21, scope: !238)
!306 = !DILocation(line: 110, column: 11, scope: !238)
!307 = !DILocation(line: 110, column: 4, scope: !238)
!308 = !DILocation(line: 113, column: 8, scope: !309)
!309 = distinct !DILexicalBlock(scope: !238, file: !2, line: 113, column: 8)
!310 = !{!157, !157, i64 0}
!311 = !DILocation(line: 113, column: 16, scope: !309)
!312 = !DILocation(line: 113, column: 8, scope: !238)
!313 = !DILocation(line: 115, column: 46, scope: !314)
!314 = distinct !DILexicalBlock(scope: !309, file: !2, line: 114, column: 4)
!315 = !DILocation(line: 115, column: 7, scope: !314)
!316 = !DILocation(line: 116, column: 7, scope: !314)
!317 = !DILocalVariable(name: "__nptr", arg: 1, scope: !318, file: !319, line: 362, type: !237)
!318 = distinct !DISubprogram(name: "atoi", scope: !319, file: !319, line: 362, type: !320, scopeLine: 363, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !97, retainedNodes: !322)
!319 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!320 = !DISubroutineType(types: !321)
!321 = !{!103, !237}
!322 = !{!317}
!323 = !DILocation(line: 0, scope: !318, inlinedAt: !324)
!324 = distinct !DILocation(line: 122, column: 4, scope: !325)
!325 = distinct !DILexicalBlock(scope: !238, file: !2, line: 122, column: 4)
!326 = !DILocation(line: 364, column: 16, scope: !318, inlinedAt: !324)
!327 = !DILocation(line: 364, column: 10, scope: !318, inlinedAt: !324)
!328 = !DILocation(line: 122, column: 4, scope: !325)
!329 = !DILocation(line: 122, column: 4, scope: !238)
!330 = !DILocation(line: 122, column: 4, scope: !331)
!331 = distinct !DILexicalBlock(scope: !325, file: !2, line: 122, column: 4)
!332 = !DILocation(line: 123, column: 28, scope: !238)
!333 = !DILocation(line: 123, column: 41, scope: !238)
!334 = !DILocation(line: 125, column: 4, scope: !238)
!335 = !DILocation(line: 126, column: 4, scope: !238)
!336 = !DILocation(line: 132, column: 4, scope: !337)
!337 = distinct !DILexicalBlock(scope: !238, file: !2, line: 132, column: 4)
!338 = !DILocation(line: 132, column: 4, scope: !238)
!339 = !DILocation(line: 132, column: 4, scope: !340)
!340 = distinct !DILexicalBlock(scope: !337, file: !2, line: 132, column: 4)
!341 = !DILocation(line: 134, column: 4, scope: !342)
!342 = distinct !DILexicalBlock(scope: !238, file: !2, line: 134, column: 4)
!343 = !DILocation(line: 134, column: 4, scope: !238)
!344 = !DILocation(line: 134, column: 4, scope: !345)
!345 = distinct !DILexicalBlock(scope: !342, file: !2, line: 134, column: 4)
!346 = !DILocation(line: 136, column: 4, scope: !347)
!347 = distinct !DILexicalBlock(scope: !238, file: !2, line: 136, column: 4)
!348 = !DILocation(line: 136, column: 4, scope: !238)
!349 = !DILocation(line: 136, column: 4, scope: !350)
!350 = distinct !DILexicalBlock(scope: !347, file: !2, line: 136, column: 4)
!351 = !DILocation(line: 140, column: 4, scope: !352)
!352 = distinct !DILexicalBlock(scope: !238, file: !2, line: 140, column: 4)
!353 = !DILocation(line: 140, column: 4, scope: !238)
!354 = !DILocation(line: 140, column: 4, scope: !355)
!355 = distinct !DILexicalBlock(scope: !352, file: !2, line: 140, column: 4)
!356 = !DILocation(line: 142, column: 4, scope: !357)
!357 = distinct !DILexicalBlock(scope: !238, file: !2, line: 142, column: 4)
!358 = !DILocation(line: 142, column: 4, scope: !238)
!359 = !DILocation(line: 142, column: 4, scope: !360)
!360 = distinct !DILexicalBlock(scope: !357, file: !2, line: 142, column: 4)
!361 = !DILocation(line: 144, column: 4, scope: !362)
!362 = distinct !DILexicalBlock(scope: !238, file: !2, line: 144, column: 4)
!363 = !DILocation(line: 144, column: 4, scope: !238)
!364 = !DILocation(line: 144, column: 4, scope: !365)
!365 = distinct !DILexicalBlock(scope: !362, file: !2, line: 144, column: 4)
!366 = !DILocation(line: 148, column: 4, scope: !367)
!367 = distinct !DILexicalBlock(scope: !238, file: !2, line: 148, column: 4)
!368 = !DILocation(line: 148, column: 4, scope: !238)
!369 = !DILocation(line: 148, column: 4, scope: !370)
!370 = distinct !DILexicalBlock(scope: !367, file: !2, line: 148, column: 4)
!371 = !DILocation(line: 150, column: 4, scope: !372)
!372 = distinct !DILexicalBlock(scope: !238, file: !2, line: 150, column: 4)
!373 = !DILocation(line: 150, column: 4, scope: !238)
!374 = !DILocation(line: 150, column: 4, scope: !375)
!375 = distinct !DILexicalBlock(scope: !372, file: !2, line: 150, column: 4)
!376 = !DILocation(line: 152, column: 4, scope: !377)
!377 = distinct !DILexicalBlock(scope: !238, file: !2, line: 152, column: 4)
!378 = !DILocation(line: 152, column: 4, scope: !238)
!379 = !DILocation(line: 152, column: 4, scope: !380)
!380 = distinct !DILexicalBlock(scope: !377, file: !2, line: 152, column: 4)
!381 = !DILocation(line: 163, column: 4, scope: !238)
!382 = !DILocation(line: 168, column: 4, scope: !238)
!383 = !DILocation(line: 0, scope: !125, inlinedAt: !384)
!384 = distinct !DILocation(line: 169, column: 4, scope: !238)
!385 = !DILocation(line: 75, column: 17, scope: !153, inlinedAt: !384)
!386 = !DILocation(line: 75, column: 4, scope: !154, inlinedAt: !384)
!387 = !DILocation(line: 76, column: 4, scope: !165, inlinedAt: !384)
!388 = !DILocation(line: 77, column: 4, scope: !169, inlinedAt: !384)
!389 = !DILocation(line: 79, column: 63, scope: !172, inlinedAt: !384)
!390 = !DILocation(line: 80, column: 29, scope: !174, inlinedAt: !384)
!391 = !DILocation(line: 80, column: 34, scope: !174, inlinedAt: !384)
!392 = !DILocation(line: 80, column: 7, scope: !175, inlinedAt: !384)
!393 = !DILocation(line: 81, column: 7, scope: !181, inlinedAt: !384)
!394 = !DILocation(line: 81, column: 34, scope: !180, inlinedAt: !384)
!395 = !DILocation(line: 82, column: 7, scope: !186, inlinedAt: !384)
!396 = !DILocation(line: 82, column: 34, scope: !185, inlinedAt: !384)
!397 = !DILocation(line: 85, column: 21, scope: !190, inlinedAt: !384)
!398 = !DILocation(line: 86, column: 61, scope: !190, inlinedAt: !384)
!399 = !DILocation(line: 86, column: 21, scope: !190, inlinedAt: !384)
!400 = !DILocation(line: 85, column: 69, scope: !190, inlinedAt: !384)
!401 = !DILocation(line: 84, column: 65, scope: !190, inlinedAt: !384)
!402 = !DILocation(line: 82, column: 58, scope: !185, inlinedAt: !384)
!403 = !DILocation(line: 82, column: 21, scope: !185, inlinedAt: !384)
!404 = !DILocation(line: 82, column: 29, scope: !185, inlinedAt: !384)
!405 = distinct !{!405, !395, !406, !212}
!406 = !DILocation(line: 87, column: 7, scope: !186, inlinedAt: !384)
!407 = !DILocation(line: 81, column: 58, scope: !180, inlinedAt: !384)
!408 = !DILocation(line: 81, column: 21, scope: !180, inlinedAt: !384)
!409 = !DILocation(line: 81, column: 29, scope: !180, inlinedAt: !384)
!410 = distinct !{!410, !393, !411, !212}
!411 = !DILocation(line: 87, column: 7, scope: !181, inlinedAt: !384)
!412 = !DILocation(line: 80, column: 58, scope: !174, inlinedAt: !384)
!413 = !DILocation(line: 80, column: 21, scope: !174, inlinedAt: !384)
!414 = distinct !{!414, !392, !415, !212}
!415 = !DILocation(line: 87, column: 7, scope: !175, inlinedAt: !384)
!416 = !DILocation(line: 77, column: 17, scope: !168, inlinedAt: !384)
!417 = distinct !{!417, !388, !418, !212}
!418 = !DILocation(line: 88, column: 4, scope: !169, inlinedAt: !384)
!419 = !DILocation(line: 76, column: 42, scope: !164, inlinedAt: !384)
!420 = !DILocation(line: 76, column: 17, scope: !164, inlinedAt: !384)
!421 = distinct !{!421, !387, !422, !212}
!422 = !DILocation(line: 88, column: 4, scope: !165, inlinedAt: !384)
!423 = !DILocation(line: 75, column: 42, scope: !153, inlinedAt: !384)
!424 = distinct !{!424, !386, !425, !212}
!425 = !DILocation(line: 88, column: 4, scope: !154, inlinedAt: !384)
!426 = !DILocation(line: 174, column: 4, scope: !427)
!427 = distinct !DILexicalBlock(scope: !238, file: !2, line: 174, column: 4)
!428 = !DILocation(line: 174, column: 4, scope: !238)
!429 = !DILocation(line: 174, column: 4, scope: !430)
!430 = distinct !DILexicalBlock(scope: !427, file: !2, line: 174, column: 4)
!431 = !DILocation(line: 175, column: 4, scope: !432)
!432 = distinct !DILexicalBlock(scope: !238, file: !2, line: 175, column: 4)
!433 = !DILocation(line: 175, column: 4, scope: !238)
!434 = !DILocation(line: 175, column: 4, scope: !435)
!435 = distinct !DILexicalBlock(scope: !432, file: !2, line: 175, column: 4)
!436 = !DILocation(line: 177, column: 4, scope: !437)
!437 = distinct !DILexicalBlock(scope: !238, file: !2, line: 177, column: 4)
!438 = !DILocation(line: 177, column: 4, scope: !238)
!439 = !DILocation(line: 177, column: 4, scope: !440)
!440 = distinct !DILexicalBlock(scope: !437, file: !2, line: 177, column: 4)
!441 = !DILocation(line: 178, column: 4, scope: !442)
!442 = distinct !DILexicalBlock(scope: !238, file: !2, line: 178, column: 4)
!443 = !DILocation(line: 178, column: 4, scope: !238)
!444 = !DILocation(line: 178, column: 4, scope: !445)
!445 = distinct !DILexicalBlock(scope: !442, file: !2, line: 178, column: 4)
!446 = !DILocation(line: 180, column: 4, scope: !447)
!447 = distinct !DILexicalBlock(scope: !238, file: !2, line: 180, column: 4)
!448 = !DILocation(line: 180, column: 4, scope: !238)
!449 = !DILocation(line: 180, column: 4, scope: !450)
!450 = distinct !DILexicalBlock(scope: !447, file: !2, line: 180, column: 4)
!451 = !DILocation(line: 183, column: 1, scope: !238)
!452 = !DILocation(line: 182, column: 4, scope: !238)
!453 = !DISubprogram(name: "srand", scope: !319, file: !319, line: 456, type: !454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!454 = !DISubroutineType(types: !455)
!455 = !{null, !100}
!456 = !DISubprogram(name: "time", scope: !457, file: !457, line: 76, type: !458, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!457 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "db37158473a25e1d89b19f8bc6892801")
!458 = !DISubroutineType(types: !459)
!459 = !{!460, !462}
!460 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !461, line: 10, baseType: !284)
!461 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!462 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !460, size: 64)
!463 = !DISubprogram(name: "printf", scope: !464, file: !464, line: 356, type: !465, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!464 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!465 = !DISubroutineType(types: !466)
!466 = !{!103, !467, null}
!467 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !237)
!468 = !DISubprogram(name: "exit", scope: !319, file: !319, line: 624, type: !469, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!469 = !DISubroutineType(types: !470)
!470 = !{null, !103}
!471 = !DISubprogram(name: "perror", scope: !464, file: !464, line: 804, type: !472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!472 = !DISubroutineType(types: !473)
!473 = !{null, !237}
!474 = !DISubprogram(name: "open", scope: !475, file: !475, line: 181, type: !476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!475 = !DIFile(filename: "/usr/include/fcntl.h", directory: "", checksumkind: CSK_MD5, checksum: "1a9bb91818c37dc7bc291ca6e49fc221")
!476 = !DISubroutineType(types: !477)
!477 = !{!103, !237, !103, null}
!478 = !DISubprogram(name: "fstat", scope: !479, file: !479, line: 210, type: !480, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!479 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/stat.h", directory: "", checksumkind: CSK_MD5, checksum: "1e5cd132abb12ea0c79aeae3bfa4573e")
!480 = !DISubroutineType(types: !481)
!481 = !{!103, !103, !482}
!482 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !253, size: 64)
!483 = !DISubprogram(name: "mmap", scope: !484, file: !484, line: 57, type: !485, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!484 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/mman.h", directory: "", checksumkind: CSK_MD5, checksum: "93a87cc3b0558893646eb0c257165272")
!485 = !DISubroutineType(types: !486)
!486 = !{!101, !101, !487, !103, !103, !103, !273}
!487 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !488, line: 18, baseType: !259)
!488 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!489 = !DISubprogram(name: "ftruncate", scope: !490, file: !490, line: 1049, type: !491, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!490 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "ed37c2e6f30ba31a8b41e4d70547c39c")
!491 = !DISubroutineType(types: !492)
!492 = !{!103, !103, !273}
!493 = !DISubprogram(name: "munmap", scope: !484, file: !484, line: 76, type: !494, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!494 = !DISubroutineType(types: !495)
!495 = !{!103, !101, !487}
!496 = !DISubprogram(name: "close", scope: !490, file: !490, line: 358, type: !497, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!497 = !DISubroutineType(types: !498)
!498 = !{!103, !103}
!499 = !DISubprogram(name: "strtol", scope: !319, file: !319, line: 177, type: !500, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!500 = !DISubroutineType(types: !501)
!501 = !{!274, !467, !502, !103}
!502 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !104)
