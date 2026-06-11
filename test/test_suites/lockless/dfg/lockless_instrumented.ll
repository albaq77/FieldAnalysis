; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/lockless/dfg/lockless.ll'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/lockless/toy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ITER = dso_local local_unnamed_addr global i32 1000000, align 4, !dbg !0
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1, !dbg !12
@dynMemory = dso_local local_unnamed_addr global ptr null, align 8, !dbg !18

; Function Attrs: noreturn nounwind uwtable
define dso_local noalias noundef nonnull ptr @run(ptr nocapture noundef readonly %0) #0 !dbg !28 {
    #dbg_value(ptr %0, !32, !DIExpression(), !43)
  %2 = load i32, ptr %0, align 4, !dbg !44, !tbaa !45
    #dbg_value(i32 %2, !33, !DIExpression(), !43)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %2), !dbg !49
    #dbg_value(i32 %2, !34, !DIExpression(), !50)
  %4 = icmp slt i32 %2, 16384, !dbg !51
  br i1 %4, label %5, label %23, !dbg !52

5:                                                ; preds = %1
  %6 = load ptr, ptr @dynMemory, align 8
  %7 = getelementptr i8, ptr %6, i64 16, !dbg !52
  %8 = getelementptr i8, ptr %6, i64 32, !dbg !52
  %9 = getelementptr i8, ptr %6, i64 48, !dbg !52
  %10 = sext i32 %2 to i64, !dbg !52
  %11 = load i32, ptr @ITER, align 4, !dbg !53, !tbaa !45
  br label %12, !dbg !52

12:                                               ; preds = %24, %5
  %13 = phi i32 [ %11, %5 ], [ %25, %24 ], !dbg !53
  %14 = phi i64 [ %10, %5 ], [ %26, %24 ]
    #dbg_value(i64 %14, !34, !DIExpression(), !50)
    #dbg_value(i32 0, !36, !DIExpression(), !54)
  %15 = icmp sgt i32 %13, 0, !dbg !55
  br i1 %15, label %16, label %24, !dbg !56

16:                                               ; preds = %12
  %17 = getelementptr inbounds i32, ptr %6, i64 %14
  %18 = getelementptr i32, ptr %7, i64 %14
  %19 = getelementptr i32, ptr %8, i64 %14
  %20 = getelementptr i32, ptr %9, i64 %14
    #dbg_value(i32 0, !36, !DIExpression(), !54)
    #dbg_value(i32 0, !40, !DIExpression(), !57)
  store i32 0, ptr %17, align 4, !dbg !58, !tbaa !45
  store i32 0, ptr %18, align 4, !dbg !59, !tbaa !45
  store i32 0, ptr %19, align 4, !dbg !60, !tbaa !45
  store i32 0, ptr %20, align 4, !dbg !61, !tbaa !45
    #dbg_value(i32 1, !36, !DIExpression(), !54)
  %21 = load i32, ptr @ITER, align 4, !dbg !53, !tbaa !45
  %22 = icmp sgt i32 %21, 1, !dbg !55
  br i1 %22, label %28, label %24, !dbg !56

23:                                               ; preds = %24, %1
  tail call void @pthread_exit(ptr noundef null) #9, !dbg !62
  unreachable, !dbg !62

24:                                               ; preds = %28, %16, %12
  %25 = phi i32 [ %13, %12 ], [ %21, %16 ], [ %43, %28 ]
  %26 = add nsw i64 %14, 16, !dbg !63
    #dbg_value(i64 %26, !34, !DIExpression(), !50)
  %27 = icmp slt i64 %14, 16368, !dbg !51
  br i1 %27, label %12, label %23, !dbg !52, !llvm.loop !64

