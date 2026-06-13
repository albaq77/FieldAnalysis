; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/word_count/wordcount_serial.c'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/word_count/wordcount_serial.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.wc_count_t = type { ptr, i32 }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@words = dso_local local_unnamed_addr global ptr null, align 8, !dbg !0
@length = dso_local local_unnamed_addr global i32 0, align 4, !dbg !103
@use_len = dso_local local_unnamed_addr global i32 0, align 4, !dbg !101
@.str = private unnamed_addr constant [5 x i8] c"args\00", align 1, !dbg !38
@.str.1 = private unnamed_addr constant [110 x i8] c"/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/word_count/wordcount_serial.c\00", align 1, !dbg !43
@__PRETTY_FUNCTION__.wordcount_getword = private unnamed_addr constant [31 x i8] c"void wordcount_getword(void *)\00", align 1, !dbg !48
@.str.2 = private unnamed_addr constant [5 x i8] c"data\00", align 1, !dbg !54
@.str.3 = private unnamed_addr constant [52 x i8] c"USAGE: %s <filename> [Top # of results to display]\0A\00", align 1, !dbg !56
@.str.5 = private unnamed_addr constant [59 x i8] c"Error at line\0A\09(fd = open(fname, O_RDONLY)) < 0\0ASystem Msg\00", align 1, !dbg !66
@.str.6 = private unnamed_addr constant [48 x i8] c"Error at line\0A\09fstat(fd, &finfo) < 0\0ASystem Msg\00", align 1, !dbg !71
@.str.7 = private unnamed_addr constant [115 x i8] c"Error at line\0A\09(fdata = mmap(0, finfo.st_size + 1, PROT_READ | PROT_WRITE, MAP_PRIVATE, fd, 0)) == NULL\0ASystem Msg\00", align 1, !dbg !76
@.str.8 = private unnamed_addr constant [107 x i8] c"Error at line\0A\09(disp_num = (disp_num_str == NULL) ? DEFAULT_DISP_NUM : atoi(disp_num_str)) <= 0\0ASystem Msg\00", align 1, !dbg !81
@.str.10 = private unnamed_addr constant [63 x i8] c"Error at line\0A\09munmap(fdata, finfo.st_size + 1) < 0\0ASystem Msg\00", align 1, !dbg !91
@.str.11 = private unnamed_addr constant [40 x i8] c"Error at line\0A\09close(fd) < 0\0ASystem Msg\00", align 1, !dbg !96
@str = private unnamed_addr constant [22 x i8] c"Wordcount: Running...\00", align 1
@str.12 = private unnamed_addr constant [26 x i8] c"Wordcount Serial: Running\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define dso_local range(i32 -1, 2) i32 @wordcount_cmp(ptr nocapture noundef readonly %0, ptr nocapture noundef readonly %1) #0 !dbg !113 {
    #dbg_value(ptr %0, !119, !DIExpression(), !125)
    #dbg_value(ptr %1, !120, !DIExpression(), !125)
    #dbg_value(ptr %0, !121, !DIExpression(), !125)
    #dbg_value(ptr %1, !122, !DIExpression(), !125)
  %3 = getelementptr inbounds i8, ptr %0, i64 8, !dbg !126
  %4 = load i32, ptr %3, align 8, !dbg !126, !tbaa !127
    #dbg_value(i32 %4, !123, !DIExpression(), !125)
  %5 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !133
  %6 = load i32, ptr %5, align 8, !dbg !133, !tbaa !127
    #dbg_value(i32 %6, !124, !DIExpression(), !125)
  %7 = icmp slt i32 %4, %6, !dbg !134
  %8 = icmp sgt i32 %4, %6, !dbg !136
  %9 = sext i1 %8 to i32, !dbg !136
  %10 = select i1 %7, i32 1, i32 %9, !dbg !136
  ret i32 %10, !dbg !137
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @wordcount_splitter(ptr nocapture noundef readonly %0) local_unnamed_addr #2 !dbg !138 {
    #dbg_value(ptr %0, !142, !DIExpression(), !146)
    #dbg_value(ptr %0, !144, !DIExpression(), !146)
  %2 = tail call noalias dereferenceable_or_null(32000) ptr @calloc(i64 noundef 2000, i64 noundef 16) #18, !dbg !147
  store ptr %2, ptr @words, align 8, !dbg !148, !tbaa !149
  store i32 2000, ptr @length, align 4, !dbg !150, !tbaa !151
  store i32 0, ptr @use_len, align 4, !dbg !152, !tbaa !151
    #dbg_value(i32 0, !143, !DIExpression(), !146)
  br label %3, !dbg !153

3:                                                ; preds = %3, %1
  %4 = phi i64 [ 0, %1 ], [ %14, %3 ]
    #dbg_value(i64 %4, !143, !DIExpression(), !146)
  %5 = getelementptr inbounds %struct.wc_count_t, ptr %2, i64 %4, i32 1, !dbg !155
  store i32 0, ptr %5, align 8, !dbg !157, !tbaa !127
  %6 = add nuw nsw i64 %4, 1, !dbg !158
    #dbg_value(i64 %6, !143, !DIExpression(), !146)
  %7 = getelementptr inbounds %struct.wc_count_t, ptr %2, i64 %6, i32 1, !dbg !155
  store i32 0, ptr %7, align 8, !dbg !157, !tbaa !127
  %8 = add nuw nsw i64 %4, 2, !dbg !158
    #dbg_value(i64 %8, !143, !DIExpression(), !146)
  %9 = getelementptr inbounds %struct.wc_count_t, ptr %2, i64 %8, i32 1, !dbg !155
  store i32 0, ptr %9, align 8, !dbg !157, !tbaa !127
  %10 = add nuw nsw i64 %4, 3, !dbg !158
    #dbg_value(i64 %10, !143, !DIExpression(), !146)
  %11 = getelementptr inbounds %struct.wc_count_t, ptr %2, i64 %10, i32 1, !dbg !155
  store i32 0, ptr %11, align 8, !dbg !157, !tbaa !127
  %12 = add nuw nsw i64 %4, 4, !dbg !158
    #dbg_value(i64 %12, !143, !DIExpression(), !146)
  %13 = getelementptr inbounds %struct.wc_count_t, ptr %2, i64 %12, i32 1, !dbg !155
  store i32 0, ptr %13, align 8, !dbg !157, !tbaa !127
  %14 = add nuw nsw i64 %4, 5, !dbg !158
    #dbg_value(i64 %14, !143, !DIExpression(), !146)
  %15 = icmp eq i64 %14, 2000, !dbg !159
  br i1 %15, label %16, label %3, !dbg !153, !llvm.loop !160

16:                                               ; preds = %3
  %17 = tail call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #19, !dbg !163
    #dbg_value(ptr %17, !145, !DIExpression(), !146)
  %18 = getelementptr inbounds i8, ptr %0, i64 8, !dbg !164
  %19 = load ptr, ptr %18, align 8, !dbg !164, !tbaa !165
  %20 = getelementptr inbounds i8, ptr %17, i64 8, !dbg !168
  store ptr %19, ptr %20, align 8, !dbg !169, !tbaa !170
  %21 = load i64, ptr %0, align 8, !dbg !172, !tbaa !173
  %22 = trunc i64 %21 to i32, !dbg !174
  store i32 %22, ptr %17, align 8, !dbg !175, !tbaa !176
  tail call void @wordcount_getword(ptr noundef nonnull %17), !dbg !177
  tail call void @free(ptr noundef %17) #20, !dbg !178
  ret void, !dbg !179
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare !dbg !180 noalias noundef ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare !dbg !187 noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define dso_local void @wordcount_getword(ptr noundef readonly %0) local_unnamed_addr #2 !dbg !190 {
    #dbg_value(ptr %0, !192, !DIExpression(), !204)
    #dbg_value(ptr %0, !193, !DIExpression(), !204)
    #dbg_value(i32 1, !196, !DIExpression(), !204)
  %2 = icmp eq ptr %0, null, !dbg !205
  br i1 %2, label %3, label %4, !dbg !208

3:                                                ; preds = %1
  tail call void @__assert_fail(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1, i32 noundef 117, ptr noundef nonnull @__PRETTY_FUNCTION__.wordcount_getword) #21, !dbg !205
  unreachable, !dbg !205

4:                                                ; preds = %1
  %5 = getelementptr inbounds i8, ptr %0, i64 8, !dbg !209
  %6 = load ptr, ptr %5, align 8, !dbg !209, !tbaa !170
    #dbg_value(ptr %6, !198, !DIExpression(), !204)
    #dbg_value(ptr %6, !194, !DIExpression(), !204)
  %7 = icmp eq ptr %6, null, !dbg !210
  br i1 %7, label %13, label %8, !dbg !213

8:                                                ; preds = %4
    #dbg_value(ptr %6, !194, !DIExpression(), !204)
    #dbg_value(i32 1, !196, !DIExpression(), !204)
    #dbg_value(i32 0, !197, !DIExpression(), !204)
  %9 = load i32, ptr %0, align 8, !dbg !214, !tbaa !176
  %10 = icmp sgt i32 %9, 0, !dbg !215
  br i1 %10, label %11, label %52, !dbg !216

11:                                               ; preds = %8
  %12 = tail call ptr @__ctype_toupper_loc() #22, !dbg !204
  br label %14, !dbg !216

13:                                               ; preds = %4
  tail call void @__assert_fail(ptr noundef nonnull @.str.2, ptr noundef nonnull @.str.1, i32 noundef 121, ptr noundef nonnull @__PRETTY_FUNCTION__.wordcount_getword) #21, !dbg !210
  unreachable, !dbg !210

