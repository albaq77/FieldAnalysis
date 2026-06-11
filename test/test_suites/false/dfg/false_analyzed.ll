; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/false/dfg/false.ll'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/false/false.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timespec = type { i64, i64 }

@array = dso_local local_unnamed_addr global ptr null, align 8, !dbg !0
@tpBegin2 = dso_local global %struct.timespec zeroinitializer, align 8, !dbg !21
@tpEnd2 = dso_local global %struct.timespec zeroinitializer, align 8, !dbg !32
@.str = private unnamed_addr constant [79 x i8] c"array[first_element]: %d\09\09 array[bad_element]: %d\09\09 array[good_element]: %d\0A\0A\0A\00", align 1, !dbg !9
@.str.1 = private unnamed_addr constant [43 x i8] c"Time take with false sharing      : %f ms\0A\00", align 1, !dbg !16

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local double @compute(i64 %0, i64 %1, i64 %2, i64 %3) local_unnamed_addr #0 !dbg !42 {
    #dbg_value(i64 %0, !47, !DIExpression(DW_OP_LLVM_fragment, 0, 64), !50)
    #dbg_value(i64 %1, !47, !DIExpression(DW_OP_LLVM_fragment, 64, 64), !50)
    #dbg_value(i64 %2, !48, !DIExpression(DW_OP_LLVM_fragment, 0, 64), !50)
    #dbg_value(i64 %3, !48, !DIExpression(DW_OP_LLVM_fragment, 64, 64), !50)
  %5 = sub nsw i64 %2, %0, !dbg !51
  %6 = mul nsw i64 %5, 1000, !dbg !52
  %7 = sitofp i64 %6 to double, !dbg !53
    #dbg_value(double %7, !49, !DIExpression(), !50)
  %8 = sub nsw i64 %3, %1, !dbg !54
  %9 = sitofp i64 %8 to double, !dbg !55
  %10 = tail call double @llvm.fmuladd.f64(double %9, double 0x3EB0C6F7A0B5ED8D, double %7), !dbg !56
    #dbg_value(double %10, !49, !DIExpression(), !50)
  ret double %10, !dbg !57
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) uwtable
define dso_local noalias noundef ptr @expensive_function(ptr nocapture noundef readonly %0) #3 !dbg !58 {
    #dbg_value(ptr %0, !62, !DIExpression(), !65)
  call void @__record_field_access_full(i32 0, ptr %0, i32 0), !dbg !66
  %2 = load i32, ptr %0, align 4, !dbg !66, !tbaa !67
    #dbg_value(i32 %2, !63, !DIExpression(), !65)
    #dbg_value(i32 0, !64, !DIExpression(), !65)
  call void @__record_field_access_full(i32 1, ptr @array, i32 0)
  %3 = load ptr, ptr @array, align 8, !tbaa !71
  %4 = sext i32 %2 to i64
  %5 = getelementptr inbounds i32, ptr %3, i64 %4
  call void @__record_field_access_full(i32 2, ptr %5, i32 1)
  %6 = load i32, ptr %5, align 4, !tbaa !67
    #dbg_value(i32 0, !64, !DIExpression(), !65)
    #dbg_value(i32 poison, !64, !DIExpression(), !65)
  %7 = add i32 %6, 100000, !dbg !73
  store i32 %7, ptr %5, align 4, !dbg !75, !tbaa !67
  ret ptr null, !dbg !77
}

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readnone %1) local_unnamed_addr #4 !dbg !78 {
  %3 = alloca [16 x i32], align 16, !DIAssignID !102
    #dbg_assign(i1 undef, !90, !DIExpression(), !102, ptr %3, !DIExpression(), !103)
  %4 = alloca [16 x i64], align 16, !DIAssignID !104
    #dbg_assign(i1 undef, !97, !DIExpression(), !104, ptr %4, !DIExpression(), !103)
    #dbg_value(i32 %0, !84, !DIExpression(), !103)
    #dbg_value(ptr %1, !85, !DIExpression(), !103)
  %5 = tail call noalias dereferenceable_or_null(6400) ptr @malloc(i64 noundef 6400) #9, !dbg !105
  call void @__record_field_access_full(i32 1, ptr @array, i32 1), !dbg !106
  store ptr %5, ptr @array, align 8, !dbg !106, !tbaa !71
    #dbg_value(i32 0, !86, !DIExpression(), !103)
    #dbg_value(i32 1, !87, !DIExpression(), !103)
    #dbg_value(i32 99, !88, !DIExpression(), !103)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %3) #10, !dbg !107
  call void @llvm.lifetime.start.p0(i64 128, ptr nonnull %4) #10, !dbg !108
    #dbg_value(i32 0, !89, !DIExpression(), !103)
    #dbg_value(i64 0, !89, !DIExpression(), !103)
    #dbg_value(i64 1, !89, !DIExpression(), !103)
  %6 = getelementptr inbounds i8, ptr %3, i64 4, !dbg !109
    #dbg_value(i64 2, !89, !DIExpression(), !103)
  call void @__record_field_access_full(i32 3, ptr %6, i32 0), !dbg !109
  %7 = getelementptr inbounds i8, ptr %3, i64 8, !dbg !109
    #dbg_value(i64 3, !89, !DIExpression(), !103)
  call void @__record_field_access_full(i32 3, ptr %7, i32 0), !dbg !109
  %8 = getelementptr inbounds i8, ptr %3, i64 12, !dbg !109
  call void @__record_field_access_full(i32 3, ptr %8, i32 0), !dbg !112
  call void @__record_field_access_full(i32 4, ptr %3, i32 1), !dbg !112
  store <4 x i32> <i32 0, i32 1, i32 2, i32 3>, ptr %3, align 16, !dbg !112, !tbaa !67
    #dbg_value(i64 4, !89, !DIExpression(), !103)
  %9 = getelementptr inbounds i8, ptr %3, i64 16, !dbg !109
    #dbg_value(i64 5, !89, !DIExpression(), !103)
  call void @__record_field_access_full(i32 3, ptr %9, i32 1), !dbg !109
  %10 = getelementptr inbounds i8, ptr %3, i64 20, !dbg !109
    #dbg_value(i64 6, !89, !DIExpression(), !103)
  call void @__record_field_access_full(i32 3, ptr %10, i32 0), !dbg !109
  %11 = getelementptr inbounds i8, ptr %3, i64 24, !dbg !109
    #dbg_value(i64 7, !89, !DIExpression(), !103)
  call void @__record_field_access_full(i32 3, ptr %11, i32 0), !dbg !109
  %12 = getelementptr inbounds i8, ptr %3, i64 28, !dbg !109
  call void @__record_field_access_full(i32 3, ptr %12, i32 0), !dbg !112
  store <4 x i32> <i32 4, i32 5, i32 6, i32 7>, ptr %9, align 16, !dbg !112, !tbaa !67
    #dbg_value(i64 8, !89, !DIExpression(), !103)
  %13 = getelementptr inbounds i8, ptr %3, i64 32, !dbg !109
    #dbg_value(i64 9, !89, !DIExpression(), !103)
  call void @__record_field_access_full(i32 3, ptr %13, i32 1), !dbg !109
  %14 = getelementptr inbounds i8, ptr %3, i64 36, !dbg !109
    #dbg_value(i64 10, !89, !DIExpression(), !103)
  call void @__record_field_access_full(i32 3, ptr %14, i32 0), !dbg !109
  %15 = getelementptr inbounds i8, ptr %3, i64 40, !dbg !109
    #dbg_value(i64 11, !89, !DIExpression(), !103)
  call void @__record_field_access_full(i32 3, ptr %15, i32 0), !dbg !109
  %16 = getelementptr inbounds i8, ptr %3, i64 44, !dbg !109
  call void @__record_field_access_full(i32 3, ptr %16, i32 0), !dbg !112
  store <4 x i32> <i32 8, i32 9, i32 10, i32 11>, ptr %13, align 16, !dbg !112, !tbaa !67
    #dbg_value(i64 12, !89, !DIExpression(), !103)
  %17 = getelementptr inbounds i8, ptr %3, i64 48, !dbg !109
    #dbg_value(i64 13, !89, !DIExpression(), !103)
  call void @__record_field_access_full(i32 3, ptr %17, i32 1), !dbg !109
  %18 = getelementptr inbounds i8, ptr %3, i64 52, !dbg !109
    #dbg_value(i64 14, !89, !DIExpression(), !103)
  call void @__record_field_access_full(i32 3, ptr %18, i32 0), !dbg !109
  %19 = getelementptr inbounds i8, ptr %3, i64 56, !dbg !109
    #dbg_value(i64 15, !89, !DIExpression(), !103)
  call void @__record_field_access_full(i32 3, ptr %19, i32 0), !dbg !109
  %20 = getelementptr inbounds i8, ptr %3, i64 60, !dbg !109
  call void @__record_field_access_full(i32 3, ptr %20, i32 0), !dbg !112
  store <4 x i32> <i32 12, i32 13, i32 14, i32 15>, ptr %17, align 16, !dbg !112, !tbaa !67
    #dbg_value(i64 16, !89, !DIExpression(), !103)
  %21 = tail call i32 @clock_gettime(i32 noundef 0, ptr noundef nonnull @tpBegin2) #10, !dbg !113
    #dbg_value(i32 0, !89, !DIExpression(), !103)
    #dbg_value(i64 0, !89, !DIExpression(), !103)
  %22 = call i32 @pthread_create(ptr noundef nonnull %4, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %3) #10, !dbg !114
    #dbg_value(i64 1, !89, !DIExpression(), !103)
  %23 = getelementptr inbounds i8, ptr %4, i64 8, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %23, i32 0), !dbg !114
  %24 = call i32 @pthread_create(ptr noundef nonnull %23, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %6) #10, !dbg !114
    #dbg_value(i64 2, !89, !DIExpression(), !103)
  %25 = getelementptr inbounds i8, ptr %4, i64 16, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %25, i32 0), !dbg !114
  %26 = call i32 @pthread_create(ptr noundef nonnull %25, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %7) #10, !dbg !114
    #dbg_value(i64 3, !89, !DIExpression(), !103)
  %27 = getelementptr inbounds i8, ptr %4, i64 24, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %27, i32 0), !dbg !114
  %28 = call i32 @pthread_create(ptr noundef nonnull %27, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %8) #10, !dbg !114
    #dbg_value(i64 4, !89, !DIExpression(), !103)
  %29 = getelementptr inbounds i8, ptr %4, i64 32, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %29, i32 0), !dbg !114
  %30 = call i32 @pthread_create(ptr noundef nonnull %29, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %9) #10, !dbg !114
    #dbg_value(i64 5, !89, !DIExpression(), !103)
  %31 = getelementptr inbounds i8, ptr %4, i64 40, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %31, i32 0), !dbg !114
  %32 = call i32 @pthread_create(ptr noundef nonnull %31, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %10) #10, !dbg !114
    #dbg_value(i64 6, !89, !DIExpression(), !103)
  %33 = getelementptr inbounds i8, ptr %4, i64 48, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %33, i32 0), !dbg !114
  %34 = call i32 @pthread_create(ptr noundef nonnull %33, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %11) #10, !dbg !114
    #dbg_value(i64 7, !89, !DIExpression(), !103)
  %35 = getelementptr inbounds i8, ptr %4, i64 56, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %35, i32 0), !dbg !114
  %36 = call i32 @pthread_create(ptr noundef nonnull %35, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %12) #10, !dbg !114
    #dbg_value(i64 8, !89, !DIExpression(), !103)
  %37 = getelementptr inbounds i8, ptr %4, i64 64, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %37, i32 0), !dbg !114
  %38 = call i32 @pthread_create(ptr noundef nonnull %37, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %13) #10, !dbg !114
    #dbg_value(i64 9, !89, !DIExpression(), !103)
  %39 = getelementptr inbounds i8, ptr %4, i64 72, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %39, i32 0), !dbg !114
  %40 = call i32 @pthread_create(ptr noundef nonnull %39, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %14) #10, !dbg !114
    #dbg_value(i64 10, !89, !DIExpression(), !103)
  %41 = getelementptr inbounds i8, ptr %4, i64 80, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %41, i32 0), !dbg !114
  %42 = call i32 @pthread_create(ptr noundef nonnull %41, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %15) #10, !dbg !114
    #dbg_value(i64 11, !89, !DIExpression(), !103)
  %43 = getelementptr inbounds i8, ptr %4, i64 88, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %43, i32 0), !dbg !114
  %44 = call i32 @pthread_create(ptr noundef nonnull %43, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %16) #10, !dbg !114
    #dbg_value(i64 12, !89, !DIExpression(), !103)
  %45 = getelementptr inbounds i8, ptr %4, i64 96, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %45, i32 0), !dbg !114
  %46 = call i32 @pthread_create(ptr noundef nonnull %45, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %17) #10, !dbg !114
    #dbg_value(i64 13, !89, !DIExpression(), !103)
  %47 = getelementptr inbounds i8, ptr %4, i64 104, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %47, i32 0), !dbg !114
  %48 = call i32 @pthread_create(ptr noundef nonnull %47, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %18) #10, !dbg !114
    #dbg_value(i64 14, !89, !DIExpression(), !103)
  %49 = getelementptr inbounds i8, ptr %4, i64 112, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %49, i32 0), !dbg !114
  %50 = call i32 @pthread_create(ptr noundef nonnull %49, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %19) #10, !dbg !114
    #dbg_value(i64 15, !89, !DIExpression(), !103)
  %51 = getelementptr inbounds i8, ptr %4, i64 120, !dbg !118
  call void @__record_field_access_full(i32 3, ptr %51, i32 0), !dbg !114
  %52 = call i32 @pthread_create(ptr noundef nonnull %51, ptr noundef null, ptr noundef nonnull @expensive_function, ptr noundef nonnull %20) #10, !dbg !114
    #dbg_value(i64 16, !89, !DIExpression(), !103)
    #dbg_value(i64 0, !89, !DIExpression(), !103)
  call void @__record_field_access_full(i32 5, ptr %4, i32 0), !dbg !119
  %53 = load i64, ptr %4, align 16, !dbg !119, !tbaa !123
  %54 = call i32 @pthread_join(i64 noundef %53, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 1, !89, !DIExpression(), !103)
  %55 = load i64, ptr %23, align 8, !dbg !119, !tbaa !123
  %56 = call i32 @pthread_join(i64 noundef %55, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 2, !89, !DIExpression(), !103)
  %57 = load i64, ptr %25, align 16, !dbg !119, !tbaa !123
  %58 = call i32 @pthread_join(i64 noundef %57, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 3, !89, !DIExpression(), !103)
  %59 = load i64, ptr %27, align 8, !dbg !119, !tbaa !123
  %60 = call i32 @pthread_join(i64 noundef %59, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 4, !89, !DIExpression(), !103)
  %61 = load i64, ptr %29, align 16, !dbg !119, !tbaa !123
  %62 = call i32 @pthread_join(i64 noundef %61, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 5, !89, !DIExpression(), !103)
  %63 = load i64, ptr %31, align 8, !dbg !119, !tbaa !123
  %64 = call i32 @pthread_join(i64 noundef %63, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 6, !89, !DIExpression(), !103)
  %65 = load i64, ptr %33, align 16, !dbg !119, !tbaa !123
  %66 = call i32 @pthread_join(i64 noundef %65, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 7, !89, !DIExpression(), !103)
  %67 = load i64, ptr %35, align 8, !dbg !119, !tbaa !123
  %68 = call i32 @pthread_join(i64 noundef %67, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 8, !89, !DIExpression(), !103)
  %69 = load i64, ptr %37, align 16, !dbg !119, !tbaa !123
  %70 = call i32 @pthread_join(i64 noundef %69, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 9, !89, !DIExpression(), !103)
  %71 = load i64, ptr %39, align 8, !dbg !119, !tbaa !123
  %72 = call i32 @pthread_join(i64 noundef %71, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 10, !89, !DIExpression(), !103)
  %73 = load i64, ptr %41, align 16, !dbg !119, !tbaa !123
  %74 = call i32 @pthread_join(i64 noundef %73, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 11, !89, !DIExpression(), !103)
  %75 = load i64, ptr %43, align 8, !dbg !119, !tbaa !123
  %76 = call i32 @pthread_join(i64 noundef %75, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 12, !89, !DIExpression(), !103)
  %77 = load i64, ptr %45, align 16, !dbg !119, !tbaa !123
  %78 = call i32 @pthread_join(i64 noundef %77, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 13, !89, !DIExpression(), !103)
  %79 = load i64, ptr %47, align 8, !dbg !119, !tbaa !123
  %80 = call i32 @pthread_join(i64 noundef %79, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 14, !89, !DIExpression(), !103)
  %81 = load i64, ptr %49, align 16, !dbg !119, !tbaa !123
  %82 = call i32 @pthread_join(i64 noundef %81, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 15, !89, !DIExpression(), !103)
  %83 = load i64, ptr %51, align 8, !dbg !119, !tbaa !123
  %84 = call i32 @pthread_join(i64 noundef %83, ptr noundef null) #10, !dbg !125
    #dbg_value(i64 16, !89, !DIExpression(), !103)
  %85 = call i32 @clock_gettime(i32 noundef 0, ptr noundef nonnull @tpEnd2) #10, !dbg !126
  call void @__record_field_access_full(i32 1, ptr @array, i32 0), !dbg !127
  %86 = load ptr, ptr @array, align 8, !dbg !127, !tbaa !71
  call void @__record_field_access_full(i32 6, ptr %86, i32 0), !dbg !127
  %87 = load i32, ptr %86, align 4, !dbg !127, !tbaa !67
  %88 = getelementptr inbounds i8, ptr %86, i64 4, !dbg !128
  call void @__record_field_access_full(i32 7, ptr %88, i32 0), !dbg !128
  %89 = load i32, ptr %88, align 4, !dbg !128, !tbaa !67
  %90 = getelementptr inbounds i8, ptr %86, i64 396, !dbg !129
  call void @__record_field_access_full(i32 7, ptr %90, i32 0), !dbg !129
  %91 = load i32, ptr %90, align 4, !dbg !129, !tbaa !67
  %92 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %87, i32 noundef %89, i32 noundef %91), !dbg !130
  %93 = load i64, ptr @tpBegin2, align 8, !dbg !131
  call void @__record_field_access_full(i32 8, ptr getelementptr inbounds (i8, ptr @tpBegin2, i64 8), i32 0), !dbg !131
  %94 = load i64, ptr getelementptr inbounds (i8, ptr @tpBegin2, i64 8), align 8, !dbg !131
  %95 = load i64, ptr @tpEnd2, align 8, !dbg !131
  call void @__record_field_access_full(i32 8, ptr getelementptr inbounds (i8, ptr @tpEnd2, i64 8), i32 0), !dbg !131
  %96 = load i64, ptr getelementptr inbounds (i8, ptr @tpEnd2, i64 8), align 8, !dbg !131
    #dbg_value(i64 %93, !47, !DIExpression(DW_OP_LLVM_fragment, 0, 64), !132)
    #dbg_value(i64 %94, !47, !DIExpression(DW_OP_LLVM_fragment, 64, 64), !132)
    #dbg_value(i64 %95, !48, !DIExpression(DW_OP_LLVM_fragment, 0, 64), !132)
    #dbg_value(i64 %96, !48, !DIExpression(DW_OP_LLVM_fragment, 64, 64), !132)
  %97 = sub nsw i64 %95, %93, !dbg !134
  %98 = mul nsw i64 %97, 1000, !dbg !135
  %99 = sitofp i64 %98 to double, !dbg !136
    #dbg_value(double %99, !49, !DIExpression(), !132)
  %100 = sub nsw i64 %96, %94, !dbg !137
  %101 = sitofp i64 %100 to double, !dbg !138
  %102 = call double @llvm.fmuladd.f64(double %101, double 0x3EB0C6F7A0B5ED8D, double %99), !dbg !139
    #dbg_value(double %102, !49, !DIExpression(), !132)
    #dbg_value(double %102, !95, !DIExpression(), !103)
  %103 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, double noundef %102), !dbg !140
  call void @llvm.lifetime.end.p0(i64 128, ptr nonnull %4) #10, !dbg !141
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %3) #10, !dbg !141
  ret i32 0, !dbg !142
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare !dbg !143 noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #5

