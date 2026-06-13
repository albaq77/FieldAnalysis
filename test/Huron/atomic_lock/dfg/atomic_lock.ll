; ModuleID = '/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/Huron/atomic_lock/sequential.cpp'
source_filename = "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/Huron/atomic_lock/sequential.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_ostream" = type { ptr, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", ptr, i8, i8, ptr, ptr, ptr, ptr }
%"class.std::ios_base" = type { ptr, i64, i64, i32, i32, i32, ptr, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, ptr, %"class.std::locale" }
%"struct.std::ios_base::_Words" = type { ptr, i64 }
%"class.std::locale" = type { ptr }
%"struct.std::chrono::duration" = type { i64 }
%class.spinlock = type { %"struct.std::atomic_flag" }
%"struct.std::atomic_flag" = type { %"struct.std::__atomic_flag_base" }
%"struct.std::__atomic_flag_base" = type { i8 }
%"struct.std::chrono::duration.0" = type { i64 }
%struct.timespec = type { i64, i64 }
%"class.std::thread" = type { %"class.std::thread::id" }
%"class.std::thread::id" = type { i64 }
%"class.std::unique_ptr" = type { %"struct.std::__uniq_ptr_data" }
%"struct.std::__uniq_ptr_data" = type { %"class.std::__uniq_ptr_impl" }
%"class.std::__uniq_ptr_impl" = type { %"class.std::tuple" }
%"class.std::tuple" = type { %"struct.std::_Tuple_impl" }
%"struct.std::_Tuple_impl" = type { %"struct.std::_Head_base.2" }
%"struct.std::_Head_base.2" = type { ptr }
%"struct.std::thread::_State_impl" = type { %"struct.std::thread::_State", %"struct.std::thread::_Invoker" }
%"struct.std::thread::_State" = type { ptr }
%"struct.std::thread::_Invoker" = type { %"class.std::tuple.3" }
%"class.std::tuple.3" = type { %"struct.std::_Tuple_impl.4" }
%"struct.std::_Tuple_impl.4" = type { %"struct.std::_Tuple_impl.5", %"struct.std::_Head_base.7" }
%"struct.std::_Tuple_impl.5" = type { %"struct.std::_Head_base.6" }
%"struct.std::_Head_base.6" = type { i32 }
%"struct.std::_Head_base.7" = type { ptr }
%"struct.std::_Index_tuple" = type { i8 }
%"struct.std::__invoke_other" = type { i8 }

$_ZN8spinlock4lockEv = comdat any

$_ZNSt11this_thread9sleep_forIlSt5ratioILl1ELl1EEEEvRKNSt6chrono8durationIT_T0_EE = comdat any

$_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEC2IivEERKT_ = comdat any

$_ZN8spinlock6unlockEv = comdat any

$_ZNSt6threadC2Ev = comdat any

$_ZNSt6threadC2IRFvmEJiEvEEOT_DpOT0_ = comdat any

$_ZNSt6threadaSEOS_ = comdat any

$_ZNSt6threadD2Ev = comdat any

$_ZStanSt12memory_orderSt23__memory_order_modifier = comdat any

$__clang_call_terminate = comdat any

$_ZNSt6thread2idC2Ev = comdat any

$_ZNKSt6thread8joinableEv = comdat any

$_ZNSt6thread4swapERS_ = comdat any

$_ZSteqNSt6thread2idES0_ = comdat any

$_ZSt4swapINSt6thread2idEENSt9enable_ifIXsr6__and_ISt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SE_ = comdat any

$_ZNSt6chronoleIlSt5ratioILl1ELl1EElS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE = comdat any

$_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE4zeroEv = comdat any

$_ZNSt6chrono13duration_castINS_8durationIlSt5ratioILl1ELl1EEEElS3_EENSt9enable_ifIXsr13__is_durationIT_EE5valueES6_E4typeERKNS1_IT0_T1_EE = comdat any

$_ZNSt6chrono13duration_castINS_8durationIlSt5ratioILl1ELl1000000000EEEElS2_ILl1ELl1EEEENSt9enable_ifIXsr13__is_durationIT_EE5valueES7_E4typeERKNS1_IT0_T1_EE = comdat any

$_ZNSt6chronomiIlSt5ratioILl1ELl1EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_ = comdat any

$_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv = comdat any

$_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv = comdat any

$_ZNSt6chronoltIlSt5ratioILl1ELl1EElS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE = comdat any

$_ZNSt6chrono15duration_valuesIlE4zeroEv = comdat any

$_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEC2IlvEERKT_ = comdat any

$_ZNSt6chrono20__duration_cast_implINS_8durationIlSt5ratioILl1ELl1EEEES3_lLb1ELb1EE6__castIlS3_EES4_RKNS1_IT_T0_EE = comdat any

$_ZNSt6chrono20__duration_cast_implINS_8durationIlSt5ratioILl1ELl1000000000EEEES2_ILl1000000000ELl1EElLb0ELb1EE6__castIlS2_ILl1ELl1EEEES4_RKNS1_IT_T0_EE = comdat any

$_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEC2IlvEERKT_ = comdat any

$_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEC2IJRS3_iEEEDpOT_ = comdat any

$_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEC2IS3_vEEPS1_ = comdat any

$_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EED2Ev = comdat any

$_ZNSt6thread6_StateC2Ev = comdat any

$_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEEC2IJRS2_iEEEDpOT_ = comdat any

$_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEED2Ev = comdat any

$_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEED0Ev = comdat any

$_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEE6_M_runEv = comdat any

$_ZNSt5tupleIJPFvmEiEEC2IRS0_iTnNSt9enable_ifIXclsr4_TCCIXntcl14__is_alloc_argIT_EEEEE29__is_implicitly_constructibleIS6_T0_EEEbE4typeELb1EEEOS6_OS7_ = comdat any

$_ZNSt11_Tuple_implILm0EJPFvmEiEEC2IRS0_JiEvEEOT_DpOT0_ = comdat any

$_ZNSt11_Tuple_implILm1EJiEEC2IiEEOT_ = comdat any

$_ZNSt10_Head_baseILm0EPFvmELb0EEC2ERKS1_ = comdat any

$_ZNSt10_Head_baseILm1EiLb0EEC2IiEEOT_ = comdat any

$_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEEclEv = comdat any

$_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEE9_M_invokeIJLm0ELm1EEEEvSt12_Index_tupleIJXspT_EEE = comdat any

$_ZSt8__invokeIPFvmEJiEENSt15__invoke_resultIT_JDpT0_EE4typeEOS3_DpOS4_ = comdat any

$_ZSt3getILm0EJPFvmEiEEONSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeEOS6_ = comdat any

$_ZSt3getILm1EJPFvmEiEEONSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeEOS6_ = comdat any

$_ZSt13__invoke_implIvPFvmEJiEET_St14__invoke_otherOT0_DpOT1_ = comdat any

$_ZSt12__get_helperILm0EPFvmEJiEERT0_RSt11_Tuple_implIXT_EJS2_DpT1_EE = comdat any

$_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_headERS2_ = comdat any

$_ZNSt10_Head_baseILm0EPFvmELb0EE7_M_headERS2_ = comdat any

$_ZSt12__get_helperILm1EiJEERT0_RSt11_Tuple_implIXT_EJS0_DpT1_EE = comdat any

$_ZNSt11_Tuple_implILm1EJiEE7_M_headERS0_ = comdat any

$_ZNSt10_Head_baseILm1EiLb0EE7_M_headERS0_ = comdat any

$_ZNSt15__uniq_ptr_dataINSt6thread6_StateESt14default_deleteIS1_ELb1ELb1EECI2St15__uniq_ptr_implIS1_S3_EEPS1_ = comdat any

$_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EEC2EPS1_ = comdat any

$_ZNSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEEC2ILb1ETnNSt9enable_ifIXclsr17_TupleConstraintsIXT_ES2_S4_EE37__is_implicitly_default_constructibleEEbE4typeELb1EEEv = comdat any

$_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE6_M_ptrEv = comdat any

$_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEEC2Ev = comdat any

$_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEEC2Ev = comdat any

$_ZNSt10_Head_baseILm0EPNSt6thread6_StateELb0EEC2Ev = comdat any

$_ZNSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EEC2Ev = comdat any

$_ZSt3getILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERS9_ = comdat any

$_ZSt12__get_helperILm0EPNSt6thread6_StateEJSt14default_deleteIS1_EEERT0_RSt11_Tuple_implIXT_EJS5_DpT1_EE = comdat any

$_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_headERS5_ = comdat any

$_ZNSt10_Head_baseILm0EPNSt6thread6_StateELb0EE7_M_headERS3_ = comdat any

$_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE11get_deleterEv = comdat any

$_ZNKSt14default_deleteINSt6thread6_StateEEclEPS1_ = comdat any

$_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE10_M_deleterEv = comdat any

$_ZSt3getILm1EJPNSt6thread6_StateESt14default_deleteIS1_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERS9_ = comdat any

$_ZSt12__get_helperILm1ESt14default_deleteINSt6thread6_StateEEJEERT0_RSt11_Tuple_implIXT_EJS4_DpT1_EE = comdat any

$_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEE7_M_headERS4_ = comdat any

$_ZNSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EE7_M_headERS4_ = comdat any

$_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE = comdat any

$_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE = comdat any

$_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE = comdat any

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !0
@__dso_handle = external hidden global i8
@lock = dso_local global { { i8 } } zeroinitializer, align 1, !dbg !7
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@.str = private unnamed_addr constant [16 x i8] c"This is thread \00", align 1, !dbg !877
@.str.1 = private unnamed_addr constant [26 x i8] c"! Sleeping for 1 second.\0A\00", align 1, !dbg !885
@.str.2 = private unnamed_addr constant [8 x i8] c"Thread \00", align 1, !dbg !890
@.str.3 = private unnamed_addr constant [15 x i8] c" is quitting.\0A\00", align 1, !dbg !895
@_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE = linkonce_odr dso_local unnamed_addr constant { [5 x ptr] } { [5 x ptr] [ptr null, ptr @_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE, ptr @_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEED2Ev, ptr @_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEED0Ev, ptr @_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEE6_M_runEv] }, comdat, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global [0 x ptr]
@_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE = linkonce_odr dso_local constant [60 x i8] c"NSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE\00", comdat, align 1
@_ZTINSt6thread6_StateE = external constant ptr
@_ZTINSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE, ptr @_ZTINSt6thread6_StateE }, comdat, align 8
@_ZTVNSt6thread6_StateE = external unnamed_addr constant { [5 x ptr] }, align 8
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_I_sequential.cpp, ptr null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" !dbg !1789 {
  call void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit), !dbg !1790
  %1 = call i32 @__cxa_atexit(ptr @_ZNSt8ios_base4InitD1Ev, ptr @_ZStL8__ioinit, ptr @__dso_handle) #3, !dbg !1792
  ret void, !dbg !1790
}

declare void @_ZNSt8ios_base4InitC1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(ptr noundef nonnull align 1 dereferenceable(1)) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(ptr, ptr, ptr) #3

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @_Z12thread_printm(i64 noundef %0) #4 !dbg !1793 {
  %2 = alloca i64, align 8
  %3 = alloca %"struct.std::chrono::duration", align 8
  %4 = alloca i32, align 4
  store i64 %0, ptr %2, align 8
    #dbg_declare(ptr %2, !1796, !DIExpression(), !1797)
  call void @_ZN8spinlock4lockEv(ptr noundef nonnull align 1 dereferenceable(1) @lock), !dbg !1798
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str), !dbg !1799
  %6 = load i64, ptr %2, align 8, !dbg !1800
  %7 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEm(ptr noundef nonnull align 8 dereferenceable(8) %5, i64 noundef %6), !dbg !1801
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef @.str.1), !dbg !1802
  store i32 1, ptr %4, align 4, !dbg !1803
  call void @_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEC2IivEERKT_(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 4 dereferenceable(4) %4), !dbg !1804
  call void @_ZNSt11this_thread9sleep_forIlSt5ratioILl1ELl1EEEEvRKNSt6chrono8durationIT_T0_EE(ptr noundef nonnull align 8 dereferenceable(8) %3), !dbg !1805
  %9 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, ptr noundef @.str.2), !dbg !1806
  %10 = load i64, ptr %2, align 8, !dbg !1807
  %11 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEm(ptr noundef nonnull align 8 dereferenceable(8) %9, i64 noundef %10), !dbg !1808
  %12 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8) %11, ptr noundef @.str.3), !dbg !1809
  call void @_ZN8spinlock6unlockEv(ptr noundef nonnull align 1 dereferenceable(1) @lock), !dbg !1810
  ret void, !dbg !1811
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN8spinlock4lockEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 !dbg !1812 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1813, !DIExpression(), !1815)
  %5 = load ptr, ptr %4, align 8
  br label %6, !dbg !1816

6:                                                ; preds = %23, %1
  %7 = getelementptr inbounds %class.spinlock, ptr %5, i32 0, i32 0, !dbg !1817
  store ptr %7, ptr %2, align 8
    #dbg_declare(ptr %2, !1818, !DIExpression(), !1821)
  store i32 2, ptr %3, align 4
    #dbg_declare(ptr %3, !1823, !DIExpression(), !1824)
  %8 = load ptr, ptr %2, align 8
  %9 = load i32, ptr %3, align 4, !dbg !1825
  switch i32 %9, label %10 [
    i32 5, label %18
    i32 1, label %12
    i32 2, label %12
    i32 3, label %14
    i32 4, label %16
  ], !dbg !1826

10:                                               ; preds = %6
  %11 = atomicrmw xchg ptr %8, i8 1 monotonic, align 1, !dbg !1826
  br label %20, !dbg !1826

12:                                               ; preds = %6, %6
  %13 = atomicrmw xchg ptr %8, i8 1 acquire, align 1, !dbg !1826
  br label %20, !dbg !1826

14:                                               ; preds = %6
  %15 = atomicrmw xchg ptr %8, i8 1 release, align 1, !dbg !1826
  br label %20, !dbg !1826

16:                                               ; preds = %6
  %17 = atomicrmw xchg ptr %8, i8 1 acq_rel, align 1, !dbg !1826
  br label %20, !dbg !1826

18:                                               ; preds = %6
  %19 = atomicrmw xchg ptr %8, i8 1 seq_cst, align 1, !dbg !1826
  br label %20, !dbg !1826

20:                                               ; preds = %10, %12, %14, %16, %18
  %21 = phi i8 [ %11, %10 ], [ %13, %12 ], [ %15, %14 ], [ %17, %16 ], [ %19, %18 ], !dbg !1826
  %22 = icmp ne i8 %21, 0, !dbg !1826
  br i1 %22, label %23, label %24, !dbg !1816

23:                                               ; preds = %20
  br label %6, !dbg !1816, !llvm.loop !1827

24:                                               ; preds = %20
  ret void, !dbg !1830
}

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef) #1

declare noundef nonnull align 8 dereferenceable(8) ptr @_ZNSolsEm(ptr noundef nonnull align 8 dereferenceable(8), i64 noundef) #1

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt11this_thread9sleep_forIlSt5ratioILl1ELl1EEEEvRKNSt6chrono8durationIT_T0_EE(ptr noundef nonnull align 8 dereferenceable(8) %0) #4 comdat !dbg !1831 {
  %2 = alloca ptr, align 8
  %3 = alloca %"struct.std::chrono::duration", align 8
  %4 = alloca %"struct.std::chrono::duration", align 8
  %5 = alloca %"struct.std::chrono::duration.0", align 8
  %6 = alloca %"struct.std::chrono::duration", align 8
  %7 = alloca %struct.timespec, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !1838, !DIExpression(), !1839)
  %8 = load ptr, ptr %2, align 8, !dbg !1840
  %9 = load ptr, ptr %2, align 8, !dbg !1842
  %10 = call i64 @_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE4zeroEv() #3, !dbg !1842
  %11 = getelementptr inbounds %"struct.std::chrono::duration", ptr %3, i32 0, i32 0, !dbg !1842
  store i64 %10, ptr %11, align 8, !dbg !1842
  %12 = call noundef zeroext i1 @_ZNSt6chronoleIlSt5ratioILl1ELl1EElS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef nonnull align 8 dereferenceable(8) %3), !dbg !1843
  br i1 %12, label %13, label %14, !dbg !1844

13:                                               ; preds = %1
  br label %37, !dbg !1845

14:                                               ; preds = %1
    #dbg_declare(ptr %4, !1846, !DIExpression(), !1853)
  %15 = load ptr, ptr %2, align 8, !dbg !1854
  %16 = call i64 @_ZNSt6chrono13duration_castINS_8durationIlSt5ratioILl1ELl1EEEElS3_EENSt9enable_ifIXsr13__is_durationIT_EE5valueES6_E4typeERKNS1_IT0_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %15), !dbg !1855
  %17 = getelementptr inbounds %"struct.std::chrono::duration", ptr %4, i32 0, i32 0, !dbg !1855
  store i64 %16, ptr %17, align 8, !dbg !1855
    #dbg_declare(ptr %5, !1856, !DIExpression(), !1862)
  %18 = load ptr, ptr %2, align 8, !dbg !1863
  %19 = call i64 @_ZNSt6chronomiIlSt5ratioILl1ELl1EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_(ptr noundef nonnull align 8 dereferenceable(8) %18, ptr noundef nonnull align 8 dereferenceable(8) %4), !dbg !1864
  %20 = getelementptr inbounds %"struct.std::chrono::duration", ptr %6, i32 0, i32 0, !dbg !1864
  store i64 %19, ptr %20, align 8, !dbg !1864
  %21 = call i64 @_ZNSt6chrono13duration_castINS_8durationIlSt5ratioILl1ELl1000000000EEEElS2_ILl1ELl1EEEENSt9enable_ifIXsr13__is_durationIT_EE5valueES7_E4typeERKNS1_IT0_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %6), !dbg !1865
  %22 = getelementptr inbounds %"struct.std::chrono::duration.0", ptr %5, i32 0, i32 0, !dbg !1865
  store i64 %21, ptr %22, align 8, !dbg !1865
    #dbg_declare(ptr %7, !1866, !DIExpression(), !1873)
  %23 = getelementptr inbounds %struct.timespec, ptr %7, i32 0, i32 0, !dbg !1874
  %24 = call noundef i64 @_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv(ptr noundef nonnull align 8 dereferenceable(8) %4), !dbg !1875
  store i64 %24, ptr %23, align 8, !dbg !1874
  %25 = getelementptr inbounds %struct.timespec, ptr %7, i32 0, i32 1, !dbg !1874
  %26 = call noundef i64 @_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv(ptr noundef nonnull align 8 dereferenceable(8) %5), !dbg !1876
  store i64 %26, ptr %25, align 8, !dbg !1874
  br label %27, !dbg !1877

27:                                               ; preds = %36, %14
  %28 = call i32 @nanosleep(ptr noundef %7, ptr noundef %7), !dbg !1878
  %29 = icmp eq i32 %28, -1, !dbg !1879
  br i1 %29, label %30, label %34, !dbg !1880

30:                                               ; preds = %27
  %31 = call ptr @__errno_location() #12, !dbg !1881
  %32 = load i32, ptr %31, align 4, !dbg !1881
  %33 = icmp eq i32 %32, 4, !dbg !1882
  br label %34

34:                                               ; preds = %30, %27
  %35 = phi i1 [ false, %27 ], [ %33, %30 ], !dbg !1883
  br i1 %35, label %36, label %37, !dbg !1877

36:                                               ; preds = %34
  br label %27, !dbg !1877, !llvm.loop !1884

37:                                               ; preds = %13, %34
  ret void, !dbg !1886
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEC2IivEERKT_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) unnamed_addr #5 comdat align 2 !dbg !1887 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1894, !DIExpression(), !1896)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1897, !DIExpression(), !1898)
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"struct.std::chrono::duration", ptr %5, i32 0, i32 0, !dbg !1899
  %7 = load ptr, ptr %4, align 8, !dbg !1900
  %8 = load i32, ptr %7, align 4, !dbg !1900
  %9 = sext i32 %8 to i64, !dbg !1900
  store i64 %9, ptr %6, align 8, !dbg !1899
  ret void, !dbg !1901
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZN8spinlock6unlockEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !1902 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !1903, !DIExpression(), !1904)
  %6 = load ptr, ptr %5, align 8
  %7 = getelementptr inbounds %class.spinlock, ptr %6, i32 0, i32 0, !dbg !1905
  store ptr %7, ptr %2, align 8
    #dbg_declare(ptr %2, !1906, !DIExpression(), !1908)
  store i32 3, ptr %3, align 4
    #dbg_declare(ptr %3, !1910, !DIExpression(), !1911)
  %8 = load ptr, ptr %2, align 8
    #dbg_declare(ptr %4, !1912, !DIExpression(), !1913)
  %9 = load i32, ptr %3, align 4, !dbg !1914
  %10 = invoke noundef i32 @_ZStanSt12memory_orderSt23__memory_order_modifier(i32 noundef %9, i32 noundef 65535)
          to label %11 unwind label %16, !dbg !1915

11:                                               ; preds = %1
  store i32 %10, ptr %4, align 4, !dbg !1913
  %12 = load i32, ptr %3, align 4, !dbg !1916
  switch i32 %12, label %13 [
    i32 5, label %15
    i32 3, label %14
  ], !dbg !1917

13:                                               ; preds = %11
  store atomic i8 0, ptr %8 monotonic, align 1, !dbg !1917
  br label %19, !dbg !1917

14:                                               ; preds = %11
  store atomic i8 0, ptr %8 release, align 1, !dbg !1917
  br label %19, !dbg !1917

15:                                               ; preds = %11
  store atomic i8 0, ptr %8 seq_cst, align 1, !dbg !1917
  br label %19, !dbg !1917

16:                                               ; preds = %1
  %17 = landingpad { ptr, i32 }
          catch ptr null, !dbg !1915
  %18 = extractvalue { ptr, i32 } %17, 0, !dbg !1915
  call void @__clang_call_terminate(ptr %18) #13, !dbg !1915
  unreachable, !dbg !1915

19:                                               ; preds = %13, %14, %15
  ret void, !dbg !1918
}

; Function Attrs: mustprogress noinline norecurse optnone uwtable
define dso_local noundef i32 @main() #6 personality ptr @__gxx_personality_v0 !dbg !1919 {
  %1 = alloca i32, align 4
  %2 = alloca [2 x %"class.std::thread"], align 16
  %3 = alloca %"class.std::thread", align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca %"class.std::thread", align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !1920, !DIExpression(), !1924)
  %13 = getelementptr inbounds [2 x %"class.std::thread"], ptr %2, i32 0, i32 0, !dbg !1924
  %14 = getelementptr inbounds %"class.std::thread", ptr %13, i64 2, !dbg !1924
  br label %15, !dbg !1924

15:                                               ; preds = %15, %0
  %16 = phi ptr [ %13, %0 ], [ %17, %15 ], !dbg !1924
  call void @_ZNSt6threadC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %16) #3, !dbg !1924
  %17 = getelementptr inbounds %"class.std::thread", ptr %16, i64 1, !dbg !1924
  %18 = icmp eq ptr %17, %14, !dbg !1924
  br i1 %18, label %19, label %15, !dbg !1924

19:                                               ; preds = %15
  store i32 0, ptr %4, align 4, !dbg !1925
  invoke void @_ZNSt6threadC2IRFvmEJiEvEEOT_DpOT0_(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull @_Z12thread_printm, ptr noundef nonnull align 4 dereferenceable(4) %4)
          to label %20 unwind label %42, !dbg !1926

20:                                               ; preds = %19
  %21 = getelementptr inbounds [2 x %"class.std::thread"], ptr %2, i64 0, i64 0, !dbg !1927
  %22 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt6threadaSEOS_(ptr noundef nonnull align 8 dereferenceable(8) %21, ptr noundef nonnull align 8 dereferenceable(8) %3) #3, !dbg !1928
  call void @_ZNSt6threadD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #3, !dbg !1927
  store i32 1, ptr %8, align 4, !dbg !1929
  invoke void @_ZNSt6threadC2IRFvmEJiEvEEOT_DpOT0_(ptr noundef nonnull align 8 dereferenceable(8) %7, ptr noundef nonnull @_Z12thread_printm, ptr noundef nonnull align 4 dereferenceable(4) %8)
          to label %23 unwind label %42, !dbg !1930

23:                                               ; preds = %20
  %24 = getelementptr inbounds [2 x %"class.std::thread"], ptr %2, i64 0, i64 1, !dbg !1931
  %25 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt6threadaSEOS_(ptr noundef nonnull align 8 dereferenceable(8) %24, ptr noundef nonnull align 8 dereferenceable(8) %7) #3, !dbg !1932
  call void @_ZNSt6threadD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %7) #3, !dbg !1931
    #dbg_declare(ptr %9, !1933, !DIExpression(), !1936)
  store ptr %2, ptr %9, align 8, !dbg !1937
    #dbg_declare(ptr %10, !1938, !DIExpression(), !1936)
  %26 = load ptr, ptr %9, align 8, !dbg !1940
  %27 = getelementptr inbounds [2 x %"class.std::thread"], ptr %26, i64 0, i64 0, !dbg !1940
  store ptr %27, ptr %10, align 8, !dbg !1940
    #dbg_declare(ptr %11, !1941, !DIExpression(), !1936)
  %28 = load ptr, ptr %9, align 8, !dbg !1940
  %29 = getelementptr inbounds [2 x %"class.std::thread"], ptr %28, i64 0, i64 0, !dbg !1940
  %30 = getelementptr inbounds %"class.std::thread", ptr %29, i64 2, !dbg !1940
  store ptr %30, ptr %11, align 8, !dbg !1940
  br label %31, !dbg !1940

31:                                               ; preds = %39, %23
  %32 = load ptr, ptr %10, align 8, !dbg !1940
  %33 = load ptr, ptr %11, align 8, !dbg !1940
  %34 = icmp ne ptr %32, %33, !dbg !1940
  br i1 %34, label %35, label %48, !dbg !1940

35:                                               ; preds = %31
    #dbg_declare(ptr %12, !1942, !DIExpression(), !1944)
  %36 = load ptr, ptr %10, align 8, !dbg !1945
  store ptr %36, ptr %12, align 8, !dbg !1944
  %37 = load ptr, ptr %12, align 8, !dbg !1946
  invoke void @_ZNSt6thread4joinEv(ptr noundef nonnull align 8 dereferenceable(8) %37)
          to label %38 unwind label %42, !dbg !1947

38:                                               ; preds = %35
  br label %39, !dbg !1948

39:                                               ; preds = %38
  %40 = load ptr, ptr %10, align 8, !dbg !1940
  %41 = getelementptr inbounds %"class.std::thread", ptr %40, i32 1, !dbg !1940
  store ptr %41, ptr %10, align 8, !dbg !1940
  br label %31, !dbg !1940, !llvm.loop !1949

42:                                               ; preds = %35, %20, %19
  %43 = landingpad { ptr, i32 }
          cleanup, !dbg !1951
  %44 = extractvalue { ptr, i32 } %43, 0, !dbg !1951
  store ptr %44, ptr %5, align 8, !dbg !1951
  %45 = extractvalue { ptr, i32 } %43, 1, !dbg !1951
  store i32 %45, ptr %6, align 4, !dbg !1951
  %46 = getelementptr inbounds [2 x %"class.std::thread"], ptr %2, i32 0, i32 0, !dbg !1951
  %47 = getelementptr inbounds %"class.std::thread", ptr %46, i64 2, !dbg !1951
  br label %57, !dbg !1951

48:                                               ; preds = %31
  store i32 0, ptr %1, align 4, !dbg !1952
  %49 = getelementptr inbounds [2 x %"class.std::thread"], ptr %2, i32 0, i32 0, !dbg !1951
  %50 = getelementptr inbounds %"class.std::thread", ptr %49, i64 2, !dbg !1951
  br label %51, !dbg !1951

51:                                               ; preds = %51, %48
  %52 = phi ptr [ %50, %48 ], [ %53, %51 ], !dbg !1951
  %53 = getelementptr inbounds %"class.std::thread", ptr %52, i64 -1, !dbg !1951
  call void @_ZNSt6threadD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %53) #3, !dbg !1951
  %54 = icmp eq ptr %53, %49, !dbg !1951
  br i1 %54, label %55, label %51, !dbg !1951

55:                                               ; preds = %51
  %56 = load i32, ptr %1, align 4, !dbg !1951
  ret i32 %56, !dbg !1951

57:                                               ; preds = %57, %42
  %58 = phi ptr [ %47, %42 ], [ %59, %57 ], !dbg !1951
  %59 = getelementptr inbounds %"class.std::thread", ptr %58, i64 -1, !dbg !1951
  call void @_ZNSt6threadD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %59) #3, !dbg !1951
  %60 = icmp eq ptr %59, %46, !dbg !1951
  br i1 %60, label %61, label %57, !dbg !1951

61:                                               ; preds = %57
  br label %62, !dbg !1951

62:                                               ; preds = %61
  %63 = load ptr, ptr %5, align 8, !dbg !1951
  %64 = load i32, ptr %6, align 4, !dbg !1951
  %65 = insertvalue { ptr, i32 } poison, ptr %63, 0, !dbg !1951
  %66 = insertvalue { ptr, i32 } %65, i32 %64, 1, !dbg !1951
  resume { ptr, i32 } %66, !dbg !1951
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt6threadC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #5 comdat align 2 !dbg !1953 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !1954, !DIExpression(), !1955)
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::thread", ptr %3, i32 0, i32 0, !dbg !1956
  call void @_ZNSt6thread2idC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %4) #3, !dbg !1956
  ret void, !dbg !1957
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt6threadC2IRFvmEJiEvEEOT_DpOT0_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull %1, ptr noundef nonnull align 4 dereferenceable(4) %2) unnamed_addr #4 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !1958 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %"class.std::unique_ptr", align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !1965, !DIExpression(), !1966)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !1967, !DIExpression(), !1968)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !1969, !DIExpression(), !1970)
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %"class.std::thread", ptr %11, i32 0, i32 0, !dbg !1971
  call void @_ZNSt6thread2idC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %12) #3, !dbg !1971
    #dbg_declare(ptr %7, !1972, !DIExpression(), !1974)
  store ptr null, ptr %7, align 8, !dbg !1974
  %13 = call noalias noundef nonnull ptr @_Znwm(i64 noundef 24) #14, !dbg !1975, !heapallocsite !1976
  %14 = load ptr, ptr %5, align 8, !dbg !1986
  %15 = load ptr, ptr %6, align 8, !dbg !1987
  invoke void @_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEC2IJRS3_iEEEDpOT_(ptr noundef nonnull align 8 dereferenceable(24) %13, ptr noundef nonnull %14, ptr noundef nonnull align 4 dereferenceable(4) %15)
          to label %16 unwind label %18, !dbg !1988

16:                                               ; preds = %3
  call void @_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEC2IS3_vEEPS1_(ptr noundef nonnull align 8 dereferenceable(8) %8, ptr noundef %13) #3, !dbg !1989
  invoke void @_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE(ptr noundef nonnull align 8 dereferenceable(8) %11, ptr noundef %8, ptr noundef null)
          to label %17 unwind label %22, !dbg !1990

17:                                               ; preds = %16
  call void @_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EED2Ev(ptr noundef nonnull align 8 dereferenceable(8) %8) #3, !dbg !1990
  ret void, !dbg !1991

18:                                               ; preds = %3
  %19 = landingpad { ptr, i32 }
          cleanup, !dbg !1992
  %20 = extractvalue { ptr, i32 } %19, 0, !dbg !1992
  store ptr %20, ptr %9, align 8, !dbg !1992
  %21 = extractvalue { ptr, i32 } %19, 1, !dbg !1992
  store i32 %21, ptr %10, align 4, !dbg !1992
  call void @_ZdlPv(ptr noundef %13) #15, !dbg !1975
  br label %26, !dbg !1975

22:                                               ; preds = %16
  %23 = landingpad { ptr, i32 }
          cleanup, !dbg !1992
  %24 = extractvalue { ptr, i32 } %23, 0, !dbg !1992
  store ptr %24, ptr %9, align 8, !dbg !1992
  %25 = extractvalue { ptr, i32 } %23, 1, !dbg !1992
  store i32 %25, ptr %10, align 4, !dbg !1992
  call void @_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EED2Ev(ptr noundef nonnull align 8 dereferenceable(8) %8) #3, !dbg !1990
  br label %26, !dbg !1990

26:                                               ; preds = %22, %18
  %27 = load ptr, ptr %9, align 8, !dbg !1975
  %28 = load i32, ptr %10, align 4, !dbg !1975
  %29 = insertvalue { ptr, i32 } poison, ptr %27, 0, !dbg !1975
  %30 = insertvalue { ptr, i32 } %29, i32 %28, 1, !dbg !1975
  resume { ptr, i32 } %30, !dbg !1975
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt6threadaSEOS_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #5 comdat align 2 !dbg !1993 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !1994, !DIExpression(), !1995)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !1996, !DIExpression(), !1997)
  %5 = load ptr, ptr %3, align 8
  %6 = call noundef zeroext i1 @_ZNKSt6thread8joinableEv(ptr noundef nonnull align 8 dereferenceable(8) %5) #3, !dbg !1998
  br i1 %6, label %7, label %8, !dbg !2000

7:                                                ; preds = %2
  call void @_ZSt9terminatev() #13, !dbg !2001
  unreachable, !dbg !2001

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8, !dbg !2002
  call void @_ZNSt6thread4swapERS_(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(8) %9) #3, !dbg !2003
  ret ptr %5, !dbg !2004
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt6threadD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #5 comdat align 2 !dbg !2005 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2006, !DIExpression(), !2007)
  %3 = load ptr, ptr %2, align 8
  %4 = call noundef zeroext i1 @_ZNKSt6thread8joinableEv(ptr noundef nonnull align 8 dereferenceable(8) %3) #3, !dbg !2008
  br i1 %4, label %5, label %6, !dbg !2011

5:                                                ; preds = %1
  call void @_ZSt9terminatev() #13, !dbg !2012
  unreachable, !dbg !2012

6:                                                ; preds = %1
  ret void, !dbg !2013
}

declare void @_ZNSt6thread4joinEv(ptr noundef nonnull align 8 dereferenceable(8)) #1

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i32 @_ZStanSt12memory_orderSt23__memory_order_modifier(i32 noundef %0, i32 noundef %1) #5 comdat !dbg !2014 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
    #dbg_declare(ptr %3, !2017, !DIExpression(), !2018)
  store i32 %1, ptr %4, align 4
    #dbg_declare(ptr %4, !2019, !DIExpression(), !2020)
  %5 = load i32, ptr %3, align 4, !dbg !2021
  %6 = load i32, ptr %4, align 4, !dbg !2022
  %7 = and i32 %5, %6, !dbg !2023
  ret i32 %7, !dbg !2024
}

; Function Attrs: noinline noreturn nounwind uwtable
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) #7 comdat {
  %2 = call ptr @__cxa_begin_catch(ptr %0) #3
  call void @_ZSt9terminatev() #13
  unreachable
}

declare ptr @__cxa_begin_catch(ptr)

declare void @_ZSt9terminatev()

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt6thread2idC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #5 comdat align 2 !dbg !2025 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2026, !DIExpression(), !2028)
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::thread::id", ptr %3, i32 0, i32 0, !dbg !2029
  store i64 0, ptr %4, align 8, !dbg !2029
  ret void, !dbg !2030
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef zeroext i1 @_ZNKSt6thread8joinableEv(ptr noundef nonnull align 8 dereferenceable(8) %0) #5 comdat align 2 !dbg !2031 {
  %2 = alloca ptr, align 8
  %3 = alloca %"class.std::thread::id", align 8
  %4 = alloca %"class.std::thread::id", align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2032, !DIExpression(), !2034)
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %"class.std::thread", ptr %5, i32 0, i32 0, !dbg !2035
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %3, ptr align 8 %6, i64 8, i1 false), !dbg !2035
  call void @_ZNSt6thread2idC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %4) #3, !dbg !2036
  %7 = getelementptr inbounds %"class.std::thread::id", ptr %3, i32 0, i32 0, !dbg !2037
  %8 = load i64, ptr %7, align 8, !dbg !2037
  %9 = getelementptr inbounds %"class.std::thread::id", ptr %4, i32 0, i32 0, !dbg !2037
  %10 = load i64, ptr %9, align 8, !dbg !2037
  %11 = call noundef zeroext i1 @_ZSteqNSt6thread2idES0_(i64 %8, i64 %10) #3, !dbg !2037
  %12 = xor i1 %11, true, !dbg !2038
  ret i1 %12, !dbg !2039
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt6thread4swapERS_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #5 comdat align 2 !dbg !2040 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2041, !DIExpression(), !2042)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2043, !DIExpression(), !2044)
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::thread", ptr %5, i32 0, i32 0, !dbg !2045
  %7 = load ptr, ptr %4, align 8, !dbg !2046
  %8 = getelementptr inbounds %"class.std::thread", ptr %7, i32 0, i32 0, !dbg !2047
  call void @_ZSt4swapINSt6thread2idEENSt9enable_ifIXsr6__and_ISt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SE_(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 8 dereferenceable(8) %8) #3, !dbg !2048
  ret void, !dbg !2049
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef zeroext i1 @_ZSteqNSt6thread2idES0_(i64 %0, i64 %1) #5 comdat !dbg !2050 {
  %3 = alloca %"class.std::thread::id", align 8
  %4 = alloca %"class.std::thread::id", align 8
  %5 = getelementptr inbounds %"class.std::thread::id", ptr %3, i32 0, i32 0
  store i64 %0, ptr %5, align 8
  %6 = getelementptr inbounds %"class.std::thread::id", ptr %4, i32 0, i32 0
  store i64 %1, ptr %6, align 8
    #dbg_declare(ptr %3, !2053, !DIExpression(), !2054)
    #dbg_declare(ptr %4, !2055, !DIExpression(), !2056)
  %7 = getelementptr inbounds %"class.std::thread::id", ptr %3, i32 0, i32 0, !dbg !2057
  %8 = load i64, ptr %7, align 8, !dbg !2057
  %9 = getelementptr inbounds %"class.std::thread::id", ptr %4, i32 0, i32 0, !dbg !2058
  %10 = load i64, ptr %9, align 8, !dbg !2058
  %11 = icmp eq i64 %8, %10, !dbg !2059
  ret i1 %11, !dbg !2060
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #8

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZSt4swapINSt6thread2idEENSt9enable_ifIXsr6__and_ISt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SE_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #5 comdat !dbg !2061 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"class.std::thread::id", align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2072, !DIExpression(), !2073)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2074, !DIExpression(), !2075)
    #dbg_declare(ptr %5, !2076, !DIExpression(), !2077)
  %6 = load ptr, ptr %3, align 8, !dbg !2078
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %6, i64 8, i1 false), !dbg !2078
  %7 = load ptr, ptr %4, align 8, !dbg !2079
  %8 = load ptr, ptr %3, align 8, !dbg !2080
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %7, i64 8, i1 false), !dbg !2081
  %9 = load ptr, ptr %4, align 8, !dbg !2082
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %5, i64 8, i1 false), !dbg !2083
  ret void, !dbg !2084
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef zeroext i1 @_ZNSt6chronoleIlSt5ratioILl1ELl1EElS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #4 comdat !dbg !2085 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2086, !DIExpression(), !2087)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2088, !DIExpression(), !2089)
  %5 = load ptr, ptr %4, align 8, !dbg !2090
  %6 = load ptr, ptr %3, align 8, !dbg !2091
  %7 = call noundef zeroext i1 @_ZNSt6chronoltIlSt5ratioILl1ELl1EElS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(8) %6), !dbg !2092
  %8 = xor i1 %7, true, !dbg !2093
  ret i1 %8, !dbg !2094
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local i64 @_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE4zeroEv() #5 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !2095 {
  %1 = alloca %"struct.std::chrono::duration", align 8
  %2 = alloca i64, align 8
  %3 = call noundef i64 @_ZNSt6chrono15duration_valuesIlE4zeroEv() #3, !dbg !2096
  store i64 %3, ptr %2, align 8, !dbg !2096
  invoke void @_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEC2IlvEERKT_(ptr noundef nonnull align 8 dereferenceable(8) %1, ptr noundef nonnull align 8 dereferenceable(8) %2)
          to label %4 unwind label %7, !dbg !2097

