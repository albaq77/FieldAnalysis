; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/locked/toy.c'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/locked/toy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { ptr, ptr }

@ITER = dso_local local_unnamed_addr global i32 1000000, align 4, !dbg !0
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1, !dbg !12
@ownThreadLock = dso_local global [256 x %union.pthread_mutex_t] zeroinitializer, align 16, !dbg !20
@dynMemory = dso_local local_unnamed_addr global ptr null, align 8, !dbg !18

; Function Attrs: noreturn nounwind uwtable
define dso_local noalias noundef nonnull ptr @run(ptr nocapture noundef readonly %0) #0 !dbg !64 {
    #dbg_value(ptr %0, !68, !DIExpression(), !79)
  %2 = load i32, ptr %0, align 4, !dbg !80, !tbaa !81
    #dbg_value(i32 %2, !69, !DIExpression(), !79)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %2), !dbg !85
    #dbg_value(i32 %2, !70, !DIExpression(), !86)
  %4 = icmp slt i32 %2, 1024, !dbg !87
  br i1 %4, label %5, label %25, !dbg !88

5:                                                ; preds = %1
  %6 = shl nsw i32 %2, 6
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [256 x %union.pthread_mutex_t], ptr @ownThreadLock, i64 0, i64 %7
  %9 = sext i32 %2 to i64, !dbg !88
  %10 = load i32, ptr @ITER, align 4, !dbg !89, !tbaa !81
  br label %11, !dbg !88

11:                                               ; preds = %5, %26
  %12 = phi i32 [ %10, %5 ], [ %27, %26 ], !dbg !89
  %13 = phi i64 [ %9, %5 ], [ %28, %26 ]
    #dbg_value(i64 %13, !70, !DIExpression(), !86)
    #dbg_value(i32 0, !72, !DIExpression(), !90)
  %14 = icmp sgt i32 %12, 0, !dbg !91
  br i1 %14, label %15, label %26, !dbg !92

15:                                               ; preds = %11
    #dbg_value(i32 0, !72, !DIExpression(), !90)
  %16 = tail call i32 @pthread_mutex_lock(ptr noundef nonnull %8) #9, !dbg !93
    #dbg_value(i32 poison, !76, !DIExpression(), !94)
  %17 = load ptr, ptr @dynMemory, align 8, !dbg !95, !tbaa !96
  %18 = getelementptr i32, ptr %17, i64 %13, !dbg !95
    #dbg_value(i32 0, !76, !DIExpression(), !94)
  store i32 0, ptr %18, align 4, !dbg !98, !tbaa !81
  %19 = getelementptr i8, ptr %18, i64 16, !dbg !99
  store i32 0, ptr %19, align 4, !dbg !100, !tbaa !81
  %20 = getelementptr i8, ptr %18, i64 32, !dbg !101
  store i32 0, ptr %20, align 4, !dbg !102, !tbaa !81
    #dbg_value(i32 poison, !76, !DIExpression(), !94)
  %21 = getelementptr i8, ptr %18, i64 48, !dbg !103
    #dbg_value(i32 0, !76, !DIExpression(), !94)
  store i32 0, ptr %21, align 4, !dbg !104, !tbaa !81
  %22 = tail call i32 @pthread_mutex_unlock(ptr noundef nonnull %8) #9, !dbg !105
    #dbg_value(i32 1, !72, !DIExpression(), !90)
  %23 = load i32, ptr @ITER, align 4, !dbg !89, !tbaa !81
  %24 = icmp sgt i32 %23, 1, !dbg !91
  br i1 %24, label %30, label %26, !dbg !92

25:                                               ; preds = %26, %1
  tail call void @pthread_exit(ptr noundef null) #10, !dbg !106
  unreachable, !dbg !106

26:                                               ; preds = %30, %15, %11
  %27 = phi i32 [ %12, %11 ], [ %23, %15 ], [ %52, %30 ]
  %28 = add nsw i64 %13, 16, !dbg !107
    #dbg_value(i64 %28, !70, !DIExpression(), !86)
  %29 = icmp slt i64 %13, 1008, !dbg !87
  br i1 %29, label %11, label %25, !dbg !88, !llvm.loop !108