28:                                               ; preds = %28, %16
  %29 = phi i32 [ %41, %28 ], [ 0, %16 ]
  %30 = phi i32 [ %42, %28 ], [ 1, %16 ]
    #dbg_value(i32 %30, !36, !DIExpression(), !54)
    #dbg_value(i32 poison, !40, !DIExpression(), !57)
  %31 = load i32, ptr %17, align 4, !dbg !67, !tbaa !45
    #dbg_value(i32 %31, !40, !DIExpression(), !57)
  %32 = and i32 %30, 1, !dbg !68
  %33 = icmp eq i32 %32, 0, !dbg !68
  %34 = select i1 %33, i32 2, i32 1, !dbg !72
  %35 = add nsw i32 %31, %34, !dbg !72
    #dbg_value(i32 %35, !40, !DIExpression(), !57)
  store i32 %35, ptr %17, align 4, !dbg !58, !tbaa !45
  %36 = load i32, ptr %18, align 4, !dbg !73, !tbaa !45
    #dbg_value(i32 %36, !40, !DIExpression(), !57)
  %37 = add nsw i32 %36, %34, !dbg !74
    #dbg_value(i32 %37, !40, !DIExpression(), !57)
  store i32 %37, ptr %18, align 4, !dbg !59, !tbaa !45
  %38 = load i32, ptr %19, align 4, !dbg !77, !tbaa !45
    #dbg_value(i32 %38, !40, !DIExpression(), !57)
  %39 = add nsw i32 %38, %34, !dbg !78
    #dbg_value(i32 %39, !40, !DIExpression(), !57)
  store i32 %39, ptr %19, align 4, !dbg !60, !tbaa !45
    #dbg_value(i32 %29, !40, !DIExpression(), !57)
    #dbg_value(i32 %41, !40, !DIExpression(), !57)
    #dbg_value(i32 %41, !40, !DIExpression(), !57)
  %40 = select i1 %33, i32 2, i32 1
  %41 = add nuw nsw i32 %29, %40, !dbg !81
    #dbg_value(i32 %41, !40, !DIExpression(), !57)
  store i32 %41, ptr %20, align 4, !dbg !61, !tbaa !45
  %42 = add nuw nsw i32 %30, 1, !dbg !85
    #dbg_value(i32 %42, !36, !DIExpression(), !54)
  %43 = load i32, ptr @ITER, align 4, !dbg !53, !tbaa !45
  %44 = icmp slt i32 %42, %43, !dbg !55
  br i1 %44, label %28, label %24, !dbg !56, !llvm.loop !86
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree nounwind
declare !dbg !89 noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: noreturn
declare !dbg !96 void @pthread_exit(ptr noundef) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local noundef i32 @main(i32 noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #4 !dbg !100 {
  %3 = alloca [4 x i64], align 16, !DIAssignID !119
    #dbg_assign(i1 undef, !106, !DIExpression(), !119, ptr %3, !DIExpression(), !120)
  %4 = alloca [4 x i32], align 16, !DIAssignID !121
    #dbg_assign(i1 undef, !111, !DIExpression(), !121, ptr %4, !DIExpression(), !120)
    #dbg_value(i32 %0, !104, !DIExpression(), !120)
    #dbg_value(ptr %1, !105, !DIExpression(), !120)
  %5 = icmp sgt i32 %0, 1, !dbg !122
  br i1 %5, label %6, label %11, !dbg !124

6:                                                ; preds = %2
  %7 = getelementptr inbounds i8, ptr %1, i64 8, !dbg !125
  %8 = load ptr, ptr %7, align 8, !dbg !125, !tbaa !126
    #dbg_value(ptr %8, !128, !DIExpression(), !134)
  %9 = tail call i64 @strtol(ptr nocapture noundef nonnull %8, ptr noundef null, i32 noundef 10) #10, !dbg !136
  %10 = trunc i64 %9 to i32, !dbg !137
  store i32 %10, ptr @ITER, align 4, !dbg !138, !tbaa !45
  br label %11, !dbg !139

11:                                               ; preds = %6, %2
  %12 = tail call noalias dereferenceable_or_null(65536) ptr @malloc(i64 noundef 65536) #11, !dbg !140
  store ptr %12, ptr @dynMemory, align 8, !dbg !141, !tbaa !126
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %3) #10, !dbg !142
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %4) #10, !dbg !143
    #dbg_value(i32 0, !113, !DIExpression(), !144)
    #dbg_value(i64 0, !113, !DIExpression(), !144)
    #dbg_value(i64 1, !113, !DIExpression(), !144)
  %13 = getelementptr inbounds i8, ptr %4, i64 4, !dbg !145
    #dbg_value(i64 2, !113, !DIExpression(), !144)
  %14 = getelementptr inbounds i8, ptr %4, i64 8, !dbg !145
    #dbg_value(i64 3, !113, !DIExpression(), !144)
  %15 = getelementptr inbounds i8, ptr %4, i64 12, !dbg !145
  store <4 x i32> <i32 0, i32 1, i32 2, i32 3>, ptr %4, align 16, !dbg !148, !tbaa !45
    #dbg_value(i64 4, !113, !DIExpression(), !144)
    #dbg_value(i64 0, !115, !DIExpression(), !149)
  %16 = call i32 @pthread_create(ptr noundef nonnull %3, ptr noundef null, ptr noundef nonnull @run, ptr noundef nonnull %4) #10, !dbg !150
    #dbg_value(i64 1, !115, !DIExpression(), !149)
  %17 = getelementptr inbounds i8, ptr %3, i64 8, !dbg !153
  %18 = call i32 @pthread_create(ptr noundef nonnull %17, ptr noundef null, ptr noundef nonnull @run, ptr noundef nonnull %13) #10, !dbg !150
    #dbg_value(i64 2, !115, !DIExpression(), !149)
  %19 = getelementptr inbounds i8, ptr %3, i64 16, !dbg !153
  %20 = call i32 @pthread_create(ptr noundef nonnull %19, ptr noundef null, ptr noundef nonnull @run, ptr noundef nonnull %14) #10, !dbg !150
    #dbg_value(i64 3, !115, !DIExpression(), !149)
  %21 = getelementptr inbounds i8, ptr %3, i64 24, !dbg !153
  %22 = call i32 @pthread_create(ptr noundef nonnull %21, ptr noundef null, ptr noundef nonnull @run, ptr noundef nonnull %15) #10, !dbg !150
    #dbg_value(i64 4, !115, !DIExpression(), !149)
    #dbg_value(i64 0, !117, !DIExpression(), !154)
  %23 = load i64, ptr %3, align 16, !dbg !155, !tbaa !158
  %24 = call i32 @pthread_join(i64 noundef %23, ptr noundef null) #10, !dbg !160
    #dbg_value(i64 1, !117, !DIExpression(), !154)
  %25 = load i64, ptr %17, align 8, !dbg !155, !tbaa !158
  %26 = call i32 @pthread_join(i64 noundef %25, ptr noundef null) #10, !dbg !160
    #dbg_value(i64 2, !117, !DIExpression(), !154)
  %27 = load i64, ptr %19, align 16, !dbg !155, !tbaa !158
  %28 = call i32 @pthread_join(i64 noundef %27, ptr noundef null) #10, !dbg !160
    #dbg_value(i64 3, !117, !DIExpression(), !154)
  %29 = load i64, ptr %21, align 8, !dbg !155, !tbaa !158
  %30 = call i32 @pthread_join(i64 noundef %29, ptr noundef null) #10, !dbg !160
    #dbg_value(i64 4, !117, !DIExpression(), !154)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %4) #10, !dbg !161
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %3) #10, !dbg !161
  ret i32 0, !dbg !162
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare !dbg !163 noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #5

