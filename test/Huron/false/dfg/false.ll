; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/Huron/false/false_unrolling.c'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/Huron/false/false_unrolling.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timespec = type { i64, i64 }

@NTHREAD = dso_local constant i32 4, align 4, !dbg !0
@NITER = dso_local constant i32 10000000, align 4, !dbg !9
@array = dso_local global ptr null, align 8, !dbg !37
@offsets = dso_local constant [4 x i32] [i32 0, i32 12, i32 24, i32 36], align 16, !dbg !13
@tpBegin2 = dso_local global %struct.timespec zeroinitializer, align 8, !dbg !24
@tpEnd2 = dso_local global %struct.timespec zeroinitializer, align 8, !dbg !35
@.str = private unnamed_addr constant [43 x i8] c"Time take with false sharing      : %f ms\0A\00", align 1, !dbg !18

; Function Attrs: noinline nounwind optnone uwtable
define dso_local double @compute(i64 %0, i64 %1, i64 %2, i64 %3) #0 !dbg !47 {
  %5 = alloca %struct.timespec, align 8
  %6 = alloca %struct.timespec, align 8
  %7 = alloca double, align 8
  %8 = getelementptr inbounds { i64, i64 }, ptr %5, i32 0, i32 0
  store i64 %0, ptr %8, align 8
  %9 = getelementptr inbounds { i64, i64 }, ptr %5, i32 0, i32 1
  store i64 %1, ptr %9, align 8
  %10 = getelementptr inbounds { i64, i64 }, ptr %6, i32 0, i32 0
  store i64 %2, ptr %10, align 8
  %11 = getelementptr inbounds { i64, i64 }, ptr %6, i32 0, i32 1
  store i64 %3, ptr %11, align 8
    #dbg_declare(ptr %5, !52, !DIExpression(), !53)
    #dbg_declare(ptr %6, !54, !DIExpression(), !55)
    #dbg_declare(ptr %7, !56, !DIExpression(), !57)
  %12 = getelementptr inbounds %struct.timespec, ptr %6, i32 0, i32 0, !dbg !58
  %13 = load i64, ptr %12, align 8, !dbg !58
  %14 = getelementptr inbounds %struct.timespec, ptr %5, i32 0, i32 0, !dbg !59
  %15 = load i64, ptr %14, align 8, !dbg !59
  %16 = sub nsw i64 %13, %15, !dbg !60
  %17 = mul nsw i64 %16, 1000, !dbg !61
  %18 = sitofp i64 %17 to double, !dbg !62
  store double %18, ptr %7, align 8, !dbg !63
  %19 = getelementptr inbounds %struct.timespec, ptr %6, i32 0, i32 1, !dbg !64
  %20 = load i64, ptr %19, align 8, !dbg !64
  %21 = getelementptr inbounds %struct.timespec, ptr %5, i32 0, i32 1, !dbg !65
  %22 = load i64, ptr %21, align 8, !dbg !65
  %23 = sub nsw i64 %20, %22, !dbg !66
  %24 = sitofp i64 %23 to double, !dbg !67
  %25 = load double, ptr %7, align 8, !dbg !68
  %26 = call double @llvm.fmuladd.f64(double %24, double 0x3EB0C6F7A0B5ED8D, double %25), !dbg !68
  store double %26, ptr %7, align 8, !dbg !68
  %27 = load double, ptr %7, align 8, !dbg !69
  ret double %27, !dbg !70
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @thread_func1(ptr noundef %0) #0 !dbg !71 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !74, !DIExpression(), !75)
    #dbg_declare(ptr %3, !76, !DIExpression(), !78)
  store i32 0, ptr %3, align 4, !dbg !78
  br label %5, !dbg !79

5:                                                ; preds = %23, %1
  %6 = load i32, ptr %3, align 4, !dbg !80
  %7 = icmp slt i32 %6, 10000000, !dbg !82
  br i1 %7, label %8, label %26, !dbg !83

8:                                                ; preds = %5
    #dbg_declare(ptr %4, !84, !DIExpression(), !86)
  store i32 0, ptr %4, align 4, !dbg !86
  br label %9, !dbg !87

9:                                                ; preds = %19, %8
  %10 = load i32, ptr %4, align 4, !dbg !88
  %11 = icmp slt i32 %10, 20, !dbg !90
  br i1 %11, label %12, label %22, !dbg !91

12:                                               ; preds = %9
  %13 = load ptr, ptr @array, align 8, !dbg !92
  %14 = load i32, ptr %4, align 4, !dbg !93
  %15 = sext i32 %14 to i64, !dbg !92
  %16 = getelementptr inbounds i32, ptr %13, i64 %15, !dbg !92
  %17 = load i32, ptr %16, align 4, !dbg !94
  %18 = add nsw i32 %17, 1, !dbg !94
  store i32 %18, ptr %16, align 4, !dbg !94
  br label %19, !dbg !92