4:                                                ; preds = %0
  %5 = getelementptr inbounds %"struct.std::chrono::duration", ptr %1, i32 0, i32 0, !dbg !2098
  %6 = load i64, ptr %5, align 8, !dbg !2098
  ret i64 %6, !dbg !2098

7:                                                ; preds = %0
  %8 = landingpad { ptr, i32 }
          catch ptr null, !dbg !2097
  %9 = extractvalue { ptr, i32 } %8, 0, !dbg !2097
  call void @__clang_call_terminate(ptr %9) #13, !dbg !2097
  unreachable, !dbg !2097
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNSt6chrono13duration_castINS_8durationIlSt5ratioILl1ELl1EEEElS3_EENSt9enable_ifIXsr13__is_durationIT_EE5valueES6_E4typeERKNS1_IT0_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %0) #4 comdat !dbg !2099 {
  %2 = alloca %"struct.std::chrono::duration", align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2104, !DIExpression(), !2105)
  %4 = load ptr, ptr %3, align 8, !dbg !2106
  %5 = call i64 @_ZNSt6chrono20__duration_cast_implINS_8durationIlSt5ratioILl1ELl1EEEES3_lLb1ELb1EE6__castIlS3_EES4_RKNS1_IT_T0_EE(ptr noundef nonnull align 8 dereferenceable(8) %4), !dbg !2107
  %6 = getelementptr inbounds %"struct.std::chrono::duration", ptr %2, i32 0, i32 0, !dbg !2107
  store i64 %5, ptr %6, align 8, !dbg !2107
  %7 = getelementptr inbounds %"struct.std::chrono::duration", ptr %2, i32 0, i32 0, !dbg !2108
  %8 = load i64, ptr %7, align 8, !dbg !2108
  ret i64 %8, !dbg !2108
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNSt6chrono13duration_castINS_8durationIlSt5ratioILl1ELl1000000000EEEElS2_ILl1ELl1EEEENSt9enable_ifIXsr13__is_durationIT_EE5valueES7_E4typeERKNS1_IT0_T1_EE(ptr noundef nonnull align 8 dereferenceable(8) %0) #4 comdat !dbg !2109 {
  %2 = alloca %"struct.std::chrono::duration.0", align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2114, !DIExpression(), !2115)
  %4 = load ptr, ptr %3, align 8, !dbg !2116
  %5 = call i64 @_ZNSt6chrono20__duration_cast_implINS_8durationIlSt5ratioILl1ELl1000000000EEEES2_ILl1000000000ELl1EElLb0ELb1EE6__castIlS2_ILl1ELl1EEEES4_RKNS1_IT_T0_EE(ptr noundef nonnull align 8 dereferenceable(8) %4), !dbg !2117
  %6 = getelementptr inbounds %"struct.std::chrono::duration.0", ptr %2, i32 0, i32 0, !dbg !2117
  store i64 %5, ptr %6, align 8, !dbg !2117
  %7 = getelementptr inbounds %"struct.std::chrono::duration.0", ptr %2, i32 0, i32 0, !dbg !2118
  %8 = load i64, ptr %7, align 8, !dbg !2118
  ret i64 %8, !dbg !2118
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNSt6chronomiIlSt5ratioILl1ELl1EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #4 comdat !dbg !178 {
  %3 = alloca %"struct.std::chrono::duration", align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca %"struct.std::chrono::duration", align 8
  %8 = alloca %"struct.std::chrono::duration", align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2119, !DIExpression(), !2120)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2121, !DIExpression(), !2122)
  %9 = load ptr, ptr %4, align 8, !dbg !2123
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %9, i64 8, i1 false), !dbg !2124
  %10 = call noundef i64 @_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv(ptr noundef nonnull align 8 dereferenceable(8) %7), !dbg !2125
  %11 = load ptr, ptr %5, align 8, !dbg !2126
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %11, i64 8, i1 false), !dbg !2127
  %12 = call noundef i64 @_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv(ptr noundef nonnull align 8 dereferenceable(8) %8), !dbg !2128
  %13 = sub nsw i64 %10, %12, !dbg !2129
  store i64 %13, ptr %6, align 8, !dbg !2124
  call void @_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEC2IlvEERKT_(ptr noundef nonnull align 8 dereferenceable(8) %3, ptr noundef nonnull align 8 dereferenceable(8) %6), !dbg !2130
  %14 = getelementptr inbounds %"struct.std::chrono::duration", ptr %3, i32 0, i32 0, !dbg !2131
  %15 = load i64, ptr %14, align 8, !dbg !2131
  ret i64 %15, !dbg !2131
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i64 @_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv(ptr noundef nonnull align 8 dereferenceable(8) %0) #5 comdat align 2 !dbg !2132 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2133, !DIExpression(), !2135)
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::chrono::duration", ptr %3, i32 0, i32 0, !dbg !2136
  %5 = load i64, ptr %4, align 8, !dbg !2136
  ret i64 %5, !dbg !2137
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i64 @_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv(ptr noundef nonnull align 8 dereferenceable(8) %0) #5 comdat align 2 !dbg !2138 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2139, !DIExpression(), !2141)
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::chrono::duration.0", ptr %3, i32 0, i32 0, !dbg !2142
  %5 = load i64, ptr %4, align 8, !dbg !2142
  ret i64 %5, !dbg !2143
}

declare i32 @nanosleep(ptr noundef, ptr noundef) #1

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__errno_location() #9

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local noundef zeroext i1 @_ZNSt6chronoltIlSt5ratioILl1ELl1EElS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) #4 comdat !dbg !105 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::chrono::duration", align 8
  %6 = alloca %"struct.std::chrono::duration", align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2144, !DIExpression(), !2145)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2146, !DIExpression(), !2147)
  %7 = load ptr, ptr %3, align 8, !dbg !2148
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %5, ptr align 8 %7, i64 8, i1 false), !dbg !2149
  %8 = call noundef i64 @_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv(ptr noundef nonnull align 8 dereferenceable(8) %5), !dbg !2150
  %9 = load ptr, ptr %4, align 8, !dbg !2151
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %9, i64 8, i1 false), !dbg !2152
  %10 = call noundef i64 @_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv(ptr noundef nonnull align 8 dereferenceable(8) %6), !dbg !2153
  %11 = icmp slt i64 %8, %10, !dbg !2154
  ret i1 %11, !dbg !2155
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef i64 @_ZNSt6chrono15duration_valuesIlE4zeroEv() #5 comdat align 2 !dbg !2156 {
  ret i64 0, !dbg !2165
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEC2IlvEERKT_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #5 comdat align 2 !dbg !2166 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2173, !DIExpression(), !2174)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2175, !DIExpression(), !2176)
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"struct.std::chrono::duration", ptr %5, i32 0, i32 0, !dbg !2177
  %7 = load ptr, ptr %4, align 8, !dbg !2178
  %8 = load i64, ptr %7, align 8, !dbg !2178
  store i64 %8, ptr %6, align 8, !dbg !2177
  ret void, !dbg !2179
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNSt6chrono20__duration_cast_implINS_8durationIlSt5ratioILl1ELl1EEEES3_lLb1ELb1EE6__castIlS3_EES4_RKNS1_IT_T0_EE(ptr noundef nonnull align 8 dereferenceable(8) %0) #4 comdat align 2 !dbg !2180 {
  %2 = alloca %"struct.std::chrono::duration", align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2190, !DIExpression(), !2191)
  %5 = load ptr, ptr %3, align 8, !dbg !2192
  %6 = call noundef i64 @_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv(ptr noundef nonnull align 8 dereferenceable(8) %5), !dbg !2193
  store i64 %6, ptr %4, align 8, !dbg !2194
  call void @_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEC2IlvEERKT_(ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef nonnull align 8 dereferenceable(8) %4), !dbg !2195
  %7 = getelementptr inbounds %"struct.std::chrono::duration", ptr %2, i32 0, i32 0, !dbg !2196
  %8 = load i64, ptr %7, align 8, !dbg !2196
  ret i64 %8, !dbg !2196
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local i64 @_ZNSt6chrono20__duration_cast_implINS_8durationIlSt5ratioILl1ELl1000000000EEEES2_ILl1000000000ELl1EElLb0ELb1EE6__castIlS2_ILl1ELl1EEEES4_RKNS1_IT_T0_EE(ptr noundef nonnull align 8 dereferenceable(8) %0) #4 comdat align 2 !dbg !2197 {
  %2 = alloca %"struct.std::chrono::duration.0", align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2205, !DIExpression(), !2206)
  %5 = load ptr, ptr %3, align 8, !dbg !2207
  %6 = call noundef i64 @_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv(ptr noundef nonnull align 8 dereferenceable(8) %5), !dbg !2208
  %7 = mul nsw i64 %6, 1000000000, !dbg !2209
  store i64 %7, ptr %4, align 8, !dbg !2210
  call void @_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEC2IlvEERKT_(ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef nonnull align 8 dereferenceable(8) %4), !dbg !2211
  %8 = getelementptr inbounds %"struct.std::chrono::duration.0", ptr %2, i32 0, i32 0, !dbg !2212
  %9 = load i64, ptr %8, align 8, !dbg !2212
  ret i64 %9, !dbg !2212
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEC2IlvEERKT_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #5 comdat align 2 !dbg !2213 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2217, !DIExpression(), !2219)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2220, !DIExpression(), !2221)
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"struct.std::chrono::duration.0", ptr %5, i32 0, i32 0, !dbg !2222
  %7 = load ptr, ptr %4, align 8, !dbg !2223
  %8 = load i64, ptr %7, align 8, !dbg !2223
  store i64 %8, ptr %6, align 8, !dbg !2222
  ret void, !dbg !2224
}

declare void @_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE(ptr noundef nonnull align 8 dereferenceable(8), ptr noundef, ptr noundef) #1

; Function Attrs: nobuiltin allocsize(0)
declare noundef nonnull ptr @_Znwm(i64 noundef) #10

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEC2IJRS3_iEEEDpOT_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull %1, ptr noundef nonnull align 4 dereferenceable(4) %2) unnamed_addr #4 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !2225 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2233, !DIExpression(), !2235)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2236, !DIExpression(), !2237)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !2238, !DIExpression(), !2237)
  %9 = load ptr, ptr %4, align 8
  call void @_ZNSt6thread6_StateC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %9) #3, !dbg !2239
  store ptr getelementptr inbounds inrange(-16, 24) ({ [5 x ptr] }, ptr @_ZTVNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE, i32 0, i32 0, i32 2), ptr %9, align 8, !dbg !2240
  %10 = getelementptr inbounds %"struct.std::thread::_State_impl", ptr %9, i32 0, i32 1, !dbg !2241
  %11 = load ptr, ptr %5, align 8, !dbg !2242
  %12 = load ptr, ptr %6, align 8, !dbg !2242
  invoke void @_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEEC2IJRS2_iEEEDpOT_(ptr noundef nonnull align 8 dereferenceable(16) %10, ptr noundef nonnull %11, ptr noundef nonnull align 4 dereferenceable(4) %12)
          to label %13 unwind label %14, !dbg !2241

13:                                               ; preds = %3
  ret void, !dbg !2243

14:                                               ; preds = %3
  %15 = landingpad { ptr, i32 }
          cleanup, !dbg !2243
  %16 = extractvalue { ptr, i32 } %15, 0, !dbg !2243
  store ptr %16, ptr %7, align 8, !dbg !2243
  %17 = extractvalue { ptr, i32 } %15, 1, !dbg !2243
  store i32 %17, ptr %8, align 4, !dbg !2243
  call void @_ZNSt6thread6_StateD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %9) #3, !dbg !2244
  br label %18, !dbg !2244

18:                                               ; preds = %14
  %19 = load ptr, ptr %7, align 8, !dbg !2244
  %20 = load i32, ptr %8, align 4, !dbg !2244
  %21 = insertvalue { ptr, i32 } poison, ptr %19, 0, !dbg !2244
  %22 = insertvalue { ptr, i32 } %21, i32 %20, 1, !dbg !2244
  resume { ptr, i32 } %22, !dbg !2244
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(ptr noundef) #11

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEC2IS3_vEEPS1_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1) unnamed_addr #5 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !2246 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2250, !DIExpression(), !2252)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2253, !DIExpression(), !2254)
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::unique_ptr", ptr %5, i32 0, i32 0, !dbg !2255
  %7 = load ptr, ptr %4, align 8, !dbg !2256
  invoke void @_ZNSt15__uniq_ptr_dataINSt6thread6_StateESt14default_deleteIS1_ELb1ELb1EECI2St15__uniq_ptr_implIS1_S3_EEPS1_(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef %7)
          to label %8 unwind label %9, !dbg !2255

8:                                                ; preds = %2
  ret void, !dbg !2257

9:                                                ; preds = %2
  %10 = landingpad { ptr, i32 }
          catch ptr null, !dbg !2255
  %11 = extractvalue { ptr, i32 } %10, 0, !dbg !2255
  call void @__clang_call_terminate(ptr %11) #13, !dbg !2255
  unreachable, !dbg !2255
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EED2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #5 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !2258 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2259, !DIExpression(), !2260)
  %4 = load ptr, ptr %2, align 8
    #dbg_declare(ptr %3, !2261, !DIExpression(), !2263)
  %5 = getelementptr inbounds %"class.std::unique_ptr", ptr %4, i32 0, i32 0, !dbg !2264
  %6 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE6_M_ptrEv(ptr noundef nonnull align 8 dereferenceable(8) %5), !dbg !2265
  store ptr %6, ptr %3, align 8, !dbg !2263
  %7 = load ptr, ptr %3, align 8, !dbg !2266
  %8 = load ptr, ptr %7, align 8, !dbg !2266
  %9 = icmp ne ptr %8, null, !dbg !2268
  br i1 %9, label %10, label %15, !dbg !2269

10:                                               ; preds = %1
  %11 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE11get_deleterEv(ptr noundef nonnull align 8 dereferenceable(8) %4) #3, !dbg !2270
  %12 = load ptr, ptr %3, align 8, !dbg !2271
  %13 = load ptr, ptr %12, align 8, !dbg !2272
  invoke void @_ZNKSt14default_deleteINSt6thread6_StateEEclEPS1_(ptr noundef nonnull align 1 dereferenceable(1) %11, ptr noundef %13)
          to label %14 unwind label %17, !dbg !2270

14:                                               ; preds = %10
  br label %15, !dbg !2270

15:                                               ; preds = %14, %1
  %16 = load ptr, ptr %3, align 8, !dbg !2273
  store ptr null, ptr %16, align 8, !dbg !2274
  ret void, !dbg !2275

17:                                               ; preds = %10
  %18 = landingpad { ptr, i32 }
          catch ptr null, !dbg !2270
  %19 = extractvalue { ptr, i32 } %18, 0, !dbg !2270
  call void @__clang_call_terminate(ptr %19) #13, !dbg !2270
  unreachable, !dbg !2270
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt6thread6_StateC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #5 comdat align 2 !dbg !2276 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2281, !DIExpression(), !2282)
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds inrange(-16, 24) ({ [5 x ptr] }, ptr @_ZTVNSt6thread6_StateE, i32 0, i32 0, i32 2), ptr %3, align 8, !dbg !2283
  ret void, !dbg !2283
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEEC2IJRS2_iEEEDpOT_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull %1, ptr noundef nonnull align 4 dereferenceable(4) %2) unnamed_addr #5 comdat align 2 !dbg !2284 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2288, !DIExpression(), !2290)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2291, !DIExpression(), !2292)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !2293, !DIExpression(), !2292)
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %"struct.std::thread::_Invoker", ptr %7, i32 0, i32 0, !dbg !2294
  %9 = load ptr, ptr %5, align 8, !dbg !2295
  %10 = load ptr, ptr %6, align 8, !dbg !2295
  call void @_ZNSt5tupleIJPFvmEiEEC2IRS0_iTnNSt9enable_ifIXclsr4_TCCIXntcl14__is_alloc_argIT_EEEEE29__is_implicitly_constructibleIS6_T0_EEEbE4typeELb1EEEOS6_OS7_(ptr noundef nonnull align 8 dereferenceable(16) %8, ptr noundef nonnull %9, ptr noundef nonnull align 4 dereferenceable(4) %10) #3, !dbg !2294
  ret void, !dbg !2296
}

; Function Attrs: nounwind
declare void @_ZNSt6thread6_StateD2Ev(ptr noundef nonnull align 8 dereferenceable(8)) unnamed_addr #2

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #5 comdat align 2 !dbg !2297 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2299, !DIExpression(), !2300)
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt6thread6_StateD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #3, !dbg !2301
  ret void, !dbg !2303
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEED0Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #5 comdat align 2 !dbg !2304 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2305, !DIExpression(), !2306)
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #3, !dbg !2307
  call void @_ZdlPv(ptr noundef %3) #15, !dbg !2307
  ret void, !dbg !2307
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEE6_M_runEv(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #4 comdat align 2 !dbg !2308 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2309, !DIExpression(), !2310)
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::thread::_State_impl", ptr %3, i32 0, i32 1, !dbg !2311
  call void @_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEEclEv(ptr noundef nonnull align 8 dereferenceable(16) %4), !dbg !2311
  ret void, !dbg !2312
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt5tupleIJPFvmEiEEC2IRS0_iTnNSt9enable_ifIXclsr4_TCCIXntcl14__is_alloc_argIT_EEEEE29__is_implicitly_constructibleIS6_T0_EEEbE4typeELb1EEEOS6_OS7_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull %1, ptr noundef nonnull align 4 dereferenceable(4) %2) unnamed_addr #5 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !2313 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2320, !DIExpression(), !2322)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2323, !DIExpression(), !2324)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !2325, !DIExpression(), !2326)
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8, !dbg !2327
  %9 = load ptr, ptr %6, align 8, !dbg !2328
  invoke void @_ZNSt11_Tuple_implILm0EJPFvmEiEEC2IRS0_JiEvEEOT_DpOT0_(ptr noundef nonnull align 8 dereferenceable(16) %7, ptr noundef nonnull %8, ptr noundef nonnull align 4 dereferenceable(4) %9)
          to label %10 unwind label %11, !dbg !2329

10:                                               ; preds = %3
  ret void, !dbg !2330

11:                                               ; preds = %3
  %12 = landingpad { ptr, i32 }
          catch ptr null, !dbg !2329
  %13 = extractvalue { ptr, i32 } %12, 0, !dbg !2329
  call void @__clang_call_terminate(ptr %13) #13, !dbg !2329
  unreachable, !dbg !2329
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt11_Tuple_implILm0EJPFvmEiEEC2IRS0_JiEvEEOT_DpOT0_(ptr noundef nonnull align 8 dereferenceable(16) %0, ptr noundef nonnull %1, ptr noundef nonnull align 4 dereferenceable(4) %2) unnamed_addr #4 comdat align 2 !dbg !2331 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2338, !DIExpression(), !2340)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2341, !DIExpression(), !2342)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !2343, !DIExpression(), !2344)
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %6, align 8, !dbg !2345
  call void @_ZNSt11_Tuple_implILm1EJiEEC2IiEEOT_(ptr noundef nonnull align 4 dereferenceable(4) %8, ptr noundef nonnull align 4 dereferenceable(4) %9), !dbg !2346
  %10 = getelementptr inbounds i8, ptr %8, i64 8, !dbg !2347
  %11 = load ptr, ptr %5, align 8, !dbg !2348
  store ptr %11, ptr %7, align 8, !dbg !2349
  call void @_ZNSt10_Head_baseILm0EPFvmELb0EEC2ERKS1_(ptr noundef nonnull align 8 dereferenceable(8) %10, ptr noundef nonnull align 8 dereferenceable(8) %7), !dbg !2350
  ret void, !dbg !2351
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt11_Tuple_implILm1EJiEEC2IiEEOT_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) unnamed_addr #4 comdat align 2 !dbg !2352 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2358, !DIExpression(), !2360)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2361, !DIExpression(), !2362)
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8, !dbg !2363
  call void @_ZNSt10_Head_baseILm1EiLb0EEC2IiEEOT_(ptr noundef nonnull align 4 dereferenceable(4) %5, ptr noundef nonnull align 4 dereferenceable(4) %6), !dbg !2364
  ret void, !dbg !2365
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt10_Head_baseILm0EPFvmELb0EEC2ERKS1_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #5 comdat align 2 !dbg !2366 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2367, !DIExpression(), !2369)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2370, !DIExpression(), !2371)
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"struct.std::_Head_base.7", ptr %5, i32 0, i32 0, !dbg !2372
  %7 = load ptr, ptr %4, align 8, !dbg !2373
  %8 = load ptr, ptr %7, align 8, !dbg !2373
  store ptr %8, ptr %6, align 8, !dbg !2372
  ret void, !dbg !2374
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt10_Head_baseILm1EiLb0EEC2IiEEOT_(ptr noundef nonnull align 4 dereferenceable(4) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) unnamed_addr #5 comdat align 2 !dbg !2375 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2379, !DIExpression(), !2381)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2382, !DIExpression(), !2383)
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"struct.std::_Head_base.6", ptr %5, i32 0, i32 0, !dbg !2384
  %7 = load ptr, ptr %4, align 8, !dbg !2385
  %8 = load i32, ptr %7, align 4, !dbg !2386
  store i32 %8, ptr %6, align 4, !dbg !2384
  ret void, !dbg !2387
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEEclEv(ptr noundef nonnull align 8 dereferenceable(16) %0) #4 comdat align 2 !dbg !2388 {
  %2 = alloca ptr, align 8
  %3 = alloca %"struct.std::_Index_tuple", align 1
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2389, !DIExpression(), !2390)
  %4 = load ptr, ptr %2, align 8
  call void @_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEE9_M_invokeIJLm0ELm1EEEEvSt12_Index_tupleIJXspT_EEE(ptr noundef nonnull align 8 dereferenceable(16) %4), !dbg !2391
  ret void, !dbg !2392
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEE9_M_invokeIJLm0ELm1EEEEvSt12_Index_tupleIJXspT_EEE(ptr noundef nonnull align 8 dereferenceable(16) %0) #4 comdat align 2 !dbg !2393 {
  %2 = alloca %"struct.std::_Index_tuple", align 1
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2406, !DIExpression(), !2407)
    #dbg_declare(ptr %2, !2408, !DIExpression(), !2409)
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %"struct.std::thread::_Invoker", ptr %4, i32 0, i32 0, !dbg !2410
  %6 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt3getILm0EJPFvmEiEEONSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeEOS6_(ptr noundef nonnull align 8 dereferenceable(16) %5) #3, !dbg !2411
  %7 = getelementptr inbounds %"struct.std::thread::_Invoker", ptr %4, i32 0, i32 0, !dbg !2410
  %8 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZSt3getILm1EJPFvmEiEEONSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeEOS6_(ptr noundef nonnull align 8 dereferenceable(16) %7) #3, !dbg !2411
  call void @_ZSt8__invokeIPFvmEJiEENSt15__invoke_resultIT_JDpT0_EE4typeEOS3_DpOS4_(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 4 dereferenceable(4) %8), !dbg !2412
  ret void, !dbg !2413
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZSt8__invokeIPFvmEJiEENSt15__invoke_resultIT_JDpT0_EE4typeEOS3_DpOS4_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #4 comdat !dbg !611 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"struct.std::__invoke_other", align 1
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2414, !DIExpression(), !2415)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2416, !DIExpression(), !2417)
  %6 = load ptr, ptr %3, align 8, !dbg !2418
  %7 = load ptr, ptr %4, align 8, !dbg !2419
  call void @_ZSt13__invoke_implIvPFvmEJiEET_St14__invoke_otherOT0_DpOT1_(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef nonnull align 4 dereferenceable(4) %7), !dbg !2420
  ret void, !dbg !2421
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZSt3getILm0EJPFvmEiEEONSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeEOS6_(ptr noundef nonnull align 8 dereferenceable(16) %0) #5 comdat !dbg !2422 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2434, !DIExpression(), !2435)
  %3 = load ptr, ptr %2, align 8, !dbg !2436
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt12__get_helperILm0EPFvmEJiEERT0_RSt11_Tuple_implIXT_EJS2_DpT1_EE(ptr noundef nonnull align 8 dereferenceable(16) %3) #3, !dbg !2437
  ret ptr %4, !dbg !2438
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 4 dereferenceable(4) ptr @_ZSt3getILm1EJPFvmEiEEONSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeEOS6_(ptr noundef nonnull align 8 dereferenceable(16) %0) #5 comdat !dbg !2439 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2451, !DIExpression(), !2452)
  %3 = load ptr, ptr %2, align 8, !dbg !2453
  %4 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZSt12__get_helperILm1EiJEERT0_RSt11_Tuple_implIXT_EJS0_DpT1_EE(ptr noundef nonnull align 4 dereferenceable(4) %3) #3, !dbg !2454
  ret ptr %4, !dbg !2455
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZSt13__invoke_implIvPFvmEJiEET_St14__invoke_otherOT0_DpOT1_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 4 dereferenceable(4) %1) #4 comdat !dbg !2456 {
  %3 = alloca %"struct.std::__invoke_other", align 1
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
    #dbg_declare(ptr %3, !2462, !DIExpression(), !2463)
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2464, !DIExpression(), !2465)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2466, !DIExpression(), !2467)
  %6 = load ptr, ptr %4, align 8, !dbg !2468
  %7 = load ptr, ptr %6, align 8, !dbg !2469
  %8 = load ptr, ptr %5, align 8, !dbg !2470
  %9 = load i32, ptr %8, align 4, !dbg !2471
  %10 = sext i32 %9 to i64, !dbg !2471
  call void %7(i64 noundef %10), !dbg !2469
  ret void, !dbg !2472
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZSt12__get_helperILm0EPFvmEJiEERT0_RSt11_Tuple_implIXT_EJS2_DpT1_EE(ptr noundef nonnull align 8 dereferenceable(16) %0) #5 comdat !dbg !2473 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2476, !DIExpression(), !2477)
  %3 = load ptr, ptr %2, align 8, !dbg !2478
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_headERS2_(ptr noundef nonnull align 8 dereferenceable(16) %3) #3, !dbg !2479
  ret ptr %4, !dbg !2480
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_headERS2_(ptr noundef nonnull align 8 dereferenceable(16) %0) #5 comdat align 2 !dbg !2481 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2482, !DIExpression(), !2483)
  %3 = load ptr, ptr %2, align 8, !dbg !2484
  %4 = getelementptr inbounds i8, ptr %3, i64 8, !dbg !2484
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt10_Head_baseILm0EPFvmELb0EE7_M_headERS2_(ptr noundef nonnull align 8 dereferenceable(8) %4) #3, !dbg !2485
  ret ptr %5, !dbg !2486
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt10_Head_baseILm0EPFvmELb0EE7_M_headERS2_(ptr noundef nonnull align 8 dereferenceable(8) %0) #5 comdat align 2 !dbg !2487 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2488, !DIExpression(), !2489)
  %3 = load ptr, ptr %2, align 8, !dbg !2490
  %4 = getelementptr inbounds %"struct.std::_Head_base.7", ptr %3, i32 0, i32 0, !dbg !2491
  ret ptr %4, !dbg !2492
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 4 dereferenceable(4) ptr @_ZSt12__get_helperILm1EiJEERT0_RSt11_Tuple_implIXT_EJS0_DpT1_EE(ptr noundef nonnull align 4 dereferenceable(4) %0) #5 comdat !dbg !2493 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2496, !DIExpression(), !2497)
  %3 = load ptr, ptr %2, align 8, !dbg !2498
  %4 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt11_Tuple_implILm1EJiEE7_M_headERS0_(ptr noundef nonnull align 4 dereferenceable(4) %3) #3, !dbg !2499
  ret ptr %4, !dbg !2500
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt11_Tuple_implILm1EJiEE7_M_headERS0_(ptr noundef nonnull align 4 dereferenceable(4) %0) #5 comdat align 2 !dbg !2501 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2502, !DIExpression(), !2503)
  %3 = load ptr, ptr %2, align 8, !dbg !2504
  %4 = call noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt10_Head_baseILm1EiLb0EE7_M_headERS0_(ptr noundef nonnull align 4 dereferenceable(4) %3) #3, !dbg !2505
  ret ptr %4, !dbg !2506
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 4 dereferenceable(4) ptr @_ZNSt10_Head_baseILm1EiLb0EE7_M_headERS0_(ptr noundef nonnull align 4 dereferenceable(4) %0) #5 comdat align 2 !dbg !2507 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2508, !DIExpression(), !2509)
  %3 = load ptr, ptr %2, align 8, !dbg !2510
  %4 = getelementptr inbounds %"struct.std::_Head_base.6", ptr %3, i32 0, i32 0, !dbg !2511
  ret ptr %4, !dbg !2512
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt15__uniq_ptr_dataINSt6thread6_StateESt14default_deleteIS1_ELb1ELb1EECI2St15__uniq_ptr_implIS1_S3_EEPS1_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1) unnamed_addr #4 comdat align 2 !dbg !2513 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2517, !DIExpression(), !2519)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2520, !DIExpression(), !2519)
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8, !dbg !2521
  call void @_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EEC2EPS1_(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef %6), !dbg !2521
  ret void, !dbg !2521
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EEC2EPS1_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1) unnamed_addr #4 comdat align 2 !dbg !2522 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2523, !DIExpression(), !2525)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2526, !DIExpression(), !2527)
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.std::__uniq_ptr_impl", ptr %5, i32 0, i32 0, !dbg !2528
  call void @_ZNSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEEC2ILb1ETnNSt9enable_ifIXclsr17_TupleConstraintsIXT_ES2_S4_EE37__is_implicitly_default_constructibleEEbE4typeELb1EEEv(ptr noundef nonnull align 8 dereferenceable(8) %6) #3, !dbg !2528
  %7 = load ptr, ptr %4, align 8, !dbg !2529
  %8 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE6_M_ptrEv(ptr noundef nonnull align 8 dereferenceable(8) %5), !dbg !2531
  store ptr %7, ptr %8, align 8, !dbg !2532
  ret void, !dbg !2533
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEEC2ILb1ETnNSt9enable_ifIXclsr17_TupleConstraintsIXT_ES2_S4_EE37__is_implicitly_default_constructibleEEbE4typeELb1EEEv(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #5 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !2534 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2540, !DIExpression(), !2542)
  %3 = load ptr, ptr %2, align 8
  invoke void @_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEEC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3)
          to label %4 unwind label %5, !dbg !2543

4:                                                ; preds = %1
  ret void, !dbg !2544

5:                                                ; preds = %1
  %6 = landingpad { ptr, i32 }
          catch ptr null, !dbg !2543
  %7 = extractvalue { ptr, i32 } %6, 0, !dbg !2543
  call void @__clang_call_terminate(ptr %7) #13, !dbg !2543
  unreachable, !dbg !2543
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE6_M_ptrEv(ptr noundef nonnull align 8 dereferenceable(8) %0) #5 comdat align 2 !dbg !2545 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2546, !DIExpression(), !2547)
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__uniq_ptr_impl", ptr %3, i32 0, i32 0, !dbg !2548
  %5 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt3getILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERS9_(ptr noundef nonnull align 8 dereferenceable(8) %4) #3, !dbg !2549
  ret ptr %5, !dbg !2550
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEEC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #4 comdat align 2 !dbg !2551 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2552, !DIExpression(), !2554)
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEEC2Ev(ptr noundef nonnull align 1 dereferenceable(1) %3), !dbg !2555
  call void @_ZNSt10_Head_baseILm0EPNSt6thread6_StateELb0EEC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3), !dbg !2556
  ret void, !dbg !2557
}

; Function Attrs: mustprogress noinline optnone uwtable
define linkonce_odr dso_local void @_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEEC2Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) unnamed_addr #4 comdat align 2 !dbg !2558 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2559, !DIExpression(), !2561)
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EEC2Ev(ptr noundef nonnull align 1 dereferenceable(1) %3), !dbg !2562
  ret void, !dbg !2563
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt10_Head_baseILm0EPNSt6thread6_StateELb0EEC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #5 comdat align 2 !dbg !2564 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2565, !DIExpression(), !2567)
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Head_base.2", ptr %3, i32 0, i32 0, !dbg !2568
  store ptr null, ptr %4, align 8, !dbg !2568
  ret void, !dbg !2569
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EEC2Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) unnamed_addr #5 comdat align 2 !dbg !2570 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2571, !DIExpression(), !2573)
  %3 = load ptr, ptr %2, align 8
  ret void, !dbg !2574
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZSt3getILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERS9_(ptr noundef nonnull align 8 dereferenceable(8) %0) #5 comdat !dbg !2575 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2585, !DIExpression(), !2586)
  %3 = load ptr, ptr %2, align 8, !dbg !2587
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZSt12__get_helperILm0EPNSt6thread6_StateEJSt14default_deleteIS1_EEERT0_RSt11_Tuple_implIXT_EJS5_DpT1_EE(ptr noundef nonnull align 8 dereferenceable(8) %3) #3, !dbg !2588
  ret ptr %4, !dbg !2589
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZSt12__get_helperILm0EPNSt6thread6_StateEJSt14default_deleteIS1_EEERT0_RSt11_Tuple_implIXT_EJS5_DpT1_EE(ptr noundef nonnull align 8 dereferenceable(8) %0) #5 comdat !dbg !2590 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2593, !DIExpression(), !2594)
  %3 = load ptr, ptr %2, align 8, !dbg !2595
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_headERS5_(ptr noundef nonnull align 8 dereferenceable(8) %3) #3, !dbg !2596
  ret ptr %4, !dbg !2597
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_headERS5_(ptr noundef nonnull align 8 dereferenceable(8) %0) #5 comdat align 2 !dbg !2598 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2599, !DIExpression(), !2600)
  %3 = load ptr, ptr %2, align 8, !dbg !2601
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt10_Head_baseILm0EPNSt6thread6_StateELb0EE7_M_headERS3_(ptr noundef nonnull align 8 dereferenceable(8) %3) #3, !dbg !2602
  ret ptr %4, !dbg !2603
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNSt10_Head_baseILm0EPNSt6thread6_StateELb0EE7_M_headERS3_(ptr noundef nonnull align 8 dereferenceable(8) %0) #5 comdat align 2 !dbg !2604 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2605, !DIExpression(), !2606)
  %3 = load ptr, ptr %2, align 8, !dbg !2607
  %4 = getelementptr inbounds %"struct.std::_Head_base.2", ptr %3, i32 0, i32 0, !dbg !2608
  ret ptr %4, !dbg !2609
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE11get_deleterEv(ptr noundef nonnull align 8 dereferenceable(8) %0) #5 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !2610 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2611, !DIExpression(), !2612)
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::unique_ptr", ptr %3, i32 0, i32 0, !dbg !2613
  %5 = invoke noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE10_M_deleterEv(ptr noundef nonnull align 8 dereferenceable(8) %4)
          to label %6 unwind label %7, !dbg !2614

6:                                                ; preds = %1
  ret ptr %5, !dbg !2615

7:                                                ; preds = %1
  %8 = landingpad { ptr, i32 }
          catch ptr null, !dbg !2614
  %9 = extractvalue { ptr, i32 } %8, 0, !dbg !2614
  call void @__clang_call_terminate(ptr %9) #13, !dbg !2614
  unreachable, !dbg !2614
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local void @_ZNKSt14default_deleteINSt6thread6_StateEEclEPS1_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1) #5 comdat align 2 !dbg !2616 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
    #dbg_declare(ptr %3, !2617, !DIExpression(), !2619)
  store ptr %1, ptr %4, align 8
    #dbg_declare(ptr %4, !2620, !DIExpression(), !2621)
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8, !dbg !2622
  %7 = icmp eq ptr %6, null, !dbg !2623
  br i1 %7, label %12, label %8, !dbg !2623