; Function Attrs: nounwind
declare !dbg !168 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #6

declare !dbg !187 i32 @pthread_join(i64 noundef, ptr noundef) local_unnamed_addr #7

; Function Attrs: mustprogress nofree nounwind willreturn
declare !dbg !191 i64 @strtol(ptr noundef readonly, ptr nocapture noundef, i32 noundef) local_unnamed_addr #8

attributes #0 = { noreturn nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { mustprogress nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind }
attributes #11 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!20, !21, !22, !23, !24, !25, !26}
!llvm.ident = !{!27}
!fieldanalysis.instrumented = !{}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "ITER", scope: !2, file: !14, line: 7, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/lockless/toy.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/lockless", checksumkind: CSK_MD5, checksum: "736d81980f3c5c786922f6d0712d6069")
!4 = !{!5, !7, !6, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !9, size: 64)
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!10 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!11 = !{!0, !12, !18}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !14, line: 15, type: !15, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "toy.c", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/lockless", checksumkind: CSK_MD5, checksum: "736d81980f3c5c786922f6d0712d6069")
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 32, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 4)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "dynMemory", scope: !2, file: !14, line: 9, type: !5, isLocal: false, isDefinition: true)
!20 = !{i32 7, !"Dwarf Version", i32 5}
!21 = !{i32 2, !"Debug Info Version", i32 3}
!22 = !{i32 1, !"wchar_size", i32 4}
!23 = !{i32 8, !"PIC Level", i32 2}
!24 = !{i32 7, !"PIE Level", i32 2}
!25 = !{i32 7, !"uwtable", i32 2}
!26 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!27 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!28 = distinct !DISubprogram(name: "run", scope: !14, file: !14, line: 12, type: !29, scopeLine: 13, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !31)
!29 = !DISubroutineType(types: !30)
!30 = !{!7, !7}
!31 = !{!32, !33, !34, !36, !40}
!32 = !DILocalVariable(name: "ptr", arg: 1, scope: !28, file: !14, line: 12, type: !7)
!33 = !DILocalVariable(name: "start", scope: !28, file: !14, line: 14, type: !6)
!34 = !DILocalVariable(name: "i", scope: !35, file: !14, line: 16, type: !6)
!35 = distinct !DILexicalBlock(scope: !28, file: !14, line: 16, column: 3)
!36 = !DILocalVariable(name: "j", scope: !37, file: !14, line: 18, type: !6)
!37 = distinct !DILexicalBlock(scope: !38, file: !14, line: 18, column: 5)
!38 = distinct !DILexicalBlock(scope: !39, file: !14, line: 17, column: 3)
!39 = distinct !DILexicalBlock(scope: !35, file: !14, line: 16, column: 3)
!40 = !DILocalVariable(name: "val", scope: !41, file: !14, line: 21, type: !6)
!41 = distinct !DILexicalBlock(scope: !42, file: !14, line: 19, column: 5)
!42 = distinct !DILexicalBlock(scope: !37, file: !14, line: 18, column: 5)
!43 = !DILocation(line: 0, scope: !28)
!44 = !DILocation(line: 14, column: 15, scope: !28)
!45 = !{!46, !46, i64 0}
!46 = !{!"int", !47, i64 0}
!47 = !{!"omnipotent char", !48, i64 0}
!48 = !{!"Simple C/C++ TBAA"}
!49 = !DILocation(line: 15, column: 3, scope: !28)
!50 = !DILocation(line: 0, scope: !35)
!51 = !DILocation(line: 16, column: 24, scope: !39)
!52 = !DILocation(line: 16, column: 3, scope: !35)
!53 = !DILocation(line: 18, column: 24, scope: !42)
!54 = !DILocation(line: 0, scope: !37)
!55 = !DILocation(line: 18, column: 22, scope: !42)
!56 = !DILocation(line: 18, column: 5, scope: !37)
!57 = !DILocation(line: 0, scope: !41)
!58 = !DILocation(line: 27, column: 19, scope: !41)
!59 = !DILocation(line: 34, column: 32, scope: !41)
!60 = !DILocation(line: 41, column: 34, scope: !41)
!61 = !DILocation(line: 48, column: 34, scope: !41)
!62 = !DILocation(line: 52, column: 3, scope: !28)
!63 = !DILocation(line: 16, column: 34, scope: !39)
!64 = distinct !{!64, !52, !65, !66}
!65 = !DILocation(line: 51, column: 3, scope: !35)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 21, column: 15, scope: !41)
!68 = !DILocation(line: 24, column: 13, scope: !69)
!69 = distinct !DILexicalBlock(scope: !70, file: !14, line: 24, column: 12)
!70 = distinct !DILexicalBlock(scope: !71, file: !14, line: 23, column: 12)
!71 = distinct !DILexicalBlock(scope: !41, file: !14, line: 22, column: 10)
!72 = !DILocation(line: 24, column: 12, scope: !70)
!73 = !DILocation(line: 28, column: 11, scope: !41)
!74 = !DILocation(line: 31, column: 12, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !14, line: 30, column: 12)
!76 = distinct !DILexicalBlock(scope: !41, file: !14, line: 29, column: 10)
!77 = !DILocation(line: 35, column: 11, scope: !41)
!78 = !DILocation(line: 38, column: 12, scope: !79)
!79 = distinct !DILexicalBlock(scope: !80, file: !14, line: 37, column: 12)
!80 = distinct !DILexicalBlock(scope: !41, file: !14, line: 36, column: 10)
!81 = !DILocation(line: 0, scope: !82)
!82 = distinct !DILexicalBlock(scope: !83, file: !14, line: 45, column: 12)
!83 = distinct !DILexicalBlock(scope: !84, file: !14, line: 44, column: 12)
!84 = distinct !DILexicalBlock(scope: !41, file: !14, line: 43, column: 10)
!85 = !DILocation(line: 18, column: 31, scope: !42)
!86 = distinct !{!86, !56, !87, !66, !88}
!87 = !DILocation(line: 50, column: 5, scope: !37)
!88 = !{!"llvm.loop.peeled.count", i32 1}
!89 = !DISubprogram(name: "printf", scope: !90, file: !90, line: 356, type: !91, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!90 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!91 = !DISubroutineType(types: !92)
!92 = !{!6, !93, null}
!93 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !94)
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !95, size: 64)
!95 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!96 = !DISubprogram(name: "pthread_exit", scope: !97, file: !97, line: 211, type: !98, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!97 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!98 = !DISubroutineType(types: !99)
!99 = !{null, !7}
!100 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 55, type: !101, scopeLine: 56, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !103)
!101 = !DISubroutineType(types: !102)
!102 = !{!6, !6, !8}
!103 = !{!104, !105, !106, !111, !113, !115, !117}
!104 = !DILocalVariable(name: "argc", arg: 1, scope: !100, file: !14, line: 55, type: !6)
!105 = !DILocalVariable(name: "argv", arg: 2, scope: !100, file: !14, line: 55, type: !8)
!106 = !DILocalVariable(name: "threads", scope: !100, file: !14, line: 60, type: !107)
!107 = !DICompositeType(tag: DW_TAG_array_type, baseType: !108, size: 256, elements: !16)
!108 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !109, line: 27, baseType: !110)
!109 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!110 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!111 = !DILocalVariable(name: "params", scope: !100, file: !14, line: 61, type: !112)
!112 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 128, elements: !16)
!113 = !DILocalVariable(name: "i", scope: !114, file: !14, line: 62, type: !6)
!114 = distinct !DILexicalBlock(scope: !100, file: !14, line: 62, column: 3)
!115 = !DILocalVariable(name: "i", scope: !116, file: !14, line: 67, type: !6)
!116 = distinct !DILexicalBlock(scope: !100, file: !14, line: 67, column: 3)
!117 = !DILocalVariable(name: "i", scope: !118, file: !14, line: 71, type: !6)
!118 = distinct !DILexicalBlock(scope: !100, file: !14, line: 71, column: 3)
!119 = distinct !DIAssignID()
!120 = !DILocation(line: 0, scope: !100)
!121 = distinct !DIAssignID()
!122 = !DILocation(line: 57, column: 12, scope: !123)
!123 = distinct !DILexicalBlock(scope: !100, file: !14, line: 57, column: 7)
!124 = !DILocation(line: 57, column: 7, scope: !100)
!125 = !DILocation(line: 58, column: 17, scope: !123)
!126 = !{!127, !127, i64 0}
!127 = !{!"any pointer", !47, i64 0}
!128 = !DILocalVariable(name: "__nptr", arg: 1, scope: !129, file: !130, line: 362, type: !94)
!129 = distinct !DISubprogram(name: "atoi", scope: !130, file: !130, line: 362, type: !131, scopeLine: 363, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !133)
!130 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!131 = !DISubroutineType(types: !132)
!132 = !{!6, !94}
!133 = !{!128}
!134 = !DILocation(line: 0, scope: !129, inlinedAt: !135)
!135 = distinct !DILocation(line: 58, column: 12, scope: !123)
!136 = !DILocation(line: 364, column: 16, scope: !129, inlinedAt: !135)
!137 = !DILocation(line: 364, column: 10, scope: !129, inlinedAt: !135)
!138 = !DILocation(line: 58, column: 10, scope: !123)
!139 = !DILocation(line: 58, column: 5, scope: !123)
!140 = !DILocation(line: 59, column: 22, scope: !100)
!141 = !DILocation(line: 59, column: 13, scope: !100)
!142 = !DILocation(line: 60, column: 3, scope: !100)
!143 = !DILocation(line: 61, column: 3, scope: !100)
!144 = !DILocation(line: 0, scope: !114)
!145 = !DILocation(line: 64, column: 5, scope: !146)
!146 = distinct !DILexicalBlock(scope: !147, file: !14, line: 63, column: 3)
!147 = distinct !DILexicalBlock(scope: !114, file: !14, line: 62, column: 3)
!148 = !DILocation(line: 64, column: 14, scope: !146)
!149 = !DILocation(line: 0, scope: !116)
!150 = !DILocation(line: 69, column: 5, scope: !151)
!151 = distinct !DILexicalBlock(scope: !152, file: !14, line: 68, column: 3)
!152 = distinct !DILexicalBlock(scope: !116, file: !14, line: 67, column: 3)
!153 = !DILocation(line: 69, column: 21, scope: !151)
!154 = !DILocation(line: 0, scope: !118)
!155 = !DILocation(line: 73, column: 18, scope: !156)
!156 = distinct !DILexicalBlock(scope: !157, file: !14, line: 72, column: 3)
!157 = distinct !DILexicalBlock(scope: !118, file: !14, line: 71, column: 3)
!158 = !{!159, !159, i64 0}
!159 = !{!"long", !47, i64 0}
!160 = !DILocation(line: 73, column: 5, scope: !156)
!161 = !DILocation(line: 76, column: 1, scope: !100)
!162 = !DILocation(line: 75, column: 3, scope: !100)
!163 = !DISubprogram(name: "malloc", scope: !130, file: !130, line: 540, type: !164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!164 = !DISubroutineType(types: !165)
!165 = !{!7, !166}
!166 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !167, line: 18, baseType: !110)
!167 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!168 = !DISubprogram(name: "pthread_create", scope: !97, file: !97, line: 202, type: !169, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!169 = !DISubroutineType(types: !170)
!170 = !{!6, !171, !173, !185, !186}
!171 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !172)
!172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!173 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !174)
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64)
!175 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !176)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !109, line: 62, baseType: !177)
!177 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pthread_attr_t", file: !109, line: 56, size: 448, elements: !178)
!178 = !{!179, !183}
!179 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !177, file: !109, line: 58, baseType: !180, size: 448)
!180 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 448, elements: !181)
!181 = !{!182}
!182 = !DISubrange(count: 56)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !177, file: !109, line: 59, baseType: !184, size: 64)
!184 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!185 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!186 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !7)
!187 = !DISubprogram(name: "pthread_join", scope: !97, file: !97, line: 219, type: !188, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!188 = !DISubroutineType(types: !189)
!189 = !{!6, !108, !190}
!190 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!191 = !DISubprogram(name: "strtol", scope: !130, file: !130, line: 177, type: !192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!192 = !DISubroutineType(types: !193)
!193 = !{!184, !93, !194, !6}
!194 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !8)
