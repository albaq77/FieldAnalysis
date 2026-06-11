; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/atomic_lock/sequential.cpp'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/atomic_lock/sequential.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }
%struct.timespec = type { i64, i64 }
%"class.std::unique_ptr" = type { %"struct.std::__uniq_ptr_data" }
%"struct.std::__uniq_ptr_data" = type { %"class.std::__uniq_ptr_impl" }
%"class.std::__uniq_ptr_impl" = type { %"class.std::tuple" }
%"class.std::tuple" = type { %"struct.std::_Tuple_impl" }
%"struct.std::_Tuple_impl" = type { %"struct.std::_Head_base.2" }
%"struct.std::_Head_base.2" = type { ptr }
%"class.std::thread" = type { %"class.std::thread::id" }
%"class.std::thread::id" = type { i64 }

$_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEED0Ev = comdat any

$_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEE6_M_runEv = comdat any

$_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE = comdat any

$_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE = comdat any

$_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external hidden global i8
@lock = dso_local global { { i8 } } zeroinitializer, align 1, !dbg !7
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [16 x i8] c"This is thread \00", align 1, !dbg !898
@.str.1 = private unnamed_addr constant [26 x i8] c"! Sleeping for 1 second.\0A\00", align 1, !dbg !906
@.str.2 = private unnamed_addr constant [8 x i8] c"Thread \00", align 1, !dbg !911
@.str.3 = private unnamed_addr constant [15 x i8] c" is quitting.\0A\00", align 1, !dbg !916
@_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE = linkonce_odr dso_local unnamed_addr constant { [5 x ptr] } { [5 x ptr] [ptr null, ptr @_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE, ptr @_ZNSt6thread6_StateD2Ev, ptr @_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEED0Ev, ptr @_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEE6_M_runEv] }, comdat, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global [0 x ptr]
@_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE = linkonce_odr dso_local constant [60 x i8] c"NSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE\00", comdat, align 1
@_ZTINSt6thread6_StateE = external constant ptr
@_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE, ptr @_ZTINSt6thread6_StateE }, comdat, align 8
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_I_sequential.cpp, ptr null }]

declare void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #0

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nofree nounwind
declare i32 @__cxa_atexit(ptr, ptr, ptr) local_unnamed_addr #2

; Function Attrs: mustprogress uwtable
define dso_local void @_Z12thread_printm(i64 noundef %0) #3 personality ptr @__gxx_personality_v0 !dbg !1861 {
  %2 = alloca %struct.timespec, align 8, !DIAssignID !1866
    #dbg_value(i64 %0, !1865, !DIExpression(), !1867)
    #dbg_value(ptr @lock, !1868, !DIExpression(), !1872)
  br label %3, !dbg !1874

3:                                                ; preds = %3, %1
    #dbg_value(ptr @lock, !1875, !DIExpression(), !1880)
    #dbg_value(i32 2, !1878, !DIExpression(), !1880)
  %4 = atomicrmw xchg ptr @lock, i8 1 acquire, align 1, !dbg !1882
  %5 = icmp eq i8 %4, 0, !dbg !1882
  br i1 %5, label %6, label %3, !dbg !1874, !llvm.loop !1883

6:                                                ; preds = %3
    #dbg_value(ptr @_ZSt4cout, !1886, !DIExpression(), !1951)
    #dbg_value(ptr @.str, !1895, !DIExpression(), !1951)
  %7 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str, i64 noundef 15), !dbg !1953
    #dbg_value(ptr @_ZSt4cout, !1955, !DIExpression(), !1966)
    #dbg_value(i64 %0, !1964, !DIExpression(), !1966)
  %8 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertImEERSoT_(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %0), !dbg !1968
    #dbg_value(ptr %8, !1886, !DIExpression(), !1969)
    #dbg_value(ptr @.str.1, !1895, !DIExpression(), !1969)
  %9 = tail call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull @.str.1, i64 noundef 25), !dbg !1971
    #dbg_assign(i1 undef, !1972, !DIExpression(), !1866, ptr %2, !DIExpression(), !2001)
    #dbg_value(ptr undef, !1979, !DIExpression(), !2001)
    #dbg_value(i64 1, !1980, !DIExpression(), !2001)
    #dbg_value(i64 0, !1987, !DIExpression(), !2001)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %2) #12, !dbg !2003
  store i64 1, ptr %2, align 8, !dbg !2004, !tbaa !2005, !DIAssignID !2010
    #dbg_assign(i64 1, !1972, !DIExpression(DW_OP_LLVM_fragment, 0, 64), !2010, ptr %2, !DIExpression(), !2001)
  %10 = getelementptr inbounds i8, ptr %2, i64 8, !dbg !2004
  store i64 0, ptr %10, align 8, !dbg !2004, !tbaa !2011, !DIAssignID !2012
    #dbg_assign(i64 0, !1972, !DIExpression(DW_OP_LLVM_fragment, 64, 64), !2012, ptr %10, !DIExpression(), !2001)
  br label %11, !dbg !2013

11:                                               ; preds = %14, %6
  %12 = call i32 @nanosleep(ptr noundef nonnull %2, ptr noundef nonnull %2), !dbg !2014
  %13 = icmp eq i32 %12, -1, !dbg !2015
  br i1 %13, label %14, label %18, !dbg !2016

14:                                               ; preds = %11
  %15 = tail call ptr @__errno_location() #13, !dbg !2017
  %16 = load i32, ptr %15, align 4, !dbg !2017, !tbaa !2018
  %17 = icmp eq i32 %16, 4, !dbg !2020
  br i1 %17, label %11, label %18, !dbg !2013, !llvm.loop !2021

18:                                               ; preds = %11, %14
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %2) #12, !dbg !2023
    #dbg_value(ptr @_ZSt4cout, !1886, !DIExpression(), !2024)
    #dbg_value(ptr @.str.2, !1895, !DIExpression(), !2024)
  %19 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef nonnull @.str.2, i64 noundef 7), !dbg !2026
    #dbg_value(ptr @_ZSt4cout, !1955, !DIExpression(), !2027)
    #dbg_value(i64 %0, !1964, !DIExpression(), !2027)
  %20 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertImEERSoT_(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, i64 noundef %0), !dbg !2029
    #dbg_value(ptr %20, !1886, !DIExpression(), !2030)
    #dbg_value(ptr @.str.3, !1895, !DIExpression(), !2030)
  %21 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8) %20, ptr noundef nonnull @.str.3, i64 noundef 14), !dbg !2032
    #dbg_value(ptr @lock, !2033, !DIExpression(), !2036)
    #dbg_value(ptr @lock, !2038, !DIExpression(), !2043)
    #dbg_value(i32 3, !2041, !DIExpression(), !2043)
    #dbg_value(i32 undef, !2042, !DIExpression(), !2043)
  store atomic i8 0, ptr @lock release, align 1, !dbg !2045
  ret void, !dbg !2046
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #4

; Function Attrs: mustprogress norecurse uwtable
define dso_local noundef i32 @main() local_unnamed_addr #5 personality ptr @__gxx_personality_v0 !dbg !2047 {
  %1 = alloca %"class.std::unique_ptr", align 8
  %2 = alloca %"class.std::unique_ptr", align 8
  %3 = alloca [2 x %"class.std::thread"], align 16, !DIAssignID !2061
    #dbg_assign(i1 undef, !2049, !DIExpression(), !2061, ptr %3, !DIExpression(), !2062)
  %4 = alloca %"class.std::thread", align 8
  %5 = alloca %"class.std::thread", align 8
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %3) #12, !dbg !2063
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(16) %3, i8 0, i64 16, i1 false), !dbg !2064, !tbaa !2074
    #dbg_value(!DIArgList(ptr %3, i64 poison), !2072, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !2076)
    #dbg_value(!DIArgList(ptr %3, i64 poison), !2067, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !2077)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %4) #12, !dbg !2078
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2), !dbg !2079
    #dbg_value(ptr %4, !2090, !DIExpression(), !2096)
    #dbg_value(ptr @_Z12thread_printm, !2091, !DIExpression(), !2096)
    #dbg_value(ptr undef, !2092, !DIExpression(), !2096)
    #dbg_value(ptr %4, !2067, !DIExpression(), !2097)
  store i64 0, ptr %4, align 8, !dbg !2079, !tbaa !2074
    #dbg_value(ptr null, !2093, !DIExpression(), !2098)
  %6 = invoke noalias noundef nonnull dereferenceable(24) ptr @_Znwm(i64 noundef 24) #14
          to label %7 unwind label %49, !dbg !2099

7:                                                ; preds = %0
    #dbg_value(ptr %6, !2100, !DIExpression(), !2123)
    #dbg_value(ptr @_Z12thread_printm, !2120, !DIExpression(), !2123)
    #dbg_value(ptr undef, !2121, !DIExpression(), !2123)
  store ptr getelementptr inbounds inrange(-16, 24) (i8, ptr @_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE, i64 16), ptr %6, align 8, !dbg !2125, !tbaa !2126
  %8 = getelementptr inbounds i8, ptr %6, i64 8, !dbg !2128
    #dbg_value(ptr %8, !2129, !DIExpression(), !2138)
    #dbg_value(ptr @_Z12thread_printm, !2135, !DIExpression(), !2138)
    #dbg_value(ptr undef, !2136, !DIExpression(), !2138)
    #dbg_value(ptr %8, !2140, !DIExpression(), !2152)
    #dbg_value(ptr @_Z12thread_printm, !2149, !DIExpression(), !2152)
    #dbg_value(ptr undef, !2150, !DIExpression(), !2152)
    #dbg_value(ptr %8, !2154, !DIExpression(), !2166)
    #dbg_value(ptr @_Z12thread_printm, !2163, !DIExpression(), !2166)
    #dbg_value(ptr undef, !2164, !DIExpression(), !2166)
    #dbg_value(ptr %8, !2168, !DIExpression(), !2178)
    #dbg_value(ptr undef, !2176, !DIExpression(), !2178)
    #dbg_value(ptr %8, !2180, !DIExpression(), !2188)
    #dbg_value(ptr undef, !2186, !DIExpression(), !2188)
  store i32 0, ptr %8, align 4, !dbg !2190, !tbaa !2191
  %9 = getelementptr inbounds i8, ptr %6, i64 16, !dbg !2193
    #dbg_value(ptr %9, !2194, !DIExpression(), !2199)
    #dbg_value(ptr undef, !2197, !DIExpression(), !2199)
  store ptr @_Z12thread_printm, ptr %9, align 8, !dbg !2201, !tbaa !2202
    #dbg_value(ptr %2, !2205, !DIExpression(), !2213)
    #dbg_value(ptr %6, !2211, !DIExpression(), !2213)
    #dbg_value(ptr %2, !2215, !DIExpression(), !2223)
    #dbg_value(ptr %6, !2221, !DIExpression(), !2223)
    #dbg_value(ptr %2, !2225, !DIExpression(), !2230)
    #dbg_value(ptr %6, !2228, !DIExpression(), !2230)
  store ptr %6, ptr %2, align 8, !dbg !2232, !tbaa !2234
  invoke void @_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE(ptr noundef nonnull align 8 dereferenceable(8) %4, ptr noundef nonnull %2, ptr noundef null)
          to label %10 unwind label %17, !dbg !2235

10:                                               ; preds = %7
    #dbg_value(ptr %2, !2236, !DIExpression(), !2241)
    #dbg_value(ptr %2, !2239, !DIExpression(), !2243)
  %11 = load ptr, ptr %2, align 8, !dbg !2244, !tbaa !2234
  %12 = icmp eq ptr %11, null, !dbg !2246
  br i1 %12, label %25, label %13, !dbg !2247

13:                                               ; preds = %10
    #dbg_value(ptr %2, !2248, !DIExpression(), !2253)
    #dbg_value(ptr %11, !2251, !DIExpression(), !2253)
  %14 = load ptr, ptr %11, align 8, !dbg !2255, !tbaa !2126
  %15 = getelementptr inbounds i8, ptr %14, i64 8, !dbg !2255
  %16 = load ptr, ptr %15, align 8, !dbg !2255
  call void %16(ptr noundef nonnull align 8 dereferenceable(8) %11) #12, !dbg !2255
  br label %25, !dbg !2256

17:                                               ; preds = %7
  %18 = landingpad { ptr, i32 }
          cleanup, !dbg !2257
    #dbg_value(ptr %2, !2236, !DIExpression(), !2258)
    #dbg_value(ptr %2, !2239, !DIExpression(), !2260)
  %19 = load ptr, ptr %2, align 8, !dbg !2261, !tbaa !2234
  %20 = icmp eq ptr %19, null, !dbg !2262
  br i1 %20, label %51, label %21, !dbg !2263

21:                                               ; preds = %17
    #dbg_value(ptr %2, !2248, !DIExpression(), !2264)
    #dbg_value(ptr %19, !2251, !DIExpression(), !2264)
  %22 = load ptr, ptr %19, align 8, !dbg !2266, !tbaa !2126
  %23 = getelementptr inbounds i8, ptr %22, i64 8, !dbg !2266
  %24 = load ptr, ptr %23, align 8, !dbg !2266
  call void %24(ptr noundef nonnull align 8 dereferenceable(8) %19) #12, !dbg !2266
  br label %51, !dbg !2267

25:                                               ; preds = %10, %13
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2), !dbg !2268
    #dbg_value(ptr %3, !2269, !DIExpression(), !2273)
    #dbg_value(ptr %4, !2272, !DIExpression(), !2273)
    #dbg_value(ptr %3, !2275, !DIExpression(), !2279)
    #dbg_value(i64 0, !2282, !DIExpression(), !2288)
    #dbg_value(i64 0, !2287, !DIExpression(), !2288)
    #dbg_value(ptr %3, !2290, !DIExpression(), !2294)
    #dbg_value(ptr %4, !2293, !DIExpression(), !2294)
    #dbg_value(ptr %3, !2296, !DIExpression(), !2311)
    #dbg_value(ptr %4, !2307, !DIExpression(), !2311)
    #dbg_value(i64 0, !2308, !DIExpression(), !2311)
  %26 = load i64, ptr %4, align 8, !dbg !2313, !tbaa !2314
  store i64 %26, ptr %3, align 16, !dbg !2313, !tbaa !2314, !DIAssignID !2315
    #dbg_assign(i64 %26, !2049, !DIExpression(DW_OP_LLVM_fragment, 0, 64), !2315, ptr %3, !DIExpression(), !2062)
    #dbg_value(ptr %4, !2316, !DIExpression(), !2319)
    #dbg_value(ptr %4, !2275, !DIExpression(), !2321)
    #dbg_value(i64 0, !2282, !DIExpression(), !2325)
    #dbg_value(i64 0, !2287, !DIExpression(), !2325)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #12, !dbg !2327
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5) #12, !dbg !2328
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %1), !dbg !2329
    #dbg_value(ptr %5, !2090, !DIExpression(), !2332)
    #dbg_value(ptr @_Z12thread_printm, !2091, !DIExpression(), !2332)
    #dbg_value(ptr undef, !2092, !DIExpression(), !2332)
    #dbg_value(ptr %5, !2067, !DIExpression(), !2333)
  store i64 0, ptr %5, align 8, !dbg !2329, !tbaa !2074
    #dbg_value(ptr null, !2093, !DIExpression(), !2334)
  %27 = invoke noalias noundef nonnull dereferenceable(24) ptr @_Znwm(i64 noundef 24) #14
          to label %28 unwind label %53, !dbg !2335

28:                                               ; preds = %25
    #dbg_value(ptr %27, !2100, !DIExpression(), !2336)
    #dbg_value(ptr @_Z12thread_printm, !2120, !DIExpression(), !2336)
    #dbg_value(ptr undef, !2121, !DIExpression(), !2336)
  store ptr getelementptr inbounds inrange(-16, 24) (i8, ptr @_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE, i64 16), ptr %27, align 8, !dbg !2338, !tbaa !2126
  %29 = getelementptr inbounds i8, ptr %27, i64 8, !dbg !2339
    #dbg_value(ptr %29, !2129, !DIExpression(), !2340)
    #dbg_value(ptr @_Z12thread_printm, !2135, !DIExpression(), !2340)
    #dbg_value(ptr undef, !2136, !DIExpression(), !2340)
    #dbg_value(ptr %29, !2140, !DIExpression(), !2342)
    #dbg_value(ptr @_Z12thread_printm, !2149, !DIExpression(), !2342)
    #dbg_value(ptr undef, !2150, !DIExpression(), !2342)
    #dbg_value(ptr %29, !2154, !DIExpression(), !2344)
    #dbg_value(ptr @_Z12thread_printm, !2163, !DIExpression(), !2344)
    #dbg_value(ptr undef, !2164, !DIExpression(), !2344)
    #dbg_value(ptr %29, !2168, !DIExpression(), !2346)
    #dbg_value(ptr undef, !2176, !DIExpression(), !2346)
    #dbg_value(ptr %29, !2180, !DIExpression(), !2348)
    #dbg_value(ptr undef, !2186, !DIExpression(), !2348)
  store i32 1, ptr %29, align 4, !dbg !2350, !tbaa !2191
  %30 = getelementptr inbounds i8, ptr %27, i64 16, !dbg !2351
    #dbg_value(ptr %30, !2194, !DIExpression(), !2352)
    #dbg_value(ptr undef, !2197, !DIExpression(), !2352)
  store ptr @_Z12thread_printm, ptr %30, align 8, !dbg !2354, !tbaa !2202
    #dbg_value(ptr %1, !2205, !DIExpression(), !2355)
    #dbg_value(ptr %27, !2211, !DIExpression(), !2355)
    #dbg_value(ptr %1, !2215, !DIExpression(), !2357)
    #dbg_value(ptr %27, !2221, !DIExpression(), !2357)
    #dbg_value(ptr %1, !2225, !DIExpression(), !2359)
    #dbg_value(ptr %27, !2228, !DIExpression(), !2359)
  store ptr %27, ptr %1, align 8, !dbg !2361, !tbaa !2234
  invoke void @_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull %1, ptr noundef null)
          to label %31 unwind label %38, !dbg !2362

31:                                               ; preds = %28
    #dbg_value(ptr %1, !2236, !DIExpression(), !2363)
    #dbg_value(ptr %1, !2239, !DIExpression(), !2365)
  %32 = load ptr, ptr %1, align 8, !dbg !2366, !tbaa !2234
  %33 = icmp eq ptr %32, null, !dbg !2367
  br i1 %33, label %46, label %34, !dbg !2368

34:                                               ; preds = %31
    #dbg_value(ptr %1, !2248, !DIExpression(), !2369)
    #dbg_value(ptr %32, !2251, !DIExpression(), !2369)
  %35 = load ptr, ptr %32, align 8, !dbg !2371, !tbaa !2126
  %36 = getelementptr inbounds i8, ptr %35, i64 8, !dbg !2371
  %37 = load ptr, ptr %36, align 8, !dbg !2371
  call void %37(ptr noundef nonnull align 8 dereferenceable(8) %32) #12, !dbg !2371
  br label %46, !dbg !2372

38:                                               ; preds = %28
  %39 = landingpad { ptr, i32 }
          cleanup, !dbg !2373
    #dbg_value(ptr %1, !2236, !DIExpression(), !2374)
    #dbg_value(ptr %1, !2239, !DIExpression(), !2376)
  %40 = load ptr, ptr %1, align 8, !dbg !2377, !tbaa !2234
  %41 = icmp eq ptr %40, null, !dbg !2378
  br i1 %41, label %55, label %42, !dbg !2379

42:                                               ; preds = %38
    #dbg_value(ptr %1, !2248, !DIExpression(), !2380)
    #dbg_value(ptr %40, !2251, !DIExpression(), !2380)
  %43 = load ptr, ptr %40, align 8, !dbg !2382, !tbaa !2126
  %44 = getelementptr inbounds i8, ptr %43, i64 8, !dbg !2382
  %45 = load ptr, ptr %44, align 8, !dbg !2382
  call void %45(ptr noundef nonnull align 8 dereferenceable(8) %40) #12, !dbg !2382
  br label %55, !dbg !2383

46:                                               ; preds = %31, %34
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %1), !dbg !2384
  %47 = getelementptr inbounds i8, ptr %3, i64 8, !dbg !2385
    #dbg_value(ptr %47, !2269, !DIExpression(), !2386)
    #dbg_value(ptr %5, !2272, !DIExpression(), !2386)
    #dbg_value(ptr %47, !2275, !DIExpression(), !2388)
    #dbg_value(i64 0, !2282, !DIExpression(), !2390)
    #dbg_value(i64 0, !2287, !DIExpression(), !2390)
    #dbg_value(ptr %47, !2290, !DIExpression(), !2392)
    #dbg_value(ptr %5, !2293, !DIExpression(), !2392)
    #dbg_value(ptr %47, !2296, !DIExpression(), !2394)
    #dbg_value(ptr %5, !2307, !DIExpression(), !2394)
    #dbg_value(i64 0, !2308, !DIExpression(), !2394)
  %48 = load i64, ptr %5, align 8, !dbg !2396, !tbaa !2314
  store i64 %48, ptr %47, align 8, !dbg !2396, !tbaa !2314, !DIAssignID !2397
    #dbg_assign(i64 %48, !2049, !DIExpression(DW_OP_LLVM_fragment, 64, 64), !2397, ptr %47, !DIExpression(), !2062)
    #dbg_value(ptr %5, !2316, !DIExpression(), !2398)
    #dbg_value(ptr %5, !2275, !DIExpression(), !2400)
    #dbg_value(i64 0, !2282, !DIExpression(), !2402)
    #dbg_value(i64 0, !2287, !DIExpression(), !2402)
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #12, !dbg !2385
    #dbg_value(ptr %3, !2053, !DIExpression(), !2404)
    #dbg_value(ptr %3, !2058, !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value), !2404)
    #dbg_value(ptr %3, !2056, !DIExpression(), !2404)
    #dbg_value(ptr %3, !2059, !DIExpression(), !2405)
  invoke void @_ZNSt6thread4joinEv(ptr noundef nonnull align 8 dereferenceable(8) %3)
          to label %57 unwind label %67, !dbg !2406

49:                                               ; preds = %0
  %50 = landingpad { ptr, i32 }
          cleanup, !dbg !2407
  br label %51, !dbg !2327

51:                                               ; preds = %17, %21, %49
  %52 = phi { ptr, i32 } [ %50, %49 ], [ %18, %21 ], [ %18, %17 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %4) #12, !dbg !2327
  br label %73, !dbg !2327

53:                                               ; preds = %25
  %54 = landingpad { ptr, i32 }
          cleanup, !dbg !2407
  br label %55, !dbg !2385

55:                                               ; preds = %38, %42, %53
  %56 = phi { ptr, i32 } [ %54, %53 ], [ %39, %42 ], [ %39, %38 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5) #12, !dbg !2385
  br label %73, !dbg !2385

57:                                               ; preds = %46
    #dbg_value(ptr %47, !2056, !DIExpression(), !2404)
    #dbg_value(ptr %47, !2059, !DIExpression(), !2405)
  invoke void @_ZNSt6thread4joinEv(ptr noundef nonnull align 8 dereferenceable(8) %47)
          to label %58 unwind label %67, !dbg !2406

58:                                               ; preds = %57
    #dbg_value(!DIArgList(ptr %3, i64 16), !2056, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_plus, DW_OP_stack_value), !2404)
  %59 = getelementptr inbounds i8, ptr %3, i64 8, !dbg !2407
    #dbg_value(ptr %59, !2316, !DIExpression(), !2408)
    #dbg_value(ptr %59, !2275, !DIExpression(), !2410)
  %60 = load i64, ptr %59, align 8, !dbg !2412, !tbaa !2314
    #dbg_value(i64 %60, !2282, !DIExpression(), !2413)
    #dbg_value(i64 0, !2287, !DIExpression(), !2413)
  %61 = icmp eq i64 %60, 0, !dbg !2415
    #dbg_value(ptr %3, !2316, !DIExpression(), !2408)
    #dbg_value(ptr %3, !2275, !DIExpression(), !2410)
  %62 = load i64, ptr %3, align 16
    #dbg_value(i64 %62, !2282, !DIExpression(), !2413)
    #dbg_value(i64 0, !2287, !DIExpression(), !2413)
  %63 = icmp eq i64 %62, 0
  %64 = select i1 %61, i1 %63, i1 false, !dbg !2416
  br i1 %64, label %66, label %65, !dbg !2416

65:                                               ; preds = %58
  call void @_ZSt9terminatev() #15, !dbg !2417
  unreachable, !dbg !2417

66:                                               ; preds = %58
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #12, !dbg !2407
  ret i32 0, !dbg !2407

67:                                               ; preds = %46, %57
  %68 = landingpad { ptr, i32 }
          cleanup, !dbg !2418
  %69 = getelementptr inbounds i8, ptr %3, i64 8
  %70 = load i64, ptr %69, align 8, !dbg !2419, !tbaa !2314
  %71 = icmp eq i64 %70, 0, !dbg !2422
    #dbg_value(ptr %3, !2316, !DIExpression(DW_OP_plus_uconst, 16, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !2424)
    #dbg_value(ptr %3, !2275, !DIExpression(DW_OP_plus_uconst, 16, DW_OP_constu, 8, DW_OP_minus, DW_OP_stack_value), !2425)
    #dbg_value(i64 poison, !2282, !DIExpression(), !2426)
    #dbg_value(i64 0, !2287, !DIExpression(), !2426)
  br i1 %71, label %73, label %72, !dbg !2427

72:                                               ; preds = %73, %67
  call void @_ZSt9terminatev() #15, !dbg !2428
  unreachable, !dbg !2428

73:                                               ; preds = %51, %55, %67
  %74 = phi { ptr, i32 } [ %68, %67 ], [ %52, %51 ], [ %56, %55 ]
    #dbg_value(ptr %3, !2316, !DIExpression(), !2424)
    #dbg_value(ptr %3, !2275, !DIExpression(), !2425)
  %75 = load i64, ptr %3, align 16, !dbg !2419, !tbaa !2314
    #dbg_value(i64 %75, !2282, !DIExpression(), !2426)
    #dbg_value(i64 0, !2287, !DIExpression(), !2426)
  %76 = icmp eq i64 %75, 0, !dbg !2422
  br i1 %76, label %77, label %72, !dbg !2427

77:                                               ; preds = %73
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %3) #12, !dbg !2407
  resume { ptr, i32 } %74, !dbg !2407
}

declare i32 @__gxx_personality_v0(...)

declare void @_ZNSt6thread4joinEv(ptr noundef nonnull align 8 dereferenceable(8)) local_unnamed_addr #0

declare !dbg !2429 void @_ZSt9terminatev() local_unnamed_addr

declare !dbg !2431 noundef nonnull align 8 dereferenceable(8) ptr @_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef, i64 noundef) local_unnamed_addr #0

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSo9_M_insertImEERSoT_(ptr noundef nonnull align 8 dereferenceable(8), i64 noundef) local_unnamed_addr #0

declare !dbg !2436 i32 @nanosleep(ptr noundef, ptr noundef) local_unnamed_addr #0

; Function Attrs: mustprogress nofree nosync nounwind willreturn memory(none)
declare !dbg !2442 ptr @__errno_location() local_unnamed_addr #6

declare void @_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef, ptr noundef) local_unnamed_addr #0

; Function Attrs: nobuiltin allocsize(0)
declare noundef nonnull ptr @_Znwm(i64 noundef) local_unnamed_addr #7

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(ptr noundef) local_unnamed_addr #8