19:                                               ; preds = %12
  %20 = load i32, ptr %4, align 4, !dbg !95
  %21 = add nsw i32 %20, 1, !dbg !95
  store i32 %21, ptr %4, align 4, !dbg !95
  br label %9, !dbg !96, !llvm.loop !97

22:                                               ; preds = %9
  br label %23, !dbg !98

23:                                               ; preds = %22
  %24 = load i32, ptr %3, align 4, !dbg !100
  %25 = add nsw i32 %24, 1, !dbg !100
  store i32 %25, ptr %3, align 4, !dbg !100
  br label %5, !dbg !101, !llvm.loop !102

26:                                               ; preds = %5
  ret ptr null, !dbg !104
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @thread_func2(ptr noundef %0) #0 !dbg !105 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !106, !DIExpression(), !107)
    #dbg_declare(ptr %3, !108, !DIExpression(), !110)
  store i32 0, ptr %3, align 4, !dbg !110
  br label %5, !dbg !111

5:                                                ; preds = %23, %1
  %6 = load i32, ptr %3, align 4, !dbg !112
  %7 = icmp slt i32 %6, 10000000, !dbg !114
  br i1 %7, label %8, label %26, !dbg !115

8:                                                ; preds = %5
    #dbg_declare(ptr %4, !116, !DIExpression(), !118)
  store i32 32, ptr %4, align 4, !dbg !118
  br label %9, !dbg !119

9:                                                ; preds = %19, %8
  %10 = load i32, ptr %4, align 4, !dbg !120
  %11 = icmp slt i32 %10, 52, !dbg !122
  br i1 %11, label %12, label %22, !dbg !123

12:                                               ; preds = %9
  %13 = load ptr, ptr @array, align 8, !dbg !124
  %14 = load i32, ptr %4, align 4, !dbg !125
  %15 = sext i32 %14 to i64, !dbg !124
  %16 = getelementptr inbounds i32, ptr %13, i64 %15, !dbg !124
  %17 = load i32, ptr %16, align 4, !dbg !126
  %18 = add nsw i32 %17, 1, !dbg !126
  store i32 %18, ptr %16, align 4, !dbg !126
  br label %19, !dbg !124

19:                                               ; preds = %12
  %20 = load i32, ptr %4, align 4, !dbg !127
  %21 = add nsw i32 %20, 1, !dbg !127
  store i32 %21, ptr %4, align 4, !dbg !127
  br label %9, !dbg !128, !llvm.loop !129

22:                                               ; preds = %9
  br label %23, !dbg !130

23:                                               ; preds = %22
  %24 = load i32, ptr %3, align 4, !dbg !131
  %25 = add nsw i32 %24, 1, !dbg !131
  store i32 %25, ptr %3, align 4, !dbg !131
  br label %5, !dbg !132, !llvm.loop !133

26:                                               ; preds = %5
  ret ptr null, !dbg !135
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @thread_func3(ptr noundef %0) #0 !dbg !136 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !137, !DIExpression(), !138)
    #dbg_declare(ptr %3, !139, !DIExpression(), !141)
  store i32 0, ptr %3, align 4, !dbg !141
  br label %5, !dbg !142

5:                                                ; preds = %23, %1
  %6 = load i32, ptr %3, align 4, !dbg !143
  %7 = icmp slt i32 %6, 10000000, !dbg !145
  br i1 %7, label %8, label %26, !dbg !146

8:                                                ; preds = %5
    #dbg_declare(ptr %4, !147, !DIExpression(), !149)
  store i32 64, ptr %4, align 4, !dbg !149
  br label %9, !dbg !150

9:                                                ; preds = %19, %8
  %10 = load i32, ptr %4, align 4, !dbg !151
  %11 = icmp slt i32 %10, 84, !dbg !153
  br i1 %11, label %12, label %22, !dbg !154

12:                                               ; preds = %9
  %13 = load ptr, ptr @array, align 8, !dbg !155
  %14 = load i32, ptr %4, align 4, !dbg !156
  %15 = sext i32 %14 to i64, !dbg !155
  %16 = getelementptr inbounds i32, ptr %13, i64 %15, !dbg !155
  %17 = load i32, ptr %16, align 4, !dbg !157
  %18 = add nsw i32 %17, 1, !dbg !157
  store i32 %18, ptr %16, align 4, !dbg !157
  br label %19, !dbg !155

19:                                               ; preds = %12
  %20 = load i32, ptr %4, align 4, !dbg !158
  %21 = add nsw i32 %20, 1, !dbg !158
  store i32 %21, ptr %4, align 4, !dbg !158
  br label %9, !dbg !159, !llvm.loop !160

22:                                               ; preds = %9
  br label %23, !dbg !161

23:                                               ; preds = %22
  %24 = load i32, ptr %3, align 4, !dbg !162
  %25 = add nsw i32 %24, 1, !dbg !162
  store i32 %25, ptr %3, align 4, !dbg !162
  br label %5, !dbg !163, !llvm.loop !164