14:                                               ; preds = %11, %40
  %15 = phi i64 [ 0, %11 ], [ %44, %40 ]
  %16 = phi ptr [ %6, %11 ], [ %43, %40 ]
  %17 = phi i32 [ 1, %11 ], [ %42, %40 ]
    #dbg_value(ptr %16, !194, !DIExpression(), !204)
    #dbg_value(i32 %17, !196, !DIExpression(), !204)
    #dbg_value(i64 %15, !197, !DIExpression(), !204)
  %18 = load ptr, ptr %12, align 8, !dbg !217, !tbaa !149
  %19 = getelementptr inbounds i8, ptr %6, i64 %15, !dbg !217
  %20 = load i8, ptr %19, align 1, !dbg !217, !tbaa !219
  %21 = sext i8 %20 to i64, !dbg !217
  %22 = getelementptr inbounds i32, ptr %18, i64 %21, !dbg !217
  %23 = load i32, ptr %22, align 4, !dbg !217, !tbaa !151
    #dbg_value(i32 %23, !199, !DIExpression(), !220)
  %24 = trunc i32 %23 to i8, !dbg !221
    #dbg_value(i8 %24, !195, !DIExpression(), !204)
  %25 = icmp eq i32 %17, 0, !dbg !222
  br i1 %25, label %26, label %34, !dbg !222

26:                                               ; preds = %14
  store i8 %24, ptr %19, align 1, !dbg !223, !tbaa !219
  %27 = shl i32 %23, 24, !dbg !225
  %28 = ashr exact i32 %27, 24, !dbg !225
  %29 = add nsw i32 %28, -91, !dbg !227
  %30 = icmp ult i32 %29, -26, !dbg !227
  %31 = icmp ne i32 %27, 654311424
  %32 = and i1 %31, %30, !dbg !227
  br i1 %32, label %33, label %40, !dbg !227

33:                                               ; preds = %26
  store i8 0, ptr %19, align 1, !dbg !228, !tbaa !219
  tail call void @wordcount_addword(ptr noundef %16, i32 poison), !dbg !230
    #dbg_value(i32 1, !196, !DIExpression(), !204)
  br label %40, !dbg !231

34:                                               ; preds = %14
  %35 = shl i32 %23, 24, !dbg !232
  %36 = ashr exact i32 %35, 24, !dbg !232
  %37 = add nsw i32 %36, -65, !dbg !234
  %38 = icmp ult i32 %37, 26, !dbg !234
  br i1 %38, label %39, label %40, !dbg !234

39:                                               ; preds = %34
    #dbg_value(ptr %19, !194, !DIExpression(), !204)
  store i8 %24, ptr %19, align 1, !dbg !235, !tbaa !219
    #dbg_value(i32 0, !196, !DIExpression(), !204)
  br label %40, !dbg !237

40:                                               ; preds = %26, %33, %39, %34
  %41 = phi i1 [ false, %33 ], [ true, %26 ], [ true, %39 ], [ false, %34 ], !dbg !204
  %42 = phi i32 [ 1, %33 ], [ 0, %26 ], [ 0, %39 ], [ 1, %34 ], !dbg !204
  %43 = phi ptr [ %16, %33 ], [ %16, %26 ], [ %19, %39 ], [ %16, %34 ], !dbg !204
    #dbg_value(ptr %43, !194, !DIExpression(), !204)
    #dbg_value(i32 %42, !196, !DIExpression(), !204)
  %44 = add nuw nsw i64 %15, 1, !dbg !238
    #dbg_value(i64 %44, !197, !DIExpression(), !204)
  %45 = load i32, ptr %0, align 8, !dbg !214, !tbaa !176
  %46 = sext i32 %45 to i64, !dbg !215
  %47 = icmp slt i64 %44, %46, !dbg !215
  br i1 %47, label %14, label %48, !dbg !216, !llvm.loop !239

48:                                               ; preds = %40
  br i1 %41, label %49, label %52, !dbg !241

49:                                               ; preds = %48
  %50 = sext i32 %45 to i64, !dbg !242
  %51 = getelementptr inbounds i8, ptr %6, i64 %50, !dbg !242
  store i8 0, ptr %51, align 1, !dbg !245, !tbaa !219
  tail call void @wordcount_addword(ptr noundef %43, i32 poison), !dbg !246
  br label %52, !dbg !247

52:                                               ; preds = %8, %49, %48
  ret void, !dbg !248
}

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare !dbg !249 void @free(ptr allocptr nocapture noundef) local_unnamed_addr #5

; Function Attrs: noreturn nounwind
declare !dbg !250 void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #6

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare !dbg !255 ptr @__ctype_toupper_loc() local_unnamed_addr #7

; Function Attrs: nounwind uwtable
define dso_local void @wordcount_addword(ptr noundef %0, i32 %1) local_unnamed_addr #2 !dbg !264 {
    #dbg_value(ptr %0, !268, !DIExpression(), !271)
    #dbg_value(i32 poison, !269, !DIExpression(), !271)
    #dbg_value(ptr %0, !272, !DIExpression(), !281)
  %3 = load i32, ptr @use_len, align 4, !dbg !283, !tbaa !151
    #dbg_value(i32 %3, !278, !DIExpression(), !281)
    #dbg_value(i32 -1, !279, !DIExpression(), !281)
  %4 = icmp sgt i32 %3, 0, !dbg !284
  %5 = load ptr, ptr @words, align 8, !dbg !285, !tbaa !149
  br i1 %4, label %6, label %25, !dbg !288

6:                                                ; preds = %2, %16
  %7 = phi i32 [ %19, %16 ], [ -1, %2 ]
  %8 = phi i32 [ %18, %16 ], [ %3, %2 ]
    #dbg_value(i32 %7, !279, !DIExpression(), !281)
    #dbg_value(i32 %8, !278, !DIExpression(), !281)
  %9 = add nsw i32 %8, %7, !dbg !289
  %10 = sdiv i32 %9, 2, !dbg !291
    #dbg_value(i32 %10, !280, !DIExpression(), !281)
  %11 = sext i32 %10 to i64, !dbg !292
  %12 = getelementptr inbounds %struct.wc_count_t, ptr %5, i64 %11, !dbg !292
  %13 = load ptr, ptr %12, align 8, !dbg !293, !tbaa !294
  %14 = tail call i32 @strcmp(ptr noundef nonnull readonly dereferenceable(1) %0, ptr noundef nonnull dereferenceable(1) %13) #23, !dbg !295
    #dbg_value(i32 %14, !277, !DIExpression(), !281)
  %15 = icmp eq i32 %14, 0, !dbg !296
  br i1 %15, label %22, label %16, !dbg !298

16:                                               ; preds = %6
  %17 = icmp slt i32 %14, 0, !dbg !299
  %18 = select i1 %17, i32 %10, i32 %8
  %19 = select i1 %17, i32 %7, i32 %10
    #dbg_value(i32 %19, !279, !DIExpression(), !281)
    #dbg_value(i32 %18, !278, !DIExpression(), !281)
  %20 = sub nsw i32 %18, %19, !dbg !301
  %21 = icmp sgt i32 %20, 1, !dbg !284
  br i1 %21, label %6, label %22, !dbg !288, !llvm.loop !302

22:                                               ; preds = %6, %16
  %23 = phi i32 [ %18, %16 ], [ %10, %6 ], !dbg !281
    #dbg_value(i32 %23, !270, !DIExpression(), !271)
  %24 = icmp slt i32 %23, %3, !dbg !304
  br i1 %24, label %32, label %25, !dbg !305

25:                                               ; preds = %2, %22
  %26 = sext i32 %3 to i64, !dbg !285
  %27 = getelementptr inbounds %struct.wc_count_t, ptr %5, i64 %26, !dbg !285
  store ptr %0, ptr %27, align 8, !dbg !306, !tbaa !294
  %28 = load ptr, ptr @words, align 8, !dbg !307, !tbaa !149
  %29 = getelementptr inbounds %struct.wc_count_t, ptr %28, i64 %26, i32 1, !dbg !308
  store i32 1, ptr %29, align 8, !dbg !309, !tbaa !127
  %30 = load i32, ptr @use_len, align 4, !dbg !310, !tbaa !151
  %31 = add nsw i32 %30, 1, !dbg !310
  store i32 %31, ptr @use_len, align 4, !dbg !310, !tbaa !151
  br label %63, !dbg !311

32:                                               ; preds = %22
  %33 = icmp slt i32 %23, 0, !dbg !312
  br i1 %33, label %34, label %41, !dbg !314

34:                                               ; preds = %32
  %35 = getelementptr inbounds i8, ptr %5, i64 16, !dbg !315
  %36 = zext nneg i32 %3 to i64, !dbg !317
  %37 = shl nuw nsw i64 %36, 4, !dbg !318
  tail call void @llvm.memmove.p0.p0.i64(ptr nonnull align 8 %35, ptr align 8 %5, i64 %37, i1 false), !dbg !319
  store ptr %0, ptr %5, align 8, !dbg !320, !tbaa !294
  %38 = load ptr, ptr @words, align 8, !dbg !321, !tbaa !149
  %39 = getelementptr inbounds i8, ptr %38, i64 8, !dbg !322
  store i32 1, ptr %39, align 8, !dbg !323, !tbaa !127
  %40 = add nuw nsw i32 %3, 1, !dbg !324
  store i32 %40, ptr @use_len, align 4, !dbg !324, !tbaa !151
  br label %63, !dbg !325