; Function Attrs: nounwind
declare void @_ZNSt6thread6_StateD2Ev(ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #1

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local void @_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEED0Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #9 comdat align 2 !dbg !2447 {
    #dbg_value(ptr %0, !2450, !DIExpression(), !2451)
  tail call void @_ZNSt6thread6_StateD2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) #12, !dbg !2452
  tail call void @_ZdlPv(ptr noundef nonnull %0) #16, !dbg !2452
  ret void, !dbg !2452
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEE6_M_runEv(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #3 comdat align 2 !dbg !2453 {
    #dbg_value(ptr %0, !2455, !DIExpression(), !2456)
  %2 = getelementptr inbounds i8, ptr %0, i64 8, !dbg !2457
    #dbg_value(ptr %2, !2458, !DIExpression(), !2461)
    #dbg_value(ptr %2, !2463, !DIExpression(), !2479)
    #dbg_value(ptr %2, !2481, !DIExpression(), !2495)
    #dbg_value(ptr %2, !2497, !DIExpression(), !2502)
    #dbg_value(ptr %2, !2504, !DIExpression(), !2507)
  %3 = getelementptr inbounds i8, ptr %0, i64 16, !dbg !2509
    #dbg_value(ptr %3, !642, !DIExpression(), !2510)
    #dbg_value(ptr %2, !643, !DIExpression(), !2510)
    #dbg_value(ptr %3, !2512, !DIExpression(), !2522)
    #dbg_value(ptr %2, !2518, !DIExpression(), !2522)
  %4 = load ptr, ptr %3, align 8, !dbg !2524, !tbaa !2234
  %5 = load i32, ptr %2, align 8, !dbg !2525, !tbaa !2018
  %6 = sext i32 %5 to i64, !dbg !2525
  tail call void %4(i64 noundef %6), !dbg !2524
  ret void, !dbg !2526
}

; Function Attrs: uwtable
define internal void @_GLOBAL__sub_I_sequential.cpp() #10 section ".text.startup" !dbg !2527 {
  tail call void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit), !dbg !2529
  %1 = tail call i32 @__cxa_atexit(ptr nonnull @_ZNSt8ios_base4InitD1Ev, ptr nonnull @_ZStL8__ioinit, ptr nonnull @__dso_handle) #12, !dbg !2533
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #11

attributes #0 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { mustprogress norecurse uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress nofree nosync nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nobuiltin allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { inlinehint mustprogress nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #12 = { nounwind }
attributes #13 = { nounwind willreturn memory(none) }
attributes #14 = { builtin allocsize(0) }
attributes #15 = { noreturn nounwind }
attributes #16 = { builtin nounwind }