8:                                                ; preds = %2
  %9 = load ptr, ptr %6, align 8, !dbg !2623
  %10 = getelementptr inbounds ptr, ptr %9, i64 1, !dbg !2623
  %11 = load ptr, ptr %10, align 8, !dbg !2623
  call void %11(ptr noundef nonnull align 8 dereferenceable(8) %6) #3, !dbg !2623
  br label %12, !dbg !2623

12:                                               ; preds = %8, %2
  ret void, !dbg !2624
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE10_M_deleterEv(ptr noundef nonnull align 8 dereferenceable(8) %0) #5 comdat align 2 !dbg !2625 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2626, !DIExpression(), !2627)
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.std::__uniq_ptr_impl", ptr %3, i32 0, i32 0, !dbg !2628
  %5 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZSt3getILm1EJPNSt6thread6_StateESt14default_deleteIS1_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERS9_(ptr noundef nonnull align 8 dereferenceable(8) %4) #3, !dbg !2629
  ret ptr %5, !dbg !2630
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 1 dereferenceable(1) ptr @_ZSt3getILm1EJPNSt6thread6_StateESt14default_deleteIS1_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERS9_(ptr noundef nonnull align 8 dereferenceable(8) %0) #5 comdat !dbg !2631 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2642, !DIExpression(), !2643)
  %3 = load ptr, ptr %2, align 8, !dbg !2644
  %4 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZSt12__get_helperILm1ESt14default_deleteINSt6thread6_StateEEJEERT0_RSt11_Tuple_implIXT_EJS4_DpT1_EE(ptr noundef nonnull align 1 dereferenceable(1) %3) #3, !dbg !2645
  ret ptr %4, !dbg !2646
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 1 dereferenceable(1) ptr @_ZSt12__get_helperILm1ESt14default_deleteINSt6thread6_StateEEJEERT0_RSt11_Tuple_implIXT_EJS4_DpT1_EE(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat !dbg !2647 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2649, !DIExpression(), !2650)
  %3 = load ptr, ptr %2, align 8, !dbg !2651
  %4 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEE7_M_headERS4_(ptr noundef nonnull align 1 dereferenceable(1) %3) #3, !dbg !2652
  ret ptr %4, !dbg !2653
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEE7_M_headERS4_(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 !dbg !2654 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2655, !DIExpression(), !2656)
  %3 = load ptr, ptr %2, align 8, !dbg !2657
  %4 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EE7_M_headERS4_(ptr noundef nonnull align 1 dereferenceable(1) %3) #3, !dbg !2658
  ret ptr %4, !dbg !2659
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define linkonce_odr dso_local noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EE7_M_headERS4_(ptr noundef nonnull align 1 dereferenceable(1) %0) #5 comdat align 2 !dbg !2660 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
    #dbg_declare(ptr %2, !2661, !DIExpression(), !2662)
  %3 = load ptr, ptr %2, align 8, !dbg !2663
  ret ptr %3, !dbg !2664
}

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_sequential.cpp() #0 section ".text.startup" !dbg !2665 {
  call void @__cxx_global_var_init(), !dbg !2667
  ret void
}

attributes #0 = { noinline uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }
attributes #4 = { mustprogress noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { mustprogress noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noinline noreturn nounwind uwtable "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #9 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nobuiltin allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nobuiltin nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nounwind willreturn memory(none) }
attributes #13 = { noreturn nounwind }
attributes #14 = { builtin allocsize(0) }
attributes #15 = { builtin nounwind }