41:                                               ; preds = %32
  %42 = zext nneg i32 %23 to i64, !dbg !326
  %43 = getelementptr inbounds %struct.wc_count_t, ptr %5, i64 %42, !dbg !326
  %44 = load ptr, ptr %43, align 8, !dbg !328, !tbaa !294
  %45 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(1) %44) #23, !dbg !329
  %46 = icmp eq i32 %45, 0, !dbg !330
  br i1 %46, label %47, label %52, !dbg !331

47:                                               ; preds = %41
  %48 = getelementptr inbounds i8, ptr %43, i64 8, !dbg !332
  %49 = load i32, ptr %48, align 8, !dbg !334, !tbaa !127
  %50 = add nsw i32 %49, 1, !dbg !334
  store i32 %50, ptr %48, align 8, !dbg !334, !tbaa !127
  %51 = load i32, ptr @use_len, align 4, !dbg !335, !tbaa !151
  br label %63, !dbg !337

52:                                               ; preds = %41
  %53 = getelementptr inbounds i8, ptr %43, i64 16, !dbg !338
  %54 = sub nsw i32 %3, %23, !dbg !340
  %55 = sext i32 %54 to i64, !dbg !341
  %56 = shl nsw i64 %55, 4, !dbg !342
  tail call void @llvm.memmove.p0.p0.i64(ptr nonnull align 8 %53, ptr nonnull align 8 %43, i64 %56, i1 false), !dbg !343
  %57 = load ptr, ptr @words, align 8, !dbg !344, !tbaa !149
  %58 = getelementptr inbounds %struct.wc_count_t, ptr %57, i64 %42, !dbg !344
  store ptr %0, ptr %58, align 8, !dbg !345, !tbaa !294
  %59 = load ptr, ptr @words, align 8, !dbg !346, !tbaa !149
  %60 = getelementptr inbounds %struct.wc_count_t, ptr %59, i64 %42, i32 1, !dbg !347
  store i32 1, ptr %60, align 8, !dbg !348, !tbaa !127
  %61 = load i32, ptr @use_len, align 4, !dbg !349, !tbaa !151
  %62 = add nsw i32 %61, 1, !dbg !349
  store i32 %62, ptr @use_len, align 4, !dbg !349, !tbaa !151
  br label %63

63:                                               ; preds = %34, %52, %47, %25
  %64 = phi ptr [ %38, %34 ], [ %59, %52 ], [ %5, %47 ], [ %28, %25 ]
  %65 = phi i32 [ %40, %34 ], [ %62, %52 ], [ %51, %47 ], [ %31, %25 ], !dbg !335
  %66 = load i32, ptr @length, align 4, !dbg !350, !tbaa !151
  %67 = icmp eq i32 %65, %66, !dbg !351
  br i1 %67, label %68, label %73, !dbg !352

68:                                               ; preds = %63
  %69 = shl nsw i32 %65, 1, !dbg !353
  store i32 %69, ptr @length, align 4, !dbg !353, !tbaa !151
  %70 = sext i32 %69 to i64, !dbg !355
  %71 = shl nsw i64 %70, 4, !dbg !356
  %72 = tail call ptr @realloc(ptr noundef nonnull %64, i64 noundef %71) #24, !dbg !357
  store ptr %72, ptr @words, align 8, !dbg !358, !tbaa !149
  br label %73, !dbg !359

73:                                               ; preds = %68, %63
  ret void, !dbg !360
}

; Function Attrs: nofree nounwind memory(read, inaccessiblemem: none) uwtable
define dso_local i32 @dobsearch(ptr nocapture noundef readonly %0) local_unnamed_addr #8 !dbg !273 {
    #dbg_value(ptr %0, !272, !DIExpression(), !361)
  %2 = load i32, ptr @use_len, align 4, !dbg !362, !tbaa !151
    #dbg_value(i32 %2, !278, !DIExpression(), !361)
    #dbg_value(i32 -1, !279, !DIExpression(), !361)
  %3 = icmp sgt i32 %2, 0, !dbg !363
  br i1 %3, label %4, label %22, !dbg !364

4:                                                ; preds = %1
  %5 = load ptr, ptr @words, align 8, !tbaa !149
  br label %6, !dbg !364

6:                                                ; preds = %4, %16
  %7 = phi i32 [ -1, %4 ], [ %19, %16 ]
  %8 = phi i32 [ %2, %4 ], [ %18, %16 ]
    #dbg_value(i32 %7, !279, !DIExpression(), !361)
    #dbg_value(i32 %8, !278, !DIExpression(), !361)
  %9 = add nsw i32 %7, %8, !dbg !365
  %10 = sdiv i32 %9, 2, !dbg !366
    #dbg_value(i32 %10, !280, !DIExpression(), !361)
  %11 = sext i32 %10 to i64, !dbg !367
  %12 = getelementptr inbounds %struct.wc_count_t, ptr %5, i64 %11, !dbg !367
  %13 = load ptr, ptr %12, align 8, !dbg !368, !tbaa !294
  %14 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(1) %13) #23, !dbg !369
    #dbg_value(i32 %14, !277, !DIExpression(), !361)
  %15 = icmp eq i32 %14, 0, !dbg !370
  br i1 %15, label %22, label %16, !dbg !371

16:                                               ; preds = %6
  %17 = icmp slt i32 %14, 0, !dbg !372
  %18 = select i1 %17, i32 %10, i32 %8
  %19 = select i1 %17, i32 %7, i32 %10
    #dbg_value(i32 %19, !279, !DIExpression(), !361)
    #dbg_value(i32 %18, !278, !DIExpression(), !361)
  %20 = sub nsw i32 %18, %19, !dbg !373
  %21 = icmp sgt i32 %20, 1, !dbg !363
  br i1 %21, label %6, label %22, !dbg !364, !llvm.loop !374

22:                                               ; preds = %6, %16, %1
  %23 = phi i32 [ %2, %1 ], [ %18, %16 ], [ %10, %6 ], !dbg !361
  ret i32 %23, !dbg !376
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare !dbg !377 i32 @strcmp(ptr nocapture noundef, ptr nocapture noundef) local_unnamed_addr #9

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #10

; Function Attrs: mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite)
declare !dbg !381 noalias noundef ptr @realloc(ptr allocptr nocapture noundef, i64 noundef) local_unnamed_addr #11

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #2 !dbg !384 {
  %3 = alloca %struct.stat, align 8, !DIAssignID !439
    #dbg_assign(i1 undef, !394, !DIExpression(), !439, ptr %3, !DIExpression(), !440)
    #dbg_value(i32 %0, !388, !DIExpression(), !440)
    #dbg_value(ptr %1, !389, !DIExpression(), !440)
  call void @llvm.lifetime.start.p0(i64 144, ptr nonnull %3) #20, !dbg !441
  %4 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !442
  %5 = load ptr, ptr %4, align 8, !dbg !442, !tbaa !149
  %6 = icmp eq ptr %5, null, !dbg !444
  br i1 %6, label %7, label %10, !dbg !445

7:                                                ; preds = %2
  %8 = load ptr, ptr %1, align 8, !dbg !446, !tbaa !149
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, ptr noundef %8), !dbg !448
  tail call void @exit(i32 noundef 1) #21, !dbg !449
  unreachable, !dbg !449

10:                                               ; preds = %2
    #dbg_value(ptr %5, !432, !DIExpression(), !440)
  %11 = getelementptr inbounds i8, ptr %1, i64 16, !dbg !450
  %12 = load ptr, ptr %11, align 8, !dbg !450, !tbaa !149
    #dbg_value(ptr %12, !433, !DIExpression(), !440)
  %13 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !451
  %14 = tail call i32 (ptr, i32, ...) @open(ptr noundef nonnull %5, i32 noundef 0) #20, !dbg !452
    #dbg_value(i32 %14, !391, !DIExpression(), !440)
  %15 = icmp slt i32 %14, 0, !dbg !452
  br i1 %15, label %16, label %17, !dbg !454

16:                                               ; preds = %10
  tail call void @perror(ptr noundef nonnull @.str.5) #25, !dbg !455
  tail call void @exit(i32 noundef 1) #21, !dbg !455
  unreachable, !dbg !455

17:                                               ; preds = %10
  %18 = call i32 @fstat(i32 noundef %14, ptr noundef nonnull %3) #20, !dbg !457
  %19 = icmp slt i32 %18, 0, !dbg !457
  br i1 %19, label %20, label %21, !dbg !459

20:                                               ; preds = %17
  tail call void @perror(ptr noundef nonnull @.str.6) #25, !dbg !460
  tail call void @exit(i32 noundef 1) #21, !dbg !460
  unreachable, !dbg !460

21:                                               ; preds = %17
  %22 = getelementptr inbounds i8, ptr %3, i64 48, !dbg !462
  %23 = load i64, ptr %22, align 8, !dbg !462, !tbaa !464
  %24 = add nsw i64 %23, 1, !dbg !462
  %25 = tail call ptr @mmap(ptr noundef null, i64 noundef %24, i32 noundef 3, i32 noundef 2, i32 noundef %14, i64 noundef 0) #20, !dbg !462
    #dbg_value(ptr %25, !392, !DIExpression(), !440)
  %26 = icmp eq ptr %25, null, !dbg !462
  br i1 %26, label %27, label %28, !dbg !467

27:                                               ; preds = %21
  tail call void @perror(ptr noundef nonnull @.str.7) #25, !dbg !468
  tail call void @exit(i32 noundef 1) #21, !dbg !468
  unreachable, !dbg !468

28:                                               ; preds = %21
  %29 = icmp eq ptr %12, null, !dbg !470
  br i1 %29, label %35, label %30, !dbg !470