26:                                               ; preds = %5
  ret ptr null, !dbg !166
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @thread_func4(ptr noundef %0) #0 !dbg !167 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !168, !DIExpression(), !169)
    #dbg_declare(ptr %3, !170, !DIExpression(), !172)
  store i32 0, ptr %3, align 4, !dbg !172
  br label %5, !dbg !173

5:                                                ; preds = %23, %1
  %6 = load i32, ptr %3, align 4, !dbg !174
  %7 = icmp slt i32 %6, 10000000, !dbg !176
  br i1 %7, label %8, label %26, !dbg !177

8:                                                ; preds = %5
    #dbg_declare(ptr %4, !178, !DIExpression(), !180)
  store i32 96, ptr %4, align 4, !dbg !180
  br label %9, !dbg !181

9:                                                ; preds = %19, %8
  %10 = load i32, ptr %4, align 4, !dbg !182
  %11 = icmp slt i32 %10, 116, !dbg !184
  br i1 %11, label %12, label %22, !dbg !185

12:                                               ; preds = %9
  %13 = load ptr, ptr @array, align 8, !dbg !186
  %14 = load i32, ptr %4, align 4, !dbg !187
  %15 = sext i32 %14 to i64, !dbg !186
  %16 = getelementptr inbounds i32, ptr %13, i64 %15, !dbg !186
  %17 = load i32, ptr %16, align 4, !dbg !188
  %18 = add nsw i32 %17, 1, !dbg !188
  store i32 %18, ptr %16, align 4, !dbg !188
  br label %19, !dbg !186

19:                                               ; preds = %12
  %20 = load i32, ptr %4, align 4, !dbg !189
  %21 = add nsw i32 %20, 1, !dbg !189
  store i32 %21, ptr %4, align 4, !dbg !189
  br label %9, !dbg !190, !llvm.loop !191

22:                                               ; preds = %9
  br label %23, !dbg !192

23:                                               ; preds = %22
  %24 = load i32, ptr %3, align 4, !dbg !193
  %25 = add nsw i32 %24, 1, !dbg !193
  store i32 %25, ptr %3, align 4, !dbg !193
  br label %5, !dbg !194, !llvm.loop !195

26:                                               ; preds = %5
  ret ptr null, !dbg !197
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @thread_func(ptr noundef %0) #0 !dbg !198 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !199, !DIExpression(), !200)
    #dbg_declare(ptr %4, !201, !DIExpression(), !202)
  %7 = load ptr, ptr %3, align 8, !dbg !203
  %8 = ptrtoint ptr %7 to i32, !dbg !204
  store i32 %8, ptr %4, align 4, !dbg !202
    #dbg_declare(ptr %5, !205, !DIExpression(), !207)
  store i32 0, ptr %5, align 4, !dbg !207
  br label %9, !dbg !208

9:                                                ; preds = %37, %1
  %10 = load i32, ptr %5, align 4, !dbg !209
  %11 = icmp slt i32 %10, 10000000, !dbg !211
  br i1 %11, label %12, label %40, !dbg !212

12:                                               ; preds = %9
    #dbg_declare(ptr %6, !213, !DIExpression(), !215)
  %13 = load i32, ptr %4, align 4, !dbg !216
  %14 = mul nsw i32 20, %13, !dbg !217
  store i32 %14, ptr %6, align 4, !dbg !215
  br label %15, !dbg !218

15:                                               ; preds = %33, %12
  %16 = load i32, ptr %6, align 4, !dbg !219
  %17 = load i32, ptr %4, align 4, !dbg !221
  %18 = add nsw i32 %17, 1, !dbg !222
  %19 = mul nsw i32 20, %18, !dbg !223
  %20 = icmp slt i32 %16, %19, !dbg !224
  br i1 %20, label %21, label %36, !dbg !225

21:                                               ; preds = %15
  %22 = load ptr, ptr @array, align 8, !dbg !226
  %23 = load i32, ptr %6, align 4, !dbg !227
  %24 = load i32, ptr %4, align 4, !dbg !228
  %25 = sext i32 %24 to i64, !dbg !229
  %26 = getelementptr inbounds [4 x i32], ptr @offsets, i64 0, i64 %25, !dbg !229
  %27 = load i32, ptr %26, align 4, !dbg !229
  %28 = add nsw i32 %23, %27, !dbg !230
  %29 = sext i32 %28 to i64, !dbg !226
  %30 = getelementptr inbounds i32, ptr %22, i64 %29, !dbg !226
  %31 = load i32, ptr %30, align 4, !dbg !231
  %32 = add nsw i32 %31, 1, !dbg !231
  store i32 %32, ptr %30, align 4, !dbg !231
  br label %33, !dbg !226

33:                                               ; preds = %21
  %34 = load i32, ptr %6, align 4, !dbg !232
  %35 = add nsw i32 %34, 1, !dbg !232
  store i32 %35, ptr %6, align 4, !dbg !232
  br label %15, !dbg !233, !llvm.loop !234