!llvm.dbg.cu = !{!9}
!llvm.module.flags = !{!1853, !1854, !1855, !1856, !1857, !1858, !1859}
!llvm.ident = !{!1860}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/iostream", directory: "")
!4 = !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 626, size: 8, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/ios_base.h", directory: "")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 228, size: 1728, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt8ios_base")
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "lock", scope: !9, file: !900, line: 8, type: !1844, isLocal: false, isDefinition: true)
!9 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_11, file: !10, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !11, retainedTypes: !38, globals: !897, imports: !921, splitDebugInlining: false, nameTableKind: None)
!10 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/atomic_lock/sequential.cpp", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/atomic_lock", checksumkind: CSK_MD5, checksum: "b1bb097e2fe98c2e353904317650680b")
!11 = !{!12, !22, !28}
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "memory_order", scope: !2, file: !13, line: 78, baseType: !14, size: 32, elements: !15, identifier: "_ZTSSt12memory_order")
!13 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/atomic_base.h", directory: "")
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !{!16, !17, !18, !19, !20, !21}
!16 = !DIEnumerator(name: "memory_order_relaxed", value: 0, isUnsigned: true)
!17 = !DIEnumerator(name: "memory_order_consume", value: 1, isUnsigned: true)
!18 = !DIEnumerator(name: "memory_order_acquire", value: 2, isUnsigned: true)
!19 = !DIEnumerator(name: "memory_order_release", value: 3, isUnsigned: true)
!20 = !DIEnumerator(name: "memory_order_acq_rel", value: 4, isUnsigned: true)
!21 = !DIEnumerator(name: "memory_order_seq_cst", value: 5, isUnsigned: true)
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__memory_order_modifier", scope: !2, file: !13, line: 89, baseType: !14, size: 32, elements: !23, identifier: "_ZTSSt23__memory_order_modifier")
!23 = !{!24, !25, !26, !27}
!24 = !DIEnumerator(name: "__memory_order_mask", value: 65535, isUnsigned: true)
!25 = !DIEnumerator(name: "__memory_order_modifier_mask", value: 4294901760, isUnsigned: true)
!26 = !DIEnumerator(name: "__memory_order_hle_acquire", value: 65536, isUnsigned: true)
!27 = !DIEnumerator(name: "__memory_order_hle_release", value: 131072, isUnsigned: true)
!28 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Ios_Iostate", scope: !2, file: !5, line: 153, baseType: !29, size: 32, elements: !30, identifier: "_ZTSSt12_Ios_Iostate")
!29 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!30 = !{!31, !32, !33, !34, !35, !36, !37}
!31 = !DIEnumerator(name: "_S_goodbit", value: 0)
!32 = !DIEnumerator(name: "_S_badbit", value: 1)
!33 = !DIEnumerator(name: "_S_eofbit", value: 2)
!34 = !DIEnumerator(name: "_S_failbit", value: 4)
!35 = !DIEnumerator(name: "_S_ios_iostate_end", value: 65536)
!36 = !DIEnumerator(name: "_S_ios_iostate_max", value: 2147483647)
!37 = !DIEnumerator(name: "_S_ios_iostate_min", value: -2147483648)
!38 = !{!39, !29, !45, !109, !110, !28, !114, !46, !117, !42, !137, !140, !193, !200, !627, !656, !202, !289, !286, !324, !283, !390, !280, !276, !273, !270, !266, !205, !6, !700, !706, !740, !774, !808, !855, !888}
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "seconds", scope: !41, file: !40, line: 847, baseType: !42)
!40 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/chrono", directory: "")
!41 = !DINamespace(name: "chrono", scope: !2)
!42 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "duration<long, std::ratio<1L, 1L> >", scope: !41, file: !40, line: 459, size: 64, flags: DIFlagTypePassByValue, elements: !43, templateParams: !97, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1EEEE")
!43 = !{!44, !47, !54, !58, !63, !64, !68, !72, !75, !76, !79, !82, !83, !84, !85, !86, !91, !92, !95, !96}
!44 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !42, file: !40, line: 635, baseType: !45, size: 64, flags: DIFlagPrivate)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !42, file: !40, line: 503, baseType: !46)
!46 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!47 = !DISubprogram(name: "_S_gcd", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE6_S_gcdEll", scope: !42, file: !40, line: 466, type: !48, scopeLine: 466, flags: DIFlagPrivate | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !50, !50}
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !51, line: 101, baseType: !52)
!51 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "a48e64edacc5b19f56c99745232c963c")
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !53, line: 72, baseType: !46)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!54 = !DISubprogram(name: "duration", scope: !42, file: !40, line: 512, type: !55, scopeLine: 512, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!55 = !DISubroutineType(types: !56)
!56 = !{null, !57}
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!58 = !DISubprogram(name: "duration", scope: !42, file: !40, line: 514, type: !59, scopeLine: 514, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!59 = !DISubroutineType(types: !60)
!60 = !{null, !57, !61}
!61 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !62, size: 64)
!62 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!63 = !DISubprogram(name: "~duration", scope: !42, file: !40, line: 532, type: !55, scopeLine: 532, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!64 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEaSERKS3_", scope: !42, file: !40, line: 533, type: !65, scopeLine: 533, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !57, !61}
!67 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !42, size: 64)
!68 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv", scope: !42, file: !40, line: 537, type: !69, scopeLine: 537, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!69 = !DISubroutineType(types: !70)
!70 = !{!45, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !62, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!72 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEEpsEv", scope: !42, file: !40, line: 543, type: !73, scopeLine: 543, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!73 = !DISubroutineType(types: !74)
!74 = !{!42, !71}
!75 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEEngEv", scope: !42, file: !40, line: 547, type: !73, scopeLine: 547, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!76 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEppEv", scope: !42, file: !40, line: 551, type: !77, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!77 = !DISubroutineType(types: !78)
!78 = !{!67, !57}
!79 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEppEi", scope: !42, file: !40, line: 558, type: !80, scopeLine: 558, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!80 = !DISubroutineType(types: !81)
!81 = !{!42, !57, !29}
!82 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmmEv", scope: !42, file: !40, line: 562, type: !77, scopeLine: 562, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!83 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmmEi", scope: !42, file: !40, line: 569, type: !80, scopeLine: 569, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!84 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEpLERKS3_", scope: !42, file: !40, line: 573, type: !65, scopeLine: 573, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!85 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmIERKS3_", scope: !42, file: !40, line: 580, type: !65, scopeLine: 580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!86 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmLERKl", scope: !42, file: !40, line: 587, type: !87, scopeLine: 587, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!87 = !DISubroutineType(types: !88)
!88 = !{!67, !57, !89}
!89 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !90, size: 64)
!90 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !45)
!91 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEdVERKl", scope: !42, file: !40, line: 594, type: !87, scopeLine: 594, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!92 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE4zeroEv", scope: !42, file: !40, line: 623, type: !93, scopeLine: 623, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!93 = !DISubroutineType(types: !94)
!94 = !{!42}
!95 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE3minEv", scope: !42, file: !40, line: 627, type: !93, scopeLine: 627, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!96 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE3maxEv", scope: !42, file: !40, line: 631, type: !93, scopeLine: 631, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!97 = !{!98, !99}
!98 = !DITemplateTypeParameter(name: "_Rep", type: !46)
!99 = !DITemplateTypeParameter(name: "_Period", type: !100, defaulted: true)
!100 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1L>", scope: !2, file: !101, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !102, templateParams: !106, identifier: "_ZTSSt5ratioILl1ELl1EE")
!101 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ratio", directory: "")
!102 = !{!103, !105}
!103 = !DIDerivedType(tag: DW_TAG_variable, name: "num", scope: !100, file: !101, line: 273, baseType: !104, flags: DIFlagStaticMember, extraData: i64 1)
!104 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !50)
!105 = !DIDerivedType(tag: DW_TAG_variable, name: "den", scope: !100, file: !101, line: 276, baseType: !104, flags: DIFlagStaticMember, extraData: i64 1)
!106 = !{!107, !108}
!107 = !DITemplateValueParameter(name: "_Num", type: !46, value: i64 1)
!108 = !DITemplateValueParameter(name: "_Den", type: !46, defaulted: true, value: i64 1)
!109 = !DIDerivedType(tag: DW_TAG_typedef, name: "memory_order", scope: !2, file: !13, line: 86, baseType: !12)
!110 = !DIDerivedType(tag: DW_TAG_typedef, name: "streamsize", scope: !2, file: !111, line: 98, baseType: !112)
!111 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/postypes.h", directory: "")
!112 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !2, file: !113, line: 281, baseType: !46)
!113 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++config.h", directory: "", checksumkind: CSK_MD5, checksum: "b09addf8bea7ac9bf251a76b15f26064")
!114 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !115, line: 10, baseType: !116)
!115 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!116 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !53, line: 160, baseType: !46)
!117 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ct", scope: !118, file: !40, line: 777, baseType: !130)
!118 = distinct !DISubprogram(name: "operator<<long, std::ratio<1L, 1L>, long, std::ratio<1L, 1L> >", linkageName: "_ZNSt6chronoltIlSt5ratioILl1ELl1EElS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE", scope: !41, file: !40, line: 772, type: !119, scopeLine: 774, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !125, retainedNodes: !122)
!119 = !DISubroutineType(types: !120)
!120 = !{!121, !61, !61}
!121 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!122 = !{!123, !124}
!123 = !DILocalVariable(name: "__lhs", arg: 1, scope: !118, file: !40, line: 772, type: !61)
!124 = !DILocalVariable(name: "__rhs", arg: 2, scope: !118, file: !40, line: 773, type: !61)
!125 = !{!126, !127, !128, !129}
!126 = !DITemplateTypeParameter(name: "_Rep1", type: !46)
!127 = !DITemplateTypeParameter(name: "_Period1", type: !100)
!128 = !DITemplateTypeParameter(name: "_Rep2", type: !46)
!129 = !DITemplateTypeParameter(name: "_Period2", type: !100)
!130 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !131, file: !40, line: 130, baseType: !42)
!131 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "common_type<std::chrono::duration<long, std::ratio<1L, 1L> >, std::chrono::duration<long, std::ratio<1L, 1L> > >", scope: !2, file: !40, line: 127, size: 8, flags: DIFlagTypePassByValue, elements: !132, templateParams: !133, identifier: "_ZTSSt11common_typeIJNSt6chrono8durationIlSt5ratioILl1ELl1EEEES4_EE")
!132 = !{}
!133 = !{!134}
!134 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Tp", value: !135)
!135 = !{!136, !136}
!136 = !DITemplateTypeParameter(type: !42)
!137 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "duration<long, std::ratio<1L, 1000000000L> >", scope: !41, file: !40, line: 459, size: 64, flags: DIFlagTypePassByValue, elements: !138, templateParams: !185, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEE")
!138 = !{!139, !141, !142, !146, !151, !152, !156, !160, !163, !164, !167, !170, !171, !172, !173, !174, !179, !180, !183, !184}
!139 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !137, file: !40, line: 635, baseType: !140, size: 64, flags: DIFlagPrivate)
!140 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !137, file: !40, line: 503, baseType: !46)
!141 = !DISubprogram(name: "_S_gcd", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE6_S_gcdEll", scope: !137, file: !40, line: 466, type: !48, scopeLine: 466, flags: DIFlagPrivate | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!142 = !DISubprogram(name: "duration", scope: !137, file: !40, line: 512, type: !143, scopeLine: 512, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!143 = !DISubroutineType(types: !144)
!144 = !{null, !145}
!145 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !137, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!146 = !DISubprogram(name: "duration", scope: !137, file: !40, line: 514, type: !147, scopeLine: 514, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!147 = !DISubroutineType(types: !148)
!148 = !{null, !145, !149}
!149 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !150, size: 64)
!150 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !137)
!151 = !DISubprogram(name: "~duration", scope: !137, file: !40, line: 532, type: !143, scopeLine: 532, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!152 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEaSERKS3_", scope: !137, file: !40, line: 533, type: !153, scopeLine: 533, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!153 = !DISubroutineType(types: !154)
!154 = !{!155, !145, !149}
!155 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !137, size: 64)
!156 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv", scope: !137, file: !40, line: 537, type: !157, scopeLine: 537, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!157 = !DISubroutineType(types: !158)
!158 = !{!140, !159}
!159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !150, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!160 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpsEv", scope: !137, file: !40, line: 543, type: !161, scopeLine: 543, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!161 = !DISubroutineType(types: !162)
!162 = !{!137, !159}
!163 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEngEv", scope: !137, file: !40, line: 547, type: !161, scopeLine: 547, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!164 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEv", scope: !137, file: !40, line: 551, type: !165, scopeLine: 551, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!165 = !DISubroutineType(types: !166)
!166 = !{!155, !145}
!167 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEi", scope: !137, file: !40, line: 558, type: !168, scopeLine: 558, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!168 = !DISubroutineType(types: !169)
!169 = !{!137, !145, !29}
!170 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEv", scope: !137, file: !40, line: 562, type: !165, scopeLine: 562, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!171 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEi", scope: !137, file: !40, line: 569, type: !168, scopeLine: 569, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!172 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpLERKS3_", scope: !137, file: !40, line: 573, type: !153, scopeLine: 573, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!173 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmIERKS3_", scope: !137, file: !40, line: 580, type: !153, scopeLine: 580, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!174 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmLERKl", scope: !137, file: !40, line: 587, type: !175, scopeLine: 587, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!175 = !DISubroutineType(types: !176)
!176 = !{!155, !145, !177}
!177 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !178, size: 64)
!178 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !140)
!179 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEdVERKl", scope: !137, file: !40, line: 594, type: !175, scopeLine: 594, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!180 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE4zeroEv", scope: !137, file: !40, line: 623, type: !181, scopeLine: 623, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!181 = !DISubroutineType(types: !182)
!182 = !{!137}
!183 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3minEv", scope: !137, file: !40, line: 627, type: !181, scopeLine: 627, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!184 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3maxEv", scope: !137, file: !40, line: 631, type: !181, scopeLine: 631, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!185 = !{!98, !186}
!186 = !DITemplateTypeParameter(name: "_Period", type: !187)
!187 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1000000000L>", scope: !2, file: !101, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !188, templateParams: !191, identifier: "_ZTSSt5ratioILl1ELl1000000000EE")
!188 = !{!189, !190}
!189 = !DIDerivedType(tag: DW_TAG_variable, name: "num", scope: !187, file: !101, line: 273, baseType: !104, flags: DIFlagStaticMember, extraData: i64 1)
!190 = !DIDerivedType(tag: DW_TAG_variable, name: "den", scope: !187, file: !101, line: 276, baseType: !104, flags: DIFlagStaticMember, extraData: i64 1000000000)
!191 = !{!107, !192}
!192 = !DITemplateValueParameter(name: "_Den", type: !46, value: i64 1000000000)
!193 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cd", scope: !194, file: !40, line: 665, baseType: !130)
!194 = distinct !DISubprogram(name: "operator-<long, std::ratio<1L, 1L>, long, std::ratio<1L, 1L> >", linkageName: "_ZNSt6chronomiIlSt5ratioILl1ELl1EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_", scope: !41, file: !40, line: 660, type: !195, scopeLine: 662, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !125, retainedNodes: !197)
!195 = !DISubroutineType(types: !196)
!196 = !{!130, !61, !61}
!197 = !{!198, !199}
!198 = !DILocalVariable(name: "__lhs", arg: 1, scope: !194, file: !40, line: 660, type: !61)
!199 = !DILocalVariable(name: "__rhs", arg: 2, scope: !194, file: !40, line: 661, type: !61)
!200 = !DIDerivedType(tag: DW_TAG_typedef, name: "_State_ptr", scope: !202, file: !201, line: 73, baseType: !266, flags: DIFlagPublic)
!201 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/std_thread.h", directory: "")
!202 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "thread", scope: !2, file: !201, line: 62, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !203, identifier: "_ZTSSt6thread")
!203 = !{!204, !221, !225, !226, !231, !235, !239, !242, !245, !249, !250, !251, !254, !257, !260}
!204 = !DIDerivedType(tag: DW_TAG_member, name: "_M_id", scope: !202, file: !201, line: 112, baseType: !205, size: 64)
!205 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "id", scope: !202, file: !201, line: 81, size: 64, flags: DIFlagPublic | DIFlagTypePassByValue | DIFlagNonTrivial, elements: !206, identifier: "_ZTSNSt6thread2idE")
!206 = !{!207, !214, !218}
!207 = !DIDerivedType(tag: DW_TAG_member, name: "_M_thread", scope: !205, file: !201, line: 83, baseType: !208, size: 64)
!208 = !DIDerivedType(tag: DW_TAG_typedef, name: "native_handle_type", scope: !202, file: !201, line: 75, baseType: !209, flags: DIFlagPublic)
!209 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gthread_t", file: !210, line: 47, baseType: !211)
!210 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/gthr-default.h", directory: "", checksumkind: CSK_MD5, checksum: "044da7048de3797e59ae46e61ecc6348")
!211 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !212, line: 27, baseType: !213)
!212 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!213 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!214 = !DISubprogram(name: "id", scope: !205, file: !201, line: 86, type: !215, scopeLine: 86, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!215 = !DISubroutineType(types: !216)
!216 = !{null, !217}
!217 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!218 = !DISubprogram(name: "id", scope: !205, file: !201, line: 89, type: !219, scopeLine: 89, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!219 = !DISubroutineType(types: !220)
!220 = !{null, !217, !208}
!221 = !DISubprogram(name: "thread", scope: !202, file: !201, line: 121, type: !222, scopeLine: 121, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!222 = !DISubroutineType(types: !223)
!223 = !{null, !224}
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !202, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!225 = !DISubprogram(name: "~thread", scope: !202, file: !201, line: 149, type: !222, scopeLine: 149, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!226 = !DISubprogram(name: "thread", scope: !202, file: !201, line: 155, type: !227, scopeLine: 155, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!227 = !DISubroutineType(types: !228)
!228 = !{null, !224, !229}
!229 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !230, size: 64)
!230 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !202)
!231 = !DISubprogram(name: "thread", scope: !202, file: !201, line: 157, type: !232, scopeLine: 157, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!232 = !DISubroutineType(types: !233)
!233 = !{null, !224, !234}
!234 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !202, size: 64)
!235 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6threadaSERKS_", scope: !202, file: !201, line: 160, type: !236, scopeLine: 160, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!236 = !DISubroutineType(types: !237)
!237 = !{!238, !224, !229}
!238 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !202, size: 64)
!239 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6threadaSEOS_", scope: !202, file: !201, line: 162, type: !240, scopeLine: 162, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!240 = !DISubroutineType(types: !241)
!241 = !{!238, !224, !234}
!242 = !DISubprogram(name: "swap", linkageName: "_ZNSt6thread4swapERS_", scope: !202, file: !201, line: 171, type: !243, scopeLine: 171, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!243 = !DISubroutineType(types: !244)
!244 = !{null, !224, !238}
!245 = !DISubprogram(name: "joinable", linkageName: "_ZNKSt6thread8joinableEv", scope: !202, file: !201, line: 175, type: !246, scopeLine: 175, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!246 = !DISubroutineType(types: !247)
!247 = !{!121, !248}
!248 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!249 = !DISubprogram(name: "join", linkageName: "_ZNSt6thread4joinEv", scope: !202, file: !201, line: 179, type: !222, scopeLine: 179, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!250 = !DISubprogram(name: "detach", linkageName: "_ZNSt6thread6detachEv", scope: !202, file: !201, line: 182, type: !222, scopeLine: 182, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!251 = !DISubprogram(name: "get_id", linkageName: "_ZNKSt6thread6get_idEv", scope: !202, file: !201, line: 185, type: !252, scopeLine: 185, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!252 = !DISubroutineType(types: !253)
!253 = !{!205, !248}
!254 = !DISubprogram(name: "native_handle", linkageName: "_ZNSt6thread13native_handleEv", scope: !202, file: !201, line: 191, type: !255, scopeLine: 191, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!255 = !DISubroutineType(types: !256)
!256 = !{!208, !224}
!257 = !DISubprogram(name: "hardware_concurrency", linkageName: "_ZNSt6thread20hardware_concurrencyEv", scope: !202, file: !201, line: 196, type: !258, scopeLine: 196, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!258 = !DISubroutineType(types: !259)
!259 = !{!14}
!260 = !DISubprogram(name: "_M_start_thread", linkageName: "_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE", scope: !202, file: !201, line: 215, type: !261, scopeLine: 215, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!261 = !DISubroutineType(types: !262)
!262 = !{null, !224, !200, !263}
!263 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !264, size: 64)
!264 = !DISubroutineType(types: !265)
!265 = !{null}
!266 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >", scope: !2, file: !267, line: 242, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !268, templateParams: !625, identifier: "_ZTSSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE")
!267 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unique_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "4b5ae66ad1eb2fe06e6955f59533f596")
!268 = !{!269, !565, !570, !573, !577, !582, !591, !595, !596, !601, !606, !609, !612, !615, !618, !622}
!269 = !DIDerivedType(tag: DW_TAG_member, name: "_M_t", scope: !266, file: !267, line: 248, baseType: !270, size: 64)
!270 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__uniq_ptr_data<std::thread::_State, std::default_delete<std::thread::_State>, true, true>", scope: !2, file: !267, line: 208, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !271, templateParams: !564, identifier: "_ZTSSt15__uniq_ptr_dataINSt6thread6_StateESt14default_deleteIS1_ELb1ELb1EE")
!271 = !{!272, !555, !560}
!272 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !270, baseType: !273, extraData: i32 0)
!273 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__uniq_ptr_impl<std::thread::_State, std::default_delete<std::thread::_State> >", scope: !2, file: !267, line: 128, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !274, templateParams: !553, identifier: "_ZTSSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE")
!274 = !{!275, !509, !513, !523, !527, !531, !535, !540, !543, !546, !547, !550}
!275 = !DIDerivedType(tag: DW_TAG_member, name: "_M_t", scope: !273, file: !267, line: 201, baseType: !276, size: 64)
!276 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "tuple<std::thread::_State *, std::default_delete<std::thread::_State> >", scope: !2, file: !277, line: 981, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !278, templateParams: !508, identifier: "_ZTSSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEE")
!277 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple", directory: "")
!278 = !{!279, !469, !472, !478, !482, !496, !505}
!279 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !276, baseType: !280, flags: DIFlagPublic, extraData: i32 0)
!280 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Tuple_impl<0UL, std::thread::_State *, std::default_delete<std::thread::_State> >", scope: !2, file: !277, line: 258, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !281, templateParams: !465, identifier: "_ZTSSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE")
!281 = !{!282, !389, !426, !430, !435, !440, !445, !449, !452, !455, !458, !462}
!282 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !280, baseType: !283, extraData: i32 0)
!283 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Tuple_impl<1UL, std::default_delete<std::thread::_State> >", scope: !2, file: !277, line: 416, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !284, templateParams: !385, identifier: "_ZTSSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEE")
!284 = !{!285, !356, !360, !365, !369, !372, !375, !378, !382}
!285 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !283, baseType: !286, flags: DIFlagPrivate, extraData: i32 0)
!286 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Head_base<1UL, std::default_delete<std::thread::_State>, true>", scope: !2, file: !277, line: 78, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !287, templateParams: !352, identifier: "_ZTSSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EE")
!287 = !{!288, !304, !308, !312, !317, !321, !344, !349}
!288 = !DIDerivedType(tag: DW_TAG_member, name: "_M_head_impl", scope: !286, file: !277, line: 129, baseType: !289, size: 8)
!289 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "default_delete<std::thread::_State>", scope: !2, file: !267, line: 63, size: 8, flags: DIFlagTypePassByValue, elements: !290, templateParams: !302, identifier: "_ZTSSt14default_deleteINSt6thread6_StateEE")
!290 = !{!291, !295}
!291 = !DISubprogram(name: "default_delete", scope: !289, file: !267, line: 66, type: !292, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!292 = !DISubroutineType(types: !293)
!293 = !{null, !294}
!294 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !289, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!295 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt14default_deleteINSt6thread6_StateEEclEPS1_", scope: !289, file: !267, line: 79, type: !296, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!296 = !DISubroutineType(types: !297)
!297 = !{null, !298, !300}
!298 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !299, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!299 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !289)
!300 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !301, size: 64)
!301 = !DICompositeType(tag: DW_TAG_structure_type, name: "_State", scope: !202, file: !201, line: 68, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt6thread6_StateE")
!302 = !{!303}
!303 = !DITemplateTypeParameter(name: "_Tp", type: !301)
!304 = !DISubprogram(name: "_Head_base", scope: !286, file: !277, line: 80, type: !305, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!305 = !DISubroutineType(types: !306)
!306 = !{null, !307}
!307 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !286, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!308 = !DISubprogram(name: "_Head_base", scope: !286, file: !277, line: 83, type: !309, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!309 = !DISubroutineType(types: !310)
!310 = !{null, !307, !311}
!311 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !299, size: 64)
!312 = !DISubprogram(name: "_Head_base", scope: !286, file: !277, line: 86, type: !313, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!313 = !DISubroutineType(types: !314)
!314 = !{null, !307, !315}
!315 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !316, size: 64)
!316 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !286)
!317 = !DISubprogram(name: "_Head_base", scope: !286, file: !277, line: 87, type: !318, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!318 = !DISubroutineType(types: !319)
!319 = !{null, !307, !320}
!320 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !286, size: 64)
!321 = !DISubprogram(name: "_Head_base", scope: !286, file: !277, line: 94, type: !322, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!322 = !DISubroutineType(types: !323)
!323 = !{null, !307, !324, !331}
!324 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_arg_t", scope: !2, file: !325, line: 51, size: 8, flags: DIFlagTypePassByValue, elements: !326, identifier: "_ZTSSt15allocator_arg_t")
!325 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/uses_allocator.h", directory: "", checksumkind: CSK_MD5, checksum: "3232586c3c5b827a38bfdd0f1cb692d3")
!326 = !{!327}
!327 = !DISubprogram(name: "allocator_arg_t", scope: !324, file: !325, line: 51, type: !328, scopeLine: 51, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!328 = !DISubroutineType(types: !329)
!329 = !{null, !330}
!330 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !324, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!331 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__uses_alloc0", scope: !2, file: !325, line: 74, size: 8, flags: DIFlagTypePassByValue, elements: !332, identifier: "_ZTSSt13__uses_alloc0")
!332 = !{!333, !335}
!333 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !331, baseType: !334, extraData: i32 0)
!334 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__uses_alloc_base", scope: !2, file: !325, line: 72, size: 8, flags: DIFlagTypePassByValue, elements: !132, identifier: "_ZTSSt17__uses_alloc_base")
!335 = !DIDerivedType(tag: DW_TAG_member, name: "_M_a", scope: !331, file: !325, line: 76, baseType: !336, size: 8)
!336 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Sink", scope: !331, file: !325, line: 76, size: 8, flags: DIFlagTypePassByValue, elements: !337, identifier: "_ZTSNSt13__uses_alloc05_SinkE")
!337 = !{!338}
!338 = !DISubprogram(name: "operator=", linkageName: "_ZNSt13__uses_alloc05_SinkaSEPKv", scope: !336, file: !325, line: 76, type: !339, scopeLine: 76, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!339 = !DISubroutineType(types: !340)
!340 = !{null, !341, !342}
!341 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !336, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!342 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !343, size: 64)
!343 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!344 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EE7_M_headERS4_", scope: !286, file: !277, line: 124, type: !345, scopeLine: 124, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!345 = !DISubroutineType(types: !346)
!346 = !{!347, !348}
!347 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !289, size: 64)
!348 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !286, size: 64)
!349 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EE7_M_headERKS4_", scope: !286, file: !277, line: 127, type: !350, scopeLine: 127, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!350 = !DISubroutineType(types: !351)
!351 = !{!311, !315}
!352 = !{!353, !354, !355}
!353 = !DITemplateValueParameter(name: "_Idx", type: !213, value: i64 1)
!354 = !DITemplateTypeParameter(name: "_Head", type: !289)
!355 = !DITemplateValueParameter(type: !121, defaulted: true, value: i8 1)
!356 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEE7_M_headERS4_", scope: !283, file: !277, line: 424, type: !357, scopeLine: 424, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!357 = !DISubroutineType(types: !358)
!358 = !{!347, !359}
!359 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !283, size: 64)
!360 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEE7_M_headERKS4_", scope: !283, file: !277, line: 427, type: !361, scopeLine: 427, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!361 = !DISubroutineType(types: !362)
!362 = !{!311, !363}
!363 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !364, size: 64)
!364 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !283)
!365 = !DISubprogram(name: "_Tuple_impl", scope: !283, file: !277, line: 430, type: !366, scopeLine: 430, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!366 = !DISubroutineType(types: !367)
!367 = !{null, !368}
!368 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !283, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!369 = !DISubprogram(name: "_Tuple_impl", scope: !283, file: !277, line: 434, type: !370, scopeLine: 434, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!370 = !DISubroutineType(types: !371)
!371 = !{null, !368, !311}
!372 = !DISubprogram(name: "_Tuple_impl", scope: !283, file: !277, line: 444, type: !373, scopeLine: 444, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!373 = !DISubroutineType(types: !374)
!374 = !{null, !368, !363}
!375 = !DISubprogram(name: "operator=", linkageName: "_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEEaSERKS4_", scope: !283, file: !277, line: 448, type: !376, scopeLine: 448, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!376 = !DISubroutineType(types: !377)
!377 = !{!359, !368, !363}
!378 = !DISubprogram(name: "_Tuple_impl", scope: !283, file: !277, line: 454, type: !379, scopeLine: 454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!379 = !DISubroutineType(types: !380)
!380 = !{null, !368, !381}
!381 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !283, size: 64)
!382 = !DISubprogram(name: "_M_swap", linkageName: "_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEE7_M_swapERS4_", scope: !283, file: !277, line: 544, type: !383, scopeLine: 544, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!383 = !DISubroutineType(types: !384)
!384 = !{null, !368, !359}
!385 = !{!353, !386}
!386 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Elements", value: !387)
!387 = !{!388}
!388 = !DITemplateTypeParameter(type: !289)
!389 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !280, baseType: !390, flags: DIFlagPrivate, extraData: i32 0)
!390 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Head_base<0UL, std::thread::_State *, false>", scope: !2, file: !277, line: 187, size: 64, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !391, templateParams: !422, identifier: "_ZTSSt10_Head_baseILm0EPNSt6thread6_StateELb0EE")
!391 = !{!392, !393, !397, !402, !407, !411, !414, !419}
!392 = !DIDerivedType(tag: DW_TAG_member, name: "_M_head_impl", scope: !390, file: !277, line: 238, baseType: !300, size: 64)
!393 = !DISubprogram(name: "_Head_base", scope: !390, file: !277, line: 189, type: !394, scopeLine: 189, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!394 = !DISubroutineType(types: !395)
!395 = !{null, !396}
!396 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !390, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!397 = !DISubprogram(name: "_Head_base", scope: !390, file: !277, line: 192, type: !398, scopeLine: 192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!398 = !DISubroutineType(types: !399)
!399 = !{null, !396, !400}
!400 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !401, size: 64)
!401 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !300)
!402 = !DISubprogram(name: "_Head_base", scope: !390, file: !277, line: 195, type: !403, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!403 = !DISubroutineType(types: !404)
!404 = !{null, !396, !405}
!405 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !406, size: 64)
!406 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !390)
!407 = !DISubprogram(name: "_Head_base", scope: !390, file: !277, line: 196, type: !408, scopeLine: 196, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!408 = !DISubroutineType(types: !409)
!409 = !{null, !396, !410}
!410 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !390, size: 64)
!411 = !DISubprogram(name: "_Head_base", scope: !390, file: !277, line: 203, type: !412, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!412 = !DISubroutineType(types: !413)
!413 = !{null, !396, !324, !331}
!414 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm0EPNSt6thread6_StateELb0EE7_M_headERS3_", scope: !390, file: !277, line: 233, type: !415, scopeLine: 233, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!415 = !DISubroutineType(types: !416)
!416 = !{!417, !418}
!417 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !300, size: 64)
!418 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !390, size: 64)
!419 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm0EPNSt6thread6_StateELb0EE7_M_headERKS3_", scope: !390, file: !277, line: 236, type: !420, scopeLine: 236, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!420 = !DISubroutineType(types: !421)
!421 = !{!400, !405}
!422 = !{!423, !424, !425}
!423 = !DITemplateValueParameter(name: "_Idx", type: !213, value: i64 0)
!424 = !DITemplateTypeParameter(name: "_Head", type: !300)
!425 = !DITemplateValueParameter(type: !121, defaulted: true, value: i8 0)
!426 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_headERS5_", scope: !280, file: !277, line: 268, type: !427, scopeLine: 268, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!427 = !DISubroutineType(types: !428)
!428 = !{!417, !429}
!429 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !280, size: 64)
!430 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_headERKS5_", scope: !280, file: !277, line: 271, type: !431, scopeLine: 271, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!431 = !DISubroutineType(types: !432)
!432 = !{!400, !433}
!433 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !434, size: 64)
!434 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !280)
!435 = !DISubprogram(name: "_M_tail", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_tailERS5_", scope: !280, file: !277, line: 274, type: !436, scopeLine: 274, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!436 = !DISubroutineType(types: !437)
!437 = !{!438, !429}
!438 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !439, size: 64)
!439 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Inherited", scope: !280, file: !277, line: 264, baseType: !283)
!440 = !DISubprogram(name: "_M_tail", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_tailERKS5_", scope: !280, file: !277, line: 277, type: !441, scopeLine: 277, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!441 = !DISubroutineType(types: !442)
!442 = !{!443, !433}
!443 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !444, size: 64)
!444 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !439)
!445 = !DISubprogram(name: "_Tuple_impl", scope: !280, file: !277, line: 279, type: !446, scopeLine: 279, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!446 = !DISubroutineType(types: !447)
!447 = !{null, !448}
!448 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !280, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!449 = !DISubprogram(name: "_Tuple_impl", scope: !280, file: !277, line: 283, type: !450, scopeLine: 283, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!450 = !DISubroutineType(types: !451)
!451 = !{null, !448, !400, !311}
!452 = !DISubprogram(name: "_Tuple_impl", scope: !280, file: !277, line: 295, type: !453, scopeLine: 295, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!453 = !DISubroutineType(types: !454)
!454 = !{null, !448, !433}
!455 = !DISubprogram(name: "operator=", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEEaSERKS5_", scope: !280, file: !277, line: 299, type: !456, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!456 = !DISubroutineType(types: !457)
!457 = !{!429, !448, !433}
!458 = !DISubprogram(name: "_Tuple_impl", scope: !280, file: !277, line: 301, type: !459, scopeLine: 301, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!459 = !DISubroutineType(types: !460)
!460 = !{null, !448, !461}
!461 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !280, size: 64)
!462 = !DISubprogram(name: "_M_swap", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_swapERS5_", scope: !280, file: !277, line: 406, type: !463, scopeLine: 406, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!463 = !DISubroutineType(types: !464)
!464 = !{null, !448, !429}
!465 = !{!423, !466}
!466 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Elements", value: !467)
!467 = !{!468, !388}
!468 = !DITemplateTypeParameter(type: !300)
!469 = !DISubprogram(name: "__nothrow_default_constructible", linkageName: "_ZNSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEE31__nothrow_default_constructibleEv", scope: !276, file: !277, line: 1035, type: !470, scopeLine: 1035, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!470 = !DISubroutineType(types: !471)
!471 = !{!121}
!472 = !DISubprogram(name: "tuple", scope: !276, file: !277, line: 1088, type: !473, scopeLine: 1088, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!473 = !DISubroutineType(types: !474)
!474 = !{null, !475, !476}
!475 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !276, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!476 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !477, size: 64)
!477 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !276)
!478 = !DISubprogram(name: "tuple", scope: !276, file: !277, line: 1090, type: !479, scopeLine: 1090, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!479 = !DISubroutineType(types: !480)
!480 = !{null, !475, !481}
!481 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !276, size: 64)
!482 = !DISubprogram(name: "operator=", linkageName: "_ZNSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEEaSERKS5_", scope: !276, file: !277, line: 1267, type: !483, scopeLine: 1267, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!483 = !DISubroutineType(types: !484)
!484 = !{!485, !475, !486}
!485 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !276, size: 64)
!486 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !488, file: !487, line: 2221, baseType: !476)
!487 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits", directory: "")
!488 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "conditional<true, const std::tuple<std::thread::_State *, std::default_delete<std::thread::_State> > &, const std::__nonesuch &>", scope: !2, file: !487, line: 2220, size: 8, flags: DIFlagTypePassByValue, elements: !132, templateParams: !489, identifier: "_ZTSSt11conditionalILb1ERKSt5tupleIJPNSt6thread6_StateESt14default_deleteIS2_EEERKSt10__nonesuchE")
!489 = !{!490, !491, !492}
!490 = !DITemplateValueParameter(name: "_Cond", type: !121, value: i8 1)
!491 = !DITemplateTypeParameter(name: "_Iftrue", type: !476)
!492 = !DITemplateTypeParameter(name: "_Iffalse", type: !493)
!493 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !494, size: 64)
!494 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !495)
!495 = !DICompositeType(tag: DW_TAG_structure_type, name: "__nonesuch", scope: !2, file: !487, line: 2991, size: 8, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt10__nonesuch")
!496 = !DISubprogram(name: "operator=", linkageName: "_ZNSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEEaSEOS5_", scope: !276, file: !277, line: 1278, type: !497, scopeLine: 1278, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!497 = !DISubroutineType(types: !498)
!498 = !{!485, !475, !499}
!499 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !500, file: !487, line: 2221, baseType: !481)
!500 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "conditional<true, std::tuple<std::thread::_State *, std::default_delete<std::thread::_State> > &&, std::__nonesuch &&>", scope: !2, file: !487, line: 2220, size: 8, flags: DIFlagTypePassByValue, elements: !132, templateParams: !501, identifier: "_ZTSSt11conditionalILb1EOSt5tupleIJPNSt6thread6_StateESt14default_deleteIS2_EEEOSt10__nonesuchE")
!501 = !{!490, !502, !503}
!502 = !DITemplateTypeParameter(name: "_Iftrue", type: !481)
!503 = !DITemplateTypeParameter(name: "_Iffalse", type: !504)
!504 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !495, size: 64)
!505 = !DISubprogram(name: "swap", linkageName: "_ZNSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEE4swapERS5_", scope: !276, file: !277, line: 1331, type: !506, scopeLine: 1331, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!506 = !DISubroutineType(types: !507)
!507 = !{null, !475, !485}
!508 = !{!466}
!509 = !DISubprogram(name: "__uniq_ptr_impl", scope: !273, file: !267, line: 154, type: !510, scopeLine: 154, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!510 = !DISubroutineType(types: !511)
!511 = !{null, !512}
!512 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !273, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!513 = !DISubprogram(name: "__uniq_ptr_impl", scope: !273, file: !267, line: 155, type: !514, scopeLine: 155, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!514 = !DISubroutineType(types: !515)
!515 = !{null, !512, !516}
!516 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !273, file: !267, line: 148, baseType: !517, flags: DIFlagPublic)
!517 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !518, file: !267, line: 133, baseType: !300)
!518 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Ptr<std::thread::_State, std::default_delete<std::thread::_State>, void>", scope: !273, file: !267, line: 131, size: 8, flags: DIFlagTypePassByValue, elements: !132, templateParams: !519, identifier: "_ZTSNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE4_PtrIS1_S3_vEE")
!519 = !{!520, !521, !522}
!520 = !DITemplateTypeParameter(name: "_Up", type: !301)
!521 = !DITemplateTypeParameter(name: "_Ep", type: !289)
!522 = !DITemplateTypeParameter(type: null, defaulted: true)
!523 = !DISubprogram(name: "__uniq_ptr_impl", scope: !273, file: !267, line: 161, type: !524, scopeLine: 161, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!524 = !DISubroutineType(types: !525)
!525 = !{null, !512, !526}
!526 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !273, size: 64)
!527 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EEaSEOS4_", scope: !273, file: !267, line: 165, type: !528, scopeLine: 165, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!528 = !DISubroutineType(types: !529)
!529 = !{!530, !512, !526}
!530 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !273, size: 64)
!531 = !DISubprogram(name: "_M_ptr", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE6_M_ptrEv", scope: !273, file: !267, line: 172, type: !532, scopeLine: 172, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!532 = !DISubroutineType(types: !533)
!533 = !{!534, !512}
!534 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !516, size: 64)
!535 = !DISubprogram(name: "_M_ptr", linkageName: "_ZNKSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE6_M_ptrEv", scope: !273, file: !267, line: 173, type: !536, scopeLine: 173, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!536 = !DISubroutineType(types: !537)
!537 = !{!516, !538}
!538 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !539, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!539 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !273)
!540 = !DISubprogram(name: "_M_deleter", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE10_M_deleterEv", scope: !273, file: !267, line: 174, type: !541, scopeLine: 174, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!541 = !DISubroutineType(types: !542)
!542 = !{!347, !512}
!543 = !DISubprogram(name: "_M_deleter", linkageName: "_ZNKSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE10_M_deleterEv", scope: !273, file: !267, line: 175, type: !544, scopeLine: 175, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!544 = !DISubroutineType(types: !545)
!545 = !{!311, !538}
!546 = !DISubprogram(name: "reset", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE5resetEPS1_", scope: !273, file: !267, line: 177, type: !514, scopeLine: 177, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!547 = !DISubprogram(name: "release", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE7releaseEv", scope: !273, file: !267, line: 185, type: !548, scopeLine: 185, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!548 = !DISubroutineType(types: !549)
!549 = !{!516, !512}
!550 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE4swapERS4_", scope: !273, file: !267, line: 193, type: !551, scopeLine: 193, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!551 = !DISubroutineType(types: !552)
!552 = !{null, !512, !530}
!553 = !{!303, !554}
!554 = !DITemplateTypeParameter(name: "_Dp", type: !289)
!555 = !DISubprogram(name: "__uniq_ptr_data", scope: !270, file: !267, line: 211, type: !556, scopeLine: 211, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!556 = !DISubroutineType(types: !557)
!557 = !{null, !558, !559}
!558 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !270, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!559 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !270, size: 64)
!560 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__uniq_ptr_dataINSt6thread6_StateESt14default_deleteIS1_ELb1ELb1EEaSEOS4_", scope: !270, file: !267, line: 212, type: !561, scopeLine: 212, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!561 = !DISubroutineType(types: !562)
!562 = !{!563, !558, !559}
!563 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !270, size: 64)
!564 = !{!303, !554, !355, !355}
!565 = !DISubprogram(name: "unique_ptr", scope: !266, file: !267, line: 327, type: !566, scopeLine: 327, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!566 = !DISubroutineType(types: !567)
!567 = !{null, !568, !569}
!568 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !266, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!569 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !266, size: 64)
!570 = !DISubprogram(name: "~unique_ptr", scope: !266, file: !267, line: 355, type: !571, scopeLine: 355, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!571 = !DISubroutineType(types: !572)
!572 = !{null, !568}
!573 = !DISubprogram(name: "operator=", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEaSEOS4_", scope: !266, file: !267, line: 371, type: !574, scopeLine: 371, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!574 = !DISubroutineType(types: !575)
!575 = !{!576, !568, !569}
!576 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !266, size: 64)
!577 = !DISubprogram(name: "operator=", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEaSEDn", scope: !266, file: !267, line: 395, type: !578, scopeLine: 395, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!578 = !DISubroutineType(types: !579)
!579 = !{!576, !568, !580}
!580 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !2, file: !113, line: 284, baseType: !581)
!581 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!582 = !DISubprogram(name: "operator*", linkageName: "_ZNKSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEdeEv", scope: !266, file: !267, line: 405, type: !583, scopeLine: 405, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!583 = !DISubroutineType(types: !584)
!584 = !{!585, !589}
!585 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !586, file: !487, line: 1614, baseType: !588)
!586 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__add_lvalue_reference_helper<std::thread::_State, true>", scope: !2, file: !487, line: 1613, size: 8, flags: DIFlagTypePassByValue, elements: !132, templateParams: !587, identifier: "_ZTSSt29__add_lvalue_reference_helperINSt6thread6_StateELb1EE")
!587 = !{!303, !355}
!588 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !301, size: 64)
!589 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !590, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!590 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !266)
!591 = !DISubprogram(name: "operator->", linkageName: "_ZNKSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEptEv", scope: !266, file: !267, line: 413, type: !592, scopeLine: 413, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!592 = !DISubroutineType(types: !593)
!593 = !{!594, !589}
!594 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !266, file: !267, line: 251, baseType: !516, flags: DIFlagPublic)
!595 = !DISubprogram(name: "get", linkageName: "_ZNKSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE3getEv", scope: !266, file: !267, line: 421, type: !592, scopeLine: 421, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!596 = !DISubprogram(name: "get_deleter", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE11get_deleterEv", scope: !266, file: !267, line: 426, type: !597, scopeLine: 426, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!597 = !DISubroutineType(types: !598)
!598 = !{!599, !568}
!599 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !600, size: 64)
!600 = !DIDerivedType(tag: DW_TAG_typedef, name: "deleter_type", scope: !266, file: !267, line: 253, baseType: !289, flags: DIFlagPublic)
!601 = !DISubprogram(name: "get_deleter", linkageName: "_ZNKSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE11get_deleterEv", scope: !266, file: !267, line: 431, type: !602, scopeLine: 431, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!602 = !DISubroutineType(types: !603)
!603 = !{!604, !589}
!604 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !605, size: 64)
!605 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !600)
!606 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEcvbEv", scope: !266, file: !267, line: 435, type: !607, scopeLine: 435, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!607 = !DISubroutineType(types: !608)
!608 = !{!121, !589}
!609 = !DISubprogram(name: "release", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE7releaseEv", scope: !266, file: !267, line: 442, type: !610, scopeLine: 442, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!610 = !DISubroutineType(types: !611)
!611 = !{!594, !568}
!612 = !DISubprogram(name: "reset", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE5resetEPS1_", scope: !266, file: !267, line: 452, type: !613, scopeLine: 452, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!613 = !DISubroutineType(types: !614)
!614 = !{null, !568, !594}
!615 = !DISubprogram(name: "swap", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE4swapERS4_", scope: !266, file: !267, line: 461, type: !616, scopeLine: 461, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!616 = !DISubroutineType(types: !617)
!617 = !{null, !568, !576}
!618 = !DISubprogram(name: "unique_ptr", scope: !266, file: !267, line: 468, type: !619, scopeLine: 468, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!619 = !DISubroutineType(types: !620)
!620 = !{null, !568, !621}
!621 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !590, size: 64)
!622 = !DISubprogram(name: "operator=", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEaSERKS4_", scope: !266, file: !267, line: 469, type: !623, scopeLine: 469, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!623 = !DISubroutineType(types: !624)
!624 = !{!576, !568, !621}
!625 = !{!303, !626}
!626 = !DITemplateTypeParameter(name: "_Dp", type: !289, defaulted: true)
!627 = !DIDerivedType(tag: DW_TAG_typedef, name: "__tag", scope: !629, file: !628, line: 95, baseType: !649)
!628 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/invoke.h", directory: "")
!629 = distinct !DISubprogram(name: "__invoke<void (*)(unsigned long), int>", linkageName: "_ZSt8__invokeIPFvmEJiEENSt15__invoke_resultIT_JDpT0_EE4typeEOS3_DpOS4_", scope: !2, file: !628, line: 90, type: !630, scopeLine: 92, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !644, retainedNodes: !641)
!630 = !DISubroutineType(types: !631)
!631 = !{!632, !636, !640}
!632 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !633, file: !487, line: 248, baseType: null)
!633 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__success_type<void>", scope: !2, file: !487, line: 247, size: 8, flags: DIFlagTypePassByValue, elements: !132, templateParams: !634, identifier: "_ZTSSt14__success_typeIvE")
!634 = !{!635}
!635 = !DITemplateTypeParameter(name: "_Tp", type: null)
!636 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !637, size: 64)
!637 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !638, size: 64)
!638 = !DISubroutineType(types: !639)
!639 = !{null, !213}
!640 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !29, size: 64)
!641 = !{!642, !643}
!642 = !DILocalVariable(name: "__fn", arg: 1, scope: !629, file: !628, line: 90, type: !636)
!643 = !DILocalVariable(name: "__args", arg: 2, scope: !629, file: !628, line: 90, type: !640)
!644 = !{!645, !646}
!645 = !DITemplateTypeParameter(name: "_Callable", type: !637)
!646 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Args", value: !647)
!647 = !{!648}
!648 = !DITemplateTypeParameter(type: !29)
!649 = !DIDerivedType(tag: DW_TAG_typedef, name: "__invoke_type", scope: !650, file: !487, line: 2383, baseType: !655)
!650 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__result_of_success<void, std::__invoke_other>", scope: !2, file: !487, line: 2382, size: 8, flags: DIFlagTypePassByValue, elements: !651, templateParams: !653, identifier: "_ZTSSt19__result_of_successIvSt14__invoke_otherE")
!651 = !{!652}
!652 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !650, baseType: !633, extraData: i32 0)
!653 = !{!635, !654}
!654 = !DITemplateTypeParameter(name: "_Tag", type: !655)
!655 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__invoke_other", scope: !2, file: !487, line: 2378, size: 8, flags: DIFlagTypePassByValue, elements: !132, identifier: "_ZTSSt14__invoke_other")
!656 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "atomic_flag", scope: !2, file: !13, line: 196, size: 8, flags: DIFlagTypePassByReference, elements: !657, identifier: "_ZTSSt11atomic_flag")
!657 = !{!658, !663, !667, !668, !673, !677, !682, !685, !688, !691, !694, !697}
!658 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !656, baseType: !659, extraData: i32 0)
!659 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__atomic_flag_base", file: !13, line: 186, size: 8, flags: DIFlagTypePassByValue, elements: !660, identifier: "_ZTSSt18__atomic_flag_base")
!660 = !{!661}
!661 = !DIDerivedType(tag: DW_TAG_member, name: "_M_i", scope: !659, file: !13, line: 188, baseType: !662, size: 8)
!662 = !DIDerivedType(tag: DW_TAG_typedef, name: "__atomic_flag_data_type", scope: !2, file: !13, line: 169, baseType: !121)
!663 = !DISubprogram(name: "atomic_flag", scope: !656, file: !13, line: 198, type: !664, scopeLine: 198, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!664 = !DISubroutineType(types: !665)
!665 = !{null, !666}
!666 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !656, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!667 = !DISubprogram(name: "~atomic_flag", scope: !656, file: !13, line: 199, type: !664, scopeLine: 199, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!668 = !DISubprogram(name: "atomic_flag", scope: !656, file: !13, line: 200, type: !669, scopeLine: 200, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!669 = !DISubroutineType(types: !670)
!670 = !{null, !666, !671}
!671 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !672, size: 64)
!672 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !656)
!673 = !DISubprogram(name: "operator=", linkageName: "_ZNSt11atomic_flagaSERKS_", scope: !656, file: !13, line: 201, type: !674, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!674 = !DISubroutineType(types: !675)
!675 = !{!676, !666, !671}
!676 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !656, size: 64)
!677 = !DISubprogram(name: "operator=", linkageName: "_ZNVSt11atomic_flagaSERKS_", scope: !656, file: !13, line: 202, type: !678, scopeLine: 202, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!678 = !DISubroutineType(types: !679)
!679 = !{!676, !680, !671}
!680 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !681, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!681 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !656)
!682 = !DISubprogram(name: "atomic_flag", scope: !656, file: !13, line: 205, type: !683, scopeLine: 205, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!683 = !DISubroutineType(types: !684)
!684 = !{null, !666, !121}
!685 = !DISubprogram(name: "test_and_set", linkageName: "_ZNSt11atomic_flag12test_and_setESt12memory_order", scope: !656, file: !13, line: 210, type: !686, scopeLine: 210, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!686 = !DISubroutineType(types: !687)
!687 = !{!121, !666, !109}
!688 = !DISubprogram(name: "test_and_set", linkageName: "_ZNVSt11atomic_flag12test_and_setESt12memory_order", scope: !656, file: !13, line: 216, type: !689, scopeLine: 216, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!689 = !DISubroutineType(types: !690)
!690 = !{!121, !680, !109}
!691 = !DISubprogram(name: "clear", linkageName: "_ZNSt11atomic_flag5clearESt12memory_order", scope: !656, file: !13, line: 269, type: !692, scopeLine: 269, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!692 = !DISubroutineType(types: !693)
!693 = !{null, !666, !109}
!694 = !DISubprogram(name: "clear", linkageName: "_ZNVSt11atomic_flag5clearESt12memory_order", scope: !656, file: !13, line: 281, type: !695, scopeLine: 281, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!695 = !DISubroutineType(types: !696)
!696 = !{null, !680, !109}
!697 = !DISubprogram(name: "_S_init", linkageName: "_ZNSt11atomic_flag7_S_initEb", scope: !656, file: !13, line: 294, type: !698, scopeLine: 294, flags: DIFlagPrivate | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!698 = !DISubroutineType(types: !699)
!699 = !{!662, !121}
!700 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1000000000L, 1L>", scope: !2, file: !101, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !701, templateParams: !704, identifier: "_ZTSSt5ratioILl1000000000ELl1EE")
!701 = !{!702, !703}
!702 = !DIDerivedType(tag: DW_TAG_variable, name: "num", scope: !700, file: !101, line: 273, baseType: !104, flags: DIFlagStaticMember, extraData: i64 1000000000)
!703 = !DIDerivedType(tag: DW_TAG_variable, name: "den", scope: !700, file: !101, line: 276, baseType: !104, flags: DIFlagStaticMember, extraData: i64 1)
!704 = !{!705, !108}
!705 = !DITemplateValueParameter(name: "_Num", type: !46, value: i64 1000000000)
!706 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Head_base<1UL, int, false>", scope: !2, file: !277, line: 187, size: 32, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !707, templateParams: !738, identifier: "_ZTSSt10_Head_baseILm1EiLb0EE")
!707 = !{!708, !709, !713, !718, !723, !727, !730, !735}
!708 = !DIDerivedType(tag: DW_TAG_member, name: "_M_head_impl", scope: !706, file: !277, line: 238, baseType: !29, size: 32)
!709 = !DISubprogram(name: "_Head_base", scope: !706, file: !277, line: 189, type: !710, scopeLine: 189, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!710 = !DISubroutineType(types: !711)
!711 = !{null, !712}
!712 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !706, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!713 = !DISubprogram(name: "_Head_base", scope: !706, file: !277, line: 192, type: !714, scopeLine: 192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!714 = !DISubroutineType(types: !715)
!715 = !{null, !712, !716}
!716 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !717, size: 64)
!717 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !29)
!718 = !DISubprogram(name: "_Head_base", scope: !706, file: !277, line: 195, type: !719, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!719 = !DISubroutineType(types: !720)
!720 = !{null, !712, !721}
!721 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !722, size: 64)
!722 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !706)
!723 = !DISubprogram(name: "_Head_base", scope: !706, file: !277, line: 196, type: !724, scopeLine: 196, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!724 = !DISubroutineType(types: !725)
!725 = !{null, !712, !726}
!726 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !706, size: 64)
!727 = !DISubprogram(name: "_Head_base", scope: !706, file: !277, line: 203, type: !728, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!728 = !DISubroutineType(types: !729)
!729 = !{null, !712, !324, !331}
!730 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm1EiLb0EE7_M_headERS0_", scope: !706, file: !277, line: 233, type: !731, scopeLine: 233, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!731 = !DISubroutineType(types: !732)
!732 = !{!733, !734}
!733 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !29, size: 64)
!734 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !706, size: 64)
!735 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm1EiLb0EE7_M_headERKS0_", scope: !706, file: !277, line: 236, type: !736, scopeLine: 236, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!736 = !DISubroutineType(types: !737)
!737 = !{!716, !721}
!738 = !{!353, !739, !425}
!739 = !DITemplateTypeParameter(name: "_Head", type: !29)
!740 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Tuple_impl<1UL, int>", scope: !2, file: !277, line: 416, size: 32, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !741, templateParams: !772, identifier: "_ZTSSt11_Tuple_implILm1EJiEE")
!741 = !{!742, !743, !747, !752, !756, !759, !762, !765, !769}
!742 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !740, baseType: !706, flags: DIFlagPrivate, extraData: i32 0)
!743 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm1EJiEE7_M_headERS0_", scope: !740, file: !277, line: 424, type: !744, scopeLine: 424, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!744 = !DISubroutineType(types: !745)
!745 = !{!733, !746}
!746 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !740, size: 64)
!747 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm1EJiEE7_M_headERKS0_", scope: !740, file: !277, line: 427, type: !748, scopeLine: 427, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!748 = !DISubroutineType(types: !749)
!749 = !{!716, !750}
!750 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !751, size: 64)
!751 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !740)
!752 = !DISubprogram(name: "_Tuple_impl", scope: !740, file: !277, line: 430, type: !753, scopeLine: 430, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!753 = !DISubroutineType(types: !754)
!754 = !{null, !755}
!755 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !740, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!756 = !DISubprogram(name: "_Tuple_impl", scope: !740, file: !277, line: 434, type: !757, scopeLine: 434, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!757 = !DISubroutineType(types: !758)
!758 = !{null, !755, !716}
!759 = !DISubprogram(name: "_Tuple_impl", scope: !740, file: !277, line: 444, type: !760, scopeLine: 444, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!760 = !DISubroutineType(types: !761)
!761 = !{null, !755, !750}
!762 = !DISubprogram(name: "operator=", linkageName: "_ZNSt11_Tuple_implILm1EJiEEaSERKS0_", scope: !740, file: !277, line: 448, type: !763, scopeLine: 448, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!763 = !DISubroutineType(types: !764)
!764 = !{!746, !755, !750}
!765 = !DISubprogram(name: "_Tuple_impl", scope: !740, file: !277, line: 454, type: !766, scopeLine: 454, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!766 = !DISubroutineType(types: !767)
!767 = !{null, !755, !768}
!768 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !740, size: 64)
!769 = !DISubprogram(name: "_M_swap", linkageName: "_ZNSt11_Tuple_implILm1EJiEE7_M_swapERS0_", scope: !740, file: !277, line: 544, type: !770, scopeLine: 544, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!770 = !DISubroutineType(types: !771)
!771 = !{null, !755, !746}
!772 = !{!353, !773}
!773 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Elements", value: !647)
!774 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Head_base<0UL, void (*)(unsigned long), false>", scope: !2, file: !277, line: 187, size: 64, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !775, templateParams: !806, identifier: "_ZTSSt10_Head_baseILm0EPFvmELb0EE")
!775 = !{!776, !777, !781, !786, !791, !795, !798, !803}
!776 = !DIDerivedType(tag: DW_TAG_member, name: "_M_head_impl", scope: !774, file: !277, line: 238, baseType: !637, size: 64)
!777 = !DISubprogram(name: "_Head_base", scope: !774, file: !277, line: 189, type: !778, scopeLine: 189, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!778 = !DISubroutineType(types: !779)
!779 = !{null, !780}
!780 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !774, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!781 = !DISubprogram(name: "_Head_base", scope: !774, file: !277, line: 192, type: !782, scopeLine: 192, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!782 = !DISubroutineType(types: !783)
!783 = !{null, !780, !784}
!784 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !785, size: 64)
!785 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !637)
!786 = !DISubprogram(name: "_Head_base", scope: !774, file: !277, line: 195, type: !787, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!787 = !DISubroutineType(types: !788)
!788 = !{null, !780, !789}
!789 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !790, size: 64)
!790 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !774)
!791 = !DISubprogram(name: "_Head_base", scope: !774, file: !277, line: 196, type: !792, scopeLine: 196, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!792 = !DISubroutineType(types: !793)
!793 = !{null, !780, !794}
!794 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !774, size: 64)
!795 = !DISubprogram(name: "_Head_base", scope: !774, file: !277, line: 203, type: !796, scopeLine: 203, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!796 = !DISubroutineType(types: !797)
!797 = !{null, !780, !324, !331}
!798 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm0EPFvmELb0EE7_M_headERS2_", scope: !774, file: !277, line: 233, type: !799, scopeLine: 233, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!799 = !DISubroutineType(types: !800)
!800 = !{!801, !802}
!801 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !637, size: 64)
!802 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !774, size: 64)
!803 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm0EPFvmELb0EE7_M_headERKS2_", scope: !774, file: !277, line: 236, type: !804, scopeLine: 236, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!804 = !DISubroutineType(types: !805)
!805 = !{!784, !789}
!806 = !{!423, !807, !425}
!807 = !DITemplateTypeParameter(name: "_Head", type: !637)
!808 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Tuple_impl<0UL, void (*)(unsigned long), int>", scope: !2, file: !277, line: 258, size: 128, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !809, templateParams: !851, identifier: "_ZTSSt11_Tuple_implILm0EJPFvmEiEE")
!809 = !{!810, !811, !812, !816, !821, !826, !831, !835, !838, !841, !844, !848}
!810 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !808, baseType: !740, extraData: i32 0)
!811 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !808, baseType: !774, offset: 64, flags: DIFlagPrivate, extraData: i32 0)
!812 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_headERS2_", scope: !808, file: !277, line: 268, type: !813, scopeLine: 268, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!813 = !DISubroutineType(types: !814)
!814 = !{!801, !815}
!815 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !808, size: 64)
!816 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_headERKS2_", scope: !808, file: !277, line: 271, type: !817, scopeLine: 271, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!817 = !DISubroutineType(types: !818)
!818 = !{!784, !819}
!819 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !820, size: 64)
!820 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !808)
!821 = !DISubprogram(name: "_M_tail", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_tailERS2_", scope: !808, file: !277, line: 274, type: !822, scopeLine: 274, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!822 = !DISubroutineType(types: !823)
!823 = !{!824, !815}
!824 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !825, size: 64)
!825 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Inherited", scope: !808, file: !277, line: 264, baseType: !740)
!826 = !DISubprogram(name: "_M_tail", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_tailERKS2_", scope: !808, file: !277, line: 277, type: !827, scopeLine: 277, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!827 = !DISubroutineType(types: !828)
!828 = !{!829, !819}
!829 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !830, size: 64)
!830 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !825)
!831 = !DISubprogram(name: "_Tuple_impl", scope: !808, file: !277, line: 279, type: !832, scopeLine: 279, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!832 = !DISubroutineType(types: !833)
!833 = !{null, !834}
!834 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !808, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!835 = !DISubprogram(name: "_Tuple_impl", scope: !808, file: !277, line: 283, type: !836, scopeLine: 283, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!836 = !DISubroutineType(types: !837)
!837 = !{null, !834, !784, !716}
!838 = !DISubprogram(name: "_Tuple_impl", scope: !808, file: !277, line: 295, type: !839, scopeLine: 295, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!839 = !DISubroutineType(types: !840)
!840 = !{null, !834, !819}
!841 = !DISubprogram(name: "operator=", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEEaSERKS2_", scope: !808, file: !277, line: 299, type: !842, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized | DISPFlagDeleted)
!842 = !DISubroutineType(types: !843)
!843 = !{!815, !834, !819}
!844 = !DISubprogram(name: "_Tuple_impl", scope: !808, file: !277, line: 301, type: !845, scopeLine: 301, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!845 = !DISubroutineType(types: !846)
!846 = !{null, !834, !847}
!847 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !808, size: 64)
!848 = !DISubprogram(name: "_M_swap", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_swapERS2_", scope: !808, file: !277, line: 406, type: !849, scopeLine: 406, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!849 = !DISubroutineType(types: !850)
!850 = !{null, !834, !815}
!851 = !{!423, !852}
!852 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Elements", value: !853)
!853 = !{!854, !648}
!854 = !DITemplateTypeParameter(type: !637)
!855 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "tuple<void (*)(unsigned long), int>", scope: !2, file: !277, line: 981, size: 128, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !856, templateParams: !887, identifier: "_ZTSSt5tupleIJPFvmEiEE")
!856 = !{!857, !858, !859, !865, !869, !877, !884}
!857 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !855, baseType: !808, flags: DIFlagPublic, extraData: i32 0)
!858 = !DISubprogram(name: "__nothrow_default_constructible", linkageName: "_ZNSt5tupleIJPFvmEiEE31__nothrow_default_constructibleEv", scope: !855, file: !277, line: 1035, type: !470, scopeLine: 1035, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!859 = !DISubprogram(name: "tuple", scope: !855, file: !277, line: 1088, type: !860, scopeLine: 1088, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!860 = !DISubroutineType(types: !861)
!861 = !{null, !862, !863}
!862 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !855, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!863 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !864, size: 64)
!864 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !855)
!865 = !DISubprogram(name: "tuple", scope: !855, file: !277, line: 1090, type: !866, scopeLine: 1090, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!866 = !DISubroutineType(types: !867)
!867 = !{null, !862, !868}
!868 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !855, size: 64)
!869 = !DISubprogram(name: "operator=", linkageName: "_ZNSt5tupleIJPFvmEiEEaSERKS2_", scope: !855, file: !277, line: 1267, type: !870, scopeLine: 1267, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!870 = !DISubroutineType(types: !871)
!871 = !{!872, !862, !873}
!872 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !855, size: 64)
!873 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !874, file: !487, line: 2221, baseType: !863)
!874 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "conditional<true, const std::tuple<void (*)(unsigned long), int> &, const std::__nonesuch &>", scope: !2, file: !487, line: 2220, size: 8, flags: DIFlagTypePassByValue, elements: !132, templateParams: !875, identifier: "_ZTSSt11conditionalILb1ERKSt5tupleIJPFvmEiEERKSt10__nonesuchE")
!875 = !{!490, !876, !492}
!876 = !DITemplateTypeParameter(name: "_Iftrue", type: !863)
!877 = !DISubprogram(name: "operator=", linkageName: "_ZNSt5tupleIJPFvmEiEEaSEOS2_", scope: !855, file: !277, line: 1278, type: !878, scopeLine: 1278, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!878 = !DISubroutineType(types: !879)
!879 = !{!872, !862, !880}
!880 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !881, file: !487, line: 2221, baseType: !868)
!881 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "conditional<true, std::tuple<void (*)(unsigned long), int> &&, std::__nonesuch &&>", scope: !2, file: !487, line: 2220, size: 8, flags: DIFlagTypePassByValue, elements: !132, templateParams: !882, identifier: "_ZTSSt11conditionalILb1EOSt5tupleIJPFvmEiEEOSt10__nonesuchE")
!882 = !{!490, !883, !503}
!883 = !DITemplateTypeParameter(name: "_Iftrue", type: !868)
!884 = !DISubprogram(name: "swap", linkageName: "_ZNSt5tupleIJPFvmEiEE4swapERS2_", scope: !855, file: !277, line: 1331, type: !885, scopeLine: 1331, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!885 = !DISubroutineType(types: !886)
!886 = !{null, !862, !872}
!887 = !{!852}
!888 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Invoker<std::tuple<void (*)(unsigned long), int> >", scope: !202, file: !201, line: 239, size: 128, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !889, templateParams: !895, identifier: "_ZTSNSt6thread8_InvokerISt5tupleIJPFvmEiEEEE")
!889 = !{!890, !891}
!890 = !DIDerivedType(tag: DW_TAG_member, name: "_M_t", scope: !888, file: !201, line: 247, baseType: !855, size: 128)
!891 = !DISubprogram(name: "operator()", linkageName: "_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEEclEv", scope: !888, file: !201, line: 262, type: !892, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!892 = !DISubroutineType(types: !893)
!893 = !{!632, !894}
!894 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !888, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!895 = !{!896}
!896 = !DITemplateTypeParameter(name: "_Tuple", type: !855)
!897 = !{!0, !7, !898, !906, !911, !916}
!898 = !DIGlobalVariableExpression(var: !899, expr: !DIExpression())
!899 = distinct !DIGlobalVariable(scope: null, file: !900, line: 12, type: !901, isLocal: true, isDefinition: true)
!900 = !DIFile(filename: "sequential.cpp", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/atomic_lock", checksumkind: CSK_MD5, checksum: "b1bb097e2fe98c2e353904317650680b")
!901 = !DICompositeType(tag: DW_TAG_array_type, baseType: !902, size: 128, elements: !904)
!902 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !903)
!903 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!904 = !{!905}
!905 = !DISubrange(count: 16)
!906 = !DIGlobalVariableExpression(var: !907, expr: !DIExpression())
!907 = distinct !DIGlobalVariable(scope: null, file: !900, line: 12, type: !908, isLocal: true, isDefinition: true)
!908 = !DICompositeType(tag: DW_TAG_array_type, baseType: !902, size: 208, elements: !909)
!909 = !{!910}
!910 = !DISubrange(count: 26)
!911 = !DIGlobalVariableExpression(var: !912, expr: !DIExpression())
!912 = distinct !DIGlobalVariable(scope: null, file: !900, line: 14, type: !913, isLocal: true, isDefinition: true)
!913 = !DICompositeType(tag: DW_TAG_array_type, baseType: !902, size: 64, elements: !914)
!914 = !{!915}
!915 = !DISubrange(count: 8)
!916 = !DIGlobalVariableExpression(var: !917, expr: !DIExpression())
!917 = distinct !DIGlobalVariable(scope: null, file: !900, line: 14, type: !918, isLocal: true, isDefinition: true)
!918 = !DICompositeType(tag: DW_TAG_array_type, baseType: !902, size: 120, elements: !919)
!919 = !{!920}
!920 = !DISubrange(count: 15)
!921 = !{!922, !939, !942, !947, !1009, !1017, !1021, !1028, !1032, !1036, !1038, !1040, !1044, !1052, !1056, !1062, !1068, !1070, !1074, !1078, !1082, !1086, !1097, !1099, !1103, !1107, !1111, !1113, !1118, !1122, !1126, !1128, !1130, !1134, !1142, !1146, !1150, !1154, !1156, !1162, !1164, !1171, !1176, !1180, !1184, !1188, !1192, !1196, !1198, !1200, !1204, !1208, !1212, !1214, !1218, !1222, !1224, !1226, !1230, !1236, !1241, !1246, !1247, !1248, !1249, !1250, !1251, !1252, !1253, !1254, !1255, !1256, !1260, !1264, !1268, !1273, !1277, !1280, !1283, !1285, !1287, !1289, !1291, !1294, !1297, !1300, !1303, !1304, !1306, !1311, !1314, !1317, !1320, !1322, !1324, !1326, !1328, !1331, !1334, !1337, !1340, !1343, !1345, !1349, !1353, !1358, !1364, !1366, !1368, !1370, !1372, !1374, !1376, !1378, !1380, !1382, !1384, !1386, !1388, !1390, !1394, !1398, !1404, !1406, !1410, !1412, !1417, !1421, !1425, !1434, !1438, !1442, !1446, !1450, !1454, !1458, !1462, !1466, !1470, !1474, !1478, !1482, !1484, !1488, !1492, !1496, !1502, !1506, !1510, !1512, !1516, !1520, !1526, !1528, !1532, !1536, !1540, !1544, !1548, !1552, !1556, !1557, !1558, !1559, !1561, !1562, !1563, !1564, !1565, !1566, !1567, !1571, !1577, !1582, !1586, !1588, !1590, !1592, !1594, !1601, !1605, !1609, !1613, !1617, !1621, !1626, !1630, !1632, !1636, !1642, !1646, !1651, !1653, !1656, !1660, !1664, !1668, !1670, !1672, !1674, !1676, !1680, !1682, !1684, !1688, !1692, !1696, !1700, !1704, !1706, !1708, !1712, !1716, !1720, !1724, !1726, !1728, !1732, !1736, !1737, !1738, !1739, !1740, !1741, !1747, !1750, !1751, !1753, !1755, !1757, !1759, !1763, !1765, !1767, !1769, !1771, !1773, !1775, !1777, !1779, !1783, !1787, !1789, !1793, !1797, !1802, !1803, !1804, !1809, !1813, !1818, !1823, !1827, !1833, !1837, !1839, !1843}
!922 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !923, file: !938, line: 64)
!923 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !924, line: 6, baseType: !925)
!924 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!925 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !926, line: 21, baseType: !927)
!926 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!927 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !926, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !928, identifier: "_ZTS11__mbstate_t")
!928 = !{!929, !930}
!929 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !927, file: !926, line: 15, baseType: !29, size: 32)
!930 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !927, file: !926, line: 20, baseType: !931, size: 32, offset: 32)
!931 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !927, file: !926, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !932, identifier: "_ZTSN11__mbstate_tUt_E")
!932 = !{!933, !934}
!933 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !931, file: !926, line: 18, baseType: !14, size: 32)
!934 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !931, file: !926, line: 19, baseType: !935, size: 32)
!935 = !DICompositeType(tag: DW_TAG_array_type, baseType: !903, size: 32, elements: !936)
!936 = !{!937}
!937 = !DISubrange(count: 4)
!938 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cwchar", directory: "")
!939 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !940, file: !938, line: 141)
!940 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !941, line: 20, baseType: !14)
!941 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !943, file: !938, line: 143)
!943 = !DISubprogram(name: "btowc", scope: !944, file: !944, line: 319, type: !945, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!944 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "484b7adbbc849bb51cdbcb2d985b07a0")
!945 = !DISubroutineType(types: !946)
!946 = !{!940, !29}
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !948, file: !938, line: 144)
!948 = !DISubprogram(name: "fgetwc", scope: !944, file: !944, line: 744, type: !949, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!949 = !DISubroutineType(types: !950)
!950 = !{!940, !951}
!951 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !952, size: 64)
!952 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !953, line: 5, baseType: !954)
!953 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!954 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !955, line: 49, size: 1728, flags: DIFlagTypePassByValue, elements: !956, identifier: "_ZTS8_IO_FILE")
!955 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
!956 = !{!957, !958, !960, !961, !962, !963, !964, !965, !966, !967, !968, !969, !970, !973, !975, !976, !977, !979, !981, !983, !987, !990, !992, !995, !998, !999, !1001, !1004, !1005}
!957 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !954, file: !955, line: 51, baseType: !29, size: 32)
!958 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !954, file: !955, line: 54, baseType: !959, size: 64, offset: 64)
!959 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !903, size: 64)
!960 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !954, file: !955, line: 55, baseType: !959, size: 64, offset: 128)
!961 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !954, file: !955, line: 56, baseType: !959, size: 64, offset: 192)
!962 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !954, file: !955, line: 57, baseType: !959, size: 64, offset: 256)
!963 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !954, file: !955, line: 58, baseType: !959, size: 64, offset: 320)
!964 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !954, file: !955, line: 59, baseType: !959, size: 64, offset: 384)
!965 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !954, file: !955, line: 60, baseType: !959, size: 64, offset: 448)
!966 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !954, file: !955, line: 61, baseType: !959, size: 64, offset: 512)
!967 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !954, file: !955, line: 64, baseType: !959, size: 64, offset: 576)
!968 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !954, file: !955, line: 65, baseType: !959, size: 64, offset: 640)
!969 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !954, file: !955, line: 66, baseType: !959, size: 64, offset: 704)
!970 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !954, file: !955, line: 68, baseType: !971, size: 64, offset: 768)
!971 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !972, size: 64)
!972 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !955, line: 36, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS10_IO_marker")
!973 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !954, file: !955, line: 70, baseType: !974, size: 64, offset: 832)
!974 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !954, size: 64)
!975 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !954, file: !955, line: 72, baseType: !29, size: 32, offset: 896)
!976 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !954, file: !955, line: 73, baseType: !29, size: 32, offset: 928)
!977 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !954, file: !955, line: 74, baseType: !978, size: 64, offset: 960)
!978 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !53, line: 152, baseType: !46)
!979 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !954, file: !955, line: 77, baseType: !980, size: 16, offset: 1024)
!980 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!981 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !954, file: !955, line: 78, baseType: !982, size: 8, offset: 1040)
!982 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!983 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !954, file: !955, line: 79, baseType: !984, size: 8, offset: 1048)
!984 = !DICompositeType(tag: DW_TAG_array_type, baseType: !903, size: 8, elements: !985)
!985 = !{!986}
!986 = !DISubrange(count: 1)
!987 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !954, file: !955, line: 81, baseType: !988, size: 64, offset: 1088)
!988 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !989, size: 64)
!989 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !955, line: 43, baseType: null)
!990 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !954, file: !955, line: 89, baseType: !991, size: 64, offset: 1152)
!991 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !53, line: 153, baseType: !46)
!992 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !954, file: !955, line: 91, baseType: !993, size: 64, offset: 1216)
!993 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !994, size: 64)
!994 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !955, line: 37, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS11_IO_codecvt")
!995 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !954, file: !955, line: 92, baseType: !996, size: 64, offset: 1280)
!996 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !997, size: 64)
!997 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !955, line: 38, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS13_IO_wide_data")
!998 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !954, file: !955, line: 93, baseType: !974, size: 64, offset: 1344)
!999 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !954, file: !955, line: 94, baseType: !1000, size: 64, offset: 1408)
!1000 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!1001 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !954, file: !955, line: 95, baseType: !1002, size: 64, offset: 1472)
!1002 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1003, line: 18, baseType: !213)
!1003 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!1004 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !954, file: !955, line: 96, baseType: !29, size: 32, offset: 1536)
!1005 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !954, file: !955, line: 98, baseType: !1006, size: 160, offset: 1568)
!1006 = !DICompositeType(tag: DW_TAG_array_type, baseType: !903, size: 160, elements: !1007)
!1007 = !{!1008}
!1008 = !DISubrange(count: 20)
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1010, file: !938, line: 145)
!1010 = !DISubprogram(name: "fgetws", scope: !944, file: !944, line: 773, type: !1011, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1011 = !DISubroutineType(types: !1012)
!1012 = !{!1013, !1015, !29, !1016}
!1013 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1014, size: 64)
!1014 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!1015 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1013)
!1016 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !951)
!1017 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1018, file: !938, line: 146)
!1018 = !DISubprogram(name: "fputwc", scope: !944, file: !944, line: 758, type: !1019, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!940, !1014, !951}
!1021 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1022, file: !938, line: 147)
!1022 = !DISubprogram(name: "fputws", scope: !944, file: !944, line: 780, type: !1023, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1023 = !DISubroutineType(types: !1024)
!1024 = !{!29, !1025, !1016}
!1025 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1026)
!1026 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1027, size: 64)
!1027 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1014)
!1028 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1029, file: !938, line: 148)
!1029 = !DISubprogram(name: "fwide", scope: !944, file: !944, line: 588, type: !1030, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1030 = !DISubroutineType(types: !1031)
!1031 = !{!29, !951, !29}
!1032 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1033, file: !938, line: 149)
!1033 = !DISubprogram(name: "fwprintf", scope: !944, file: !944, line: 595, type: !1034, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1034 = !DISubroutineType(types: !1035)
!1035 = !{!29, !1016, !1025, null}
!1036 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1037, file: !938, line: 150)
!1037 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !944, file: !944, line: 657, type: !1034, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1038 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1039, file: !938, line: 151)
!1039 = !DISubprogram(name: "getwc", scope: !944, file: !944, line: 745, type: !949, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1040 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1041, file: !938, line: 152)
!1041 = !DISubprogram(name: "getwchar", scope: !944, file: !944, line: 751, type: !1042, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1042 = !DISubroutineType(types: !1043)
!1043 = !{!940}
!1044 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1045, file: !938, line: 153)
!1045 = !DISubprogram(name: "mbrlen", scope: !944, file: !944, line: 330, type: !1046, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1046 = !DISubroutineType(types: !1047)
!1047 = !{!1002, !1048, !1002, !1050}
!1048 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1049)
!1049 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !902, size: 64)
!1050 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1051)
!1051 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !923, size: 64)
!1052 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1053, file: !938, line: 154)
!1053 = !DISubprogram(name: "mbrtowc", scope: !944, file: !944, line: 297, type: !1054, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1054 = !DISubroutineType(types: !1055)
!1055 = !{!1002, !1015, !1048, !1002, !1050}
!1056 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1057, file: !938, line: 155)
!1057 = !DISubprogram(name: "mbsinit", scope: !944, file: !944, line: 293, type: !1058, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1058 = !DISubroutineType(types: !1059)
!1059 = !{!29, !1060}
!1060 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1061, size: 64)
!1061 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !923)
!1062 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1063, file: !938, line: 156)
!1063 = !DISubprogram(name: "mbsrtowcs", scope: !944, file: !944, line: 338, type: !1064, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1064 = !DISubroutineType(types: !1065)
!1065 = !{!1002, !1015, !1066, !1002, !1050}
!1066 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1067)
!1067 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1049, size: 64)
!1068 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1069, file: !938, line: 157)
!1069 = !DISubprogram(name: "putwc", scope: !944, file: !944, line: 759, type: !1019, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1070 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1071, file: !938, line: 158)
!1071 = !DISubprogram(name: "putwchar", scope: !944, file: !944, line: 765, type: !1072, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{!940, !1014}
!1074 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1075, file: !938, line: 160)
!1075 = !DISubprogram(name: "swprintf", scope: !944, file: !944, line: 605, type: !1076, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1076 = !DISubroutineType(types: !1077)
!1077 = !{!29, !1015, !1002, !1025, null}
!1078 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1079, file: !938, line: 162)
!1079 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !944, file: !944, line: 664, type: !1080, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1080 = !DISubroutineType(types: !1081)
!1081 = !{!29, !1025, !1025, null}
!1082 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1083, file: !938, line: 163)
!1083 = !DISubprogram(name: "ungetwc", scope: !944, file: !944, line: 788, type: !1084, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1084 = !DISubroutineType(types: !1085)
!1085 = !{!940, !940, !951}
!1086 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1087, file: !938, line: 164)
!1087 = !DISubprogram(name: "vfwprintf", scope: !944, file: !944, line: 613, type: !1088, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1088 = !DISubroutineType(types: !1089)
!1089 = !{!29, !1016, !1025, !1090}
!1090 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1091, size: 64)
!1091 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, flags: DIFlagTypePassByValue, elements: !1092, identifier: "_ZTS13__va_list_tag")
!1092 = !{!1093, !1094, !1095, !1096}
!1093 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !1091, file: !900, baseType: !14, size: 32)
!1094 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !1091, file: !900, baseType: !14, size: 32, offset: 32)
!1095 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !1091, file: !900, baseType: !1000, size: 64, offset: 64)
!1096 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !1091, file: !900, baseType: !1000, size: 64, offset: 128)
!1097 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1098, file: !938, line: 166)
!1098 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !944, file: !944, line: 711, type: !1088, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1099 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1100, file: !938, line: 169)
!1100 = !DISubprogram(name: "vswprintf", scope: !944, file: !944, line: 626, type: !1101, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1101 = !DISubroutineType(types: !1102)
!1102 = !{!29, !1015, !1002, !1025, !1090}
!1103 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1104, file: !938, line: 172)
!1104 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !944, file: !944, line: 718, type: !1105, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1105 = !DISubroutineType(types: !1106)
!1106 = !{!29, !1025, !1025, !1090}
!1107 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1108, file: !938, line: 174)
!1108 = !DISubprogram(name: "vwprintf", scope: !944, file: !944, line: 621, type: !1109, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1109 = !DISubroutineType(types: !1110)
!1110 = !{!29, !1025, !1090}
!1111 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1112, file: !938, line: 176)
!1112 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !944, file: !944, line: 715, type: !1109, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1114, file: !938, line: 178)
!1114 = !DISubprogram(name: "wcrtomb", scope: !944, file: !944, line: 302, type: !1115, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1115 = !DISubroutineType(types: !1116)
!1116 = !{!1002, !1117, !1014, !1050}
!1117 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !959)
!1118 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1119, file: !938, line: 179)
!1119 = !DISubprogram(name: "wcscat", scope: !944, file: !944, line: 97, type: !1120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1120 = !DISubroutineType(types: !1121)
!1121 = !{!1013, !1015, !1025}
!1122 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1123, file: !938, line: 180)
!1123 = !DISubprogram(name: "wcscmp", scope: !944, file: !944, line: 106, type: !1124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1124 = !DISubroutineType(types: !1125)
!1125 = !{!29, !1026, !1026}
!1126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1127, file: !938, line: 181)
!1127 = !DISubprogram(name: "wcscoll", scope: !944, file: !944, line: 131, type: !1124, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1128 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1129, file: !938, line: 182)
!1129 = !DISubprogram(name: "wcscpy", scope: !944, file: !944, line: 87, type: !1120, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1131, file: !938, line: 183)
!1131 = !DISubprogram(name: "wcscspn", scope: !944, file: !944, line: 188, type: !1132, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1132 = !DISubroutineType(types: !1133)
!1133 = !{!1002, !1026, !1026}
!1134 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1135, file: !938, line: 184)
!1135 = !DISubprogram(name: "wcsftime", scope: !944, file: !944, line: 852, type: !1136, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1136 = !DISubroutineType(types: !1137)
!1137 = !{!1002, !1015, !1002, !1025, !1138}
!1138 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1139)
!1139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1140, size: 64)
!1140 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1141)
!1141 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !944, line: 83, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!1142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1143, file: !938, line: 185)
!1143 = !DISubprogram(name: "wcslen", scope: !944, file: !944, line: 223, type: !1144, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1144 = !DISubroutineType(types: !1145)
!1145 = !{!1002, !1026}
!1146 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1147, file: !938, line: 186)
!1147 = !DISubprogram(name: "wcsncat", scope: !944, file: !944, line: 101, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1148 = !DISubroutineType(types: !1149)
!1149 = !{!1013, !1015, !1025, !1002}
!1150 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1151, file: !938, line: 187)
!1151 = !DISubprogram(name: "wcsncmp", scope: !944, file: !944, line: 109, type: !1152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1152 = !DISubroutineType(types: !1153)
!1153 = !{!29, !1026, !1026, !1002}
!1154 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1155, file: !938, line: 188)
!1155 = !DISubprogram(name: "wcsncpy", scope: !944, file: !944, line: 92, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1157, file: !938, line: 189)
!1157 = !DISubprogram(name: "wcsrtombs", scope: !944, file: !944, line: 344, type: !1158, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1158 = !DISubroutineType(types: !1159)
!1159 = !{!1002, !1117, !1160, !1002, !1050}
!1160 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1161)
!1161 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1026, size: 64)
!1162 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1163, file: !938, line: 190)
!1163 = !DISubprogram(name: "wcsspn", scope: !944, file: !944, line: 192, type: !1132, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1164 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1165, file: !938, line: 191)
!1165 = !DISubprogram(name: "wcstod", scope: !944, file: !944, line: 378, type: !1166, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1166 = !DISubroutineType(types: !1167)
!1167 = !{!1168, !1025, !1169}
!1168 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!1169 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1170)
!1170 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1013, size: 64)
!1171 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1172, file: !938, line: 193)
!1172 = !DISubprogram(name: "wcstof", scope: !944, file: !944, line: 383, type: !1173, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1173 = !DISubroutineType(types: !1174)
!1174 = !{!1175, !1025, !1169}
!1175 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1177, file: !938, line: 195)
!1177 = !DISubprogram(name: "wcstok", scope: !944, file: !944, line: 218, type: !1178, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1178 = !DISubroutineType(types: !1179)
!1179 = !{!1013, !1015, !1025, !1169}
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1181, file: !938, line: 196)
!1181 = !DISubprogram(name: "wcstol", scope: !944, file: !944, line: 429, type: !1182, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1182 = !DISubroutineType(types: !1183)
!1183 = !{!46, !1025, !1169, !29}
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1185, file: !938, line: 197)
!1185 = !DISubprogram(name: "wcstoul", scope: !944, file: !944, line: 434, type: !1186, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1186 = !DISubroutineType(types: !1187)
!1187 = !{!213, !1025, !1169, !29}
!1188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1189, file: !938, line: 198)
!1189 = !DISubprogram(name: "wcsxfrm", scope: !944, file: !944, line: 135, type: !1190, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1190 = !DISubroutineType(types: !1191)
!1191 = !{!1002, !1015, !1025, !1002}
!1192 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1193, file: !938, line: 199)
!1193 = !DISubprogram(name: "wctob", scope: !944, file: !944, line: 325, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1194 = !DISubroutineType(types: !1195)
!1195 = !{!29, !940}
!1196 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1197, file: !938, line: 200)
!1197 = !DISubprogram(name: "wmemcmp", scope: !944, file: !944, line: 259, type: !1152, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1199, file: !938, line: 201)
!1199 = !DISubprogram(name: "wmemcpy", scope: !944, file: !944, line: 263, type: !1148, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1200 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1201, file: !938, line: 202)
!1201 = !DISubprogram(name: "wmemmove", scope: !944, file: !944, line: 268, type: !1202, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1202 = !DISubroutineType(types: !1203)
!1203 = !{!1013, !1013, !1026, !1002}
!1204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1205, file: !938, line: 203)
!1205 = !DISubprogram(name: "wmemset", scope: !944, file: !944, line: 272, type: !1206, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1206 = !DISubroutineType(types: !1207)
!1207 = !{!1013, !1013, !1014, !1002}
!1208 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1209, file: !938, line: 204)
!1209 = !DISubprogram(name: "wprintf", scope: !944, file: !944, line: 602, type: !1210, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1210 = !DISubroutineType(types: !1211)
!1211 = !{!29, !1025, null}
!1212 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1213, file: !938, line: 205)
!1213 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !944, file: !944, line: 661, type: !1210, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1214 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1215, file: !938, line: 206)
!1215 = !DISubprogram(name: "wcschr", scope: !944, file: !944, line: 165, type: !1216, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1216 = !DISubroutineType(types: !1217)
!1217 = !{!1013, !1026, !1014}
!1218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1219, file: !938, line: 207)
!1219 = !DISubprogram(name: "wcspbrk", scope: !944, file: !944, line: 202, type: !1220, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1220 = !DISubroutineType(types: !1221)
!1221 = !{!1013, !1026, !1026}
!1222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1223, file: !938, line: 208)
!1223 = !DISubprogram(name: "wcsrchr", scope: !944, file: !944, line: 175, type: !1216, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1225, file: !938, line: 209)
!1225 = !DISubprogram(name: "wcsstr", scope: !944, file: !944, line: 213, type: !1220, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1227, file: !938, line: 210)
!1227 = !DISubprogram(name: "wmemchr", scope: !944, file: !944, line: 254, type: !1228, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1228 = !DISubroutineType(types: !1229)
!1229 = !{!1013, !1026, !1014, !1002}
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1232, file: !938, line: 251)
!1231 = !DINamespace(name: "__gnu_cxx", scope: null)
!1232 = !DISubprogram(name: "wcstold", scope: !944, file: !944, line: 385, type: !1233, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1233 = !DISubroutineType(types: !1234)
!1234 = !{!1235, !1025, !1169}
!1235 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1237, file: !938, line: 260)
!1237 = !DISubprogram(name: "wcstoll", scope: !944, file: !944, line: 442, type: !1238, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1238 = !DISubroutineType(types: !1239)
!1239 = !{!1240, !1025, !1169, !29}
!1240 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1242, file: !938, line: 261)
!1242 = !DISubprogram(name: "wcstoull", scope: !944, file: !944, line: 449, type: !1243, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1243 = !DISubroutineType(types: !1244)
!1244 = !{!1245, !1025, !1169, !29}
!1245 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!1246 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1232, file: !938, line: 267)
!1247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1237, file: !938, line: 268)
!1248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1242, file: !938, line: 269)
!1249 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1172, file: !938, line: 283)
!1250 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1098, file: !938, line: 286)
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1104, file: !938, line: 289)
!1252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1112, file: !938, line: 292)
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1232, file: !938, line: 296)
!1254 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1237, file: !938, line: 297)
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1242, file: !938, line: 298)
!1256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1257, file: !1258, line: 68)
!1257 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !1259, file: !1258, line: 90, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!1258 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "ed433011c81450fc2dabd9aa8a29a038")
!1259 = !DINamespace(name: "__exception_ptr", scope: !2)
!1260 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1259, entity: !1261, file: !1258, line: 84)
!1261 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !1258, line: 80, type: !1262, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1262 = !DISubroutineType(types: !1263)
!1263 = !{null, !1257}
!1264 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1265, entity: !1266, file: !1267, line: 58)
!1265 = !DINamespace(name: "__gnu_debug", scope: null)
!1266 = !DINamespace(name: "__debug", scope: !2)
!1267 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "982c0103e1e5f86b0818efdfc5273c3c")
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1269, file: !1272, line: 47)
!1269 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1270, line: 24, baseType: !1271)
!1270 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!1271 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !53, line: 37, baseType: !982)
!1272 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cstdint", directory: "")
!1273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1274, file: !1272, line: 48)
!1274 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1270, line: 25, baseType: !1275)
!1275 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !53, line: 39, baseType: !1276)
!1276 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1278, file: !1272, line: 49)
!1278 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1270, line: 26, baseType: !1279)
!1279 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !53, line: 41, baseType: !29)
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1281, file: !1272, line: 50)
!1281 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1270, line: 27, baseType: !1282)
!1282 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !53, line: 44, baseType: !46)
!1283 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1284, file: !1272, line: 52)
!1284 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !51, line: 58, baseType: !982)
!1285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1286, file: !1272, line: 53)
!1286 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !51, line: 60, baseType: !46)
!1287 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1288, file: !1272, line: 54)
!1288 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !51, line: 61, baseType: !46)
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1290, file: !1272, line: 55)
!1290 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !51, line: 62, baseType: !46)
!1291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1292, file: !1272, line: 57)
!1292 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !51, line: 43, baseType: !1293)
!1293 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !53, line: 52, baseType: !1271)
!1294 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1295, file: !1272, line: 58)
!1295 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !51, line: 44, baseType: !1296)
!1296 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !53, line: 54, baseType: !1275)
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1298, file: !1272, line: 59)
!1298 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !51, line: 45, baseType: !1299)
!1299 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !53, line: 56, baseType: !1279)
!1300 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1301, file: !1272, line: 60)
!1301 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !51, line: 46, baseType: !1302)
!1302 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !53, line: 58, baseType: !1282)
!1303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !50, file: !1272, line: 62)
!1304 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1305, file: !1272, line: 63)
!1305 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !51, line: 87, baseType: !46)
!1306 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1307, file: !1272, line: 65)
!1307 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !1308, line: 24, baseType: !1309)
!1308 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!1309 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !53, line: 38, baseType: !1310)
!1310 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1312, file: !1272, line: 66)
!1312 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !1308, line: 25, baseType: !1313)
!1313 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !53, line: 40, baseType: !980)
!1314 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1315, file: !1272, line: 67)
!1315 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !1308, line: 26, baseType: !1316)
!1316 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !53, line: 42, baseType: !14)
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1318, file: !1272, line: 68)
!1318 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !1308, line: 27, baseType: !1319)
!1319 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !53, line: 45, baseType: !213)
!1320 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1321, file: !1272, line: 70)
!1321 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !51, line: 71, baseType: !1310)
!1322 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1323, file: !1272, line: 71)
!1323 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !51, line: 73, baseType: !213)
!1324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1325, file: !1272, line: 72)
!1325 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !51, line: 74, baseType: !213)
!1326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1327, file: !1272, line: 73)
!1327 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !51, line: 75, baseType: !213)
!1328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1329, file: !1272, line: 75)
!1329 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !51, line: 49, baseType: !1330)
!1330 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !53, line: 53, baseType: !1309)
!1331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1332, file: !1272, line: 76)
!1332 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !51, line: 50, baseType: !1333)
!1333 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !53, line: 55, baseType: !1313)
!1334 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1335, file: !1272, line: 77)
!1335 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !51, line: 51, baseType: !1336)
!1336 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !53, line: 57, baseType: !1316)
!1337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1338, file: !1272, line: 78)
!1338 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !51, line: 52, baseType: !1339)
!1339 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !53, line: 59, baseType: !1319)
!1340 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1341, file: !1272, line: 80)
!1341 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !51, line: 102, baseType: !1342)
!1342 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !53, line: 73, baseType: !213)
!1343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1344, file: !1272, line: 81)
!1344 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !51, line: 90, baseType: !213)
!1345 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1346, file: !1348, line: 53)
!1346 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1347, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1347 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "a1d177e0f311dc60a74cb347049d75bc")
!1348 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/clocale", directory: "")
!1349 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1350, file: !1348, line: 54)
!1350 = !DISubprogram(name: "setlocale", scope: !1347, file: !1347, line: 122, type: !1351, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1351 = !DISubroutineType(types: !1352)
!1352 = !{!959, !29, !1049}
!1353 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1354, file: !1348, line: 55)
!1354 = !DISubprogram(name: "localeconv", scope: !1347, file: !1347, line: 125, type: !1355, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1355 = !DISubroutineType(types: !1356)
!1356 = !{!1357}
!1357 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1346, size: 64)
!1358 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1359, file: !1363, line: 64)
!1359 = !DISubprogram(name: "isalnum", scope: !1360, file: !1360, line: 108, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1360 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "3ab3dd7fdf2578005732722ee2393e59")
!1361 = !DISubroutineType(types: !1362)
!1362 = !{!29, !29}
!1363 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cctype", directory: "")
!1364 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1365, file: !1363, line: 65)
!1365 = !DISubprogram(name: "isalpha", scope: !1360, file: !1360, line: 109, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1366 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1367, file: !1363, line: 66)
!1367 = !DISubprogram(name: "iscntrl", scope: !1360, file: !1360, line: 110, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1368 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1369, file: !1363, line: 67)
!1369 = !DISubprogram(name: "isdigit", scope: !1360, file: !1360, line: 111, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1370 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1371, file: !1363, line: 68)
!1371 = !DISubprogram(name: "isgraph", scope: !1360, file: !1360, line: 113, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1372 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1373, file: !1363, line: 69)
!1373 = !DISubprogram(name: "islower", scope: !1360, file: !1360, line: 112, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1374 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1375, file: !1363, line: 70)
!1375 = !DISubprogram(name: "isprint", scope: !1360, file: !1360, line: 114, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1376 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1377, file: !1363, line: 71)
!1377 = !DISubprogram(name: "ispunct", scope: !1360, file: !1360, line: 115, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1378 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1379, file: !1363, line: 72)
!1379 = !DISubprogram(name: "isspace", scope: !1360, file: !1360, line: 116, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1380 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1381, file: !1363, line: 73)
!1381 = !DISubprogram(name: "isupper", scope: !1360, file: !1360, line: 117, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1382 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1383, file: !1363, line: 74)
!1383 = !DISubprogram(name: "isxdigit", scope: !1360, file: !1360, line: 118, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1384 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1385, file: !1363, line: 75)
!1385 = !DISubprogram(name: "tolower", scope: !1360, file: !1360, line: 122, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1386 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1387, file: !1363, line: 76)
!1387 = !DISubprogram(name: "toupper", scope: !1360, file: !1360, line: 125, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1389, file: !1363, line: 87)
!1389 = !DISubprogram(name: "isblank", scope: !1360, file: !1360, line: 130, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1390 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1391, file: !1393, line: 52)
!1391 = !DISubprogram(name: "abs", scope: !1392, file: !1392, line: 848, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1392 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!1393 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/std_abs.h", directory: "")
!1394 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1395, file: !1397, line: 127)
!1395 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1392, line: 63, baseType: !1396)
!1396 = !DICompositeType(tag: DW_TAG_structure_type, file: !1392, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!1397 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cstdlib", directory: "")
!1398 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1399, file: !1397, line: 128)
!1399 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1392, line: 71, baseType: !1400)
!1400 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1392, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !1401, identifier: "_ZTS6ldiv_t")
!1401 = !{!1402, !1403}
!1402 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1400, file: !1392, line: 69, baseType: !46, size: 64)
!1403 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1400, file: !1392, line: 70, baseType: !46, size: 64, offset: 64)
!1404 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1405, file: !1397, line: 130)
!1405 = !DISubprogram(name: "abort", scope: !1392, file: !1392, line: 598, type: !264, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1406 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1407, file: !1397, line: 134)
!1407 = !DISubprogram(name: "atexit", scope: !1392, file: !1392, line: 602, type: !1408, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1408 = !DISubroutineType(types: !1409)
!1409 = !{!29, !263}
!1410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1411, file: !1397, line: 137)
!1411 = !DISubprogram(name: "at_quick_exit", scope: !1392, file: !1392, line: 607, type: !1408, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1412 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1413, file: !1397, line: 140)
!1413 = !DISubprogram(name: "atof", scope: !1414, file: !1414, line: 25, type: !1415, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1414 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h", directory: "", checksumkind: CSK_MD5, checksum: "adfe1626ff4efc68ac58c367ff5f206b")
!1415 = !DISubroutineType(types: !1416)
!1416 = !{!1168, !1049}
!1417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1418, file: !1397, line: 141)
!1418 = !DISubprogram(name: "atoi", scope: !1392, file: !1392, line: 362, type: !1419, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1419 = !DISubroutineType(types: !1420)
!1420 = !{!29, !1049}
!1421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1422, file: !1397, line: 142)
!1422 = !DISubprogram(name: "atol", scope: !1392, file: !1392, line: 367, type: !1423, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1423 = !DISubroutineType(types: !1424)
!1424 = !{!46, !1049}
!1425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1426, file: !1397, line: 143)
!1426 = !DISubprogram(name: "bsearch", scope: !1427, file: !1427, line: 20, type: !1428, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1427 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdlib-bsearch.h", directory: "", checksumkind: CSK_MD5, checksum: "724ededa330cc3e0cbd34c5b4030a6f6")
!1428 = !DISubroutineType(types: !1429)
!1429 = !{!1000, !342, !342, !1002, !1002, !1430}
!1430 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !1392, line: 816, baseType: !1431)
!1431 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1432, size: 64)
!1432 = !DISubroutineType(types: !1433)
!1433 = !{!29, !342, !342}
!1434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1435, file: !1397, line: 144)
!1435 = !DISubprogram(name: "calloc", scope: !1392, file: !1392, line: 543, type: !1436, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1436 = !DISubroutineType(types: !1437)
!1437 = !{!1000, !1002, !1002}
!1438 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1439, file: !1397, line: 145)
!1439 = !DISubprogram(name: "div", scope: !1392, file: !1392, line: 860, type: !1440, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1440 = !DISubroutineType(types: !1441)
!1441 = !{!1395, !29, !29}
!1442 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1443, file: !1397, line: 146)
!1443 = !DISubprogram(name: "exit", scope: !1392, file: !1392, line: 624, type: !1444, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1444 = !DISubroutineType(types: !1445)
!1445 = !{null, !29}
!1446 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1447, file: !1397, line: 147)
!1447 = !DISubprogram(name: "free", scope: !1392, file: !1392, line: 555, type: !1448, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1448 = !DISubroutineType(types: !1449)
!1449 = !{null, !1000}
!1450 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1451, file: !1397, line: 148)
!1451 = !DISubprogram(name: "getenv", scope: !1392, file: !1392, line: 641, type: !1452, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1452 = !DISubroutineType(types: !1453)
!1453 = !{!959, !1049}
!1454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1455, file: !1397, line: 149)
!1455 = !DISubprogram(name: "labs", scope: !1392, file: !1392, line: 849, type: !1456, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1456 = !DISubroutineType(types: !1457)
!1457 = !{!46, !46}
!1458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1459, file: !1397, line: 150)
!1459 = !DISubprogram(name: "ldiv", scope: !1392, file: !1392, line: 862, type: !1460, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1460 = !DISubroutineType(types: !1461)
!1461 = !{!1399, !46, !46}
!1462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1463, file: !1397, line: 151)
!1463 = !DISubprogram(name: "malloc", scope: !1392, file: !1392, line: 540, type: !1464, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1464 = !DISubroutineType(types: !1465)
!1465 = !{!1000, !1002}
!1466 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1467, file: !1397, line: 153)
!1467 = !DISubprogram(name: "mblen", scope: !1392, file: !1392, line: 930, type: !1468, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1468 = !DISubroutineType(types: !1469)
!1469 = !{!29, !1049, !1002}
!1470 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1471, file: !1397, line: 154)
!1471 = !DISubprogram(name: "mbstowcs", scope: !1392, file: !1392, line: 941, type: !1472, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1472 = !DISubroutineType(types: !1473)
!1473 = !{!1002, !1015, !1048, !1002}
!1474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1475, file: !1397, line: 155)
!1475 = !DISubprogram(name: "mbtowc", scope: !1392, file: !1392, line: 933, type: !1476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1476 = !DISubroutineType(types: !1477)
!1477 = !{!29, !1015, !1048, !1002}
!1478 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1479, file: !1397, line: 157)
!1479 = !DISubprogram(name: "qsort", scope: !1392, file: !1392, line: 838, type: !1480, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1480 = !DISubroutineType(types: !1481)
!1481 = !{null, !1000, !1002, !1002, !1430}
!1482 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1483, file: !1397, line: 160)
!1483 = !DISubprogram(name: "quick_exit", scope: !1392, file: !1392, line: 630, type: !1444, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1484 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1485, file: !1397, line: 163)
!1485 = !DISubprogram(name: "rand", scope: !1392, file: !1392, line: 454, type: !1486, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1486 = !DISubroutineType(types: !1487)
!1487 = !{!29}
!1488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1489, file: !1397, line: 164)
!1489 = !DISubprogram(name: "realloc", scope: !1392, file: !1392, line: 551, type: !1490, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1490 = !DISubroutineType(types: !1491)
!1491 = !{!1000, !1000, !1002}
!1492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1493, file: !1397, line: 165)
!1493 = !DISubprogram(name: "srand", scope: !1392, file: !1392, line: 456, type: !1494, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1494 = !DISubroutineType(types: !1495)
!1495 = !{null, !14}
!1496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1497, file: !1397, line: 166)
!1497 = !DISubprogram(name: "strtod", scope: !1392, file: !1392, line: 118, type: !1498, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1498 = !DISubroutineType(types: !1499)
!1499 = !{!1168, !1048, !1500}
!1500 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1501)
!1501 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !959, size: 64)
!1502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1503, file: !1397, line: 167)
!1503 = !DISubprogram(name: "strtol", scope: !1392, file: !1392, line: 177, type: !1504, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1504 = !DISubroutineType(types: !1505)
!1505 = !{!46, !1048, !1500, !29}
!1506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1507, file: !1397, line: 168)
!1507 = !DISubprogram(name: "strtoul", scope: !1392, file: !1392, line: 181, type: !1508, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1508 = !DISubroutineType(types: !1509)
!1509 = !{!213, !1048, !1500, !29}
!1510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1511, file: !1397, line: 169)
!1511 = !DISubprogram(name: "system", scope: !1392, file: !1392, line: 791, type: !1419, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1513, file: !1397, line: 171)
!1513 = !DISubprogram(name: "wcstombs", scope: !1392, file: !1392, line: 945, type: !1514, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1514 = !DISubroutineType(types: !1515)
!1515 = !{!1002, !1117, !1025, !1002}
!1516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1517, file: !1397, line: 172)
!1517 = !DISubprogram(name: "wctomb", scope: !1392, file: !1392, line: 937, type: !1518, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1518 = !DISubroutineType(types: !1519)
!1519 = !{!29, !959, !1014}
!1520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1521, file: !1397, line: 200)
!1521 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1392, line: 81, baseType: !1522)
!1522 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1392, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !1523, identifier: "_ZTS7lldiv_t")
!1523 = !{!1524, !1525}
!1524 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1522, file: !1392, line: 79, baseType: !1240, size: 64)
!1525 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1522, file: !1392, line: 80, baseType: !1240, size: 64, offset: 64)
!1526 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1527, file: !1397, line: 206)
!1527 = !DISubprogram(name: "_Exit", scope: !1392, file: !1392, line: 636, type: !1444, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!1528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1529, file: !1397, line: 210)
!1529 = !DISubprogram(name: "llabs", scope: !1392, file: !1392, line: 852, type: !1530, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1530 = !DISubroutineType(types: !1531)
!1531 = !{!1240, !1240}
!1532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1533, file: !1397, line: 216)
!1533 = !DISubprogram(name: "lldiv", scope: !1392, file: !1392, line: 866, type: !1534, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1534 = !DISubroutineType(types: !1535)
!1535 = !{!1521, !1240, !1240}
!1536 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1537, file: !1397, line: 227)
!1537 = !DISubprogram(name: "atoll", scope: !1392, file: !1392, line: 374, type: !1538, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1538 = !DISubroutineType(types: !1539)
!1539 = !{!1240, !1049}
!1540 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1541, file: !1397, line: 228)
!1541 = !DISubprogram(name: "strtoll", scope: !1392, file: !1392, line: 201, type: !1542, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1542 = !DISubroutineType(types: !1543)
!1543 = !{!1240, !1048, !1500, !29}
!1544 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1545, file: !1397, line: 229)
!1545 = !DISubprogram(name: "strtoull", scope: !1392, file: !1392, line: 206, type: !1546, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1546 = !DISubroutineType(types: !1547)
!1547 = !{!1245, !1048, !1500, !29}
!1548 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1549, file: !1397, line: 231)
!1549 = !DISubprogram(name: "strtof", scope: !1392, file: !1392, line: 124, type: !1550, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1550 = !DISubroutineType(types: !1551)
!1551 = !{!1175, !1048, !1500}
!1552 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1553, file: !1397, line: 232)
!1553 = !DISubprogram(name: "strtold", scope: !1392, file: !1392, line: 127, type: !1554, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1554 = !DISubroutineType(types: !1555)
!1555 = !{!1235, !1048, !1500}
!1556 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1521, file: !1397, line: 240)
!1557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1527, file: !1397, line: 242)
!1558 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1529, file: !1397, line: 244)
!1559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1560, file: !1397, line: 245)
!1560 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !1231, file: !1397, line: 213, type: !1534, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1533, file: !1397, line: 246)
!1562 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1537, file: !1397, line: 248)
!1563 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1549, file: !1397, line: 249)
!1564 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1541, file: !1397, line: 250)
!1565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1545, file: !1397, line: 251)
!1566 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1553, file: !1397, line: 252)
!1567 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1568, file: !1570, line: 98)
!1568 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1569, line: 7, baseType: !954)
!1569 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1570 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cstdio", directory: "")
!1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1572, file: !1570, line: 99)
!1572 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1573, line: 84, baseType: !1574)
!1573 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!1574 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1575, line: 14, baseType: !1576)
!1575 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1576 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1575, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1577 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1578, file: !1570, line: 101)
!1578 = !DISubprogram(name: "clearerr", scope: !1573, file: !1573, line: 786, type: !1579, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1579 = !DISubroutineType(types: !1580)
!1580 = !{null, !1581}
!1581 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1568, size: 64)
!1582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1583, file: !1570, line: 102)
!1583 = !DISubprogram(name: "fclose", scope: !1573, file: !1573, line: 178, type: !1584, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1584 = !DISubroutineType(types: !1585)
!1585 = !{!29, !1581}
!1586 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1587, file: !1570, line: 103)
!1587 = !DISubprogram(name: "feof", scope: !1573, file: !1573, line: 788, type: !1584, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1589, file: !1570, line: 104)
!1589 = !DISubprogram(name: "ferror", scope: !1573, file: !1573, line: 790, type: !1584, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1590 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1591, file: !1570, line: 105)
!1591 = !DISubprogram(name: "fflush", scope: !1573, file: !1573, line: 230, type: !1584, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1593, file: !1570, line: 106)
!1593 = !DISubprogram(name: "fgetc", scope: !1573, file: !1573, line: 513, type: !1584, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1594 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1595, file: !1570, line: 107)
!1595 = !DISubprogram(name: "fgetpos", scope: !1573, file: !1573, line: 760, type: !1596, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1596 = !DISubroutineType(types: !1597)
!1597 = !{!29, !1598, !1599}
!1598 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1581)
!1599 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1600)
!1600 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1572, size: 64)
!1601 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1602, file: !1570, line: 108)
!1602 = !DISubprogram(name: "fgets", scope: !1573, file: !1573, line: 592, type: !1603, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1603 = !DISubroutineType(types: !1604)
!1604 = !{!959, !1117, !29, !1598}
!1605 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1606, file: !1570, line: 109)
!1606 = !DISubprogram(name: "fopen", scope: !1573, file: !1573, line: 258, type: !1607, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1607 = !DISubroutineType(types: !1608)
!1608 = !{!1581, !1048, !1048}
!1609 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1610, file: !1570, line: 110)
!1610 = !DISubprogram(name: "fprintf", scope: !1573, file: !1573, line: 350, type: !1611, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1611 = !DISubroutineType(types: !1612)
!1612 = !{!29, !1598, !1048, null}
!1613 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1614, file: !1570, line: 111)
!1614 = !DISubprogram(name: "fputc", scope: !1573, file: !1573, line: 549, type: !1615, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1615 = !DISubroutineType(types: !1616)
!1616 = !{!29, !29, !1581}
!1617 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1618, file: !1570, line: 112)
!1618 = !DISubprogram(name: "fputs", scope: !1573, file: !1573, line: 655, type: !1619, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1619 = !DISubroutineType(types: !1620)
!1620 = !{!29, !1048, !1598}
!1621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1622, file: !1570, line: 113)
!1622 = !DISubprogram(name: "fread", scope: !1573, file: !1573, line: 675, type: !1623, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1623 = !DISubroutineType(types: !1624)
!1624 = !{!1002, !1625, !1002, !1002, !1598}
!1625 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1000)
!1626 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1627, file: !1570, line: 114)
!1627 = !DISubprogram(name: "freopen", scope: !1573, file: !1573, line: 265, type: !1628, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1628 = !DISubroutineType(types: !1629)
!1629 = !{!1581, !1048, !1048, !1598}
!1630 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1631, file: !1570, line: 115)
!1631 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !1573, file: !1573, line: 434, type: !1611, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1633, file: !1570, line: 116)
!1633 = !DISubprogram(name: "fseek", scope: !1573, file: !1573, line: 713, type: !1634, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1634 = !DISubroutineType(types: !1635)
!1635 = !{!29, !1581, !46, !29}
!1636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1637, file: !1570, line: 117)
!1637 = !DISubprogram(name: "fsetpos", scope: !1573, file: !1573, line: 765, type: !1638, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1638 = !DISubroutineType(types: !1639)
!1639 = !{!29, !1581, !1640}
!1640 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1641, size: 64)
!1641 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1572)
!1642 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1643, file: !1570, line: 118)
!1643 = !DISubprogram(name: "ftell", scope: !1573, file: !1573, line: 718, type: !1644, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1644 = !DISubroutineType(types: !1645)
!1645 = !{!46, !1581}
!1646 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1647, file: !1570, line: 119)
!1647 = !DISubprogram(name: "fwrite", scope: !1573, file: !1573, line: 681, type: !1648, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1648 = !DISubroutineType(types: !1649)
!1649 = !{!1002, !1650, !1002, !1002, !1598}
!1650 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !342)
!1651 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1652, file: !1570, line: 120)
!1652 = !DISubprogram(name: "getc", scope: !1573, file: !1573, line: 514, type: !1584, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1654, file: !1570, line: 121)
!1654 = !DISubprogram(name: "getchar", scope: !1655, file: !1655, line: 47, type: !1486, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1655 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "c10e343656e7a2bf1044ef4e4442d902")
!1656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1657, file: !1570, line: 124)
!1657 = !DISubprogram(name: "gets", scope: !1573, file: !1573, line: 605, type: !1658, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1658 = !DISubroutineType(types: !1659)
!1659 = !{!959, !959}
!1660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1661, file: !1570, line: 126)
!1661 = !DISubprogram(name: "perror", scope: !1573, file: !1573, line: 804, type: !1662, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1662 = !DISubroutineType(types: !1663)
!1663 = !{null, !1049}
!1664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1665, file: !1570, line: 127)
!1665 = !DISubprogram(name: "printf", scope: !1573, file: !1573, line: 356, type: !1666, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1666 = !DISubroutineType(types: !1667)
!1667 = !{!29, !1048, null}
!1668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1669, file: !1570, line: 128)
!1669 = !DISubprogram(name: "putc", scope: !1573, file: !1573, line: 550, type: !1615, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1670 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1671, file: !1570, line: 129)
!1671 = !DISubprogram(name: "putchar", scope: !1655, file: !1655, line: 82, type: !1361, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1672 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1673, file: !1570, line: 130)
!1673 = !DISubprogram(name: "puts", scope: !1573, file: !1573, line: 661, type: !1419, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1674 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1675, file: !1570, line: 131)
!1675 = !DISubprogram(name: "remove", scope: !1573, file: !1573, line: 152, type: !1419, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1676 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1677, file: !1570, line: 132)
!1677 = !DISubprogram(name: "rename", scope: !1573, file: !1573, line: 154, type: !1678, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1678 = !DISubroutineType(types: !1679)
!1679 = !{!29, !1049, !1049}
!1680 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1681, file: !1570, line: 133)
!1681 = !DISubprogram(name: "rewind", scope: !1573, file: !1573, line: 723, type: !1579, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1682 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1683, file: !1570, line: 134)
!1683 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !1573, file: !1573, line: 437, type: !1666, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1684 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1685, file: !1570, line: 135)
!1685 = !DISubprogram(name: "setbuf", scope: !1573, file: !1573, line: 328, type: !1686, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1686 = !DISubroutineType(types: !1687)
!1687 = !{null, !1598, !1117}
!1688 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1689, file: !1570, line: 136)
!1689 = !DISubprogram(name: "setvbuf", scope: !1573, file: !1573, line: 332, type: !1690, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1690 = !DISubroutineType(types: !1691)
!1691 = !{!29, !1598, !1117, !29, !1002}
!1692 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1693, file: !1570, line: 137)
!1693 = !DISubprogram(name: "sprintf", scope: !1573, file: !1573, line: 358, type: !1694, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1694 = !DISubroutineType(types: !1695)
!1695 = !{!29, !1117, !1048, null}
!1696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1697, file: !1570, line: 138)
!1697 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !1573, file: !1573, line: 439, type: !1698, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1698 = !DISubroutineType(types: !1699)
!1699 = !{!29, !1048, !1048, null}
!1700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1701, file: !1570, line: 139)
!1701 = !DISubprogram(name: "tmpfile", scope: !1573, file: !1573, line: 188, type: !1702, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1702 = !DISubroutineType(types: !1703)
!1703 = !{!1581}
!1704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1705, file: !1570, line: 141)
!1705 = !DISubprogram(name: "tmpnam", scope: !1573, file: !1573, line: 205, type: !1658, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1707, file: !1570, line: 143)
!1707 = !DISubprogram(name: "ungetc", scope: !1573, file: !1573, line: 668, type: !1615, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1709, file: !1570, line: 144)
!1709 = !DISubprogram(name: "vfprintf", scope: !1573, file: !1573, line: 365, type: !1710, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1710 = !DISubroutineType(types: !1711)
!1711 = !{!29, !1598, !1048, !1090}
!1712 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1713, file: !1570, line: 145)
!1713 = !DISubprogram(name: "vprintf", scope: !1655, file: !1655, line: 39, type: !1714, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1714 = !DISubroutineType(types: !1715)
!1715 = !{!29, !1048, !1090}
!1716 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1717, file: !1570, line: 146)
!1717 = !DISubprogram(name: "vsprintf", scope: !1573, file: !1573, line: 373, type: !1718, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1718 = !DISubroutineType(types: !1719)
!1719 = !{!29, !1117, !1048, !1090}
!1720 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1721, file: !1570, line: 175)
!1721 = !DISubprogram(name: "snprintf", scope: !1573, file: !1573, line: 378, type: !1722, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1722 = !DISubroutineType(types: !1723)
!1723 = !{!29, !1117, !1002, !1048, null}
!1724 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1725, file: !1570, line: 176)
!1725 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !1573, file: !1573, line: 479, type: !1710, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1726 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1727, file: !1570, line: 177)
!1727 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !1573, file: !1573, line: 484, type: !1714, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1728 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1729, file: !1570, line: 178)
!1729 = !DISubprogram(name: "vsnprintf", scope: !1573, file: !1573, line: 382, type: !1730, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1730 = !DISubroutineType(types: !1731)
!1731 = !{!29, !1117, !1002, !1048, !1090}
!1732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1231, entity: !1733, file: !1570, line: 179)
!1733 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !1573, file: !1573, line: 487, type: !1734, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1734 = !DISubroutineType(types: !1735)
!1735 = !{!29, !1048, !1048, !1090}
!1736 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1721, file: !1570, line: 185)
!1737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1725, file: !1570, line: 186)
!1738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1727, file: !1570, line: 187)
!1739 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1729, file: !1570, line: 188)
!1740 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1733, file: !1570, line: 189)
!1741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1742, file: !1746, line: 82)
!1742 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1743, line: 48, baseType: !1744)
!1743 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "9bcd8e8b8cd2078c8a6c42e262af7d7b")
!1744 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1745, size: 64)
!1745 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1279)
!1746 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cwctype", directory: "")
!1747 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1748, file: !1746, line: 83)
!1748 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1749, line: 38, baseType: !213)
!1749 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "48fed714a84c77fca0455b433489fc47")
!1750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !940, file: !1746, line: 84)
!1751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1752, file: !1746, line: 86)
!1752 = !DISubprogram(name: "iswalnum", scope: !1749, file: !1749, line: 95, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1754, file: !1746, line: 87)
!1754 = !DISubprogram(name: "iswalpha", scope: !1749, file: !1749, line: 101, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1756, file: !1746, line: 89)
!1756 = !DISubprogram(name: "iswblank", scope: !1749, file: !1749, line: 146, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1758, file: !1746, line: 91)
!1758 = !DISubprogram(name: "iswcntrl", scope: !1749, file: !1749, line: 104, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1759 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1760, file: !1746, line: 92)
!1760 = !DISubprogram(name: "iswctype", scope: !1749, file: !1749, line: 159, type: !1761, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1761 = !DISubroutineType(types: !1762)
!1762 = !{!29, !940, !1748}
!1763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1764, file: !1746, line: 93)
!1764 = !DISubprogram(name: "iswdigit", scope: !1749, file: !1749, line: 108, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1766, file: !1746, line: 94)
!1766 = !DISubprogram(name: "iswgraph", scope: !1749, file: !1749, line: 112, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1768, file: !1746, line: 95)
!1768 = !DISubprogram(name: "iswlower", scope: !1749, file: !1749, line: 117, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1770, file: !1746, line: 96)
!1770 = !DISubprogram(name: "iswprint", scope: !1749, file: !1749, line: 120, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1771 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1772, file: !1746, line: 97)
!1772 = !DISubprogram(name: "iswpunct", scope: !1749, file: !1749, line: 125, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1774, file: !1746, line: 98)
!1774 = !DISubprogram(name: "iswspace", scope: !1749, file: !1749, line: 130, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1775 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1776, file: !1746, line: 99)
!1776 = !DISubprogram(name: "iswupper", scope: !1749, file: !1749, line: 135, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1777 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1778, file: !1746, line: 100)
!1778 = !DISubprogram(name: "iswxdigit", scope: !1749, file: !1749, line: 140, type: !1194, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1780, file: !1746, line: 101)
!1780 = !DISubprogram(name: "towctrans", scope: !1743, file: !1743, line: 55, type: !1781, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1781 = !DISubroutineType(types: !1782)
!1782 = !{!940, !940, !1742}
!1783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1784, file: !1746, line: 102)
!1784 = !DISubprogram(name: "towlower", scope: !1749, file: !1749, line: 166, type: !1785, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1785 = !DISubroutineType(types: !1786)
!1786 = !{!940, !940}
!1787 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1788, file: !1746, line: 103)
!1788 = !DISubprogram(name: "towupper", scope: !1749, file: !1749, line: 169, type: !1785, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1789 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1790, file: !1746, line: 104)
!1790 = !DISubprogram(name: "wctrans", scope: !1743, file: !1743, line: 52, type: !1791, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1791 = !DISubroutineType(types: !1792)
!1792 = !{!1742, !1049}
!1793 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1794, file: !1746, line: 105)
!1794 = !DISubprogram(name: "wctype", scope: !1749, file: !1749, line: 155, type: !1795, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1795 = !DISubroutineType(types: !1796)
!1796 = !{!1748, !1049}
!1797 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1798, file: !1801, line: 60)
!1798 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1799, line: 7, baseType: !1800)
!1799 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1800 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !53, line: 156, baseType: !46)
!1801 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ctime", directory: "")
!1802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !114, file: !1801, line: 61)
!1803 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1141, file: !1801, line: 62)
!1804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1805, file: !1801, line: 64)
!1805 = !DISubprogram(name: "clock", scope: !1806, file: !1806, line: 72, type: !1807, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1806 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "db37158473a25e1d89b19f8bc6892801")
!1807 = !DISubroutineType(types: !1808)
!1808 = !{!1798}
!1809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1810, file: !1801, line: 65)
!1810 = !DISubprogram(name: "difftime", scope: !1806, file: !1806, line: 79, type: !1811, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1811 = !DISubroutineType(types: !1812)
!1812 = !{!1168, !114, !114}
!1813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1814, file: !1801, line: 66)
!1814 = !DISubprogram(name: "mktime", scope: !1806, file: !1806, line: 83, type: !1815, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1815 = !DISubroutineType(types: !1816)
!1816 = !{!114, !1817}
!1817 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1141, size: 64)
!1818 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1819, file: !1801, line: 67)
!1819 = !DISubprogram(name: "time", scope: !1806, file: !1806, line: 76, type: !1820, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1820 = !DISubroutineType(types: !1821)
!1821 = !{!114, !1822}
!1822 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!1823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1824, file: !1801, line: 68)
!1824 = !DISubprogram(name: "asctime", scope: !1806, file: !1806, line: 179, type: !1825, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1825 = !DISubroutineType(types: !1826)
!1826 = !{!959, !1139}
!1827 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1828, file: !1801, line: 69)
!1828 = !DISubprogram(name: "ctime", scope: !1806, file: !1806, line: 183, type: !1829, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1829 = !DISubroutineType(types: !1830)
!1830 = !{!959, !1831}
!1831 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1832, size: 64)
!1832 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !114)
!1833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1834, file: !1801, line: 70)
!1834 = !DISubprogram(name: "gmtime", scope: !1806, file: !1806, line: 132, type: !1835, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1835 = !DISubroutineType(types: !1836)
!1836 = !{!1817, !1831}
!1837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1838, file: !1801, line: 71)
!1838 = !DISubprogram(name: "localtime", scope: !1806, file: !1806, line: 136, type: !1835, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1840, file: !1801, line: 72)
!1840 = !DISubprogram(name: "strftime", scope: !1806, file: !1806, line: 100, type: !1841, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1841 = !DISubroutineType(types: !1842)
!1842 = !{!1002, !1117, !1002, !1048, !1138}
!1843 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !9, entity: !2, file: !900, line: 6)
!1844 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "spinlock", file: !1845, line: 3, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !1846, identifier: "_ZTS8spinlock")
!1845 = !DIFile(filename: "spinlock.h", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/test_suites/atomic_lock", checksumkind: CSK_MD5, checksum: "d94e372c9ca11cc838e11edc718f9c08")
!1846 = !{!1847, !1848, !1852}
!1847 = !DIDerivedType(tag: DW_TAG_member, name: "locked", scope: !1844, file: !1845, line: 13, baseType: !656, size: 8)
!1848 = !DISubprogram(name: "lock", linkageName: "_ZN8spinlock4lockEv", scope: !1844, file: !1845, line: 5, type: !1849, scopeLine: 5, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1849 = !DISubroutineType(types: !1850)
!1850 = !{null, !1851}
!1851 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1844, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1852 = !DISubprogram(name: "unlock", linkageName: "_ZN8spinlock6unlockEv", scope: !1844, file: !1845, line: 9, type: !1849, scopeLine: 9, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1853 = !{i32 7, !"Dwarf Version", i32 5}
!1854 = !{i32 2, !"Debug Info Version", i32 3}
!1855 = !{i32 1, !"wchar_size", i32 4}
!1856 = !{i32 8, !"PIC Level", i32 2}
!1857 = !{i32 7, !"PIE Level", i32 2}
!1858 = !{i32 7, !"uwtable", i32 2}
!1859 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!1860 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!1861 = distinct !DISubprogram(name: "thread_print", linkageName: "_Z12thread_printm", scope: !900, file: !900, line: 10, type: !1862, scopeLine: 10, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, retainedNodes: !1864)
!1862 = !DISubroutineType(types: !1863)
!1863 = !{null, !1002}
!1864 = !{!1865}
!1865 = !DILocalVariable(name: "tid", arg: 1, scope: !1861, file: !900, line: 10, type: !1002)
!1866 = distinct !DIAssignID()
!1867 = !DILocation(line: 0, scope: !1861)
!1868 = !DILocalVariable(name: "this", arg: 1, scope: !1869, type: !1871, flags: DIFlagArtificial | DIFlagObjectPointer)
!1869 = distinct !DISubprogram(name: "lock", linkageName: "_ZN8spinlock4lockEv", scope: !1844, file: !1845, line: 5, type: !1849, scopeLine: 5, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !1848, retainedNodes: !1870)
!1870 = !{!1868}
!1871 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1844, size: 64)
!1872 = !DILocation(line: 0, scope: !1869, inlinedAt: !1873)
!1873 = distinct !DILocation(line: 11, column: 10, scope: !1861)
!1874 = !DILocation(line: 6, column: 9, scope: !1869, inlinedAt: !1873)
!1875 = !DILocalVariable(name: "this", arg: 1, scope: !1876, type: !1879, flags: DIFlagArtificial | DIFlagObjectPointer)
!1876 = distinct !DISubprogram(name: "test_and_set", linkageName: "_ZNSt11atomic_flag12test_and_setESt12memory_order", scope: !656, file: !13, line: 210, type: !686, scopeLine: 211, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !685, retainedNodes: !1877)
!1877 = !{!1875, !1878}
!1878 = !DILocalVariable(name: "__m", arg: 2, scope: !1876, file: !13, line: 210, type: !109)
!1879 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !656, size: 64)
!1880 = !DILocation(line: 0, scope: !1876, inlinedAt: !1881)
!1881 = distinct !DILocation(line: 6, column: 23, scope: !1869, inlinedAt: !1873)
!1882 = !DILocation(line: 212, column: 14, scope: !1876, inlinedAt: !1881)
!1883 = distinct !{!1883, !1874, !1884, !1885}
!1884 = !DILocation(line: 6, column: 68, scope: !1869, inlinedAt: !1873)
!1885 = !{!"llvm.loop.mustprogress"}
!1886 = !DILocalVariable(name: "__out", arg: 1, scope: !1887, file: !1888, line: 611, type: !1891)
!1887 = distinct !DISubprogram(name: "operator<<<std::char_traits<char> >", linkageName: "_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc", scope: !2, file: !1888, line: 611, type: !1889, scopeLine: 612, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !1896, retainedNodes: !1894)
!1888 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ostream", directory: "")
!1889 = !DISubroutineType(types: !1890)
!1890 = !{!1891, !1891, !1049}
!1891 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1892, size: 64)
!1892 = !DICompositeType(tag: DW_TAG_class_type, name: "basic_ostream<char, std::char_traits<char> >", scope: !2, file: !1893, line: 359, size: 2176, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!1893 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/ostream.tcc", directory: "")
!1894 = !{!1886, !1895}
!1895 = !DILocalVariable(name: "__s", arg: 2, scope: !1887, file: !1888, line: 611, type: !1049)
!1896 = !{!1897}
!1897 = !DITemplateTypeParameter(name: "_Traits", type: !1898)
!1898 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "char_traits<char>", scope: !2, file: !1899, line: 344, size: 8, flags: DIFlagTypePassByValue, elements: !1900, templateParams: !1949, identifier: "_ZTSSt11char_traitsIcE")
!1899 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/char_traits.h", directory: "")
!1900 = !{!1901, !1908, !1911, !1912, !1917, !1920, !1923, !1927, !1928, !1931, !1937, !1940, !1943, !1946}
!1901 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignERcRKc", scope: !1898, file: !1899, line: 356, type: !1902, scopeLine: 356, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1902 = !DISubroutineType(types: !1903)
!1903 = !{null, !1904, !1906}
!1904 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1905, size: 64)
!1905 = !DIDerivedType(tag: DW_TAG_typedef, name: "char_type", scope: !1898, file: !1899, line: 346, baseType: !903)
!1906 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1907, size: 64)
!1907 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1905)
!1908 = !DISubprogram(name: "eq", linkageName: "_ZNSt11char_traitsIcE2eqERKcS2_", scope: !1898, file: !1899, line: 360, type: !1909, scopeLine: 360, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1909 = !DISubroutineType(types: !1910)
!1910 = !{!121, !1906, !1906}
!1911 = !DISubprogram(name: "lt", linkageName: "_ZNSt11char_traitsIcE2ltERKcS2_", scope: !1898, file: !1899, line: 364, type: !1909, scopeLine: 364, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1912 = !DISubprogram(name: "compare", linkageName: "_ZNSt11char_traitsIcE7compareEPKcS2_m", scope: !1898, file: !1899, line: 372, type: !1913, scopeLine: 372, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1913 = !DISubroutineType(types: !1914)
!1914 = !{!29, !1915, !1915, !1916}
!1915 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1907, size: 64)
!1916 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !2, file: !113, line: 280, baseType: !213)
!1917 = !DISubprogram(name: "length", linkageName: "_ZNSt11char_traitsIcE6lengthEPKc", scope: !1898, file: !1899, line: 393, type: !1918, scopeLine: 393, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1918 = !DISubroutineType(types: !1919)
!1919 = !{!1916, !1915}
!1920 = !DISubprogram(name: "find", linkageName: "_ZNSt11char_traitsIcE4findEPKcmRS1_", scope: !1898, file: !1899, line: 403, type: !1921, scopeLine: 403, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1921 = !DISubroutineType(types: !1922)
!1922 = !{!1915, !1915, !1916, !1906}
!1923 = !DISubprogram(name: "move", linkageName: "_ZNSt11char_traitsIcE4moveEPcPKcm", scope: !1898, file: !1899, line: 417, type: !1924, scopeLine: 417, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1924 = !DISubroutineType(types: !1925)
!1925 = !{!1926, !1926, !1915, !1916}
!1926 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1905, size: 64)
!1927 = !DISubprogram(name: "copy", linkageName: "_ZNSt11char_traitsIcE4copyEPcPKcm", scope: !1898, file: !1899, line: 429, type: !1924, scopeLine: 429, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1928 = !DISubprogram(name: "assign", linkageName: "_ZNSt11char_traitsIcE6assignEPcmc", scope: !1898, file: !1899, line: 441, type: !1929, scopeLine: 441, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1929 = !DISubroutineType(types: !1930)
!1930 = !{!1926, !1926, !1916, !1905}
!1931 = !DISubprogram(name: "to_char_type", linkageName: "_ZNSt11char_traitsIcE12to_char_typeERKi", scope: !1898, file: !1899, line: 453, type: !1932, scopeLine: 453, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1932 = !DISubroutineType(types: !1933)
!1933 = !{!1905, !1934}
!1934 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1935, size: 64)
!1935 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1936)
!1936 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_type", scope: !1898, file: !1899, line: 347, baseType: !29)
!1937 = !DISubprogram(name: "to_int_type", linkageName: "_ZNSt11char_traitsIcE11to_int_typeERKc", scope: !1898, file: !1899, line: 459, type: !1938, scopeLine: 459, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1938 = !DISubroutineType(types: !1939)
!1939 = !{!1936, !1906}
!1940 = !DISubprogram(name: "eq_int_type", linkageName: "_ZNSt11char_traitsIcE11eq_int_typeERKiS2_", scope: !1898, file: !1899, line: 463, type: !1941, scopeLine: 463, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1941 = !DISubroutineType(types: !1942)
!1942 = !{!121, !1934, !1934}
!1943 = !DISubprogram(name: "eof", linkageName: "_ZNSt11char_traitsIcE3eofEv", scope: !1898, file: !1899, line: 467, type: !1944, scopeLine: 467, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1944 = !DISubroutineType(types: !1945)
!1945 = !{!1936}
!1946 = !DISubprogram(name: "not_eof", linkageName: "_ZNSt11char_traitsIcE7not_eofERKi", scope: !1898, file: !1899, line: 471, type: !1947, scopeLine: 471, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!1947 = !DISubroutineType(types: !1948)
!1948 = !{!1936, !1934}
!1949 = !{!1950}
!1950 = !DITemplateTypeParameter(name: "_CharT", type: !903)
!1951 = !DILocation(line: 0, scope: !1887, inlinedAt: !1952)
!1952 = distinct !DILocation(line: 12, column: 10, scope: !1861)
!1953 = !DILocation(line: 616, column: 2, scope: !1954, inlinedAt: !1952)
!1954 = distinct !DILexicalBlock(scope: !1887, file: !1888, line: 613, column: 11)
!1955 = !DILocalVariable(name: "this", arg: 1, scope: !1956, type: !1965, flags: DIFlagArtificial | DIFlagObjectPointer)
!1956 = distinct !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEm", scope: !1892, file: !1888, line: 170, type: !1957, scopeLine: 171, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !1962, retainedNodes: !1963)
!1957 = !DISubroutineType(types: !1958)
!1958 = !{!1959, !1961, !213}
!1959 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1960, size: 64)
!1960 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ostream_type", scope: !1892, file: !1888, line: 71, baseType: !1892, flags: DIFlagPublic)
!1961 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1892, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1962 = !DISubprogram(name: "operator<<", linkageName: "_ZNSolsEm", scope: !1892, file: !1888, line: 170, type: !1957, scopeLine: 170, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1963 = !{!1955, !1964}
!1964 = !DILocalVariable(name: "__n", arg: 2, scope: !1956, file: !1888, line: 170, type: !213)
!1965 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1892, size: 64)
!1966 = !DILocation(line: 0, scope: !1956, inlinedAt: !1967)
!1967 = distinct !DILocation(line: 12, column: 31, scope: !1861)
!1968 = !DILocation(line: 171, column: 16, scope: !1956, inlinedAt: !1967)
!1969 = !DILocation(line: 0, scope: !1887, inlinedAt: !1970)
!1970 = distinct !DILocation(line: 12, column: 38, scope: !1861)
!1971 = !DILocation(line: 616, column: 2, scope: !1954, inlinedAt: !1970)
!1972 = !DILocalVariable(name: "__ts", scope: !1973, file: !1974, line: 77, type: !1995)
!1973 = distinct !DISubprogram(name: "sleep_for<long, std::ratio<1L, 1L> >", linkageName: "_ZNSt11this_thread9sleep_forIlSt5ratioILl1ELl1EEEEvRKNSt6chrono8durationIT_T0_EE", scope: !1975, file: !1974, line: 70, type: !1976, scopeLine: 71, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !1993, retainedNodes: !1978)
!1974 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/this_thread_sleep.h", directory: "")
!1975 = !DINamespace(name: "this_thread", scope: !2)
!1976 = !DISubroutineType(types: !1977)
!1977 = !{null, !61}
!1978 = !{!1979, !1980, !1987, !1972}
!1979 = !DILocalVariable(name: "__rtime", arg: 1, scope: !1973, file: !1974, line: 70, type: !61)
!1980 = !DILocalVariable(name: "__s", scope: !1973, file: !1974, line: 74, type: !1981)
!1981 = !DIDerivedType(tag: DW_TAG_typedef, name: "__enable_if_is_duration<std::chrono::duration<long> >", scope: !41, file: !40, line: 255, baseType: !1982)
!1982 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !1983, file: !487, line: 2199, baseType: !42)
!1983 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "enable_if<true, std::chrono::duration<long, std::ratio<1L, 1L> > >", scope: !2, file: !487, line: 2198, size: 8, flags: DIFlagTypePassByValue, elements: !132, templateParams: !1984, identifier: "_ZTSSt9enable_ifILb1ENSt6chrono8durationIlSt5ratioILl1ELl1EEEEE")
!1984 = !{!1985, !1986}
!1985 = !DITemplateValueParameter(type: !121, value: i8 1)
!1986 = !DITemplateTypeParameter(name: "_Tp", type: !42)
!1987 = !DILocalVariable(name: "__ns", scope: !1973, file: !1974, line: 75, type: !1988)
!1988 = !DIDerivedType(tag: DW_TAG_typedef, name: "__enable_if_is_duration<std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !41, file: !40, line: 255, baseType: !1989)
!1989 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !1990, file: !487, line: 2199, baseType: !137)
!1990 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "enable_if<true, std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !2, file: !487, line: 2198, size: 8, flags: DIFlagTypePassByValue, elements: !132, templateParams: !1991, identifier: "_ZTSSt9enable_ifILb1ENSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEEE")
!1991 = !{!1985, !1992}
!1992 = !DITemplateTypeParameter(name: "_Tp", type: !137)
!1993 = !{!98, !1994}
!1994 = !DITemplateTypeParameter(name: "_Period", type: !100)
!1995 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1996, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !1997, identifier: "_ZTS8timespec")
!1996 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!1997 = !{!1998, !1999}
!1998 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1995, file: !1996, line: 16, baseType: !116, size: 64)
!1999 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1995, file: !1996, line: 21, baseType: !2000, size: 64, offset: 64)
!2000 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !53, line: 197, baseType: !46)
!2001 = !DILocation(line: 0, scope: !1973, inlinedAt: !2002)
!2002 = distinct !DILocation(line: 13, column: 5, scope: !1861)
!2003 = !DILocation(line: 77, column: 2, scope: !1973, inlinedAt: !2002)
!2004 = !DILocation(line: 78, column: 4, scope: !1973, inlinedAt: !2002)
!2005 = !{!2006, !2007, i64 0}
!2006 = !{!"_ZTS8timespec", !2007, i64 0, !2007, i64 8}
!2007 = !{!"long", !2008, i64 0}
!2008 = !{!"omnipotent char", !2009, i64 0}
!2009 = !{!"Simple C++ TBAA"}
!2010 = distinct !DIAssignID()
!2011 = !{!2006, !2007, i64 8}
!2012 = distinct !DIAssignID()
!2013 = !DILocation(line: 82, column: 2, scope: !1973, inlinedAt: !2002)
!2014 = !DILocation(line: 82, column: 9, scope: !1973, inlinedAt: !2002)
!2015 = !DILocation(line: 82, column: 35, scope: !1973, inlinedAt: !2002)
!2016 = !DILocation(line: 82, column: 41, scope: !1973, inlinedAt: !2002)
!2017 = !DILocation(line: 82, column: 44, scope: !1973, inlinedAt: !2002)
!2018 = !{!2019, !2019, i64 0}
!2019 = !{!"int", !2008, i64 0}
!2020 = !DILocation(line: 82, column: 50, scope: !1973, inlinedAt: !2002)
!2021 = distinct !{!2021, !2013, !2022, !1885}
!2022 = !DILocation(line: 83, column: 6, scope: !1973, inlinedAt: !2002)
!2023 = !DILocation(line: 87, column: 7, scope: !1973, inlinedAt: !2002)
!2024 = !DILocation(line: 0, scope: !1887, inlinedAt: !2025)
!2025 = distinct !DILocation(line: 14, column: 10, scope: !1861)
!2026 = !DILocation(line: 616, column: 2, scope: !1954, inlinedAt: !2025)
!2027 = !DILocation(line: 0, scope: !1956, inlinedAt: !2028)
!2028 = distinct !DILocation(line: 14, column: 23, scope: !1861)
!2029 = !DILocation(line: 171, column: 16, scope: !1956, inlinedAt: !2028)
!2030 = !DILocation(line: 0, scope: !1887, inlinedAt: !2031)
!2031 = distinct !DILocation(line: 14, column: 30, scope: !1861)
!2032 = !DILocation(line: 616, column: 2, scope: !1954, inlinedAt: !2031)
!2033 = !DILocalVariable(name: "this", arg: 1, scope: !2034, type: !1871, flags: DIFlagArtificial | DIFlagObjectPointer)
!2034 = distinct !DISubprogram(name: "unlock", linkageName: "_ZN8spinlock6unlockEv", scope: !1844, file: !1845, line: 9, type: !1849, scopeLine: 9, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !1852, retainedNodes: !2035)
!2035 = !{!2033}
!2036 = !DILocation(line: 0, scope: !2034, inlinedAt: !2037)
!2037 = distinct !DILocation(line: 15, column: 10, scope: !1861)
!2038 = !DILocalVariable(name: "this", arg: 1, scope: !2039, type: !1879, flags: DIFlagArtificial | DIFlagObjectPointer)
!2039 = distinct !DISubprogram(name: "clear", linkageName: "_ZNSt11atomic_flag5clearESt12memory_order", scope: !656, file: !13, line: 269, type: !692, scopeLine: 270, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !691, retainedNodes: !2040)
!2040 = !{!2038, !2041, !2042}
!2041 = !DILocalVariable(name: "__m", arg: 2, scope: !2039, file: !13, line: 269, type: !109)
!2042 = !DILocalVariable(name: "__b", scope: !2039, file: !13, line: 271, type: !109)
!2043 = !DILocation(line: 0, scope: !2039, inlinedAt: !2044)
!2044 = distinct !DILocation(line: 10, column: 16, scope: !2034, inlinedAt: !2037)
!2045 = !DILocation(line: 277, column: 7, scope: !2039, inlinedAt: !2044)
!2046 = !DILocation(line: 16, column: 1, scope: !1861)
!2047 = distinct !DISubprogram(name: "main", scope: !900, file: !900, line: 18, type: !1486, scopeLine: 18, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, retainedNodes: !2048)
!2048 = !{!2049, !2053, !2056, !2058, !2059}
!2049 = !DILocalVariable(name: "th", scope: !2047, file: !900, line: 19, type: !2050)
!2050 = !DICompositeType(tag: DW_TAG_array_type, baseType: !202, size: 128, elements: !2051)
!2051 = !{!2052}
!2052 = !DISubrange(count: 2)
!2053 = !DILocalVariable(name: "__range1", scope: !2054, type: !2055, flags: DIFlagArtificial)
!2054 = distinct !DILexicalBlock(scope: !2047, file: !900, line: 22, column: 5)
!2055 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2050, size: 64)
!2056 = !DILocalVariable(name: "__begin1", scope: !2054, type: !2057, flags: DIFlagArtificial)
!2057 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !202, size: 64)
!2058 = !DILocalVariable(name: "__end1", scope: !2054, type: !2057, flags: DIFlagArtificial)
!2059 = !DILocalVariable(name: "t", scope: !2060, file: !900, line: 22, type: !238)
!2060 = distinct !DILexicalBlock(scope: !2054, file: !900, line: 22, column: 5)
!2061 = distinct !DIAssignID()
!2062 = !DILocation(line: 0, scope: !2047)
!2063 = !DILocation(line: 19, column: 5, scope: !2047)
!2064 = !DILocation(line: 86, column: 23, scope: !2065, inlinedAt: !2069)
!2065 = distinct !DISubprogram(name: "id", linkageName: "_ZNSt6thread2idC2Ev", scope: !205, file: !201, line: 86, type: !215, scopeLine: 86, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !214, retainedNodes: !2066)
!2066 = !{!2067}
!2067 = !DILocalVariable(name: "this", arg: 1, scope: !2065, type: !2068, flags: DIFlagArtificial | DIFlagObjectPointer)
!2068 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64)
!2069 = distinct !DILocation(line: 121, column: 5, scope: !2070, inlinedAt: !2073)
!2070 = distinct !DISubprogram(name: "thread", linkageName: "_ZNSt6threadC2Ev", scope: !202, file: !201, line: 121, type: !222, scopeLine: 121, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !221, retainedNodes: !2071)
!2071 = !{!2072}
!2072 = !DILocalVariable(name: "this", arg: 1, scope: !2070, type: !2057, flags: DIFlagArtificial | DIFlagObjectPointer)
!2073 = distinct !DILocation(line: 19, column: 12, scope: !2047)
!2074 = !{!2075, !2007, i64 0}
!2075 = !{!"_ZTSNSt6thread2idE", !2007, i64 0}
!2076 = !DILocation(line: 0, scope: !2070, inlinedAt: !2073)
!2077 = !DILocation(line: 0, scope: !2065, inlinedAt: !2069)
!2078 = !DILocation(line: 20, column: 13, scope: !2047)
!2079 = !DILocation(line: 86, column: 23, scope: !2065, inlinedAt: !2080)
!2080 = distinct !DILocation(line: 127, column: 7, scope: !2081, inlinedAt: !2095)
!2081 = distinct !DISubprogram(name: "thread<void (&)(unsigned long), int, void>", linkageName: "_ZNSt6threadC2IRFvmEJiEvEEOT_DpOT0_", scope: !202, file: !201, line: 127, type: !2082, scopeLine: 128, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !2086, declaration: !2085, retainedNodes: !2089)
!2082 = !DISubroutineType(types: !2083)
!2083 = !{null, !224, !2084, !640}
!2084 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !638, size: 64)
!2085 = !DISubprogram(name: "thread<void (&)(unsigned long), int, void>", scope: !202, file: !201, line: 127, type: !2082, scopeLine: 127, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2086)
!2086 = !{!2087, !646, !2088}
!2087 = !DITemplateTypeParameter(name: "_Callable", type: !2084)
!2088 = !DITemplateTypeParameter(type: null)
!2089 = !{!2090, !2091, !2092, !2093}
!2090 = !DILocalVariable(name: "this", arg: 1, scope: !2081, type: !2057, flags: DIFlagArtificial | DIFlagObjectPointer)
!2091 = !DILocalVariable(name: "__f", arg: 2, scope: !2081, file: !201, line: 127, type: !2084)
!2092 = !DILocalVariable(name: "__args", arg: 3, scope: !2081, file: !201, line: 127, type: !640)
!2093 = !DILocalVariable(name: "__depend", scope: !2094, file: !201, line: 138, type: !581)
!2094 = distinct !DILexicalBlock(scope: !2081, file: !201, line: 128, column: 7)
!2095 = distinct !DILocation(line: 20, column: 13, scope: !2047)
!2096 = !DILocation(line: 0, scope: !2081, inlinedAt: !2095)
!2097 = !DILocation(line: 0, scope: !2065, inlinedAt: !2080)
!2098 = !DILocation(line: 0, scope: !2094, inlinedAt: !2095)
!2099 = !DILocation(line: 143, column: 29, scope: !2094, inlinedAt: !2095)
!2100 = !DILocalVariable(name: "this", arg: 1, scope: !2101, type: !2122, flags: DIFlagArtificial | DIFlagObjectPointer)
!2101 = distinct !DISubprogram(name: "_State_impl<void (&)(unsigned long), int>", linkageName: "_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEC2IJRS3_iEEEDpOT_", scope: !2102, file: !201, line: 206, type: !2112, scopeLine: 208, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !2115, declaration: !2114, retainedNodes: !2119)
!2102 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_State_impl<std::thread::_Invoker<std::tuple<void (*)(unsigned long), int> > >", scope: !202, file: !201, line: 201, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !2103, vtableHolder: !301, templateParams: !2110, identifier: "_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE")
!2103 = !{!2104, !2105, !2106}
!2104 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !2102, baseType: !301, extraData: i32 0)
!2105 = !DIDerivedType(tag: DW_TAG_member, name: "_M_func", scope: !2102, file: !201, line: 203, baseType: !888, size: 128, offset: 64)
!2106 = !DISubprogram(name: "_M_run", linkageName: "_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEE6_M_runEv", scope: !2102, file: !201, line: 211, type: !2107, scopeLine: 211, containingType: !2102, virtualIndex: 2, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2107 = !DISubroutineType(types: !2108)
!2108 = !{null, !2109}
!2109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2102, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2110 = !{!2111}
!2111 = !DITemplateTypeParameter(name: "_Callable", type: !888)
!2112 = !DISubroutineType(types: !2113)
!2113 = !{null, !2109, !2084, !640}
!2114 = !DISubprogram(name: "_State_impl<void (&)(unsigned long), int>", scope: !2102, file: !201, line: 206, type: !2112, scopeLine: 206, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2115)
!2115 = !{!2116}
!2116 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Args", value: !2117)
!2117 = !{!2118, !648}
!2118 = !DITemplateTypeParameter(type: !2084)
!2119 = !{!2100, !2120, !2121}
!2120 = !DILocalVariable(name: "__args", arg: 2, scope: !2101, file: !201, line: 206, type: !2084)
!2121 = !DILocalVariable(name: "__args", arg: 3, scope: !2101, file: !201, line: 206, type: !640)
!2122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2102, size: 64)
!2123 = !DILocation(line: 0, scope: !2101, inlinedAt: !2124)
!2124 = distinct !DILocation(line: 143, column: 33, scope: !2094, inlinedAt: !2095)
!2125 = !DILocation(line: 208, column: 4, scope: !2101, inlinedAt: !2124)
!2126 = !{!2127, !2127, i64 0}
!2127 = !{!"vtable pointer", !2009, i64 0}
!2128 = !DILocation(line: 207, column: 6, scope: !2101, inlinedAt: !2124)
!2129 = !DILocalVariable(name: "this", arg: 1, scope: !2130, type: !2137, flags: DIFlagArtificial | DIFlagObjectPointer)
!2130 = distinct !DISubprogram(name: "_Invoker<void (&)(unsigned long), int>", linkageName: "_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEEC2IJRS2_iEEEDpOT_", scope: !888, file: !201, line: 243, type: !2131, scopeLine: 245, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !2115, declaration: !2133, retainedNodes: !2134)
!2131 = !DISubroutineType(types: !2132)
!2132 = !{null, !894, !2084, !640}
!2133 = !DISubprogram(name: "_Invoker<void (&)(unsigned long), int>", scope: !888, file: !201, line: 243, type: !2131, scopeLine: 243, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2115)
!2134 = !{!2129, !2135, !2136}
!2135 = !DILocalVariable(name: "__args", arg: 2, scope: !2130, file: !201, line: 243, type: !2084)
!2136 = !DILocalVariable(name: "__args", arg: 3, scope: !2130, file: !201, line: 243, type: !640)
!2137 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !888, size: 64)
!2138 = !DILocation(line: 0, scope: !2130, inlinedAt: !2139)
!2139 = distinct !DILocation(line: 207, column: 6, scope: !2101, inlinedAt: !2124)
!2140 = !DILocalVariable(name: "this", arg: 1, scope: !2141, type: !2151, flags: DIFlagArtificial | DIFlagObjectPointer)
!2141 = distinct !DISubprogram(name: "tuple<void (&)(unsigned long), int, true>", linkageName: "_ZNSt5tupleIJPFvmEiEEC2IRS0_iTnNSt9enable_ifIXclsr4_TCCIXntcl14__is_alloc_argIT_EEEEE29__is_implicitly_constructibleIS6_T0_EEEbE4typeELb1EEEOS6_OS7_", scope: !855, file: !277, line: 1077, type: !2142, scopeLine: 1079, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !2145, declaration: !2144, retainedNodes: !2148)
!2142 = !DISubroutineType(types: !2143)
!2143 = !{null, !862, !2084, !640}
!2144 = !DISubprogram(name: "tuple<void (&)(unsigned long), int, true>", scope: !855, file: !277, line: 1077, type: !2142, scopeLine: 1077, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2145)
!2145 = !{!2146, !2147, !1985}
!2146 = !DITemplateTypeParameter(name: "_U1", type: !2084)
!2147 = !DITemplateTypeParameter(name: "_U2", type: !29)
!2148 = !{!2140, !2149, !2150}
!2149 = !DILocalVariable(name: "__a1", arg: 2, scope: !2141, file: !277, line: 1077, type: !2084)
!2150 = !DILocalVariable(name: "__a2", arg: 3, scope: !2141, file: !277, line: 1077, type: !640)
!2151 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !855, size: 64)
!2152 = !DILocation(line: 0, scope: !2141, inlinedAt: !2153)
!2153 = distinct !DILocation(line: 244, column: 6, scope: !2130, inlinedAt: !2139)
!2154 = !DILocalVariable(name: "this", arg: 1, scope: !2155, type: !2165, flags: DIFlagArtificial | DIFlagObjectPointer)
!2155 = distinct !DISubprogram(name: "_Tuple_impl<void (&)(unsigned long), int, void>", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEEC2IRS0_JiEvEEOT_DpOT0_", scope: !808, file: !277, line: 290, type: !2156, scopeLine: 293, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !2159, declaration: !2158, retainedNodes: !2162)
!2156 = !DISubroutineType(types: !2157)
!2157 = !{null, !834, !2084, !640}
!2158 = !DISubprogram(name: "_Tuple_impl<void (&)(unsigned long), int, void>", scope: !808, file: !277, line: 290, type: !2156, scopeLine: 290, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2159)
!2159 = !{!2160, !2161, !2088}
!2160 = !DITemplateTypeParameter(name: "_UHead", type: !2084)
!2161 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_UTail", value: !647)
!2162 = !{!2154, !2163, !2164}
!2163 = !DILocalVariable(name: "__head", arg: 2, scope: !2155, file: !277, line: 290, type: !2084)
!2164 = !DILocalVariable(name: "__tail", arg: 3, scope: !2155, file: !277, line: 290, type: !640)
!2165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !808, size: 64)
!2166 = !DILocation(line: 0, scope: !2155, inlinedAt: !2167)
!2167 = distinct !DILocation(line: 1079, column: 4, scope: !2141, inlinedAt: !2153)
!2168 = !DILocalVariable(name: "this", arg: 1, scope: !2169, type: !2177, flags: DIFlagArtificial | DIFlagObjectPointer)
!2169 = distinct !DISubprogram(name: "_Tuple_impl<int>", linkageName: "_ZNSt11_Tuple_implILm1EJiEEC2IiEEOT_", scope: !740, file: !277, line: 440, type: !2170, scopeLine: 442, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !2173, declaration: !2172, retainedNodes: !2175)
!2170 = !DISubroutineType(types: !2171)
!2171 = !{null, !755, !640}
!2172 = !DISubprogram(name: "_Tuple_impl<int>", scope: !740, file: !277, line: 440, type: !2170, scopeLine: 440, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2173)
!2173 = !{!2174}
!2174 = !DITemplateTypeParameter(name: "_UHead", type: !29)
!2175 = !{!2168, !2176}
!2176 = !DILocalVariable(name: "__head", arg: 2, scope: !2169, file: !277, line: 440, type: !640)
!2177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !740, size: 64)
!2178 = !DILocation(line: 0, scope: !2169, inlinedAt: !2179)
!2179 = distinct !DILocation(line: 291, column: 4, scope: !2155, inlinedAt: !2167)
!2180 = !DILocalVariable(name: "this", arg: 1, scope: !2181, type: !2187, flags: DIFlagArtificial | DIFlagObjectPointer)
!2181 = distinct !DISubprogram(name: "_Head_base<int>", linkageName: "_ZNSt10_Head_baseILm1EiLb0EEC2IiEEOT_", scope: !706, file: !277, line: 199, type: !2182, scopeLine: 200, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !2173, declaration: !2184, retainedNodes: !2185)
!2182 = !DISubroutineType(types: !2183)
!2183 = !{null, !712, !640}
!2184 = !DISubprogram(name: "_Head_base<int>", scope: !706, file: !277, line: 199, type: !2182, scopeLine: 199, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2173)
!2185 = !{!2180, !2186}
!2186 = !DILocalVariable(name: "__h", arg: 2, scope: !2181, file: !277, line: 199, type: !640)
!2187 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !706, size: 64)
!2188 = !DILocation(line: 0, scope: !2181, inlinedAt: !2189)
!2189 = distinct !DILocation(line: 441, column: 4, scope: !2169, inlinedAt: !2179)
!2190 = !DILocation(line: 200, column: 4, scope: !2181, inlinedAt: !2189)
!2191 = !{!2192, !2019, i64 0}
!2192 = !{!"_ZTSSt10_Head_baseILm1EiLb0EE", !2019, i64 0}
!2193 = !DILocation(line: 293, column: 2, scope: !2155, inlinedAt: !2167)
!2194 = !DILocalVariable(name: "this", arg: 1, scope: !2195, type: !2198, flags: DIFlagArtificial | DIFlagObjectPointer)
!2195 = distinct !DISubprogram(name: "_Head_base", linkageName: "_ZNSt10_Head_baseILm0EPFvmELb0EEC2ERKS1_", scope: !774, file: !277, line: 192, type: !782, scopeLine: 193, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !781, retainedNodes: !2196)
!2196 = !{!2194, !2197}
!2197 = !DILocalVariable(name: "__h", arg: 2, scope: !2195, file: !277, line: 192, type: !784)
!2198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !774, size: 64)
!2199 = !DILocation(line: 0, scope: !2195, inlinedAt: !2200)
!2200 = distinct !DILocation(line: 292, column: 4, scope: !2155, inlinedAt: !2167)
!2201 = !DILocation(line: 193, column: 9, scope: !2195, inlinedAt: !2200)
!2202 = !{!2203, !2204, i64 0}
!2203 = !{!"_ZTSSt10_Head_baseILm0EPFvmELb0EE", !2204, i64 0}
!2204 = !{!"any pointer", !2008, i64 0}
!2205 = !DILocalVariable(name: "this", arg: 1, scope: !2206, type: !2212, flags: DIFlagArtificial | DIFlagObjectPointer)
!2206 = distinct !DISubprogram(name: "unique_ptr<std::default_delete<std::thread::_State>, void>", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEC2IS3_vEEPS1_", scope: !266, file: !267, line: 281, type: !613, scopeLine: 283, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !2208, declaration: !2207, retainedNodes: !2210)
!2207 = !DISubprogram(name: "unique_ptr<std::default_delete<std::thread::_State>, void>", scope: !266, file: !267, line: 281, type: !613, scopeLine: 281, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2208)
!2208 = !{!2209, !2088}
!2209 = !DITemplateTypeParameter(name: "_Del", type: !289)
!2210 = !{!2205, !2211}
!2211 = !DILocalVariable(name: "__p", arg: 2, scope: !2206, file: !267, line: 281, type: !594)
!2212 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !266, size: 64)
!2213 = !DILocation(line: 0, scope: !2206, inlinedAt: !2214)
!2214 = distinct !DILocation(line: 143, column: 18, scope: !2094, inlinedAt: !2095)
!2215 = !DILocalVariable(name: "this", arg: 1, scope: !2216, type: !2222, flags: DIFlagArtificial | DIFlagObjectPointer)
!2216 = distinct !DISubprogram(name: "__uniq_ptr_impl", linkageName: "_ZNSt15__uniq_ptr_dataINSt6thread6_StateESt14default_deleteIS1_ELb1ELb1EECI2St15__uniq_ptr_implIS1_S3_EEPS1_", scope: !270, file: !267, line: 210, type: !2217, scopeLine: 210, flags: DIFlagArtificial | DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !2219, retainedNodes: !2220)
!2217 = !DISubroutineType(types: !2218)
!2218 = !{null, !558, !516}
!2219 = !DISubprogram(name: "__uniq_ptr_impl", scope: !270, type: !2217, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2220 = !{!2215, !2221}
!2221 = !DILocalVariable(arg: 2, scope: !2216, type: !516, flags: DIFlagArtificial)
!2222 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !270, size: 64)
!2223 = !DILocation(line: 0, scope: !2216, inlinedAt: !2224)
!2224 = distinct !DILocation(line: 282, column: 4, scope: !2206, inlinedAt: !2214)
!2225 = !DILocalVariable(name: "this", arg: 1, scope: !2226, type: !2229, flags: DIFlagArtificial | DIFlagObjectPointer)
!2226 = distinct !DISubprogram(name: "__uniq_ptr_impl", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EEC2EPS1_", scope: !273, file: !267, line: 155, type: !514, scopeLine: 155, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !513, retainedNodes: !2227)
!2227 = !{!2225, !2228}
!2228 = !DILocalVariable(name: "__p", arg: 2, scope: !2226, file: !267, line: 155, type: !516)
!2229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !273, size: 64)
!2230 = !DILocation(line: 0, scope: !2226, inlinedAt: !2231)
!2231 = distinct !DILocation(line: 210, column: 40, scope: !2216, inlinedAt: !2224)
!2232 = !DILocation(line: 155, column: 56, scope: !2233, inlinedAt: !2231)
!2233 = distinct !DILexicalBlock(scope: !2226, file: !267, line: 155, column: 45)
!2234 = !{!2204, !2204, i64 0}
!2235 = !DILocation(line: 143, column: 2, scope: !2094, inlinedAt: !2095)
!2236 = !DILocalVariable(name: "this", arg: 1, scope: !2237, type: !2212, flags: DIFlagArtificial | DIFlagObjectPointer)
!2237 = distinct !DISubprogram(name: "~unique_ptr", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EED2Ev", scope: !266, file: !267, line: 355, type: !571, scopeLine: 356, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !570, retainedNodes: !2238)
!2238 = !{!2236, !2239}
!2239 = !DILocalVariable(name: "__ptr", scope: !2240, file: !267, line: 359, type: !534)
!2240 = distinct !DILexicalBlock(scope: !2237, file: !267, line: 356, column: 7)
!2241 = !DILocation(line: 0, scope: !2237, inlinedAt: !2242)
!2242 = distinct !DILocation(line: 143, column: 2, scope: !2094, inlinedAt: !2095)
!2243 = !DILocation(line: 0, scope: !2240, inlinedAt: !2242)
!2244 = !DILocation(line: 360, column: 6, scope: !2245, inlinedAt: !2242)
!2245 = distinct !DILexicalBlock(scope: !2240, file: !267, line: 360, column: 6)
!2246 = !DILocation(line: 360, column: 12, scope: !2245, inlinedAt: !2242)
!2247 = !DILocation(line: 360, column: 6, scope: !2240, inlinedAt: !2242)
!2248 = !DILocalVariable(name: "this", arg: 1, scope: !2249, type: !2252, flags: DIFlagArtificial | DIFlagObjectPointer)
!2249 = distinct !DISubprogram(name: "operator()", linkageName: "_ZNKSt14default_deleteINSt6thread6_StateEEclEPS1_", scope: !289, file: !267, line: 79, type: !296, scopeLine: 80, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !295, retainedNodes: !2250)
!2250 = !{!2248, !2251}
!2251 = !DILocalVariable(name: "__ptr", arg: 2, scope: !2249, file: !267, line: 79, type: !300)
!2252 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !299, size: 64)
!2253 = !DILocation(line: 0, scope: !2249, inlinedAt: !2254)
!2254 = distinct !DILocation(line: 361, column: 4, scope: !2245, inlinedAt: !2242)
!2255 = !DILocation(line: 85, column: 2, scope: !2249, inlinedAt: !2254)
!2256 = !DILocation(line: 361, column: 4, scope: !2245, inlinedAt: !2242)
!2257 = !DILocation(line: 146, column: 7, scope: !2094, inlinedAt: !2095)
!2258 = !DILocation(line: 0, scope: !2237, inlinedAt: !2259)
!2259 = distinct !DILocation(line: 143, column: 2, scope: !2094, inlinedAt: !2095)
!2260 = !DILocation(line: 0, scope: !2240, inlinedAt: !2259)
!2261 = !DILocation(line: 360, column: 6, scope: !2245, inlinedAt: !2259)
!2262 = !DILocation(line: 360, column: 12, scope: !2245, inlinedAt: !2259)
!2263 = !DILocation(line: 360, column: 6, scope: !2240, inlinedAt: !2259)
!2264 = !DILocation(line: 0, scope: !2249, inlinedAt: !2265)
!2265 = distinct !DILocation(line: 361, column: 4, scope: !2245, inlinedAt: !2259)
!2266 = !DILocation(line: 85, column: 2, scope: !2249, inlinedAt: !2265)
!2267 = !DILocation(line: 361, column: 4, scope: !2245, inlinedAt: !2259)
!2268 = !DILocation(line: 146, column: 7, scope: !2081, inlinedAt: !2095)
!2269 = !DILocalVariable(name: "this", arg: 1, scope: !2270, type: !2057, flags: DIFlagArtificial | DIFlagObjectPointer)
!2270 = distinct !DISubprogram(name: "operator=", linkageName: "_ZNSt6threadaSEOS_", scope: !202, file: !201, line: 162, type: !240, scopeLine: 163, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !239, retainedNodes: !2271)
!2271 = !{!2269, !2272}
!2272 = !DILocalVariable(name: "__t", arg: 2, scope: !2270, file: !201, line: 162, type: !234)
!2273 = !DILocation(line: 0, scope: !2270, inlinedAt: !2274)
!2274 = distinct !DILocation(line: 20, column: 11, scope: !2047)
!2275 = !DILocalVariable(name: "this", arg: 1, scope: !2276, type: !2278, flags: DIFlagArtificial | DIFlagObjectPointer)
!2276 = distinct !DISubprogram(name: "joinable", linkageName: "_ZNKSt6thread8joinableEv", scope: !202, file: !201, line: 175, type: !246, scopeLine: 176, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !245, retainedNodes: !2277)
!2277 = !{!2275}
!2278 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64)
!2279 = !DILocation(line: 0, scope: !2276, inlinedAt: !2280)
!2280 = distinct !DILocation(line: 164, column: 11, scope: !2281, inlinedAt: !2274)
!2281 = distinct !DILexicalBlock(scope: !2270, file: !201, line: 164, column: 11)
!2282 = !DILocalVariable(name: "__x", arg: 1, scope: !2283, file: !201, line: 287, type: !205)
!2283 = distinct !DISubprogram(name: "operator==", linkageName: "_ZSteqNSt6thread2idES0_", scope: !2, file: !201, line: 287, type: !2284, scopeLine: 288, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, retainedNodes: !2286)
!2284 = !DISubroutineType(types: !2285)
!2285 = !{!121, !205, !205}
!2286 = !{!2282, !2287}
!2287 = !DILocalVariable(name: "__y", arg: 2, scope: !2283, file: !201, line: 287, type: !205)
!2288 = !DILocation(line: 0, scope: !2283, inlinedAt: !2289)
!2289 = distinct !DILocation(line: 176, column: 22, scope: !2276, inlinedAt: !2280)
!2290 = !DILocalVariable(name: "this", arg: 1, scope: !2291, type: !2057, flags: DIFlagArtificial | DIFlagObjectPointer)
!2291 = distinct !DISubprogram(name: "swap", linkageName: "_ZNSt6thread4swapERS_", scope: !202, file: !201, line: 171, type: !243, scopeLine: 172, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !242, retainedNodes: !2292)
!2292 = !{!2290, !2293}
!2293 = !DILocalVariable(name: "__t", arg: 2, scope: !2291, file: !201, line: 171, type: !238)
!2294 = !DILocation(line: 0, scope: !2291, inlinedAt: !2295)
!2295 = distinct !DILocation(line: 166, column: 7, scope: !2270, inlinedAt: !2274)
!2296 = !DILocalVariable(name: "__a", arg: 1, scope: !2297, file: !2298, line: 196, type: !2305)
!2297 = distinct !DISubprogram(name: "swap<std::thread::id>", linkageName: "_ZSt4swapINSt6thread2idEENSt9enable_ifIXsr6__and_ISt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SE_", scope: !2, file: !2298, line: 196, type: !2299, scopeLine: 199, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !2309, retainedNodes: !2306)
!2298 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/move.h", directory: "", checksumkind: CSK_MD5, checksum: "156ce13c58f77c44098165fa0e6b5efc")
!2299 = !DISubroutineType(types: !2300)
!2300 = !{!2301, !2305, !2305}
!2301 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2302, file: !487, line: 2199, baseType: null)
!2302 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "enable_if<true, void>", scope: !2, file: !487, line: 2198, size: 8, flags: DIFlagTypePassByValue, elements: !132, templateParams: !2303, identifier: "_ZTSSt9enable_ifILb1EvE")
!2303 = !{!1985, !2304}
!2304 = !DITemplateTypeParameter(name: "_Tp", type: null, defaulted: true)
!2305 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !205, size: 64)
!2306 = !{!2296, !2307, !2308}
!2307 = !DILocalVariable(name: "__b", arg: 2, scope: !2297, file: !2298, line: 196, type: !2305)
!2308 = !DILocalVariable(name: "__tmp", scope: !2297, file: !2298, line: 204, type: !205)
!2309 = !{!2310}
!2310 = !DITemplateTypeParameter(name: "_Tp", type: !205)
!2311 = !DILocation(line: 0, scope: !2297, inlinedAt: !2312)
!2312 = distinct !DILocation(line: 172, column: 7, scope: !2291, inlinedAt: !2295)
!2313 = !DILocation(line: 205, column: 11, scope: !2297, inlinedAt: !2312)
!2314 = !{!2007, !2007, i64 0}
!2315 = distinct !DIAssignID()
!2316 = !DILocalVariable(name: "this", arg: 1, scope: !2317, type: !2057, flags: DIFlagArtificial | DIFlagObjectPointer)
!2317 = distinct !DISubprogram(name: "~thread", linkageName: "_ZNSt6threadD2Ev", scope: !202, file: !201, line: 149, type: !222, scopeLine: 150, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !225, retainedNodes: !2318)
!2318 = !{!2316}
!2319 = !DILocation(line: 0, scope: !2317, inlinedAt: !2320)
!2320 = distinct !DILocation(line: 20, column: 5, scope: !2047)
!2321 = !DILocation(line: 0, scope: !2276, inlinedAt: !2322)
!2322 = distinct !DILocation(line: 151, column: 11, scope: !2323, inlinedAt: !2320)
!2323 = distinct !DILexicalBlock(scope: !2324, file: !201, line: 151, column: 11)
!2324 = distinct !DILexicalBlock(scope: !2317, file: !201, line: 150, column: 5)
!2325 = !DILocation(line: 0, scope: !2283, inlinedAt: !2326)
!2326 = distinct !DILocation(line: 176, column: 22, scope: !2276, inlinedAt: !2322)
!2327 = !DILocation(line: 20, column: 5, scope: !2047)
!2328 = !DILocation(line: 21, column: 13, scope: !2047)
!2329 = !DILocation(line: 86, column: 23, scope: !2065, inlinedAt: !2330)
!2330 = distinct !DILocation(line: 127, column: 7, scope: !2081, inlinedAt: !2331)
!2331 = distinct !DILocation(line: 21, column: 13, scope: !2047)
!2332 = !DILocation(line: 0, scope: !2081, inlinedAt: !2331)
!2333 = !DILocation(line: 0, scope: !2065, inlinedAt: !2330)
!2334 = !DILocation(line: 0, scope: !2094, inlinedAt: !2331)
!2335 = !DILocation(line: 143, column: 29, scope: !2094, inlinedAt: !2331)
!2336 = !DILocation(line: 0, scope: !2101, inlinedAt: !2337)
!2337 = distinct !DILocation(line: 143, column: 33, scope: !2094, inlinedAt: !2331)
!2338 = !DILocation(line: 208, column: 4, scope: !2101, inlinedAt: !2337)
!2339 = !DILocation(line: 207, column: 6, scope: !2101, inlinedAt: !2337)
!2340 = !DILocation(line: 0, scope: !2130, inlinedAt: !2341)
!2341 = distinct !DILocation(line: 207, column: 6, scope: !2101, inlinedAt: !2337)
!2342 = !DILocation(line: 0, scope: !2141, inlinedAt: !2343)
!2343 = distinct !DILocation(line: 244, column: 6, scope: !2130, inlinedAt: !2341)
!2344 = !DILocation(line: 0, scope: !2155, inlinedAt: !2345)
!2345 = distinct !DILocation(line: 1079, column: 4, scope: !2141, inlinedAt: !2343)
!2346 = !DILocation(line: 0, scope: !2169, inlinedAt: !2347)
!2347 = distinct !DILocation(line: 291, column: 4, scope: !2155, inlinedAt: !2345)
!2348 = !DILocation(line: 0, scope: !2181, inlinedAt: !2349)
!2349 = distinct !DILocation(line: 441, column: 4, scope: !2169, inlinedAt: !2347)
!2350 = !DILocation(line: 200, column: 4, scope: !2181, inlinedAt: !2349)
!2351 = !DILocation(line: 293, column: 2, scope: !2155, inlinedAt: !2345)
!2352 = !DILocation(line: 0, scope: !2195, inlinedAt: !2353)
!2353 = distinct !DILocation(line: 292, column: 4, scope: !2155, inlinedAt: !2345)
!2354 = !DILocation(line: 193, column: 9, scope: !2195, inlinedAt: !2353)
!2355 = !DILocation(line: 0, scope: !2206, inlinedAt: !2356)
!2356 = distinct !DILocation(line: 143, column: 18, scope: !2094, inlinedAt: !2331)
!2357 = !DILocation(line: 0, scope: !2216, inlinedAt: !2358)
!2358 = distinct !DILocation(line: 282, column: 4, scope: !2206, inlinedAt: !2356)
!2359 = !DILocation(line: 0, scope: !2226, inlinedAt: !2360)
!2360 = distinct !DILocation(line: 210, column: 40, scope: !2216, inlinedAt: !2358)
!2361 = !DILocation(line: 155, column: 56, scope: !2233, inlinedAt: !2360)
!2362 = !DILocation(line: 143, column: 2, scope: !2094, inlinedAt: !2331)
!2363 = !DILocation(line: 0, scope: !2237, inlinedAt: !2364)
!2364 = distinct !DILocation(line: 143, column: 2, scope: !2094, inlinedAt: !2331)
!2365 = !DILocation(line: 0, scope: !2240, inlinedAt: !2364)
!2366 = !DILocation(line: 360, column: 6, scope: !2245, inlinedAt: !2364)
!2367 = !DILocation(line: 360, column: 12, scope: !2245, inlinedAt: !2364)
!2368 = !DILocation(line: 360, column: 6, scope: !2240, inlinedAt: !2364)
!2369 = !DILocation(line: 0, scope: !2249, inlinedAt: !2370)
!2370 = distinct !DILocation(line: 361, column: 4, scope: !2245, inlinedAt: !2364)
!2371 = !DILocation(line: 85, column: 2, scope: !2249, inlinedAt: !2370)
!2372 = !DILocation(line: 361, column: 4, scope: !2245, inlinedAt: !2364)
!2373 = !DILocation(line: 146, column: 7, scope: !2094, inlinedAt: !2331)
!2374 = !DILocation(line: 0, scope: !2237, inlinedAt: !2375)
!2375 = distinct !DILocation(line: 143, column: 2, scope: !2094, inlinedAt: !2331)
!2376 = !DILocation(line: 0, scope: !2240, inlinedAt: !2375)
!2377 = !DILocation(line: 360, column: 6, scope: !2245, inlinedAt: !2375)
!2378 = !DILocation(line: 360, column: 12, scope: !2245, inlinedAt: !2375)
!2379 = !DILocation(line: 360, column: 6, scope: !2240, inlinedAt: !2375)
!2380 = !DILocation(line: 0, scope: !2249, inlinedAt: !2381)
!2381 = distinct !DILocation(line: 361, column: 4, scope: !2245, inlinedAt: !2375)
!2382 = !DILocation(line: 85, column: 2, scope: !2249, inlinedAt: !2381)
!2383 = !DILocation(line: 361, column: 4, scope: !2245, inlinedAt: !2375)
!2384 = !DILocation(line: 146, column: 7, scope: !2081, inlinedAt: !2331)
!2385 = !DILocation(line: 21, column: 5, scope: !2047)
!2386 = !DILocation(line: 0, scope: !2270, inlinedAt: !2387)
!2387 = distinct !DILocation(line: 21, column: 11, scope: !2047)
!2388 = !DILocation(line: 0, scope: !2276, inlinedAt: !2389)
!2389 = distinct !DILocation(line: 164, column: 11, scope: !2281, inlinedAt: !2387)
!2390 = !DILocation(line: 0, scope: !2283, inlinedAt: !2391)
!2391 = distinct !DILocation(line: 176, column: 22, scope: !2276, inlinedAt: !2389)
!2392 = !DILocation(line: 0, scope: !2291, inlinedAt: !2393)
!2393 = distinct !DILocation(line: 166, column: 7, scope: !2270, inlinedAt: !2387)
!2394 = !DILocation(line: 0, scope: !2297, inlinedAt: !2395)
!2395 = distinct !DILocation(line: 172, column: 7, scope: !2291, inlinedAt: !2393)
!2396 = !DILocation(line: 205, column: 11, scope: !2297, inlinedAt: !2395)
!2397 = distinct !DIAssignID()
!2398 = !DILocation(line: 0, scope: !2317, inlinedAt: !2399)
!2399 = distinct !DILocation(line: 21, column: 5, scope: !2047)
!2400 = !DILocation(line: 0, scope: !2276, inlinedAt: !2401)
!2401 = distinct !DILocation(line: 151, column: 11, scope: !2323, inlinedAt: !2399)
!2402 = !DILocation(line: 0, scope: !2283, inlinedAt: !2403)
!2403 = distinct !DILocation(line: 176, column: 22, scope: !2276, inlinedAt: !2401)
!2404 = !DILocation(line: 0, scope: !2054)
!2405 = !DILocation(line: 0, scope: !2060)
!2406 = !DILocation(line: 23, column: 11, scope: !2060)
!2407 = !DILocation(line: 25, column: 1, scope: !2047)
!2408 = !DILocation(line: 0, scope: !2317, inlinedAt: !2409)
!2409 = distinct !DILocation(line: 25, column: 1, scope: !2047)
!2410 = !DILocation(line: 0, scope: !2276, inlinedAt: !2411)
!2411 = distinct !DILocation(line: 151, column: 11, scope: !2323, inlinedAt: !2409)
!2412 = !DILocation(line: 176, column: 16, scope: !2276, inlinedAt: !2411)
!2413 = !DILocation(line: 0, scope: !2283, inlinedAt: !2414)
!2414 = distinct !DILocation(line: 176, column: 22, scope: !2276, inlinedAt: !2411)
!2415 = !DILocation(line: 293, column: 26, scope: !2283, inlinedAt: !2414)
!2416 = !DILocation(line: 151, column: 11, scope: !2324, inlinedAt: !2409)
!2417 = !DILocation(line: 152, column: 2, scope: !2323, inlinedAt: !2409)
!2418 = !DILocation(line: 25, column: 1, scope: !2060)
!2419 = !DILocation(line: 176, column: 16, scope: !2276, inlinedAt: !2420)
!2420 = distinct !DILocation(line: 151, column: 11, scope: !2323, inlinedAt: !2421)
!2421 = distinct !DILocation(line: 25, column: 1, scope: !2047)
!2422 = !DILocation(line: 293, column: 26, scope: !2283, inlinedAt: !2423)
!2423 = distinct !DILocation(line: 176, column: 22, scope: !2276, inlinedAt: !2420)
!2424 = !DILocation(line: 0, scope: !2317, inlinedAt: !2421)
!2425 = !DILocation(line: 0, scope: !2276, inlinedAt: !2420)
!2426 = !DILocation(line: 0, scope: !2283, inlinedAt: !2423)
!2427 = !DILocation(line: 151, column: 11, scope: !2324, inlinedAt: !2421)
!2428 = !DILocation(line: 152, column: 2, scope: !2323, inlinedAt: !2421)
!2429 = !DISubprogram(name: "terminate", linkageName: "_ZSt9terminatev", scope: !2, file: !2430, line: 83, type: !264, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!2430 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/exception", directory: "")
!2431 = !DISubprogram(name: "__ostream_insert<char, std::char_traits<char> >", linkageName: "_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l", scope: !2, file: !2432, line: 77, type: !2433, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2435)
!2432 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/ostream_insert.h", directory: "")
!2433 = !DISubroutineType(types: !2434)
!2434 = !{!1891, !1891, !1049, !110}
!2435 = !{!1950, !1897}
!2436 = !DISubprogram(name: "nanosleep", scope: !1806, file: !1806, line: 272, type: !2437, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2437 = !DISubroutineType(types: !2438)
!2438 = !{!29, !2439, !2441}
!2439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2440, size: 64)
!2440 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1995)
!2441 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1995, size: 64)
!2442 = !DISubprogram(name: "__errno_location", scope: !2443, file: !2443, line: 37, type: !2444, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2443 = !DIFile(filename: "/usr/include/errno.h", directory: "", checksumkind: CSK_MD5, checksum: "01c14bf4ab600a3884f5da68eb763170")
!2444 = !DISubroutineType(types: !2445)
!2445 = !{!2446}
!2446 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!2447 = distinct !DISubprogram(name: "~_State_impl", linkageName: "_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEED0Ev", scope: !2102, file: !201, line: 201, type: !2107, scopeLine: 201, flags: DIFlagArtificial | DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !2448, retainedNodes: !2449)
!2448 = !DISubprogram(name: "~_State_impl", scope: !2102, type: !2107, containingType: !2102, virtualIndex: 0, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!2449 = !{!2450}
!2450 = !DILocalVariable(name: "this", arg: 1, scope: !2447, type: !2122, flags: DIFlagArtificial | DIFlagObjectPointer)
!2451 = !DILocation(line: 0, scope: !2447)
!2452 = !DILocation(line: 201, column: 14, scope: !2447)
!2453 = distinct !DISubprogram(name: "_M_run", linkageName: "_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEE6_M_runEv", scope: !2102, file: !201, line: 211, type: !2107, scopeLine: 211, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !2106, retainedNodes: !2454)
!2454 = !{!2455}
!2455 = !DILocalVariable(name: "this", arg: 1, scope: !2453, type: !2122, flags: DIFlagArtificial | DIFlagObjectPointer)
!2456 = !DILocation(line: 0, scope: !2453)
!2457 = !DILocation(line: 211, column: 13, scope: !2453)
!2458 = !DILocalVariable(name: "this", arg: 1, scope: !2459, type: !2137, flags: DIFlagArtificial | DIFlagObjectPointer)
!2459 = distinct !DISubprogram(name: "operator()", linkageName: "_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEEclEv", scope: !888, file: !201, line: 262, type: !892, scopeLine: 263, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !891, retainedNodes: !2460)
!2460 = !{!2458}
!2461 = !DILocation(line: 0, scope: !2459, inlinedAt: !2462)
!2462 = distinct !DILocation(line: 211, column: 13, scope: !2453)
!2463 = !DILocalVariable(name: "this", arg: 1, scope: !2464, type: !2137, flags: DIFlagArtificial | DIFlagObjectPointer)
!2464 = distinct !DISubprogram(name: "_M_invoke<0UL, 1UL>", linkageName: "_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEE9_M_invokeIJLm0ELm1EEEEvSt12_Index_tupleIJXspT_EEE", scope: !888, file: !201, line: 258, type: !2465, scopeLine: 259, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !2475, declaration: !2474, retainedNodes: !2477)
!2465 = !DISubroutineType(types: !2466)
!2466 = !{!632, !894, !2467}
!2467 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Index_tuple<0UL, 1UL>", scope: !2, file: !2468, line: 298, size: 8, flags: DIFlagTypePassByValue, elements: !132, templateParams: !2469, identifier: "_ZTSSt12_Index_tupleIJLm0ELm1EEE")
!2468 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/utility", directory: "")
!2469 = !{!2470}
!2470 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Indexes", value: !2471)
!2471 = !{!2472, !2473}
!2472 = !DITemplateValueParameter(type: !213, value: i64 0)
!2473 = !DITemplateValueParameter(type: !213, value: i64 1)
!2474 = !DISubprogram(name: "_M_invoke<0UL, 1UL>", linkageName: "_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEE9_M_invokeIJLm0ELm1EEEEvSt12_Index_tupleIJXspT_EEE", scope: !888, file: !201, line: 258, type: !2465, scopeLine: 258, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, templateParams: !2475)
!2475 = !{!2476}
!2476 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Ind", value: !2471)
!2477 = !{!2463, !2478}
!2478 = !DILocalVariable(arg: 2, scope: !2464, file: !201, line: 258, type: !2467)
!2479 = !DILocation(line: 0, scope: !2464, inlinedAt: !2480)
!2480 = distinct !DILocation(line: 266, column: 11, scope: !2459, inlinedAt: !2462)
!2481 = !DILocalVariable(name: "__t", arg: 1, scope: !2482, file: !277, line: 1405, type: !868)
!2482 = distinct !DISubprogram(name: "get<0UL, void (*)(unsigned long), int>", linkageName: "_ZSt3getILm0EJPFvmEiEEONSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeEOS6_", scope: !2, file: !277, line: 1405, type: !2483, scopeLine: 1406, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !2493, retainedNodes: !2492)
!2483 = !DISubroutineType(types: !2484)
!2484 = !{!2485, !868}
!2485 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !2486, size: 64)
!2486 = !DIDerivedType(tag: DW_TAG_typedef, name: "__tuple_element_t<0UL, tuple<void (*)(unsigned long), int> >", scope: !2, file: !2468, line: 118, baseType: !2487)
!2487 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2488, file: !277, line: 1362, baseType: !637)
!2488 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tuple_element<0UL, std::tuple<void (*)(unsigned long), int> >", scope: !2, file: !277, line: 1360, size: 8, flags: DIFlagTypePassByValue, elements: !132, templateParams: !2489, identifier: "_ZTSSt13tuple_elementILm0ESt5tupleIJPFvmEiEEE")
!2489 = !{!2490, !2491}
!2490 = !DITemplateValueParameter(name: "_Int", type: !213, value: i64 0)
!2491 = !DITemplateTypeParameter(name: "_Tp", type: !855)
!2492 = !{!2481}
!2493 = !{!2494, !852}
!2494 = !DITemplateValueParameter(name: "__i", type: !213, value: i64 0)
!2495 = !DILocation(line: 0, scope: !2482, inlinedAt: !2496)
!2496 = distinct !DILocation(line: 259, column: 27, scope: !2464, inlinedAt: !2480)
!2497 = !DILocalVariable(name: "__t", arg: 1, scope: !2498, file: !277, line: 1377, type: !815)
!2498 = distinct !DISubprogram(name: "__get_helper<0UL, void (*)(unsigned long), int>", linkageName: "_ZSt12__get_helperILm0EPFvmEJiEERT0_RSt11_Tuple_implIXT_EJS2_DpT1_EE", scope: !2, file: !277, line: 1377, type: !813, scopeLine: 1378, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !2500, retainedNodes: !2499)
!2499 = !{!2497}
!2500 = !{!2494, !807, !2501}
!2501 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Tail", value: !647)
!2502 = !DILocation(line: 0, scope: !2498, inlinedAt: !2503)
!2503 = distinct !DILocation(line: 1408, column: 43, scope: !2482, inlinedAt: !2496)
!2504 = !DILocalVariable(name: "__t", arg: 1, scope: !2505, file: !277, line: 268, type: !815)
!2505 = distinct !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_headERS2_", scope: !808, file: !277, line: 268, type: !813, scopeLine: 268, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, declaration: !812, retainedNodes: !2506)
!2506 = !{!2504}
!2507 = !DILocation(line: 0, scope: !2505, inlinedAt: !2508)
!2508 = distinct !DILocation(line: 1378, column: 14, scope: !2498, inlinedAt: !2503)
!2509 = !DILocation(line: 268, column: 66, scope: !2505, inlinedAt: !2508)
!2510 = !DILocation(line: 0, scope: !629, inlinedAt: !2511)
!2511 = distinct !DILocation(line: 259, column: 13, scope: !2464, inlinedAt: !2480)
!2512 = !DILocalVariable(name: "__f", arg: 2, scope: !2513, file: !628, line: 60, type: !636)
!2513 = distinct !DISubprogram(name: "__invoke_impl<void, void (*)(unsigned long), int>", linkageName: "_ZSt13__invoke_implIvPFvmEJiEET_St14__invoke_otherOT0_DpOT1_", scope: !2, file: !628, line: 60, type: !2514, scopeLine: 61, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !9, templateParams: !2519, retainedNodes: !2516)
!2514 = !DISubroutineType(types: !2515)
!2515 = !{null, !655, !636, !640}
!2516 = !{!2517, !2512, !2518}
!2517 = !DILocalVariable(arg: 1, scope: !2513, file: !628, line: 60, type: !655)
!2518 = !DILocalVariable(name: "__args", arg: 3, scope: !2513, file: !628, line: 60, type: !640)
!2519 = !{!2520, !2521, !646}
!2520 = !DITemplateTypeParameter(name: "_Res", type: null)
!2521 = !DITemplateTypeParameter(name: "_Fn", type: !637)
!2522 = !DILocation(line: 0, scope: !2513, inlinedAt: !2523)
!2523 = distinct !DILocation(line: 96, column: 14, scope: !629, inlinedAt: !2511)
!2524 = !DILocation(line: 61, column: 14, scope: !2513, inlinedAt: !2523)
!2525 = !DILocation(line: 61, column: 37, scope: !2513, inlinedAt: !2523)
!2526 = !DILocation(line: 211, column: 24, scope: !2453)
!2527 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_sequential.cpp", scope: !900, file: !900, type: !2528, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !9)
!2528 = !DISubroutineType(types: !132)
!2529 = !DILocation(line: 74, column: 25, scope: !2530, inlinedAt: !2532)
!2530 = !DILexicalBlockFile(scope: !2531, file: !3, discriminator: 0)
!2531 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !900, file: !900, type: !264, flags: DIFlagArtificial | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !9)
!2532 = distinct !DILocation(line: 0, scope: !2527)
!2533 = !DILocation(line: 0, scope: !2531, inlinedAt: !2532)