30:                                               ; preds = %28
    #dbg_value(ptr %12, !472, !DIExpression(), !477)
  %31 = tail call i64 @strtol(ptr nocapture noundef nonnull %12, ptr noundef null, i32 noundef 10) #20, !dbg !479
  %32 = trunc i64 %31 to i32, !dbg !480
    #dbg_value(i32 %32, !393, !DIExpression(), !440)
  %33 = icmp slt i32 %32, 1, !dbg !470
  br i1 %33, label %34, label %35, !dbg !481

34:                                               ; preds = %30
  tail call void @perror(ptr noundef nonnull @.str.8) #25, !dbg !482
  tail call void @exit(i32 noundef 1) #21, !dbg !482
  unreachable, !dbg !482

35:                                               ; preds = %28, %30
    #dbg_value(i64 %23, !434, !DIExpression(DW_OP_LLVM_fragment, 0, 64), !440)
    #dbg_value(ptr %25, !434, !DIExpression(DW_OP_LLVM_fragment, 64, 64), !440)
  %36 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.12), !dbg !484
    #dbg_value(ptr undef, !142, !DIExpression(), !485)
    #dbg_value(ptr undef, !144, !DIExpression(), !485)
  %37 = tail call noalias dereferenceable_or_null(32000) ptr @calloc(i64 noundef 2000, i64 noundef 16) #18, !dbg !487
  store ptr %37, ptr @words, align 8, !dbg !488, !tbaa !149
  store i32 2000, ptr @length, align 4, !dbg !489, !tbaa !151
  store i32 0, ptr @use_len, align 4, !dbg !490, !tbaa !151
    #dbg_value(i32 0, !143, !DIExpression(), !485)
  br label %38, !dbg !491

38:                                               ; preds = %38, %35
  %39 = phi i64 [ 0, %35 ], [ %49, %38 ]
    #dbg_value(i64 %39, !143, !DIExpression(), !485)
  %40 = getelementptr inbounds %struct.wc_count_t, ptr %37, i64 %39, i32 1, !dbg !492
  store i32 0, ptr %40, align 8, !dbg !493, !tbaa !127
  %41 = add nuw nsw i64 %39, 1, !dbg !494
    #dbg_value(i64 %41, !143, !DIExpression(), !485)
  %42 = getelementptr inbounds %struct.wc_count_t, ptr %37, i64 %41, i32 1, !dbg !492
  store i32 0, ptr %42, align 8, !dbg !493, !tbaa !127
  %43 = add nuw nsw i64 %39, 2, !dbg !494
    #dbg_value(i64 %43, !143, !DIExpression(), !485)
  %44 = getelementptr inbounds %struct.wc_count_t, ptr %37, i64 %43, i32 1, !dbg !492
  store i32 0, ptr %44, align 8, !dbg !493, !tbaa !127
  %45 = add nuw nsw i64 %39, 3, !dbg !494
    #dbg_value(i64 %45, !143, !DIExpression(), !485)
  %46 = getelementptr inbounds %struct.wc_count_t, ptr %37, i64 %45, i32 1, !dbg !492
  store i32 0, ptr %46, align 8, !dbg !493, !tbaa !127
  %47 = add nuw nsw i64 %39, 4, !dbg !494
    #dbg_value(i64 %47, !143, !DIExpression(), !485)
  %48 = getelementptr inbounds %struct.wc_count_t, ptr %37, i64 %47, i32 1, !dbg !492
  store i32 0, ptr %48, align 8, !dbg !493, !tbaa !127
  %49 = add nuw nsw i64 %39, 5, !dbg !494
    #dbg_value(i64 %49, !143, !DIExpression(), !485)
  %50 = icmp eq i64 %49, 2000, !dbg !495
  br i1 %50, label %51, label %38, !dbg !491, !llvm.loop !496

51:                                               ; preds = %38
  %52 = tail call noalias dereferenceable_or_null(16) ptr @malloc(i64 noundef 16) #19, !dbg !498
    #dbg_value(ptr %52, !145, !DIExpression(), !485)
  %53 = getelementptr inbounds i8, ptr %52, i64 8, !dbg !499
  store ptr %25, ptr %53, align 8, !dbg !500, !tbaa !170
  %54 = trunc i64 %23 to i32, !dbg !501
  store i32 %54, ptr %52, align 8, !dbg !502, !tbaa !176
  tail call void @wordcount_getword(ptr noundef nonnull %52), !dbg !503
  tail call void @free(ptr noundef %52) #20, !dbg !504
  %55 = load ptr, ptr @words, align 8, !dbg !505, !tbaa !149
  %56 = load i32, ptr @use_len, align 4, !dbg !506, !tbaa !151
  %57 = sext i32 %56 to i64, !dbg !506
  tail call void @qsort(ptr noundef %55, i64 noundef %57, i64 noundef 16, ptr noundef nonnull @wordcount_cmp) #20, !dbg !507
    #dbg_value(i32 0, !390, !DIExpression(), !440)
    #dbg_value(i32 poison, !390, !DIExpression(), !440)
  %58 = load ptr, ptr @words, align 8, !dbg !508, !tbaa !149
  tail call void @free(ptr noundef %58) #20, !dbg !509
  %59 = tail call i32 @munmap(ptr noundef nonnull %25, i64 noundef %24) #20, !dbg !510
  %60 = icmp slt i32 %59, 0, !dbg !510
  br i1 %60, label %61, label %62, !dbg !512

61:                                               ; preds = %51
  tail call void @perror(ptr noundef nonnull @.str.10) #25, !dbg !513
  tail call void @exit(i32 noundef 1) #21, !dbg !513
  unreachable, !dbg !513

62:                                               ; preds = %51
  %63 = tail call i32 @close(i32 noundef %14) #20, !dbg !515
  %64 = icmp slt i32 %63, 0, !dbg !515
  br i1 %64, label %65, label %66, !dbg !517

65:                                               ; preds = %62
  tail call void @perror(ptr noundef nonnull @.str.11) #25, !dbg !518
  tail call void @exit(i32 noundef 1) #21, !dbg !518
  unreachable, !dbg !518

66:                                               ; preds = %62
  call void @llvm.lifetime.end.p0(i64 144, ptr nonnull %3) #20, !dbg !520
  ret i32 0, !dbg !521
}

; Function Attrs: nofree nounwind
declare !dbg !522 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #12

; Function Attrs: noreturn nounwind
declare !dbg !527 void @exit(i32 noundef) local_unnamed_addr #6

; Function Attrs: nofree
declare !dbg !530 noundef i32 @open(ptr nocapture noundef readonly, i32 noundef, ...) local_unnamed_addr #13

; Function Attrs: nofree nounwind
declare !dbg !534 void @perror(ptr nocapture noundef readonly) local_unnamed_addr #12

; Function Attrs: nofree nounwind
declare !dbg !537 noundef i32 @fstat(i32 noundef, ptr nocapture noundef) local_unnamed_addr #12

; Function Attrs: nounwind
declare !dbg !542 ptr @mmap(ptr noundef, i64 noundef, i32 noundef, i32 noundef, i32 noundef, i64 noundef) local_unnamed_addr #14