30:                                               ; preds = %15, %30
  %31 = phi i32 [ %51, %30 ], [ 1, %15 ]
    #dbg_value(i32 %31, !72, !DIExpression(), !90)
  %32 = tail call i32 @pthread_mutex_lock(ptr noundef nonnull %8) #9, !dbg !93
    #dbg_value(i32 poison, !76, !DIExpression(), !94)
  %33 = load ptr, ptr @dynMemory, align 8, !dbg !95, !tbaa !96
  %34 = getelementptr i32, ptr %33, i64 %13, !dbg !95
  %35 = load i32, ptr %34, align 4, !dbg !95, !tbaa !81
    #dbg_value(i32 %35, !76, !DIExpression(), !94)
  %36 = and i32 %31, 1, !dbg !111
  %37 = icmp eq i32 %36, 0, !dbg !111
  %38 = select i1 %37, i32 2, i32 1, !dbg !115
  %39 = add nsw i32 %35, %38, !dbg !115
    #dbg_value(i32 %39, !76, !DIExpression(), !94)
  store i32 %39, ptr %34, align 4, !dbg !98, !tbaa !81
  %40 = getelementptr i8, ptr %34, i64 16, !dbg !99
  %41 = load i32, ptr %40, align 4, !dbg !99, !tbaa !81
    #dbg_value(i32 %41, !76, !DIExpression(), !94)
  %42 = add nsw i32 %41, %38, !dbg !116
    #dbg_value(i32 %42, !76, !DIExpression(), !94)
  store i32 %42, ptr %40, align 4, !dbg !100, !tbaa !81
  %43 = getelementptr i8, ptr %34, i64 32, !dbg !101
  %44 = load i32, ptr %43, align 4, !dbg !101, !tbaa !81
    #dbg_value(i32 %44, !76, !DIExpression(), !94)
  %45 = add nsw i32 %44, %38, !dbg !119
    #dbg_value(i32 %45, !76, !DIExpression(), !94)
  store i32 %45, ptr %43, align 4, !dbg !102, !tbaa !81
  %46 = getelementptr i8, ptr %34, i64 48, !dbg !103
  %47 = load i32, ptr %46, align 4, !dbg !103, !tbaa !81
    #dbg_value(i32 %47, !76, !DIExpression(), !94)
    #dbg_value(i32 %49, !76, !DIExpression(), !94)
    #dbg_value(i32 %49, !76, !DIExpression(), !94)
  %48 = select i1 %37, i32 2, i32 1
  %49 = add nsw i32 %47, %48, !dbg !122
    #dbg_value(i32 %49, !76, !DIExpression(), !94)
  store i32 %49, ptr %46, align 4, !dbg !104, !tbaa !81
  %50 = tail call i32 @pthread_mutex_unlock(ptr noundef nonnull %8) #9, !dbg !105
  %51 = add nuw nsw i32 %31, 1, !dbg !126
    #dbg_value(i32 %51, !72, !DIExpression(), !90)
  %52 = load i32, ptr @ITER, align 4, !dbg !89, !tbaa !81
  %53 = icmp slt i32 %51, %52, !dbg !91
  br i1 %53, label %30, label %26, !dbg !92, !llvm.loop !127
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree nounwind
declare !dbg !130 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare !dbg !137 i32 @pthread_mutex_lock(ptr noundef) local_unnamed_addr #3