!llvm.dbg.cu = !{!9}
!llvm.module.flags = !{!1781, !1782, !1783, !1784, !1785, !1786, !1787}
!llvm.ident = !{!1788}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !2, file: !3, line: 74, type: !4, isLocal: true, isDefinition: true)
!2 = !DINamespace(name: "std", scope: null)
!3 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/iostream", directory: "")
!4 = !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !6, file: !5, line: 626, size: 8, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt8ios_base4InitE")
!5 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/ios_base.h", directory: "")
!6 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !2, file: !5, line: 228, size: 1728, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(name: "lock", scope: !9, file: !879, line: 8, type: !1772, isLocal: false, isDefinition: true)
!9 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_11, file: !10, producer: "clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !11, retainedTypes: !28, globals: !876, imports: !900, splitDebugInlining: false, nameTableKind: None)
!10 = !DIFile(filename: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/Huron/atomic_lock/sequential.cpp", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/Huron/atomic_lock", checksumkind: CSK_MD5, checksum: "b1bb097e2fe98c2e353904317650680b")
!11 = !{!12, !22}
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
!28 = !{!29, !72, !35, !100, !101, !36, !104, !32, !121, !124, !177, !181, !609, !635, !183, !270, !267, !305, !264, !371, !261, !257, !254, !251, !247, !186, !679, !685, !719, !753, !787, !834, !867}
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "seconds", scope: !31, file: !30, line: 847, baseType: !32)
!30 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/chrono", directory: "")
!31 = !DINamespace(name: "chrono", scope: !2)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "duration<long, std::ratio<1L, 1L> >", scope: !31, file: !30, line: 459, size: 64, flags: DIFlagTypePassByValue, elements: !33, templateParams: !88, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1EEEE")
!33 = !{!34, !37, !44, !48, !53, !54, !58, !62, !65, !66, !69, !73, !74, !75, !76, !77, !82, !83, !86, !87}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !32, file: !30, line: 635, baseType: !35, size: 64, flags: DIFlagPrivate)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !32, file: !30, line: 503, baseType: !36)
!36 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!37 = !DISubprogram(name: "_S_gcd", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE6_S_gcdEll", scope: !32, file: !30, line: 466, type: !38, scopeLine: 466, flags: DIFlagPrivate | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!38 = !DISubroutineType(types: !39)
!39 = !{!40, !40, !40}
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !41, line: 101, baseType: !42)
!41 = !DIFile(filename: "/usr/include/stdint.h", directory: "", checksumkind: CSK_MD5, checksum: "a48e64edacc5b19f56c99745232c963c")
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !43, line: 72, baseType: !36)
!43 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!44 = !DISubprogram(name: "duration", scope: !32, file: !30, line: 512, type: !45, scopeLine: 512, flags: DIFlagPrototyped, spFlags: 0)
!45 = !DISubroutineType(types: !46)
!46 = !{null, !47}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!48 = !DISubprogram(name: "duration", scope: !32, file: !30, line: 514, type: !49, scopeLine: 514, flags: DIFlagPrototyped, spFlags: 0)
!49 = !DISubroutineType(types: !50)
!50 = !{null, !47, !51}
!51 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !32)
!53 = !DISubprogram(name: "~duration", scope: !32, file: !30, line: 532, type: !45, scopeLine: 532, flags: DIFlagPrototyped, spFlags: 0)
!54 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEaSERKS3_", scope: !32, file: !30, line: 533, type: !55, scopeLine: 533, flags: DIFlagPrototyped, spFlags: 0)
!55 = !DISubroutineType(types: !56)
!56 = !{!57, !47, !51}
!57 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !32, size: 64)
!58 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv", scope: !32, file: !30, line: 537, type: !59, scopeLine: 537, flags: DIFlagPrototyped, spFlags: 0)
!59 = !DISubroutineType(types: !60)
!60 = !{!35, !61}
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!62 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEEpsEv", scope: !32, file: !30, line: 543, type: !63, scopeLine: 543, flags: DIFlagPrototyped, spFlags: 0)
!63 = !DISubroutineType(types: !64)
!64 = !{!32, !61}
!65 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEEngEv", scope: !32, file: !30, line: 547, type: !63, scopeLine: 547, flags: DIFlagPrototyped, spFlags: 0)
!66 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEppEv", scope: !32, file: !30, line: 551, type: !67, scopeLine: 551, flags: DIFlagPrototyped, spFlags: 0)
!67 = !DISubroutineType(types: !68)
!68 = !{!57, !47}
!69 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEppEi", scope: !32, file: !30, line: 558, type: !70, scopeLine: 558, flags: DIFlagPrototyped, spFlags: 0)
!70 = !DISubroutineType(types: !71)
!71 = !{!32, !47, !72}
!72 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!73 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmmEv", scope: !32, file: !30, line: 562, type: !67, scopeLine: 562, flags: DIFlagPrototyped, spFlags: 0)
!74 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmmEi", scope: !32, file: !30, line: 569, type: !70, scopeLine: 569, flags: DIFlagPrototyped, spFlags: 0)
!75 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEpLERKS3_", scope: !32, file: !30, line: 573, type: !55, scopeLine: 573, flags: DIFlagPrototyped, spFlags: 0)
!76 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmIERKS3_", scope: !32, file: !30, line: 580, type: !55, scopeLine: 580, flags: DIFlagPrototyped, spFlags: 0)
!77 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEmLERKl", scope: !32, file: !30, line: 587, type: !78, scopeLine: 587, flags: DIFlagPrototyped, spFlags: 0)
!78 = !DISubroutineType(types: !79)
!79 = !{!57, !47, !80}
!80 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !35)
!82 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEdVERKl", scope: !32, file: !30, line: 594, type: !78, scopeLine: 594, flags: DIFlagPrototyped, spFlags: 0)
!83 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE4zeroEv", scope: !32, file: !30, line: 623, type: !84, scopeLine: 623, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!84 = !DISubroutineType(types: !85)
!85 = !{!32}
!86 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE3minEv", scope: !32, file: !30, line: 627, type: !84, scopeLine: 627, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!87 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE3maxEv", scope: !32, file: !30, line: 631, type: !84, scopeLine: 631, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!88 = !{!89, !90}
!89 = !DITemplateTypeParameter(name: "_Rep", type: !36)
!90 = !DITemplateTypeParameter(name: "_Period", type: !91, defaulted: true)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1L>", scope: !2, file: !92, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !93, templateParams: !97, identifier: "_ZTSSt5ratioILl1ELl1EE")
!92 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ratio", directory: "")
!93 = !{!94, !96}
!94 = !DIDerivedType(tag: DW_TAG_variable, name: "num", scope: !91, file: !92, line: 273, baseType: !95, flags: DIFlagStaticMember, extraData: i64 1)
!95 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !40)
!96 = !DIDerivedType(tag: DW_TAG_variable, name: "den", scope: !91, file: !92, line: 276, baseType: !95, flags: DIFlagStaticMember, extraData: i64 1)
!97 = !{!98, !99}
!98 = !DITemplateValueParameter(name: "_Num", type: !36, value: i64 1)
!99 = !DITemplateValueParameter(name: "_Den", type: !36, defaulted: true, value: i64 1)
!100 = !DIDerivedType(tag: DW_TAG_typedef, name: "memory_order", scope: !2, file: !13, line: 86, baseType: !12)
!101 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !102, line: 10, baseType: !103)
!102 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !43, line: 160, baseType: !36)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__ct", scope: !105, file: !30, line: 777, baseType: !115)
!105 = distinct !DISubprogram(name: "operator<<long, std::ratio<1L, 1L>, long, std::ratio<1L, 1L> >", linkageName: "_ZNSt6chronoltIlSt5ratioILl1ELl1EElS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE", scope: !31, file: !30, line: 772, type: !106, scopeLine: 774, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !110, retainedNodes: !109)
!106 = !DISubroutineType(types: !107)
!107 = !{!108, !51, !51}
!108 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!109 = !{}
!110 = !{!111, !112, !113, !114}
!111 = !DITemplateTypeParameter(name: "_Rep1", type: !36)
!112 = !DITemplateTypeParameter(name: "_Period1", type: !91)
!113 = !DITemplateTypeParameter(name: "_Rep2", type: !36)
!114 = !DITemplateTypeParameter(name: "_Period2", type: !91)
!115 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !116, file: !30, line: 130, baseType: !32)
!116 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "common_type<std::chrono::duration<long, std::ratio<1L, 1L> >, std::chrono::duration<long, std::ratio<1L, 1L> > >", scope: !2, file: !30, line: 127, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !117, identifier: "_ZTSSt11common_typeIJNSt6chrono8durationIlSt5ratioILl1ELl1EEEES4_EE")
!117 = !{!118}
!118 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Tp", value: !119)
!119 = !{!120, !120}
!120 = !DITemplateTypeParameter(type: !32)
!121 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "duration<long, std::ratio<1L, 1000000000L> >", scope: !31, file: !30, line: 459, size: 64, flags: DIFlagTypePassByValue, elements: !122, templateParams: !169, identifier: "_ZTSNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEE")
!122 = !{!123, !125, !126, !130, !135, !136, !140, !144, !147, !148, !151, !154, !155, !156, !157, !158, !163, !164, !167, !168}
!123 = !DIDerivedType(tag: DW_TAG_member, name: "__r", scope: !121, file: !30, line: 635, baseType: !124, size: 64, flags: DIFlagPrivate)
!124 = !DIDerivedType(tag: DW_TAG_typedef, name: "rep", scope: !121, file: !30, line: 503, baseType: !36)
!125 = !DISubprogram(name: "_S_gcd", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE6_S_gcdEll", scope: !121, file: !30, line: 466, type: !38, scopeLine: 466, flags: DIFlagPrivate | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!126 = !DISubprogram(name: "duration", scope: !121, file: !30, line: 512, type: !127, scopeLine: 512, flags: DIFlagPrototyped, spFlags: 0)
!127 = !DISubroutineType(types: !128)
!128 = !{null, !129}
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!130 = !DISubprogram(name: "duration", scope: !121, file: !30, line: 514, type: !131, scopeLine: 514, flags: DIFlagPrototyped, spFlags: 0)
!131 = !DISubroutineType(types: !132)
!132 = !{null, !129, !133}
!133 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !134, size: 64)
!134 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !121)
!135 = !DISubprogram(name: "~duration", scope: !121, file: !30, line: 532, type: !127, scopeLine: 532, flags: DIFlagPrototyped, spFlags: 0)
!136 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEaSERKS3_", scope: !121, file: !30, line: 533, type: !137, scopeLine: 533, flags: DIFlagPrototyped, spFlags: 0)
!137 = !DISubroutineType(types: !138)
!138 = !{!139, !129, !133}
!139 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !121, size: 64)
!140 = !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv", scope: !121, file: !30, line: 537, type: !141, scopeLine: 537, flags: DIFlagPrototyped, spFlags: 0)
!141 = !DISubroutineType(types: !142)
!142 = !{!124, !143}
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !134, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!144 = !DISubprogram(name: "operator+", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpsEv", scope: !121, file: !30, line: 543, type: !145, scopeLine: 543, flags: DIFlagPrototyped, spFlags: 0)
!145 = !DISubroutineType(types: !146)
!146 = !{!121, !143}
!147 = !DISubprogram(name: "operator-", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEngEv", scope: !121, file: !30, line: 547, type: !145, scopeLine: 547, flags: DIFlagPrototyped, spFlags: 0)
!148 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEv", scope: !121, file: !30, line: 551, type: !149, scopeLine: 551, flags: DIFlagPrototyped, spFlags: 0)
!149 = !DISubroutineType(types: !150)
!150 = !{!139, !129}
!151 = !DISubprogram(name: "operator++", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEppEi", scope: !121, file: !30, line: 558, type: !152, scopeLine: 558, flags: DIFlagPrototyped, spFlags: 0)
!152 = !DISubroutineType(types: !153)
!153 = !{!121, !129, !72}
!154 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEv", scope: !121, file: !30, line: 562, type: !149, scopeLine: 562, flags: DIFlagPrototyped, spFlags: 0)
!155 = !DISubprogram(name: "operator--", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmmEi", scope: !121, file: !30, line: 569, type: !152, scopeLine: 569, flags: DIFlagPrototyped, spFlags: 0)
!156 = !DISubprogram(name: "operator+=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEpLERKS3_", scope: !121, file: !30, line: 573, type: !137, scopeLine: 573, flags: DIFlagPrototyped, spFlags: 0)
!157 = !DISubprogram(name: "operator-=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmIERKS3_", scope: !121, file: !30, line: 580, type: !137, scopeLine: 580, flags: DIFlagPrototyped, spFlags: 0)
!158 = !DISubprogram(name: "operator*=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEmLERKl", scope: !121, file: !30, line: 587, type: !159, scopeLine: 587, flags: DIFlagPrototyped, spFlags: 0)
!159 = !DISubroutineType(types: !160)
!160 = !{!139, !129, !161}
!161 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !162, size: 64)
!162 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !124)
!163 = !DISubprogram(name: "operator/=", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEdVERKl", scope: !121, file: !30, line: 594, type: !159, scopeLine: 594, flags: DIFlagPrototyped, spFlags: 0)
!164 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE4zeroEv", scope: !121, file: !30, line: 623, type: !165, scopeLine: 623, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!165 = !DISubroutineType(types: !166)
!166 = !{!121}
!167 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3minEv", scope: !121, file: !30, line: 627, type: !165, scopeLine: 627, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!168 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE3maxEv", scope: !121, file: !30, line: 631, type: !165, scopeLine: 631, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!169 = !{!89, !170}
!170 = !DITemplateTypeParameter(name: "_Period", type: !171)
!171 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1L, 1000000000L>", scope: !2, file: !92, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !172, templateParams: !175, identifier: "_ZTSSt5ratioILl1ELl1000000000EE")
!172 = !{!173, !174}
!173 = !DIDerivedType(tag: DW_TAG_variable, name: "num", scope: !171, file: !92, line: 273, baseType: !95, flags: DIFlagStaticMember, extraData: i64 1)
!174 = !DIDerivedType(tag: DW_TAG_variable, name: "den", scope: !171, file: !92, line: 276, baseType: !95, flags: DIFlagStaticMember, extraData: i64 1000000000)
!175 = !{!98, !176}
!176 = !DITemplateValueParameter(name: "_Den", type: !36, value: i64 1000000000)
!177 = !DIDerivedType(tag: DW_TAG_typedef, name: "__cd", scope: !178, file: !30, line: 665, baseType: !115)
!178 = distinct !DISubprogram(name: "operator-<long, std::ratio<1L, 1L>, long, std::ratio<1L, 1L> >", linkageName: "_ZNSt6chronomiIlSt5ratioILl1ELl1EElS2_EENSt11common_typeIJNS_8durationIT_T0_EENS4_IT1_T2_EEEE4typeERKS7_RKSA_", scope: !31, file: !30, line: 660, type: !179, scopeLine: 662, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !110, retainedNodes: !109)
!179 = !DISubroutineType(types: !180)
!180 = !{!115, !51, !51}
!181 = !DIDerivedType(tag: DW_TAG_typedef, name: "_State_ptr", scope: !183, file: !182, line: 73, baseType: !247, flags: DIFlagPublic)
!182 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/std_thread.h", directory: "")
!183 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "thread", scope: !2, file: !182, line: 62, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !184, identifier: "_ZTSSt6thread")
!184 = !{!185, !202, !206, !207, !212, !216, !220, !223, !226, !230, !231, !232, !235, !238, !241}
!185 = !DIDerivedType(tag: DW_TAG_member, name: "_M_id", scope: !183, file: !182, line: 112, baseType: !186, size: 64)
!186 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "id", scope: !183, file: !182, line: 81, size: 64, flags: DIFlagPublic | DIFlagTypePassByValue | DIFlagNonTrivial, elements: !187, identifier: "_ZTSNSt6thread2idE")
!187 = !{!188, !195, !199}
!188 = !DIDerivedType(tag: DW_TAG_member, name: "_M_thread", scope: !186, file: !182, line: 83, baseType: !189, size: 64)
!189 = !DIDerivedType(tag: DW_TAG_typedef, name: "native_handle_type", scope: !183, file: !182, line: 75, baseType: !190, flags: DIFlagPublic)
!190 = !DIDerivedType(tag: DW_TAG_typedef, name: "__gthread_t", file: !191, line: 47, baseType: !192)
!191 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/gthr-default.h", directory: "", checksumkind: CSK_MD5, checksum: "044da7048de3797e59ae46e61ecc6348")
!192 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !193, line: 27, baseType: !194)
!193 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!194 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!195 = !DISubprogram(name: "id", scope: !186, file: !182, line: 86, type: !196, scopeLine: 86, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!196 = !DISubroutineType(types: !197)
!197 = !{null, !198}
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!199 = !DISubprogram(name: "id", scope: !186, file: !182, line: 89, type: !200, scopeLine: 89, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!200 = !DISubroutineType(types: !201)
!201 = !{null, !198, !189}
!202 = !DISubprogram(name: "thread", scope: !183, file: !182, line: 121, type: !203, scopeLine: 121, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!203 = !DISubroutineType(types: !204)
!204 = !{null, !205}
!205 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !183, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!206 = !DISubprogram(name: "~thread", scope: !183, file: !182, line: 149, type: !203, scopeLine: 149, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!207 = !DISubprogram(name: "thread", scope: !183, file: !182, line: 155, type: !208, scopeLine: 155, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!208 = !DISubroutineType(types: !209)
!209 = !{null, !205, !210}
!210 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !211, size: 64)
!211 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !183)
!212 = !DISubprogram(name: "thread", scope: !183, file: !182, line: 157, type: !213, scopeLine: 157, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!213 = !DISubroutineType(types: !214)
!214 = !{null, !205, !215}
!215 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !183, size: 64)
!216 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6threadaSERKS_", scope: !183, file: !182, line: 160, type: !217, scopeLine: 160, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!217 = !DISubroutineType(types: !218)
!218 = !{!219, !205, !210}
!219 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !183, size: 64)
!220 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6threadaSEOS_", scope: !183, file: !182, line: 162, type: !221, scopeLine: 162, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!221 = !DISubroutineType(types: !222)
!222 = !{!219, !205, !215}
!223 = !DISubprogram(name: "swap", linkageName: "_ZNSt6thread4swapERS_", scope: !183, file: !182, line: 171, type: !224, scopeLine: 171, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!224 = !DISubroutineType(types: !225)
!225 = !{null, !205, !219}
!226 = !DISubprogram(name: "joinable", linkageName: "_ZNKSt6thread8joinableEv", scope: !183, file: !182, line: 175, type: !227, scopeLine: 175, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!227 = !DISubroutineType(types: !228)
!228 = !{!108, !229}
!229 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!230 = !DISubprogram(name: "join", linkageName: "_ZNSt6thread4joinEv", scope: !183, file: !182, line: 179, type: !203, scopeLine: 179, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!231 = !DISubprogram(name: "detach", linkageName: "_ZNSt6thread6detachEv", scope: !183, file: !182, line: 182, type: !203, scopeLine: 182, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!232 = !DISubprogram(name: "get_id", linkageName: "_ZNKSt6thread6get_idEv", scope: !183, file: !182, line: 185, type: !233, scopeLine: 185, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!233 = !DISubroutineType(types: !234)
!234 = !{!186, !229}
!235 = !DISubprogram(name: "native_handle", linkageName: "_ZNSt6thread13native_handleEv", scope: !183, file: !182, line: 191, type: !236, scopeLine: 191, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!236 = !DISubroutineType(types: !237)
!237 = !{!189, !205}
!238 = !DISubprogram(name: "hardware_concurrency", linkageName: "_ZNSt6thread20hardware_concurrencyEv", scope: !183, file: !182, line: 196, type: !239, scopeLine: 196, flags: DIFlagPublic | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!239 = !DISubroutineType(types: !240)
!240 = !{!14}
!241 = !DISubprogram(name: "_M_start_thread", linkageName: "_ZNSt6thread15_M_start_threadESt10unique_ptrINS_6_StateESt14default_deleteIS1_EEPFvvE", scope: !183, file: !182, line: 215, type: !242, scopeLine: 215, flags: DIFlagPrototyped, spFlags: 0)
!242 = !DISubroutineType(types: !243)
!243 = !{null, !205, !181, !244}
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !245, size: 64)
!245 = !DISubroutineType(types: !246)
!246 = !{null}
!247 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "unique_ptr<std::thread::_State, std::default_delete<std::thread::_State> >", scope: !2, file: !248, line: 242, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !249, templateParams: !607, identifier: "_ZTSSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE")
!248 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/unique_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "4b5ae66ad1eb2fe06e6955f59533f596")
!249 = !{!250, !546, !551, !554, !558, !564, !573, !577, !578, !583, !588, !591, !594, !597, !600, !604}
!250 = !DIDerivedType(tag: DW_TAG_member, name: "_M_t", scope: !247, file: !248, line: 248, baseType: !251, size: 64)
!251 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__uniq_ptr_data<std::thread::_State, std::default_delete<std::thread::_State>, true, true>", scope: !2, file: !248, line: 208, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !252, templateParams: !545, identifier: "_ZTSSt15__uniq_ptr_dataINSt6thread6_StateESt14default_deleteIS1_ELb1ELb1EE")
!252 = !{!253, !536, !541}
!253 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !251, baseType: !254, extraData: i32 0)
!254 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__uniq_ptr_impl<std::thread::_State, std::default_delete<std::thread::_State> >", scope: !2, file: !248, line: 128, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !255, templateParams: !534, identifier: "_ZTSSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE")
!255 = !{!256, !490, !494, !504, !508, !512, !516, !521, !524, !527, !528, !531}
!256 = !DIDerivedType(tag: DW_TAG_member, name: "_M_t", scope: !254, file: !248, line: 201, baseType: !257, size: 64)
!257 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "tuple<std::thread::_State *, std::default_delete<std::thread::_State> >", scope: !2, file: !258, line: 981, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !259, templateParams: !489, identifier: "_ZTSSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEE")
!258 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/tuple", directory: "")
!259 = !{!260, !450, !453, !459, !463, !477, !486}
!260 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !257, baseType: !261, flags: DIFlagPublic, extraData: i32 0)
!261 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Tuple_impl<0UL, std::thread::_State *, std::default_delete<std::thread::_State> >", scope: !2, file: !258, line: 258, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !262, templateParams: !446, identifier: "_ZTSSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE")
!262 = !{!263, !370, !407, !411, !416, !421, !426, !430, !433, !436, !439, !443}
!263 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !261, baseType: !264, extraData: i32 0)
!264 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Tuple_impl<1UL, std::default_delete<std::thread::_State> >", scope: !2, file: !258, line: 416, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !265, templateParams: !366, identifier: "_ZTSSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEE")
!265 = !{!266, !337, !341, !346, !350, !353, !356, !359, !363}
!266 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !264, baseType: !267, flags: DIFlagPrivate, extraData: i32 0)
!267 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Head_base<1UL, std::default_delete<std::thread::_State>, true>", scope: !2, file: !258, line: 78, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !268, templateParams: !333, identifier: "_ZTSSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EE")
!268 = !{!269, !285, !289, !293, !298, !302, !325, !330}
!269 = !DIDerivedType(tag: DW_TAG_member, name: "_M_head_impl", scope: !267, file: !258, line: 129, baseType: !270, size: 8)
!270 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "default_delete<std::thread::_State>", scope: !2, file: !248, line: 63, size: 8, flags: DIFlagTypePassByValue, elements: !271, templateParams: !283, identifier: "_ZTSSt14default_deleteINSt6thread6_StateEE")
!271 = !{!272, !276}
!272 = !DISubprogram(name: "default_delete", scope: !270, file: !248, line: 66, type: !273, scopeLine: 66, flags: DIFlagPrototyped, spFlags: 0)
!273 = !DISubroutineType(types: !274)
!274 = !{null, !275}
!275 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !270, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!276 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt14default_deleteINSt6thread6_StateEEclEPS1_", scope: !270, file: !248, line: 79, type: !277, scopeLine: 79, flags: DIFlagPrototyped, spFlags: 0)
!277 = !DISubroutineType(types: !278)
!278 = !{null, !279, !281}
!279 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !280, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!280 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !270)
!281 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !282, size: 64)
!282 = !DICompositeType(tag: DW_TAG_structure_type, name: "_State", scope: !183, file: !182, line: 68, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial)
!283 = !{!284}
!284 = !DITemplateTypeParameter(name: "_Tp", type: !282)
!285 = !DISubprogram(name: "_Head_base", scope: !267, file: !258, line: 80, type: !286, scopeLine: 80, flags: DIFlagPrototyped, spFlags: 0)
!286 = !DISubroutineType(types: !287)
!287 = !{null, !288}
!288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !267, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!289 = !DISubprogram(name: "_Head_base", scope: !267, file: !258, line: 83, type: !290, scopeLine: 83, flags: DIFlagPrototyped, spFlags: 0)
!290 = !DISubroutineType(types: !291)
!291 = !{null, !288, !292}
!292 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !280, size: 64)
!293 = !DISubprogram(name: "_Head_base", scope: !267, file: !258, line: 86, type: !294, scopeLine: 86, flags: DIFlagPrototyped, spFlags: 0)
!294 = !DISubroutineType(types: !295)
!295 = !{null, !288, !296}
!296 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !297, size: 64)
!297 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !267)
!298 = !DISubprogram(name: "_Head_base", scope: !267, file: !258, line: 87, type: !299, scopeLine: 87, flags: DIFlagPrototyped, spFlags: 0)
!299 = !DISubroutineType(types: !300)
!300 = !{null, !288, !301}
!301 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !267, size: 64)
!302 = !DISubprogram(name: "_Head_base", scope: !267, file: !258, line: 94, type: !303, scopeLine: 94, flags: DIFlagPrototyped, spFlags: 0)
!303 = !DISubroutineType(types: !304)
!304 = !{null, !288, !305, !312}
!305 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_arg_t", scope: !2, file: !306, line: 51, size: 8, flags: DIFlagTypePassByValue, elements: !307, identifier: "_ZTSSt15allocator_arg_t")
!306 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/uses_allocator.h", directory: "", checksumkind: CSK_MD5, checksum: "3232586c3c5b827a38bfdd0f1cb692d3")
!307 = !{!308}
!308 = !DISubprogram(name: "allocator_arg_t", scope: !305, file: !306, line: 51, type: !309, scopeLine: 51, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!309 = !DISubroutineType(types: !310)
!310 = !{null, !311}
!311 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !305, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!312 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__uses_alloc0", scope: !2, file: !306, line: 74, size: 8, flags: DIFlagTypePassByValue, elements: !313, identifier: "_ZTSSt13__uses_alloc0")
!313 = !{!314, !316}
!314 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !312, baseType: !315, extraData: i32 0)
!315 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__uses_alloc_base", scope: !2, file: !306, line: 72, size: 8, flags: DIFlagTypePassByValue, elements: !109, identifier: "_ZTSSt17__uses_alloc_base")
!316 = !DIDerivedType(tag: DW_TAG_member, name: "_M_a", scope: !312, file: !306, line: 76, baseType: !317, size: 8)
!317 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Sink", scope: !312, file: !306, line: 76, size: 8, flags: DIFlagTypePassByValue, elements: !318, identifier: "_ZTSNSt13__uses_alloc05_SinkE")
!318 = !{!319}
!319 = !DISubprogram(name: "operator=", linkageName: "_ZNSt13__uses_alloc05_SinkaSEPKv", scope: !317, file: !306, line: 76, type: !320, scopeLine: 76, flags: DIFlagPrototyped, spFlags: 0)
!320 = !DISubroutineType(types: !321)
!321 = !{null, !322, !323}
!322 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !317, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!323 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !324, size: 64)
!324 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!325 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EE7_M_headERS4_", scope: !267, file: !258, line: 124, type: !326, scopeLine: 124, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!326 = !DISubroutineType(types: !327)
!327 = !{!328, !329}
!328 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !270, size: 64)
!329 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !267, size: 64)
!330 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EE7_M_headERKS4_", scope: !267, file: !258, line: 127, type: !331, scopeLine: 127, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!331 = !DISubroutineType(types: !332)
!332 = !{!292, !296}
!333 = !{!334, !335, !336}
!334 = !DITemplateValueParameter(name: "_Idx", type: !194, value: i64 1)
!335 = !DITemplateTypeParameter(name: "_Head", type: !270)
!336 = !DITemplateValueParameter(type: !108, defaulted: true, value: i8 1)
!337 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEE7_M_headERS4_", scope: !264, file: !258, line: 424, type: !338, scopeLine: 424, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!338 = !DISubroutineType(types: !339)
!339 = !{!328, !340}
!340 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !264, size: 64)
!341 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEE7_M_headERKS4_", scope: !264, file: !258, line: 427, type: !342, scopeLine: 427, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!342 = !DISubroutineType(types: !343)
!343 = !{!292, !344}
!344 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !345, size: 64)
!345 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !264)
!346 = !DISubprogram(name: "_Tuple_impl", scope: !264, file: !258, line: 430, type: !347, scopeLine: 430, flags: DIFlagPrototyped, spFlags: 0)
!347 = !DISubroutineType(types: !348)
!348 = !{null, !349}
!349 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !264, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!350 = !DISubprogram(name: "_Tuple_impl", scope: !264, file: !258, line: 434, type: !351, scopeLine: 434, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!351 = !DISubroutineType(types: !352)
!352 = !{null, !349, !292}
!353 = !DISubprogram(name: "_Tuple_impl", scope: !264, file: !258, line: 444, type: !354, scopeLine: 444, flags: DIFlagPrototyped, spFlags: 0)
!354 = !DISubroutineType(types: !355)
!355 = !{null, !349, !344}
!356 = !DISubprogram(name: "operator=", linkageName: "_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEEaSERKS4_", scope: !264, file: !258, line: 448, type: !357, scopeLine: 448, flags: DIFlagPrototyped, spFlags: DISPFlagDeleted)
!357 = !DISubroutineType(types: !358)
!358 = !{!340, !349, !344}
!359 = !DISubprogram(name: "_Tuple_impl", scope: !264, file: !258, line: 454, type: !360, scopeLine: 454, flags: DIFlagPrototyped, spFlags: 0)
!360 = !DISubroutineType(types: !361)
!361 = !{null, !349, !362}
!362 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !264, size: 64)
!363 = !DISubprogram(name: "_M_swap", linkageName: "_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEE7_M_swapERS4_", scope: !264, file: !258, line: 544, type: !364, scopeLine: 544, flags: DIFlagProtected | DIFlagPrototyped, spFlags: 0)
!364 = !DISubroutineType(types: !365)
!365 = !{null, !349, !340}
!366 = !{!334, !367}
!367 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Elements", value: !368)
!368 = !{!369}
!369 = !DITemplateTypeParameter(type: !270)
!370 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !261, baseType: !371, flags: DIFlagPrivate, extraData: i32 0)
!371 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Head_base<0UL, std::thread::_State *, false>", scope: !2, file: !258, line: 187, size: 64, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !372, templateParams: !403, identifier: "_ZTSSt10_Head_baseILm0EPNSt6thread6_StateELb0EE")
!372 = !{!373, !374, !378, !383, !388, !392, !395, !400}
!373 = !DIDerivedType(tag: DW_TAG_member, name: "_M_head_impl", scope: !371, file: !258, line: 238, baseType: !281, size: 64)
!374 = !DISubprogram(name: "_Head_base", scope: !371, file: !258, line: 189, type: !375, scopeLine: 189, flags: DIFlagPrototyped, spFlags: 0)
!375 = !DISubroutineType(types: !376)
!376 = !{null, !377}
!377 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !371, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!378 = !DISubprogram(name: "_Head_base", scope: !371, file: !258, line: 192, type: !379, scopeLine: 192, flags: DIFlagPrototyped, spFlags: 0)
!379 = !DISubroutineType(types: !380)
!380 = !{null, !377, !381}
!381 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !382, size: 64)
!382 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !281)
!383 = !DISubprogram(name: "_Head_base", scope: !371, file: !258, line: 195, type: !384, scopeLine: 195, flags: DIFlagPrototyped, spFlags: 0)
!384 = !DISubroutineType(types: !385)
!385 = !{null, !377, !386}
!386 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !387, size: 64)
!387 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !371)
!388 = !DISubprogram(name: "_Head_base", scope: !371, file: !258, line: 196, type: !389, scopeLine: 196, flags: DIFlagPrototyped, spFlags: 0)
!389 = !DISubroutineType(types: !390)
!390 = !{null, !377, !391}
!391 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !371, size: 64)
!392 = !DISubprogram(name: "_Head_base", scope: !371, file: !258, line: 203, type: !393, scopeLine: 203, flags: DIFlagPrototyped, spFlags: 0)
!393 = !DISubroutineType(types: !394)
!394 = !{null, !377, !305, !312}
!395 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm0EPNSt6thread6_StateELb0EE7_M_headERS3_", scope: !371, file: !258, line: 233, type: !396, scopeLine: 233, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!396 = !DISubroutineType(types: !397)
!397 = !{!398, !399}
!398 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !281, size: 64)
!399 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !371, size: 64)
!400 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm0EPNSt6thread6_StateELb0EE7_M_headERKS3_", scope: !371, file: !258, line: 236, type: !401, scopeLine: 236, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!401 = !DISubroutineType(types: !402)
!402 = !{!381, !386}
!403 = !{!404, !405, !406}
!404 = !DITemplateValueParameter(name: "_Idx", type: !194, value: i64 0)
!405 = !DITemplateTypeParameter(name: "_Head", type: !281)
!406 = !DITemplateValueParameter(type: !108, defaulted: true, value: i8 0)
!407 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_headERS5_", scope: !261, file: !258, line: 268, type: !408, scopeLine: 268, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!408 = !DISubroutineType(types: !409)
!409 = !{!398, !410}
!410 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !261, size: 64)
!411 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_headERKS5_", scope: !261, file: !258, line: 271, type: !412, scopeLine: 271, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!412 = !DISubroutineType(types: !413)
!413 = !{!381, !414}
!414 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !415, size: 64)
!415 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !261)
!416 = !DISubprogram(name: "_M_tail", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_tailERS5_", scope: !261, file: !258, line: 274, type: !417, scopeLine: 274, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!417 = !DISubroutineType(types: !418)
!418 = !{!419, !410}
!419 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !420, size: 64)
!420 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Inherited", scope: !261, file: !258, line: 264, baseType: !264)
!421 = !DISubprogram(name: "_M_tail", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_tailERKS5_", scope: !261, file: !258, line: 277, type: !422, scopeLine: 277, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!422 = !DISubroutineType(types: !423)
!423 = !{!424, !414}
!424 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !425, size: 64)
!425 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !420)
!426 = !DISubprogram(name: "_Tuple_impl", scope: !261, file: !258, line: 279, type: !427, scopeLine: 279, flags: DIFlagPrototyped, spFlags: 0)
!427 = !DISubroutineType(types: !428)
!428 = !{null, !429}
!429 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !261, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!430 = !DISubprogram(name: "_Tuple_impl", scope: !261, file: !258, line: 283, type: !431, scopeLine: 283, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!431 = !DISubroutineType(types: !432)
!432 = !{null, !429, !381, !292}
!433 = !DISubprogram(name: "_Tuple_impl", scope: !261, file: !258, line: 295, type: !434, scopeLine: 295, flags: DIFlagPrototyped, spFlags: 0)
!434 = !DISubroutineType(types: !435)
!435 = !{null, !429, !414}
!436 = !DISubprogram(name: "operator=", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEEaSERKS5_", scope: !261, file: !258, line: 299, type: !437, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDeleted)
!437 = !DISubroutineType(types: !438)
!438 = !{!410, !429, !414}
!439 = !DISubprogram(name: "_Tuple_impl", scope: !261, file: !258, line: 301, type: !440, scopeLine: 301, flags: DIFlagPrototyped, spFlags: 0)
!440 = !DISubroutineType(types: !441)
!441 = !{null, !429, !442}
!442 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !261, size: 64)
!443 = !DISubprogram(name: "_M_swap", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_swapERS5_", scope: !261, file: !258, line: 406, type: !444, scopeLine: 406, flags: DIFlagProtected | DIFlagPrototyped, spFlags: 0)
!444 = !DISubroutineType(types: !445)
!445 = !{null, !429, !410}
!446 = !{!404, !447}
!447 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Elements", value: !448)
!448 = !{!449, !369}
!449 = !DITemplateTypeParameter(type: !281)
!450 = !DISubprogram(name: "__nothrow_default_constructible", linkageName: "_ZNSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEE31__nothrow_default_constructibleEv", scope: !257, file: !258, line: 1035, type: !451, scopeLine: 1035, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!451 = !DISubroutineType(types: !452)
!452 = !{!108}
!453 = !DISubprogram(name: "tuple", scope: !257, file: !258, line: 1088, type: !454, scopeLine: 1088, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!454 = !DISubroutineType(types: !455)
!455 = !{null, !456, !457}
!456 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !257, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!457 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !458, size: 64)
!458 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !257)
!459 = !DISubprogram(name: "tuple", scope: !257, file: !258, line: 1090, type: !460, scopeLine: 1090, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!460 = !DISubroutineType(types: !461)
!461 = !{null, !456, !462}
!462 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !257, size: 64)
!463 = !DISubprogram(name: "operator=", linkageName: "_ZNSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEEaSERKS5_", scope: !257, file: !258, line: 1267, type: !464, scopeLine: 1267, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!464 = !DISubroutineType(types: !465)
!465 = !{!466, !456, !467}
!466 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !257, size: 64)
!467 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !469, file: !468, line: 2221, baseType: !457)
!468 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits", directory: "")
!469 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "conditional<true, const std::tuple<std::thread::_State *, std::default_delete<std::thread::_State> > &, const std::__nonesuch &>", scope: !2, file: !468, line: 2220, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !470, identifier: "_ZTSSt11conditionalILb1ERKSt5tupleIJPNSt6thread6_StateESt14default_deleteIS2_EEERKSt10__nonesuchE")
!470 = !{!471, !472, !473}
!471 = !DITemplateValueParameter(name: "_Cond", type: !108, value: i8 1)
!472 = !DITemplateTypeParameter(name: "_Iftrue", type: !457)
!473 = !DITemplateTypeParameter(name: "_Iffalse", type: !474)
!474 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !475, size: 64)
!475 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !476)
!476 = !DICompositeType(tag: DW_TAG_structure_type, name: "__nonesuch", scope: !2, file: !468, line: 2991, size: 8, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt10__nonesuch")
!477 = !DISubprogram(name: "operator=", linkageName: "_ZNSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEEaSEOS5_", scope: !257, file: !258, line: 1278, type: !478, scopeLine: 1278, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!478 = !DISubroutineType(types: !479)
!479 = !{!466, !456, !480}
!480 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !481, file: !468, line: 2221, baseType: !462)
!481 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "conditional<true, std::tuple<std::thread::_State *, std::default_delete<std::thread::_State> > &&, std::__nonesuch &&>", scope: !2, file: !468, line: 2220, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !482, identifier: "_ZTSSt11conditionalILb1EOSt5tupleIJPNSt6thread6_StateESt14default_deleteIS2_EEEOSt10__nonesuchE")
!482 = !{!471, !483, !484}
!483 = !DITemplateTypeParameter(name: "_Iftrue", type: !462)
!484 = !DITemplateTypeParameter(name: "_Iffalse", type: !485)
!485 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !476, size: 64)
!486 = !DISubprogram(name: "swap", linkageName: "_ZNSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEE4swapERS5_", scope: !257, file: !258, line: 1331, type: !487, scopeLine: 1331, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!487 = !DISubroutineType(types: !488)
!488 = !{null, !456, !466}
!489 = !{!447}
!490 = !DISubprogram(name: "__uniq_ptr_impl", scope: !254, file: !248, line: 154, type: !491, scopeLine: 154, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!491 = !DISubroutineType(types: !492)
!492 = !{null, !493}
!493 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !254, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!494 = !DISubprogram(name: "__uniq_ptr_impl", scope: !254, file: !248, line: 155, type: !495, scopeLine: 155, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!495 = !DISubroutineType(types: !496)
!496 = !{null, !493, !497}
!497 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !254, file: !248, line: 148, baseType: !498, flags: DIFlagPublic)
!498 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !499, file: !248, line: 133, baseType: !281)
!499 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Ptr<std::thread::_State, std::default_delete<std::thread::_State>, void>", scope: !254, file: !248, line: 131, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !500, identifier: "_ZTSNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE4_PtrIS1_S3_vEE")
!500 = !{!501, !502, !503}
!501 = !DITemplateTypeParameter(name: "_Up", type: !282)
!502 = !DITemplateTypeParameter(name: "_Ep", type: !270)
!503 = !DITemplateTypeParameter(type: null, defaulted: true)
!504 = !DISubprogram(name: "__uniq_ptr_impl", scope: !254, file: !248, line: 161, type: !505, scopeLine: 161, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!505 = !DISubroutineType(types: !506)
!506 = !{null, !493, !507}
!507 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !254, size: 64)
!508 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EEaSEOS4_", scope: !254, file: !248, line: 165, type: !509, scopeLine: 165, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!509 = !DISubroutineType(types: !510)
!510 = !{!511, !493, !507}
!511 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !254, size: 64)
!512 = !DISubprogram(name: "_M_ptr", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE6_M_ptrEv", scope: !254, file: !248, line: 172, type: !513, scopeLine: 172, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!513 = !DISubroutineType(types: !514)
!514 = !{!515, !493}
!515 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !497, size: 64)
!516 = !DISubprogram(name: "_M_ptr", linkageName: "_ZNKSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE6_M_ptrEv", scope: !254, file: !248, line: 173, type: !517, scopeLine: 173, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!517 = !DISubroutineType(types: !518)
!518 = !{!497, !519}
!519 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !520, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!520 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !254)
!521 = !DISubprogram(name: "_M_deleter", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE10_M_deleterEv", scope: !254, file: !248, line: 174, type: !522, scopeLine: 174, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!522 = !DISubroutineType(types: !523)
!523 = !{!328, !493}
!524 = !DISubprogram(name: "_M_deleter", linkageName: "_ZNKSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE10_M_deleterEv", scope: !254, file: !248, line: 175, type: !525, scopeLine: 175, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!525 = !DISubroutineType(types: !526)
!526 = !{!292, !519}
!527 = !DISubprogram(name: "reset", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE5resetEPS1_", scope: !254, file: !248, line: 177, type: !495, scopeLine: 177, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!528 = !DISubprogram(name: "release", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE7releaseEv", scope: !254, file: !248, line: 185, type: !529, scopeLine: 185, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!529 = !DISubroutineType(types: !530)
!530 = !{!497, !493}
!531 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE4swapERS4_", scope: !254, file: !248, line: 193, type: !532, scopeLine: 193, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!532 = !DISubroutineType(types: !533)
!533 = !{null, !493, !511}
!534 = !{!284, !535}
!535 = !DITemplateTypeParameter(name: "_Dp", type: !270)
!536 = !DISubprogram(name: "__uniq_ptr_data", scope: !251, file: !248, line: 211, type: !537, scopeLine: 211, flags: DIFlagPrototyped, spFlags: 0)
!537 = !DISubroutineType(types: !538)
!538 = !{null, !539, !540}
!539 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !251, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!540 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !251, size: 64)
!541 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__uniq_ptr_dataINSt6thread6_StateESt14default_deleteIS1_ELb1ELb1EEaSEOS4_", scope: !251, file: !248, line: 212, type: !542, scopeLine: 212, flags: DIFlagPrototyped, spFlags: 0)
!542 = !DISubroutineType(types: !543)
!543 = !{!544, !539, !540}
!544 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !251, size: 64)
!545 = !{!284, !535, !336, !336}
!546 = !DISubprogram(name: "unique_ptr", scope: !247, file: !248, line: 327, type: !547, scopeLine: 327, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!547 = !DISubroutineType(types: !548)
!548 = !{null, !549, !550}
!549 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!550 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !247, size: 64)
!551 = !DISubprogram(name: "~unique_ptr", scope: !247, file: !248, line: 355, type: !552, scopeLine: 355, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!552 = !DISubroutineType(types: !553)
!553 = !{null, !549}
!554 = !DISubprogram(name: "operator=", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEaSEOS4_", scope: !247, file: !248, line: 371, type: !555, scopeLine: 371, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!555 = !DISubroutineType(types: !556)
!556 = !{!557, !549, !550}
!557 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !247, size: 64)
!558 = !DISubprogram(name: "operator=", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEaSEDn", scope: !247, file: !248, line: 395, type: !559, scopeLine: 395, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!559 = !DISubroutineType(types: !560)
!560 = !{!557, !549, !561}
!561 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !2, file: !562, line: 284, baseType: !563)
!562 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++config.h", directory: "", checksumkind: CSK_MD5, checksum: "b09addf8bea7ac9bf251a76b15f26064")
!563 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!564 = !DISubprogram(name: "operator*", linkageName: "_ZNKSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEdeEv", scope: !247, file: !248, line: 405, type: !565, scopeLine: 405, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!565 = !DISubroutineType(types: !566)
!566 = !{!567, !571}
!567 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !568, file: !468, line: 1614, baseType: !570)
!568 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__add_lvalue_reference_helper<std::thread::_State, true>", scope: !2, file: !468, line: 1613, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !569, identifier: "_ZTSSt29__add_lvalue_reference_helperINSt6thread6_StateELb1EE")
!569 = !{!284, !336}
!570 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !282, size: 64)
!571 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !572, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!572 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !247)
!573 = !DISubprogram(name: "operator->", linkageName: "_ZNKSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEptEv", scope: !247, file: !248, line: 413, type: !574, scopeLine: 413, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!574 = !DISubroutineType(types: !575)
!575 = !{!576, !571}
!576 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !247, file: !248, line: 251, baseType: !497, flags: DIFlagPublic)
!577 = !DISubprogram(name: "get", linkageName: "_ZNKSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE3getEv", scope: !247, file: !248, line: 421, type: !574, scopeLine: 421, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!578 = !DISubprogram(name: "get_deleter", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE11get_deleterEv", scope: !247, file: !248, line: 426, type: !579, scopeLine: 426, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!579 = !DISubroutineType(types: !580)
!580 = !{!581, !549}
!581 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !582, size: 64)
!582 = !DIDerivedType(tag: DW_TAG_typedef, name: "deleter_type", scope: !247, file: !248, line: 253, baseType: !270, flags: DIFlagPublic)
!583 = !DISubprogram(name: "get_deleter", linkageName: "_ZNKSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE11get_deleterEv", scope: !247, file: !248, line: 431, type: !584, scopeLine: 431, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!584 = !DISubroutineType(types: !585)
!585 = !{!586, !571}
!586 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !587, size: 64)
!587 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !582)
!588 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEcvbEv", scope: !247, file: !248, line: 435, type: !589, scopeLine: 435, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!589 = !DISubroutineType(types: !590)
!590 = !{!108, !571}
!591 = !DISubprogram(name: "release", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE7releaseEv", scope: !247, file: !248, line: 442, type: !592, scopeLine: 442, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!592 = !DISubroutineType(types: !593)
!593 = !{!576, !549}
!594 = !DISubprogram(name: "reset", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE5resetEPS1_", scope: !247, file: !248, line: 452, type: !595, scopeLine: 452, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!595 = !DISubroutineType(types: !596)
!596 = !{null, !549, !576}
!597 = !DISubprogram(name: "swap", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE4swapERS4_", scope: !247, file: !248, line: 461, type: !598, scopeLine: 461, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!598 = !DISubroutineType(types: !599)
!599 = !{null, !549, !557}
!600 = !DISubprogram(name: "unique_ptr", scope: !247, file: !248, line: 468, type: !601, scopeLine: 468, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!601 = !DISubroutineType(types: !602)
!602 = !{null, !549, !603}
!603 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !572, size: 64)
!604 = !DISubprogram(name: "operator=", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEaSERKS4_", scope: !247, file: !248, line: 469, type: !605, scopeLine: 469, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagDeleted)
!605 = !DISubroutineType(types: !606)
!606 = !{!557, !549, !603}
!607 = !{!284, !608}
!608 = !DITemplateTypeParameter(name: "_Dp", type: !270, defaulted: true)
!609 = !DIDerivedType(tag: DW_TAG_typedef, name: "__tag", scope: !611, file: !610, line: 95, baseType: !628)
!610 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/invoke.h", directory: "")
!611 = distinct !DISubprogram(name: "__invoke<void (*)(unsigned long), int>", linkageName: "_ZSt8__invokeIPFvmEJiEENSt15__invoke_resultIT_JDpT0_EE4typeEOS3_DpOS4_", scope: !2, file: !610, line: 90, type: !612, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !623, retainedNodes: !109)
!612 = !DISubroutineType(types: !613)
!613 = !{!614, !618, !622}
!614 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !615, file: !468, line: 248, baseType: null)
!615 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__success_type<void>", scope: !2, file: !468, line: 247, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !616, identifier: "_ZTSSt14__success_typeIvE")
!616 = !{!617}
!617 = !DITemplateTypeParameter(name: "_Tp", type: null)
!618 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !619, size: 64)
!619 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !620, size: 64)
!620 = !DISubroutineType(types: !621)
!621 = !{null, !194}
!622 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !72, size: 64)
!623 = !{!624, !625}
!624 = !DITemplateTypeParameter(name: "_Callable", type: !619)
!625 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Args", value: !626)
!626 = !{!627}
!627 = !DITemplateTypeParameter(type: !72)
!628 = !DIDerivedType(tag: DW_TAG_typedef, name: "__invoke_type", scope: !629, file: !468, line: 2383, baseType: !634)
!629 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__result_of_success<void, std::__invoke_other>", scope: !2, file: !468, line: 2382, size: 8, flags: DIFlagTypePassByValue, elements: !630, templateParams: !632, identifier: "_ZTSSt19__result_of_successIvSt14__invoke_otherE")
!630 = !{!631}
!631 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !629, baseType: !615, extraData: i32 0)
!632 = !{!617, !633}
!633 = !DITemplateTypeParameter(name: "_Tag", type: !634)
!634 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__invoke_other", scope: !2, file: !468, line: 2378, size: 8, flags: DIFlagTypePassByValue, elements: !109, identifier: "_ZTSSt14__invoke_other")
!635 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "atomic_flag", scope: !2, file: !13, line: 196, size: 8, flags: DIFlagTypePassByReference, elements: !636, identifier: "_ZTSSt11atomic_flag")
!636 = !{!637, !642, !646, !647, !652, !656, !661, !664, !667, !670, !673, !676}
!637 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !635, baseType: !638, extraData: i32 0)
!638 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__atomic_flag_base", file: !13, line: 186, size: 8, flags: DIFlagTypePassByValue, elements: !639, identifier: "_ZTSSt18__atomic_flag_base")
!639 = !{!640}
!640 = !DIDerivedType(tag: DW_TAG_member, name: "_M_i", scope: !638, file: !13, line: 188, baseType: !641, size: 8)
!641 = !DIDerivedType(tag: DW_TAG_typedef, name: "__atomic_flag_data_type", scope: !2, file: !13, line: 169, baseType: !108)
!642 = !DISubprogram(name: "atomic_flag", scope: !635, file: !13, line: 198, type: !643, scopeLine: 198, flags: DIFlagPrototyped, spFlags: 0)
!643 = !DISubroutineType(types: !644)
!644 = !{null, !645}
!645 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !635, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!646 = !DISubprogram(name: "~atomic_flag", scope: !635, file: !13, line: 199, type: !643, scopeLine: 199, flags: DIFlagPrototyped, spFlags: 0)
!647 = !DISubprogram(name: "atomic_flag", scope: !635, file: !13, line: 200, type: !648, scopeLine: 200, flags: DIFlagPrototyped, spFlags: DISPFlagDeleted)
!648 = !DISubroutineType(types: !649)
!649 = !{null, !645, !650}
!650 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !651, size: 64)
!651 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !635)
!652 = !DISubprogram(name: "operator=", linkageName: "_ZNSt11atomic_flagaSERKS_", scope: !635, file: !13, line: 201, type: !653, scopeLine: 201, flags: DIFlagPrototyped, spFlags: DISPFlagDeleted)
!653 = !DISubroutineType(types: !654)
!654 = !{!655, !645, !650}
!655 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !635, size: 64)
!656 = !DISubprogram(name: "operator=", linkageName: "_ZNVSt11atomic_flagaSERKS_", scope: !635, file: !13, line: 202, type: !657, scopeLine: 202, flags: DIFlagPrototyped, spFlags: DISPFlagDeleted)
!657 = !DISubroutineType(types: !658)
!658 = !{!655, !659, !650}
!659 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !660, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!660 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !635)
!661 = !DISubprogram(name: "atomic_flag", scope: !635, file: !13, line: 205, type: !662, scopeLine: 205, flags: DIFlagPrototyped, spFlags: 0)
!662 = !DISubroutineType(types: !663)
!663 = !{null, !645, !108}
!664 = !DISubprogram(name: "test_and_set", linkageName: "_ZNSt11atomic_flag12test_and_setESt12memory_order", scope: !635, file: !13, line: 210, type: !665, scopeLine: 210, flags: DIFlagPrototyped, spFlags: 0)
!665 = !DISubroutineType(types: !666)
!666 = !{!108, !645, !100}
!667 = !DISubprogram(name: "test_and_set", linkageName: "_ZNVSt11atomic_flag12test_and_setESt12memory_order", scope: !635, file: !13, line: 216, type: !668, scopeLine: 216, flags: DIFlagPrototyped, spFlags: 0)
!668 = !DISubroutineType(types: !669)
!669 = !{!108, !659, !100}
!670 = !DISubprogram(name: "clear", linkageName: "_ZNSt11atomic_flag5clearESt12memory_order", scope: !635, file: !13, line: 269, type: !671, scopeLine: 269, flags: DIFlagPrototyped, spFlags: 0)
!671 = !DISubroutineType(types: !672)
!672 = !{null, !645, !100}
!673 = !DISubprogram(name: "clear", linkageName: "_ZNVSt11atomic_flag5clearESt12memory_order", scope: !635, file: !13, line: 281, type: !674, scopeLine: 281, flags: DIFlagPrototyped, spFlags: 0)
!674 = !DISubroutineType(types: !675)
!675 = !{null, !659, !100}
!676 = !DISubprogram(name: "_S_init", linkageName: "_ZNSt11atomic_flag7_S_initEb", scope: !635, file: !13, line: 294, type: !677, scopeLine: 294, flags: DIFlagPrivate | DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!677 = !DISubroutineType(types: !678)
!678 = !{!641, !108}
!679 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ratio<1000000000L, 1L>", scope: !2, file: !92, line: 266, size: 8, flags: DIFlagTypePassByValue, elements: !680, templateParams: !683, identifier: "_ZTSSt5ratioILl1000000000ELl1EE")
!680 = !{!681, !682}
!681 = !DIDerivedType(tag: DW_TAG_variable, name: "num", scope: !679, file: !92, line: 273, baseType: !95, flags: DIFlagStaticMember, extraData: i64 1000000000)
!682 = !DIDerivedType(tag: DW_TAG_variable, name: "den", scope: !679, file: !92, line: 276, baseType: !95, flags: DIFlagStaticMember, extraData: i64 1)
!683 = !{!684, !99}
!684 = !DITemplateValueParameter(name: "_Num", type: !36, value: i64 1000000000)
!685 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Head_base<1UL, int, false>", scope: !2, file: !258, line: 187, size: 32, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !686, templateParams: !717, identifier: "_ZTSSt10_Head_baseILm1EiLb0EE")
!686 = !{!687, !688, !692, !697, !702, !706, !709, !714}
!687 = !DIDerivedType(tag: DW_TAG_member, name: "_M_head_impl", scope: !685, file: !258, line: 238, baseType: !72, size: 32)
!688 = !DISubprogram(name: "_Head_base", scope: !685, file: !258, line: 189, type: !689, scopeLine: 189, flags: DIFlagPrototyped, spFlags: 0)
!689 = !DISubroutineType(types: !690)
!690 = !{null, !691}
!691 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !685, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!692 = !DISubprogram(name: "_Head_base", scope: !685, file: !258, line: 192, type: !693, scopeLine: 192, flags: DIFlagPrototyped, spFlags: 0)
!693 = !DISubroutineType(types: !694)
!694 = !{null, !691, !695}
!695 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !696, size: 64)
!696 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !72)
!697 = !DISubprogram(name: "_Head_base", scope: !685, file: !258, line: 195, type: !698, scopeLine: 195, flags: DIFlagPrototyped, spFlags: 0)
!698 = !DISubroutineType(types: !699)
!699 = !{null, !691, !700}
!700 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !701, size: 64)
!701 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !685)
!702 = !DISubprogram(name: "_Head_base", scope: !685, file: !258, line: 196, type: !703, scopeLine: 196, flags: DIFlagPrototyped, spFlags: 0)
!703 = !DISubroutineType(types: !704)
!704 = !{null, !691, !705}
!705 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !685, size: 64)
!706 = !DISubprogram(name: "_Head_base", scope: !685, file: !258, line: 203, type: !707, scopeLine: 203, flags: DIFlagPrototyped, spFlags: 0)
!707 = !DISubroutineType(types: !708)
!708 = !{null, !691, !305, !312}
!709 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm1EiLb0EE7_M_headERS0_", scope: !685, file: !258, line: 233, type: !710, scopeLine: 233, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!710 = !DISubroutineType(types: !711)
!711 = !{!712, !713}
!712 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !72, size: 64)
!713 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !685, size: 64)
!714 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm1EiLb0EE7_M_headERKS0_", scope: !685, file: !258, line: 236, type: !715, scopeLine: 236, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!715 = !DISubroutineType(types: !716)
!716 = !{!695, !700}
!717 = !{!334, !718, !406}
!718 = !DITemplateTypeParameter(name: "_Head", type: !72)
!719 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Tuple_impl<1UL, int>", scope: !2, file: !258, line: 416, size: 32, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !720, templateParams: !751, identifier: "_ZTSSt11_Tuple_implILm1EJiEE")
!720 = !{!721, !722, !726, !731, !735, !738, !741, !744, !748}
!721 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !719, baseType: !685, flags: DIFlagPrivate, extraData: i32 0)
!722 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm1EJiEE7_M_headERS0_", scope: !719, file: !258, line: 424, type: !723, scopeLine: 424, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!723 = !DISubroutineType(types: !724)
!724 = !{!712, !725}
!725 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !719, size: 64)
!726 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm1EJiEE7_M_headERKS0_", scope: !719, file: !258, line: 427, type: !727, scopeLine: 427, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!727 = !DISubroutineType(types: !728)
!728 = !{!695, !729}
!729 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !730, size: 64)
!730 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !719)
!731 = !DISubprogram(name: "_Tuple_impl", scope: !719, file: !258, line: 430, type: !732, scopeLine: 430, flags: DIFlagPrototyped, spFlags: 0)
!732 = !DISubroutineType(types: !733)
!733 = !{null, !734}
!734 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !719, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!735 = !DISubprogram(name: "_Tuple_impl", scope: !719, file: !258, line: 434, type: !736, scopeLine: 434, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!736 = !DISubroutineType(types: !737)
!737 = !{null, !734, !695}
!738 = !DISubprogram(name: "_Tuple_impl", scope: !719, file: !258, line: 444, type: !739, scopeLine: 444, flags: DIFlagPrototyped, spFlags: 0)
!739 = !DISubroutineType(types: !740)
!740 = !{null, !734, !729}
!741 = !DISubprogram(name: "operator=", linkageName: "_ZNSt11_Tuple_implILm1EJiEEaSERKS0_", scope: !719, file: !258, line: 448, type: !742, scopeLine: 448, flags: DIFlagPrototyped, spFlags: DISPFlagDeleted)
!742 = !DISubroutineType(types: !743)
!743 = !{!725, !734, !729}
!744 = !DISubprogram(name: "_Tuple_impl", scope: !719, file: !258, line: 454, type: !745, scopeLine: 454, flags: DIFlagPrototyped, spFlags: 0)
!745 = !DISubroutineType(types: !746)
!746 = !{null, !734, !747}
!747 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !719, size: 64)
!748 = !DISubprogram(name: "_M_swap", linkageName: "_ZNSt11_Tuple_implILm1EJiEE7_M_swapERS0_", scope: !719, file: !258, line: 544, type: !749, scopeLine: 544, flags: DIFlagProtected | DIFlagPrototyped, spFlags: 0)
!749 = !DISubroutineType(types: !750)
!750 = !{null, !734, !725}
!751 = !{!334, !752}
!752 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Elements", value: !626)
!753 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Head_base<0UL, void (*)(unsigned long), false>", scope: !2, file: !258, line: 187, size: 64, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !754, templateParams: !785, identifier: "_ZTSSt10_Head_baseILm0EPFvmELb0EE")
!754 = !{!755, !756, !760, !765, !770, !774, !777, !782}
!755 = !DIDerivedType(tag: DW_TAG_member, name: "_M_head_impl", scope: !753, file: !258, line: 238, baseType: !619, size: 64)
!756 = !DISubprogram(name: "_Head_base", scope: !753, file: !258, line: 189, type: !757, scopeLine: 189, flags: DIFlagPrototyped, spFlags: 0)
!757 = !DISubroutineType(types: !758)
!758 = !{null, !759}
!759 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !753, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!760 = !DISubprogram(name: "_Head_base", scope: !753, file: !258, line: 192, type: !761, scopeLine: 192, flags: DIFlagPrototyped, spFlags: 0)
!761 = !DISubroutineType(types: !762)
!762 = !{null, !759, !763}
!763 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !764, size: 64)
!764 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !619)
!765 = !DISubprogram(name: "_Head_base", scope: !753, file: !258, line: 195, type: !766, scopeLine: 195, flags: DIFlagPrototyped, spFlags: 0)
!766 = !DISubroutineType(types: !767)
!767 = !{null, !759, !768}
!768 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !769, size: 64)
!769 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !753)
!770 = !DISubprogram(name: "_Head_base", scope: !753, file: !258, line: 196, type: !771, scopeLine: 196, flags: DIFlagPrototyped, spFlags: 0)
!771 = !DISubroutineType(types: !772)
!772 = !{null, !759, !773}
!773 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !753, size: 64)
!774 = !DISubprogram(name: "_Head_base", scope: !753, file: !258, line: 203, type: !775, scopeLine: 203, flags: DIFlagPrototyped, spFlags: 0)
!775 = !DISubroutineType(types: !776)
!776 = !{null, !759, !305, !312}
!777 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm0EPFvmELb0EE7_M_headERS2_", scope: !753, file: !258, line: 233, type: !778, scopeLine: 233, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!778 = !DISubroutineType(types: !779)
!779 = !{!780, !781}
!780 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !619, size: 64)
!781 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !753, size: 64)
!782 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm0EPFvmELb0EE7_M_headERKS2_", scope: !753, file: !258, line: 236, type: !783, scopeLine: 236, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!783 = !DISubroutineType(types: !784)
!784 = !{!763, !768}
!785 = !{!404, !786, !406}
!786 = !DITemplateTypeParameter(name: "_Head", type: !619)
!787 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Tuple_impl<0UL, void (*)(unsigned long), int>", scope: !2, file: !258, line: 258, size: 128, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !788, templateParams: !830, identifier: "_ZTSSt11_Tuple_implILm0EJPFvmEiEE")
!788 = !{!789, !790, !791, !795, !800, !805, !810, !814, !817, !820, !823, !827}
!789 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !787, baseType: !719, extraData: i32 0)
!790 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !787, baseType: !753, offset: 64, flags: DIFlagPrivate, extraData: i32 0)
!791 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_headERS2_", scope: !787, file: !258, line: 268, type: !792, scopeLine: 268, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!792 = !DISubroutineType(types: !793)
!793 = !{!780, !794}
!794 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !787, size: 64)
!795 = !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_headERKS2_", scope: !787, file: !258, line: 271, type: !796, scopeLine: 271, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!796 = !DISubroutineType(types: !797)
!797 = !{!763, !798}
!798 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !799, size: 64)
!799 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !787)
!800 = !DISubprogram(name: "_M_tail", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_tailERS2_", scope: !787, file: !258, line: 274, type: !801, scopeLine: 274, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!801 = !DISubroutineType(types: !802)
!802 = !{!803, !794}
!803 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !804, size: 64)
!804 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Inherited", scope: !787, file: !258, line: 264, baseType: !719)
!805 = !DISubprogram(name: "_M_tail", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_tailERKS2_", scope: !787, file: !258, line: 277, type: !806, scopeLine: 277, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!806 = !DISubroutineType(types: !807)
!807 = !{!808, !798}
!808 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !809, size: 64)
!809 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !804)
!810 = !DISubprogram(name: "_Tuple_impl", scope: !787, file: !258, line: 279, type: !811, scopeLine: 279, flags: DIFlagPrototyped, spFlags: 0)
!811 = !DISubroutineType(types: !812)
!812 = !{null, !813}
!813 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !787, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!814 = !DISubprogram(name: "_Tuple_impl", scope: !787, file: !258, line: 283, type: !815, scopeLine: 283, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!815 = !DISubroutineType(types: !816)
!816 = !{null, !813, !763, !695}
!817 = !DISubprogram(name: "_Tuple_impl", scope: !787, file: !258, line: 295, type: !818, scopeLine: 295, flags: DIFlagPrototyped, spFlags: 0)
!818 = !DISubroutineType(types: !819)
!819 = !{null, !813, !798}
!820 = !DISubprogram(name: "operator=", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEEaSERKS2_", scope: !787, file: !258, line: 299, type: !821, scopeLine: 299, flags: DIFlagPrototyped, spFlags: DISPFlagDeleted)
!821 = !DISubroutineType(types: !822)
!822 = !{!794, !813, !798}
!823 = !DISubprogram(name: "_Tuple_impl", scope: !787, file: !258, line: 301, type: !824, scopeLine: 301, flags: DIFlagPrototyped, spFlags: 0)
!824 = !DISubroutineType(types: !825)
!825 = !{null, !813, !826}
!826 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !787, size: 64)
!827 = !DISubprogram(name: "_M_swap", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_swapERS2_", scope: !787, file: !258, line: 406, type: !828, scopeLine: 406, flags: DIFlagProtected | DIFlagPrototyped, spFlags: 0)
!828 = !DISubroutineType(types: !829)
!829 = !{null, !813, !794}
!830 = !{!404, !831}
!831 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Elements", value: !832)
!832 = !{!833, !627}
!833 = !DITemplateTypeParameter(type: !619)
!834 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "tuple<void (*)(unsigned long), int>", scope: !2, file: !258, line: 981, size: 128, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !835, templateParams: !866, identifier: "_ZTSSt5tupleIJPFvmEiEE")
!835 = !{!836, !837, !838, !844, !848, !856, !863}
!836 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !834, baseType: !787, flags: DIFlagPublic, extraData: i32 0)
!837 = !DISubprogram(name: "__nothrow_default_constructible", linkageName: "_ZNSt5tupleIJPFvmEiEE31__nothrow_default_constructibleEv", scope: !834, file: !258, line: 1035, type: !451, scopeLine: 1035, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!838 = !DISubprogram(name: "tuple", scope: !834, file: !258, line: 1088, type: !839, scopeLine: 1088, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!839 = !DISubroutineType(types: !840)
!840 = !{null, !841, !842}
!841 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !834, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!842 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !843, size: 64)
!843 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !834)
!844 = !DISubprogram(name: "tuple", scope: !834, file: !258, line: 1090, type: !845, scopeLine: 1090, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!845 = !DISubroutineType(types: !846)
!846 = !{null, !841, !847}
!847 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !834, size: 64)
!848 = !DISubprogram(name: "operator=", linkageName: "_ZNSt5tupleIJPFvmEiEEaSERKS2_", scope: !834, file: !258, line: 1267, type: !849, scopeLine: 1267, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!849 = !DISubroutineType(types: !850)
!850 = !{!851, !841, !852}
!851 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !834, size: 64)
!852 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !853, file: !468, line: 2221, baseType: !842)
!853 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "conditional<true, const std::tuple<void (*)(unsigned long), int> &, const std::__nonesuch &>", scope: !2, file: !468, line: 2220, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !854, identifier: "_ZTSSt11conditionalILb1ERKSt5tupleIJPFvmEiEERKSt10__nonesuchE")
!854 = !{!471, !855, !473}
!855 = !DITemplateTypeParameter(name: "_Iftrue", type: !842)
!856 = !DISubprogram(name: "operator=", linkageName: "_ZNSt5tupleIJPFvmEiEEaSEOS2_", scope: !834, file: !258, line: 1278, type: !857, scopeLine: 1278, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!857 = !DISubroutineType(types: !858)
!858 = !{!851, !841, !859}
!859 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !860, file: !468, line: 2221, baseType: !847)
!860 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "conditional<true, std::tuple<void (*)(unsigned long), int> &&, std::__nonesuch &&>", scope: !2, file: !468, line: 2220, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !861, identifier: "_ZTSSt11conditionalILb1EOSt5tupleIJPFvmEiEEOSt10__nonesuchE")
!861 = !{!471, !862, !484}
!862 = !DITemplateTypeParameter(name: "_Iftrue", type: !847)
!863 = !DISubprogram(name: "swap", linkageName: "_ZNSt5tupleIJPFvmEiEE4swapERS2_", scope: !834, file: !258, line: 1331, type: !864, scopeLine: 1331, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!864 = !DISubroutineType(types: !865)
!865 = !{null, !841, !851}
!866 = !{!831}
!867 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Invoker<std::tuple<void (*)(unsigned long), int> >", scope: !183, file: !182, line: 239, size: 128, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !868, templateParams: !874, identifier: "_ZTSNSt6thread8_InvokerISt5tupleIJPFvmEiEEEE")
!868 = !{!869, !870}
!869 = !DIDerivedType(tag: DW_TAG_member, name: "_M_t", scope: !867, file: !182, line: 247, baseType: !834, size: 128)
!870 = !DISubprogram(name: "operator()", linkageName: "_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEEclEv", scope: !867, file: !182, line: 262, type: !871, scopeLine: 262, flags: DIFlagPrototyped, spFlags: 0)
!871 = !DISubroutineType(types: !872)
!872 = !{!614, !873}
!873 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !867, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!874 = !{!875}
!875 = !DITemplateTypeParameter(name: "_Tuple", type: !834)
!876 = !{!0, !7, !877, !885, !890, !895}
!877 = !DIGlobalVariableExpression(var: !878, expr: !DIExpression())
!878 = distinct !DIGlobalVariable(scope: null, file: !879, line: 12, type: !880, isLocal: true, isDefinition: true)
!879 = !DIFile(filename: "sequential.cpp", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/Huron/atomic_lock", checksumkind: CSK_MD5, checksum: "b1bb097e2fe98c2e353904317650680b")
!880 = !DICompositeType(tag: DW_TAG_array_type, baseType: !881, size: 128, elements: !883)
!881 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !882)
!882 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!883 = !{!884}
!884 = !DISubrange(count: 16)
!885 = !DIGlobalVariableExpression(var: !886, expr: !DIExpression())
!886 = distinct !DIGlobalVariable(scope: null, file: !879, line: 12, type: !887, isLocal: true, isDefinition: true)
!887 = !DICompositeType(tag: DW_TAG_array_type, baseType: !881, size: 208, elements: !888)
!888 = !{!889}
!889 = !DISubrange(count: 26)
!890 = !DIGlobalVariableExpression(var: !891, expr: !DIExpression())
!891 = distinct !DIGlobalVariable(scope: null, file: !879, line: 14, type: !892, isLocal: true, isDefinition: true)
!892 = !DICompositeType(tag: DW_TAG_array_type, baseType: !881, size: 64, elements: !893)
!893 = !{!894}
!894 = !DISubrange(count: 8)
!895 = !DIGlobalVariableExpression(var: !896, expr: !DIExpression())
!896 = distinct !DIGlobalVariable(scope: null, file: !879, line: 14, type: !897, isLocal: true, isDefinition: true)
!897 = !DICompositeType(tag: DW_TAG_array_type, baseType: !881, size: 120, elements: !898)
!898 = !{!899}
!899 = !DISubrange(count: 15)
!900 = !{!901, !918, !921, !926, !934, !942, !946, !953, !957, !961, !963, !965, !969, !979, !983, !989, !995, !997, !1001, !1005, !1009, !1013, !1025, !1027, !1031, !1035, !1039, !1041, !1047, !1051, !1055, !1057, !1059, !1063, !1071, !1075, !1079, !1083, !1085, !1091, !1093, !1100, !1105, !1109, !1113, !1117, !1121, !1125, !1127, !1129, !1133, !1137, !1141, !1143, !1147, !1151, !1153, !1155, !1159, !1165, !1170, !1175, !1176, !1177, !1178, !1179, !1180, !1181, !1182, !1183, !1184, !1185, !1189, !1193, !1197, !1203, !1207, !1210, !1213, !1215, !1217, !1219, !1221, !1224, !1227, !1230, !1233, !1234, !1236, !1241, !1245, !1248, !1251, !1253, !1255, !1257, !1259, !1262, !1265, !1268, !1271, !1274, !1276, !1280, !1284, !1289, !1295, !1297, !1299, !1301, !1303, !1305, !1307, !1309, !1311, !1313, !1315, !1317, !1319, !1321, !1325, !1329, !1335, !1337, !1341, !1343, !1347, !1351, !1355, !1363, !1367, !1371, !1375, !1379, !1383, !1387, !1391, !1395, !1399, !1403, !1407, !1411, !1413, !1417, !1421, !1425, !1431, !1435, !1439, !1441, !1445, !1449, !1455, !1457, !1461, !1465, !1469, !1473, !1477, !1481, !1485, !1486, !1487, !1488, !1490, !1491, !1492, !1493, !1494, !1495, !1496, !1500, !1506, !1511, !1515, !1517, !1519, !1521, !1523, !1530, !1534, !1538, !1542, !1546, !1550, !1555, !1559, !1561, !1565, !1571, !1575, !1580, !1582, !1584, !1588, !1592, !1596, !1598, !1600, !1602, !1604, !1608, !1610, !1612, !1616, !1620, !1624, !1628, !1632, !1634, !1636, !1640, !1644, !1648, !1652, !1654, !1656, !1660, !1664, !1665, !1666, !1667, !1668, !1669, !1675, !1678, !1679, !1681, !1683, !1685, !1687, !1691, !1693, !1695, !1697, !1699, !1701, !1703, !1705, !1707, !1711, !1715, !1717, !1721, !1725, !1730, !1731, !1732, !1737, !1741, !1746, !1751, !1755, !1761, !1765, !1767, !1771}
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !902, file: !917, line: 64)
!902 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !903, line: 6, baseType: !904)
!903 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!904 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !905, line: 21, baseType: !906)
!905 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!906 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !905, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !907, identifier: "_ZTS11__mbstate_t")
!907 = !{!908, !909}
!908 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !906, file: !905, line: 15, baseType: !72, size: 32)
!909 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !906, file: !905, line: 20, baseType: !910, size: 32, offset: 32)
!910 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !906, file: !905, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !911, identifier: "_ZTSN11__mbstate_tUt_E")
!911 = !{!912, !913}
!912 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !910, file: !905, line: 18, baseType: !14, size: 32)
!913 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !910, file: !905, line: 19, baseType: !914, size: 32)
!914 = !DICompositeType(tag: DW_TAG_array_type, baseType: !882, size: 32, elements: !915)
!915 = !{!916}
!916 = !DISubrange(count: 4)
!917 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cwchar", directory: "")
!918 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !919, file: !917, line: 141)
!919 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !920, line: 20, baseType: !14)
!920 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !922, file: !917, line: 143)
!922 = !DISubprogram(name: "btowc", scope: !923, file: !923, line: 285, type: !924, flags: DIFlagPrototyped, spFlags: 0)
!923 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "484b7adbbc849bb51cdbcb2d985b07a0")
!924 = !DISubroutineType(types: !925)
!925 = !{!919, !72}
!926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !927, file: !917, line: 144)
!927 = !DISubprogram(name: "fgetwc", scope: !923, file: !923, line: 744, type: !928, flags: DIFlagPrototyped, spFlags: 0)
!928 = !DISubroutineType(types: !929)
!929 = !{!919, !930}
!930 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !931, size: 64)
!931 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !932, line: 5, baseType: !933)
!932 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!933 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !932, line: 4, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8_IO_FILE")
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !935, file: !917, line: 145)
!935 = !DISubprogram(name: "fgetws", scope: !923, file: !923, line: 773, type: !936, flags: DIFlagPrototyped, spFlags: 0)
!936 = !DISubroutineType(types: !937)
!937 = !{!938, !940, !72, !941}
!938 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !939, size: 64)
!939 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!940 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !938)
!941 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !930)
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !943, file: !917, line: 146)
!943 = !DISubprogram(name: "fputwc", scope: !923, file: !923, line: 758, type: !944, flags: DIFlagPrototyped, spFlags: 0)
!944 = !DISubroutineType(types: !945)
!945 = !{!919, !939, !930}
!946 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !947, file: !917, line: 147)
!947 = !DISubprogram(name: "fputws", scope: !923, file: !923, line: 780, type: !948, flags: DIFlagPrototyped, spFlags: 0)
!948 = !DISubroutineType(types: !949)
!949 = !{!72, !950, !941}
!950 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !951)
!951 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !952, size: 64)
!952 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !939)
!953 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !954, file: !917, line: 148)
!954 = !DISubprogram(name: "fwide", scope: !923, file: !923, line: 588, type: !955, flags: DIFlagPrototyped, spFlags: 0)
!955 = !DISubroutineType(types: !956)
!956 = !{!72, !930, !72}
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !958, file: !917, line: 149)
!958 = !DISubprogram(name: "fwprintf", scope: !923, file: !923, line: 595, type: !959, flags: DIFlagPrototyped, spFlags: 0)
!959 = !DISubroutineType(types: !960)
!960 = !{!72, !941, !950, null}
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !962, file: !917, line: 150)
!962 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !923, file: !923, line: 657, type: !959, flags: DIFlagPrototyped, spFlags: 0)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !964, file: !917, line: 151)
!964 = !DISubprogram(name: "getwc", scope: !923, file: !923, line: 745, type: !928, flags: DIFlagPrototyped, spFlags: 0)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !966, file: !917, line: 152)
!966 = !DISubprogram(name: "getwchar", scope: !923, file: !923, line: 751, type: !967, flags: DIFlagPrototyped, spFlags: 0)
!967 = !DISubroutineType(types: !968)
!968 = !{!919}
!969 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !970, file: !917, line: 153)
!970 = !DISubprogram(name: "mbrlen", scope: !923, file: !923, line: 308, type: !971, flags: DIFlagPrototyped, spFlags: 0)
!971 = !DISubroutineType(types: !972)
!972 = !{!973, !975, !973, !977}
!973 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !974, line: 18, baseType: !194)
!974 = !DIFile(filename: "/home/albaz/llvm-build/build-debug/lib/clang/19/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!975 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !976)
!976 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !881, size: 64)
!977 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !978)
!978 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !902, size: 64)
!979 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !980, file: !917, line: 154)
!980 = !DISubprogram(name: "mbrtowc", scope: !923, file: !923, line: 297, type: !981, flags: DIFlagPrototyped, spFlags: 0)
!981 = !DISubroutineType(types: !982)
!982 = !{!973, !940, !975, !973, !977}
!983 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !984, file: !917, line: 155)
!984 = !DISubprogram(name: "mbsinit", scope: !923, file: !923, line: 293, type: !985, flags: DIFlagPrototyped, spFlags: 0)
!985 = !DISubroutineType(types: !986)
!986 = !{!72, !987}
!987 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !988, size: 64)
!988 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !902)
!989 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !990, file: !917, line: 156)
!990 = !DISubprogram(name: "mbsrtowcs", scope: !923, file: !923, line: 338, type: !991, flags: DIFlagPrototyped, spFlags: 0)
!991 = !DISubroutineType(types: !992)
!992 = !{!973, !940, !993, !973, !977}
!993 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !994)
!994 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !976, size: 64)
!995 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !996, file: !917, line: 157)
!996 = !DISubprogram(name: "putwc", scope: !923, file: !923, line: 759, type: !944, flags: DIFlagPrototyped, spFlags: 0)
!997 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !998, file: !917, line: 158)
!998 = !DISubprogram(name: "putwchar", scope: !923, file: !923, line: 765, type: !999, flags: DIFlagPrototyped, spFlags: 0)
!999 = !DISubroutineType(types: !1000)
!1000 = !{!919, !939}
!1001 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1002, file: !917, line: 160)
!1002 = !DISubprogram(name: "swprintf", scope: !923, file: !923, line: 605, type: !1003, flags: DIFlagPrototyped, spFlags: 0)
!1003 = !DISubroutineType(types: !1004)
!1004 = !{!72, !940, !973, !950, null}
!1005 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1006, file: !917, line: 162)
!1006 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !923, file: !923, line: 664, type: !1007, flags: DIFlagPrototyped, spFlags: 0)
!1007 = !DISubroutineType(types: !1008)
!1008 = !{!72, !950, !950, null}
!1009 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1010, file: !917, line: 163)
!1010 = !DISubprogram(name: "ungetwc", scope: !923, file: !923, line: 788, type: !1011, flags: DIFlagPrototyped, spFlags: 0)
!1011 = !DISubroutineType(types: !1012)
!1012 = !{!919, !919, !930}
!1013 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1014, file: !917, line: 164)
!1014 = !DISubprogram(name: "vfwprintf", scope: !923, file: !923, line: 613, type: !1015, flags: DIFlagPrototyped, spFlags: 0)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!72, !941, !950, !1017}
!1017 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1018, size: 64)
!1018 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", size: 192, flags: DIFlagTypePassByValue, elements: !1019, identifier: "_ZTS13__va_list_tag")
!1019 = !{!1020, !1021, !1022, !1024}
!1020 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !1018, file: !879, baseType: !14, size: 32)
!1021 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !1018, file: !879, baseType: !14, size: 32, offset: 32)
!1022 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !1018, file: !879, baseType: !1023, size: 64, offset: 64)
!1023 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!1024 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !1018, file: !879, baseType: !1023, size: 64, offset: 128)
!1025 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1026, file: !917, line: 166)
!1026 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !923, file: !923, line: 711, type: !1015, flags: DIFlagPrototyped, spFlags: 0)
!1027 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1028, file: !917, line: 169)
!1028 = !DISubprogram(name: "vswprintf", scope: !923, file: !923, line: 626, type: !1029, flags: DIFlagPrototyped, spFlags: 0)
!1029 = !DISubroutineType(types: !1030)
!1030 = !{!72, !940, !973, !950, !1017}
!1031 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1032, file: !917, line: 172)
!1032 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !923, file: !923, line: 718, type: !1033, flags: DIFlagPrototyped, spFlags: 0)
!1033 = !DISubroutineType(types: !1034)
!1034 = !{!72, !950, !950, !1017}
!1035 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1036, file: !917, line: 174)
!1036 = !DISubprogram(name: "vwprintf", scope: !923, file: !923, line: 621, type: !1037, flags: DIFlagPrototyped, spFlags: 0)
!1037 = !DISubroutineType(types: !1038)
!1038 = !{!72, !950, !1017}
!1039 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1040, file: !917, line: 176)
!1040 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !923, file: !923, line: 715, type: !1037, flags: DIFlagPrototyped, spFlags: 0)
!1041 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1042, file: !917, line: 178)
!1042 = !DISubprogram(name: "wcrtomb", scope: !923, file: !923, line: 302, type: !1043, flags: DIFlagPrototyped, spFlags: 0)
!1043 = !DISubroutineType(types: !1044)
!1044 = !{!973, !1045, !939, !977}
!1045 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1046)
!1046 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !882, size: 64)
!1047 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1048, file: !917, line: 179)
!1048 = !DISubprogram(name: "wcscat", scope: !923, file: !923, line: 97, type: !1049, flags: DIFlagPrototyped, spFlags: 0)
!1049 = !DISubroutineType(types: !1050)
!1050 = !{!938, !940, !950}
!1051 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1052, file: !917, line: 180)
!1052 = !DISubprogram(name: "wcscmp", scope: !923, file: !923, line: 106, type: !1053, flags: DIFlagPrototyped, spFlags: 0)
!1053 = !DISubroutineType(types: !1054)
!1054 = !{!72, !951, !951}
!1055 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1056, file: !917, line: 181)
!1056 = !DISubprogram(name: "wcscoll", scope: !923, file: !923, line: 131, type: !1053, flags: DIFlagPrototyped, spFlags: 0)
!1057 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1058, file: !917, line: 182)
!1058 = !DISubprogram(name: "wcscpy", scope: !923, file: !923, line: 87, type: !1049, flags: DIFlagPrototyped, spFlags: 0)
!1059 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1060, file: !917, line: 183)
!1060 = !DISubprogram(name: "wcscspn", scope: !923, file: !923, line: 188, type: !1061, flags: DIFlagPrototyped, spFlags: 0)
!1061 = !DISubroutineType(types: !1062)
!1062 = !{!973, !951, !951}
!1063 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1064, file: !917, line: 184)
!1064 = !DISubprogram(name: "wcsftime", scope: !923, file: !923, line: 852, type: !1065, flags: DIFlagPrototyped, spFlags: 0)
!1065 = !DISubroutineType(types: !1066)
!1066 = !{!973, !940, !973, !950, !1067}
!1067 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1068)
!1068 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1069, size: 64)
!1069 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1070)
!1070 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !923, line: 83, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS2tm")
!1071 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1072, file: !917, line: 185)
!1072 = !DISubprogram(name: "wcslen", scope: !923, file: !923, line: 223, type: !1073, flags: DIFlagPrototyped, spFlags: 0)
!1073 = !DISubroutineType(types: !1074)
!1074 = !{!973, !951}
!1075 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1076, file: !917, line: 186)
!1076 = !DISubprogram(name: "wcsncat", scope: !923, file: !923, line: 101, type: !1077, flags: DIFlagPrototyped, spFlags: 0)
!1077 = !DISubroutineType(types: !1078)
!1078 = !{!938, !940, !950, !973}
!1079 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1080, file: !917, line: 187)
!1080 = !DISubprogram(name: "wcsncmp", scope: !923, file: !923, line: 109, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1081 = !DISubroutineType(types: !1082)
!1082 = !{!72, !951, !951, !973}
!1083 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1084, file: !917, line: 188)
!1084 = !DISubprogram(name: "wcsncpy", scope: !923, file: !923, line: 92, type: !1077, flags: DIFlagPrototyped, spFlags: 0)
!1085 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1086, file: !917, line: 189)
!1086 = !DISubprogram(name: "wcsrtombs", scope: !923, file: !923, line: 344, type: !1087, flags: DIFlagPrototyped, spFlags: 0)
!1087 = !DISubroutineType(types: !1088)
!1088 = !{!973, !1045, !1089, !973, !977}
!1089 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1090)
!1090 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !951, size: 64)
!1091 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1092, file: !917, line: 190)
!1092 = !DISubprogram(name: "wcsspn", scope: !923, file: !923, line: 192, type: !1061, flags: DIFlagPrototyped, spFlags: 0)
!1093 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1094, file: !917, line: 191)
!1094 = !DISubprogram(name: "wcstod", scope: !923, file: !923, line: 378, type: !1095, flags: DIFlagPrototyped, spFlags: 0)
!1095 = !DISubroutineType(types: !1096)
!1096 = !{!1097, !950, !1098}
!1097 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!1098 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1099)
!1099 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !938, size: 64)
!1100 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1101, file: !917, line: 193)
!1101 = !DISubprogram(name: "wcstof", scope: !923, file: !923, line: 383, type: !1102, flags: DIFlagPrototyped, spFlags: 0)
!1102 = !DISubroutineType(types: !1103)
!1103 = !{!1104, !950, !1098}
!1104 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!1105 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1106, file: !917, line: 195)
!1106 = !DISubprogram(name: "wcstok", scope: !923, file: !923, line: 218, type: !1107, flags: DIFlagPrototyped, spFlags: 0)
!1107 = !DISubroutineType(types: !1108)
!1108 = !{!938, !940, !950, !1098}
!1109 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1110, file: !917, line: 196)
!1110 = !DISubprogram(name: "wcstol", scope: !923, file: !923, line: 429, type: !1111, flags: DIFlagPrototyped, spFlags: 0)
!1111 = !DISubroutineType(types: !1112)
!1112 = !{!36, !950, !1098, !72}
!1113 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1114, file: !917, line: 197)
!1114 = !DISubprogram(name: "wcstoul", scope: !923, file: !923, line: 434, type: !1115, flags: DIFlagPrototyped, spFlags: 0)
!1115 = !DISubroutineType(types: !1116)
!1116 = !{!194, !950, !1098, !72}
!1117 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1118, file: !917, line: 198)
!1118 = !DISubprogram(name: "wcsxfrm", scope: !923, file: !923, line: 135, type: !1119, flags: DIFlagPrototyped, spFlags: 0)
!1119 = !DISubroutineType(types: !1120)
!1120 = !{!973, !940, !950, !973}
!1121 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1122, file: !917, line: 199)
!1122 = !DISubprogram(name: "wctob", scope: !923, file: !923, line: 289, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1123 = !DISubroutineType(types: !1124)
!1124 = !{!72, !919}
!1125 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1126, file: !917, line: 200)
!1126 = !DISubprogram(name: "wmemcmp", scope: !923, file: !923, line: 259, type: !1081, flags: DIFlagPrototyped, spFlags: 0)
!1127 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1128, file: !917, line: 201)
!1128 = !DISubprogram(name: "wmemcpy", scope: !923, file: !923, line: 263, type: !1077, flags: DIFlagPrototyped, spFlags: 0)
!1129 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1130, file: !917, line: 202)
!1130 = !DISubprogram(name: "wmemmove", scope: !923, file: !923, line: 268, type: !1131, flags: DIFlagPrototyped, spFlags: 0)
!1131 = !DISubroutineType(types: !1132)
!1132 = !{!938, !938, !951, !973}
!1133 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1134, file: !917, line: 203)
!1134 = !DISubprogram(name: "wmemset", scope: !923, file: !923, line: 272, type: !1135, flags: DIFlagPrototyped, spFlags: 0)
!1135 = !DISubroutineType(types: !1136)
!1136 = !{!938, !938, !939, !973}
!1137 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1138, file: !917, line: 204)
!1138 = !DISubprogram(name: "wprintf", scope: !923, file: !923, line: 602, type: !1139, flags: DIFlagPrototyped, spFlags: 0)
!1139 = !DISubroutineType(types: !1140)
!1140 = !{!72, !950, null}
!1141 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1142, file: !917, line: 205)
!1142 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !923, file: !923, line: 661, type: !1139, flags: DIFlagPrototyped, spFlags: 0)
!1143 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1144, file: !917, line: 206)
!1144 = !DISubprogram(name: "wcschr", scope: !923, file: !923, line: 165, type: !1145, flags: DIFlagPrototyped, spFlags: 0)
!1145 = !DISubroutineType(types: !1146)
!1146 = !{!938, !951, !939}
!1147 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1148, file: !917, line: 207)
!1148 = !DISubprogram(name: "wcspbrk", scope: !923, file: !923, line: 202, type: !1149, flags: DIFlagPrototyped, spFlags: 0)
!1149 = !DISubroutineType(types: !1150)
!1150 = !{!938, !951, !951}
!1151 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1152, file: !917, line: 208)
!1152 = !DISubprogram(name: "wcsrchr", scope: !923, file: !923, line: 175, type: !1145, flags: DIFlagPrototyped, spFlags: 0)
!1153 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1154, file: !917, line: 209)
!1154 = !DISubprogram(name: "wcsstr", scope: !923, file: !923, line: 213, type: !1149, flags: DIFlagPrototyped, spFlags: 0)
!1155 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1156, file: !917, line: 210)
!1156 = !DISubprogram(name: "wmemchr", scope: !923, file: !923, line: 254, type: !1157, flags: DIFlagPrototyped, spFlags: 0)
!1157 = !DISubroutineType(types: !1158)
!1158 = !{!938, !951, !939, !973}
!1159 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1161, file: !917, line: 251)
!1160 = !DINamespace(name: "__gnu_cxx", scope: null)
!1161 = !DISubprogram(name: "wcstold", scope: !923, file: !923, line: 385, type: !1162, flags: DIFlagPrototyped, spFlags: 0)
!1162 = !DISubroutineType(types: !1163)
!1163 = !{!1164, !950, !1098}
!1164 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!1165 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1166, file: !917, line: 260)
!1166 = !DISubprogram(name: "wcstoll", scope: !923, file: !923, line: 442, type: !1167, flags: DIFlagPrototyped, spFlags: 0)
!1167 = !DISubroutineType(types: !1168)
!1168 = !{!1169, !950, !1098, !72}
!1169 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!1170 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1171, file: !917, line: 261)
!1171 = !DISubprogram(name: "wcstoull", scope: !923, file: !923, line: 449, type: !1172, flags: DIFlagPrototyped, spFlags: 0)
!1172 = !DISubroutineType(types: !1173)
!1173 = !{!1174, !950, !1098, !72}
!1174 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!1175 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1161, file: !917, line: 267)
!1176 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1166, file: !917, line: 268)
!1177 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1171, file: !917, line: 269)
!1178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1101, file: !917, line: 283)
!1179 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1026, file: !917, line: 286)
!1180 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1032, file: !917, line: 289)
!1181 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1040, file: !917, line: 292)
!1182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1161, file: !917, line: 296)
!1183 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1166, file: !917, line: 297)
!1184 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1171, file: !917, line: 298)
!1185 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1186, file: !1187, line: 68)
!1186 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !1188, file: !1187, line: 90, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!1187 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "ed433011c81450fc2dabd9aa8a29a038")
!1188 = !DINamespace(name: "__exception_ptr", scope: !2)
!1189 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1188, entity: !1190, file: !1187, line: 84)
!1190 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !2, file: !1187, line: 80, type: !1191, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1191 = !DISubroutineType(types: !1192)
!1192 = !{null, !1186}
!1193 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !1194, entity: !1195, file: !1196, line: 58)
!1194 = !DINamespace(name: "__gnu_debug", scope: null)
!1195 = !DINamespace(name: "__debug", scope: !2)
!1196 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "982c0103e1e5f86b0818efdfc5273c3c")
!1197 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1198, file: !1202, line: 47)
!1198 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !1199, line: 24, baseType: !1200)
!1199 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "55bcbdc3159515ebd91d351a70d505f4")
!1200 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !43, line: 37, baseType: !1201)
!1201 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!1202 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cstdint", directory: "")
!1203 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1204, file: !1202, line: 48)
!1204 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !1199, line: 25, baseType: !1205)
!1205 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !43, line: 39, baseType: !1206)
!1206 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!1207 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1208, file: !1202, line: 49)
!1208 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !1199, line: 26, baseType: !1209)
!1209 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !43, line: 41, baseType: !72)
!1210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1211, file: !1202, line: 50)
!1211 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !1199, line: 27, baseType: !1212)
!1212 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !43, line: 44, baseType: !36)
!1213 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1214, file: !1202, line: 52)
!1214 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !41, line: 58, baseType: !1201)
!1215 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1216, file: !1202, line: 53)
!1216 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !41, line: 60, baseType: !36)
!1217 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1218, file: !1202, line: 54)
!1218 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !41, line: 61, baseType: !36)
!1219 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1220, file: !1202, line: 55)
!1220 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !41, line: 62, baseType: !36)
!1221 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1222, file: !1202, line: 57)
!1222 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !41, line: 43, baseType: !1223)
!1223 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !43, line: 52, baseType: !1200)
!1224 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1225, file: !1202, line: 58)
!1225 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !41, line: 44, baseType: !1226)
!1226 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !43, line: 54, baseType: !1205)
!1227 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1228, file: !1202, line: 59)
!1228 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !41, line: 45, baseType: !1229)
!1229 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !43, line: 56, baseType: !1209)
!1230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1231, file: !1202, line: 60)
!1231 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !41, line: 46, baseType: !1232)
!1232 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !43, line: 58, baseType: !1212)
!1233 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !40, file: !1202, line: 62)
!1234 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1235, file: !1202, line: 63)
!1235 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !41, line: 87, baseType: !36)
!1236 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1237, file: !1202, line: 65)
!1237 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !1238, line: 24, baseType: !1239)
!1238 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!1239 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !43, line: 38, baseType: !1240)
!1240 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!1241 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1242, file: !1202, line: 66)
!1242 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !1238, line: 25, baseType: !1243)
!1243 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !43, line: 40, baseType: !1244)
!1244 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!1245 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1246, file: !1202, line: 67)
!1246 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !1238, line: 26, baseType: !1247)
!1247 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !43, line: 42, baseType: !14)
!1248 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1249, file: !1202, line: 68)
!1249 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !1238, line: 27, baseType: !1250)
!1250 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !43, line: 45, baseType: !194)
!1251 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1252, file: !1202, line: 70)
!1252 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !41, line: 71, baseType: !1240)
!1253 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1254, file: !1202, line: 71)
!1254 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !41, line: 73, baseType: !194)
!1255 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1256, file: !1202, line: 72)
!1256 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !41, line: 74, baseType: !194)
!1257 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1258, file: !1202, line: 73)
!1258 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !41, line: 75, baseType: !194)
!1259 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1260, file: !1202, line: 75)
!1260 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !41, line: 49, baseType: !1261)
!1261 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !43, line: 53, baseType: !1239)
!1262 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1263, file: !1202, line: 76)
!1263 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !41, line: 50, baseType: !1264)
!1264 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !43, line: 55, baseType: !1243)
!1265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1266, file: !1202, line: 77)
!1266 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !41, line: 51, baseType: !1267)
!1267 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !43, line: 57, baseType: !1247)
!1268 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1269, file: !1202, line: 78)
!1269 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !41, line: 52, baseType: !1270)
!1270 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !43, line: 59, baseType: !1250)
!1271 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1272, file: !1202, line: 80)
!1272 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !41, line: 102, baseType: !1273)
!1273 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !43, line: 73, baseType: !194)
!1274 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1275, file: !1202, line: 81)
!1275 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !41, line: 90, baseType: !194)
!1276 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1277, file: !1279, line: 53)
!1277 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !1278, line: 51, size: 768, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!1278 = !DIFile(filename: "/usr/include/locale.h", directory: "", checksumkind: CSK_MD5, checksum: "a1d177e0f311dc60a74cb347049d75bc")
!1279 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/clocale", directory: "")
!1280 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1281, file: !1279, line: 54)
!1281 = !DISubprogram(name: "setlocale", scope: !1278, file: !1278, line: 122, type: !1282, flags: DIFlagPrototyped, spFlags: 0)
!1282 = !DISubroutineType(types: !1283)
!1283 = !{!1046, !72, !976}
!1284 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1285, file: !1279, line: 55)
!1285 = !DISubprogram(name: "localeconv", scope: !1278, file: !1278, line: 125, type: !1286, flags: DIFlagPrototyped, spFlags: 0)
!1286 = !DISubroutineType(types: !1287)
!1287 = !{!1288}
!1288 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1277, size: 64)
!1289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1290, file: !1294, line: 64)
!1290 = !DISubprogram(name: "isalnum", scope: !1291, file: !1291, line: 108, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1291 = !DIFile(filename: "/usr/include/ctype.h", directory: "", checksumkind: CSK_MD5, checksum: "3ab3dd7fdf2578005732722ee2393e59")
!1292 = !DISubroutineType(types: !1293)
!1293 = !{!72, !72}
!1294 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cctype", directory: "")
!1295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1296, file: !1294, line: 65)
!1296 = !DISubprogram(name: "isalpha", scope: !1291, file: !1291, line: 109, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1297 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1298, file: !1294, line: 66)
!1298 = !DISubprogram(name: "iscntrl", scope: !1291, file: !1291, line: 110, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1300, file: !1294, line: 67)
!1300 = !DISubprogram(name: "isdigit", scope: !1291, file: !1291, line: 111, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1302, file: !1294, line: 68)
!1302 = !DISubprogram(name: "isgraph", scope: !1291, file: !1291, line: 113, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1304, file: !1294, line: 69)
!1304 = !DISubprogram(name: "islower", scope: !1291, file: !1291, line: 112, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1305 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1306, file: !1294, line: 70)
!1306 = !DISubprogram(name: "isprint", scope: !1291, file: !1291, line: 114, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1308, file: !1294, line: 71)
!1308 = !DISubprogram(name: "ispunct", scope: !1291, file: !1291, line: 115, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1309 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1310, file: !1294, line: 72)
!1310 = !DISubprogram(name: "isspace", scope: !1291, file: !1291, line: 116, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1311 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1312, file: !1294, line: 73)
!1312 = !DISubprogram(name: "isupper", scope: !1291, file: !1291, line: 117, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1314, file: !1294, line: 74)
!1314 = !DISubprogram(name: "isxdigit", scope: !1291, file: !1291, line: 118, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1315 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1316, file: !1294, line: 75)
!1316 = !DISubprogram(name: "tolower", scope: !1291, file: !1291, line: 122, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1317 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1318, file: !1294, line: 76)
!1318 = !DISubprogram(name: "toupper", scope: !1291, file: !1291, line: 125, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1319 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1320, file: !1294, line: 87)
!1320 = !DISubprogram(name: "isblank", scope: !1291, file: !1291, line: 130, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1321 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1322, file: !1324, line: 52)
!1322 = !DISubprogram(name: "abs", scope: !1323, file: !1323, line: 848, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1323 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!1324 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/std_abs.h", directory: "")
!1325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1326, file: !1328, line: 127)
!1326 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !1323, line: 63, baseType: !1327)
!1327 = !DICompositeType(tag: DW_TAG_structure_type, file: !1323, line: 59, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!1328 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cstdlib", directory: "")
!1329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1330, file: !1328, line: 128)
!1330 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !1323, line: 71, baseType: !1331)
!1331 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1323, line: 67, size: 128, flags: DIFlagTypePassByValue, elements: !1332, identifier: "_ZTS6ldiv_t")
!1332 = !{!1333, !1334}
!1333 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1331, file: !1323, line: 69, baseType: !36, size: 64)
!1334 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1331, file: !1323, line: 70, baseType: !36, size: 64, offset: 64)
!1335 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1336, file: !1328, line: 130)
!1336 = !DISubprogram(name: "abort", scope: !1323, file: !1323, line: 598, type: !245, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1337 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1338, file: !1328, line: 134)
!1338 = !DISubprogram(name: "atexit", scope: !1323, file: !1323, line: 602, type: !1339, flags: DIFlagPrototyped, spFlags: 0)
!1339 = !DISubroutineType(types: !1340)
!1340 = !{!72, !244}
!1341 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1342, file: !1328, line: 137)
!1342 = !DISubprogram(name: "at_quick_exit", scope: !1323, file: !1323, line: 607, type: !1339, flags: DIFlagPrototyped, spFlags: 0)
!1343 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1344, file: !1328, line: 140)
!1344 = !DISubprogram(name: "atof", scope: !1323, file: !1323, line: 102, type: !1345, flags: DIFlagPrototyped, spFlags: 0)
!1345 = !DISubroutineType(types: !1346)
!1346 = !{!1097, !976}
!1347 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1348, file: !1328, line: 141)
!1348 = !DISubprogram(name: "atoi", scope: !1323, file: !1323, line: 105, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1349 = !DISubroutineType(types: !1350)
!1350 = !{!72, !976}
!1351 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1352, file: !1328, line: 142)
!1352 = !DISubprogram(name: "atol", scope: !1323, file: !1323, line: 108, type: !1353, flags: DIFlagPrototyped, spFlags: 0)
!1353 = !DISubroutineType(types: !1354)
!1354 = !{!36, !976}
!1355 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1356, file: !1328, line: 143)
!1356 = !DISubprogram(name: "bsearch", scope: !1323, file: !1323, line: 828, type: !1357, flags: DIFlagPrototyped, spFlags: 0)
!1357 = !DISubroutineType(types: !1358)
!1358 = !{!1023, !323, !323, !973, !973, !1359}
!1359 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !1323, line: 816, baseType: !1360)
!1360 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1361, size: 64)
!1361 = !DISubroutineType(types: !1362)
!1362 = !{!72, !323, !323}
!1363 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1364, file: !1328, line: 144)
!1364 = !DISubprogram(name: "calloc", scope: !1323, file: !1323, line: 543, type: !1365, flags: DIFlagPrototyped, spFlags: 0)
!1365 = !DISubroutineType(types: !1366)
!1366 = !{!1023, !973, !973}
!1367 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1368, file: !1328, line: 145)
!1368 = !DISubprogram(name: "div", scope: !1323, file: !1323, line: 860, type: !1369, flags: DIFlagPrototyped, spFlags: 0)
!1369 = !DISubroutineType(types: !1370)
!1370 = !{!1326, !72, !72}
!1371 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1372, file: !1328, line: 146)
!1372 = !DISubprogram(name: "exit", scope: !1323, file: !1323, line: 624, type: !1373, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1373 = !DISubroutineType(types: !1374)
!1374 = !{null, !72}
!1375 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1376, file: !1328, line: 147)
!1376 = !DISubprogram(name: "free", scope: !1323, file: !1323, line: 555, type: !1377, flags: DIFlagPrototyped, spFlags: 0)
!1377 = !DISubroutineType(types: !1378)
!1378 = !{null, !1023}
!1379 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1380, file: !1328, line: 148)
!1380 = !DISubprogram(name: "getenv", scope: !1323, file: !1323, line: 641, type: !1381, flags: DIFlagPrototyped, spFlags: 0)
!1381 = !DISubroutineType(types: !1382)
!1382 = !{!1046, !976}
!1383 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1384, file: !1328, line: 149)
!1384 = !DISubprogram(name: "labs", scope: !1323, file: !1323, line: 849, type: !1385, flags: DIFlagPrototyped, spFlags: 0)
!1385 = !DISubroutineType(types: !1386)
!1386 = !{!36, !36}
!1387 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1388, file: !1328, line: 150)
!1388 = !DISubprogram(name: "ldiv", scope: !1323, file: !1323, line: 862, type: !1389, flags: DIFlagPrototyped, spFlags: 0)
!1389 = !DISubroutineType(types: !1390)
!1390 = !{!1330, !36, !36}
!1391 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1392, file: !1328, line: 151)
!1392 = !DISubprogram(name: "malloc", scope: !1323, file: !1323, line: 540, type: !1393, flags: DIFlagPrototyped, spFlags: 0)
!1393 = !DISubroutineType(types: !1394)
!1394 = !{!1023, !973}
!1395 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1396, file: !1328, line: 153)
!1396 = !DISubprogram(name: "mblen", scope: !1323, file: !1323, line: 930, type: !1397, flags: DIFlagPrototyped, spFlags: 0)
!1397 = !DISubroutineType(types: !1398)
!1398 = !{!72, !976, !973}
!1399 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1400, file: !1328, line: 154)
!1400 = !DISubprogram(name: "mbstowcs", scope: !1323, file: !1323, line: 941, type: !1401, flags: DIFlagPrototyped, spFlags: 0)
!1401 = !DISubroutineType(types: !1402)
!1402 = !{!973, !940, !975, !973}
!1403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1404, file: !1328, line: 155)
!1404 = !DISubprogram(name: "mbtowc", scope: !1323, file: !1323, line: 933, type: !1405, flags: DIFlagPrototyped, spFlags: 0)
!1405 = !DISubroutineType(types: !1406)
!1406 = !{!72, !940, !975, !973}
!1407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1408, file: !1328, line: 157)
!1408 = !DISubprogram(name: "qsort", scope: !1323, file: !1323, line: 838, type: !1409, flags: DIFlagPrototyped, spFlags: 0)
!1409 = !DISubroutineType(types: !1410)
!1410 = !{null, !1023, !973, !973, !1359}
!1411 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1412, file: !1328, line: 160)
!1412 = !DISubprogram(name: "quick_exit", scope: !1323, file: !1323, line: 630, type: !1373, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1414, file: !1328, line: 163)
!1414 = !DISubprogram(name: "rand", scope: !1323, file: !1323, line: 454, type: !1415, flags: DIFlagPrototyped, spFlags: 0)
!1415 = !DISubroutineType(types: !1416)
!1416 = !{!72}
!1417 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1418, file: !1328, line: 164)
!1418 = !DISubprogram(name: "realloc", scope: !1323, file: !1323, line: 551, type: !1419, flags: DIFlagPrototyped, spFlags: 0)
!1419 = !DISubroutineType(types: !1420)
!1420 = !{!1023, !1023, !973}
!1421 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1422, file: !1328, line: 165)
!1422 = !DISubprogram(name: "srand", scope: !1323, file: !1323, line: 456, type: !1423, flags: DIFlagPrototyped, spFlags: 0)
!1423 = !DISubroutineType(types: !1424)
!1424 = !{null, !14}
!1425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1426, file: !1328, line: 166)
!1426 = !DISubprogram(name: "strtod", scope: !1323, file: !1323, line: 118, type: !1427, flags: DIFlagPrototyped, spFlags: 0)
!1427 = !DISubroutineType(types: !1428)
!1428 = !{!1097, !975, !1429}
!1429 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1430)
!1430 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1046, size: 64)
!1431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1432, file: !1328, line: 167)
!1432 = !DISubprogram(name: "strtol", scope: !1323, file: !1323, line: 177, type: !1433, flags: DIFlagPrototyped, spFlags: 0)
!1433 = !DISubroutineType(types: !1434)
!1434 = !{!36, !975, !1429, !72}
!1435 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1436, file: !1328, line: 168)
!1436 = !DISubprogram(name: "strtoul", scope: !1323, file: !1323, line: 181, type: !1437, flags: DIFlagPrototyped, spFlags: 0)
!1437 = !DISubroutineType(types: !1438)
!1438 = !{!194, !975, !1429, !72}
!1439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1440, file: !1328, line: 169)
!1440 = !DISubprogram(name: "system", scope: !1323, file: !1323, line: 791, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1441 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1442, file: !1328, line: 171)
!1442 = !DISubprogram(name: "wcstombs", scope: !1323, file: !1323, line: 945, type: !1443, flags: DIFlagPrototyped, spFlags: 0)
!1443 = !DISubroutineType(types: !1444)
!1444 = !{!973, !1045, !950, !973}
!1445 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1446, file: !1328, line: 172)
!1446 = !DISubprogram(name: "wctomb", scope: !1323, file: !1323, line: 937, type: !1447, flags: DIFlagPrototyped, spFlags: 0)
!1447 = !DISubroutineType(types: !1448)
!1448 = !{!72, !1046, !939}
!1449 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1450, file: !1328, line: 200)
!1450 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !1323, line: 81, baseType: !1451)
!1451 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !1323, line: 77, size: 128, flags: DIFlagTypePassByValue, elements: !1452, identifier: "_ZTS7lldiv_t")
!1452 = !{!1453, !1454}
!1453 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !1451, file: !1323, line: 79, baseType: !1169, size: 64)
!1454 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !1451, file: !1323, line: 80, baseType: !1169, size: 64, offset: 64)
!1455 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1456, file: !1328, line: 206)
!1456 = !DISubprogram(name: "_Exit", scope: !1323, file: !1323, line: 636, type: !1373, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!1457 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1458, file: !1328, line: 210)
!1458 = !DISubprogram(name: "llabs", scope: !1323, file: !1323, line: 852, type: !1459, flags: DIFlagPrototyped, spFlags: 0)
!1459 = !DISubroutineType(types: !1460)
!1460 = !{!1169, !1169}
!1461 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1462, file: !1328, line: 216)
!1462 = !DISubprogram(name: "lldiv", scope: !1323, file: !1323, line: 866, type: !1463, flags: DIFlagPrototyped, spFlags: 0)
!1463 = !DISubroutineType(types: !1464)
!1464 = !{!1450, !1169, !1169}
!1465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1466, file: !1328, line: 227)
!1466 = !DISubprogram(name: "atoll", scope: !1323, file: !1323, line: 113, type: !1467, flags: DIFlagPrototyped, spFlags: 0)
!1467 = !DISubroutineType(types: !1468)
!1468 = !{!1169, !976}
!1469 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1470, file: !1328, line: 228)
!1470 = !DISubprogram(name: "strtoll", scope: !1323, file: !1323, line: 201, type: !1471, flags: DIFlagPrototyped, spFlags: 0)
!1471 = !DISubroutineType(types: !1472)
!1472 = !{!1169, !975, !1429, !72}
!1473 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1474, file: !1328, line: 229)
!1474 = !DISubprogram(name: "strtoull", scope: !1323, file: !1323, line: 206, type: !1475, flags: DIFlagPrototyped, spFlags: 0)
!1475 = !DISubroutineType(types: !1476)
!1476 = !{!1174, !975, !1429, !72}
!1477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1478, file: !1328, line: 231)
!1478 = !DISubprogram(name: "strtof", scope: !1323, file: !1323, line: 124, type: !1479, flags: DIFlagPrototyped, spFlags: 0)
!1479 = !DISubroutineType(types: !1480)
!1480 = !{!1104, !975, !1429}
!1481 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1482, file: !1328, line: 232)
!1482 = !DISubprogram(name: "strtold", scope: !1323, file: !1323, line: 127, type: !1483, flags: DIFlagPrototyped, spFlags: 0)
!1483 = !DISubroutineType(types: !1484)
!1484 = !{!1164, !975, !1429}
!1485 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1450, file: !1328, line: 240)
!1486 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1456, file: !1328, line: 242)
!1487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1458, file: !1328, line: 244)
!1488 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1489, file: !1328, line: 245)
!1489 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !1160, file: !1328, line: 213, type: !1463, flags: DIFlagPrototyped, spFlags: 0)
!1490 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1462, file: !1328, line: 246)
!1491 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1466, file: !1328, line: 248)
!1492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1478, file: !1328, line: 249)
!1493 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1470, file: !1328, line: 250)
!1494 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1474, file: !1328, line: 251)
!1495 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1482, file: !1328, line: 252)
!1496 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1497, file: !1499, line: 98)
!1497 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !1498, line: 7, baseType: !933)
!1498 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!1499 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cstdio", directory: "")
!1500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1501, file: !1499, line: 99)
!1501 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !1502, line: 84, baseType: !1503)
!1502 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!1503 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !1504, line: 14, baseType: !1505)
!1504 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__fpos_t.h", directory: "", checksumkind: CSK_MD5, checksum: "32de8bdaf3551a6c0a9394f9af4389ce")
!1505 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !1504, line: 10, size: 128, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!1506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1507, file: !1499, line: 101)
!1507 = !DISubprogram(name: "clearerr", scope: !1502, file: !1502, line: 786, type: !1508, flags: DIFlagPrototyped, spFlags: 0)
!1508 = !DISubroutineType(types: !1509)
!1509 = !{null, !1510}
!1510 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1497, size: 64)
!1511 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1512, file: !1499, line: 102)
!1512 = !DISubprogram(name: "fclose", scope: !1502, file: !1502, line: 178, type: !1513, flags: DIFlagPrototyped, spFlags: 0)
!1513 = !DISubroutineType(types: !1514)
!1514 = !{!72, !1510}
!1515 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1516, file: !1499, line: 103)
!1516 = !DISubprogram(name: "feof", scope: !1502, file: !1502, line: 788, type: !1513, flags: DIFlagPrototyped, spFlags: 0)
!1517 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1518, file: !1499, line: 104)
!1518 = !DISubprogram(name: "ferror", scope: !1502, file: !1502, line: 790, type: !1513, flags: DIFlagPrototyped, spFlags: 0)
!1519 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1520, file: !1499, line: 105)
!1520 = !DISubprogram(name: "fflush", scope: !1502, file: !1502, line: 230, type: !1513, flags: DIFlagPrototyped, spFlags: 0)
!1521 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1522, file: !1499, line: 106)
!1522 = !DISubprogram(name: "fgetc", scope: !1502, file: !1502, line: 513, type: !1513, flags: DIFlagPrototyped, spFlags: 0)
!1523 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1524, file: !1499, line: 107)
!1524 = !DISubprogram(name: "fgetpos", scope: !1502, file: !1502, line: 760, type: !1525, flags: DIFlagPrototyped, spFlags: 0)
!1525 = !DISubroutineType(types: !1526)
!1526 = !{!72, !1527, !1528}
!1527 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1510)
!1528 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1529)
!1529 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1501, size: 64)
!1530 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1531, file: !1499, line: 108)
!1531 = !DISubprogram(name: "fgets", scope: !1502, file: !1502, line: 592, type: !1532, flags: DIFlagPrototyped, spFlags: 0)
!1532 = !DISubroutineType(types: !1533)
!1533 = !{!1046, !1045, !72, !1527}
!1534 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1535, file: !1499, line: 109)
!1535 = !DISubprogram(name: "fopen", scope: !1502, file: !1502, line: 258, type: !1536, flags: DIFlagPrototyped, spFlags: 0)
!1536 = !DISubroutineType(types: !1537)
!1537 = !{!1510, !975, !975}
!1538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1539, file: !1499, line: 110)
!1539 = !DISubprogram(name: "fprintf", scope: !1502, file: !1502, line: 350, type: !1540, flags: DIFlagPrototyped, spFlags: 0)
!1540 = !DISubroutineType(types: !1541)
!1541 = !{!72, !1527, !975, null}
!1542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1543, file: !1499, line: 111)
!1543 = !DISubprogram(name: "fputc", scope: !1502, file: !1502, line: 549, type: !1544, flags: DIFlagPrototyped, spFlags: 0)
!1544 = !DISubroutineType(types: !1545)
!1545 = !{!72, !72, !1510}
!1546 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1547, file: !1499, line: 112)
!1547 = !DISubprogram(name: "fputs", scope: !1502, file: !1502, line: 655, type: !1548, flags: DIFlagPrototyped, spFlags: 0)
!1548 = !DISubroutineType(types: !1549)
!1549 = !{!72, !975, !1527}
!1550 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1551, file: !1499, line: 113)
!1551 = !DISubprogram(name: "fread", scope: !1502, file: !1502, line: 675, type: !1552, flags: DIFlagPrototyped, spFlags: 0)
!1552 = !DISubroutineType(types: !1553)
!1553 = !{!973, !1554, !973, !973, !1527}
!1554 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1023)
!1555 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1556, file: !1499, line: 114)
!1556 = !DISubprogram(name: "freopen", scope: !1502, file: !1502, line: 265, type: !1557, flags: DIFlagPrototyped, spFlags: 0)
!1557 = !DISubroutineType(types: !1558)
!1558 = !{!1510, !975, !975, !1527}
!1559 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1560, file: !1499, line: 115)
!1560 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !1502, file: !1502, line: 434, type: !1540, flags: DIFlagPrototyped, spFlags: 0)
!1561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1562, file: !1499, line: 116)
!1562 = !DISubprogram(name: "fseek", scope: !1502, file: !1502, line: 713, type: !1563, flags: DIFlagPrototyped, spFlags: 0)
!1563 = !DISubroutineType(types: !1564)
!1564 = !{!72, !1510, !36, !72}
!1565 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1566, file: !1499, line: 117)
!1566 = !DISubprogram(name: "fsetpos", scope: !1502, file: !1502, line: 765, type: !1567, flags: DIFlagPrototyped, spFlags: 0)
!1567 = !DISubroutineType(types: !1568)
!1568 = !{!72, !1510, !1569}
!1569 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1570, size: 64)
!1570 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1501)
!1571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1572, file: !1499, line: 118)
!1572 = !DISubprogram(name: "ftell", scope: !1502, file: !1502, line: 718, type: !1573, flags: DIFlagPrototyped, spFlags: 0)
!1573 = !DISubroutineType(types: !1574)
!1574 = !{!36, !1510}
!1575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1576, file: !1499, line: 119)
!1576 = !DISubprogram(name: "fwrite", scope: !1502, file: !1502, line: 681, type: !1577, flags: DIFlagPrototyped, spFlags: 0)
!1577 = !DISubroutineType(types: !1578)
!1578 = !{!973, !1579, !973, !973, !1527}
!1579 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !323)
!1580 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1581, file: !1499, line: 120)
!1581 = !DISubprogram(name: "getc", scope: !1502, file: !1502, line: 514, type: !1513, flags: DIFlagPrototyped, spFlags: 0)
!1582 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1583, file: !1499, line: 121)
!1583 = !DISubprogram(name: "getchar", scope: !1502, file: !1502, line: 520, type: !1415, flags: DIFlagPrototyped, spFlags: 0)
!1584 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1585, file: !1499, line: 124)
!1585 = !DISubprogram(name: "gets", scope: !1502, file: !1502, line: 605, type: !1586, flags: DIFlagPrototyped, spFlags: 0)
!1586 = !DISubroutineType(types: !1587)
!1587 = !{!1046, !1046}
!1588 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1589, file: !1499, line: 126)
!1589 = !DISubprogram(name: "perror", scope: !1502, file: !1502, line: 804, type: !1590, flags: DIFlagPrototyped, spFlags: 0)
!1590 = !DISubroutineType(types: !1591)
!1591 = !{null, !976}
!1592 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1593, file: !1499, line: 127)
!1593 = !DISubprogram(name: "printf", scope: !1502, file: !1502, line: 356, type: !1594, flags: DIFlagPrototyped, spFlags: 0)
!1594 = !DISubroutineType(types: !1595)
!1595 = !{!72, !975, null}
!1596 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1597, file: !1499, line: 128)
!1597 = !DISubprogram(name: "putc", scope: !1502, file: !1502, line: 550, type: !1544, flags: DIFlagPrototyped, spFlags: 0)
!1598 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1599, file: !1499, line: 129)
!1599 = !DISubprogram(name: "putchar", scope: !1502, file: !1502, line: 556, type: !1292, flags: DIFlagPrototyped, spFlags: 0)
!1600 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1601, file: !1499, line: 130)
!1601 = !DISubprogram(name: "puts", scope: !1502, file: !1502, line: 661, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1602 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1603, file: !1499, line: 131)
!1603 = !DISubprogram(name: "remove", scope: !1502, file: !1502, line: 152, type: !1349, flags: DIFlagPrototyped, spFlags: 0)
!1604 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1605, file: !1499, line: 132)
!1605 = !DISubprogram(name: "rename", scope: !1502, file: !1502, line: 154, type: !1606, flags: DIFlagPrototyped, spFlags: 0)
!1606 = !DISubroutineType(types: !1607)
!1607 = !{!72, !976, !976}
!1608 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1609, file: !1499, line: 133)
!1609 = !DISubprogram(name: "rewind", scope: !1502, file: !1502, line: 723, type: !1508, flags: DIFlagPrototyped, spFlags: 0)
!1610 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1611, file: !1499, line: 134)
!1611 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !1502, file: !1502, line: 437, type: !1594, flags: DIFlagPrototyped, spFlags: 0)
!1612 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1613, file: !1499, line: 135)
!1613 = !DISubprogram(name: "setbuf", scope: !1502, file: !1502, line: 328, type: !1614, flags: DIFlagPrototyped, spFlags: 0)
!1614 = !DISubroutineType(types: !1615)
!1615 = !{null, !1527, !1045}
!1616 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1617, file: !1499, line: 136)
!1617 = !DISubprogram(name: "setvbuf", scope: !1502, file: !1502, line: 332, type: !1618, flags: DIFlagPrototyped, spFlags: 0)
!1618 = !DISubroutineType(types: !1619)
!1619 = !{!72, !1527, !1045, !72, !973}
!1620 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1621, file: !1499, line: 137)
!1621 = !DISubprogram(name: "sprintf", scope: !1502, file: !1502, line: 358, type: !1622, flags: DIFlagPrototyped, spFlags: 0)
!1622 = !DISubroutineType(types: !1623)
!1623 = !{!72, !1045, !975, null}
!1624 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1625, file: !1499, line: 138)
!1625 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !1502, file: !1502, line: 439, type: !1626, flags: DIFlagPrototyped, spFlags: 0)
!1626 = !DISubroutineType(types: !1627)
!1627 = !{!72, !975, !975, null}
!1628 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1629, file: !1499, line: 139)
!1629 = !DISubprogram(name: "tmpfile", scope: !1502, file: !1502, line: 188, type: !1630, flags: DIFlagPrototyped, spFlags: 0)
!1630 = !DISubroutineType(types: !1631)
!1631 = !{!1510}
!1632 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1633, file: !1499, line: 141)
!1633 = !DISubprogram(name: "tmpnam", scope: !1502, file: !1502, line: 205, type: !1586, flags: DIFlagPrototyped, spFlags: 0)
!1634 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1635, file: !1499, line: 143)
!1635 = !DISubprogram(name: "ungetc", scope: !1502, file: !1502, line: 668, type: !1544, flags: DIFlagPrototyped, spFlags: 0)
!1636 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1637, file: !1499, line: 144)
!1637 = !DISubprogram(name: "vfprintf", scope: !1502, file: !1502, line: 365, type: !1638, flags: DIFlagPrototyped, spFlags: 0)
!1638 = !DISubroutineType(types: !1639)
!1639 = !{!72, !1527, !975, !1017}
!1640 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1641, file: !1499, line: 145)
!1641 = !DISubprogram(name: "vprintf", scope: !1502, file: !1502, line: 371, type: !1642, flags: DIFlagPrototyped, spFlags: 0)
!1642 = !DISubroutineType(types: !1643)
!1643 = !{!72, !975, !1017}
!1644 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1645, file: !1499, line: 146)
!1645 = !DISubprogram(name: "vsprintf", scope: !1502, file: !1502, line: 373, type: !1646, flags: DIFlagPrototyped, spFlags: 0)
!1646 = !DISubroutineType(types: !1647)
!1647 = !{!72, !1045, !975, !1017}
!1648 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1649, file: !1499, line: 175)
!1649 = !DISubprogram(name: "snprintf", scope: !1502, file: !1502, line: 378, type: !1650, flags: DIFlagPrototyped, spFlags: 0)
!1650 = !DISubroutineType(types: !1651)
!1651 = !{!72, !1045, !973, !975, null}
!1652 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1653, file: !1499, line: 176)
!1653 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !1502, file: !1502, line: 479, type: !1638, flags: DIFlagPrototyped, spFlags: 0)
!1654 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1655, file: !1499, line: 177)
!1655 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !1502, file: !1502, line: 484, type: !1642, flags: DIFlagPrototyped, spFlags: 0)
!1656 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1657, file: !1499, line: 178)
!1657 = !DISubprogram(name: "vsnprintf", scope: !1502, file: !1502, line: 382, type: !1658, flags: DIFlagPrototyped, spFlags: 0)
!1658 = !DISubroutineType(types: !1659)
!1659 = !{!72, !1045, !973, !975, !1017}
!1660 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !1160, entity: !1661, file: !1499, line: 179)
!1661 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !1502, file: !1502, line: 487, type: !1662, flags: DIFlagPrototyped, spFlags: 0)
!1662 = !DISubroutineType(types: !1663)
!1663 = !{!72, !975, !975, !1017}
!1664 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1649, file: !1499, line: 185)
!1665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1653, file: !1499, line: 186)
!1666 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1655, file: !1499, line: 187)
!1667 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1657, file: !1499, line: 188)
!1668 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1661, file: !1499, line: 189)
!1669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1670, file: !1674, line: 82)
!1670 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !1671, line: 48, baseType: !1672)
!1671 = !DIFile(filename: "/usr/include/wctype.h", directory: "", checksumkind: CSK_MD5, checksum: "9bcd8e8b8cd2078c8a6c42e262af7d7b")
!1672 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1673, size: 64)
!1673 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1209)
!1674 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cwctype", directory: "")
!1675 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1676, file: !1674, line: 83)
!1676 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !1677, line: 38, baseType: !194)
!1677 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/wctype-wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "48fed714a84c77fca0455b433489fc47")
!1678 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !919, file: !1674, line: 84)
!1679 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1680, file: !1674, line: 86)
!1680 = !DISubprogram(name: "iswalnum", scope: !1677, file: !1677, line: 95, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1682, file: !1674, line: 87)
!1682 = !DISubprogram(name: "iswalpha", scope: !1677, file: !1677, line: 101, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1683 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1684, file: !1674, line: 89)
!1684 = !DISubprogram(name: "iswblank", scope: !1677, file: !1677, line: 146, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1686, file: !1674, line: 91)
!1686 = !DISubprogram(name: "iswcntrl", scope: !1677, file: !1677, line: 104, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1687 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1688, file: !1674, line: 92)
!1688 = !DISubprogram(name: "iswctype", scope: !1677, file: !1677, line: 159, type: !1689, flags: DIFlagPrototyped, spFlags: 0)
!1689 = !DISubroutineType(types: !1690)
!1690 = !{!72, !919, !1676}
!1691 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1692, file: !1674, line: 93)
!1692 = !DISubprogram(name: "iswdigit", scope: !1677, file: !1677, line: 108, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1694, file: !1674, line: 94)
!1694 = !DISubprogram(name: "iswgraph", scope: !1677, file: !1677, line: 112, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1696, file: !1674, line: 95)
!1696 = !DISubprogram(name: "iswlower", scope: !1677, file: !1677, line: 117, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1697 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1698, file: !1674, line: 96)
!1698 = !DISubprogram(name: "iswprint", scope: !1677, file: !1677, line: 120, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1700, file: !1674, line: 97)
!1700 = !DISubprogram(name: "iswpunct", scope: !1677, file: !1677, line: 125, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1702, file: !1674, line: 98)
!1702 = !DISubprogram(name: "iswspace", scope: !1677, file: !1677, line: 130, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1704, file: !1674, line: 99)
!1704 = !DISubprogram(name: "iswupper", scope: !1677, file: !1677, line: 135, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1705 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1706, file: !1674, line: 100)
!1706 = !DISubprogram(name: "iswxdigit", scope: !1677, file: !1677, line: 140, type: !1123, flags: DIFlagPrototyped, spFlags: 0)
!1707 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1708, file: !1674, line: 101)
!1708 = !DISubprogram(name: "towctrans", scope: !1671, file: !1671, line: 55, type: !1709, flags: DIFlagPrototyped, spFlags: 0)
!1709 = !DISubroutineType(types: !1710)
!1710 = !{!919, !919, !1670}
!1711 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1712, file: !1674, line: 102)
!1712 = !DISubprogram(name: "towlower", scope: !1677, file: !1677, line: 166, type: !1713, flags: DIFlagPrototyped, spFlags: 0)
!1713 = !DISubroutineType(types: !1714)
!1714 = !{!919, !919}
!1715 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1716, file: !1674, line: 103)
!1716 = !DISubprogram(name: "towupper", scope: !1677, file: !1677, line: 169, type: !1713, flags: DIFlagPrototyped, spFlags: 0)
!1717 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1718, file: !1674, line: 104)
!1718 = !DISubprogram(name: "wctrans", scope: !1671, file: !1671, line: 52, type: !1719, flags: DIFlagPrototyped, spFlags: 0)
!1719 = !DISubroutineType(types: !1720)
!1720 = !{!1670, !976}
!1721 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1722, file: !1674, line: 105)
!1722 = !DISubprogram(name: "wctype", scope: !1677, file: !1677, line: 155, type: !1723, flags: DIFlagPrototyped, spFlags: 0)
!1723 = !DISubroutineType(types: !1724)
!1724 = !{!1676, !976}
!1725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1726, file: !1729, line: 60)
!1726 = !DIDerivedType(tag: DW_TAG_typedef, name: "clock_t", file: !1727, line: 7, baseType: !1728)
!1727 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/clock_t.h", directory: "", checksumkind: CSK_MD5, checksum: "1aade99fd778d1551600c7ca1410b9f1")
!1728 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clock_t", file: !43, line: 156, baseType: !36)
!1729 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ctime", directory: "")
!1730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !101, file: !1729, line: 61)
!1731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1070, file: !1729, line: 62)
!1732 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1733, file: !1729, line: 64)
!1733 = !DISubprogram(name: "clock", scope: !1734, file: !1734, line: 72, type: !1735, flags: DIFlagPrototyped, spFlags: 0)
!1734 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "db37158473a25e1d89b19f8bc6892801")
!1735 = !DISubroutineType(types: !1736)
!1736 = !{!1726}
!1737 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1738, file: !1729, line: 65)
!1738 = !DISubprogram(name: "difftime", scope: !1734, file: !1734, line: 79, type: !1739, flags: DIFlagPrototyped, spFlags: 0)
!1739 = !DISubroutineType(types: !1740)
!1740 = !{!1097, !101, !101}
!1741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1742, file: !1729, line: 66)
!1742 = !DISubprogram(name: "mktime", scope: !1734, file: !1734, line: 83, type: !1743, flags: DIFlagPrototyped, spFlags: 0)
!1743 = !DISubroutineType(types: !1744)
!1744 = !{!101, !1745}
!1745 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1070, size: 64)
!1746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1747, file: !1729, line: 67)
!1747 = !DISubprogram(name: "time", scope: !1734, file: !1734, line: 76, type: !1748, flags: DIFlagPrototyped, spFlags: 0)
!1748 = !DISubroutineType(types: !1749)
!1749 = !{!101, !1750}
!1750 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!1751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1752, file: !1729, line: 68)
!1752 = !DISubprogram(name: "asctime", scope: !1734, file: !1734, line: 179, type: !1753, flags: DIFlagPrototyped, spFlags: 0)
!1753 = !DISubroutineType(types: !1754)
!1754 = !{!1046, !1068}
!1755 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1756, file: !1729, line: 69)
!1756 = !DISubprogram(name: "ctime", scope: !1734, file: !1734, line: 183, type: !1757, flags: DIFlagPrototyped, spFlags: 0)
!1757 = !DISubroutineType(types: !1758)
!1758 = !{!1046, !1759}
!1759 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1760, size: 64)
!1760 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !101)
!1761 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1762, file: !1729, line: 70)
!1762 = !DISubprogram(name: "gmtime", scope: !1734, file: !1734, line: 132, type: !1763, flags: DIFlagPrototyped, spFlags: 0)
!1763 = !DISubroutineType(types: !1764)
!1764 = !{!1745, !1759}
!1765 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1766, file: !1729, line: 71)
!1766 = !DISubprogram(name: "localtime", scope: !1734, file: !1734, line: 136, type: !1763, flags: DIFlagPrototyped, spFlags: 0)
!1767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !2, entity: !1768, file: !1729, line: 72)
!1768 = !DISubprogram(name: "strftime", scope: !1734, file: !1734, line: 100, type: !1769, flags: DIFlagPrototyped, spFlags: 0)
!1769 = !DISubroutineType(types: !1770)
!1770 = !{!973, !1045, !973, !975, !1067}
!1771 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !9, entity: !2, file: !879, line: 6)
!1772 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "spinlock", file: !1773, line: 3, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !1774, identifier: "_ZTS8spinlock")
!1773 = !DIFile(filename: "spinlock.h", directory: "/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/FieldAnalysis/test/Huron/atomic_lock", checksumkind: CSK_MD5, checksum: "d94e372c9ca11cc838e11edc718f9c08")
!1774 = !{!1775, !1776, !1780}
!1775 = !DIDerivedType(tag: DW_TAG_member, name: "locked", scope: !1772, file: !1773, line: 13, baseType: !635, size: 8)
!1776 = !DISubprogram(name: "lock", linkageName: "_ZN8spinlock4lockEv", scope: !1772, file: !1773, line: 5, type: !1777, scopeLine: 5, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1777 = !DISubroutineType(types: !1778)
!1778 = !{null, !1779}
!1779 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1772, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1780 = !DISubprogram(name: "unlock", linkageName: "_ZN8spinlock6unlockEv", scope: !1772, file: !1773, line: 9, type: !1777, scopeLine: 9, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!1781 = !{i32 7, !"Dwarf Version", i32 5}
!1782 = !{i32 2, !"Debug Info Version", i32 3}
!1783 = !{i32 1, !"wchar_size", i32 4}
!1784 = !{i32 8, !"PIC Level", i32 2}
!1785 = !{i32 7, !"PIE Level", i32 2}
!1786 = !{i32 7, !"uwtable", i32 2}
!1787 = !{i32 7, !"frame-pointer", i32 2}
!1788 = !{!"clang version 19.1.0-rc3 (/mnt/hgfs/graduate/LLVM/llvm-project-19/llvm-project/clang 855100b521da839a0e8c6c01be385a833b1291d1)"}
!1789 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !879, file: !879, type: !245, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9)
!1790 = !DILocation(line: 74, column: 25, scope: !1791)
!1791 = !DILexicalBlockFile(scope: !1789, file: !3, discriminator: 0)
!1792 = !DILocation(line: 0, scope: !1789)
!1793 = distinct !DISubprogram(name: "thread_print", linkageName: "_Z12thread_printm", scope: !879, file: !879, line: 10, type: !1794, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !109)
!1794 = !DISubroutineType(types: !1795)
!1795 = !{null, !973}
!1796 = !DILocalVariable(name: "tid", arg: 1, scope: !1793, file: !879, line: 10, type: !973)
!1797 = !DILocation(line: 10, column: 26, scope: !1793)
!1798 = !DILocation(line: 11, column: 10, scope: !1793)
!1799 = !DILocation(line: 12, column: 10, scope: !1793)
!1800 = !DILocation(line: 12, column: 34, scope: !1793)
!1801 = !DILocation(line: 12, column: 31, scope: !1793)
!1802 = !DILocation(line: 12, column: 38, scope: !1793)
!1803 = !DILocation(line: 13, column: 44, scope: !1793)
!1804 = !DILocation(line: 13, column: 28, scope: !1793)
!1805 = !DILocation(line: 13, column: 5, scope: !1793)
!1806 = !DILocation(line: 14, column: 10, scope: !1793)
!1807 = !DILocation(line: 14, column: 26, scope: !1793)
!1808 = !DILocation(line: 14, column: 23, scope: !1793)
!1809 = !DILocation(line: 14, column: 30, scope: !1793)
!1810 = !DILocation(line: 15, column: 10, scope: !1793)
!1811 = !DILocation(line: 16, column: 1, scope: !1793)
!1812 = distinct !DISubprogram(name: "lock", linkageName: "_ZN8spinlock4lockEv", scope: !1772, file: !1773, line: 5, type: !1777, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !1776, retainedNodes: !109)
!1813 = !DILocalVariable(name: "this", arg: 1, scope: !1812, type: !1814, flags: DIFlagArtificial | DIFlagObjectPointer)
!1814 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1772, size: 64)
!1815 = !DILocation(line: 0, scope: !1812)
!1816 = !DILocation(line: 6, column: 9, scope: !1812)
!1817 = !DILocation(line: 6, column: 16, scope: !1812)
!1818 = !DILocalVariable(name: "this", arg: 1, scope: !1819, type: !1820, flags: DIFlagArtificial | DIFlagObjectPointer)
!1819 = distinct !DISubprogram(name: "test_and_set", linkageName: "_ZNSt11atomic_flag12test_and_setESt12memory_order", scope: !635, file: !13, line: 210, type: !665, scopeLine: 211, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !664, retainedNodes: !109)
!1820 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !635, size: 64)
!1821 = !DILocation(line: 0, scope: !1819, inlinedAt: !1822)
!1822 = distinct !DILocation(line: 6, column: 23, scope: !1812)
!1823 = !DILocalVariable(name: "__m", arg: 2, scope: !1819, file: !13, line: 210, type: !100)
!1824 = !DILocation(line: 210, column: 31, scope: !1819, inlinedAt: !1822)
!1825 = !DILocation(line: 212, column: 48, scope: !1819, inlinedAt: !1822)
!1826 = !DILocation(line: 212, column: 14, scope: !1819, inlinedAt: !1822)
!1827 = distinct !{!1827, !1816, !1828, !1829}
!1828 = !DILocation(line: 6, column: 68, scope: !1812)
!1829 = !{!"llvm.loop.mustprogress"}
!1830 = !DILocation(line: 7, column: 5, scope: !1812)
!1831 = distinct !DISubprogram(name: "sleep_for<long, std::ratio<1L, 1L> >", linkageName: "_ZNSt11this_thread9sleep_forIlSt5ratioILl1ELl1EEEEvRKNSt6chrono8durationIT_T0_EE", scope: !1833, file: !1832, line: 70, type: !1834, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !1836, retainedNodes: !109)
!1832 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/this_thread_sleep.h", directory: "")
!1833 = !DINamespace(name: "this_thread", scope: !2)
!1834 = !DISubroutineType(types: !1835)
!1835 = !{null, !51}
!1836 = !{!89, !1837}
!1837 = !DITemplateTypeParameter(name: "_Period", type: !91)
!1838 = !DILocalVariable(name: "__rtime", arg: 1, scope: !1831, file: !1832, line: 70, type: !51)
!1839 = !DILocation(line: 70, column: 56, scope: !1831)
!1840 = !DILocation(line: 72, column: 6, scope: !1841)
!1841 = distinct !DILexicalBlock(scope: !1831, file: !1832, line: 72, column: 6)
!1842 = !DILocation(line: 72, column: 17, scope: !1841)
!1843 = !DILocation(line: 72, column: 14, scope: !1841)
!1844 = !DILocation(line: 72, column: 6, scope: !1831)
!1845 = !DILocation(line: 73, column: 4, scope: !1841)
!1846 = !DILocalVariable(name: "__s", scope: !1831, file: !1832, line: 74, type: !1847)
!1847 = !DIDerivedType(tag: DW_TAG_typedef, name: "__enable_if_is_duration<std::chrono::duration<long> >", scope: !31, file: !30, line: 255, baseType: !1848)
!1848 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !1849, file: !468, line: 2199, baseType: !32)
!1849 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "enable_if<true, std::chrono::duration<long, std::ratio<1L, 1L> > >", scope: !2, file: !468, line: 2198, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !1850, identifier: "_ZTSSt9enable_ifILb1ENSt6chrono8durationIlSt5ratioILl1ELl1EEEEE")
!1850 = !{!1851, !1852}
!1851 = !DITemplateValueParameter(type: !108, value: i8 1)
!1852 = !DITemplateTypeParameter(name: "_Tp", type: !32)
!1853 = !DILocation(line: 74, column: 7, scope: !1831)
!1854 = !DILocation(line: 74, column: 52, scope: !1831)
!1855 = !DILocation(line: 74, column: 13, scope: !1831)
!1856 = !DILocalVariable(name: "__ns", scope: !1831, file: !1832, line: 75, type: !1857)
!1857 = !DIDerivedType(tag: DW_TAG_typedef, name: "__enable_if_is_duration<std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !31, file: !30, line: 255, baseType: !1858)
!1858 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !1859, file: !468, line: 2199, baseType: !121)
!1859 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "enable_if<true, std::chrono::duration<long, std::ratio<1L, 1000000000L> > >", scope: !2, file: !468, line: 2198, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !1860, identifier: "_ZTSSt9enable_ifILb1ENSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEEE")
!1860 = !{!1851, !1861}
!1861 = !DITemplateTypeParameter(name: "_Tp", type: !121)
!1862 = !DILocation(line: 75, column: 7, scope: !1831)
!1863 = !DILocation(line: 75, column: 57, scope: !1831)
!1864 = !DILocation(line: 75, column: 65, scope: !1831)
!1865 = !DILocation(line: 75, column: 14, scope: !1831)
!1866 = !DILocalVariable(name: "__ts", scope: !1831, file: !1832, line: 77, type: !1867)
!1867 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !1868, line: 11, size: 128, flags: DIFlagTypePassByValue, elements: !1869, identifier: "_ZTS8timespec")
!1868 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!1869 = !{!1870, !1871}
!1870 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !1867, file: !1868, line: 16, baseType: !103, size: 64)
!1871 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !1867, file: !1868, line: 21, baseType: !1872, size: 64, offset: 64)
!1872 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !43, line: 197, baseType: !36)
!1873 = !DILocation(line: 77, column: 20, scope: !1831)
!1874 = !DILocation(line: 78, column: 4, scope: !1831)
!1875 = !DILocation(line: 79, column: 35, scope: !1831)
!1876 = !DILocation(line: 80, column: 29, scope: !1831)
!1877 = !DILocation(line: 82, column: 2, scope: !1831)
!1878 = !DILocation(line: 82, column: 9, scope: !1831)
!1879 = !DILocation(line: 82, column: 35, scope: !1831)
!1880 = !DILocation(line: 82, column: 41, scope: !1831)
!1881 = !DILocation(line: 82, column: 44, scope: !1831)
!1882 = !DILocation(line: 82, column: 50, scope: !1831)
!1883 = !DILocation(line: 0, scope: !1831)
!1884 = distinct !{!1884, !1877, !1885, !1829}
!1885 = !DILocation(line: 83, column: 6, scope: !1831)
!1886 = !DILocation(line: 87, column: 7, scope: !1831)
!1887 = distinct !DISubprogram(name: "duration<int, void>", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEC2IivEERKT_", scope: !32, file: !30, line: 521, type: !1888, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !1891, declaration: !1890, retainedNodes: !109)
!1888 = !DISubroutineType(types: !1889)
!1889 = !{null, !47, !695}
!1890 = !DISubprogram(name: "duration<int, void>", scope: !32, file: !30, line: 521, type: !1888, scopeLine: 521, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0, templateParams: !1891)
!1891 = !{!1892, !1893}
!1892 = !DITemplateTypeParameter(name: "_Rep2", type: !72)
!1893 = !DITemplateTypeParameter(type: null)
!1894 = !DILocalVariable(name: "this", arg: 1, scope: !1887, type: !1895, flags: DIFlagArtificial | DIFlagObjectPointer)
!1895 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !32, size: 64)
!1896 = !DILocation(line: 0, scope: !1887)
!1897 = !DILocalVariable(name: "__rep", arg: 2, scope: !1887, file: !30, line: 521, type: !695)
!1898 = !DILocation(line: 521, column: 45, scope: !1887)
!1899 = !DILocation(line: 522, column: 6, scope: !1887)
!1900 = !DILocation(line: 522, column: 27, scope: !1887)
!1901 = !DILocation(line: 522, column: 37, scope: !1887)
!1902 = distinct !DISubprogram(name: "unlock", linkageName: "_ZN8spinlock6unlockEv", scope: !1772, file: !1773, line: 9, type: !1777, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !1780, retainedNodes: !109)
!1903 = !DILocalVariable(name: "this", arg: 1, scope: !1902, type: !1814, flags: DIFlagArtificial | DIFlagObjectPointer)
!1904 = !DILocation(line: 0, scope: !1902)
!1905 = !DILocation(line: 10, column: 9, scope: !1902)
!1906 = !DILocalVariable(name: "this", arg: 1, scope: !1907, type: !1820, flags: DIFlagArtificial | DIFlagObjectPointer)
!1907 = distinct !DISubprogram(name: "clear", linkageName: "_ZNSt11atomic_flag5clearESt12memory_order", scope: !635, file: !13, line: 269, type: !671, scopeLine: 270, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !670, retainedNodes: !109)
!1908 = !DILocation(line: 0, scope: !1907, inlinedAt: !1909)
!1909 = distinct !DILocation(line: 10, column: 16, scope: !1902)
!1910 = !DILocalVariable(name: "__m", arg: 2, scope: !1907, file: !13, line: 269, type: !100)
!1911 = !DILocation(line: 269, column: 24, scope: !1907, inlinedAt: !1909)
!1912 = !DILocalVariable(name: "__b", scope: !1907, file: !13, line: 271, type: !100)
!1913 = !DILocation(line: 271, column: 20, scope: !1907, inlinedAt: !1909)
!1914 = !DILocation(line: 272, column: 4, scope: !1907, inlinedAt: !1909)
!1915 = !DILocation(line: 272, column: 8, scope: !1907, inlinedAt: !1909)
!1916 = !DILocation(line: 277, column: 34, scope: !1907, inlinedAt: !1909)
!1917 = !DILocation(line: 277, column: 7, scope: !1907, inlinedAt: !1909)
!1918 = !DILocation(line: 11, column: 5, scope: !1902)
!1919 = distinct !DISubprogram(name: "main", scope: !879, file: !879, line: 18, type: !1415, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !109)
!1920 = !DILocalVariable(name: "th", scope: !1919, file: !879, line: 19, type: !1921)
!1921 = !DICompositeType(tag: DW_TAG_array_type, baseType: !183, size: 128, elements: !1922)
!1922 = !{!1923}
!1923 = !DISubrange(count: 2)
!1924 = !DILocation(line: 19, column: 12, scope: !1919)
!1925 = !DILocation(line: 20, column: 34, scope: !1919)
!1926 = !DILocation(line: 20, column: 13, scope: !1919)
!1927 = !DILocation(line: 20, column: 5, scope: !1919)
!1928 = !DILocation(line: 20, column: 11, scope: !1919)
!1929 = !DILocation(line: 21, column: 34, scope: !1919)
!1930 = !DILocation(line: 21, column: 13, scope: !1919)
!1931 = !DILocation(line: 21, column: 5, scope: !1919)
!1932 = !DILocation(line: 21, column: 11, scope: !1919)
!1933 = !DILocalVariable(name: "__range1", scope: !1934, type: !1935, flags: DIFlagArtificial)
!1934 = distinct !DILexicalBlock(scope: !1919, file: !879, line: 22, column: 5)
!1935 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1921, size: 64)
!1936 = !DILocation(line: 0, scope: !1934)
!1937 = !DILocation(line: 22, column: 21, scope: !1934)
!1938 = !DILocalVariable(name: "__begin1", scope: !1934, type: !1939, flags: DIFlagArtificial)
!1939 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !183, size: 64)
!1940 = !DILocation(line: 22, column: 19, scope: !1934)
!1941 = !DILocalVariable(name: "__end1", scope: !1934, type: !1939, flags: DIFlagArtificial)
!1942 = !DILocalVariable(name: "t", scope: !1943, file: !879, line: 22, type: !219)
!1943 = distinct !DILexicalBlock(scope: !1934, file: !879, line: 22, column: 5)
!1944 = !DILocation(line: 22, column: 18, scope: !1943)
!1945 = !DILocation(line: 22, column: 19, scope: !1943)
!1946 = !DILocation(line: 23, column: 9, scope: !1943)
!1947 = !DILocation(line: 23, column: 11, scope: !1943)
!1948 = !DILocation(line: 22, column: 5, scope: !1934)
!1949 = distinct !{!1949, !1948, !1950}
!1950 = !DILocation(line: 23, column: 16, scope: !1934)
!1951 = !DILocation(line: 25, column: 1, scope: !1919)
!1952 = !DILocation(line: 24, column: 5, scope: !1919)
!1953 = distinct !DISubprogram(name: "thread", linkageName: "_ZNSt6threadC2Ev", scope: !183, file: !182, line: 121, type: !203, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !202, retainedNodes: !109)
!1954 = !DILocalVariable(name: "this", arg: 1, scope: !1953, type: !1939, flags: DIFlagArtificial | DIFlagObjectPointer)
!1955 = !DILocation(line: 0, scope: !1953)
!1956 = !DILocation(line: 121, column: 5, scope: !1953)
!1957 = !DILocation(line: 121, column: 31, scope: !1953)
!1958 = distinct !DISubprogram(name: "thread<void (&)(unsigned long), int, void>", linkageName: "_ZNSt6threadC2IRFvmEJiEvEEOT_DpOT0_", scope: !183, file: !182, line: 127, type: !1959, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !1963, declaration: !1962, retainedNodes: !109)
!1959 = !DISubroutineType(types: !1960)
!1960 = !{null, !205, !1961, !622}
!1961 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !620, size: 64)
!1962 = !DISubprogram(name: "thread<void (&)(unsigned long), int, void>", scope: !183, file: !182, line: 127, type: !1959, scopeLine: 127, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0, templateParams: !1963)
!1963 = !{!1964, !625, !1893}
!1964 = !DITemplateTypeParameter(name: "_Callable", type: !1961)
!1965 = !DILocalVariable(name: "this", arg: 1, scope: !1958, type: !1939, flags: DIFlagArtificial | DIFlagObjectPointer)
!1966 = !DILocation(line: 0, scope: !1958)
!1967 = !DILocalVariable(name: "__f", arg: 2, scope: !1958, file: !182, line: 127, type: !1961)
!1968 = !DILocation(line: 127, column: 26, scope: !1958)
!1969 = !DILocalVariable(name: "__args", arg: 3, scope: !1958, file: !182, line: 127, type: !622)
!1970 = !DILocation(line: 127, column: 42, scope: !1958)
!1971 = !DILocation(line: 127, column: 7, scope: !1958)
!1972 = !DILocalVariable(name: "__depend", scope: !1973, file: !182, line: 138, type: !563)
!1973 = distinct !DILexicalBlock(scope: !1958, file: !182, line: 128, column: 7)
!1974 = !DILocation(line: 138, column: 7, scope: !1973)
!1975 = !DILocation(line: 143, column: 29, scope: !1973)
!1976 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_State_impl<std::thread::_Invoker<std::tuple<void (*)(unsigned long), int> > >", scope: !183, file: !182, line: 201, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !1977, vtableHolder: !282, templateParams: !1984, identifier: "_ZTSNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEE")
!1977 = !{!1978, !1979, !1980}
!1978 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !1976, baseType: !282, extraData: i32 0)
!1979 = !DIDerivedType(tag: DW_TAG_member, name: "_M_func", scope: !1976, file: !182, line: 203, baseType: !867, size: 128, offset: 64)
!1980 = !DISubprogram(name: "_M_run", linkageName: "_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEE6_M_runEv", scope: !1976, file: !182, line: 211, type: !1981, scopeLine: 211, containingType: !1976, virtualIndex: 2, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual)
!1981 = !DISubroutineType(types: !1982)
!1982 = !{null, !1983}
!1983 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1976, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1984 = !{!1985}
!1985 = !DITemplateTypeParameter(name: "_Callable", type: !867)
!1986 = !DILocation(line: 144, column: 32, scope: !1973)
!1987 = !DILocation(line: 144, column: 58, scope: !1973)
!1988 = !DILocation(line: 143, column: 33, scope: !1973)
!1989 = !DILocation(line: 143, column: 18, scope: !1973)
!1990 = !DILocation(line: 143, column: 2, scope: !1973)
!1991 = !DILocation(line: 146, column: 7, scope: !1958)
!1992 = !DILocation(line: 146, column: 7, scope: !1973)
!1993 = distinct !DISubprogram(name: "operator=", linkageName: "_ZNSt6threadaSEOS_", scope: !183, file: !182, line: 162, type: !221, scopeLine: 163, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !220, retainedNodes: !109)
!1994 = !DILocalVariable(name: "this", arg: 1, scope: !1993, type: !1939, flags: DIFlagArtificial | DIFlagObjectPointer)
!1995 = !DILocation(line: 0, scope: !1993)
!1996 = !DILocalVariable(name: "__t", arg: 2, scope: !1993, file: !182, line: 162, type: !215)
!1997 = !DILocation(line: 162, column: 32, scope: !1993)
!1998 = !DILocation(line: 164, column: 11, scope: !1999)
!1999 = distinct !DILexicalBlock(scope: !1993, file: !182, line: 164, column: 11)
!2000 = !DILocation(line: 164, column: 11, scope: !1993)
!2001 = !DILocation(line: 165, column: 2, scope: !1999)
!2002 = !DILocation(line: 166, column: 12, scope: !1993)
!2003 = !DILocation(line: 166, column: 7, scope: !1993)
!2004 = !DILocation(line: 167, column: 7, scope: !1993)
!2005 = distinct !DISubprogram(name: "~thread", linkageName: "_ZNSt6threadD2Ev", scope: !183, file: !182, line: 149, type: !203, scopeLine: 150, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !206, retainedNodes: !109)
!2006 = !DILocalVariable(name: "this", arg: 1, scope: !2005, type: !1939, flags: DIFlagArtificial | DIFlagObjectPointer)
!2007 = !DILocation(line: 0, scope: !2005)
!2008 = !DILocation(line: 151, column: 11, scope: !2009)
!2009 = distinct !DILexicalBlock(scope: !2010, file: !182, line: 151, column: 11)
!2010 = distinct !DILexicalBlock(scope: !2005, file: !182, line: 150, column: 5)
!2011 = !DILocation(line: 151, column: 11, scope: !2010)
!2012 = !DILocation(line: 152, column: 2, scope: !2009)
!2013 = !DILocation(line: 153, column: 5, scope: !2005)
!2014 = distinct !DISubprogram(name: "operator&", linkageName: "_ZStanSt12memory_orderSt23__memory_order_modifier", scope: !2, file: !13, line: 104, type: !2015, scopeLine: 105, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !109)
!2015 = !DISubroutineType(types: !2016)
!2016 = !{!100, !100, !22}
!2017 = !DILocalVariable(name: "__m", arg: 1, scope: !2014, file: !13, line: 104, type: !100)
!2018 = !DILocation(line: 104, column: 26, scope: !2014)
!2019 = !DILocalVariable(name: "__mod", arg: 2, scope: !2014, file: !13, line: 104, type: !22)
!2020 = !DILocation(line: 104, column: 55, scope: !2014)
!2021 = !DILocation(line: 106, column: 29, scope: !2014)
!2022 = !DILocation(line: 106, column: 40, scope: !2014)
!2023 = !DILocation(line: 106, column: 34, scope: !2014)
!2024 = !DILocation(line: 106, column: 5, scope: !2014)
!2025 = distinct !DISubprogram(name: "id", linkageName: "_ZNSt6thread2idC2Ev", scope: !186, file: !182, line: 86, type: !196, scopeLine: 86, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !195, retainedNodes: !109)
!2026 = !DILocalVariable(name: "this", arg: 1, scope: !2025, type: !2027, flags: DIFlagArtificial | DIFlagObjectPointer)
!2027 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!2028 = !DILocation(line: 0, scope: !2025)
!2029 = !DILocation(line: 86, column: 23, scope: !2025)
!2030 = !DILocation(line: 86, column: 37, scope: !2025)
!2031 = distinct !DISubprogram(name: "joinable", linkageName: "_ZNKSt6thread8joinableEv", scope: !183, file: !182, line: 175, type: !227, scopeLine: 176, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !226, retainedNodes: !109)
!2032 = !DILocalVariable(name: "this", arg: 1, scope: !2031, type: !2033, flags: DIFlagArtificial | DIFlagObjectPointer)
!2033 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !211, size: 64)
!2034 = !DILocation(line: 0, scope: !2031)
!2035 = !DILocation(line: 176, column: 16, scope: !2031)
!2036 = !DILocation(line: 176, column: 25, scope: !2031)
!2037 = !DILocation(line: 176, column: 22, scope: !2031)
!2038 = !DILocation(line: 176, column: 14, scope: !2031)
!2039 = !DILocation(line: 176, column: 7, scope: !2031)
!2040 = distinct !DISubprogram(name: "swap", linkageName: "_ZNSt6thread4swapERS_", scope: !183, file: !182, line: 171, type: !224, scopeLine: 172, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !223, retainedNodes: !109)
!2041 = !DILocalVariable(name: "this", arg: 1, scope: !2040, type: !1939, flags: DIFlagArtificial | DIFlagObjectPointer)
!2042 = !DILocation(line: 0, scope: !2040)
!2043 = !DILocalVariable(name: "__t", arg: 2, scope: !2040, file: !182, line: 171, type: !219)
!2044 = !DILocation(line: 171, column: 18, scope: !2040)
!2045 = !DILocation(line: 172, column: 17, scope: !2040)
!2046 = !DILocation(line: 172, column: 24, scope: !2040)
!2047 = !DILocation(line: 172, column: 28, scope: !2040)
!2048 = !DILocation(line: 172, column: 7, scope: !2040)
!2049 = !DILocation(line: 172, column: 36, scope: !2040)
!2050 = distinct !DISubprogram(name: "operator==", linkageName: "_ZSteqNSt6thread2idES0_", scope: !2, file: !182, line: 287, type: !2051, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, retainedNodes: !109)
!2051 = !DISubroutineType(types: !2052)
!2052 = !{!108, !186, !186}
!2053 = !DILocalVariable(name: "__x", arg: 1, scope: !2050, file: !182, line: 287, type: !186)
!2054 = !DILocation(line: 287, column: 25, scope: !2050)
!2055 = !DILocalVariable(name: "__y", arg: 2, scope: !2050, file: !182, line: 287, type: !186)
!2056 = !DILocation(line: 287, column: 41, scope: !2050)
!2057 = !DILocation(line: 293, column: 16, scope: !2050)
!2058 = !DILocation(line: 293, column: 33, scope: !2050)
!2059 = !DILocation(line: 293, column: 26, scope: !2050)
!2060 = !DILocation(line: 293, column: 5, scope: !2050)
!2061 = distinct !DISubprogram(name: "swap<std::thread::id>", linkageName: "_ZSt4swapINSt6thread2idEENSt9enable_ifIXsr6__and_ISt6__not_ISt15__is_tuple_likeIT_EESt21is_move_constructibleIS5_ESt18is_move_assignableIS5_EEE5valueEvE4typeERS5_SE_", scope: !2, file: !2062, line: 196, type: !2063, scopeLine: 199, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2070, retainedNodes: !109)
!2062 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/move.h", directory: "", checksumkind: CSK_MD5, checksum: "156ce13c58f77c44098165fa0e6b5efc")
!2063 = !DISubroutineType(types: !2064)
!2064 = !{!2065, !2069, !2069}
!2065 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2066, file: !468, line: 2199, baseType: null)
!2066 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "enable_if<true, void>", scope: !2, file: !468, line: 2198, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !2067, identifier: "_ZTSSt9enable_ifILb1EvE")
!2067 = !{!1851, !2068}
!2068 = !DITemplateTypeParameter(name: "_Tp", type: null, defaulted: true)
!2069 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !186, size: 64)
!2070 = !{!2071}
!2071 = !DITemplateTypeParameter(name: "_Tp", type: !186)
!2072 = !DILocalVariable(name: "__a", arg: 1, scope: !2061, file: !2062, line: 196, type: !2069)
!2073 = !DILocation(line: 196, column: 15, scope: !2061)
!2074 = !DILocalVariable(name: "__b", arg: 2, scope: !2061, file: !2062, line: 196, type: !2069)
!2075 = !DILocation(line: 196, column: 25, scope: !2061)
!2076 = !DILocalVariable(name: "__tmp", scope: !2061, file: !2062, line: 204, type: !186)
!2077 = !DILocation(line: 204, column: 11, scope: !2061)
!2078 = !DILocation(line: 204, column: 19, scope: !2061)
!2079 = !DILocation(line: 205, column: 13, scope: !2061)
!2080 = !DILocation(line: 205, column: 7, scope: !2061)
!2081 = !DILocation(line: 205, column: 11, scope: !2061)
!2082 = !DILocation(line: 206, column: 7, scope: !2061)
!2083 = !DILocation(line: 206, column: 11, scope: !2061)
!2084 = !DILocation(line: 207, column: 5, scope: !2061)
!2085 = distinct !DISubprogram(name: "operator<=<long, std::ratio<1L, 1L>, long, std::ratio<1L, 1L> >", linkageName: "_ZNSt6chronoleIlSt5ratioILl1ELl1EElS2_EEbRKNS_8durationIT_T0_EERKNS3_IT1_T2_EE", scope: !31, file: !30, line: 805, type: !106, scopeLine: 807, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !110, retainedNodes: !109)
!2086 = !DILocalVariable(name: "__lhs", arg: 1, scope: !2085, file: !30, line: 805, type: !51)
!2087 = !DILocation(line: 805, column: 51, scope: !2085)
!2088 = !DILocalVariable(name: "__rhs", arg: 2, scope: !2085, file: !30, line: 806, type: !51)
!2089 = !DILocation(line: 806, column: 37, scope: !2085)
!2090 = !DILocation(line: 807, column: 18, scope: !2085)
!2091 = !DILocation(line: 807, column: 26, scope: !2085)
!2092 = !DILocation(line: 807, column: 24, scope: !2085)
!2093 = !DILocation(line: 807, column: 16, scope: !2085)
!2094 = !DILocation(line: 807, column: 9, scope: !2085)
!2095 = distinct !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEE4zeroEv", scope: !32, file: !30, line: 623, type: !84, scopeLine: 624, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !83)
!2096 = !DILocation(line: 624, column: 20, scope: !2095)
!2097 = !DILocation(line: 624, column: 11, scope: !2095)
!2098 = !DILocation(line: 624, column: 4, scope: !2095)
!2099 = distinct !DISubprogram(name: "duration_cast<std::chrono::duration<long, std::ratio<1L, 1L> >, long, std::ratio<1L, 1L> >", linkageName: "_ZNSt6chrono13duration_castINS_8durationIlSt5ratioILl1ELl1EEEElS3_EENSt9enable_ifIXsr13__is_durationIT_EE5valueES6_E4typeERKNS1_IT0_T1_EE", scope: !31, file: !30, line: 267, type: !2100, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2102, retainedNodes: !109)
!2100 = !DISubroutineType(types: !2101)
!2101 = !{!1847, !51}
!2102 = !{!2103, !89, !1837}
!2103 = !DITemplateTypeParameter(name: "_ToDur", type: !32)
!2104 = !DILocalVariable(name: "__d", arg: 1, scope: !2099, file: !30, line: 267, type: !51)
!2105 = !DILocation(line: 267, column: 52, scope: !2099)
!2106 = !DILocation(line: 276, column: 22, scope: !2099)
!2107 = !DILocation(line: 276, column: 9, scope: !2099)
!2108 = !DILocation(line: 276, column: 2, scope: !2099)
!2109 = distinct !DISubprogram(name: "duration_cast<std::chrono::duration<long, std::ratio<1L, 1000000000L> >, long, std::ratio<1L, 1L> >", linkageName: "_ZNSt6chrono13duration_castINS_8durationIlSt5ratioILl1ELl1000000000EEEElS2_ILl1ELl1EEEENSt9enable_ifIXsr13__is_durationIT_EE5valueES7_E4typeERKNS1_IT0_T1_EE", scope: !31, file: !30, line: 267, type: !2110, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2112, retainedNodes: !109)
!2110 = !DISubroutineType(types: !2111)
!2111 = !{!1857, !51}
!2112 = !{!2113, !89, !1837}
!2113 = !DITemplateTypeParameter(name: "_ToDur", type: !121)
!2114 = !DILocalVariable(name: "__d", arg: 1, scope: !2109, file: !30, line: 267, type: !51)
!2115 = !DILocation(line: 267, column: 52, scope: !2109)
!2116 = !DILocation(line: 276, column: 22, scope: !2109)
!2117 = !DILocation(line: 276, column: 9, scope: !2109)
!2118 = !DILocation(line: 276, column: 2, scope: !2109)
!2119 = !DILocalVariable(name: "__lhs", arg: 1, scope: !178, file: !30, line: 660, type: !51)
!2120 = !DILocation(line: 660, column: 50, scope: !178)
!2121 = !DILocalVariable(name: "__rhs", arg: 2, scope: !178, file: !30, line: 661, type: !51)
!2122 = !DILocation(line: 661, column: 36, scope: !178)
!2123 = !DILocation(line: 666, column: 19, scope: !178)
!2124 = !DILocation(line: 666, column: 14, scope: !178)
!2125 = !DILocation(line: 666, column: 26, scope: !178)
!2126 = !DILocation(line: 666, column: 41, scope: !178)
!2127 = !DILocation(line: 666, column: 36, scope: !178)
!2128 = !DILocation(line: 666, column: 48, scope: !178)
!2129 = !DILocation(line: 666, column: 34, scope: !178)
!2130 = !DILocation(line: 666, column: 9, scope: !178)
!2131 = !DILocation(line: 666, column: 2, scope: !178)
!2132 = distinct !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1EEE5countEv", scope: !32, file: !30, line: 537, type: !59, scopeLine: 538, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !58, retainedNodes: !109)
!2133 = !DILocalVariable(name: "this", arg: 1, scope: !2132, type: !2134, flags: DIFlagArtificial | DIFlagObjectPointer)
!2134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!2135 = !DILocation(line: 0, scope: !2132)
!2136 = !DILocation(line: 538, column: 11, scope: !2132)
!2137 = !DILocation(line: 538, column: 4, scope: !2132)
!2138 = distinct !DISubprogram(name: "count", linkageName: "_ZNKSt6chrono8durationIlSt5ratioILl1ELl1000000000EEE5countEv", scope: !121, file: !30, line: 537, type: !141, scopeLine: 538, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !140, retainedNodes: !109)
!2139 = !DILocalVariable(name: "this", arg: 1, scope: !2138, type: !2140, flags: DIFlagArtificial | DIFlagObjectPointer)
!2140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !134, size: 64)
!2141 = !DILocation(line: 0, scope: !2138)
!2142 = !DILocation(line: 538, column: 11, scope: !2138)
!2143 = !DILocation(line: 538, column: 4, scope: !2138)
!2144 = !DILocalVariable(name: "__lhs", arg: 1, scope: !105, file: !30, line: 772, type: !51)
!2145 = !DILocation(line: 772, column: 50, scope: !105)
!2146 = !DILocalVariable(name: "__rhs", arg: 2, scope: !105, file: !30, line: 773, type: !51)
!2147 = !DILocation(line: 773, column: 36, scope: !105)
!2148 = !DILocation(line: 778, column: 14, scope: !105)
!2149 = !DILocation(line: 778, column: 9, scope: !105)
!2150 = !DILocation(line: 778, column: 21, scope: !105)
!2151 = !DILocation(line: 778, column: 36, scope: !105)
!2152 = !DILocation(line: 778, column: 31, scope: !105)
!2153 = !DILocation(line: 778, column: 43, scope: !105)
!2154 = !DILocation(line: 778, column: 29, scope: !105)
!2155 = !DILocation(line: 778, column: 2, scope: !105)
!2156 = distinct !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono15duration_valuesIlE4zeroEv", scope: !2157, file: !30, line: 432, type: !2160, scopeLine: 433, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !2159)
!2157 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "duration_values<long>", scope: !31, file: !30, line: 429, size: 8, flags: DIFlagTypePassByValue, elements: !2158, templateParams: !2164, identifier: "_ZTSNSt6chrono15duration_valuesIlEE")
!2158 = !{!2159, !2162, !2163}
!2159 = !DISubprogram(name: "zero", linkageName: "_ZNSt6chrono15duration_valuesIlE4zeroEv", scope: !2157, file: !30, line: 432, type: !2160, scopeLine: 432, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2160 = !DISubroutineType(types: !2161)
!2161 = !{!36}
!2162 = !DISubprogram(name: "max", linkageName: "_ZNSt6chrono15duration_valuesIlE3maxEv", scope: !2157, file: !30, line: 436, type: !2160, scopeLine: 436, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2163 = !DISubprogram(name: "min", linkageName: "_ZNSt6chrono15duration_valuesIlE3minEv", scope: !2157, file: !30, line: 440, type: !2160, scopeLine: 440, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0)
!2164 = !{!89}
!2165 = !DILocation(line: 433, column: 4, scope: !2156)
!2166 = distinct !DISubprogram(name: "duration<long, void>", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1EEEC2IlvEERKT_", scope: !32, file: !30, line: 521, type: !2167, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2172, declaration: !2171, retainedNodes: !109)
!2167 = !DISubroutineType(types: !2168)
!2168 = !{null, !47, !2169}
!2169 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2170, size: 64)
!2170 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!2171 = !DISubprogram(name: "duration<long, void>", scope: !32, file: !30, line: 521, type: !2167, scopeLine: 521, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0, templateParams: !2172)
!2172 = !{!113, !1893}
!2173 = !DILocalVariable(name: "this", arg: 1, scope: !2166, type: !1895, flags: DIFlagArtificial | DIFlagObjectPointer)
!2174 = !DILocation(line: 0, scope: !2166)
!2175 = !DILocalVariable(name: "__rep", arg: 2, scope: !2166, file: !30, line: 521, type: !2169)
!2176 = !DILocation(line: 521, column: 45, scope: !2166)
!2177 = !DILocation(line: 522, column: 6, scope: !2166)
!2178 = !DILocation(line: 522, column: 27, scope: !2166)
!2179 = !DILocation(line: 522, column: 37, scope: !2166)
!2180 = distinct !DISubprogram(name: "__cast<long, std::ratio<1L, 1L> >", linkageName: "_ZNSt6chrono20__duration_cast_implINS_8durationIlSt5ratioILl1ELl1EEEES3_lLb1ELb1EE6__castIlS3_EES4_RKNS1_IT_T0_EE", scope: !2181, file: !30, line: 211, type: !2187, scopeLine: 212, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !1836, declaration: !2189, retainedNodes: !109)
!2181 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__duration_cast_impl<std::chrono::duration<long, std::ratio<1L, 1L> >, std::ratio<1L, 1L>, long, true, true>", scope: !31, file: !30, line: 207, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !2182, identifier: "_ZTSNSt6chrono20__duration_cast_implINS_8durationIlSt5ratioILl1ELl1EEEES3_lLb1ELb1EEE")
!2182 = !{!2103, !2183, !2184, !2185, !2186}
!2183 = !DITemplateTypeParameter(name: "_CF", type: !91)
!2184 = !DITemplateTypeParameter(name: "_CR", type: !36)
!2185 = !DITemplateValueParameter(name: "_NumIsOne", type: !108, value: i8 1)
!2186 = !DITemplateValueParameter(name: "_DenIsOne", type: !108, value: i8 1)
!2187 = !DISubroutineType(types: !2188)
!2188 = !{!32, !51}
!2189 = !DISubprogram(name: "__cast<long, std::ratio<1L, 1L> >", linkageName: "_ZNSt6chrono20__duration_cast_implINS_8durationIlSt5ratioILl1ELl1EEEES3_lLb1ELb1EE6__castIlS3_EES4_RKNS1_IT_T0_EE", scope: !2181, file: !30, line: 211, type: !2187, scopeLine: 211, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0, templateParams: !1836)
!2190 = !DILocalVariable(name: "__d", arg: 1, scope: !2180, file: !30, line: 211, type: !51)
!2191 = !DILocation(line: 211, column: 42, scope: !2180)
!2192 = !DILocation(line: 214, column: 42, scope: !2180)
!2193 = !DILocation(line: 214, column: 46, scope: !2180)
!2194 = !DILocation(line: 214, column: 20, scope: !2180)
!2195 = !DILocation(line: 214, column: 13, scope: !2180)
!2196 = !DILocation(line: 214, column: 6, scope: !2180)
!2197 = distinct !DISubprogram(name: "__cast<long, std::ratio<1L, 1L> >", linkageName: "_ZNSt6chrono20__duration_cast_implINS_8durationIlSt5ratioILl1ELl1000000000EEEES2_ILl1000000000ELl1EElLb0ELb1EE6__castIlS2_ILl1ELl1EEEES4_RKNS1_IT_T0_EE", scope: !2198, file: !30, line: 236, type: !2202, scopeLine: 237, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !1836, declaration: !2204, retainedNodes: !109)
!2198 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__duration_cast_impl<std::chrono::duration<long, std::ratio<1L, 1000000000L> >, std::ratio<1000000000L, 1L>, long, false, true>", scope: !31, file: !30, line: 232, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !2199, identifier: "_ZTSNSt6chrono20__duration_cast_implINS_8durationIlSt5ratioILl1ELl1000000000EEEES2_ILl1000000000ELl1EElLb0ELb1EEE")
!2199 = !{!2113, !2200, !2184, !2201, !2186}
!2200 = !DITemplateTypeParameter(name: "_CF", type: !679)
!2201 = !DITemplateValueParameter(name: "_NumIsOne", type: !108, defaulted: true, value: i8 0)
!2202 = !DISubroutineType(types: !2203)
!2203 = !{!121, !51}
!2204 = !DISubprogram(name: "__cast<long, std::ratio<1L, 1L> >", linkageName: "_ZNSt6chrono20__duration_cast_implINS_8durationIlSt5ratioILl1ELl1000000000EEEES2_ILl1000000000ELl1EElLb0ELb1EE6__castIlS2_ILl1ELl1EEEES4_RKNS1_IT_T0_EE", scope: !2198, file: !30, line: 236, type: !2202, scopeLine: 236, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: 0, templateParams: !1836)
!2205 = !DILocalVariable(name: "__d", arg: 1, scope: !2197, file: !30, line: 236, type: !51)
!2206 = !DILocation(line: 236, column: 42, scope: !2197)
!2207 = !DILocation(line: 240, column: 25, scope: !2197)
!2208 = !DILocation(line: 240, column: 29, scope: !2197)
!2209 = !DILocation(line: 240, column: 38, scope: !2197)
!2210 = !DILocation(line: 239, column: 20, scope: !2197)
!2211 = !DILocation(line: 239, column: 13, scope: !2197)
!2212 = !DILocation(line: 239, column: 6, scope: !2197)
!2213 = distinct !DISubprogram(name: "duration<long, void>", linkageName: "_ZNSt6chrono8durationIlSt5ratioILl1ELl1000000000EEEC2IlvEERKT_", scope: !121, file: !30, line: 521, type: !2214, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2172, declaration: !2216, retainedNodes: !109)
!2214 = !DISubroutineType(types: !2215)
!2215 = !{null, !129, !2169}
!2216 = !DISubprogram(name: "duration<long, void>", scope: !121, file: !30, line: 521, type: !2214, scopeLine: 521, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0, templateParams: !2172)
!2217 = !DILocalVariable(name: "this", arg: 1, scope: !2213, type: !2218, flags: DIFlagArtificial | DIFlagObjectPointer)
!2218 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 64)
!2219 = !DILocation(line: 0, scope: !2213)
!2220 = !DILocalVariable(name: "__rep", arg: 2, scope: !2213, file: !30, line: 521, type: !2169)
!2221 = !DILocation(line: 521, column: 45, scope: !2213)
!2222 = !DILocation(line: 522, column: 6, scope: !2213)
!2223 = !DILocation(line: 522, column: 27, scope: !2213)
!2224 = !DILocation(line: 522, column: 37, scope: !2213)
!2225 = distinct !DISubprogram(name: "_State_impl<void (&)(unsigned long), int>", linkageName: "_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEEC2IJRS3_iEEEDpOT_", scope: !1976, file: !182, line: 206, type: !2226, scopeLine: 208, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2229, declaration: !2228, retainedNodes: !109)
!2226 = !DISubroutineType(types: !2227)
!2227 = !{null, !1983, !1961, !622}
!2228 = !DISubprogram(name: "_State_impl<void (&)(unsigned long), int>", scope: !1976, file: !182, line: 206, type: !2226, scopeLine: 206, flags: DIFlagPrototyped, spFlags: 0, templateParams: !2229)
!2229 = !{!2230}
!2230 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Args", value: !2231)
!2231 = !{!2232, !627}
!2232 = !DITemplateTypeParameter(type: !1961)
!2233 = !DILocalVariable(name: "this", arg: 1, scope: !2225, type: !2234, flags: DIFlagArtificial | DIFlagObjectPointer)
!2234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1976, size: 64)
!2235 = !DILocation(line: 0, scope: !2225)
!2236 = !DILocalVariable(name: "__args", arg: 2, scope: !2225, file: !182, line: 206, type: !1961)
!2237 = !DILocation(line: 206, column: 27, scope: !2225)
!2238 = !DILocalVariable(name: "__args", arg: 3, scope: !2225, file: !182, line: 206, type: !622)
!2239 = !DILocation(line: 206, column: 4, scope: !2225)
!2240 = !DILocation(line: 208, column: 4, scope: !2225)
!2241 = !DILocation(line: 207, column: 6, scope: !2225)
!2242 = !DILocation(line: 207, column: 34, scope: !2225)
!2243 = !DILocation(line: 208, column: 6, scope: !2225)
!2244 = !DILocation(line: 208, column: 6, scope: !2245)
!2245 = distinct !DILexicalBlock(scope: !2225, file: !182, line: 208, column: 4)
!2246 = distinct !DISubprogram(name: "unique_ptr<std::default_delete<std::thread::_State>, void>", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EEC2IS3_vEEPS1_", scope: !247, file: !248, line: 281, type: !595, scopeLine: 283, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2248, declaration: !2247, retainedNodes: !109)
!2247 = !DISubprogram(name: "unique_ptr<std::default_delete<std::thread::_State>, void>", scope: !247, file: !248, line: 281, type: !595, scopeLine: 281, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0, templateParams: !2248)
!2248 = !{!2249, !1893}
!2249 = !DITemplateTypeParameter(name: "_Del", type: !270)
!2250 = !DILocalVariable(name: "this", arg: 1, scope: !2246, type: !2251, flags: DIFlagArtificial | DIFlagObjectPointer)
!2251 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 64)
!2252 = !DILocation(line: 0, scope: !2246)
!2253 = !DILocalVariable(name: "__p", arg: 2, scope: !2246, file: !248, line: 281, type: !576)
!2254 = !DILocation(line: 281, column: 21, scope: !2246)
!2255 = !DILocation(line: 282, column: 4, scope: !2246)
!2256 = !DILocation(line: 282, column: 9, scope: !2246)
!2257 = !DILocation(line: 283, column: 11, scope: !2246)
!2258 = distinct !DISubprogram(name: "~unique_ptr", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EED2Ev", scope: !247, file: !248, line: 355, type: !552, scopeLine: 356, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !551, retainedNodes: !109)
!2259 = !DILocalVariable(name: "this", arg: 1, scope: !2258, type: !2251, flags: DIFlagArtificial | DIFlagObjectPointer)
!2260 = !DILocation(line: 0, scope: !2258)
!2261 = !DILocalVariable(name: "__ptr", scope: !2262, file: !248, line: 359, type: !515)
!2262 = distinct !DILexicalBlock(scope: !2258, file: !248, line: 356, column: 7)
!2263 = !DILocation(line: 359, column: 8, scope: !2262)
!2264 = !DILocation(line: 359, column: 16, scope: !2262)
!2265 = !DILocation(line: 359, column: 21, scope: !2262)
!2266 = !DILocation(line: 360, column: 6, scope: !2267)
!2267 = distinct !DILexicalBlock(scope: !2262, file: !248, line: 360, column: 6)
!2268 = !DILocation(line: 360, column: 12, scope: !2267)
!2269 = !DILocation(line: 360, column: 6, scope: !2262)
!2270 = !DILocation(line: 361, column: 4, scope: !2267)
!2271 = !DILocation(line: 361, column: 28, scope: !2267)
!2272 = !DILocation(line: 361, column: 18, scope: !2267)
!2273 = !DILocation(line: 362, column: 2, scope: !2262)
!2274 = !DILocation(line: 362, column: 8, scope: !2262)
!2275 = !DILocation(line: 363, column: 7, scope: !2258)
!2276 = distinct !DISubprogram(name: "_State", linkageName: "_ZNSt6thread6_StateC2Ev", scope: !282, file: !182, line: 68, type: !2277, scopeLine: 68, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !2280, retainedNodes: !109)
!2277 = !DISubroutineType(types: !2278)
!2278 = !{null, !2279}
!2279 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !282, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!2280 = !DISubprogram(name: "_State", scope: !282, type: !2277, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: 0)
!2281 = !DILocalVariable(name: "this", arg: 1, scope: !2276, type: !281, flags: DIFlagArtificial | DIFlagObjectPointer)
!2282 = !DILocation(line: 0, scope: !2276)
!2283 = !DILocation(line: 68, column: 12, scope: !2276)
!2284 = distinct !DISubprogram(name: "_Invoker<void (&)(unsigned long), int>", linkageName: "_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEEC2IJRS2_iEEEDpOT_", scope: !867, file: !182, line: 243, type: !2285, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2229, declaration: !2287, retainedNodes: !109)
!2285 = !DISubroutineType(types: !2286)
!2286 = !{null, !873, !1961, !622}
!2287 = !DISubprogram(name: "_Invoker<void (&)(unsigned long), int>", scope: !867, file: !182, line: 243, type: !2285, scopeLine: 243, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0, templateParams: !2229)
!2288 = !DILocalVariable(name: "this", arg: 1, scope: !2284, type: !2289, flags: DIFlagArtificial | DIFlagObjectPointer)
!2289 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !867, size: 64)
!2290 = !DILocation(line: 0, scope: !2284)
!2291 = !DILocalVariable(name: "__args", arg: 2, scope: !2284, file: !182, line: 243, type: !1961)
!2292 = !DILocation(line: 243, column: 24, scope: !2284)
!2293 = !DILocalVariable(name: "__args", arg: 3, scope: !2284, file: !182, line: 243, type: !622)
!2294 = !DILocation(line: 244, column: 6, scope: !2284)
!2295 = !DILocation(line: 244, column: 31, scope: !2284)
!2296 = !DILocation(line: 245, column: 6, scope: !2284)
!2297 = distinct !DISubprogram(name: "~_State_impl", linkageName: "_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEED2Ev", scope: !1976, file: !182, line: 201, type: !1981, scopeLine: 201, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !2298, retainedNodes: !109)
!2298 = !DISubprogram(name: "~_State_impl", scope: !1976, type: !1981, containingType: !1976, virtualIndex: 0, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagVirtual)
!2299 = !DILocalVariable(name: "this", arg: 1, scope: !2297, type: !2234, flags: DIFlagArtificial | DIFlagObjectPointer)
!2300 = !DILocation(line: 0, scope: !2297)
!2301 = !DILocation(line: 201, column: 14, scope: !2302)
!2302 = distinct !DILexicalBlock(scope: !2297, file: !182, line: 201, column: 14)
!2303 = !DILocation(line: 201, column: 14, scope: !2297)
!2304 = distinct !DISubprogram(name: "~_State_impl", linkageName: "_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEED0Ev", scope: !1976, file: !182, line: 201, type: !1981, scopeLine: 201, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !2298, retainedNodes: !109)
!2305 = !DILocalVariable(name: "this", arg: 1, scope: !2304, type: !2234, flags: DIFlagArtificial | DIFlagObjectPointer)
!2306 = !DILocation(line: 0, scope: !2304)
!2307 = !DILocation(line: 201, column: 14, scope: !2304)
!2308 = distinct !DISubprogram(name: "_M_run", linkageName: "_ZNSt6thread11_State_implINS_8_InvokerISt5tupleIJPFvmEiEEEEE6_M_runEv", scope: !1976, file: !182, line: 211, type: !1981, scopeLine: 211, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !1980, retainedNodes: !109)
!2309 = !DILocalVariable(name: "this", arg: 1, scope: !2308, type: !2234, flags: DIFlagArtificial | DIFlagObjectPointer)
!2310 = !DILocation(line: 0, scope: !2308)
!2311 = !DILocation(line: 211, column: 13, scope: !2308)
!2312 = !DILocation(line: 211, column: 24, scope: !2308)
!2313 = distinct !DISubprogram(name: "tuple<void (&)(unsigned long), int, true>", linkageName: "_ZNSt5tupleIJPFvmEiEEC2IRS0_iTnNSt9enable_ifIXclsr4_TCCIXntcl14__is_alloc_argIT_EEEEE29__is_implicitly_constructibleIS6_T0_EEEbE4typeELb1EEEOS6_OS7_", scope: !834, file: !258, line: 1077, type: !2314, scopeLine: 1079, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2317, declaration: !2316, retainedNodes: !109)
!2314 = !DISubroutineType(types: !2315)
!2315 = !{null, !841, !1961, !622}
!2316 = !DISubprogram(name: "tuple<void (&)(unsigned long), int, true>", scope: !834, file: !258, line: 1077, type: !2314, scopeLine: 1077, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0, templateParams: !2317)
!2317 = !{!2318, !2319, !1851}
!2318 = !DITemplateTypeParameter(name: "_U1", type: !1961)
!2319 = !DITemplateTypeParameter(name: "_U2", type: !72)
!2320 = !DILocalVariable(name: "this", arg: 1, scope: !2313, type: !2321, flags: DIFlagArtificial | DIFlagObjectPointer)
!2321 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !834, size: 64)
!2322 = !DILocation(line: 0, scope: !2313)
!2323 = !DILocalVariable(name: "__a1", arg: 2, scope: !2313, file: !258, line: 1077, type: !1961)
!2324 = !DILocation(line: 1077, column: 14, scope: !2313)
!2325 = !DILocalVariable(name: "__a2", arg: 3, scope: !2313, file: !258, line: 1077, type: !622)
!2326 = !DILocation(line: 1077, column: 26, scope: !2313)
!2327 = !DILocation(line: 1079, column: 33, scope: !2313)
!2328 = !DILocation(line: 1079, column: 58, scope: !2313)
!2329 = !DILocation(line: 1079, column: 4, scope: !2313)
!2330 = !DILocation(line: 1079, column: 67, scope: !2313)
!2331 = distinct !DISubprogram(name: "_Tuple_impl<void (&)(unsigned long), int, void>", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEEC2IRS0_JiEvEEOT_DpOT0_", scope: !787, file: !258, line: 290, type: !2332, scopeLine: 293, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2335, declaration: !2334, retainedNodes: !109)
!2332 = !DISubroutineType(types: !2333)
!2333 = !{null, !813, !1961, !622}
!2334 = !DISubprogram(name: "_Tuple_impl<void (&)(unsigned long), int, void>", scope: !787, file: !258, line: 290, type: !2332, scopeLine: 290, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0, templateParams: !2335)
!2335 = !{!2336, !2337, !1893}
!2336 = !DITemplateTypeParameter(name: "_UHead", type: !1961)
!2337 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_UTail", value: !626)
!2338 = !DILocalVariable(name: "this", arg: 1, scope: !2331, type: !2339, flags: DIFlagArtificial | DIFlagObjectPointer)
!2339 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !787, size: 64)
!2340 = !DILocation(line: 0, scope: !2331)
!2341 = !DILocalVariable(name: "__head", arg: 2, scope: !2331, file: !258, line: 290, type: !1961)
!2342 = !DILocation(line: 290, column: 23, scope: !2331)
!2343 = !DILocalVariable(name: "__tail", arg: 3, scope: !2331, file: !258, line: 290, type: !622)
!2344 = !DILocation(line: 290, column: 43, scope: !2331)
!2345 = !DILocation(line: 291, column: 36, scope: !2331)
!2346 = !DILocation(line: 291, column: 4, scope: !2331)
!2347 = !DILocation(line: 293, column: 2, scope: !2331)
!2348 = !DILocation(line: 292, column: 31, scope: !2331)
!2349 = !DILocation(line: 292, column: 10, scope: !2331)
!2350 = !DILocation(line: 292, column: 4, scope: !2331)
!2351 = !DILocation(line: 293, column: 4, scope: !2331)
!2352 = distinct !DISubprogram(name: "_Tuple_impl<int>", linkageName: "_ZNSt11_Tuple_implILm1EJiEEC2IiEEOT_", scope: !719, file: !258, line: 440, type: !2353, scopeLine: 442, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2356, declaration: !2355, retainedNodes: !109)
!2353 = !DISubroutineType(types: !2354)
!2354 = !{null, !734, !622}
!2355 = !DISubprogram(name: "_Tuple_impl<int>", scope: !719, file: !258, line: 440, type: !2353, scopeLine: 440, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0, templateParams: !2356)
!2356 = !{!2357}
!2357 = !DITemplateTypeParameter(name: "_UHead", type: !72)
!2358 = !DILocalVariable(name: "this", arg: 1, scope: !2352, type: !2359, flags: DIFlagArtificial | DIFlagObjectPointer)
!2359 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !719, size: 64)
!2360 = !DILocation(line: 0, scope: !2352)
!2361 = !DILocalVariable(name: "__head", arg: 2, scope: !2352, file: !258, line: 440, type: !622)
!2362 = !DILocation(line: 440, column: 23, scope: !2352)
!2363 = !DILocation(line: 441, column: 31, scope: !2352)
!2364 = !DILocation(line: 441, column: 4, scope: !2352)
!2365 = !DILocation(line: 442, column: 4, scope: !2352)
!2366 = distinct !DISubprogram(name: "_Head_base", linkageName: "_ZNSt10_Head_baseILm0EPFvmELb0EEC2ERKS1_", scope: !753, file: !258, line: 192, type: !761, scopeLine: 193, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !760, retainedNodes: !109)
!2367 = !DILocalVariable(name: "this", arg: 1, scope: !2366, type: !2368, flags: DIFlagArtificial | DIFlagObjectPointer)
!2368 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !753, size: 64)
!2369 = !DILocation(line: 0, scope: !2366)
!2370 = !DILocalVariable(name: "__h", arg: 2, scope: !2366, file: !258, line: 192, type: !763)
!2371 = !DILocation(line: 192, column: 41, scope: !2366)
!2372 = !DILocation(line: 193, column: 9, scope: !2366)
!2373 = !DILocation(line: 193, column: 22, scope: !2366)
!2374 = !DILocation(line: 193, column: 29, scope: !2366)
!2375 = distinct !DISubprogram(name: "_Head_base<int>", linkageName: "_ZNSt10_Head_baseILm1EiLb0EEC2IiEEOT_", scope: !685, file: !258, line: 199, type: !2376, scopeLine: 200, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2356, declaration: !2378, retainedNodes: !109)
!2376 = !DISubroutineType(types: !2377)
!2377 = !{null, !691, !622}
!2378 = !DISubprogram(name: "_Head_base<int>", scope: !685, file: !258, line: 199, type: !2376, scopeLine: 199, flags: DIFlagPrototyped, spFlags: 0, templateParams: !2356)
!2379 = !DILocalVariable(name: "this", arg: 1, scope: !2375, type: !2380, flags: DIFlagArtificial | DIFlagObjectPointer)
!2380 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !685, size: 64)
!2381 = !DILocation(line: 0, scope: !2375)
!2382 = !DILocalVariable(name: "__h", arg: 2, scope: !2375, file: !258, line: 199, type: !622)
!2383 = !DILocation(line: 199, column: 39, scope: !2375)
!2384 = !DILocation(line: 200, column: 4, scope: !2375)
!2385 = !DILocation(line: 200, column: 38, scope: !2375)
!2386 = !DILocation(line: 200, column: 17, scope: !2375)
!2387 = !DILocation(line: 200, column: 46, scope: !2375)
!2388 = distinct !DISubprogram(name: "operator()", linkageName: "_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEEclEv", scope: !867, file: !182, line: 262, type: !871, scopeLine: 263, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !870, retainedNodes: !109)
!2389 = !DILocalVariable(name: "this", arg: 1, scope: !2388, type: !2289, flags: DIFlagArtificial | DIFlagObjectPointer)
!2390 = !DILocation(line: 0, scope: !2388)
!2391 = !DILocation(line: 266, column: 11, scope: !2388)
!2392 = !DILocation(line: 266, column: 4, scope: !2388)
!2393 = distinct !DISubprogram(name: "_M_invoke<0UL, 1UL>", linkageName: "_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEE9_M_invokeIJLm0ELm1EEEEvSt12_Index_tupleIJXspT_EEE", scope: !867, file: !182, line: 258, type: !2394, scopeLine: 259, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2404, declaration: !2403, retainedNodes: !109)
!2394 = !DISubroutineType(types: !2395)
!2395 = !{!614, !873, !2396}
!2396 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Index_tuple<0UL, 1UL>", scope: !2, file: !2397, line: 298, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !2398, identifier: "_ZTSSt12_Index_tupleIJLm0ELm1EEE")
!2397 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/utility", directory: "")
!2398 = !{!2399}
!2399 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Indexes", value: !2400)
!2400 = !{!2401, !2402}
!2401 = !DITemplateValueParameter(type: !194, value: i64 0)
!2402 = !DITemplateValueParameter(type: !194, value: i64 1)
!2403 = !DISubprogram(name: "_M_invoke<0UL, 1UL>", linkageName: "_ZNSt6thread8_InvokerISt5tupleIJPFvmEiEEE9_M_invokeIJLm0ELm1EEEEvSt12_Index_tupleIJXspT_EEE", scope: !867, file: !182, line: 258, type: !2394, scopeLine: 258, flags: DIFlagPrototyped, spFlags: 0, templateParams: !2404)
!2404 = !{!2405}
!2405 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Ind", value: !2400)
!2406 = !DILocalVariable(name: "this", arg: 1, scope: !2393, type: !2289, flags: DIFlagArtificial | DIFlagObjectPointer)
!2407 = !DILocation(line: 0, scope: !2393)
!2408 = !DILocalVariable(arg: 2, scope: !2393, file: !182, line: 258, type: !2396)
!2409 = !DILocation(line: 258, column: 35, scope: !2393)
!2410 = !DILocation(line: 259, column: 52, scope: !2393)
!2411 = !DILocation(line: 259, column: 27, scope: !2393)
!2412 = !DILocation(line: 259, column: 13, scope: !2393)
!2413 = !DILocation(line: 259, column: 6, scope: !2393)
!2414 = !DILocalVariable(name: "__fn", arg: 1, scope: !611, file: !610, line: 90, type: !618)
!2415 = !DILocation(line: 90, column: 26, scope: !611)
!2416 = !DILocalVariable(name: "__args", arg: 2, scope: !611, file: !610, line: 90, type: !622)
!2417 = !DILocation(line: 90, column: 43, scope: !611)
!2418 = !DILocation(line: 96, column: 74, scope: !611)
!2419 = !DILocation(line: 97, column: 26, scope: !611)
!2420 = !DILocation(line: 96, column: 14, scope: !611)
!2421 = !DILocation(line: 96, column: 7, scope: !611)
!2422 = distinct !DISubprogram(name: "get<0UL, void (*)(unsigned long), int>", linkageName: "_ZSt3getILm0EJPFvmEiEEONSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeEOS6_", scope: !2, file: !258, line: 1405, type: !2423, scopeLine: 1406, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2432, retainedNodes: !109)
!2423 = !DISubroutineType(types: !2424)
!2424 = !{!2425, !847}
!2425 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !2426, size: 64)
!2426 = !DIDerivedType(tag: DW_TAG_typedef, name: "__tuple_element_t<0UL, tuple<void (*)(unsigned long), int> >", scope: !2, file: !2397, line: 118, baseType: !2427)
!2427 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2428, file: !258, line: 1362, baseType: !619)
!2428 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tuple_element<0UL, std::tuple<void (*)(unsigned long), int> >", scope: !2, file: !258, line: 1360, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !2429, identifier: "_ZTSSt13tuple_elementILm0ESt5tupleIJPFvmEiEEE")
!2429 = !{!2430, !2431}
!2430 = !DITemplateValueParameter(name: "_Int", type: !194, value: i64 0)
!2431 = !DITemplateTypeParameter(name: "_Tp", type: !834)
!2432 = !{!2433, !831}
!2433 = !DITemplateValueParameter(name: "__i", type: !194, value: i64 0)
!2434 = !DILocalVariable(name: "__t", arg: 1, scope: !2422, file: !258, line: 1405, type: !847)
!2435 = !DILocation(line: 1405, column: 31, scope: !2422)
!2436 = !DILocation(line: 1408, column: 66, scope: !2422)
!2437 = !DILocation(line: 1408, column: 43, scope: !2422)
!2438 = !DILocation(line: 1408, column: 7, scope: !2422)
!2439 = distinct !DISubprogram(name: "get<1UL, void (*)(unsigned long), int>", linkageName: "_ZSt3getILm1EJPFvmEiEEONSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeEOS6_", scope: !2, file: !258, line: 1405, type: !2440, scopeLine: 1406, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2449, retainedNodes: !109)
!2440 = !DISubroutineType(types: !2441)
!2441 = !{!2442, !847}
!2442 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !2443, size: 64)
!2443 = !DIDerivedType(tag: DW_TAG_typedef, name: "__tuple_element_t<1UL, tuple<void (*)(unsigned long), int> >", scope: !2, file: !2397, line: 118, baseType: !2444)
!2444 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2445, file: !258, line: 1362, baseType: !72)
!2445 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tuple_element<0UL, std::tuple<int> >", scope: !2, file: !258, line: 1360, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !2446, identifier: "_ZTSSt13tuple_elementILm0ESt5tupleIJiEEE")
!2446 = !{!2430, !2447}
!2447 = !DITemplateTypeParameter(name: "_Tp", type: !2448)
!2448 = !DICompositeType(tag: DW_TAG_class_type, name: "tuple<int>", scope: !2, file: !258, line: 609, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt5tupleIJiEE")
!2449 = !{!2450, !831}
!2450 = !DITemplateValueParameter(name: "__i", type: !194, value: i64 1)
!2451 = !DILocalVariable(name: "__t", arg: 1, scope: !2439, file: !258, line: 1405, type: !847)
!2452 = !DILocation(line: 1405, column: 31, scope: !2439)
!2453 = !DILocation(line: 1408, column: 66, scope: !2439)
!2454 = !DILocation(line: 1408, column: 43, scope: !2439)
!2455 = !DILocation(line: 1408, column: 7, scope: !2439)
!2456 = distinct !DISubprogram(name: "__invoke_impl<void, void (*)(unsigned long), int>", linkageName: "_ZSt13__invoke_implIvPFvmEJiEET_St14__invoke_otherOT0_DpOT1_", scope: !2, file: !610, line: 60, type: !2457, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2459, retainedNodes: !109)
!2457 = !DISubroutineType(types: !2458)
!2458 = !{null, !634, !618, !622}
!2459 = !{!2460, !2461, !625}
!2460 = !DITemplateTypeParameter(name: "_Res", type: null)
!2461 = !DITemplateTypeParameter(name: "_Fn", type: !619)
!2462 = !DILocalVariable(arg: 1, scope: !2456, file: !610, line: 60, type: !634)
!2463 = !DILocation(line: 60, column: 33, scope: !2456)
!2464 = !DILocalVariable(name: "__f", arg: 2, scope: !2456, file: !610, line: 60, type: !618)
!2465 = !DILocation(line: 60, column: 41, scope: !2456)
!2466 = !DILocalVariable(name: "__args", arg: 3, scope: !2456, file: !610, line: 60, type: !622)
!2467 = !DILocation(line: 60, column: 57, scope: !2456)
!2468 = !DILocation(line: 61, column: 32, scope: !2456)
!2469 = !DILocation(line: 61, column: 14, scope: !2456)
!2470 = !DILocation(line: 61, column: 57, scope: !2456)
!2471 = !DILocation(line: 61, column: 37, scope: !2456)
!2472 = !DILocation(line: 61, column: 7, scope: !2456)
!2473 = distinct !DISubprogram(name: "__get_helper<0UL, void (*)(unsigned long), int>", linkageName: "_ZSt12__get_helperILm0EPFvmEJiEERT0_RSt11_Tuple_implIXT_EJS2_DpT1_EE", scope: !2, file: !258, line: 1377, type: !792, scopeLine: 1378, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2474, retainedNodes: !109)
!2474 = !{!2433, !786, !2475}
!2475 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Tail", value: !626)
!2476 = !DILocalVariable(name: "__t", arg: 1, scope: !2473, file: !258, line: 1377, type: !794)
!2477 = !DILocation(line: 1377, column: 53, scope: !2473)
!2478 = !DILocation(line: 1378, column: 57, scope: !2473)
!2479 = !DILocation(line: 1378, column: 14, scope: !2473)
!2480 = !DILocation(line: 1378, column: 7, scope: !2473)
!2481 = distinct !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm0EJPFvmEiEE7_M_headERS2_", scope: !787, file: !258, line: 268, type: !792, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !791, retainedNodes: !109)
!2482 = !DILocalVariable(name: "__t", arg: 1, scope: !2481, file: !258, line: 268, type: !794)
!2483 = !DILocation(line: 268, column: 28, scope: !2481)
!2484 = !DILocation(line: 268, column: 66, scope: !2481)
!2485 = !DILocation(line: 268, column: 51, scope: !2481)
!2486 = !DILocation(line: 268, column: 44, scope: !2481)
!2487 = distinct !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm0EPFvmELb0EE7_M_headERS2_", scope: !753, file: !258, line: 233, type: !778, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !777, retainedNodes: !109)
!2488 = !DILocalVariable(name: "__b", arg: 1, scope: !2487, file: !258, line: 233, type: !781)
!2489 = !DILocation(line: 233, column: 27, scope: !2487)
!2490 = !DILocation(line: 233, column: 50, scope: !2487)
!2491 = !DILocation(line: 233, column: 54, scope: !2487)
!2492 = !DILocation(line: 233, column: 43, scope: !2487)
!2493 = distinct !DISubprogram(name: "__get_helper<1UL, int>", linkageName: "_ZSt12__get_helperILm1EiJEERT0_RSt11_Tuple_implIXT_EJS0_DpT1_EE", scope: !2, file: !258, line: 1377, type: !723, scopeLine: 1378, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2494, retainedNodes: !109)
!2494 = !{!2450, !718, !2495}
!2495 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Tail", value: !109)
!2496 = !DILocalVariable(name: "__t", arg: 1, scope: !2493, file: !258, line: 1377, type: !725)
!2497 = !DILocation(line: 1377, column: 53, scope: !2493)
!2498 = !DILocation(line: 1378, column: 57, scope: !2493)
!2499 = !DILocation(line: 1378, column: 14, scope: !2493)
!2500 = !DILocation(line: 1378, column: 7, scope: !2493)
!2501 = distinct !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm1EJiEE7_M_headERS0_", scope: !719, file: !258, line: 424, type: !723, scopeLine: 424, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !722, retainedNodes: !109)
!2502 = !DILocalVariable(name: "__t", arg: 1, scope: !2501, file: !258, line: 424, type: !725)
!2503 = !DILocation(line: 424, column: 28, scope: !2501)
!2504 = !DILocation(line: 424, column: 66, scope: !2501)
!2505 = !DILocation(line: 424, column: 51, scope: !2501)
!2506 = !DILocation(line: 424, column: 44, scope: !2501)
!2507 = distinct !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm1EiLb0EE7_M_headERS0_", scope: !685, file: !258, line: 233, type: !710, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !709, retainedNodes: !109)
!2508 = !DILocalVariable(name: "__b", arg: 1, scope: !2507, file: !258, line: 233, type: !713)
!2509 = !DILocation(line: 233, column: 27, scope: !2507)
!2510 = !DILocation(line: 233, column: 50, scope: !2507)
!2511 = !DILocation(line: 233, column: 54, scope: !2507)
!2512 = !DILocation(line: 233, column: 43, scope: !2507)
!2513 = distinct !DISubprogram(name: "__uniq_ptr_impl", linkageName: "_ZNSt15__uniq_ptr_dataINSt6thread6_StateESt14default_deleteIS1_ELb1ELb1EECI2St15__uniq_ptr_implIS1_S3_EEPS1_", scope: !251, file: !248, line: 210, type: !2514, scopeLine: 210, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !2516, retainedNodes: !109)
!2514 = !DISubroutineType(types: !2515)
!2515 = !{null, !539, !497}
!2516 = !DISubprogram(name: "__uniq_ptr_impl", scope: !251, type: !2514, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: 0)
!2517 = !DILocalVariable(name: "this", arg: 1, scope: !2513, type: !2518, flags: DIFlagArtificial | DIFlagObjectPointer)
!2518 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !251, size: 64)
!2519 = !DILocation(line: 0, scope: !2513)
!2520 = !DILocalVariable(arg: 2, scope: !2513, type: !497, flags: DIFlagArtificial)
!2521 = !DILocation(line: 210, column: 40, scope: !2513)
!2522 = distinct !DISubprogram(name: "__uniq_ptr_impl", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EEC2EPS1_", scope: !254, file: !248, line: 155, type: !495, scopeLine: 155, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !494, retainedNodes: !109)
!2523 = !DILocalVariable(name: "this", arg: 1, scope: !2522, type: !2524, flags: DIFlagArtificial | DIFlagObjectPointer)
!2524 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !254, size: 64)
!2525 = !DILocation(line: 0, scope: !2522)
!2526 = !DILocalVariable(name: "__p", arg: 2, scope: !2522, file: !248, line: 155, type: !497)
!2527 = !DILocation(line: 155, column: 31, scope: !2522)
!2528 = !DILocation(line: 155, column: 38, scope: !2522)
!2529 = !DILocation(line: 155, column: 58, scope: !2530)
!2530 = distinct !DILexicalBlock(scope: !2522, file: !248, line: 155, column: 45)
!2531 = !DILocation(line: 155, column: 47, scope: !2530)
!2532 = !DILocation(line: 155, column: 56, scope: !2530)
!2533 = !DILocation(line: 155, column: 63, scope: !2522)
!2534 = distinct !DISubprogram(name: "tuple<true, true>", linkageName: "_ZNSt5tupleIJPNSt6thread6_StateESt14default_deleteIS1_EEEC2ILb1ETnNSt9enable_ifIXclsr17_TupleConstraintsIXT_ES2_S4_EE37__is_implicitly_default_constructibleEEbE4typeELb1EEEv", scope: !257, file: !258, line: 1049, type: !2535, scopeLine: 1051, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2538, declaration: !2537, retainedNodes: !109)
!2535 = !DISubroutineType(types: !2536)
!2536 = !{null, !456}
!2537 = !DISubprogram(name: "tuple<true, true>", scope: !257, file: !258, line: 1049, type: !2535, scopeLine: 1049, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0, templateParams: !2538)
!2538 = !{!2539, !1851}
!2539 = !DITemplateValueParameter(name: "_Dummy", type: !108, value: i8 1)
!2540 = !DILocalVariable(name: "this", arg: 1, scope: !2534, type: !2541, flags: DIFlagArtificial | DIFlagObjectPointer)
!2541 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !257, size: 64)
!2542 = !DILocation(line: 0, scope: !2534)
!2543 = !DILocation(line: 1051, column: 4, scope: !2534)
!2544 = !DILocation(line: 1051, column: 19, scope: !2534)
!2545 = distinct !DISubprogram(name: "_M_ptr", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE6_M_ptrEv", scope: !254, file: !248, line: 172, type: !513, scopeLine: 172, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !512, retainedNodes: !109)
!2546 = !DILocalVariable(name: "this", arg: 1, scope: !2545, type: !2524, flags: DIFlagArtificial | DIFlagObjectPointer)
!2547 = !DILocation(line: 0, scope: !2545)
!2548 = !DILocation(line: 172, column: 48, scope: !2545)
!2549 = !DILocation(line: 172, column: 36, scope: !2545)
!2550 = !DILocation(line: 172, column: 29, scope: !2545)
!2551 = distinct !DISubprogram(name: "_Tuple_impl", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEEC2Ev", scope: !261, file: !258, line: 279, type: !427, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !426, retainedNodes: !109)
!2552 = !DILocalVariable(name: "this", arg: 1, scope: !2551, type: !2553, flags: DIFlagArtificial | DIFlagObjectPointer)
!2553 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !261, size: 64)
!2554 = !DILocation(line: 0, scope: !2551)
!2555 = !DILocation(line: 280, column: 9, scope: !2551)
!2556 = !DILocation(line: 280, column: 23, scope: !2551)
!2557 = !DILocation(line: 280, column: 33, scope: !2551)
!2558 = distinct !DISubprogram(name: "_Tuple_impl", linkageName: "_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEEC2Ev", scope: !264, file: !258, line: 430, type: !347, scopeLine: 431, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !346, retainedNodes: !109)
!2559 = !DILocalVariable(name: "this", arg: 1, scope: !2558, type: !2560, flags: DIFlagArtificial | DIFlagObjectPointer)
!2560 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !264, size: 64)
!2561 = !DILocation(line: 0, scope: !2558)
!2562 = !DILocation(line: 431, column: 9, scope: !2558)
!2563 = !DILocation(line: 431, column: 19, scope: !2558)
!2564 = distinct !DISubprogram(name: "_Head_base", linkageName: "_ZNSt10_Head_baseILm0EPNSt6thread6_StateELb0EEC2Ev", scope: !371, file: !258, line: 189, type: !375, scopeLine: 190, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !374, retainedNodes: !109)
!2565 = !DILocalVariable(name: "this", arg: 1, scope: !2564, type: !2566, flags: DIFlagArtificial | DIFlagObjectPointer)
!2566 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !371, size: 64)
!2567 = !DILocation(line: 0, scope: !2564)
!2568 = !DILocation(line: 190, column: 9, scope: !2564)
!2569 = !DILocation(line: 190, column: 26, scope: !2564)
!2570 = distinct !DISubprogram(name: "_Head_base", linkageName: "_ZNSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EEC2Ev", scope: !267, file: !258, line: 80, type: !286, scopeLine: 81, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !285, retainedNodes: !109)
!2571 = !DILocalVariable(name: "this", arg: 1, scope: !2570, type: !2572, flags: DIFlagArtificial | DIFlagObjectPointer)
!2572 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !267, size: 64)
!2573 = !DILocation(line: 0, scope: !2570)
!2574 = !DILocation(line: 81, column: 26, scope: !2570)
!2575 = distinct !DISubprogram(name: "get<0UL, std::thread::_State *, std::default_delete<std::thread::_State> >", linkageName: "_ZSt3getILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERS9_", scope: !2, file: !258, line: 1393, type: !2576, scopeLine: 1394, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2584, retainedNodes: !109)
!2576 = !DISubroutineType(types: !2577)
!2577 = !{!2578, !466}
!2578 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2579, size: 64)
!2579 = !DIDerivedType(tag: DW_TAG_typedef, name: "__tuple_element_t<0UL, tuple<_State *, default_delete<_State> > >", scope: !2, file: !2397, line: 118, baseType: !2580)
!2580 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2581, file: !258, line: 1362, baseType: !281)
!2581 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tuple_element<0UL, std::tuple<std::thread::_State *, std::default_delete<std::thread::_State> > >", scope: !2, file: !258, line: 1360, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !2582, identifier: "_ZTSSt13tuple_elementILm0ESt5tupleIJPNSt6thread6_StateESt14default_deleteIS2_EEEE")
!2582 = !{!2430, !2583}
!2583 = !DITemplateTypeParameter(name: "_Tp", type: !257)
!2584 = !{!2433, !447}
!2585 = !DILocalVariable(name: "__t", arg: 1, scope: !2575, file: !258, line: 1393, type: !466)
!2586 = !DILocation(line: 1393, column: 30, scope: !2575)
!2587 = !DILocation(line: 1394, column: 37, scope: !2575)
!2588 = !DILocation(line: 1394, column: 14, scope: !2575)
!2589 = !DILocation(line: 1394, column: 7, scope: !2575)
!2590 = distinct !DISubprogram(name: "__get_helper<0UL, std::thread::_State *, std::default_delete<std::thread::_State> >", linkageName: "_ZSt12__get_helperILm0EPNSt6thread6_StateEJSt14default_deleteIS1_EEERT0_RSt11_Tuple_implIXT_EJS5_DpT1_EE", scope: !2, file: !258, line: 1377, type: !408, scopeLine: 1378, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2591, retainedNodes: !109)
!2591 = !{!2433, !405, !2592}
!2592 = !DITemplateValueParameter(tag: DW_TAG_GNU_template_parameter_pack, name: "_Tail", value: !368)
!2593 = !DILocalVariable(name: "__t", arg: 1, scope: !2590, file: !258, line: 1377, type: !410)
!2594 = !DILocation(line: 1377, column: 53, scope: !2590)
!2595 = !DILocation(line: 1378, column: 57, scope: !2590)
!2596 = !DILocation(line: 1378, column: 14, scope: !2590)
!2597 = !DILocation(line: 1378, column: 7, scope: !2590)
!2598 = distinct !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm0EJPNSt6thread6_StateESt14default_deleteIS1_EEE7_M_headERS5_", scope: !261, file: !258, line: 268, type: !408, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !407, retainedNodes: !109)
!2599 = !DILocalVariable(name: "__t", arg: 1, scope: !2598, file: !258, line: 268, type: !410)
!2600 = !DILocation(line: 268, column: 28, scope: !2598)
!2601 = !DILocation(line: 268, column: 66, scope: !2598)
!2602 = !DILocation(line: 268, column: 51, scope: !2598)
!2603 = !DILocation(line: 268, column: 44, scope: !2598)
!2604 = distinct !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm0EPNSt6thread6_StateELb0EE7_M_headERS3_", scope: !371, file: !258, line: 233, type: !396, scopeLine: 233, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !395, retainedNodes: !109)
!2605 = !DILocalVariable(name: "__b", arg: 1, scope: !2604, file: !258, line: 233, type: !399)
!2606 = !DILocation(line: 233, column: 27, scope: !2604)
!2607 = !DILocation(line: 233, column: 50, scope: !2604)
!2608 = !DILocation(line: 233, column: 54, scope: !2604)
!2609 = !DILocation(line: 233, column: 43, scope: !2604)
!2610 = distinct !DISubprogram(name: "get_deleter", linkageName: "_ZNSt10unique_ptrINSt6thread6_StateESt14default_deleteIS1_EE11get_deleterEv", scope: !247, file: !248, line: 426, type: !579, scopeLine: 427, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !578, retainedNodes: !109)
!2611 = !DILocalVariable(name: "this", arg: 1, scope: !2610, type: !2251, flags: DIFlagArtificial | DIFlagObjectPointer)
!2612 = !DILocation(line: 0, scope: !2610)
!2613 = !DILocation(line: 427, column: 16, scope: !2610)
!2614 = !DILocation(line: 427, column: 21, scope: !2610)
!2615 = !DILocation(line: 427, column: 9, scope: !2610)
!2616 = distinct !DISubprogram(name: "operator()", linkageName: "_ZNKSt14default_deleteINSt6thread6_StateEEclEPS1_", scope: !270, file: !248, line: 79, type: !277, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !276, retainedNodes: !109)
!2617 = !DILocalVariable(name: "this", arg: 1, scope: !2616, type: !2618, flags: DIFlagArtificial | DIFlagObjectPointer)
!2618 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !280, size: 64)
!2619 = !DILocation(line: 0, scope: !2616)
!2620 = !DILocalVariable(name: "__ptr", arg: 2, scope: !2616, file: !248, line: 79, type: !281)
!2621 = !DILocation(line: 79, column: 23, scope: !2616)
!2622 = !DILocation(line: 85, column: 9, scope: !2616)
!2623 = !DILocation(line: 85, column: 2, scope: !2616)
!2624 = !DILocation(line: 86, column: 7, scope: !2616)
!2625 = distinct !DISubprogram(name: "_M_deleter", linkageName: "_ZNSt15__uniq_ptr_implINSt6thread6_StateESt14default_deleteIS1_EE10_M_deleterEv", scope: !254, file: !248, line: 174, type: !522, scopeLine: 174, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !521, retainedNodes: !109)
!2626 = !DILocalVariable(name: "this", arg: 1, scope: !2625, type: !2524, flags: DIFlagArtificial | DIFlagObjectPointer)
!2627 = !DILocation(line: 0, scope: !2625)
!2628 = !DILocation(line: 174, column: 52, scope: !2625)
!2629 = !DILocation(line: 174, column: 40, scope: !2625)
!2630 = !DILocation(line: 174, column: 33, scope: !2625)
!2631 = distinct !DISubprogram(name: "get<1UL, std::thread::_State *, std::default_delete<std::thread::_State> >", linkageName: "_ZSt3getILm1EJPNSt6thread6_StateESt14default_deleteIS1_EEERNSt13tuple_elementIXT_ESt5tupleIJDpT0_EEE4typeERS9_", scope: !2, file: !258, line: 1393, type: !2632, scopeLine: 1394, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2641, retainedNodes: !109)
!2632 = !DISubroutineType(types: !2633)
!2633 = !{!2634, !466}
!2634 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !2635, size: 64)
!2635 = !DIDerivedType(tag: DW_TAG_typedef, name: "__tuple_element_t<1UL, tuple<_State *, default_delete<_State> > >", scope: !2, file: !2397, line: 118, baseType: !2636)
!2636 = !DIDerivedType(tag: DW_TAG_typedef, name: "type", scope: !2637, file: !258, line: 1362, baseType: !270)
!2637 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tuple_element<0UL, std::tuple<std::default_delete<std::thread::_State> > >", scope: !2, file: !258, line: 1360, size: 8, flags: DIFlagTypePassByValue, elements: !109, templateParams: !2638, identifier: "_ZTSSt13tuple_elementILm0ESt5tupleIJSt14default_deleteINSt6thread6_StateEEEEE")
!2638 = !{!2430, !2639}
!2639 = !DITemplateTypeParameter(name: "_Tp", type: !2640)
!2640 = !DICompositeType(tag: DW_TAG_class_type, name: "tuple<std::default_delete<std::thread::_State> >", scope: !2, file: !258, line: 609, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt5tupleIJSt14default_deleteINSt6thread6_StateEEEE")
!2641 = !{!2450, !447}
!2642 = !DILocalVariable(name: "__t", arg: 1, scope: !2631, file: !258, line: 1393, type: !466)
!2643 = !DILocation(line: 1393, column: 30, scope: !2631)
!2644 = !DILocation(line: 1394, column: 37, scope: !2631)
!2645 = !DILocation(line: 1394, column: 14, scope: !2631)
!2646 = !DILocation(line: 1394, column: 7, scope: !2631)
!2647 = distinct !DISubprogram(name: "__get_helper<1UL, std::default_delete<std::thread::_State> >", linkageName: "_ZSt12__get_helperILm1ESt14default_deleteINSt6thread6_StateEEJEERT0_RSt11_Tuple_implIXT_EJS4_DpT1_EE", scope: !2, file: !258, line: 1377, type: !338, scopeLine: 1378, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, templateParams: !2648, retainedNodes: !109)
!2648 = !{!2450, !335, !2495}
!2649 = !DILocalVariable(name: "__t", arg: 1, scope: !2647, file: !258, line: 1377, type: !340)
!2650 = !DILocation(line: 1377, column: 53, scope: !2647)
!2651 = !DILocation(line: 1378, column: 57, scope: !2647)
!2652 = !DILocation(line: 1378, column: 14, scope: !2647)
!2653 = !DILocation(line: 1378, column: 7, scope: !2647)
!2654 = distinct !DISubprogram(name: "_M_head", linkageName: "_ZNSt11_Tuple_implILm1EJSt14default_deleteINSt6thread6_StateEEEE7_M_headERS4_", scope: !264, file: !258, line: 424, type: !338, scopeLine: 424, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !337, retainedNodes: !109)
!2655 = !DILocalVariable(name: "__t", arg: 1, scope: !2654, file: !258, line: 424, type: !340)
!2656 = !DILocation(line: 424, column: 28, scope: !2654)
!2657 = !DILocation(line: 424, column: 66, scope: !2654)
!2658 = !DILocation(line: 424, column: 51, scope: !2654)
!2659 = !DILocation(line: 424, column: 44, scope: !2654)
!2660 = distinct !DISubprogram(name: "_M_head", linkageName: "_ZNSt10_Head_baseILm1ESt14default_deleteINSt6thread6_StateEELb1EE7_M_headERS4_", scope: !267, file: !258, line: 124, type: !326, scopeLine: 124, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !9, declaration: !325, retainedNodes: !109)
!2661 = !DILocalVariable(name: "__b", arg: 1, scope: !2660, file: !258, line: 124, type: !329)
!2662 = !DILocation(line: 124, column: 27, scope: !2660)
!2663 = !DILocation(line: 124, column: 50, scope: !2660)
!2664 = !DILocation(line: 124, column: 43, scope: !2660)
!2665 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_sequential.cpp", scope: !879, file: !879, type: !2666, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !9)
!2666 = !DISubroutineType(types: !109)
!2667 = !DILocation(line: 0, scope: !2665)