; Function Attrs: nofree
declare !dbg !546 void @qsort(ptr noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #13

; Function Attrs: nounwind
declare !dbg !551 i32 @munmap(ptr noundef, i64 noundef) local_unnamed_addr #14

declare !dbg !554 i32 @close(i32 noundef) local_unnamed_addr #15

; Function Attrs: mustprogress nofree nounwind willreturn
declare !dbg !558 i64 @strtol(ptr noundef readonly, ptr nocapture noundef, i32 noundef) local_unnamed_addr #16

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #17

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree nosync nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind memory(read, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #11 = { mustprogress nounwind willreturn allockind("realloc") allocsize(1) memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nofree "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { mustprogress nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { nofree nounwind }
attributes #18 = { nounwind allocsize(0,1) }
attributes #19 = { nounwind allocsize(0) }
attributes #20 = { nounwind }
attributes #21 = { noreturn nounwind }
attributes #22 = { nounwind willreturn memory(none) }
attributes #23 = { nounwind willreturn memory(read) }
attributes #24 = { nounwind allocsize(1) }
attributes #25 = { cold }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!105, !106, !107, !108, !109, !110, !111}
!llvm.ident = !{!112}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "words", scope: !2, file: !6, line: 62, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !11, globals: !37, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/word_count/wordcount_serial.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/word_count", checksumkind: CSK_MD5, checksum: "9f6517eec75b03545ba9e924d0861880")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 57, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "wordcount_serial.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/word_count", checksumkind: CSK_MD5, checksum: "9f6517eec75b03545ba9e924d0861880")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10}
!9 = !DIEnumerator(name: "IN_WORD", value: 0)
!10 = !DIEnumerator(name: "NOT_IN_WORD", value: 1)
!11 = !{!12, !21, !28, !17, !20, !35, !36}
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "wc_count_t", file: !6, line: 50, baseType: !14)
!14 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 47, size: 128, elements: !15)
!15 = !{!16, !19}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "word", scope: !14, file: !6, line: 48, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !14, file: !6, line: 49, baseType: !20, size: 32, offset: 64)
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "wc_data_t", file: !6, line: 55, baseType: !23)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 52, size: 128, elements: !24)
!24 = !{!25, !27}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "flen", scope: !23, file: !6, line: 53, baseType: !26, size: 64)
!26 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "fdata", scope: !23, file: !6, line: 54, baseType: !17, size: 64, offset: 64)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "map_args_t", file: !30, line: 42, baseType: !31)
!30 = !DIFile(filename: "MapReduceScheduler.h", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/phoenix/word_count", checksumkind: CSK_MD5, checksum: "5eaabbd43096151cc579dd245d93ee2f")
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !30, line: 38, size: 128, elements: !32)
!32 = !{!33, !34}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "length", scope: !31, file: !30, line: 40, baseType: !20, size: 32)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !31, file: !30, line: 41, baseType: !35, size: 64, offset: 64)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!37 = !{!38, !43, !48, !54, !56, !61, !66, !71, !76, !81, !86, !91, !96, !0, !101, !103}
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(scope: null, file: !6, line: 117, type: !40, isLocal: true, isDefinition: true)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 40, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 5)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(scope: null, file: !6, line: 117, type: !45, isLocal: true, isDefinition: true)
!45 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 880, elements: !46)
!46 = !{!47}
!47 = !DISubrange(count: 110)
!48 = !DIGlobalVariableExpression(var: !49, expr: !DIExpression())
!49 = distinct !DIGlobalVariable(scope: null, file: !6, line: 117, type: !50, isLocal: true, isDefinition: true)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 248, elements: !52)
!51 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !18)
!52 = !{!53}
!53 = !DISubrange(count: 31)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(scope: null, file: !6, line: 121, type: !40, isLocal: true, isDefinition: true)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(scope: null, file: !6, line: 240, type: !58, isLocal: true, isDefinition: true)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 416, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 52)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(scope: null, file: !6, line: 247, type: !63, isLocal: true, isDefinition: true)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 184, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 23)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(scope: null, file: !6, line: 250, type: !68, isLocal: true, isDefinition: true)
!68 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 472, elements: !69)
!69 = !{!70}
!70 = !DISubrange(count: 59)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(scope: null, file: !6, line: 252, type: !73, isLocal: true, isDefinition: true)
!73 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 384, elements: !74)
!74 = !{!75}
!75 = !DISubrange(count: 48)
!76 = !DIGlobalVariableExpression(var: !77, expr: !DIExpression())
!77 = distinct !DIGlobalVariable(scope: null, file: !6, line: 254, type: !78, isLocal: true, isDefinition: true)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 920, elements: !79)
!79 = !{!80}
!80 = !DISubrange(count: 115)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(scope: null, file: !6, line: 258, type: !83, isLocal: true, isDefinition: true)
!83 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 856, elements: !84)
!84 = !{!85}
!85 = !DISubrange(count: 107)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(scope: null, file: !6, line: 266, type: !88, isLocal: true, isDefinition: true)
!88 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 216, elements: !89)
!89 = !{!90}
!90 = !DISubrange(count: 27)
!91 = !DIGlobalVariableExpression(var: !92, expr: !DIExpression())
!92 = distinct !DIGlobalVariable(scope: null, file: !6, line: 282, type: !93, isLocal: true, isDefinition: true)
!93 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 504, elements: !94)
!94 = !{!95}
!95 = !DISubrange(count: 63)
!96 = !DIGlobalVariableExpression(var: !97, expr: !DIExpression())
!97 = distinct !DIGlobalVariable(scope: null, file: !6, line: 283, type: !98, isLocal: true, isDefinition: true)
!98 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 320, elements: !99)
!99 = !{!100}
!100 = !DISubrange(count: 40)
!101 = !DIGlobalVariableExpression(var: !102, expr: !DIExpression())
!102 = distinct !DIGlobalVariable(name: "use_len", scope: !2, file: !6, line: 63, type: !20, isLocal: false, isDefinition: true)
!103 = !DIGlobalVariableExpression(var: !104, expr: !DIExpression())
!104 = distinct !DIGlobalVariable(name: "length", scope: !2, file: !6, line: 64, type: !20, isLocal: false, isDefinition: true)
!105 = !{i32 7, !"Dwarf Version", i32 5}
!106 = !{i32 2, !"Debug Info Version", i32 3}
!107 = !{i32 1, !"wchar_size", i32 4}
!108 = !{i32 8, !"PIC Level", i32 2}
!109 = !{i32 7, !"PIE Level", i32 2}
!110 = !{i32 7, !"uwtable", i32 2}
!111 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!112 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!113 = distinct !DISubprogram(name: "wordcount_cmp", scope: !6, file: !6, line: 72, type: !114, scopeLine: 73, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !118)
!114 = !DISubroutineType(types: !115)
!115 = !{!20, !116, !116}
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!118 = !{!119, !120, !121, !122, !123, !124}
!119 = !DILocalVariable(name: "v1", arg: 1, scope: !113, file: !6, line: 72, type: !116)
!120 = !DILocalVariable(name: "v2", arg: 2, scope: !113, file: !6, line: 72, type: !116)
!121 = !DILocalVariable(name: "w1", scope: !113, file: !6, line: 74, type: !12)
!122 = !DILocalVariable(name: "w2", scope: !113, file: !6, line: 75, type: !12)
!123 = !DILocalVariable(name: "i1", scope: !113, file: !6, line: 77, type: !20)
!124 = !DILocalVariable(name: "i2", scope: !113, file: !6, line: 78, type: !20)
!125 = !DILocation(line: 0, scope: !113)
!126 = !DILocation(line: 77, column: 17, scope: !113)
!127 = !{!128, !132, i64 8}
!128 = !{!"", !129, i64 0, !132, i64 8}
!129 = !{!"any pointer", !130, i64 0}
!130 = !{!"omnipotent char", !131, i64 0}
!131 = !{!"Simple C/C++ TBAA"}
!132 = !{!"int", !130, i64 0}
!133 = !DILocation(line: 78, column: 17, scope: !113)
!134 = !DILocation(line: 80, column: 11, scope: !135)
!135 = distinct !DILexicalBlock(scope: !113, file: !6, line: 80, column: 8)
!136 = !DILocation(line: 80, column: 8, scope: !113)
!137 = !DILocation(line: 83, column: 1, scope: !113)
!138 = distinct !DISubprogram(name: "wordcount_splitter", scope: !6, file: !6, line: 88, type: !139, scopeLine: 89, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !141)
!139 = !DISubroutineType(types: !140)
!140 = !{null, !35}
!141 = !{!142, !143, !144, !145}
!142 = !DILocalVariable(name: "data_in", arg: 1, scope: !138, file: !6, line: 88, type: !35)
!143 = !DILocalVariable(name: "i", scope: !138, file: !6, line: 90, type: !20)
!144 = !DILocalVariable(name: "data", scope: !138, file: !6, line: 91, type: !21)
!145 = !DILocalVariable(name: "out", scope: !138, file: !6, line: 99, type: !28)
!146 = !DILocation(line: 0, scope: !138)
!147 = !DILocation(line: 92, column: 25, scope: !138)
!148 = !DILocation(line: 92, column: 10, scope: !138)
!149 = !{!129, !129, i64 0}
!150 = !DILocation(line: 93, column: 11, scope: !138)
!151 = !{!132, !132, i64 0}
!152 = !DILocation(line: 94, column: 12, scope: !138)
!153 = !DILocation(line: 96, column: 4, scope: !154)
!154 = distinct !DILexicalBlock(scope: !138, file: !6, line: 96, column: 4)
!155 = !DILocation(line: 97, column: 14, scope: !156)
!156 = distinct !DILexicalBlock(scope: !154, file: !6, line: 96, column: 4)
!157 = !DILocation(line: 97, column: 20, scope: !156)
!158 = !DILocation(line: 96, column: 32, scope: !156)
!159 = !DILocation(line: 96, column: 13, scope: !156)
!160 = distinct !{!160, !153, !161, !162}
!161 = !DILocation(line: 97, column: 22, scope: !154)
!162 = !{!"llvm.loop.mustprogress"}
!163 = !DILocation(line: 99, column: 35, scope: !138)
!164 = !DILocation(line: 100, column: 22, scope: !138)
!165 = !{!166, !129, i64 8}
!166 = !{!"", !167, i64 0, !129, i64 8}
!167 = !{!"long", !130, i64 0}
!168 = !DILocation(line: 100, column: 9, scope: !138)
!169 = !DILocation(line: 100, column: 14, scope: !138)
!170 = !{!171, !129, i64 8}
!171 = !{!"", !132, i64 0, !129, i64 8}
!172 = !DILocation(line: 101, column: 24, scope: !138)
!173 = !{!166, !167, i64 0}
!174 = !DILocation(line: 101, column: 18, scope: !138)
!175 = !DILocation(line: 101, column: 16, scope: !138)
!176 = !{!171, !132, i64 0}
!177 = !DILocation(line: 103, column: 4, scope: !138)
!178 = !DILocation(line: 104, column: 4, scope: !138)
!179 = !DILocation(line: 105, column: 1, scope: !138)
!180 = !DISubprogram(name: "calloc", scope: !181, file: !181, line: 543, type: !182, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!181 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!182 = !DISubroutineType(types: !183)
!183 = !{!35, !184, !184}
!184 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !185, line: 18, baseType: !186)
!185 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!186 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!187 = !DISubprogram(name: "malloc", scope: !181, file: !181, line: 540, type: !188, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!188 = !DISubroutineType(types: !189)
!189 = !{!35, !184}
!190 = distinct !DISubprogram(name: "wordcount_getword", scope: !6, file: !6, line: 110, type: !139, scopeLine: 111, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !191)
!191 = !{!192, !193, !194, !195, !196, !197, !198, !199}
!192 = !DILocalVariable(name: "args_in", arg: 1, scope: !190, file: !6, line: 110, type: !35)
!193 = !DILocalVariable(name: "args", scope: !190, file: !6, line: 112, type: !28)
!194 = !DILocalVariable(name: "curr_start", scope: !190, file: !6, line: 114, type: !17)
!195 = !DILocalVariable(name: "curr_ltr", scope: !190, file: !6, line: 114, type: !18)
!196 = !DILocalVariable(name: "state", scope: !190, file: !6, line: 115, type: !20)
!197 = !DILocalVariable(name: "i", scope: !190, file: !6, line: 116, type: !20)
!198 = !DILocalVariable(name: "data", scope: !190, file: !6, line: 119, type: !17)
!199 = !DILocalVariable(name: "__res", scope: !200, file: !6, line: 127, type: !20)
!200 = distinct !DILexicalBlock(scope: !201, file: !6, line: 127, column: 18)
!201 = distinct !DILexicalBlock(scope: !202, file: !6, line: 126, column: 4)
!202 = distinct !DILexicalBlock(scope: !203, file: !6, line: 125, column: 4)
!203 = distinct !DILexicalBlock(scope: !190, file: !6, line: 125, column: 4)
!204 = !DILocation(line: 0, scope: !190)
!205 = !DILocation(line: 117, column: 4, scope: !206)
!206 = distinct !DILexicalBlock(scope: !207, file: !6, line: 117, column: 4)
!207 = distinct !DILexicalBlock(scope: !190, file: !6, line: 117, column: 4)
!208 = !DILocation(line: 117, column: 4, scope: !207)
!209 = !DILocation(line: 119, column: 32, scope: !190)
!210 = !DILocation(line: 121, column: 4, scope: !211)
!211 = distinct !DILexicalBlock(scope: !212, file: !6, line: 121, column: 4)
!212 = distinct !DILexicalBlock(scope: !190, file: !6, line: 121, column: 4)
!213 = !DILocation(line: 121, column: 4, scope: !212)
!214 = !DILocation(line: 125, column: 26, scope: !202)
!215 = !DILocation(line: 125, column: 18, scope: !202)
!216 = !DILocation(line: 125, column: 4, scope: !203)
!217 = !DILocation(line: 127, column: 18, scope: !218)
!218 = distinct !DILexicalBlock(scope: !200, file: !6, line: 127, column: 18)
!219 = !{!130, !130, i64 0}
!220 = !DILocation(line: 0, scope: !200)
!221 = !DILocation(line: 127, column: 18, scope: !201)
!222 = !DILocation(line: 128, column: 7, scope: !201)
!223 = !DILocation(line: 131, column: 18, scope: !224)
!224 = distinct !DILexicalBlock(scope: !201, file: !6, line: 129, column: 7)
!225 = !DILocation(line: 132, column: 15, scope: !226)
!226 = distinct !DILexicalBlock(scope: !224, file: !6, line: 132, column: 14)
!227 = !DILocation(line: 132, column: 30, scope: !226)
!228 = !DILocation(line: 134, column: 21, scope: !229)
!229 = distinct !DILexicalBlock(scope: !226, file: !6, line: 133, column: 10)
!230 = !DILocation(line: 136, column: 4, scope: !229)
!231 = !DILocation(line: 138, column: 10, scope: !229)
!232 = !DILocation(line: 143, column: 14, scope: !233)
!233 = distinct !DILexicalBlock(scope: !224, file: !6, line: 143, column: 14)
!234 = !DILocation(line: 143, column: 30, scope: !233)
!235 = !DILocation(line: 146, column: 21, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !6, line: 144, column: 10)
!237 = !DILocation(line: 148, column: 10, scope: !236)
!238 = !DILocation(line: 125, column: 35, scope: !202)
!239 = distinct !{!239, !216, !240, !162}
!240 = !DILocation(line: 151, column: 4, scope: !203)
!241 = !DILocation(line: 154, column: 8, scope: !190)
!242 = !DILocation(line: 156, column: 4, scope: !243)
!243 = distinct !DILexicalBlock(scope: !244, file: !6, line: 155, column: 4)
!244 = distinct !DILexicalBlock(scope: !190, file: !6, line: 154, column: 8)
!245 = !DILocation(line: 156, column: 23, scope: !243)
!246 = !DILocation(line: 158, column: 4, scope: !243)
!247 = !DILocation(line: 159, column: 4, scope: !243)
!248 = !DILocation(line: 160, column: 1, scope: !190)
!249 = !DISubprogram(name: "free", scope: !181, file: !181, line: 555, type: !139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!250 = !DISubprogram(name: "__assert_fail", scope: !251, file: !251, line: 69, type: !252, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!251 = !DIFile(filename: "/usr/include/assert.h", directory: "", checksumkind: CSK_MD5, checksum: "ab7dc6991d501750085448b20099a5a0")
!252 = !DISubroutineType(types: !253)
!253 = !{null, !254, !254, !7, !254}
!254 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!255 = !DISubprogram(name: "__ctype_toupper_loc", scope: !256, file: !256, line: 83, type: !257, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!256 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "3ab3dd7fdf2578005732722ee2393e59")
!257 = !DISubroutineType(types: !258)
!258 = !{!259}
!259 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !260, size: 64)
!260 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !261, size: 64)
!261 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !262)
!262 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !263, line: 41, baseType: !20)
!263 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!264 = distinct !DISubprogram(name: "wordcount_addword", scope: !6, file: !6, line: 188, type: !265, scopeLine: 189, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !267)
!265 = !DISubroutineType(types: !266)
!266 = !{null, !17, !20}
!267 = !{!268, !269, !270}
!268 = !DILocalVariable(name: "word", arg: 1, scope: !264, file: !6, line: 188, type: !17)
!269 = !DILocalVariable(name: "len", arg: 2, scope: !264, file: !6, line: 188, type: !20)
!270 = !DILocalVariable(name: "pos", scope: !264, file: !6, line: 190, type: !20)
!271 = !DILocation(line: 0, scope: !264)
!272 = !DILocalVariable(name: "word", arg: 1, scope: !273, file: !6, line: 165, type: !17)
!273 = distinct !DISubprogram(name: "dobsearch", scope: !6, file: !6, line: 165, type: !274, scopeLine: 166, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !276)
!274 = !DISubroutineType(types: !275)
!275 = !{!20, !17}
!276 = !{!272, !277, !278, !279, !280}
!277 = !DILocalVariable(name: "cmp", scope: !273, file: !6, line: 167, type: !20)
!278 = !DILocalVariable(name: "high", scope: !273, file: !6, line: 167, type: !20)
!279 = !DILocalVariable(name: "low", scope: !273, file: !6, line: 167, type: !20)
!280 = !DILocalVariable(name: "next", scope: !273, file: !6, line: 167, type: !20)
!281 = !DILocation(line: 0, scope: !273, inlinedAt: !282)
!282 = distinct !DILocation(line: 190, column: 12, scope: !264)
!283 = !DILocation(line: 167, column: 20, scope: !273, inlinedAt: !282)
!284 = !DILocation(line: 170, column: 22, scope: !273, inlinedAt: !282)
!285 = !DILocation(line: 195, column: 7, scope: !286)
!286 = distinct !DILexicalBlock(scope: !287, file: !6, line: 193, column: 4)
!287 = distinct !DILexicalBlock(scope: !264, file: !6, line: 192, column: 8)
!288 = !DILocation(line: 170, column: 4, scope: !273, inlinedAt: !282)
!289 = !DILocation(line: 172, column: 21, scope: !290, inlinedAt: !282)
!290 = distinct !DILexicalBlock(scope: !273, file: !6, line: 171, column: 4)
!291 = !DILocation(line: 172, column: 28, scope: !290, inlinedAt: !282)
!292 = !DILocation(line: 173, column: 27, scope: !290, inlinedAt: !282)
!293 = !DILocation(line: 173, column: 39, scope: !290, inlinedAt: !282)
!294 = !{!128, !129, i64 0}
!295 = !DILocation(line: 173, column: 14, scope: !290, inlinedAt: !282)
!296 = !DILocation(line: 174, column: 16, scope: !297, inlinedAt: !282)
!297 = distinct !DILexicalBlock(scope: !290, file: !6, line: 174, column: 12)
!298 = !DILocation(line: 174, column: 12, scope: !290, inlinedAt: !282)
!299 = !DILocation(line: 176, column: 21, scope: !300, inlinedAt: !282)
!300 = distinct !DILexicalBlock(scope: !297, file: !6, line: 176, column: 17)
!301 = !DILocation(line: 170, column: 16, scope: !273, inlinedAt: !282)
!302 = distinct !{!302, !288, !303, !162}
!303 = !DILocation(line: 180, column: 4, scope: !273, inlinedAt: !282)
!304 = !DILocation(line: 192, column: 12, scope: !287)
!305 = !DILocation(line: 192, column: 8, scope: !264)
!306 = !DILocation(line: 195, column: 27, scope: !286)
!307 = !DILocation(line: 196, column: 5, scope: !286)
!308 = !DILocation(line: 196, column: 20, scope: !286)
!309 = !DILocation(line: 196, column: 26, scope: !286)
!310 = !DILocation(line: 197, column: 12, scope: !286)
!311 = !DILocation(line: 198, column: 2, scope: !286)
!312 = !DILocation(line: 199, column: 17, scope: !313)
!313 = distinct !DILexicalBlock(scope: !287, file: !6, line: 199, column: 13)
!314 = !DILocation(line: 199, column: 13, scope: !287)
!315 = !DILocation(line: 202, column: 16, scope: !316)
!316 = distinct !DILexicalBlock(scope: !313, file: !6, line: 200, column: 4)
!317 = !DILocation(line: 202, column: 33, scope: !316)
!318 = !DILocation(line: 202, column: 40, scope: !316)
!319 = !DILocation(line: 202, column: 7, scope: !316)
!320 = !DILocation(line: 203, column: 21, scope: !316)
!321 = !DILocation(line: 204, column: 5, scope: !316)
!322 = !DILocation(line: 204, column: 14, scope: !316)
!323 = !DILocation(line: 204, column: 20, scope: !316)
!324 = !DILocation(line: 205, column: 12, scope: !316)
!325 = !DILocation(line: 206, column: 4, scope: !316)
!326 = !DILocation(line: 207, column: 26, scope: !327)
!327 = distinct !DILexicalBlock(scope: !313, file: !6, line: 207, column: 13)
!328 = !DILocation(line: 207, column: 37, scope: !327)
!329 = !DILocation(line: 207, column: 13, scope: !327)
!330 = !DILocation(line: 207, column: 43, scope: !327)
!331 = !DILocation(line: 207, column: 13, scope: !313)
!332 = !DILocation(line: 210, column: 18, scope: !333)
!333 = distinct !DILexicalBlock(scope: !327, file: !6, line: 208, column: 4)
!334 = !DILocation(line: 210, column: 23, scope: !333)
!335 = !DILocation(line: 221, column: 5, scope: !336)
!336 = distinct !DILexicalBlock(scope: !264, file: !6, line: 221, column: 5)
!337 = !DILocation(line: 211, column: 2, scope: !333)
!338 = !DILocation(line: 215, column: 16, scope: !339)
!339 = distinct !DILexicalBlock(scope: !327, file: !6, line: 213, column: 4)
!340 = !DILocation(line: 215, column: 51, scope: !339)
!341 = !DILocation(line: 215, column: 43, scope: !339)
!342 = !DILocation(line: 215, column: 56, scope: !339)
!343 = !DILocation(line: 215, column: 7, scope: !339)
!344 = !DILocation(line: 216, column: 7, scope: !339)
!345 = !DILocation(line: 216, column: 23, scope: !339)
!346 = !DILocation(line: 217, column: 5, scope: !339)
!347 = !DILocation(line: 217, column: 16, scope: !339)
!348 = !DILocation(line: 217, column: 22, scope: !339)
!349 = !DILocation(line: 218, column: 12, scope: !339)
!350 = !DILocation(line: 221, column: 16, scope: !336)
!351 = !DILocation(line: 221, column: 13, scope: !336)
!352 = !DILocation(line: 221, column: 5, scope: !264)
!353 = !DILocation(line: 223, column: 10, scope: !354)
!354 = distinct !DILexicalBlock(scope: !336, file: !6, line: 222, column: 2)
!355 = !DILocation(line: 224, column: 40, scope: !354)
!356 = !DILocation(line: 224, column: 46, scope: !354)
!357 = !DILocation(line: 224, column: 26, scope: !354)
!358 = !DILocation(line: 224, column: 11, scope: !354)
!359 = !DILocation(line: 225, column: 2, scope: !354)
!360 = !DILocation(line: 226, column: 1, scope: !264)
!361 = !DILocation(line: 0, scope: !273)
!362 = !DILocation(line: 167, column: 20, scope: !273)
!363 = !DILocation(line: 170, column: 22, scope: !273)
!364 = !DILocation(line: 170, column: 4, scope: !273)
!365 = !DILocation(line: 172, column: 21, scope: !290)
!366 = !DILocation(line: 172, column: 28, scope: !290)
!367 = !DILocation(line: 173, column: 27, scope: !290)
!368 = !DILocation(line: 173, column: 39, scope: !290)
!369 = !DILocation(line: 173, column: 14, scope: !290)
!370 = !DILocation(line: 174, column: 16, scope: !297)
!371 = !DILocation(line: 174, column: 12, scope: !290)
!372 = !DILocation(line: 176, column: 21, scope: !300)
!373 = !DILocation(line: 170, column: 16, scope: !273)
!374 = distinct !{!374, !364, !375, !162}
!375 = !DILocation(line: 180, column: 4, scope: !273)
!376 = !DILocation(line: 183, column: 1, scope: !273)
!377 = !DISubprogram(name: "strcmp", scope: !378, file: !378, line: 156, type: !379, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!378 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "f443da8025a0b7c1498fb6c554ec788d")
!379 = !DISubroutineType(types: !380)
!380 = !{!20, !254, !254}
!381 = !DISubprogram(name: "realloc", scope: !181, file: !181, line: 551, type: !382, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!382 = !DISubroutineType(types: !383)
!383 = !{!35, !35, !184}
!384 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 228, type: !385, scopeLine: 228, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !387)
!385 = !DISubroutineType(types: !386)
!386 = !{!20, !20, !36}
!387 = !{!388, !389, !390, !391, !392, !393, !394, !432, !433, !434, !435}
!388 = !DILocalVariable(name: "argc", arg: 1, scope: !384, file: !6, line: 228, type: !20)
!389 = !DILocalVariable(name: "argv", arg: 2, scope: !384, file: !6, line: 228, type: !36)
!390 = !DILocalVariable(name: "i", scope: !384, file: !6, line: 230, type: !20)
!391 = !DILocalVariable(name: "fd", scope: !384, file: !6, line: 231, type: !20)
!392 = !DILocalVariable(name: "fdata", scope: !384, file: !6, line: 232, type: !17)
!393 = !DILocalVariable(name: "disp_num", scope: !384, file: !6, line: 233, type: !20)
!394 = !DILocalVariable(name: "finfo", scope: !384, file: !6, line: 234, type: !395)
!395 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "stat", file: !396, line: 26, size: 1152, elements: !397)
!396 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_stat.h", directory: "", checksumkind: CSK_MD5, checksum: "3ba283bc334370fe631cbc82f5229ed7")
!397 = !{!398, !400, !402, !404, !406, !408, !410, !411, !412, !414, !416, !418, !426, !427, !428}
!398 = !DIDerivedType(tag: DW_TAG_member, name: "st_dev", scope: !395, file: !396, line: 31, baseType: !399, size: 64)
!399 = !DIDerivedType(tag: DW_TAG_typedef, name: "__dev_t", file: !263, line: 145, baseType: !186)
!400 = !DIDerivedType(tag: DW_TAG_member, name: "st_ino", scope: !395, file: !396, line: 36, baseType: !401, size: 64, offset: 64)
!401 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ino_t", file: !263, line: 148, baseType: !186)
!402 = !DIDerivedType(tag: DW_TAG_member, name: "st_nlink", scope: !395, file: !396, line: 44, baseType: !403, size: 64, offset: 128)
!403 = !DIDerivedType(tag: DW_TAG_typedef, name: "__nlink_t", file: !263, line: 151, baseType: !186)
!404 = !DIDerivedType(tag: DW_TAG_member, name: "st_mode", scope: !395, file: !396, line: 45, baseType: !405, size: 32, offset: 192)
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mode_t", file: !263, line: 150, baseType: !7)
!406 = !DIDerivedType(tag: DW_TAG_member, name: "st_uid", scope: !395, file: !396, line: 47, baseType: !407, size: 32, offset: 224)
!407 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !263, line: 146, baseType: !7)
!408 = !DIDerivedType(tag: DW_TAG_member, name: "st_gid", scope: !395, file: !396, line: 48, baseType: !409, size: 32, offset: 256)
!409 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gid_t", file: !263, line: 147, baseType: !7)
!410 = !DIDerivedType(tag: DW_TAG_member, name: "__pad0", scope: !395, file: !396, line: 50, baseType: !20, size: 32, offset: 288)
!411 = !DIDerivedType(tag: DW_TAG_member, name: "st_rdev", scope: !395, file: !396, line: 52, baseType: !399, size: 64, offset: 320)
!412 = !DIDerivedType(tag: DW_TAG_member, name: "st_size", scope: !395, file: !396, line: 57, baseType: !413, size: 64, offset: 384)
!413 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !263, line: 152, baseType: !26)
!414 = !DIDerivedType(tag: DW_TAG_member, name: "st_blksize", scope: !395, file: !396, line: 61, baseType: !415, size: 64, offset: 448)
!415 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blksize_t", file: !263, line: 175, baseType: !26)
!416 = !DIDerivedType(tag: DW_TAG_member, name: "st_blocks", scope: !395, file: !396, line: 63, baseType: !417, size: 64, offset: 512)
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "__blkcnt_t", file: !263, line: 180, baseType: !26)
!418 = !DIDerivedType(tag: DW_TAG_member, name: "st_atim", scope: !395, file: !396, line: 74, baseType: !419, size: 128, offset: 576)
!419 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !420, line: 11, size: 128, elements: !421)
!420 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!421 = !{!422, !424}
!422 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !419, file: !420, line: 16, baseType: !423, size: 64)
!423 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !263, line: 160, baseType: !26)
!424 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !419, file: !420, line: 21, baseType: !425, size: 64, offset: 64)
!425 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !263, line: 197, baseType: !26)
!426 = !DIDerivedType(tag: DW_TAG_member, name: "st_mtim", scope: !395, file: !396, line: 75, baseType: !419, size: 128, offset: 704)
!427 = !DIDerivedType(tag: DW_TAG_member, name: "st_ctim", scope: !395, file: !396, line: 76, baseType: !419, size: 128, offset: 832)
!428 = !DIDerivedType(tag: DW_TAG_member, name: "__glibc_reserved", scope: !395, file: !396, line: 89, baseType: !429, size: 192, offset: 960)
!429 = !DICompositeType(tag: DW_TAG_array_type, baseType: !425, size: 192, elements: !430)
!430 = !{!431}
!431 = !DISubrange(count: 3)
!432 = !DILocalVariable(name: "fname", scope: !384, file: !6, line: 235, type: !17)
!433 = !DILocalVariable(name: "disp_num_str", scope: !384, file: !6, line: 235, type: !17)
!434 = !DILocalVariable(name: "wc_data", scope: !384, file: !6, line: 262, type: !22)
!435 = !DILocalVariable(name: "temp", scope: !436, file: !6, line: 277, type: !12)
!436 = distinct !DILexicalBlock(scope: !437, file: !6, line: 276, column: 4)
!437 = distinct !DILexicalBlock(scope: !438, file: !6, line: 275, column: 4)
!438 = distinct !DILexicalBlock(scope: !384, file: !6, line: 275, column: 4)
!439 = distinct !DIAssignID()
!440 = !DILocation(line: 0, scope: !384)
!441 = !DILocation(line: 234, column: 4, scope: !384)
!442 = !DILocation(line: 238, column: 8, scope: !443)
!443 = distinct !DILexicalBlock(scope: !384, file: !6, line: 238, column: 8)
!444 = !DILocation(line: 238, column: 16, scope: !443)
!445 = !DILocation(line: 238, column: 8, scope: !384)
!446 = !DILocation(line: 240, column: 70, scope: !447)
!447 = distinct !DILexicalBlock(scope: !443, file: !6, line: 239, column: 4)
!448 = !DILocation(line: 240, column: 7, scope: !447)
!449 = !DILocation(line: 241, column: 7, scope: !447)
!450 = !DILocation(line: 245, column: 19, scope: !384)
!451 = !DILocation(line: 247, column: 4, scope: !384)
!452 = !DILocation(line: 250, column: 4, scope: !453)
!453 = distinct !DILexicalBlock(scope: !384, file: !6, line: 250, column: 4)
!454 = !DILocation(line: 250, column: 4, scope: !384)
!455 = !DILocation(line: 250, column: 4, scope: !456)
!456 = distinct !DILexicalBlock(scope: !453, file: !6, line: 250, column: 4)
!457 = !DILocation(line: 252, column: 4, scope: !458)
!458 = distinct !DILexicalBlock(scope: !384, file: !6, line: 252, column: 4)
!459 = !DILocation(line: 252, column: 4, scope: !384)
!460 = !DILocation(line: 252, column: 4, scope: !461)
!461 = distinct !DILexicalBlock(scope: !458, file: !6, line: 252, column: 4)
!462 = !DILocation(line: 254, column: 4, scope: !463)
!463 = distinct !DILexicalBlock(scope: !384, file: !6, line: 254, column: 4)
!464 = !{!465, !167, i64 48}
!465 = !{!"stat", !167, i64 0, !167, i64 8, !167, i64 16, !132, i64 24, !132, i64 28, !132, i64 32, !132, i64 36, !167, i64 40, !167, i64 48, !167, i64 56, !167, i64 64, !466, i64 72, !466, i64 88, !466, i64 104, !130, i64 120}
!466 = !{!"timespec", !167, i64 0, !167, i64 8}
!467 = !DILocation(line: 254, column: 4, scope: !384)
!468 = !DILocation(line: 254, column: 4, scope: !469)
!469 = distinct !DILexicalBlock(scope: !463, file: !6, line: 254, column: 4)
!470 = !DILocation(line: 258, column: 4, scope: !471)
!471 = distinct !DILexicalBlock(scope: !384, file: !6, line: 258, column: 4)
!472 = !DILocalVariable(name: "__nptr", arg: 1, scope: !473, file: !181, line: 362, type: !254)
!473 = distinct !DISubprogram(name: "atoi", scope: !181, file: !181, line: 362, type: !474, scopeLine: 363, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !476)
!474 = !DISubroutineType(types: !475)
!475 = !{!20, !254}
!476 = !{!472}
!477 = !DILocation(line: 0, scope: !473, inlinedAt: !478)
!478 = distinct !DILocation(line: 258, column: 4, scope: !471)
!479 = !DILocation(line: 364, column: 16, scope: !473, inlinedAt: !478)
!480 = !DILocation(line: 364, column: 10, scope: !473, inlinedAt: !478)
!481 = !DILocation(line: 258, column: 4, scope: !384)
!482 = !DILocation(line: 258, column: 4, scope: !483)
!483 = distinct !DILexicalBlock(scope: !471, file: !6, line: 258, column: 4)
!484 = !DILocation(line: 266, column: 4, scope: !384)
!485 = !DILocation(line: 0, scope: !138, inlinedAt: !486)
!486 = distinct !DILocation(line: 268, column: 4, scope: !384)
!487 = !DILocation(line: 92, column: 25, scope: !138, inlinedAt: !486)
!488 = !DILocation(line: 92, column: 10, scope: !138, inlinedAt: !486)
!489 = !DILocation(line: 93, column: 11, scope: !138, inlinedAt: !486)
!490 = !DILocation(line: 94, column: 12, scope: !138, inlinedAt: !486)
!491 = !DILocation(line: 96, column: 4, scope: !154, inlinedAt: !486)
!492 = !DILocation(line: 97, column: 14, scope: !156, inlinedAt: !486)
!493 = !DILocation(line: 97, column: 20, scope: !156, inlinedAt: !486)
!494 = !DILocation(line: 96, column: 32, scope: !156, inlinedAt: !486)
!495 = !DILocation(line: 96, column: 13, scope: !156, inlinedAt: !486)
!496 = distinct !{!496, !491, !497, !162}
!497 = !DILocation(line: 97, column: 22, scope: !154, inlinedAt: !486)
!498 = !DILocation(line: 99, column: 35, scope: !138, inlinedAt: !486)
!499 = !DILocation(line: 100, column: 9, scope: !138, inlinedAt: !486)
!500 = !DILocation(line: 100, column: 14, scope: !138, inlinedAt: !486)
!501 = !DILocation(line: 101, column: 18, scope: !138, inlinedAt: !486)
!502 = !DILocation(line: 101, column: 16, scope: !138, inlinedAt: !486)
!503 = !DILocation(line: 103, column: 4, scope: !138, inlinedAt: !486)
!504 = !DILocation(line: 104, column: 4, scope: !138, inlinedAt: !486)
!505 = !DILocation(line: 270, column: 10, scope: !384)
!506 = !DILocation(line: 270, column: 17, scope: !384)
!507 = !DILocation(line: 270, column: 4, scope: !384)
!508 = !DILocation(line: 280, column: 9, scope: !384)
!509 = !DILocation(line: 280, column: 4, scope: !384)
!510 = !DILocation(line: 282, column: 4, scope: !511)
!511 = distinct !DILexicalBlock(scope: !384, file: !6, line: 282, column: 4)
!512 = !DILocation(line: 282, column: 4, scope: !384)
!513 = !DILocation(line: 282, column: 4, scope: !514)
!514 = distinct !DILexicalBlock(scope: !511, file: !6, line: 282, column: 4)
!515 = !DILocation(line: 283, column: 4, scope: !516)
!516 = distinct !DILexicalBlock(scope: !384, file: !6, line: 283, column: 4)
!517 = !DILocation(line: 283, column: 4, scope: !384)
!518 = !DILocation(line: 283, column: 4, scope: !519)
!519 = distinct !DILexicalBlock(scope: !516, file: !6, line: 283, column: 4)
!520 = !DILocation(line: 286, column: 1, scope: !384)
!521 = !DILocation(line: 285, column: 4, scope: !384)
!522 = !DISubprogram(name: "printf", scope: !523, file: !523, line: 356, type: !524, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!523 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!524 = !DISubroutineType(types: !525)
!525 = !{!20, !526, null}
!526 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !254)
!527 = !DISubprogram(name: "exit", scope: !181, file: !181, line: 624, type: !528, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!528 = !DISubroutineType(types: !529)
!529 = !{null, !20}
!530 = !DISubprogram(name: "open", scope: !531, file: !531, line: 181, type: !532, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!531 = !DIFile(filename: "/usr/include/fcntl.h", directory: "", checksumkind: CSK_MD5, checksum: "1a9bb91818c37dc7bc291ca6e49fc221")
!532 = !DISubroutineType(types: !533)
!533 = !{!20, !254, !20, null}
!534 = !DISubprogram(name: "perror", scope: !523, file: !523, line: 804, type: !535, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!535 = !DISubroutineType(types: !536)
!536 = !{null, !254}
!537 = !DISubprogram(name: "fstat", scope: !538, file: !538, line: 210, type: !539, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!538 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/stat.h", directory: "", checksumkind: CSK_MD5, checksum: "1e5cd132abb12ea0c79aeae3bfa4573e")
!539 = !DISubroutineType(types: !540)
!540 = !{!20, !20, !541}
!541 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !395, size: 64)
!542 = !DISubprogram(name: "mmap", scope: !543, file: !543, line: 57, type: !544, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!543 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/mman.h", directory: "", checksumkind: CSK_MD5, checksum: "93a87cc3b0558893646eb0c257165272")
!544 = !DISubroutineType(types: !545)
!545 = !{!35, !35, !184, !20, !20, !20, !413}
!546 = !DISubprogram(name: "qsort", scope: !181, file: !181, line: 838, type: !547, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!547 = !DISubroutineType(types: !548)
!548 = !{null, !35, !184, !184, !549}
!549 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !181, line: 816, baseType: !550)
!550 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!551 = !DISubprogram(name: "munmap", scope: !543, file: !543, line: 76, type: !552, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!552 = !DISubroutineType(types: !553)
!553 = !{!20, !35, !184}
!554 = !DISubprogram(name: "close", scope: !555, file: !555, line: 358, type: !556, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!555 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "ed37c2e6f30ba31a8b41e4d70547c39c")
!556 = !DISubroutineType(types: !557)
!557 = !{!20, !20}
!558 = !DISubprogram(name: "strtol", scope: !181, file: !181, line: 177, type: !559, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!559 = !DISubroutineType(types: !560)
!560 = !{!26, !526, !561, !20}
!561 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !36)