36:                                               ; preds = %15
  br label %37, !dbg !235

37:                                               ; preds = %36
  %38 = load i32, ptr %5, align 4, !dbg !236
  %39 = add nsw i32 %38, 1, !dbg !236
  store i32 %39, ptr %5, align 4, !dbg !236
  br label %9, !dbg !237, !llvm.loop !238

40:                                               ; preds = %9
  %41 = load ptr, ptr %2, align 8, !dbg !240
  ret ptr %41, !dbg !240
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !241 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !246, !DIExpression(), !247)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !248, !DIExpression(), !249)
  %9 = call noalias ptr @malloc(i64 noundef 1600) #6, !dbg !250
  store ptr %9, ptr @array, align 8, !dbg !251
    #dbg_declare(ptr %6, !252, !DIExpression(), !253)
    #dbg_declare(ptr %7, !254, !DIExpression(), !255)
  %10 = call ptr @llvm.stacksave.p0(), !dbg !256
  store ptr %10, ptr %8, align 8, !dbg !256
  %11 = alloca i64, i64 4, align 16, !dbg !256
    #dbg_declare(ptr %11, !257, !DIExpression(), !262)
  %12 = call i32 @clock_gettime(i32 noundef 0, ptr noundef @tpBegin2) #7, !dbg !263
  %13 = getelementptr inbounds i64, ptr %11, i64 0, !dbg !264
  %14 = call i32 @pthread_create(ptr noundef %13, ptr noundef null, ptr noundef @thread_func1, ptr noundef null) #7, !dbg !265
  %15 = getelementptr inbounds i64, ptr %11, i64 1, !dbg !266
  %16 = call i32 @pthread_create(ptr noundef %15, ptr noundef null, ptr noundef @thread_func2, ptr noundef null) #7, !dbg !267
  %17 = getelementptr inbounds i64, ptr %11, i64 2, !dbg !268
  %18 = call i32 @pthread_create(ptr noundef %17, ptr noundef null, ptr noundef @thread_func3, ptr noundef null) #7, !dbg !269
  %19 = getelementptr inbounds i64, ptr %11, i64 3, !dbg !270
  %20 = call i32 @pthread_create(ptr noundef %19, ptr noundef null, ptr noundef @thread_func4, ptr noundef null) #7, !dbg !271
  store i32 0, ptr %6, align 4, !dbg !272
  br label %21, !dbg !274

21:                                               ; preds = %30, %2
  %22 = load i32, ptr %6, align 4, !dbg !275
  %23 = icmp slt i32 %22, 4, !dbg !277
  br i1 %23, label %24, label %33, !dbg !278

24:                                               ; preds = %21
  %25 = load i32, ptr %6, align 4, !dbg !279
  %26 = sext i32 %25 to i64, !dbg !281
  %27 = getelementptr inbounds i64, ptr %11, i64 %26, !dbg !281
  %28 = load i64, ptr %27, align 8, !dbg !281
  %29 = call i32 @pthread_join(i64 noundef %28, ptr noundef null), !dbg !282
  br label %30, !dbg !283

30:                                               ; preds = %24
  %31 = load i32, ptr %6, align 4, !dbg !284
  %32 = add nsw i32 %31, 1, !dbg !284
  store i32 %32, ptr %6, align 4, !dbg !284
  br label %21, !dbg !285, !llvm.loop !286

33:                                               ; preds = %21
  %34 = call i32 @clock_gettime(i32 noundef 0, ptr noundef @tpEnd2) #7, !dbg !288
  %35 = load i64, ptr @tpBegin2, align 8, !dbg !289
  %36 = load i64, ptr getelementptr inbounds ({ i64, i64 }, ptr @tpBegin2, i32 0, i32 1), align 8, !dbg !289
  %37 = load i64, ptr @tpEnd2, align 8, !dbg !289
  %38 = load i64, ptr getelementptr inbounds ({ i64, i64 }, ptr @tpEnd2, i32 0, i32 1), align 8, !dbg !289
  %39 = call double @compute(i64 %35, i64 %36, i64 %37, i64 %38), !dbg !289
  store double %39, ptr %7, align 8, !dbg !290
  %40 = load double, ptr %7, align 8, !dbg !291
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str, double noundef %40), !dbg !292
  store i32 0, ptr %3, align 4, !dbg !293
  %42 = load ptr, ptr %8, align 8, !dbg !294
  call void @llvm.stackrestore.p0(ptr %42), !dbg !294
  %43 = load i32, ptr %3, align 4, !dbg !294
  ret i32 %43, !dbg !294
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave.p0() #3

; Function Attrs: nounwind
declare i32 @clock_gettime(i32 noundef, ptr noundef) #4

; Function Attrs: nounwind
declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #4

declare i32 @pthread_join(i64 noundef, ptr noundef) #5