; Function Attrs: nounwind
declare !dbg !149 i32 @clock_gettime(i32 noundef, ptr noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !157 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #6

declare !dbg !176 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare !dbg !180 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #8

declare void @__record_field_access(i32)

declare void @__record_field_access_full(i32, ptr, i32)

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind allocsize(0) }
attributes #10 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!34, !35, !36, !37, !38, !39, !40}
!llvm.ident = !{!41}
!fieldanalysis.instrumented = !{}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "array", scope: !2, file: !11, line: 20, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !8, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/false/false.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/false", checksumkind: CSK_MD5, checksum: "c32cad8e100ad14d89d7a2d4efd12748")
!4 = !{!5, !7}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !{!9, !16, !21, !32, !0}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(scope: null, file: !11, line: 62, type: !12, isLocal: true, isDefinition: true)
!11 = !DIFile(filename: "false.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/false", checksumkind: CSK_MD5, checksum: "c32cad8e100ad14d89d7a2d4efd12748")
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 632, elements: !14)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!15}
!15 = !DISubrange(count: 79)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(scope: null, file: !11, line: 67, type: !18, isLocal: true, isDefinition: true)
!18 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 344, elements: !19)
!19 = !{!20}
!20 = !DISubrange(count: 43)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "tpBegin2", scope: !2, file: !11, line: 7, type: !23, isLocal: false, isDefinition: true)
!23 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !24, line: 11, size: 128, elements: !25)
!24 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!25 = !{!26, !30}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !23, file: !24, line: 16, baseType: !27, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !28, line: 160, baseType: !29)
!28 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!29 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !23, file: !24, line: 21, baseType: !31, size: 64, offset: 64)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !28, line: 197, baseType: !29)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "tpEnd2", scope: !2, file: !11, line: 7, type: !23, isLocal: false, isDefinition: true)
!34 = !{i32 7, !"Dwarf Version", i32 5}
!35 = !{i32 2, !"Debug Info Version", i32 3}
!36 = !{i32 1, !"wchar_size", i32 4}
!37 = !{i32 8, !"PIC Level", i32 2}
!38 = !{i32 7, !"PIE Level", i32 2}
!39 = !{i32 7, !"uwtable", i32 2}
!40 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!41 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!42 = distinct !DISubprogram(name: "compute", scope: !11, file: !11, line: 12, type: !43, scopeLine: 12, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !46)
!43 = !DISubroutineType(types: !44)
!44 = !{!45, !23, !23}
!45 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!46 = !{!47, !48, !49}
!47 = !DILocalVariable(name: "start", arg: 1, scope: !42, file: !11, line: 12, type: !23)
!48 = !DILocalVariable(name: "end", arg: 2, scope: !42, file: !11, line: 12, type: !23)
!49 = !DILocalVariable(name: "t", scope: !42, file: !11, line: 13, type: !45)
!50 = !DILocation(line: 0, scope: !42)
!51 = !DILocation(line: 14, column: 21, scope: !42)
!52 = !DILocation(line: 14, column: 37, scope: !42)
!53 = !DILocation(line: 14, column: 9, scope: !42)
!54 = !DILocation(line: 15, column: 23, scope: !42)
!55 = !DILocation(line: 15, column: 10, scope: !42)
!56 = !DILocation(line: 15, column: 7, scope: !42)
!57 = !DILocation(line: 17, column: 5, scope: !42)
!58 = distinct !DISubprogram(name: "expensive_function", scope: !11, file: !11, line: 22, type: !59, scopeLine: 22, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !61)
!59 = !DISubroutineType(types: !60)
!60 = !{!7, !7}
!61 = !{!62, !63, !64}
!62 = !DILocalVariable(name: "param", arg: 1, scope: !58, file: !11, line: 22, type: !7)
!63 = !DILocalVariable(name: "index", scope: !58, file: !11, line: 23, type: !6)
!64 = !DILocalVariable(name: "i", scope: !58, file: !11, line: 24, type: !6)
!65 = !DILocation(line: 0, scope: !58)
!66 = !DILocation(line: 23, column: 17, scope: !58)
!67 = !{!68, !68, i64 0}
!68 = !{!"int", !69, i64 0}
!69 = !{!"omnipotent char", !70, i64 0}
!70 = !{!"Simple C/C++ TBAA"}
!71 = !{!72, !72, i64 0}
!72 = !{!"any pointer", !69, i64 0}
!73 = !DILocation(line: 25, column: 5, scope: !74)
!74 = distinct !DILexicalBlock(scope: !58, file: !11, line: 25, column: 5)
!75 = !DILocation(line: 26, column: 22, scope: !76)
!76 = distinct !DILexicalBlock(scope: !74, file: !11, line: 25, column: 5)
!77 = !DILocation(line: 27, column: 5, scope: !58)
!78 = distinct !DISubprogram(name: "main", scope: !11, file: !11, line: 30, type: !79, scopeLine: 30, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !83)
!79 = !DISubroutineType(types: !80)
!80 = !{!6, !6, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!83 = !{!84, !85, !86, !87, !88, !89, !90, !94, !95, !96, !97}
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !11, line: 30, type: !6)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !11, line: 30, type: !81)
!86 = !DILocalVariable(name: "first_elem", scope: !78, file: !11, line: 32, type: !6)
!87 = !DILocalVariable(name: "bad_elem", scope: !78, file: !11, line: 33, type: !6)
!88 = !DILocalVariable(name: "good_elem", scope: !78, file: !11, line: 34, type: !6)
!89 = !DILocalVariable(name: "i", scope: !78, file: !11, line: 35, type: !6)
!90 = !DILocalVariable(name: "indexes", scope: !78, file: !11, line: 36, type: !91)
!91 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 512, elements: !92)
!92 = !{!93}
!93 = !DISubrange(count: 16)
!94 = !DILocalVariable(name: "time1", scope: !78, file: !11, line: 37, type: !45)
!95 = !DILocalVariable(name: "time2", scope: !78, file: !11, line: 38, type: !45)
!96 = !DILocalVariable(name: "time3", scope: !78, file: !11, line: 39, type: !45)
!97 = !DILocalVariable(name: "threads", scope: !78, file: !11, line: 40, type: !98)
!98 = !DICompositeType(tag: DW_TAG_array_type, baseType: !99, size: 1024, elements: !92)
!99 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !100, line: 27, baseType: !101)
!100 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!101 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!102 = distinct !DIAssignID()
!103 = !DILocation(line: 0, scope: !78)
!104 = distinct !DIAssignID()
!105 = !DILocation(line: 31, column: 19, scope: !78)
!106 = !DILocation(line: 31, column: 11, scope: !78)
!107 = !DILocation(line: 36, column: 5, scope: !78)
!108 = !DILocation(line: 40, column: 5, scope: !78)
!109 = !DILocation(line: 42, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !11, line: 41, column: 5)
!111 = distinct !DILexicalBlock(scope: !78, file: !11, line: 41, column: 5)
!112 = !DILocation(line: 42, column: 20, scope: !110)
!113 = !DILocation(line: 47, column: 5, scope: !78)
!114 = !DILocation(line: 49, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !116, file: !11, line: 48, column: 30)
!116 = distinct !DILexicalBlock(scope: !117, file: !11, line: 48, column: 5)
!117 = distinct !DILexicalBlock(scope: !78, file: !11, line: 48, column: 5)
!118 = !DILocation(line: 49, column: 25, scope: !115)
!119 = !DILocation(line: 53, column: 22, scope: !120)
!120 = distinct !DILexicalBlock(scope: !121, file: !11, line: 52, column: 30)
!121 = distinct !DILexicalBlock(scope: !122, file: !11, line: 52, column: 5)
!122 = distinct !DILexicalBlock(scope: !78, file: !11, line: 52, column: 5)
!123 = !{!124, !124, i64 0}
!124 = !{!"long", !69, i64 0}
!125 = !DILocation(line: 53, column: 9, scope: !120)
!126 = !DILocation(line: 55, column: 5, scope: !78)
!127 = !DILocation(line: 64, column: 12, scope: !78)
!128 = !DILocation(line: 64, column: 31, scope: !78)
!129 = !DILocation(line: 64, column: 48, scope: !78)
!130 = !DILocation(line: 62, column: 5, scope: !78)
!131 = !DILocation(line: 66, column: 13, scope: !78)
!132 = !DILocation(line: 0, scope: !42, inlinedAt: !133)
!133 = distinct !DILocation(line: 66, column: 13, scope: !78)
!134 = !DILocation(line: 14, column: 21, scope: !42, inlinedAt: !133)
!135 = !DILocation(line: 14, column: 37, scope: !42, inlinedAt: !133)
!136 = !DILocation(line: 14, column: 9, scope: !42, inlinedAt: !133)
!137 = !DILocation(line: 15, column: 23, scope: !42, inlinedAt: !133)
!138 = !DILocation(line: 15, column: 10, scope: !42, inlinedAt: !133)
!139 = !DILocation(line: 15, column: 7, scope: !42, inlinedAt: !133)
!140 = !DILocation(line: 67, column: 5, scope: !78)
!141 = !DILocation(line: 72, column: 1, scope: !78)
!142 = !DILocation(line: 71, column: 5, scope: !78)
!143 = !DISubprogram(name: "malloc", scope: !144, file: !144, line: 540, type: !145, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!144 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!145 = !DISubroutineType(types: !146)
!146 = !{!7, !147}
!147 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !148, line: 18, baseType: !101)
!148 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!149 = !DISubprogram(name: "clock_gettime", scope: !150, file: !150, line: 279, type: !151, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!150 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "db37158473a25e1d89b19f8bc6892801")
!151 = !DISubroutineType(types: !152)
!152 = !{!6, !153, !156}
!153 = !DIDerivedType(tag: DW_TAG_typedef, name: "clockid_t", file: !154, line: 7, baseType: !155)
!154 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/clockid_t.h", directory: "", checksumkind: CSK_MD5, checksum: "099a80153c2ad48bc7f5f4a188cb6d24")
!155 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clockid_t", file: !28, line: 169, baseType: !6)
!156 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!157 = !DISubprogram(name: "pthread_create", scope: !158, file: !158, line: 202, type: !159, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!158 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!159 = !DISubroutineType(types: !160)
!160 = !{!6, !161, !163, !174, !175}
!161 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !162)
!162 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!163 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !164)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !166)
!166 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !100, line: 62, baseType: !167)
!167 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pthread_attr_t", file: !100, line: 56, size: 448, elements: !168)
!168 = !{!169, !173}
!169 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !167, file: !100, line: 58, baseType: !170, size: 448)
!170 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 448, elements: !171)
!171 = !{!172}
!172 = !DISubrange(count: 56)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !167, file: !100, line: 59, baseType: !29, size: 64)
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!175 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !7)
!176 = !DISubprogram(name: "pthread_join", scope: !158, file: !158, line: 219, type: !177, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!177 = !DISubroutineType(types: !178)
!178 = !{!6, !99, !179}
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!180 = !DISubprogram(name: "printf", scope: !181, file: !181, line: 356, type: !182, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!181 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!182 = !DISubroutineType(types: !183)
!183 = !{!6, !184, null}
!184 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !185)
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!186 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