; Function Attrs: nounwind
declare !dbg !142 i32 @pthread_mutex_unlock(ptr noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: noreturn
declare !dbg !143 void @pthread_exit(ptr noundef) local_unnamed_addr #4

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #5 !dbg !146 {
  %3 = alloca [4 x i64], align 16, !DIAssignID !164
    #dbg_assign(i1 undef, !152, !DIExpression(), !164, ptr %3, !DIExpression(), !165)
  %4 = alloca [4 x i32], align 16, !DIAssignID !166
    #dbg_assign(i1 undef, !156, !DIExpression(), !166, ptr %4, !DIExpression(), !165)
    #dbg_value(i32 %0, !150, !DIExpression(), !165)
    #dbg_value(ptr %1, !151, !DIExpression(), !165)
  %5 = icmp sgt i32 %0, 1, !dbg !167
  br i1 %5, label %6, label %11, !dbg !169

6:                                                ; preds = %2
  %7 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !170
  %8 = load ptr, ptr %7, align 8, !dbg !170, !tbaa !96
    #dbg_value(ptr %8, !171, !DIExpression(), !177)
  %9 = tail call i64 @strtol(ptr nocapture noundef nonnull %8, ptr noundef null, i32 noundef 10) #9, !dbg !179
  %10 = trunc i64 %9 to i32, !dbg !180
  store i32 %10, ptr @ITER, align 4, !dbg !181, !tbaa !81
  br label %11, !dbg !182

11:                                               ; preds = %6, %2
  %12 = tail call noalias dereferenceable_or_null(4096) ptr @malloc(i64 noundef 4096) #11, !dbg !183
  store ptr %12, ptr @dynMemory, align 8, !dbg !184, !tbaa !96
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %3) #9, !dbg !185
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %4) #9, !dbg !186
    #dbg_value(i32 0, !158, !DIExpression(), !187)
    #dbg_value(i64 0, !158, !DIExpression(), !187)
  %13 = tail call i32 @pthread_mutex_init(ptr noundef nonnull @ownThreadLock, ptr noundef null) #9, !dbg !188
    #dbg_value(i64 1, !158, !DIExpression(), !187)
  %14 = getelementptr inbounds i8, ptr %4, i64 4, !dbg !191
  %15 = tail call i32 @pthread_mutex_init(ptr noundef nonnull getelementptr inbounds (i8, ptr @ownThreadLock, i64 2560), ptr noundef null) #9, !dbg !188
    #dbg_value(i64 2, !158, !DIExpression(), !187)
  %16 = getelementptr inbounds i8, ptr %4, i64 8, !dbg !191
  %17 = tail call i32 @pthread_mutex_init(ptr noundef nonnull getelementptr inbounds (i8, ptr @ownThreadLock, i64 5120), ptr noundef null) #9, !dbg !188
    #dbg_value(i64 3, !158, !DIExpression(), !187)
  %18 = getelementptr inbounds i8, ptr %4, i64 12, !dbg !191
  store <4 x i32> <i32 0, i32 1, i32 2, i32 3>, ptr %4, align 16, !dbg !192, !tbaa !81
  %19 = tail call i32 @pthread_mutex_init(ptr noundef nonnull getelementptr inbounds (i8, ptr @ownThreadLock, i64 7680), ptr noundef null) #9, !dbg !188
    #dbg_value(i64 4, !158, !DIExpression(), !187)
    #dbg_value(i64 0, !160, !DIExpression(), !193)
  %20 = call i32 @pthread_create(ptr noundef nonnull %3, ptr noundef null, ptr noundef nonnull @run, ptr noundef nonnull %4) #9, !dbg !194
    #dbg_value(i64 1, !160, !DIExpression(), !193)
  %21 = getelementptr inbounds i8, ptr %3, i64 8, !dbg !197
  %22 = call i32 @pthread_create(ptr noundef nonnull %21, ptr noundef null, ptr noundef nonnull @run, ptr noundef nonnull %14) #9, !dbg !194
    #dbg_value(i64 2, !160, !DIExpression(), !193)
  %23 = getelementptr inbounds i8, ptr %3, i64 16, !dbg !197
  %24 = call i32 @pthread_create(ptr noundef nonnull %23, ptr noundef null, ptr noundef nonnull @run, ptr noundef nonnull %16) #9, !dbg !194
    #dbg_value(i64 3, !160, !DIExpression(), !193)
  %25 = getelementptr inbounds i8, ptr %3, i64 24, !dbg !197
  %26 = call i32 @pthread_create(ptr noundef nonnull %25, ptr noundef null, ptr noundef nonnull @run, ptr noundef nonnull %18) #9, !dbg !194
    #dbg_value(i64 4, !160, !DIExpression(), !193)
    #dbg_value(i64 0, !162, !DIExpression(), !198)
  %27 = load i64, ptr %3, align 16, !dbg !199, !tbaa !202
  %28 = call i32 @pthread_join(i64 noundef %27, ptr noundef null) #9, !dbg !204
    #dbg_value(i64 1, !162, !DIExpression(), !198)
  %29 = load i64, ptr %21, align 8, !dbg !199, !tbaa !202
  %30 = call i32 @pthread_join(i64 noundef %29, ptr noundef null) #9, !dbg !204
    #dbg_value(i64 2, !162, !DIExpression(), !198)
  %31 = load i64, ptr %23, align 16, !dbg !199, !tbaa !202
  %32 = call i32 @pthread_join(i64 noundef %31, ptr noundef null) #9, !dbg !204
    #dbg_value(i64 3, !162, !DIExpression(), !198)
  %33 = load i64, ptr %25, align 8, !dbg !199, !tbaa !202
  %34 = call i32 @pthread_join(i64 noundef %33, ptr noundef null) #9, !dbg !204
    #dbg_value(i64 4, !162, !DIExpression(), !198)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #9, !dbg !205
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %3) #9, !dbg !205
  ret i32 0, !dbg !206
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare !dbg !207 noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #6