declare i32 @printf(ptr noundef, ...) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore.p0(ptr) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind willreturn }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind allocsize(0) }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!39, !40, !41, !42, !43, !44, !45}
!llvm.ident = !{!46}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "NTHREAD", scope: !2, file: !11, line: 31, type: !12, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/Huron/false/false_unrolling.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/Huron/false", checksumkind: CSK_MD5, checksum: "b153472a8baff9f11bf395f3c1fc6bc2")
!4 = !{!5, !6, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!8 = !{!0, !9, !13, !18, !24, !35, !37}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "NITER", scope: !2, file: !11, line: 31, type: !12, isLocal: false, isDefinition: true)
!11 = !DIFile(filename: "false_unrolling.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/Huron/false", checksumkind: CSK_MD5, checksum: "b153472a8baff9f11bf395f3c1fc6bc2")
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !6)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "offsets", scope: !2, file: !11, line: 100, type: !15, isLocal: false, isDefinition: true)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 128, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 4)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(scope: null, file: !11, line: 143, type: !20, isLocal: true, isDefinition: true)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 344, elements: !22)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !{!23}
!23 = !DISubrange(count: 43)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "tpBegin2", scope: !2, file: !11, line: 27, type: !26, isLocal: false, isDefinition: true)
!26 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !27, line: 11, size: 128, elements: !28)
!27 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!28 = !{!29, !33}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !26, file: !27, line: 16, baseType: !30, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !31, line: 160, baseType: !32)
!31 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!32 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !26, file: !27, line: 21, baseType: !34, size: 64, offset: 64)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !31, line: 197, baseType: !32)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "tpEnd2", scope: !2, file: !11, line: 27, type: !26, isLocal: false, isDefinition: true)
!37 = !DIGlobalVariableExpression(var: !38, expr: !DIExpression())
!38 = distinct !DIGlobalVariable(name: "array", scope: !2, file: !11, line: 29, type: !7, isLocal: false, isDefinition: true)
!39 = !{i32 7, !"Dwarf Version", i32 5}
!40 = !{i32 2, !"Debug Info Version", i32 3}
!41 = !{i32 1, !"wchar_size", i32 4}
!42 = !{i32 8, !"PIC Level", i32 2}
!43 = !{i32 7, !"PIE Level", i32 2}
!44 = !{i32 7, !"uwtable", i32 2}
!45 = !{i32 7, !"frame-pointer", i32 2}
!46 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!47 = distinct !DISubprogram(name: "compute", scope: !11, file: !11, line: 35, type: !48, scopeLine: 39, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !51)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !26, !26}
!50 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!51 = !{}
!52 = !DILocalVariable(name: "start", arg: 1, scope: !47, file: !11, line: 36, type: !26)
!53 = !DILocation(line: 36, column: 21, scope: !47)
!54 = !DILocalVariable(name: "end", arg: 2, scope: !47, file: !11, line: 37, type: !26)
!55 = !DILocation(line: 37, column: 21, scope: !47)
!56 = !DILocalVariable(name: "t", scope: !47, file: !11, line: 40, type: !50)
!57 = !DILocation(line: 40, column: 10, scope: !47)
!58 = !DILocation(line: 41, column: 12, scope: !47)
!59 = !DILocation(line: 41, column: 27, scope: !47)
!60 = !DILocation(line: 41, column: 19, scope: !47)
!61 = !DILocation(line: 41, column: 35, scope: !47)
!62 = !DILocation(line: 41, column: 7, scope: !47)
!63 = !DILocation(line: 41, column: 5, scope: !47)
!64 = !DILocation(line: 42, column: 13, scope: !47)
!65 = !DILocation(line: 42, column: 29, scope: !47)
!66 = !DILocation(line: 42, column: 21, scope: !47)
!67 = !DILocation(line: 42, column: 8, scope: !47)
!68 = !DILocation(line: 42, column: 5, scope: !47)
!69 = !DILocation(line: 44, column: 10, scope: !47)
!70 = !DILocation(line: 44, column: 3, scope: !47)
!71 = distinct !DISubprogram(name: "thread_func1", scope: !11, file: !11, line: 48, type: !72, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !51)
!72 = !DISubroutineType(types: !73)
!73 = !{!5, !5}
!74 = !DILocalVariable(name: "param", arg: 1, scope: !71, file: !11, line: 48, type: !5)
!75 = !DILocation(line: 48, column: 26, scope: !71)
!76 = !DILocalVariable(name: "j", scope: !77, file: !11, line: 50, type: !6)
!77 = distinct !DILexicalBlock(scope: !71, file: !11, line: 50, column: 5)
!78 = !DILocation(line: 50, column: 14, scope: !77)
!79 = !DILocation(line: 50, column: 10, scope: !77)
!80 = !DILocation(line: 50, column: 21, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !11, line: 50, column: 5)
!82 = !DILocation(line: 50, column: 23, scope: !81)
!83 = !DILocation(line: 50, column: 5, scope: !77)
!84 = !DILocalVariable(name: "i", scope: !85, file: !11, line: 51, type: !6)
!85 = distinct !DILexicalBlock(scope: !81, file: !11, line: 51, column: 9)
!86 = !DILocation(line: 51, column: 18, scope: !85)
!87 = !DILocation(line: 51, column: 14, scope: !85)
!88 = !DILocation(line: 51, column: 25, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !11, line: 51, column: 9)
!90 = !DILocation(line: 51, column: 27, scope: !89)
!91 = !DILocation(line: 51, column: 9, scope: !85)
!92 = !DILocation(line: 52, column: 13, scope: !89)
!93 = !DILocation(line: 52, column: 19, scope: !89)
!94 = !DILocation(line: 52, column: 21, scope: !89)
!95 = !DILocation(line: 51, column: 34, scope: !89)
!96 = !DILocation(line: 51, column: 9, scope: !89)
!97 = distinct !{!97, !91, !98, !99}
!98 = !DILocation(line: 52, column: 21, scope: !85)
!99 = !{!"llvm.loop.mustprogress"}
!100 = !DILocation(line: 50, column: 33, scope: !81)
!101 = !DILocation(line: 50, column: 5, scope: !81)
!102 = distinct !{!102, !83, !103, !99}
!103 = !DILocation(line: 52, column: 21, scope: !77)
!104 = !DILocation(line: 58, column: 5, scope: !71)
!105 = distinct !DISubprogram(name: "thread_func2", scope: !11, file: !11, line: 61, type: !72, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !51)
!106 = !DILocalVariable(name: "param", arg: 1, scope: !105, file: !11, line: 61, type: !5)
!107 = !DILocation(line: 61, column: 26, scope: !105)
!108 = !DILocalVariable(name: "j", scope: !109, file: !11, line: 63, type: !6)
!109 = distinct !DILexicalBlock(scope: !105, file: !11, line: 63, column: 5)
!110 = !DILocation(line: 63, column: 14, scope: !109)
!111 = !DILocation(line: 63, column: 10, scope: !109)
!112 = !DILocation(line: 63, column: 21, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !11, line: 63, column: 5)
!114 = !DILocation(line: 63, column: 23, scope: !113)
!115 = !DILocation(line: 63, column: 5, scope: !109)
!116 = !DILocalVariable(name: "i", scope: !117, file: !11, line: 64, type: !6)
!117 = distinct !DILexicalBlock(scope: !113, file: !11, line: 64, column: 9)
!118 = !DILocation(line: 64, column: 18, scope: !117)
!119 = !DILocation(line: 64, column: 14, scope: !117)
!120 = !DILocation(line: 64, column: 26, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !11, line: 64, column: 9)
!122 = !DILocation(line: 64, column: 28, scope: !121)
!123 = !DILocation(line: 64, column: 9, scope: !117)
!124 = !DILocation(line: 65, column: 13, scope: !121)
!125 = !DILocation(line: 65, column: 19, scope: !121)
!126 = !DILocation(line: 65, column: 21, scope: !121)
!127 = !DILocation(line: 64, column: 35, scope: !121)
!128 = !DILocation(line: 64, column: 9, scope: !121)
!129 = distinct !{!129, !123, !130, !99}
!130 = !DILocation(line: 65, column: 21, scope: !117)
!131 = !DILocation(line: 63, column: 33, scope: !113)
!132 = !DILocation(line: 63, column: 5, scope: !113)
!133 = distinct !{!133, !115, !134, !99}
!134 = !DILocation(line: 65, column: 21, scope: !109)
!135 = !DILocation(line: 71, column: 5, scope: !105)
!136 = distinct !DISubprogram(name: "thread_func3", scope: !11, file: !11, line: 74, type: !72, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !51)
!137 = !DILocalVariable(name: "param", arg: 1, scope: !136, file: !11, line: 74, type: !5)
!138 = !DILocation(line: 74, column: 26, scope: !136)
!139 = !DILocalVariable(name: "j", scope: !140, file: !11, line: 76, type: !6)
!140 = distinct !DILexicalBlock(scope: !136, file: !11, line: 76, column: 5)
!141 = !DILocation(line: 76, column: 14, scope: !140)
!142 = !DILocation(line: 76, column: 10, scope: !140)
!143 = !DILocation(line: 76, column: 21, scope: !144)
!144 = distinct !DILexicalBlock(scope: !140, file: !11, line: 76, column: 5)
!145 = !DILocation(line: 76, column: 23, scope: !144)
!146 = !DILocation(line: 76, column: 5, scope: !140)
!147 = !DILocalVariable(name: "i", scope: !148, file: !11, line: 77, type: !6)
!148 = distinct !DILexicalBlock(scope: !144, file: !11, line: 77, column: 9)
!149 = !DILocation(line: 77, column: 18, scope: !148)
!150 = !DILocation(line: 77, column: 14, scope: !148)
!151 = !DILocation(line: 77, column: 26, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !11, line: 77, column: 9)
!153 = !DILocation(line: 77, column: 28, scope: !152)
!154 = !DILocation(line: 77, column: 9, scope: !148)
!155 = !DILocation(line: 78, column: 13, scope: !152)
!156 = !DILocation(line: 78, column: 19, scope: !152)
!157 = !DILocation(line: 78, column: 21, scope: !152)
!158 = !DILocation(line: 77, column: 35, scope: !152)
!159 = !DILocation(line: 77, column: 9, scope: !152)
!160 = distinct !{!160, !154, !161, !99}
!161 = !DILocation(line: 78, column: 21, scope: !148)
!162 = !DILocation(line: 76, column: 33, scope: !144)
!163 = !DILocation(line: 76, column: 5, scope: !144)
!164 = distinct !{!164, !146, !165, !99}
!165 = !DILocation(line: 78, column: 21, scope: !140)
!166 = !DILocation(line: 84, column: 5, scope: !136)
!167 = distinct !DISubprogram(name: "thread_func4", scope: !11, file: !11, line: 87, type: !72, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !51)
!168 = !DILocalVariable(name: "param", arg: 1, scope: !167, file: !11, line: 87, type: !5)
!169 = !DILocation(line: 87, column: 26, scope: !167)
!170 = !DILocalVariable(name: "j", scope: !171, file: !11, line: 89, type: !6)
!171 = distinct !DILexicalBlock(scope: !167, file: !11, line: 89, column: 5)
!172 = !DILocation(line: 89, column: 14, scope: !171)
!173 = !DILocation(line: 89, column: 10, scope: !171)
!174 = !DILocation(line: 89, column: 21, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !11, line: 89, column: 5)
!176 = !DILocation(line: 89, column: 23, scope: !175)
!177 = !DILocation(line: 89, column: 5, scope: !171)
!178 = !DILocalVariable(name: "i", scope: !179, file: !11, line: 90, type: !6)
!179 = distinct !DILexicalBlock(scope: !175, file: !11, line: 90, column: 9)
!180 = !DILocation(line: 90, column: 18, scope: !179)
!181 = !DILocation(line: 90, column: 14, scope: !179)
!182 = !DILocation(line: 90, column: 26, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !11, line: 90, column: 9)
!184 = !DILocation(line: 90, column: 28, scope: !183)
!185 = !DILocation(line: 90, column: 9, scope: !179)
!186 = !DILocation(line: 91, column: 13, scope: !183)
!187 = !DILocation(line: 91, column: 19, scope: !183)
!188 = !DILocation(line: 91, column: 21, scope: !183)
!189 = !DILocation(line: 90, column: 36, scope: !183)
!190 = !DILocation(line: 90, column: 9, scope: !183)
!191 = distinct !{!191, !185, !192, !99}
!192 = !DILocation(line: 91, column: 21, scope: !179)
!193 = !DILocation(line: 89, column: 33, scope: !175)
!194 = !DILocation(line: 89, column: 5, scope: !175)
!195 = distinct !{!195, !177, !196, !99}
!196 = !DILocation(line: 91, column: 21, scope: !171)
!197 = !DILocation(line: 97, column: 5, scope: !167)
!198 = distinct !DISubprogram(name: "thread_func", scope: !11, file: !11, line: 103, type: !72, scopeLine: 103, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !51)
!199 = !DILocalVariable(name: "param", arg: 1, scope: !198, file: !11, line: 103, type: !5)
!200 = !DILocation(line: 103, column: 25, scope: !198)
!201 = !DILocalVariable(name: "coef", scope: !198, file: !11, line: 104, type: !6)
!202 = !DILocation(line: 104, column: 9, scope: !198)
!203 = !DILocation(line: 104, column: 21, scope: !198)
!204 = !DILocation(line: 104, column: 16, scope: !198)
!205 = !DILocalVariable(name: "j", scope: !206, file: !11, line: 106, type: !6)
!206 = distinct !DILexicalBlock(scope: !198, file: !11, line: 106, column: 5)
!207 = !DILocation(line: 106, column: 14, scope: !206)
!208 = !DILocation(line: 106, column: 10, scope: !206)
!209 = !DILocation(line: 106, column: 21, scope: !210)
!210 = distinct !DILexicalBlock(scope: !206, file: !11, line: 106, column: 5)
!211 = !DILocation(line: 106, column: 23, scope: !210)
!212 = !DILocation(line: 106, column: 5, scope: !206)
!213 = !DILocalVariable(name: "i", scope: !214, file: !11, line: 107, type: !6)
!214 = distinct !DILexicalBlock(scope: !210, file: !11, line: 107, column: 9)
!215 = !DILocation(line: 107, column: 18, scope: !214)
!216 = !DILocation(line: 107, column: 27, scope: !214)
!217 = !DILocation(line: 107, column: 25, scope: !214)
!218 = !DILocation(line: 107, column: 14, scope: !214)
!219 = !DILocation(line: 107, column: 33, scope: !220)
!220 = distinct !DILexicalBlock(scope: !214, file: !11, line: 107, column: 9)
!221 = !DILocation(line: 107, column: 43, scope: !220)
!222 = !DILocation(line: 107, column: 48, scope: !220)
!223 = !DILocation(line: 107, column: 40, scope: !220)
!224 = !DILocation(line: 107, column: 35, scope: !220)
!225 = !DILocation(line: 107, column: 9, scope: !214)
!226 = !DILocation(line: 108, column: 13, scope: !220)
!227 = !DILocation(line: 108, column: 19, scope: !220)
!228 = !DILocation(line: 108, column: 31, scope: !220)
!229 = !DILocation(line: 108, column: 23, scope: !220)
!230 = !DILocation(line: 108, column: 21, scope: !220)
!231 = !DILocation(line: 108, column: 37, scope: !220)
!232 = !DILocation(line: 107, column: 55, scope: !220)
!233 = !DILocation(line: 107, column: 9, scope: !220)
!234 = distinct !{!234, !225, !235, !99}
!235 = !DILocation(line: 108, column: 37, scope: !214)
!236 = !DILocation(line: 106, column: 33, scope: !210)
!237 = !DILocation(line: 106, column: 5, scope: !210)
!238 = distinct !{!238, !212, !239, !99}
!239 = !DILocation(line: 108, column: 37, scope: !206)
!240 = !DILocation(line: 114, column: 1, scope: !198)
!241 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 116, type: !242, scopeLine: 116, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !51)
!242 = !DISubroutineType(types: !243)
!243 = !{!6, !6, !244}
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !245, size: 64)
!245 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!246 = !DILocalVariable(name: "argc", arg: 1, scope: !241, file: !11, line: 116, type: !6)
!247 = !DILocation(line: 116, column: 14, scope: !241)
!248 = !DILocalVariable(name: "argv", arg: 2, scope: !241, file: !11, line: 116, type: !244)
!249 = !DILocation(line: 116, column: 26, scope: !241)
!250 = !DILocation(line: 117, column: 19, scope: !241)
!251 = !DILocation(line: 117, column: 11, scope: !241)
!252 = !DILocalVariable(name: "i", scope: !241, file: !11, line: 118, type: !6)
!253 = !DILocation(line: 118, column: 9, scope: !241)
!254 = !DILocalVariable(name: "time2", scope: !241, file: !11, line: 119, type: !50)
!255 = !DILocation(line: 119, column: 12, scope: !241)
!256 = !DILocation(line: 120, column: 5, scope: !241)
!257 = !DILocalVariable(name: "threads", scope: !241, file: !11, line: 120, type: !258)
!258 = !DICompositeType(tag: DW_TAG_array_type, baseType: !259, elements: !16)
!259 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !260, line: 27, baseType: !261)
!260 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!261 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!262 = !DILocation(line: 120, column: 15, scope: !241)
!263 = !DILocation(line: 125, column: 5, scope: !241)
!264 = !DILocation(line: 126, column: 21, scope: !241)
!265 = !DILocation(line: 126, column: 5, scope: !241)
!266 = !DILocation(line: 127, column: 21, scope: !241)
!267 = !DILocation(line: 127, column: 5, scope: !241)
!268 = !DILocation(line: 128, column: 21, scope: !241)
!269 = !DILocation(line: 128, column: 5, scope: !241)
!270 = !DILocation(line: 129, column: 21, scope: !241)
!271 = !DILocation(line: 129, column: 5, scope: !241)
!272 = !DILocation(line: 132, column: 12, scope: !273)
!273 = distinct !DILexicalBlock(scope: !241, file: !11, line: 132, column: 5)
!274 = !DILocation(line: 132, column: 10, scope: !273)
!275 = !DILocation(line: 132, column: 17, scope: !276)
!276 = distinct !DILexicalBlock(scope: !273, file: !11, line: 132, column: 5)
!277 = !DILocation(line: 132, column: 19, scope: !276)
!278 = !DILocation(line: 132, column: 5, scope: !273)
!279 = !DILocation(line: 133, column: 30, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !11, line: 132, column: 35)
!281 = !DILocation(line: 133, column: 22, scope: !280)
!282 = !DILocation(line: 133, column: 9, scope: !280)
!283 = !DILocation(line: 134, column: 5, scope: !280)
!284 = !DILocation(line: 132, column: 31, scope: !276)
!285 = !DILocation(line: 132, column: 5, scope: !276)
!286 = distinct !{!286, !278, !287, !99}
!287 = !DILocation(line: 134, column: 5, scope: !273)
!288 = !DILocation(line: 135, column: 5, scope: !241)
!289 = !DILocation(line: 142, column: 13, scope: !241)
!290 = !DILocation(line: 142, column: 11, scope: !241)
!291 = !DILocation(line: 143, column: 59, scope: !241)
!292 = !DILocation(line: 143, column: 5, scope: !241)
!293 = !DILocation(line: 147, column: 5, scope: !241)
!294 = !DILocation(line: 148, column: 1, scope: !241)