; Function Attrs: nounwind
declare !dbg !212 i32 @pthread_mutex_init(ptr noundef, ptr noundef) local_unnamed_addr #3

; Function Attrs: nounwind
declare !dbg !222 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #3

declare !dbg !240 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #7

; Function Attrs: mustprogress nofree nounwind willreturn
declare !dbg !244 i64 @strtol(ptr noundef readonly, ptr nocapture noundef, i32 noundef) local_unnamed_addr #8

attributes #0 = { noreturn nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }
attributes #11 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!56, !57, !58, !59, !60, !61, !62}
!llvm.ident = !{!63}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "ITER", scope: !2, file: !14, line: 7, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/locked/toy.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/locked", checksumkind: CSK_MD5, checksum: "a11c0181b754ff2a4f407864b773ad6d")
!4 = !{!5, !7, !6, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !{!0, !12, !18, !20}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !14, line: 15, type: !15, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "toy.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/locked", checksumkind: CSK_MD5, checksum: "a11c0181b754ff2a4f407864b773ad6d")
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 32, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 4)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "dynMemory", scope: !2, file: !14, line: 9, type: !5, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "ownThreadLock", scope: !2, file: !14, line: 10, type: !22, isLocal: false, isDefinition: true)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 81920, elements: !54)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_mutex_t", file: !24, line: 72, baseType: !25)
!24 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!25 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !24, line: 67, size: 320, elements: !26)
!26 = !{!27, !48, !52}
!27 = !DIDerivedType(tag: DW_TAG_member, name: "__data", scope: !25, file: !24, line: 69, baseType: !28, size: 320)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_mutex_s", file: !29, line: 22, size: 320, elements: !30)
!29 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h", directory: "", checksumkind: CSK_MD5, checksum: "584baedd80e6041b81caae7f496091c0")
!30 = !{!31, !32, !34, !35, !36, !37, !39, !40}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "__lock", scope: !28, file: !29, line: 24, baseType: !6, size: 32)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !28, file: !29, line: 25, baseType: !33, size: 32, offset: 32)
!33 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "__owner", scope: !28, file: !29, line: 26, baseType: !6, size: 32, offset: 64)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "__nusers", scope: !28, file: !29, line: 28, baseType: !33, size: 32, offset: 96)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "__kind", scope: !28, file: !29, line: 32, baseType: !6, size: 32, offset: 128)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "__spins", scope: !28, file: !29, line: 34, baseType: !38, size: 16, offset: 160)
!38 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "__elision", scope: !28, file: !29, line: 35, baseType: !38, size: 16, offset: 176)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "__list", scope: !28, file: !29, line: 36, baseType: !41, size: 128, offset: 192)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "__pthread_list_t", file: !42, line: 55, baseType: !43)
!42 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h", directory: "", checksumkind: CSK_MD5, checksum: "04c81e86d34dad9c99ad006d32e47a0d")
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__pthread_internal_list", file: !42, line: 51, size: 128, elements: !44)
!44 = !{!45, !47}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "__prev", scope: !43, file: !42, line: 53, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !43, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "__next", scope: !43, file: !42, line: 54, baseType: !46, size: 64, offset: 64)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !25, file: !24, line: 70, baseType: !49, size: 320)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 40)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !25, file: !24, line: 71, baseType: !53, size: 64)
!53 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!54 = !{!55}
!55 = !DISubrange(count: 256)
!56 = !{i32 7, !"Dwarf Version", i32 5}
!57 = !{i32 2, !"Debug Info Version", i32 3}
!58 = !{i32 1, !"wchar_size", i32 4}
!59 = !{i32 8, !"PIC Level", i32 2}
!60 = !{i32 7, !"PIE Level", i32 2}
!61 = !{i32 7, !"uwtable", i32 2}
!62 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!63 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!64 = distinct !DISubprogram(name: "run", scope: !14, file: !14, line: 12, type: !65, scopeLine: 13, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !67)
!65 = !DISubroutineType(types: !66)
!66 = !{!7, !7}
!67 = !{!68, !69, !70, !72, !76}
!68 = !DILocalVariable(name: "ptr", arg: 1, scope: !64, file: !14, line: 12, type: !7)
!69 = !DILocalVariable(name: "start", scope: !64, file: !14, line: 14, type: !6)
!70 = !DILocalVariable(name: "i", scope: !71, file: !14, line: 16, type: !6)
!71 = distinct !DILexicalBlock(scope: !64, file: !14, line: 16, column: 3)
!72 = !DILocalVariable(name: "j", scope: !73, file: !14, line: 18, type: !6)
!73 = distinct !DILexicalBlock(scope: !74, file: !14, line: 18, column: 5)
!74 = distinct !DILexicalBlock(scope: !75, file: !14, line: 17, column: 3)
!75 = distinct !DILexicalBlock(scope: !71, file: !14, line: 16, column: 3)
!76 = !DILocalVariable(name: "val", scope: !77, file: !14, line: 21, type: !6)
!77 = distinct !DILexicalBlock(scope: !78, file: !14, line: 19, column: 5)
!78 = distinct !DILexicalBlock(scope: !73, file: !14, line: 18, column: 5)
!79 = !DILocation(line: 0, scope: !64)
!80 = !DILocation(line: 14, column: 15, scope: !64)
!81 = !{!82, !82, i64 0}
!82 = !{!"int", !83, i64 0}
!83 = !{!"omnipotent char", !84, i64 0}
!84 = !{!"Simple C/C++ TBAA"}
!85 = !DILocation(line: 15, column: 3, scope: !64)
!86 = !DILocation(line: 0, scope: !71)
!87 = !DILocation(line: 16, column: 24, scope: !75)
!88 = !DILocation(line: 16, column: 3, scope: !71)
!89 = !DILocation(line: 18, column: 24, scope: !78)
!90 = !DILocation(line: 0, scope: !73)
!91 = !DILocation(line: 18, column: 22, scope: !78)
!92 = !DILocation(line: 18, column: 5, scope: !73)
!93 = !DILocation(line: 20, column: 7, scope: !77)
!94 = !DILocation(line: 0, scope: !77)
!95 = !DILocation(line: 21, column: 15, scope: !77)
!96 = !{!97, !97, i64 0}
!97 = !{!"any pointer", !83, i64 0}
!98 = !DILocation(line: 27, column: 19, scope: !77)
!99 = !DILocation(line: 28, column: 11, scope: !77)
!100 = !DILocation(line: 34, column: 32, scope: !77)
!101 = !DILocation(line: 35, column: 11, scope: !77)
!102 = !DILocation(line: 41, column: 34, scope: !77)
!103 = !DILocation(line: 42, column: 11, scope: !77)
!104 = !DILocation(line: 48, column: 34, scope: !77)
!105 = !DILocation(line: 49, column: 7, scope: !77)
!106 = !DILocation(line: 52, column: 3, scope: !64)
!107 = !DILocation(line: 16, column: 34, scope: !75)
!108 = distinct !{!108, !88, !109, !110}
!109 = !DILocation(line: 51, column: 3, scope: !71)
!110 = !{!"llvm.loop.mustprogress"}
!111 = !DILocation(line: 24, column: 13, scope: !112)
!112 = distinct !DILexicalBlock(scope: !113, file: !14, line: 24, column: 12)
!113 = distinct !DILexicalBlock(scope: !114, file: !14, line: 23, column: 12)
!114 = distinct !DILexicalBlock(scope: !77, file: !14, line: 22, column: 10)
!115 = !DILocation(line: 24, column: 12, scope: !113)
!116 = !DILocation(line: 31, column: 12, scope: !117)
!117 = distinct !DILexicalBlock(scope: !118, file: !14, line: 30, column: 12)
!118 = distinct !DILexicalBlock(scope: !77, file: !14, line: 29, column: 10)
!119 = !DILocation(line: 38, column: 12, scope: !120)
!120 = distinct !DILexicalBlock(scope: !121, file: !14, line: 37, column: 12)
!121 = distinct !DILexicalBlock(scope: !77, file: !14, line: 36, column: 10)
!122 = !DILocation(line: 0, scope: !123)
!123 = distinct !DILexicalBlock(scope: !124, file: !14, line: 45, column: 12)
!124 = distinct !DILexicalBlock(scope: !125, file: !14, line: 44, column: 12)
!125 = distinct !DILexicalBlock(scope: !77, file: !14, line: 43, column: 10)
!126 = !DILocation(line: 18, column: 31, scope: !78)
!127 = distinct !{!127, !92, !128, !110, !129}
!128 = !DILocation(line: 50, column: 5, scope: !73)
!129 = !{!"llvm.loop.peeled.count", i32 1}
!130 = !DISubprogram(name: "printf", scope: !131, file: !131, line: 356, type: !132, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!131 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!132 = !DISubroutineType(types: !133)
!133 = !{!6, !134, null}
!134 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !135)
!135 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !136, size: 64)
!136 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!137 = !DISubprogram(name: "pthread_mutex_lock", scope: !138, file: !138, line: 794, type: !139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!138 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!139 = !DISubroutineType(types: !140)
!140 = !{!6, !141}
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!142 = !DISubprogram(name: "pthread_mutex_unlock", scope: !138, file: !138, line: 835, type: !139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!143 = !DISubprogram(name: "pthread_exit", scope: !138, file: !138, line: 211, type: !144, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!144 = !DISubroutineType(types: !145)
!145 = !{null, !7}
!146 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 55, type: !147, scopeLine: 56, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !149)
!147 = !DISubroutineType(types: !148)
!148 = !{!6, !6, !8}
!149 = !{!150, !151, !152, !156, !158, !160, !162}
!150 = !DILocalVariable(name: "argc", arg: 1, scope: !146, file: !14, line: 55, type: !6)
!151 = !DILocalVariable(name: "argv", arg: 2, scope: !146, file: !14, line: 55, type: !8)
!152 = !DILocalVariable(name: "threads", scope: !146, file: !14, line: 59, type: !153)
!153 = !DICompositeType(tag: DW_TAG_array_type, baseType: !154, size: 256, elements: !16)
!154 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !24, line: 27, baseType: !155)
!155 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!156 = !DILocalVariable(name: "params", scope: !146, file: !14, line: 60, type: !157)
!157 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128, elements: !16)
!158 = !DILocalVariable(name: "i", scope: !159, file: !14, line: 61, type: !6)
!159 = distinct !DILexicalBlock(scope: !146, file: !14, line: 61, column: 3)
!160 = !DILocalVariable(name: "i", scope: !161, file: !14, line: 66, type: !6)
!161 = distinct !DILexicalBlock(scope: !146, file: !14, line: 66, column: 3)
!162 = !DILocalVariable(name: "i", scope: !163, file: !14, line: 70, type: !6)
!163 = distinct !DILexicalBlock(scope: !146, file: !14, line: 70, column: 3)
!164 = distinct !DIAssignID()
!165 = !DILocation(line: 0, scope: !146)
!166 = distinct !DIAssignID()
!167 = !DILocation(line: 57, column: 11, scope: !168)
!168 = distinct !DILexicalBlock(scope: !146, file: !14, line: 57, column: 6)
!169 = !DILocation(line: 57, column: 6, scope: !146)
!170 = !DILocation(line: 57, column: 25, scope: !168)
!171 = !DILocalVariable(name: "__nptr", arg: 1, scope: !172, file: !173, line: 362, type: !135)
!172 = distinct !DISubprogram(name: "atoi", scope: !173, file: !173, line: 362, type: !174, scopeLine: 363, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !176)
!173 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!174 = !DISubroutineType(types: !175)
!175 = !{!6, !135}
!176 = !{!171}
!177 = !DILocation(line: 0, scope: !172, inlinedAt: !178)
!178 = distinct !DILocation(line: 57, column: 20, scope: !168)
!179 = !DILocation(line: 364, column: 16, scope: !172, inlinedAt: !178)
!180 = !DILocation(line: 364, column: 10, scope: !172, inlinedAt: !178)
!181 = !DILocation(line: 57, column: 19, scope: !168)
!182 = !DILocation(line: 57, column: 15, scope: !168)
!183 = !DILocation(line: 58, column: 22, scope: !146)
!184 = !DILocation(line: 58, column: 13, scope: !146)
!185 = !DILocation(line: 59, column: 3, scope: !146)
!186 = !DILocation(line: 60, column: 3, scope: !146)
!187 = !DILocation(line: 0, scope: !159)
!188 = !DILocation(line: 64, column: 5, scope: !189)
!189 = distinct !DILexicalBlock(scope: !190, file: !14, line: 62, column: 3)
!190 = distinct !DILexicalBlock(scope: !159, file: !14, line: 61, column: 3)
!191 = !DILocation(line: 63, column: 5, scope: !189)
!192 = !DILocation(line: 63, column: 14, scope: !189)
!193 = !DILocation(line: 0, scope: !161)
!194 = !DILocation(line: 68, column: 5, scope: !195)
!195 = distinct !DILexicalBlock(scope: !196, file: !14, line: 67, column: 3)
!196 = distinct !DILexicalBlock(scope: !161, file: !14, line: 66, column: 3)
!197 = !DILocation(line: 68, column: 21, scope: !195)
!198 = !DILocation(line: 0, scope: !163)
!199 = !DILocation(line: 72, column: 18, scope: !200)
!200 = distinct !DILexicalBlock(scope: !201, file: !14, line: 71, column: 3)
!201 = distinct !DILexicalBlock(scope: !163, file: !14, line: 70, column: 3)
!202 = !{!203, !203, i64 0}
!203 = !{!"long", !83, i64 0}
!204 = !DILocation(line: 72, column: 5, scope: !200)
!205 = !DILocation(line: 75, column: 1, scope: !146)
!206 = !DILocation(line: 74, column: 3, scope: !146)
!207 = !DISubprogram(name: "malloc", scope: !173, file: !173, line: 540, type: !208, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!208 = !DISubroutineType(types: !209)
!209 = !{!7, !210}
!210 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !211, line: 18, baseType: !155)
!211 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!212 = !DISubprogram(name: "pthread_mutex_init", scope: !138, file: !138, line: 781, type: !213, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!213 = !DISubroutineType(types: !214)
!214 = !{!6, !141, !215}
!215 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !216, size: 64)
!216 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !217)
!217 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_mutexattr_t", file: !24, line: 36, baseType: !218)
!218 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !24, line: 32, size: 32, elements: !219)
!219 = !{!220, !221}
!220 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !218, file: !24, line: 34, baseType: !15, size: 32)
!221 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !218, file: !24, line: 35, baseType: !6, size: 32)
!222 = !DISubprogram(name: "pthread_create", scope: !138, file: !138, line: 202, type: !223, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!223 = !DISubroutineType(types: !224)
!224 = !{!6, !225, !227, !238, !239}
!225 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !226)
!226 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
!227 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !228)
!228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !229, size: 64)
!229 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !230)
!230 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !24, line: 62, baseType: !231)
!231 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pthread_attr_t", file: !24, line: 56, size: 448, elements: !232)
!232 = !{!233, !237}
!233 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !231, file: !24, line: 58, baseType: !234, size: 448)
!234 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 448, elements: !235)
!235 = !{!236}
!236 = !DISubrange(count: 56)
!237 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !231, file: !24, line: 59, baseType: !53, size: 64)
!238 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!239 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !7)
!240 = !DISubprogram(name: "pthread_join", scope: !138, file: !138, line: 219, type: !241, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!241 = !DISubroutineType(types: !242)
!242 = !{!6, !154, !243}
!243 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!244 = !DISubprogram(name: "strtol", scope: !173, file: !173, line: 177, type: !245, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!245 = !DISubroutineType(types: !246)
!246 = !{!53, !134, !247, !6}
!247 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !8)
