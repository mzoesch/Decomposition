; ModuleID = '/mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/004_ibpng/pngrutil.c'
source_filename = "/mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/004_ibpng/pngrutil.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.png_struct_def = type { [1 x %struct.__jmp_buf_tag], ptr, ptr, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i8, i8, i32, i32, i32, i32, %struct.z_stream_s, ptr, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, ptr, ptr, ptr, ptr, i64, i32, i32, ptr, i16, i32, i16, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i32, %struct.png_color_16_struct, %struct.png_color_16_struct, ptr, i32, i32, %struct.png_xy, i32, i32, i32, i32, i32, ptr, ptr, ptr, ptr, ptr, ptr, %struct.png_color_8_struct, %struct.png_color_8_struct, ptr, %struct.png_color_16_struct, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i64, i64, i64, i32, i32, ptr, ptr, i32, [29 x i8], i32, ptr, ptr, i32, i32, ptr, i8, i8, i16, i16, ptr, i32, i8, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i8, i32, i32, i32, i64, %struct.png_unknown_chunk_t, i64, ptr, i64, i32, i32, ptr, [4 x ptr] }
%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }
%struct.z_stream_s = type { ptr, i32, i64, ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, i32, i64, i64 }
%struct.png_xy = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.png_color_8_struct = type { i8, i8, i8, i8, i8 }
%struct.png_color_16_struct = type { i8, i16, i16, i16, i16 }
%struct.png_unknown_chunk_t = type { [5 x i8], ptr, i64, i8 }
%struct.png_info_def = type { i32, i32, i32, i64, ptr, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, [8 x i8], i8, i8, i8, i8, ptr, ptr, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, ptr, %struct.png_time_struct, %struct.png_color_8_struct, ptr, %struct.png_color_16_struct, %struct.png_color_16_struct, i32, i32, i8, i32, i32, i8, i32, ptr, ptr, ptr, i32, i32, ptr, ptr, i8, i8, i32, ptr, i32, ptr, i32, i8, ptr, ptr, ptr, %struct.png_xy, i32, i32 }
%struct.png_time_struct = type { i16, i8, i8, i8, i8, i8 }
%struct.anon = type { ptr, i32 }
%struct.png_row_info_struct = type { i32, i64, i8, i8, i8, i8 }
%struct.png_color_struct = type { i8, i8, i8 }
%struct.png_text_struct = type { i32, ptr, ptr, i64, i64, ptr, ptr }
%struct.png_sPLT_struct = type { ptr, i8, ptr, i32 }
%struct.png_sPLT_entry_struct = type { i16, i16, i16, i16, i16 }

@.str = private unnamed_addr constant [34 x i8] c"PNG unsigned integer out of range\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"Not a PNG file\00", align 1
@.str.2 = private unnamed_addr constant [39 x i8] c"PNG file corrupted by ASCII conversion\00", align 1
@.str.3 = private unnamed_addr constant [28 x i8] c"bad header (invalid length)\00", align 1
@.str.4 = private unnamed_addr constant [26 x i8] c"bad header (invalid type)\00", align 1
@.str.5 = private unnamed_addr constant [29 x i8] c"invalid window size (libpng)\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"error in user chunk\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"Saving unknown chunk:\00", align 1
@.str.8 = private unnamed_addr constant [76 x i8] c"forcing save of an unhandled chunk; please call png_set_keep_unknown_chunks\00", align 1
@.str.9 = private unnamed_addr constant [24 x i8] c"no space in chunk cache\00", align 1
@.str.10 = private unnamed_addr constant [25 x i8] c"unhandled critical chunk\00", align 1
@.str.11 = private unnamed_addr constant [13 x i8] c"missing IHDR\00", align 1
@.str.12 = private unnamed_addr constant [13 x i8] c"out of place\00", align 1
@.str.13 = private unnamed_addr constant [10 x i8] c"duplicate\00", align 1
@.str.14 = private unnamed_addr constant [10 x i8] c"too short\00", align 1
@.str.15 = private unnamed_addr constant [28 x i8] c"length exceeds libpng limit\00", align 1
@.str.16 = private unnamed_addr constant [9 x i8] c"too long\00", align 1
@.str.17 = private unnamed_addr constant [25 x i8] c"internal row logic error\00", align 1
@.str.18 = private unnamed_addr constant [36 x i8] c"internal row size calculation error\00", align 1
@.str.19 = private unnamed_addr constant [25 x i8] c"internal row width error\00", align 1
@png_combine_row.row_mask = internal constant [2 x [3 x [6 x i32]]] [[3 x [6 x i32]] [[6 x i32] [i32 16843009, i32 269488144, i32 286331153, i32 1145324612, i32 1431655765, i32 -1431655766], [6 x i32] [i32 196611, i32 50332416, i32 50529027, i32 808464432, i32 858993459, i32 -858993460], [6 x i32] [i32 15, i32 983040, i32 983055, i32 251662080, i32 252645135, i32 -252645136]], [3 x [6 x i32]] [[6 x i32] [i32 -2139062144, i32 134744072, i32 -2004318072, i32 572662306, i32 -1431655766, i32 1431655765], [6 x i32] [i32 12583104, i32 -1073692672, i32 -1061109568, i32 202116108, i32 -858993460, i32 858993459], [6 x i32] [i32 240, i32 15728640, i32 15728880, i32 -268374016, i32 -252645136, i32 252645135]]], align 16
@png_combine_row.display_mask = internal constant [2 x [3 x [3 x i32]]] [[3 x [3 x i32]] [[3 x i32] [i32 -252645136, i32 -858993460, i32 -1431655766], [3 x i32] [i32 -16711936, i32 -252645136, i32 -858993460], [3 x i32] [i32 -65536, i32 -16711936, i32 -252645136]], [3 x [3 x i32]] [[3 x i32] [i32 252645135, i32 858993459, i32 1431655765], [3 x i32] [i32 -16711936, i32 252645135, i32 858993459], [3 x i32] [i32 -65536, i32 -16711936, i32 252645135]]], align 16
@.str.20 = private unnamed_addr constant [35 x i8] c"invalid user transform pixel depth\00", align 1
@png_pass_inc = internal constant [7 x i8] c"\08\08\04\04\02\02\01", align 1
@.str.21 = private unnamed_addr constant [22 x i8] c"Not enough image data\00", align 1
@.str.22 = private unnamed_addr constant [14 x i8] c"out of memory\00", align 1
@.str.23 = private unnamed_addr constant [22 x i8] c"Extra compressed data\00", align 1
@.str.24 = private unnamed_addr constant [20 x i8] c"Too much image data\00", align 1
@png_pass_start = internal constant [7 x i8] c"\00\04\00\02\00\01\00", align 1
@png_pass_yinc = internal constant [7 x i8] c"\08\08\08\04\04\02\02", align 1
@png_pass_ystart = internal constant [7 x i8] c"\00\00\04\00\02\00\01", align 1
@.str.25 = private unnamed_addr constant [45 x i8] c"Row has too many bytes to allocate in memory\00", align 1
@.str.26 = private unnamed_addr constant [10 x i8] c"CRC error\00", align 1
@.str.27 = private unnamed_addr constant [36 x i8] c"unknown chunk exceeds memory limits\00", align 1
@read_chunks = internal constant [28 x { ptr, i8, i8, i8, i8 }] [{ ptr, i8, i8, i8, i8 } { ptr @png_handle_IHDR, i8 13, i8 -48, i8 16, i8 0 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_PLTE, i8 1, i8 8, i8 0, i8 17 }, { ptr, i8, i8, i8, i8 } { ptr null, i8 1, i8 8, i8 -128, i8 17 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_IEND, i8 1, i8 8, i8 0, i8 8 }, { ptr, i8, i8, i8, i8 } { ptr null, i8 8, i8 -128, i8 64, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_bKGD, i8 6, i8 16, i8 64, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_cHRM, i8 32, i8 0, i8 98, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_cICP, i8 4, i8 64, i8 96, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_cLLI, i8 8, i8 -128, i8 96, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_eXIf, i8 2, i8 72, i8 0, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr null, i8 25, i8 -96, i8 1, i8 17 }, { ptr, i8, i8, i8, i8 } { ptr null, i8 2, i8 72, i8 64, i8 17 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_gAMA, i8 4, i8 64, i8 96, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_hIST, i8 0, i8 4, i8 32, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_iCCP, i8 1, i8 -24, i8 96, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_iTXt, i8 1, i8 104, i8 0, i8 17 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_mDCV, i8 24, i8 -128, i8 97, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_oFFs, i8 9, i8 -112, i8 64, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_pCAL, i8 1, i8 -24, i8 64, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_pHYs, i8 9, i8 -112, i8 64, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_sBIT, i8 4, i8 16, i8 96, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_sCAL, i8 2, i8 72, i8 64, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_sPLT, i8 1, i8 56, i8 64, i8 17 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_sRGB, i8 1, i8 16, i8 96, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_tEXt, i8 1, i8 40, i8 0, i8 17 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_tIME, i8 7, i8 112, i8 0, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_tRNS, i8 0, i8 1, i8 64, i8 1 }, { ptr, i8, i8, i8, i8 } { ptr @png_handle_zTXt, i8 2, i8 -24, i8 0, i8 17 }], align 16
@.str.29 = private unnamed_addr constant [25 x i8] c"ignored in grayscale PNG\00", align 1
@.str.30 = private unnamed_addr constant [8 x i8] c"invalid\00", align 1
@.str.31 = private unnamed_addr constant [14 x i8] c"invalid index\00", align 1
@.str.32 = private unnamed_addr constant [19 x i8] c"invalid gray level\00", align 1
@.str.33 = private unnamed_addr constant [14 x i8] c"invalid color\00", align 1
@.str.34 = private unnamed_addr constant [22 x i8] c"extra compressed data\00", align 1
@.str.35 = private unnamed_addr constant [23 x i8] c"bad compression method\00", align 1
@.str.36 = private unnamed_addr constant [12 x i8] c"bad keyword\00", align 1
@.str.37 = private unnamed_addr constant [18 x i8] c"zstream unclaimed\00", align 1
@.str.38 = private unnamed_addr constant [10 x i8] c"truncated\00", align 1
@.str.39 = private unnamed_addr constant [21 x i8] c"bad compression info\00", align 1
@.str.40 = private unnamed_addr constant [24 x i8] c"invalid parameter count\00", align 1
@.str.41 = private unnamed_addr constant [27 x i8] c"unrecognized equation type\00", align 1
@.str.42 = private unnamed_addr constant [13 x i8] c"invalid data\00", align 1
@.str.43 = private unnamed_addr constant [11 x i8] c"bad length\00", align 1
@.str.44 = private unnamed_addr constant [13 x i8] c"invalid unit\00", align 1
@.str.45 = private unnamed_addr constant [17 x i8] c"bad width format\00", align 1
@.str.46 = private unnamed_addr constant [19 x i8] c"non-positive width\00", align 1
@.str.47 = private unnamed_addr constant [18 x i8] c"bad height format\00", align 1
@.str.48 = private unnamed_addr constant [20 x i8] c"non-positive height\00", align 1
@.str.49 = private unnamed_addr constant [33 x i8] c"No space in chunk cache for sPLT\00", align 1
@.str.50 = private unnamed_addr constant [21 x i8] c"malformed sPLT chunk\00", align 1
@.str.51 = private unnamed_addr constant [26 x i8] c"sPLT chunk has bad length\00", align 1
@.str.52 = private unnamed_addr constant [20 x i8] c"sPLT chunk too long\00", align 1
@.str.53 = private unnamed_addr constant [36 x i8] c"sPLT chunk requires too much memory\00", align 1
@.str.54 = private unnamed_addr constant [27 x i8] c"invalid with alpha channel\00", align 1
@.str.55 = private unnamed_addr constant [25 x i8] c"unknown compression type\00", align 1
@.str.56 = private unnamed_addr constant [32 x i8] c"Read failure in png_handle_zTXt\00", align 1
@.str.57 = private unnamed_addr constant [15 x i8] c" using zstream\00", align 1
@.str.58 = private unnamed_addr constant [6 x i8] c"1.3.1\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_get_uint_31(ptr noalias noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = load i8, ptr %6, align 1
  %8 = zext i8 %7 to i32
  %9 = shl i32 %8, 24
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds i8, ptr %10, i64 1
  %12 = load i8, ptr %11, align 1
  %13 = zext i8 %12 to i32
  %14 = shl i32 %13, 16
  %15 = add i32 %9, %14
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds i8, ptr %16, i64 2
  %18 = load i8, ptr %17, align 1
  %19 = zext i8 %18 to i32
  %20 = shl i32 %19, 8
  %21 = add i32 %15, %20
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds i8, ptr %22, i64 3
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i32
  %26 = add i32 %21, %25
  store i32 %26, ptr %5, align 4
  %27 = load i32, ptr %5, align 4
  %28 = icmp ugt i32 %27, 2147483647
  br i1 %28, label %29, label %31

29:                                               ; preds = %2
  %30 = load ptr, ptr %3, align 8
  call void @png_error(ptr noundef %30, ptr noundef @.str) #6
  unreachable

31:                                               ; preds = %2
  %32 = load i32, ptr %5, align 4
  ret i32 %32
}

; Function Attrs: noreturn
declare void @png_error(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_get_uint_32(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = load i8, ptr %4, align 1
  %6 = zext i8 %5 to i32
  %7 = shl i32 %6, 24
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds i8, ptr %8, i64 1
  %10 = load i8, ptr %9, align 1
  %11 = zext i8 %10 to i32
  %12 = shl i32 %11, 16
  %13 = add i32 %7, %12
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds i8, ptr %14, i64 2
  %16 = load i8, ptr %15, align 1
  %17 = zext i8 %16 to i32
  %18 = shl i32 %17, 8
  %19 = add i32 %13, %18
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds i8, ptr %20, i64 3
  %22 = load i8, ptr %21, align 1
  %23 = zext i8 %22 to i32
  %24 = add i32 %19, %23
  store i32 %24, ptr %3, align 4
  %25 = load i32, ptr %3, align 4
  ret i32 %25
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_get_int_32(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load i8, ptr %5, align 1
  %7 = zext i8 %6 to i32
  %8 = shl i32 %7, 24
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds i8, ptr %9, i64 1
  %11 = load i8, ptr %10, align 1
  %12 = zext i8 %11 to i32
  %13 = shl i32 %12, 16
  %14 = add i32 %8, %13
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds i8, ptr %15, i64 2
  %17 = load i8, ptr %16, align 1
  %18 = zext i8 %17 to i32
  %19 = shl i32 %18, 8
  %20 = add i32 %14, %19
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds i8, ptr %21, i64 3
  %23 = load i8, ptr %22, align 1
  %24 = zext i8 %23 to i32
  %25 = add i32 %20, %24
  store i32 %25, ptr %4, align 4
  %26 = load i32, ptr %4, align 4
  %27 = and i32 %26, -2147483648
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %1
  %30 = load i32, ptr %4, align 4
  store i32 %30, ptr %2, align 4
  br label %42

31:                                               ; preds = %1
  %32 = load i32, ptr %4, align 4
  %33 = xor i32 %32, -1
  %34 = add i32 %33, 1
  store i32 %34, ptr %4, align 4
  %35 = load i32, ptr %4, align 4
  %36 = and i32 %35, -2147483648
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %41

38:                                               ; preds = %31
  %39 = load i32, ptr %4, align 4
  %40 = sub nsw i32 0, %39
  store i32 %40, ptr %2, align 4
  br label %42

41:                                               ; preds = %31
  store i32 0, ptr %2, align 4
  br label %42

42:                                               ; preds = %41, %38, %29
  %43 = load i32, ptr %2, align 4
  ret i32 %43
}

; Function Attrs: noinline nounwind sspstrong uwtable
define zeroext i16 @png_get_uint_16(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = load i8, ptr %4, align 1
  %6 = zext i8 %5 to i32
  %7 = shl i32 %6, 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds i8, ptr %8, i64 1
  %10 = load i8, ptr %9, align 1
  %11 = zext i8 %10 to i32
  %12 = add i32 %7, %11
  store i32 %12, ptr %3, align 4
  %13 = load i32, ptr %3, align 4
  %14 = trunc i32 %13 to i16
  ret i16 %14
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_read_sig(ptr noalias noundef %0, ptr noalias noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.png_struct_def, ptr %7, i32 0, i32 68
  %9 = load i8, ptr %8, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp sge i32 %10, 8
  br i1 %11, label %12, label %13

12:                                               ; preds = %2
  br label %61

13:                                               ; preds = %2
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.png_struct_def, ptr %14, i32 0, i32 68
  %16 = load i8, ptr %15, align 1
  %17 = zext i8 %16 to i64
  store i64 %17, ptr %5, align 8
  %18 = load i64, ptr %5, align 8
  %19 = sub i64 8, %18
  store i64 %19, ptr %6, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.png_struct_def, ptr %20, i32 0, i32 147
  store i32 17, ptr %21, align 4
  %22 = load ptr, ptr %3, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.png_info_def, ptr %23, i32 0, i32 15
  %25 = load i64, ptr %5, align 8
  %26 = getelementptr inbounds [8 x i8], ptr %24, i64 0, i64 %25
  %27 = load i64, ptr %6, align 8
  call void @png_read_data(ptr noundef %22, ptr noundef %26, i64 noundef %27)
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds %struct.png_struct_def, ptr %28, i32 0, i32 68
  store i8 8, ptr %29, align 1
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.png_info_def, ptr %30, i32 0, i32 15
  %32 = getelementptr inbounds [8 x i8], ptr %31, i64 0, i64 0
  %33 = load i64, ptr %5, align 8
  %34 = load i64, ptr %6, align 8
  %35 = call i32 @png_sig_cmp(ptr noundef %32, i64 noundef %33, i64 noundef %34)
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %53

37:                                               ; preds = %13
  %38 = load i64, ptr %5, align 8
  %39 = icmp ult i64 %38, 4
  br i1 %39, label %40, label %51

40:                                               ; preds = %37
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.png_info_def, ptr %41, i32 0, i32 15
  %43 = getelementptr inbounds [8 x i8], ptr %42, i64 0, i64 0
  %44 = load i64, ptr %5, align 8
  %45 = load i64, ptr %6, align 8
  %46 = sub i64 %45, 4
  %47 = call i32 @png_sig_cmp(ptr noundef %43, i64 noundef %44, i64 noundef %46)
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %51

49:                                               ; preds = %40
  %50 = load ptr, ptr %3, align 8
  call void @png_error(ptr noundef %50, ptr noundef @.str.1) #6
  unreachable

51:                                               ; preds = %40, %37
  %52 = load ptr, ptr %3, align 8
  call void @png_error(ptr noundef %52, ptr noundef @.str.2) #6
  unreachable

53:                                               ; preds = %13
  %54 = load i64, ptr %5, align 8
  %55 = icmp ult i64 %54, 3
  br i1 %55, label %56, label %61

56:                                               ; preds = %53
  %57 = load ptr, ptr %3, align 8
  %58 = getelementptr inbounds %struct.png_struct_def, ptr %57, i32 0, i32 15
  %59 = load i32, ptr %58, align 4
  %60 = or i32 %59, 4096
  store i32 %60, ptr %58, align 4
  br label %61

61:                                               ; preds = %12, %56, %53
  ret void
}

declare void @png_read_data(ptr noundef, ptr noundef, i64 noundef) #2

declare i32 @png_sig_cmp(ptr noundef, i64 noundef, i64 noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_read_chunk_header(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca [8 x i8], align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.png_struct_def, ptr %6, i32 0, i32 147
  store i32 33, ptr %7, align 4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds [8 x i8], ptr %3, i64 0, i64 0
  call void @png_read_data(ptr noundef %8, ptr noundef %9, i64 noundef 8)
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds [8 x i8], ptr %3, i64 0, i64 0
  %12 = call i32 @png_get_uint_31(ptr noundef %10, ptr noundef %11)
  store i32 %12, ptr %5, align 4
  %13 = getelementptr inbounds [8 x i8], ptr %3, i64 0, i64 0
  %14 = getelementptr inbounds i8, ptr %13, i64 4
  %15 = getelementptr inbounds i8, ptr %14, i64 0
  %16 = load i8, ptr %15, align 1
  %17 = zext i8 %16 to i32
  %18 = and i32 255, %17
  %19 = and i32 -1, %18
  %20 = shl i32 %19, 24
  %21 = getelementptr inbounds [8 x i8], ptr %3, i64 0, i64 0
  %22 = getelementptr inbounds i8, ptr %21, i64 4
  %23 = getelementptr inbounds i8, ptr %22, i64 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i32
  %26 = and i32 255, %25
  %27 = and i32 -1, %26
  %28 = shl i32 %27, 16
  %29 = or i32 %20, %28
  %30 = getelementptr inbounds [8 x i8], ptr %3, i64 0, i64 0
  %31 = getelementptr inbounds i8, ptr %30, i64 4
  %32 = getelementptr inbounds i8, ptr %31, i64 2
  %33 = load i8, ptr %32, align 1
  %34 = zext i8 %33 to i32
  %35 = and i32 255, %34
  %36 = and i32 -1, %35
  %37 = shl i32 %36, 8
  %38 = or i32 %29, %37
  %39 = getelementptr inbounds [8 x i8], ptr %3, i64 0, i64 0
  %40 = getelementptr inbounds i8, ptr %39, i64 4
  %41 = getelementptr inbounds i8, ptr %40, i64 3
  %42 = load i8, ptr %41, align 1
  %43 = zext i8 %42 to i32
  %44 = and i32 255, %43
  %45 = and i32 -1, %44
  %46 = shl i32 %45, 0
  %47 = or i32 %38, %46
  store i32 %47, ptr %4, align 4
  %48 = load ptr, ptr %2, align 8
  %49 = getelementptr inbounds %struct.png_struct_def, ptr %48, i32 0, i32 45
  store i32 %47, ptr %49, align 8
  %50 = load ptr, ptr %2, align 8
  call void @png_reset_crc(ptr noundef %50)
  %51 = load ptr, ptr %2, align 8
  %52 = getelementptr inbounds [8 x i8], ptr %3, i64 0, i64 0
  %53 = getelementptr inbounds i8, ptr %52, i64 4
  call void @png_calculate_crc(ptr noundef %51, ptr noundef %53, i64 noundef 4)
  %54 = getelementptr inbounds [8 x i8], ptr %3, i64 0, i64 0
  %55 = load i8, ptr %54, align 1
  %56 = zext i8 %55 to i32
  %57 = icmp uge i32 %56, 128
  br i1 %57, label %58, label %60

58:                                               ; preds = %1
  %59 = load ptr, ptr %2, align 8
  call void @png_chunk_error(ptr noundef %59, ptr noundef @.str.3) #6
  unreachable

60:                                               ; preds = %1
  %61 = load i32, ptr %4, align 4
  %62 = call i32 @check_chunk_name(i32 noundef %61)
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %76, label %64

64:                                               ; preds = %60
  %65 = load ptr, ptr %2, align 8
  %66 = getelementptr inbounds %struct.png_struct_def, ptr %65, i32 0, i32 45
  %67 = load i32, ptr %66, align 8
  %68 = lshr i32 %67, 29
  %69 = and i32 1, %68
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %71, label %73

71:                                               ; preds = %64
  %72 = load ptr, ptr %2, align 8
  call void @png_chunk_error(ptr noundef %72, ptr noundef @.str.4) #6
  unreachable

73:                                               ; preds = %64
  %74 = load ptr, ptr %2, align 8
  call void @png_chunk_benign_error(ptr noundef %74, ptr noundef @.str.4)
  br label %75

75:                                               ; preds = %73
  br label %76

76:                                               ; preds = %75, %60
  %77 = load ptr, ptr %2, align 8
  %78 = getelementptr inbounds %struct.png_struct_def, ptr %77, i32 0, i32 147
  store i32 65, ptr %78, align 4
  %79 = load i32, ptr %5, align 4
  ret i32 %79
}

declare void @png_reset_crc(ptr noundef) #2

declare void @png_calculate_crc(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noreturn
declare void @png_chunk_error(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @check_chunk_name(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = and i32 %4, -538968097
  store i32 %5, ptr %2, align 4
  %6 = load i32, ptr %2, align 4
  %7 = and i32 %6, -522133280
  %8 = xor i32 %7, 1077952576
  store i32 %8, ptr %3, align 4
  %9 = load i32, ptr %2, align 4
  %10 = sub i32 %9, 1094795585
  store i32 %10, ptr %2, align 4
  %11 = load i32, ptr %2, align 4
  %12 = load i32, ptr %3, align 4
  %13 = or i32 %12, %11
  store i32 %13, ptr %3, align 4
  %14 = load i32, ptr %2, align 4
  %15 = sub i32 %14, 421075226
  store i32 %15, ptr %2, align 4
  %16 = load i32, ptr %2, align 4
  %17 = xor i32 %16, -1
  %18 = load i32, ptr %3, align 4
  %19 = or i32 %18, %17
  store i32 %19, ptr %3, align 4
  %20 = load i32, ptr %3, align 4
  %21 = and i32 %20, -522133280
  %22 = icmp eq i32 %21, 0
  %23 = zext i1 %22 to i32
  ret i32 %23
}

declare void @png_chunk_benign_error(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_crc_read(ptr noalias noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %3
  br label %19

10:                                               ; preds = %3
  %11 = load ptr, ptr %4, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = load i32, ptr %6, align 4
  %14 = zext i32 %13 to i64
  call void @png_read_data(ptr noundef %11, ptr noundef %12, i64 noundef %14)
  %15 = load ptr, ptr %4, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = load i32, ptr %6, align 4
  %18 = zext i32 %17 to i64
  call void @png_calculate_crc(ptr noundef %15, ptr noundef %16, i64 noundef %18)
  br label %19

19:                                               ; preds = %10, %9
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_crc_finish(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  %7 = call i32 @png_crc_finish_critical(ptr noundef %5, i32 noundef %6, i32 noundef 0)
  ret i32 %7
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_crc_finish_critical(ptr noalias noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [1024 x i8], align 16
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  br label %10

10:                                               ; preds = %19, %3
  %11 = load i32, ptr %6, align 4
  %12 = icmp ugt i32 %11, 0
  br i1 %12, label %13, label %26

13:                                               ; preds = %10
  store i32 1024, ptr %8, align 4
  %14 = load i32, ptr %8, align 4
  %15 = load i32, ptr %6, align 4
  %16 = icmp ugt i32 %14, %15
  br i1 %16, label %17, label %19

17:                                               ; preds = %13
  %18 = load i32, ptr %6, align 4
  store i32 %18, ptr %8, align 4
  br label %19

19:                                               ; preds = %17, %13
  %20 = load i32, ptr %8, align 4
  %21 = load i32, ptr %6, align 4
  %22 = sub i32 %21, %20
  store i32 %22, ptr %6, align 4
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds [1024 x i8], ptr %9, i64 0, i64 0
  %25 = load i32, ptr %8, align 4
  call void @png_crc_read(ptr noundef %23, ptr noundef %24, i32 noundef %25)
  br label %10, !llvm.loop !5

26:                                               ; preds = %10
  %27 = load i32, ptr %7, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %36

29:                                               ; preds = %26
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.png_struct_def, ptr %30, i32 0, i32 16
  %32 = load i32, ptr %31, align 8
  %33 = and i32 %32, 2048
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %29
  store i32 0, ptr %7, align 4
  br label %36

36:                                               ; preds = %35, %29, %26
  %37 = load ptr, ptr %5, align 8
  %38 = load i32, ptr %7, align 4
  %39 = call i32 @png_crc_error(ptr noundef %37, i32 noundef %38)
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %68

41:                                               ; preds = %36
  %42 = load i32, ptr %7, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %51, label %44

44:                                               ; preds = %41
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds %struct.png_struct_def, ptr %45, i32 0, i32 45
  %47 = load i32, ptr %46, align 8
  %48 = lshr i32 %47, 29
  %49 = and i32 1, %48
  %50 = icmp ne i32 %49, 0
  br i1 %50, label %51, label %57

51:                                               ; preds = %44, %41
  %52 = load ptr, ptr %5, align 8
  %53 = getelementptr inbounds %struct.png_struct_def, ptr %52, i32 0, i32 16
  %54 = load i32, ptr %53, align 8
  %55 = and i32 %54, 512
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %63, label %65

57:                                               ; preds = %44
  %58 = load ptr, ptr %5, align 8
  %59 = getelementptr inbounds %struct.png_struct_def, ptr %58, i32 0, i32 16
  %60 = load i32, ptr %59, align 8
  %61 = and i32 %60, 1024
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %65

63:                                               ; preds = %57, %51
  %64 = load ptr, ptr %5, align 8
  call void @png_chunk_warning(ptr noundef %64, ptr noundef @.str.26)
  br label %67

65:                                               ; preds = %57, %51
  %66 = load ptr, ptr %5, align 8
  call void @png_chunk_error(ptr noundef %66, ptr noundef @.str.26) #6
  unreachable

67:                                               ; preds = %63
  store i32 1, ptr %4, align 4
  br label %69

68:                                               ; preds = %36
  store i32 0, ptr %4, align 4
  br label %69

69:                                               ; preds = %68, %67
  %70 = load i32, ptr %4, align 4
  ret i32 %70
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_zlib_inflate(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds %struct.png_struct_def, ptr %6, i32 0, i32 71
  %8 = load i8, ptr %7, align 8
  %9 = zext i8 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %33

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.png_struct_def, ptr %12, i32 0, i32 19
  %14 = getelementptr inbounds %struct.z_stream_s, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 8
  %16 = icmp ugt i32 %15, 0
  br i1 %16, label %17, label %33

17:                                               ; preds = %11
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.png_struct_def, ptr %18, i32 0, i32 19
  %20 = getelementptr inbounds %struct.z_stream_s, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = load i8, ptr %21, align 1
  %23 = zext i8 %22 to i32
  %24 = ashr i32 %23, 4
  %25 = icmp sgt i32 %24, 7
  br i1 %25, label %26, label %30

26:                                               ; preds = %17
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.png_struct_def, ptr %27, i32 0, i32 19
  %29 = getelementptr inbounds %struct.z_stream_s, ptr %28, i32 0, i32 6
  store ptr @.str.5, ptr %29, align 8
  store i32 -3, ptr %3, align 4
  br label %38

30:                                               ; preds = %17
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.png_struct_def, ptr %31, i32 0, i32 71
  store i8 0, ptr %32, align 8
  br label %33

33:                                               ; preds = %30, %11, %2
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds %struct.png_struct_def, ptr %34, i32 0, i32 19
  %36 = load i32, ptr %5, align 4
  %37 = call i32 @inflate(ptr noundef %35, i32 noundef %36)
  store i32 %37, ptr %3, align 4
  br label %38

38:                                               ; preds = %33, %26
  %39 = load i32, ptr %3, align 4
  ret i32 %39
}

declare i32 @inflate(ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_handle_unknown(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i32 1, ptr %9, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.png_struct_def, ptr %11, i32 0, i32 119
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %53

15:                                               ; preds = %4
  %16 = load ptr, ptr %5, align 8
  %17 = load i32, ptr %7, align 4
  %18 = call i32 @png_cache_unknown_chunk(ptr noundef %16, i32 noundef %17)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %51

20:                                               ; preds = %15
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds %struct.png_struct_def, ptr %21, i32 0, i32 119
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds %struct.png_struct_def, ptr %25, i32 0, i32 142
  %27 = call i32 %23(ptr noundef %24, ptr noundef %26)
  store i32 %27, ptr %10, align 4
  %28 = load i32, ptr %10, align 4
  %29 = icmp slt i32 %28, 0
  br i1 %29, label %30, label %32

30:                                               ; preds = %20
  %31 = load ptr, ptr %5, align 8
  call void @png_chunk_error(ptr noundef %31, ptr noundef @.str.6) #6
  unreachable

32:                                               ; preds = %20
  %33 = load i32, ptr %10, align 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %48

35:                                               ; preds = %32
  %36 = load i32, ptr %8, align 4
  %37 = icmp slt i32 %36, 2
  br i1 %37, label %38, label %47

38:                                               ; preds = %35
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds %struct.png_struct_def, ptr %39, i32 0, i32 120
  %41 = load i32, ptr %40, align 8
  %42 = icmp slt i32 %41, 2
  br i1 %42, label %43, label %46

43:                                               ; preds = %38
  %44 = load ptr, ptr %5, align 8
  call void @png_chunk_warning(ptr noundef %44, ptr noundef @.str.7)
  %45 = load ptr, ptr %5, align 8
  call void @png_app_warning(ptr noundef %45, ptr noundef @.str.8)
  br label %46

46:                                               ; preds = %43, %38
  store i32 2, ptr %8, align 4
  br label %47

47:                                               ; preds = %46, %35
  br label %49

48:                                               ; preds = %32
  store i32 3, ptr %9, align 4
  store i32 1, ptr %8, align 4
  br label %49

49:                                               ; preds = %48, %47
  br label %50

50:                                               ; preds = %49
  br label %52

51:                                               ; preds = %15
  store i32 1, ptr %8, align 4
  br label %52

52:                                               ; preds = %51, %50
  br label %85

53:                                               ; preds = %4
  %54 = load i32, ptr %8, align 4
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %60

56:                                               ; preds = %53
  %57 = load ptr, ptr %5, align 8
  %58 = getelementptr inbounds %struct.png_struct_def, ptr %57, i32 0, i32 120
  %59 = load i32, ptr %58, align 8
  store i32 %59, ptr %8, align 4
  br label %60

60:                                               ; preds = %56, %53
  %61 = load i32, ptr %8, align 4
  %62 = icmp eq i32 %61, 3
  br i1 %62, label %73, label %63

63:                                               ; preds = %60
  %64 = load i32, ptr %8, align 4
  %65 = icmp eq i32 %64, 2
  br i1 %65, label %66, label %80

66:                                               ; preds = %63
  %67 = load ptr, ptr %5, align 8
  %68 = getelementptr inbounds %struct.png_struct_def, ptr %67, i32 0, i32 45
  %69 = load i32, ptr %68, align 8
  %70 = lshr i32 %69, 29
  %71 = and i32 1, %70
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %80

73:                                               ; preds = %66, %60
  %74 = load ptr, ptr %5, align 8
  %75 = load i32, ptr %7, align 4
  %76 = call i32 @png_cache_unknown_chunk(ptr noundef %74, i32 noundef %75)
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %79

78:                                               ; preds = %73
  store i32 1, ptr %8, align 4
  br label %79

79:                                               ; preds = %78, %73
  br label %84

80:                                               ; preds = %66, %63
  %81 = load ptr, ptr %5, align 8
  %82 = load i32, ptr %7, align 4
  %83 = call i32 @png_crc_finish(ptr noundef %81, i32 noundef %82)
  br label %84

84:                                               ; preds = %80, %79
  br label %85

85:                                               ; preds = %84, %52
  %86 = load i32, ptr %8, align 4
  %87 = icmp eq i32 %86, 3
  br i1 %87, label %98, label %88

88:                                               ; preds = %85
  %89 = load i32, ptr %8, align 4
  %90 = icmp eq i32 %89, 2
  br i1 %90, label %91, label %118

91:                                               ; preds = %88
  %92 = load ptr, ptr %5, align 8
  %93 = getelementptr inbounds %struct.png_struct_def, ptr %92, i32 0, i32 45
  %94 = load i32, ptr %93, align 8
  %95 = lshr i32 %94, 29
  %96 = and i32 1, %95
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %118

98:                                               ; preds = %91, %85
  %99 = load ptr, ptr %5, align 8
  %100 = getelementptr inbounds %struct.png_struct_def, ptr %99, i32 0, i32 140
  %101 = load i32, ptr %100, align 4
  switch i32 %101, label %107 [
    i32 2, label %102
    i32 1, label %106
    i32 0, label %112
  ]

102:                                              ; preds = %98
  %103 = load ptr, ptr %5, align 8
  %104 = getelementptr inbounds %struct.png_struct_def, ptr %103, i32 0, i32 140
  store i32 1, ptr %104, align 4
  %105 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %105, ptr noundef @.str.9)
  br label %106

106:                                              ; preds = %98, %102
  br label %117

107:                                              ; preds = %98
  %108 = load ptr, ptr %5, align 8
  %109 = getelementptr inbounds %struct.png_struct_def, ptr %108, i32 0, i32 140
  %110 = load i32, ptr %109, align 4
  %111 = add i32 %110, -1
  store i32 %111, ptr %109, align 4
  br label %112

112:                                              ; preds = %98, %107
  %113 = load ptr, ptr %5, align 8
  %114 = load ptr, ptr %6, align 8
  %115 = load ptr, ptr %5, align 8
  %116 = getelementptr inbounds %struct.png_struct_def, ptr %115, i32 0, i32 142
  call void @png_set_unknown_chunks(ptr noundef %113, ptr noundef %114, ptr noundef %116, i32 noundef 1)
  store i32 2, ptr %9, align 4
  br label %117

117:                                              ; preds = %112, %106
  br label %118

118:                                              ; preds = %117, %91, %88
  %119 = load ptr, ptr %5, align 8
  %120 = getelementptr inbounds %struct.png_struct_def, ptr %119, i32 0, i32 142
  %121 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %120, i32 0, i32 1
  %122 = load ptr, ptr %121, align 8
  %123 = icmp ne ptr %122, null
  br i1 %123, label %124, label %130

124:                                              ; preds = %118
  %125 = load ptr, ptr %5, align 8
  %126 = load ptr, ptr %5, align 8
  %127 = getelementptr inbounds %struct.png_struct_def, ptr %126, i32 0, i32 142
  %128 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %127, i32 0, i32 1
  %129 = load ptr, ptr %128, align 8
  call void @png_free(ptr noundef %125, ptr noundef %129)
  br label %130

130:                                              ; preds = %124, %118
  %131 = load ptr, ptr %5, align 8
  %132 = getelementptr inbounds %struct.png_struct_def, ptr %131, i32 0, i32 142
  %133 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %132, i32 0, i32 1
  store ptr null, ptr %133, align 8
  %134 = load i32, ptr %9, align 4
  %135 = icmp ult i32 %134, 2
  br i1 %135, label %136, label %145

136:                                              ; preds = %130
  %137 = load ptr, ptr %5, align 8
  %138 = getelementptr inbounds %struct.png_struct_def, ptr %137, i32 0, i32 45
  %139 = load i32, ptr %138, align 8
  %140 = lshr i32 %139, 29
  %141 = and i32 1, %140
  %142 = icmp ne i32 %141, 0
  br i1 %142, label %145, label %143

143:                                              ; preds = %136
  %144 = load ptr, ptr %5, align 8
  call void @png_chunk_error(ptr noundef %144, ptr noundef @.str.10) #6
  unreachable

145:                                              ; preds = %136, %130
  %146 = load i32, ptr %9, align 4
  ret i32 %146
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_cache_unknown_chunk(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.png_struct_def, ptr %7, i32 0, i32 141
  %9 = load i64, ptr %8, align 8
  store i64 %9, ptr %6, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 142
  %12 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %11, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %24

15:                                               ; preds = %2
  %16 = load ptr, ptr %4, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.png_struct_def, ptr %17, i32 0, i32 142
  %19 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  call void @png_free(ptr noundef %16, ptr noundef %20)
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds %struct.png_struct_def, ptr %21, i32 0, i32 142
  %23 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %22, i32 0, i32 1
  store ptr null, ptr %23, align 8
  br label %24

24:                                               ; preds = %15, %2
  %25 = load i32, ptr %5, align 4
  %26 = zext i32 %25 to i64
  %27 = load i64, ptr %6, align 8
  %28 = icmp ule i64 %26, %27
  br i1 %28, label %29, label %105

29:                                               ; preds = %24
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds %struct.png_struct_def, ptr %30, i32 0, i32 45
  %32 = load i32, ptr %31, align 8
  %33 = lshr i32 %32, 24
  %34 = and i32 %33, 255
  %35 = trunc i32 %34 to i8
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds %struct.png_struct_def, ptr %36, i32 0, i32 142
  %38 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %37, i32 0, i32 0
  %39 = getelementptr inbounds [5 x i8], ptr %38, i64 0, i64 0
  %40 = getelementptr inbounds i8, ptr %39, i64 0
  store i8 %35, ptr %40, align 8
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.png_struct_def, ptr %41, i32 0, i32 45
  %43 = load i32, ptr %42, align 8
  %44 = lshr i32 %43, 16
  %45 = and i32 %44, 255
  %46 = trunc i32 %45 to i8
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds %struct.png_struct_def, ptr %47, i32 0, i32 142
  %49 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %48, i32 0, i32 0
  %50 = getelementptr inbounds [5 x i8], ptr %49, i64 0, i64 0
  %51 = getelementptr inbounds i8, ptr %50, i64 1
  store i8 %46, ptr %51, align 1
  %52 = load ptr, ptr %4, align 8
  %53 = getelementptr inbounds %struct.png_struct_def, ptr %52, i32 0, i32 45
  %54 = load i32, ptr %53, align 8
  %55 = lshr i32 %54, 8
  %56 = and i32 %55, 255
  %57 = trunc i32 %56 to i8
  %58 = load ptr, ptr %4, align 8
  %59 = getelementptr inbounds %struct.png_struct_def, ptr %58, i32 0, i32 142
  %60 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %59, i32 0, i32 0
  %61 = getelementptr inbounds [5 x i8], ptr %60, i64 0, i64 0
  %62 = getelementptr inbounds i8, ptr %61, i64 2
  store i8 %57, ptr %62, align 2
  %63 = load ptr, ptr %4, align 8
  %64 = getelementptr inbounds %struct.png_struct_def, ptr %63, i32 0, i32 45
  %65 = load i32, ptr %64, align 8
  %66 = and i32 %65, 255
  %67 = trunc i32 %66 to i8
  %68 = load ptr, ptr %4, align 8
  %69 = getelementptr inbounds %struct.png_struct_def, ptr %68, i32 0, i32 142
  %70 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %69, i32 0, i32 0
  %71 = getelementptr inbounds [5 x i8], ptr %70, i64 0, i64 0
  %72 = getelementptr inbounds i8, ptr %71, i64 3
  store i8 %67, ptr %72, align 1
  %73 = load ptr, ptr %4, align 8
  %74 = getelementptr inbounds %struct.png_struct_def, ptr %73, i32 0, i32 142
  %75 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %74, i32 0, i32 0
  %76 = getelementptr inbounds [5 x i8], ptr %75, i64 0, i64 0
  %77 = getelementptr inbounds i8, ptr %76, i64 4
  store i8 0, ptr %77, align 4
  %78 = load i32, ptr %5, align 4
  %79 = zext i32 %78 to i64
  %80 = load ptr, ptr %4, align 8
  %81 = getelementptr inbounds %struct.png_struct_def, ptr %80, i32 0, i32 142
  %82 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %81, i32 0, i32 2
  store i64 %79, ptr %82, align 8
  %83 = load ptr, ptr %4, align 8
  %84 = getelementptr inbounds %struct.png_struct_def, ptr %83, i32 0, i32 15
  %85 = load i32, ptr %84, align 4
  %86 = trunc i32 %85 to i8
  %87 = load ptr, ptr %4, align 8
  %88 = getelementptr inbounds %struct.png_struct_def, ptr %87, i32 0, i32 142
  %89 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %88, i32 0, i32 3
  store i8 %86, ptr %89, align 8
  %90 = load i32, ptr %5, align 4
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %96

92:                                               ; preds = %29
  %93 = load ptr, ptr %4, align 8
  %94 = getelementptr inbounds %struct.png_struct_def, ptr %93, i32 0, i32 142
  %95 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %94, i32 0, i32 1
  store ptr null, ptr %95, align 8
  br label %104

96:                                               ; preds = %29
  %97 = load ptr, ptr %4, align 8
  %98 = load i32, ptr %5, align 4
  %99 = zext i32 %98 to i64
  %100 = call noalias ptr @png_malloc_warn(ptr noundef %97, i64 noundef %99)
  %101 = load ptr, ptr %4, align 8
  %102 = getelementptr inbounds %struct.png_struct_def, ptr %101, i32 0, i32 142
  %103 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %102, i32 0, i32 1
  store ptr %100, ptr %103, align 8
  br label %104

104:                                              ; preds = %96, %92
  br label %105

105:                                              ; preds = %104, %24
  %106 = load ptr, ptr %4, align 8
  %107 = getelementptr inbounds %struct.png_struct_def, ptr %106, i32 0, i32 142
  %108 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %107, i32 0, i32 1
  %109 = load ptr, ptr %108, align 8
  %110 = icmp eq ptr %109, null
  br i1 %110, label %111, label %119

111:                                              ; preds = %105
  %112 = load i32, ptr %5, align 4
  %113 = icmp ugt i32 %112, 0
  br i1 %113, label %114, label %119

114:                                              ; preds = %111
  %115 = load ptr, ptr %4, align 8
  %116 = load i32, ptr %5, align 4
  %117 = call i32 @png_crc_finish(ptr noundef %115, i32 noundef %116)
  %118 = load ptr, ptr %4, align 8
  call void @png_chunk_benign_error(ptr noundef %118, ptr noundef @.str.27)
  store i32 0, ptr %3, align 4
  br label %132

119:                                              ; preds = %111, %105
  %120 = load i32, ptr %5, align 4
  %121 = icmp ugt i32 %120, 0
  br i1 %121, label %122, label %129

122:                                              ; preds = %119
  %123 = load ptr, ptr %4, align 8
  %124 = load ptr, ptr %4, align 8
  %125 = getelementptr inbounds %struct.png_struct_def, ptr %124, i32 0, i32 142
  %126 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %125, i32 0, i32 1
  %127 = load ptr, ptr %126, align 8
  %128 = load i32, ptr %5, align 4
  call void @png_crc_read(ptr noundef %123, ptr noundef %127, i32 noundef %128)
  br label %129

129:                                              ; preds = %122, %119
  %130 = load ptr, ptr %4, align 8
  %131 = call i32 @png_crc_finish(ptr noundef %130, i32 noundef 0)
  store i32 1, ptr %3, align 4
  br label %132

132:                                              ; preds = %129, %114
  %133 = load i32, ptr %3, align 4
  ret i32 %133
}

declare void @png_chunk_warning(ptr noundef, ptr noundef) #2

declare void @png_app_warning(ptr noundef, ptr noundef) #2

declare void @png_set_unknown_chunks(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #2

declare void @png_free(ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_handle_chunk(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.png_struct_def, ptr %12, i32 0, i32 45
  %14 = load i32, ptr %13, align 8
  store i32 %14, ptr %7, align 4
  %15 = load i32, ptr %7, align 4
  %16 = call i32 @png_chunk_index_from_name(i32 noundef %15)
  store i32 %16, ptr %8, align 4
  store i32 0, ptr %9, align 4
  store ptr null, ptr %10, align 8
  %17 = load i32, ptr %8, align 4
  %18 = icmp eq i32 %17, 28
  br i1 %18, label %26, label %19

19:                                               ; preds = %3
  %20 = load i32, ptr %8, align 4
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds [28 x %struct.anon], ptr @read_chunks, i64 0, i64 %21
  %23 = getelementptr inbounds %struct.anon, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 16
  %25 = icmp eq ptr %24, null
  br i1 %25, label %26, label %31

26:                                               ; preds = %19, %3
  %27 = load ptr, ptr %4, align 8
  %28 = load ptr, ptr %5, align 8
  %29 = load i32, ptr %6, align 4
  %30 = call i32 @png_handle_unknown(ptr noundef %27, ptr noundef %28, i32 noundef %29, i32 noundef 0)
  store i32 %30, ptr %9, align 4
  br label %145

31:                                               ; preds = %19
  %32 = load i32, ptr %8, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %42

34:                                               ; preds = %31
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds %struct.png_struct_def, ptr %35, i32 0, i32 15
  %37 = load i32, ptr %36, align 4
  %38 = and i32 %37, 1
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %42

40:                                               ; preds = %34
  %41 = load ptr, ptr %4, align 8
  call void @png_chunk_error(ptr noundef %41, ptr noundef @.str.11) #6
  unreachable

42:                                               ; preds = %34, %31
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds %struct.png_struct_def, ptr %43, i32 0, i32 15
  %45 = load i32, ptr %44, align 4
  %46 = load i32, ptr %8, align 4
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds [28 x %struct.anon], ptr @read_chunks, i64 0, i64 %47
  %49 = getelementptr inbounds %struct.anon, ptr %48, i32 0, i32 1
  %50 = load i32, ptr %49, align 8
  %51 = lshr i32 %50, 20
  %52 = and i32 %51, 15
  %53 = and i32 %45, %52
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %75, label %55

55:                                               ; preds = %42
  %56 = load ptr, ptr %4, align 8
  %57 = getelementptr inbounds %struct.png_struct_def, ptr %56, i32 0, i32 15
  %58 = load i32, ptr %57, align 4
  %59 = load i32, ptr %8, align 4
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds [28 x %struct.anon], ptr @read_chunks, i64 0, i64 %60
  %62 = getelementptr inbounds %struct.anon, ptr %61, i32 0, i32 1
  %63 = load i32, ptr %62, align 8
  %64 = lshr i32 %63, 24
  %65 = and i32 %64, 15
  %66 = and i32 %58, %65
  %67 = load i32, ptr %8, align 4
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds [28 x %struct.anon], ptr @read_chunks, i64 0, i64 %68
  %70 = getelementptr inbounds %struct.anon, ptr %69, i32 0, i32 1
  %71 = load i32, ptr %70, align 8
  %72 = lshr i32 %71, 24
  %73 = and i32 %72, 15
  %74 = icmp ne i32 %66, %73
  br i1 %74, label %75, label %76

75:                                               ; preds = %55, %42
  store ptr @.str.12, ptr %10, align 8
  br label %143

76:                                               ; preds = %55
  %77 = load i32, ptr %8, align 4
  %78 = zext i32 %77 to i64
  %79 = getelementptr inbounds [28 x %struct.anon], ptr @read_chunks, i64 0, i64 %78
  %80 = getelementptr inbounds %struct.anon, ptr %79, i32 0, i32 1
  %81 = load i32, ptr %80, align 8
  %82 = lshr i32 %81, 28
  %83 = and i32 %82, 1
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %85, label %95

85:                                               ; preds = %76
  %86 = load ptr, ptr %4, align 8
  %87 = getelementptr inbounds %struct.png_struct_def, ptr %86, i32 0, i32 37
  %88 = load i32, ptr %87, align 8
  %89 = load i32, ptr %8, align 4
  %90 = sub i32 31, %89
  %91 = lshr i32 -2147483648, %90
  %92 = and i32 %88, %91
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %94, label %95

94:                                               ; preds = %85
  store ptr @.str.13, ptr %10, align 8
  br label %142

95:                                               ; preds = %85, %76
  %96 = load i32, ptr %6, align 4
  %97 = load i32, ptr %8, align 4
  %98 = zext i32 %97 to i64
  %99 = getelementptr inbounds [28 x %struct.anon], ptr @read_chunks, i64 0, i64 %98
  %100 = getelementptr inbounds %struct.anon, ptr %99, i32 0, i32 1
  %101 = load i32, ptr %100, align 8
  %102 = lshr i32 %101, 12
  %103 = and i32 %102, 255
  %104 = icmp ult i32 %96, %103
  br i1 %104, label %105, label %106

105:                                              ; preds = %95
  store ptr @.str.14, ptr %10, align 8
  br label %141

106:                                              ; preds = %95
  %107 = load i32, ptr %8, align 4
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds [28 x %struct.anon], ptr @read_chunks, i64 0, i64 %108
  %110 = getelementptr inbounds %struct.anon, ptr %109, i32 0, i32 1
  %111 = load i32, ptr %110, align 8
  %112 = and i32 %111, 4095
  store i32 %112, ptr %11, align 4
  %113 = load i32, ptr %11, align 4
  switch i32 %113, label %123 [
    i32 2050, label %114
    i32 2049, label %129
  ]

114:                                              ; preds = %106
  %115 = load i32, ptr %6, align 4
  %116 = zext i32 %115 to i64
  %117 = load ptr, ptr %4, align 8
  %118 = getelementptr inbounds %struct.png_struct_def, ptr %117, i32 0, i32 141
  %119 = load i64, ptr %118, align 8
  %120 = icmp ule i64 %116, %119
  br i1 %120, label %121, label %122

121:                                              ; preds = %114
  br label %130

122:                                              ; preds = %114
  store ptr @.str.15, ptr %10, align 8
  br label %140

123:                                              ; preds = %106
  %124 = load i32, ptr %6, align 4
  %125 = load i32, ptr %11, align 4
  %126 = icmp ule i32 %124, %125
  br i1 %126, label %127, label %128

127:                                              ; preds = %123
  br label %130

128:                                              ; preds = %123
  store ptr @.str.16, ptr %10, align 8
  br label %140

129:                                              ; preds = %106
  br label %130

130:                                              ; preds = %129, %127, %121
  %131 = load i32, ptr %8, align 4
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds [28 x %struct.anon], ptr @read_chunks, i64 0, i64 %132
  %134 = getelementptr inbounds %struct.anon, ptr %133, i32 0, i32 0
  %135 = load ptr, ptr %134, align 16
  %136 = load ptr, ptr %4, align 8
  %137 = load ptr, ptr %5, align 8
  %138 = load i32, ptr %6, align 4
  %139 = call i32 %135(ptr noundef %136, ptr noundef %137, i32 noundef %138)
  store i32 %139, ptr %9, align 4
  br label %140

140:                                              ; preds = %130, %128, %122
  br label %141

141:                                              ; preds = %140, %105
  br label %142

142:                                              ; preds = %141, %94
  br label %143

143:                                              ; preds = %142, %75
  br label %144

144:                                              ; preds = %143
  br label %145

145:                                              ; preds = %144, %26
  %146 = load ptr, ptr %10, align 8
  %147 = icmp ne ptr %146, null
  br i1 %147, label %148, label %163

148:                                              ; preds = %145
  %149 = load i32, ptr %7, align 4
  %150 = lshr i32 %149, 29
  %151 = and i32 1, %150
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %156, label %153

153:                                              ; preds = %148
  %154 = load ptr, ptr %4, align 8
  %155 = load ptr, ptr %10, align 8
  call void @png_chunk_error(ptr noundef %154, ptr noundef %155) #6
  unreachable

156:                                              ; preds = %148
  %157 = load ptr, ptr %4, align 8
  %158 = load i32, ptr %6, align 4
  %159 = call i32 @png_crc_finish(ptr noundef %157, i32 noundef %158)
  %160 = load ptr, ptr %4, align 8
  %161 = load ptr, ptr %10, align 8
  call void @png_chunk_benign_error(ptr noundef %160, ptr noundef %161)
  br label %162

162:                                              ; preds = %156
  br label %179

163:                                              ; preds = %145
  %164 = load i32, ptr %9, align 4
  %165 = icmp uge i32 %164, 2
  br i1 %165, label %166, label %178

166:                                              ; preds = %163
  %167 = load i32, ptr %8, align 4
  %168 = icmp ne i32 %167, 28
  br i1 %168, label %169, label %177

169:                                              ; preds = %166
  %170 = load i32, ptr %8, align 4
  %171 = sub i32 31, %170
  %172 = lshr i32 -2147483648, %171
  %173 = load ptr, ptr %4, align 8
  %174 = getelementptr inbounds %struct.png_struct_def, ptr %173, i32 0, i32 37
  %175 = load i32, ptr %174, align 8
  %176 = or i32 %175, %172
  store i32 %176, ptr %174, align 8
  br label %177

177:                                              ; preds = %169, %166
  br label %178

178:                                              ; preds = %177, %163
  br label %179

179:                                              ; preds = %178, %162
  %180 = load i32, ptr %9, align 4
  ret i32 %180
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_chunk_index_from_name(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  switch i32 %4, label %33 [
    i32 1229472850, label %5
    i32 1347179589, label %6
    i32 1229209940, label %7
    i32 1229278788, label %8
    i32 1633899596, label %9
    i32 1649100612, label %10
    i32 1665684045, label %11
    i32 1665745744, label %12
    i32 1665944649, label %13
    i32 1700284774, label %14
    i32 1717785676, label %15
    i32 1717846356, label %16
    i32 1732332865, label %17
    i32 1749635924, label %18
    i32 1766015824, label %19
    i32 1767135348, label %20
    i32 1833190230, label %21
    i32 1866876531, label %22
    i32 1883455820, label %23
    i32 1883789683, label %24
    i32 1933723988, label %25
    i32 1933787468, label %26
    i32 1934642260, label %27
    i32 1934772034, label %28
    i32 1950701684, label %29
    i32 1950960965, label %30
    i32 1951551059, label %31
    i32 2052348020, label %32
  ]

5:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %34

6:                                                ; preds = %1
  store i32 1, ptr %2, align 4
  br label %34

7:                                                ; preds = %1
  store i32 2, ptr %2, align 4
  br label %34

8:                                                ; preds = %1
  store i32 3, ptr %2, align 4
  br label %34

9:                                                ; preds = %1
  store i32 4, ptr %2, align 4
  br label %34

10:                                               ; preds = %1
  store i32 5, ptr %2, align 4
  br label %34

11:                                               ; preds = %1
  store i32 6, ptr %2, align 4
  br label %34

12:                                               ; preds = %1
  store i32 7, ptr %2, align 4
  br label %34

13:                                               ; preds = %1
  store i32 8, ptr %2, align 4
  br label %34

14:                                               ; preds = %1
  store i32 9, ptr %2, align 4
  br label %34

15:                                               ; preds = %1
  store i32 10, ptr %2, align 4
  br label %34

16:                                               ; preds = %1
  store i32 11, ptr %2, align 4
  br label %34

17:                                               ; preds = %1
  store i32 12, ptr %2, align 4
  br label %34

18:                                               ; preds = %1
  store i32 13, ptr %2, align 4
  br label %34

19:                                               ; preds = %1
  store i32 14, ptr %2, align 4
  br label %34

20:                                               ; preds = %1
  store i32 15, ptr %2, align 4
  br label %34

21:                                               ; preds = %1
  store i32 16, ptr %2, align 4
  br label %34

22:                                               ; preds = %1
  store i32 17, ptr %2, align 4
  br label %34

23:                                               ; preds = %1
  store i32 18, ptr %2, align 4
  br label %34

24:                                               ; preds = %1
  store i32 19, ptr %2, align 4
  br label %34

25:                                               ; preds = %1
  store i32 20, ptr %2, align 4
  br label %34

26:                                               ; preds = %1
  store i32 21, ptr %2, align 4
  br label %34

27:                                               ; preds = %1
  store i32 22, ptr %2, align 4
  br label %34

28:                                               ; preds = %1
  store i32 23, ptr %2, align 4
  br label %34

29:                                               ; preds = %1
  store i32 24, ptr %2, align 4
  br label %34

30:                                               ; preds = %1
  store i32 25, ptr %2, align 4
  br label %34

31:                                               ; preds = %1
  store i32 26, ptr %2, align 4
  br label %34

32:                                               ; preds = %1
  store i32 27, ptr %2, align 4
  br label %34

33:                                               ; preds = %1
  store i32 28, ptr %2, align 4
  br label %34

34:                                               ; preds = %33, %32, %31, %30, %29, %28, %27, %26, %25, %24, %23, %22, %21, %20, %19, %18, %17, %16, %15, %14, %13, %12, %11, %10, %9, %8, %7, %6, %5
  %35 = load i32, ptr %2, align 4
  ret i32 %35
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_combine_row(ptr noalias noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i8, align 1
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca i64, align 8
  %23 = alloca i64, align 8
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca i64, align 8
  %27 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds %struct.png_struct_def, ptr %28, i32 0, i32 70
  %30 = load i8, ptr %29, align 1
  %31 = zext i8 %30 to i32
  store i32 %31, ptr %7, align 4
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds %struct.png_struct_def, ptr %32, i32 0, i32 47
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds i8, ptr %34, i64 1
  store ptr %35, ptr %8, align 8
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds %struct.png_struct_def, ptr %36, i32 0, i32 38
  %38 = load i32, ptr %37, align 4
  %39 = zext i32 %38 to i64
  store i64 %39, ptr %9, align 8
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.png_struct_def, ptr %40, i32 0, i32 60
  %42 = load i8, ptr %41, align 1
  %43 = zext i8 %42 to i32
  store i32 %43, ptr %10, align 4
  store ptr null, ptr %11, align 8
  store i8 0, ptr %12, align 1
  %44 = load i32, ptr %7, align 4
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %48

46:                                               ; preds = %3
  %47 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %47, ptr noundef @.str.17) #6
  unreachable

48:                                               ; preds = %3
  %49 = load ptr, ptr %4, align 8
  %50 = getelementptr inbounds %struct.png_struct_def, ptr %49, i32 0, i32 50
  %51 = load i64, ptr %50, align 8
  %52 = icmp ne i64 %51, 0
  br i1 %52, label %53, label %77

53:                                               ; preds = %48
  %54 = load ptr, ptr %4, align 8
  %55 = getelementptr inbounds %struct.png_struct_def, ptr %54, i32 0, i32 50
  %56 = load i64, ptr %55, align 8
  %57 = load i32, ptr %7, align 4
  %58 = icmp uge i32 %57, 8
  br i1 %58, label %59, label %65

59:                                               ; preds = %53
  %60 = load i64, ptr %9, align 8
  %61 = load i32, ptr %7, align 4
  %62 = zext i32 %61 to i64
  %63 = lshr i64 %62, 3
  %64 = mul i64 %60, %63
  br label %72

65:                                               ; preds = %53
  %66 = load i64, ptr %9, align 8
  %67 = load i32, ptr %7, align 4
  %68 = zext i32 %67 to i64
  %69 = mul i64 %66, %68
  %70 = add i64 %69, 7
  %71 = lshr i64 %70, 3
  br label %72

72:                                               ; preds = %65, %59
  %73 = phi i64 [ %64, %59 ], [ %71, %65 ]
  %74 = icmp ne i64 %56, %73
  br i1 %74, label %75, label %77

75:                                               ; preds = %72
  %76 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %76, ptr noundef @.str.18) #6
  unreachable

77:                                               ; preds = %72, %48
  %78 = load i64, ptr %9, align 8
  %79 = icmp eq i64 %78, 0
  br i1 %79, label %80, label %82

80:                                               ; preds = %77
  %81 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %81, ptr noundef @.str.19) #6
  unreachable

82:                                               ; preds = %77
  %83 = load i32, ptr %7, align 4
  %84 = zext i32 %83 to i64
  %85 = load i64, ptr %9, align 8
  %86 = mul i64 %84, %85
  %87 = and i64 %86, 7
  %88 = trunc i64 %87 to i32
  store i32 %88, ptr %13, align 4
  %89 = load i32, ptr %13, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %126

91:                                               ; preds = %82
  %92 = load ptr, ptr %5, align 8
  %93 = load i32, ptr %7, align 4
  %94 = icmp uge i32 %93, 8
  br i1 %94, label %95, label %101

95:                                               ; preds = %91
  %96 = load i64, ptr %9, align 8
  %97 = load i32, ptr %7, align 4
  %98 = zext i32 %97 to i64
  %99 = lshr i64 %98, 3
  %100 = mul i64 %96, %99
  br label %108

101:                                              ; preds = %91
  %102 = load i64, ptr %9, align 8
  %103 = load i32, ptr %7, align 4
  %104 = zext i32 %103 to i64
  %105 = mul i64 %102, %104
  %106 = add i64 %105, 7
  %107 = lshr i64 %106, 3
  br label %108

108:                                              ; preds = %101, %95
  %109 = phi i64 [ %100, %95 ], [ %107, %101 ]
  %110 = getelementptr inbounds i8, ptr %92, i64 %109
  %111 = getelementptr inbounds i8, ptr %110, i64 -1
  store ptr %111, ptr %11, align 8
  %112 = load ptr, ptr %11, align 8
  %113 = load i8, ptr %112, align 1
  store i8 %113, ptr %12, align 1
  %114 = load ptr, ptr %4, align 8
  %115 = getelementptr inbounds %struct.png_struct_def, ptr %114, i32 0, i32 17
  %116 = load i32, ptr %115, align 4
  %117 = and i32 %116, 65536
  %118 = icmp ne i32 %117, 0
  br i1 %118, label %119, label %122

119:                                              ; preds = %108
  %120 = load i32, ptr %13, align 4
  %121 = shl i32 255, %120
  store i32 %121, ptr %13, align 4
  br label %125

122:                                              ; preds = %108
  %123 = load i32, ptr %13, align 4
  %124 = ashr i32 255, %123
  store i32 %124, ptr %13, align 4
  br label %125

125:                                              ; preds = %122, %119
  br label %126

126:                                              ; preds = %125, %82
  %127 = load ptr, ptr %4, align 8
  %128 = getelementptr inbounds %struct.png_struct_def, ptr %127, i32 0, i32 59
  %129 = load i8, ptr %128, align 4
  %130 = zext i8 %129 to i32
  %131 = icmp ne i32 %130, 0
  br i1 %131, label %132, label %661

132:                                              ; preds = %126
  %133 = load ptr, ptr %4, align 8
  %134 = getelementptr inbounds %struct.png_struct_def, ptr %133, i32 0, i32 17
  %135 = load i32, ptr %134, align 4
  %136 = and i32 %135, 2
  %137 = icmp ne i32 %136, 0
  br i1 %137, label %138, label %661

138:                                              ; preds = %132
  %139 = load i32, ptr %10, align 4
  %140 = icmp ult i32 %139, 6
  br i1 %140, label %141, label %661

141:                                              ; preds = %138
  %142 = load i32, ptr %6, align 4
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %151, label %144

144:                                              ; preds = %141
  %145 = load i32, ptr %6, align 4
  %146 = icmp eq i32 %145, 1
  br i1 %146, label %147, label %661

147:                                              ; preds = %144
  %148 = load i32, ptr %10, align 4
  %149 = and i32 %148, 1
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %151, label %661

151:                                              ; preds = %147, %141
  %152 = load i64, ptr %9, align 8
  %153 = load i32, ptr %10, align 4
  %154 = and i32 1, %153
  %155 = load i32, ptr %10, align 4
  %156 = add i32 %155, 1
  %157 = lshr i32 %156, 1
  %158 = sub i32 3, %157
  %159 = shl i32 %154, %158
  %160 = and i32 %159, 7
  %161 = zext i32 %160 to i64
  %162 = icmp ule i64 %152, %161
  br i1 %162, label %163, label %164

163:                                              ; preds = %151
  br label %698

164:                                              ; preds = %151
  %165 = load i32, ptr %7, align 4
  %166 = icmp ult i32 %165, 8
  br i1 %166, label %167, label %306

167:                                              ; preds = %164
  %168 = load i32, ptr %7, align 4
  %169 = udiv i32 8, %168
  store i32 %169, ptr %14, align 4
  %170 = load ptr, ptr %4, align 8
  %171 = getelementptr inbounds %struct.png_struct_def, ptr %170, i32 0, i32 17
  %172 = load i32, ptr %171, align 4
  %173 = and i32 %172, 65536
  %174 = icmp ne i32 %173, 0
  br i1 %174, label %175, label %215

175:                                              ; preds = %167
  %176 = load i32, ptr %6, align 4
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %178, label %196

178:                                              ; preds = %175
  %179 = load i32, ptr %7, align 4
  %180 = icmp eq i32 %179, 1
  br i1 %180, label %181, label %182

181:                                              ; preds = %178
  br label %187

182:                                              ; preds = %178
  %183 = load i32, ptr %7, align 4
  %184 = icmp eq i32 %183, 2
  %185 = zext i1 %184 to i64
  %186 = select i1 %184, i32 1, i32 2
  br label %187

187:                                              ; preds = %182, %181
  %188 = phi i32 [ 0, %181 ], [ %186, %182 ]
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [3 x [3 x i32]], ptr @png_combine_row.display_mask, i64 0, i64 %189
  %191 = load i32, ptr %10, align 4
  %192 = lshr i32 %191, 1
  %193 = zext i32 %192 to i64
  %194 = getelementptr inbounds [3 x i32], ptr %190, i64 0, i64 %193
  %195 = load i32, ptr %194, align 4
  br label %213

196:                                              ; preds = %175
  %197 = load i32, ptr %7, align 4
  %198 = icmp eq i32 %197, 1
  br i1 %198, label %199, label %200

199:                                              ; preds = %196
  br label %205

200:                                              ; preds = %196
  %201 = load i32, ptr %7, align 4
  %202 = icmp eq i32 %201, 2
  %203 = zext i1 %202 to i64
  %204 = select i1 %202, i32 1, i32 2
  br label %205

205:                                              ; preds = %200, %199
  %206 = phi i32 [ 0, %199 ], [ %204, %200 ]
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [3 x [6 x i32]], ptr @png_combine_row.row_mask, i64 0, i64 %207
  %209 = load i32, ptr %10, align 4
  %210 = zext i32 %209 to i64
  %211 = getelementptr inbounds [6 x i32], ptr %208, i64 0, i64 %210
  %212 = load i32, ptr %211, align 4
  br label %213

213:                                              ; preds = %205, %187
  %214 = phi i32 [ %195, %187 ], [ %212, %205 ]
  store i32 %214, ptr %15, align 4
  br label %255

215:                                              ; preds = %167
  %216 = load i32, ptr %6, align 4
  %217 = icmp ne i32 %216, 0
  br i1 %217, label %218, label %236

218:                                              ; preds = %215
  %219 = load i32, ptr %7, align 4
  %220 = icmp eq i32 %219, 1
  br i1 %220, label %221, label %222

221:                                              ; preds = %218
  br label %227

222:                                              ; preds = %218
  %223 = load i32, ptr %7, align 4
  %224 = icmp eq i32 %223, 2
  %225 = zext i1 %224 to i64
  %226 = select i1 %224, i32 1, i32 2
  br label %227

227:                                              ; preds = %222, %221
  %228 = phi i32 [ 0, %221 ], [ %226, %222 ]
  %229 = sext i32 %228 to i64
  %230 = getelementptr inbounds [3 x [3 x i32]], ptr getelementptr inbounds ([2 x [3 x [3 x i32]]], ptr @png_combine_row.display_mask, i64 0, i64 1), i64 0, i64 %229
  %231 = load i32, ptr %10, align 4
  %232 = lshr i32 %231, 1
  %233 = zext i32 %232 to i64
  %234 = getelementptr inbounds [3 x i32], ptr %230, i64 0, i64 %233
  %235 = load i32, ptr %234, align 4
  br label %253

236:                                              ; preds = %215
  %237 = load i32, ptr %7, align 4
  %238 = icmp eq i32 %237, 1
  br i1 %238, label %239, label %240

239:                                              ; preds = %236
  br label %245

240:                                              ; preds = %236
  %241 = load i32, ptr %7, align 4
  %242 = icmp eq i32 %241, 2
  %243 = zext i1 %242 to i64
  %244 = select i1 %242, i32 1, i32 2
  br label %245

245:                                              ; preds = %240, %239
  %246 = phi i32 [ 0, %239 ], [ %244, %240 ]
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds [3 x [6 x i32]], ptr getelementptr inbounds ([2 x [3 x [6 x i32]]], ptr @png_combine_row.row_mask, i64 0, i64 1), i64 0, i64 %247
  %249 = load i32, ptr %10, align 4
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds [6 x i32], ptr %248, i64 0, i64 %250
  %252 = load i32, ptr %251, align 4
  br label %253

253:                                              ; preds = %245, %227
  %254 = phi i32 [ %235, %227 ], [ %252, %245 ]
  store i32 %254, ptr %15, align 4
  br label %255

255:                                              ; preds = %253, %213
  br label %256

256:                                              ; preds = %296, %255
  %257 = load i32, ptr %15, align 4
  store i32 %257, ptr %16, align 4
  %258 = load i32, ptr %16, align 4
  %259 = lshr i32 %258, 8
  %260 = load i32, ptr %16, align 4
  %261 = shl i32 %260, 24
  %262 = or i32 %259, %261
  store i32 %262, ptr %15, align 4
  %263 = load i32, ptr %16, align 4
  %264 = and i32 %263, 255
  store i32 %264, ptr %16, align 4
  %265 = load i32, ptr %16, align 4
  %266 = icmp ne i32 %265, 0
  br i1 %266, label %267, label %290

267:                                              ; preds = %256
  %268 = load i32, ptr %16, align 4
  %269 = icmp ne i32 %268, 255
  br i1 %269, label %270, label %285

270:                                              ; preds = %267
  %271 = load ptr, ptr %5, align 8
  %272 = load i8, ptr %271, align 1
  %273 = zext i8 %272 to i32
  %274 = load i32, ptr %16, align 4
  %275 = xor i32 %274, -1
  %276 = and i32 %273, %275
  %277 = load ptr, ptr %8, align 8
  %278 = load i8, ptr %277, align 1
  %279 = zext i8 %278 to i32
  %280 = load i32, ptr %16, align 4
  %281 = and i32 %279, %280
  %282 = or i32 %276, %281
  %283 = trunc i32 %282 to i8
  %284 = load ptr, ptr %5, align 8
  store i8 %283, ptr %284, align 1
  br label %289

285:                                              ; preds = %267
  %286 = load ptr, ptr %8, align 8
  %287 = load i8, ptr %286, align 1
  %288 = load ptr, ptr %5, align 8
  store i8 %287, ptr %288, align 1
  br label %289

289:                                              ; preds = %285, %270
  br label %290

290:                                              ; preds = %289, %256
  %291 = load i64, ptr %9, align 8
  %292 = load i32, ptr %14, align 4
  %293 = zext i32 %292 to i64
  %294 = icmp ule i64 %291, %293
  br i1 %294, label %295, label %296

295:                                              ; preds = %290
  br label %305

296:                                              ; preds = %290
  %297 = load i32, ptr %14, align 4
  %298 = zext i32 %297 to i64
  %299 = load i64, ptr %9, align 8
  %300 = sub i64 %299, %298
  store i64 %300, ptr %9, align 8
  %301 = load ptr, ptr %5, align 8
  %302 = getelementptr inbounds i8, ptr %301, i32 1
  store ptr %302, ptr %5, align 8
  %303 = load ptr, ptr %8, align 8
  %304 = getelementptr inbounds i8, ptr %303, i32 1
  store ptr %304, ptr %8, align 8
  br label %256

305:                                              ; preds = %295
  br label %660

306:                                              ; preds = %164
  %307 = load i32, ptr %7, align 4
  %308 = and i32 %307, 7
  %309 = icmp ne i32 %308, 0
  br i1 %309, label %310, label %312

310:                                              ; preds = %306
  %311 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %311, ptr noundef @.str.20) #6
  unreachable

312:                                              ; preds = %306
  %313 = load i32, ptr %7, align 4
  %314 = lshr i32 %313, 3
  store i32 %314, ptr %7, align 4
  %315 = load i32, ptr %7, align 4
  %316 = zext i32 %315 to i64
  %317 = load i64, ptr %9, align 8
  %318 = mul i64 %317, %316
  store i64 %318, ptr %9, align 8
  %319 = load i32, ptr %10, align 4
  %320 = and i32 1, %319
  %321 = load i32, ptr %10, align 4
  %322 = add i32 %321, 1
  %323 = lshr i32 %322, 1
  %324 = sub i32 3, %323
  %325 = shl i32 %320, %324
  %326 = and i32 %325, 7
  %327 = load i32, ptr %7, align 4
  %328 = mul i32 %326, %327
  store i32 %328, ptr %19, align 4
  %329 = load i32, ptr %19, align 4
  %330 = zext i32 %329 to i64
  %331 = load i64, ptr %9, align 8
  %332 = sub i64 %331, %330
  store i64 %332, ptr %9, align 8
  %333 = load i32, ptr %19, align 4
  %334 = load ptr, ptr %5, align 8
  %335 = zext i32 %333 to i64
  %336 = getelementptr inbounds i8, ptr %334, i64 %335
  store ptr %336, ptr %5, align 8
  %337 = load i32, ptr %19, align 4
  %338 = load ptr, ptr %8, align 8
  %339 = zext i32 %337 to i64
  %340 = getelementptr inbounds i8, ptr %338, i64 %339
  store ptr %340, ptr %8, align 8
  %341 = load i32, ptr %6, align 4
  %342 = icmp ne i32 %341, 0
  br i1 %342, label %343, label %358

343:                                              ; preds = %312
  %344 = load i32, ptr %10, align 4
  %345 = sub i32 6, %344
  %346 = lshr i32 %345, 1
  %347 = shl i32 1, %346
  %348 = load i32, ptr %7, align 4
  %349 = mul i32 %347, %348
  store i32 %349, ptr %17, align 4
  %350 = load i32, ptr %17, align 4
  %351 = zext i32 %350 to i64
  %352 = load i64, ptr %9, align 8
  %353 = icmp ugt i64 %351, %352
  br i1 %353, label %354, label %357

354:                                              ; preds = %343
  %355 = load i64, ptr %9, align 8
  %356 = trunc i64 %355 to i32
  store i32 %356, ptr %17, align 4
  br label %357

357:                                              ; preds = %354, %343
  br label %360

358:                                              ; preds = %312
  %359 = load i32, ptr %7, align 4
  store i32 %359, ptr %17, align 4
  br label %360

360:                                              ; preds = %358, %357
  %361 = load i32, ptr %10, align 4
  %362 = sub i32 7, %361
  %363 = lshr i32 %362, 1
  %364 = shl i32 1, %363
  %365 = load i32, ptr %7, align 4
  %366 = mul i32 %364, %365
  store i32 %366, ptr %18, align 4
  %367 = load i32, ptr %17, align 4
  switch i32 %367, label %463 [
    i32 1, label %368
    i32 2, label %391
    i32 3, label %428
  ]

368:                                              ; preds = %360
  br label %369

369:                                              ; preds = %378, %368
  %370 = load ptr, ptr %8, align 8
  %371 = load i8, ptr %370, align 1
  %372 = load ptr, ptr %5, align 8
  store i8 %371, ptr %372, align 1
  %373 = load i64, ptr %9, align 8
  %374 = load i32, ptr %18, align 4
  %375 = zext i32 %374 to i64
  %376 = icmp ule i64 %373, %375
  br i1 %376, label %377, label %378

377:                                              ; preds = %369
  br label %698

378:                                              ; preds = %369
  %379 = load i32, ptr %18, align 4
  %380 = load ptr, ptr %5, align 8
  %381 = zext i32 %379 to i64
  %382 = getelementptr inbounds i8, ptr %380, i64 %381
  store ptr %382, ptr %5, align 8
  %383 = load i32, ptr %18, align 4
  %384 = load ptr, ptr %8, align 8
  %385 = zext i32 %383 to i64
  %386 = getelementptr inbounds i8, ptr %384, i64 %385
  store ptr %386, ptr %8, align 8
  %387 = load i32, ptr %18, align 4
  %388 = zext i32 %387 to i64
  %389 = load i64, ptr %9, align 8
  %390 = sub i64 %389, %388
  store i64 %390, ptr %9, align 8
  br label %369

391:                                              ; preds = %360
  br label %392

392:                                              ; preds = %421, %391
  %393 = load ptr, ptr %8, align 8
  %394 = getelementptr inbounds i8, ptr %393, i64 0
  %395 = load i8, ptr %394, align 1
  %396 = load ptr, ptr %5, align 8
  %397 = getelementptr inbounds i8, ptr %396, i64 0
  store i8 %395, ptr %397, align 1
  %398 = load ptr, ptr %8, align 8
  %399 = getelementptr inbounds i8, ptr %398, i64 1
  %400 = load i8, ptr %399, align 1
  %401 = load ptr, ptr %5, align 8
  %402 = getelementptr inbounds i8, ptr %401, i64 1
  store i8 %400, ptr %402, align 1
  %403 = load i64, ptr %9, align 8
  %404 = load i32, ptr %18, align 4
  %405 = zext i32 %404 to i64
  %406 = icmp ule i64 %403, %405
  br i1 %406, label %407, label %408

407:                                              ; preds = %392
  br label %698

408:                                              ; preds = %392
  %409 = load i32, ptr %18, align 4
  %410 = load ptr, ptr %8, align 8
  %411 = zext i32 %409 to i64
  %412 = getelementptr inbounds i8, ptr %410, i64 %411
  store ptr %412, ptr %8, align 8
  %413 = load i32, ptr %18, align 4
  %414 = load ptr, ptr %5, align 8
  %415 = zext i32 %413 to i64
  %416 = getelementptr inbounds i8, ptr %414, i64 %415
  store ptr %416, ptr %5, align 8
  %417 = load i32, ptr %18, align 4
  %418 = zext i32 %417 to i64
  %419 = load i64, ptr %9, align 8
  %420 = sub i64 %419, %418
  store i64 %420, ptr %9, align 8
  br label %421

421:                                              ; preds = %408
  %422 = load i64, ptr %9, align 8
  %423 = icmp ugt i64 %422, 1
  br i1 %423, label %392, label %424, !llvm.loop !7

424:                                              ; preds = %421
  %425 = load ptr, ptr %8, align 8
  %426 = load i8, ptr %425, align 1
  %427 = load ptr, ptr %5, align 8
  store i8 %426, ptr %427, align 1
  br label %698

428:                                              ; preds = %360
  br label %429

429:                                              ; preds = %450, %428
  %430 = load ptr, ptr %8, align 8
  %431 = getelementptr inbounds i8, ptr %430, i64 0
  %432 = load i8, ptr %431, align 1
  %433 = load ptr, ptr %5, align 8
  %434 = getelementptr inbounds i8, ptr %433, i64 0
  store i8 %432, ptr %434, align 1
  %435 = load ptr, ptr %8, align 8
  %436 = getelementptr inbounds i8, ptr %435, i64 1
  %437 = load i8, ptr %436, align 1
  %438 = load ptr, ptr %5, align 8
  %439 = getelementptr inbounds i8, ptr %438, i64 1
  store i8 %437, ptr %439, align 1
  %440 = load ptr, ptr %8, align 8
  %441 = getelementptr inbounds i8, ptr %440, i64 2
  %442 = load i8, ptr %441, align 1
  %443 = load ptr, ptr %5, align 8
  %444 = getelementptr inbounds i8, ptr %443, i64 2
  store i8 %442, ptr %444, align 1
  %445 = load i64, ptr %9, align 8
  %446 = load i32, ptr %18, align 4
  %447 = zext i32 %446 to i64
  %448 = icmp ule i64 %445, %447
  br i1 %448, label %449, label %450

449:                                              ; preds = %429
  br label %698

450:                                              ; preds = %429
  %451 = load i32, ptr %18, align 4
  %452 = load ptr, ptr %8, align 8
  %453 = zext i32 %451 to i64
  %454 = getelementptr inbounds i8, ptr %452, i64 %453
  store ptr %454, ptr %8, align 8
  %455 = load i32, ptr %18, align 4
  %456 = load ptr, ptr %5, align 8
  %457 = zext i32 %455 to i64
  %458 = getelementptr inbounds i8, ptr %456, i64 %457
  store ptr %458, ptr %5, align 8
  %459 = load i32, ptr %18, align 4
  %460 = zext i32 %459 to i64
  %461 = load i64, ptr %9, align 8
  %462 = sub i64 %461, %460
  store i64 %462, ptr %9, align 8
  br label %429

463:                                              ; preds = %360
  %464 = load i32, ptr %17, align 4
  %465 = icmp ult i32 %464, 16
  br i1 %465, label %466, label %628

466:                                              ; preds = %463
  %467 = load ptr, ptr %5, align 8
  %468 = ptrtoint ptr %467 to i64
  %469 = trunc i64 %468 to i16
  %470 = zext i16 %469 to i32
  %471 = and i32 %470, 1
  %472 = icmp eq i32 %471, 0
  br i1 %472, label %473, label %628

473:                                              ; preds = %466
  %474 = load ptr, ptr %8, align 8
  %475 = ptrtoint ptr %474 to i64
  %476 = trunc i64 %475 to i16
  %477 = zext i16 %476 to i32
  %478 = and i32 %477, 1
  %479 = icmp eq i32 %478, 0
  br i1 %479, label %480, label %628

480:                                              ; preds = %473
  %481 = load i32, ptr %17, align 4
  %482 = zext i32 %481 to i64
  %483 = urem i64 %482, 2
  %484 = icmp eq i64 %483, 0
  br i1 %484, label %485, label %628

485:                                              ; preds = %480
  %486 = load i32, ptr %18, align 4
  %487 = zext i32 %486 to i64
  %488 = urem i64 %487, 2
  %489 = icmp eq i64 %488, 0
  br i1 %489, label %490, label %628

490:                                              ; preds = %485
  %491 = load ptr, ptr %5, align 8
  %492 = ptrtoint ptr %491 to i64
  %493 = trunc i64 %492 to i32
  %494 = and i32 %493, 3
  %495 = icmp eq i32 %494, 0
  br i1 %495, label %496, label %570

496:                                              ; preds = %490
  %497 = load ptr, ptr %8, align 8
  %498 = ptrtoint ptr %497 to i64
  %499 = trunc i64 %498 to i32
  %500 = and i32 %499, 3
  %501 = icmp eq i32 %500, 0
  br i1 %501, label %502, label %570

502:                                              ; preds = %496
  %503 = load i32, ptr %17, align 4
  %504 = zext i32 %503 to i64
  %505 = urem i64 %504, 4
  %506 = icmp eq i64 %505, 0
  br i1 %506, label %507, label %570

507:                                              ; preds = %502
  %508 = load i32, ptr %18, align 4
  %509 = zext i32 %508 to i64
  %510 = urem i64 %509, 4
  %511 = icmp eq i64 %510, 0
  br i1 %511, label %512, label %570

512:                                              ; preds = %507
  %513 = load ptr, ptr %5, align 8
  store ptr %513, ptr %20, align 8
  %514 = load ptr, ptr %8, align 8
  store ptr %514, ptr %21, align 8
  %515 = load i32, ptr %18, align 4
  %516 = load i32, ptr %17, align 4
  %517 = sub i32 %515, %516
  %518 = zext i32 %517 to i64
  %519 = udiv i64 %518, 4
  store i64 %519, ptr %22, align 8
  br label %520

520:                                              ; preds = %551, %512
  %521 = load i32, ptr %17, align 4
  %522 = zext i32 %521 to i64
  store i64 %522, ptr %23, align 8
  br label %523

523:                                              ; preds = %531, %520
  %524 = load ptr, ptr %21, align 8
  %525 = getelementptr inbounds i32, ptr %524, i32 1
  store ptr %525, ptr %21, align 8
  %526 = load i32, ptr %524, align 4
  %527 = load ptr, ptr %20, align 8
  %528 = getelementptr inbounds i32, ptr %527, i32 1
  store ptr %528, ptr %20, align 8
  store i32 %526, ptr %527, align 4
  %529 = load i64, ptr %23, align 8
  %530 = sub i64 %529, 4
  store i64 %530, ptr %23, align 8
  br label %531

531:                                              ; preds = %523
  %532 = load i64, ptr %23, align 8
  %533 = icmp ugt i64 %532, 0
  br i1 %533, label %523, label %534, !llvm.loop !8

534:                                              ; preds = %531
  %535 = load i64, ptr %9, align 8
  %536 = load i32, ptr %18, align 4
  %537 = zext i32 %536 to i64
  %538 = icmp ule i64 %535, %537
  br i1 %538, label %539, label %540

539:                                              ; preds = %534
  br label %698

540:                                              ; preds = %534
  %541 = load i64, ptr %22, align 8
  %542 = load ptr, ptr %20, align 8
  %543 = getelementptr inbounds i32, ptr %542, i64 %541
  store ptr %543, ptr %20, align 8
  %544 = load i64, ptr %22, align 8
  %545 = load ptr, ptr %21, align 8
  %546 = getelementptr inbounds i32, ptr %545, i64 %544
  store ptr %546, ptr %21, align 8
  %547 = load i32, ptr %18, align 4
  %548 = zext i32 %547 to i64
  %549 = load i64, ptr %9, align 8
  %550 = sub i64 %549, %548
  store i64 %550, ptr %9, align 8
  br label %551

551:                                              ; preds = %540
  %552 = load i32, ptr %17, align 4
  %553 = zext i32 %552 to i64
  %554 = load i64, ptr %9, align 8
  %555 = icmp ule i64 %553, %554
  br i1 %555, label %520, label %556, !llvm.loop !9

556:                                              ; preds = %551
  %557 = load ptr, ptr %20, align 8
  store ptr %557, ptr %5, align 8
  %558 = load ptr, ptr %21, align 8
  store ptr %558, ptr %8, align 8
  br label %559

559:                                              ; preds = %565, %556
  %560 = load ptr, ptr %8, align 8
  %561 = getelementptr inbounds i8, ptr %560, i32 1
  store ptr %561, ptr %8, align 8
  %562 = load i8, ptr %560, align 1
  %563 = load ptr, ptr %5, align 8
  %564 = getelementptr inbounds i8, ptr %563, i32 1
  store ptr %564, ptr %5, align 8
  store i8 %562, ptr %563, align 1
  br label %565

565:                                              ; preds = %559
  %566 = load i64, ptr %9, align 8
  %567 = add i64 %566, -1
  store i64 %567, ptr %9, align 8
  %568 = icmp ugt i64 %567, 0
  br i1 %568, label %559, label %569, !llvm.loop !10

569:                                              ; preds = %565
  br label %698

570:                                              ; preds = %507, %502, %496, %490
  %571 = load ptr, ptr %5, align 8
  store ptr %571, ptr %24, align 8
  %572 = load ptr, ptr %8, align 8
  store ptr %572, ptr %25, align 8
  %573 = load i32, ptr %18, align 4
  %574 = load i32, ptr %17, align 4
  %575 = sub i32 %573, %574
  %576 = zext i32 %575 to i64
  %577 = udiv i64 %576, 2
  store i64 %577, ptr %26, align 8
  br label %578

578:                                              ; preds = %609, %570
  %579 = load i32, ptr %17, align 4
  %580 = zext i32 %579 to i64
  store i64 %580, ptr %27, align 8
  br label %581

581:                                              ; preds = %589, %578
  %582 = load ptr, ptr %25, align 8
  %583 = getelementptr inbounds i16, ptr %582, i32 1
  store ptr %583, ptr %25, align 8
  %584 = load i16, ptr %582, align 2
  %585 = load ptr, ptr %24, align 8
  %586 = getelementptr inbounds i16, ptr %585, i32 1
  store ptr %586, ptr %24, align 8
  store i16 %584, ptr %585, align 2
  %587 = load i64, ptr %27, align 8
  %588 = sub i64 %587, 2
  store i64 %588, ptr %27, align 8
  br label %589

589:                                              ; preds = %581
  %590 = load i64, ptr %27, align 8
  %591 = icmp ugt i64 %590, 0
  br i1 %591, label %581, label %592, !llvm.loop !11

592:                                              ; preds = %589
  %593 = load i64, ptr %9, align 8
  %594 = load i32, ptr %18, align 4
  %595 = zext i32 %594 to i64
  %596 = icmp ule i64 %593, %595
  br i1 %596, label %597, label %598

597:                                              ; preds = %592
  br label %698

598:                                              ; preds = %592
  %599 = load i64, ptr %26, align 8
  %600 = load ptr, ptr %24, align 8
  %601 = getelementptr inbounds i16, ptr %600, i64 %599
  store ptr %601, ptr %24, align 8
  %602 = load i64, ptr %26, align 8
  %603 = load ptr, ptr %25, align 8
  %604 = getelementptr inbounds i16, ptr %603, i64 %602
  store ptr %604, ptr %25, align 8
  %605 = load i32, ptr %18, align 4
  %606 = zext i32 %605 to i64
  %607 = load i64, ptr %9, align 8
  %608 = sub i64 %607, %606
  store i64 %608, ptr %9, align 8
  br label %609

609:                                              ; preds = %598
  %610 = load i32, ptr %17, align 4
  %611 = zext i32 %610 to i64
  %612 = load i64, ptr %9, align 8
  %613 = icmp ule i64 %611, %612
  br i1 %613, label %578, label %614, !llvm.loop !12

614:                                              ; preds = %609
  %615 = load ptr, ptr %24, align 8
  store ptr %615, ptr %5, align 8
  %616 = load ptr, ptr %25, align 8
  store ptr %616, ptr %8, align 8
  br label %617

617:                                              ; preds = %623, %614
  %618 = load ptr, ptr %8, align 8
  %619 = getelementptr inbounds i8, ptr %618, i32 1
  store ptr %619, ptr %8, align 8
  %620 = load i8, ptr %618, align 1
  %621 = load ptr, ptr %5, align 8
  %622 = getelementptr inbounds i8, ptr %621, i32 1
  store ptr %622, ptr %5, align 8
  store i8 %620, ptr %621, align 1
  br label %623

623:                                              ; preds = %617
  %624 = load i64, ptr %9, align 8
  %625 = add i64 %624, -1
  store i64 %625, ptr %9, align 8
  %626 = icmp ugt i64 %625, 0
  br i1 %626, label %617, label %627, !llvm.loop !13

627:                                              ; preds = %623
  br label %698

628:                                              ; preds = %485, %480, %473, %466, %463
  br label %629

629:                                              ; preds = %659, %628
  %630 = load ptr, ptr %5, align 8
  %631 = load ptr, ptr %8, align 8
  %632 = load i32, ptr %17, align 4
  %633 = zext i32 %632 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %630, ptr align 1 %631, i64 %633, i1 false)
  %634 = load i64, ptr %9, align 8
  %635 = load i32, ptr %18, align 4
  %636 = zext i32 %635 to i64
  %637 = icmp ule i64 %634, %636
  br i1 %637, label %638, label %639

638:                                              ; preds = %629
  br label %698

639:                                              ; preds = %629
  %640 = load i32, ptr %18, align 4
  %641 = load ptr, ptr %8, align 8
  %642 = zext i32 %640 to i64
  %643 = getelementptr inbounds i8, ptr %641, i64 %642
  store ptr %643, ptr %8, align 8
  %644 = load i32, ptr %18, align 4
  %645 = load ptr, ptr %5, align 8
  %646 = zext i32 %644 to i64
  %647 = getelementptr inbounds i8, ptr %645, i64 %646
  store ptr %647, ptr %5, align 8
  %648 = load i32, ptr %18, align 4
  %649 = zext i32 %648 to i64
  %650 = load i64, ptr %9, align 8
  %651 = sub i64 %650, %649
  store i64 %651, ptr %9, align 8
  %652 = load i32, ptr %17, align 4
  %653 = zext i32 %652 to i64
  %654 = load i64, ptr %9, align 8
  %655 = icmp ugt i64 %653, %654
  br i1 %655, label %656, label %659

656:                                              ; preds = %639
  %657 = load i64, ptr %9, align 8
  %658 = trunc i64 %657 to i32
  store i32 %658, ptr %17, align 4
  br label %659

659:                                              ; preds = %656, %639
  br label %629

660:                                              ; preds = %305
  br label %681

661:                                              ; preds = %147, %144, %138, %132, %126
  %662 = load ptr, ptr %5, align 8
  %663 = load ptr, ptr %8, align 8
  %664 = load i32, ptr %7, align 4
  %665 = icmp uge i32 %664, 8
  br i1 %665, label %666, label %672

666:                                              ; preds = %661
  %667 = load i64, ptr %9, align 8
  %668 = load i32, ptr %7, align 4
  %669 = zext i32 %668 to i64
  %670 = lshr i64 %669, 3
  %671 = mul i64 %667, %670
  br label %679

672:                                              ; preds = %661
  %673 = load i64, ptr %9, align 8
  %674 = load i32, ptr %7, align 4
  %675 = zext i32 %674 to i64
  %676 = mul i64 %673, %675
  %677 = add i64 %676, 7
  %678 = lshr i64 %677, 3
  br label %679

679:                                              ; preds = %672, %666
  %680 = phi i64 [ %671, %666 ], [ %678, %672 ]
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %662, ptr align 1 %663, i64 %680, i1 false)
  br label %681

681:                                              ; preds = %679, %660
  %682 = load ptr, ptr %11, align 8
  %683 = icmp ne ptr %682, null
  br i1 %683, label %684, label %698

684:                                              ; preds = %681
  %685 = load i8, ptr %12, align 1
  %686 = zext i8 %685 to i32
  %687 = load i32, ptr %13, align 4
  %688 = and i32 %686, %687
  %689 = load ptr, ptr %11, align 8
  %690 = load i8, ptr %689, align 1
  %691 = zext i8 %690 to i32
  %692 = load i32, ptr %13, align 4
  %693 = xor i32 %692, -1
  %694 = and i32 %691, %693
  %695 = or i32 %688, %694
  %696 = trunc i32 %695 to i8
  %697 = load ptr, ptr %11, align 8
  store i8 %696, ptr %697, align 1
  br label %698

698:                                              ; preds = %163, %377, %407, %424, %449, %539, %569, %597, %627, %638, %684, %681
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_do_read_interlace(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8, align 1
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i8, align 1
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca ptr, align 8
  %35 = alloca ptr, align 8
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i8, align 1
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i64, align 8
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  %49 = alloca i32, align 4
  %50 = alloca i32, align 4
  %51 = alloca [8 x i8], align 1
  %52 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %53 = load ptr, ptr %6, align 8
  %54 = icmp ne ptr %53, null
  br i1 %54, label %55, label %510

55:                                               ; preds = %4
  %56 = load ptr, ptr %5, align 8
  %57 = icmp ne ptr %56, null
  br i1 %57, label %58, label %510

58:                                               ; preds = %55
  %59 = load ptr, ptr %5, align 8
  %60 = getelementptr inbounds %struct.png_row_info_struct, ptr %59, i32 0, i32 0
  %61 = load i32, ptr %60, align 8
  %62 = load i32, ptr %7, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [7 x i8], ptr @png_pass_inc, i64 0, i64 %63
  %65 = load i8, ptr %64, align 1
  %66 = zext i8 %65 to i32
  %67 = mul i32 %61, %66
  store i32 %67, ptr %9, align 4
  %68 = load ptr, ptr %5, align 8
  %69 = getelementptr inbounds %struct.png_row_info_struct, ptr %68, i32 0, i32 5
  %70 = load i8, ptr %69, align 1
  %71 = zext i8 %70 to i32
  switch i32 %71, label %416 [
    i32 1, label %72
    i32 2, label %184
    i32 4, label %300
  ]

72:                                               ; preds = %58
  %73 = load ptr, ptr %6, align 8
  %74 = load ptr, ptr %5, align 8
  %75 = getelementptr inbounds %struct.png_row_info_struct, ptr %74, i32 0, i32 0
  %76 = load i32, ptr %75, align 8
  %77 = sub i32 %76, 1
  %78 = lshr i32 %77, 3
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i8, ptr %73, i64 %79
  store ptr %80, ptr %10, align 8
  %81 = load ptr, ptr %6, align 8
  %82 = load i32, ptr %9, align 4
  %83 = sub i32 %82, 1
  %84 = lshr i32 %83, 3
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds i8, ptr %81, i64 %85
  store ptr %86, ptr %11, align 8
  %87 = load i32, ptr %7, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [7 x i8], ptr @png_pass_inc, i64 0, i64 %88
  %90 = load i8, ptr %89, align 1
  %91 = zext i8 %90 to i32
  store i32 %91, ptr %17, align 4
  %92 = load i32, ptr %8, align 4
  %93 = and i32 %92, 65536
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %104

95:                                               ; preds = %72
  %96 = load ptr, ptr %5, align 8
  %97 = getelementptr inbounds %struct.png_row_info_struct, ptr %96, i32 0, i32 0
  %98 = load i32, ptr %97, align 8
  %99 = add i32 %98, 7
  %100 = and i32 %99, 7
  store i32 %100, ptr %12, align 4
  %101 = load i32, ptr %9, align 4
  %102 = add i32 %101, 7
  %103 = and i32 %102, 7
  store i32 %103, ptr %13, align 4
  store i32 7, ptr %14, align 4
  store i32 0, ptr %15, align 4
  store i32 -1, ptr %16, align 4
  br label %115

104:                                              ; preds = %72
  %105 = load ptr, ptr %5, align 8
  %106 = getelementptr inbounds %struct.png_row_info_struct, ptr %105, i32 0, i32 0
  %107 = load i32, ptr %106, align 8
  %108 = add i32 %107, 7
  %109 = and i32 %108, 7
  %110 = sub i32 7, %109
  store i32 %110, ptr %12, align 4
  %111 = load i32, ptr %9, align 4
  %112 = add i32 %111, 7
  %113 = and i32 %112, 7
  %114 = sub i32 7, %113
  store i32 %114, ptr %13, align 4
  store i32 0, ptr %14, align 4
  store i32 7, ptr %15, align 4
  store i32 1, ptr %16, align 4
  br label %115

115:                                              ; preds = %104, %95
  store i32 0, ptr %19, align 4
  br label %116

116:                                              ; preds = %180, %115
  %117 = load i32, ptr %19, align 4
  %118 = load ptr, ptr %5, align 8
  %119 = getelementptr inbounds %struct.png_row_info_struct, ptr %118, i32 0, i32 0
  %120 = load i32, ptr %119, align 8
  %121 = icmp ult i32 %117, %120
  br i1 %121, label %122, label %183

122:                                              ; preds = %116
  %123 = load ptr, ptr %10, align 8
  %124 = load i8, ptr %123, align 1
  %125 = zext i8 %124 to i32
  %126 = load i32, ptr %12, align 4
  %127 = ashr i32 %125, %126
  %128 = and i32 %127, 1
  %129 = trunc i32 %128 to i8
  store i8 %129, ptr %18, align 1
  store i32 0, ptr %20, align 4
  br label %130

130:                                              ; preds = %164, %122
  %131 = load i32, ptr %20, align 4
  %132 = load i32, ptr %17, align 4
  %133 = icmp slt i32 %131, %132
  br i1 %133, label %134, label %167

134:                                              ; preds = %130
  %135 = load ptr, ptr %11, align 8
  %136 = load i8, ptr %135, align 1
  %137 = zext i8 %136 to i32
  %138 = load i32, ptr %13, align 4
  %139 = sub i32 7, %138
  %140 = ashr i32 32639, %139
  %141 = and i32 %137, %140
  store i32 %141, ptr %21, align 4
  %142 = load i8, ptr %18, align 1
  %143 = zext i8 %142 to i32
  %144 = load i32, ptr %13, align 4
  %145 = shl i32 %143, %144
  %146 = load i32, ptr %21, align 4
  %147 = or i32 %146, %145
  store i32 %147, ptr %21, align 4
  %148 = load i32, ptr %21, align 4
  %149 = and i32 %148, 255
  %150 = trunc i32 %149 to i8
  %151 = load ptr, ptr %11, align 8
  store i8 %150, ptr %151, align 1
  %152 = load i32, ptr %13, align 4
  %153 = load i32, ptr %15, align 4
  %154 = icmp eq i32 %152, %153
  br i1 %154, label %155, label %159

155:                                              ; preds = %134
  %156 = load i32, ptr %14, align 4
  store i32 %156, ptr %13, align 4
  %157 = load ptr, ptr %11, align 8
  %158 = getelementptr inbounds i8, ptr %157, i32 -1
  store ptr %158, ptr %11, align 8
  br label %163

159:                                              ; preds = %134
  %160 = load i32, ptr %13, align 4
  %161 = load i32, ptr %16, align 4
  %162 = add nsw i32 %160, %161
  store i32 %162, ptr %13, align 4
  br label %163

163:                                              ; preds = %159, %155
  br label %164

164:                                              ; preds = %163
  %165 = load i32, ptr %20, align 4
  %166 = add nsw i32 %165, 1
  store i32 %166, ptr %20, align 4
  br label %130, !llvm.loop !14

167:                                              ; preds = %130
  %168 = load i32, ptr %12, align 4
  %169 = load i32, ptr %15, align 4
  %170 = icmp eq i32 %168, %169
  br i1 %170, label %171, label %175

171:                                              ; preds = %167
  %172 = load i32, ptr %14, align 4
  store i32 %172, ptr %12, align 4
  %173 = load ptr, ptr %10, align 8
  %174 = getelementptr inbounds i8, ptr %173, i32 -1
  store ptr %174, ptr %10, align 8
  br label %179

175:                                              ; preds = %167
  %176 = load i32, ptr %12, align 4
  %177 = load i32, ptr %16, align 4
  %178 = add nsw i32 %176, %177
  store i32 %178, ptr %12, align 4
  br label %179

179:                                              ; preds = %175, %171
  br label %180

180:                                              ; preds = %179
  %181 = load i32, ptr %19, align 4
  %182 = add i32 %181, 1
  store i32 %182, ptr %19, align 4
  br label %116, !llvm.loop !15

183:                                              ; preds = %116
  br label %478

184:                                              ; preds = %58
  %185 = load ptr, ptr %6, align 8
  %186 = load ptr, ptr %5, align 8
  %187 = getelementptr inbounds %struct.png_row_info_struct, ptr %186, i32 0, i32 0
  %188 = load i32, ptr %187, align 8
  %189 = sub i32 %188, 1
  %190 = lshr i32 %189, 2
  %191 = zext i32 %190 to i64
  %192 = getelementptr inbounds i8, ptr %185, i64 %191
  store ptr %192, ptr %22, align 8
  %193 = load ptr, ptr %6, align 8
  %194 = load i32, ptr %9, align 4
  %195 = sub i32 %194, 1
  %196 = lshr i32 %195, 2
  %197 = zext i32 %196 to i64
  %198 = getelementptr inbounds i8, ptr %193, i64 %197
  store ptr %198, ptr %23, align 8
  %199 = load i32, ptr %7, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds [7 x i8], ptr @png_pass_inc, i64 0, i64 %200
  %202 = load i8, ptr %201, align 1
  %203 = zext i8 %202 to i32
  store i32 %203, ptr %29, align 4
  %204 = load i32, ptr %8, align 4
  %205 = and i32 %204, 65536
  %206 = icmp ne i32 %205, 0
  br i1 %206, label %207, label %218

207:                                              ; preds = %184
  %208 = load ptr, ptr %5, align 8
  %209 = getelementptr inbounds %struct.png_row_info_struct, ptr %208, i32 0, i32 0
  %210 = load i32, ptr %209, align 8
  %211 = add i32 %210, 3
  %212 = and i32 %211, 3
  %213 = shl i32 %212, 1
  store i32 %213, ptr %24, align 4
  %214 = load i32, ptr %9, align 4
  %215 = add i32 %214, 3
  %216 = and i32 %215, 3
  %217 = shl i32 %216, 1
  store i32 %217, ptr %25, align 4
  store i32 6, ptr %26, align 4
  store i32 0, ptr %27, align 4
  store i32 -2, ptr %28, align 4
  br label %231

218:                                              ; preds = %184
  %219 = load ptr, ptr %5, align 8
  %220 = getelementptr inbounds %struct.png_row_info_struct, ptr %219, i32 0, i32 0
  %221 = load i32, ptr %220, align 8
  %222 = add i32 %221, 3
  %223 = and i32 %222, 3
  %224 = sub i32 3, %223
  %225 = shl i32 %224, 1
  store i32 %225, ptr %24, align 4
  %226 = load i32, ptr %9, align 4
  %227 = add i32 %226, 3
  %228 = and i32 %227, 3
  %229 = sub i32 3, %228
  %230 = shl i32 %229, 1
  store i32 %230, ptr %25, align 4
  store i32 0, ptr %26, align 4
  store i32 6, ptr %27, align 4
  store i32 2, ptr %28, align 4
  br label %231

231:                                              ; preds = %218, %207
  store i32 0, ptr %30, align 4
  br label %232

232:                                              ; preds = %296, %231
  %233 = load i32, ptr %30, align 4
  %234 = load ptr, ptr %5, align 8
  %235 = getelementptr inbounds %struct.png_row_info_struct, ptr %234, i32 0, i32 0
  %236 = load i32, ptr %235, align 8
  %237 = icmp ult i32 %233, %236
  br i1 %237, label %238, label %299

238:                                              ; preds = %232
  %239 = load ptr, ptr %22, align 8
  %240 = load i8, ptr %239, align 1
  %241 = zext i8 %240 to i32
  %242 = load i32, ptr %24, align 4
  %243 = ashr i32 %241, %242
  %244 = and i32 %243, 3
  %245 = trunc i32 %244 to i8
  store i8 %245, ptr %31, align 1
  store i32 0, ptr %32, align 4
  br label %246

246:                                              ; preds = %280, %238
  %247 = load i32, ptr %32, align 4
  %248 = load i32, ptr %29, align 4
  %249 = icmp slt i32 %247, %248
  br i1 %249, label %250, label %283

250:                                              ; preds = %246
  %251 = load ptr, ptr %23, align 8
  %252 = load i8, ptr %251, align 1
  %253 = zext i8 %252 to i32
  %254 = load i32, ptr %25, align 4
  %255 = sub i32 6, %254
  %256 = ashr i32 16191, %255
  %257 = and i32 %253, %256
  store i32 %257, ptr %33, align 4
  %258 = load i8, ptr %31, align 1
  %259 = zext i8 %258 to i32
  %260 = load i32, ptr %25, align 4
  %261 = shl i32 %259, %260
  %262 = load i32, ptr %33, align 4
  %263 = or i32 %262, %261
  store i32 %263, ptr %33, align 4
  %264 = load i32, ptr %33, align 4
  %265 = and i32 %264, 255
  %266 = trunc i32 %265 to i8
  %267 = load ptr, ptr %23, align 8
  store i8 %266, ptr %267, align 1
  %268 = load i32, ptr %25, align 4
  %269 = load i32, ptr %27, align 4
  %270 = icmp eq i32 %268, %269
  br i1 %270, label %271, label %275

271:                                              ; preds = %250
  %272 = load i32, ptr %26, align 4
  store i32 %272, ptr %25, align 4
  %273 = load ptr, ptr %23, align 8
  %274 = getelementptr inbounds i8, ptr %273, i32 -1
  store ptr %274, ptr %23, align 8
  br label %279

275:                                              ; preds = %250
  %276 = load i32, ptr %25, align 4
  %277 = load i32, ptr %28, align 4
  %278 = add nsw i32 %276, %277
  store i32 %278, ptr %25, align 4
  br label %279

279:                                              ; preds = %275, %271
  br label %280

280:                                              ; preds = %279
  %281 = load i32, ptr %32, align 4
  %282 = add nsw i32 %281, 1
  store i32 %282, ptr %32, align 4
  br label %246, !llvm.loop !16

283:                                              ; preds = %246
  %284 = load i32, ptr %24, align 4
  %285 = load i32, ptr %27, align 4
  %286 = icmp eq i32 %284, %285
  br i1 %286, label %287, label %291

287:                                              ; preds = %283
  %288 = load i32, ptr %26, align 4
  store i32 %288, ptr %24, align 4
  %289 = load ptr, ptr %22, align 8
  %290 = getelementptr inbounds i8, ptr %289, i32 -1
  store ptr %290, ptr %22, align 8
  br label %295

291:                                              ; preds = %283
  %292 = load i32, ptr %24, align 4
  %293 = load i32, ptr %28, align 4
  %294 = add nsw i32 %292, %293
  store i32 %294, ptr %24, align 4
  br label %295

295:                                              ; preds = %291, %287
  br label %296

296:                                              ; preds = %295
  %297 = load i32, ptr %30, align 4
  %298 = add i32 %297, 1
  store i32 %298, ptr %30, align 4
  br label %232, !llvm.loop !17

299:                                              ; preds = %232
  br label %478

300:                                              ; preds = %58
  %301 = load ptr, ptr %6, align 8
  %302 = load ptr, ptr %5, align 8
  %303 = getelementptr inbounds %struct.png_row_info_struct, ptr %302, i32 0, i32 0
  %304 = load i32, ptr %303, align 8
  %305 = sub i32 %304, 1
  %306 = lshr i32 %305, 1
  %307 = zext i32 %306 to i64
  %308 = getelementptr inbounds i8, ptr %301, i64 %307
  store ptr %308, ptr %34, align 8
  %309 = load ptr, ptr %6, align 8
  %310 = load i32, ptr %9, align 4
  %311 = sub i32 %310, 1
  %312 = lshr i32 %311, 1
  %313 = zext i32 %312 to i64
  %314 = getelementptr inbounds i8, ptr %309, i64 %313
  store ptr %314, ptr %35, align 8
  %315 = load i32, ptr %7, align 4
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [7 x i8], ptr @png_pass_inc, i64 0, i64 %316
  %318 = load i8, ptr %317, align 1
  %319 = zext i8 %318 to i32
  store i32 %319, ptr %42, align 4
  %320 = load i32, ptr %8, align 4
  %321 = and i32 %320, 65536
  %322 = icmp ne i32 %321, 0
  br i1 %322, label %323, label %334

323:                                              ; preds = %300
  %324 = load ptr, ptr %5, align 8
  %325 = getelementptr inbounds %struct.png_row_info_struct, ptr %324, i32 0, i32 0
  %326 = load i32, ptr %325, align 8
  %327 = add i32 %326, 1
  %328 = and i32 %327, 1
  %329 = shl i32 %328, 2
  store i32 %329, ptr %36, align 4
  %330 = load i32, ptr %9, align 4
  %331 = add i32 %330, 1
  %332 = and i32 %331, 1
  %333 = shl i32 %332, 2
  store i32 %333, ptr %37, align 4
  store i32 4, ptr %38, align 4
  store i32 0, ptr %39, align 4
  store i32 -4, ptr %40, align 4
  br label %347

334:                                              ; preds = %300
  %335 = load ptr, ptr %5, align 8
  %336 = getelementptr inbounds %struct.png_row_info_struct, ptr %335, i32 0, i32 0
  %337 = load i32, ptr %336, align 8
  %338 = add i32 %337, 1
  %339 = and i32 %338, 1
  %340 = sub i32 1, %339
  %341 = shl i32 %340, 2
  store i32 %341, ptr %36, align 4
  %342 = load i32, ptr %9, align 4
  %343 = add i32 %342, 1
  %344 = and i32 %343, 1
  %345 = sub i32 1, %344
  %346 = shl i32 %345, 2
  store i32 %346, ptr %37, align 4
  store i32 0, ptr %38, align 4
  store i32 4, ptr %39, align 4
  store i32 4, ptr %40, align 4
  br label %347

347:                                              ; preds = %334, %323
  store i32 0, ptr %41, align 4
  br label %348

348:                                              ; preds = %412, %347
  %349 = load i32, ptr %41, align 4
  %350 = load ptr, ptr %5, align 8
  %351 = getelementptr inbounds %struct.png_row_info_struct, ptr %350, i32 0, i32 0
  %352 = load i32, ptr %351, align 8
  %353 = icmp ult i32 %349, %352
  br i1 %353, label %354, label %415

354:                                              ; preds = %348
  %355 = load ptr, ptr %34, align 8
  %356 = load i8, ptr %355, align 1
  %357 = zext i8 %356 to i32
  %358 = load i32, ptr %36, align 4
  %359 = ashr i32 %357, %358
  %360 = and i32 %359, 15
  %361 = trunc i32 %360 to i8
  store i8 %361, ptr %43, align 1
  store i32 0, ptr %44, align 4
  br label %362

362:                                              ; preds = %396, %354
  %363 = load i32, ptr %44, align 4
  %364 = load i32, ptr %42, align 4
  %365 = icmp slt i32 %363, %364
  br i1 %365, label %366, label %399

366:                                              ; preds = %362
  %367 = load ptr, ptr %35, align 8
  %368 = load i8, ptr %367, align 1
  %369 = zext i8 %368 to i32
  %370 = load i32, ptr %37, align 4
  %371 = sub i32 4, %370
  %372 = ashr i32 3855, %371
  %373 = and i32 %369, %372
  store i32 %373, ptr %45, align 4
  %374 = load i8, ptr %43, align 1
  %375 = zext i8 %374 to i32
  %376 = load i32, ptr %37, align 4
  %377 = shl i32 %375, %376
  %378 = load i32, ptr %45, align 4
  %379 = or i32 %378, %377
  store i32 %379, ptr %45, align 4
  %380 = load i32, ptr %45, align 4
  %381 = and i32 %380, 255
  %382 = trunc i32 %381 to i8
  %383 = load ptr, ptr %35, align 8
  store i8 %382, ptr %383, align 1
  %384 = load i32, ptr %37, align 4
  %385 = load i32, ptr %39, align 4
  %386 = icmp eq i32 %384, %385
  br i1 %386, label %387, label %391

387:                                              ; preds = %366
  %388 = load i32, ptr %38, align 4
  store i32 %388, ptr %37, align 4
  %389 = load ptr, ptr %35, align 8
  %390 = getelementptr inbounds i8, ptr %389, i32 -1
  store ptr %390, ptr %35, align 8
  br label %395

391:                                              ; preds = %366
  %392 = load i32, ptr %37, align 4
  %393 = load i32, ptr %40, align 4
  %394 = add nsw i32 %392, %393
  store i32 %394, ptr %37, align 4
  br label %395

395:                                              ; preds = %391, %387
  br label %396

396:                                              ; preds = %395
  %397 = load i32, ptr %44, align 4
  %398 = add nsw i32 %397, 1
  store i32 %398, ptr %44, align 4
  br label %362, !llvm.loop !18

399:                                              ; preds = %362
  %400 = load i32, ptr %36, align 4
  %401 = load i32, ptr %39, align 4
  %402 = icmp eq i32 %400, %401
  br i1 %402, label %403, label %407

403:                                              ; preds = %399
  %404 = load i32, ptr %38, align 4
  store i32 %404, ptr %36, align 4
  %405 = load ptr, ptr %34, align 8
  %406 = getelementptr inbounds i8, ptr %405, i32 -1
  store ptr %406, ptr %34, align 8
  br label %411

407:                                              ; preds = %399
  %408 = load i32, ptr %36, align 4
  %409 = load i32, ptr %40, align 4
  %410 = add nsw i32 %408, %409
  store i32 %410, ptr %36, align 4
  br label %411

411:                                              ; preds = %407, %403
  br label %412

412:                                              ; preds = %411
  %413 = load i32, ptr %41, align 4
  %414 = add i32 %413, 1
  store i32 %414, ptr %41, align 4
  br label %348, !llvm.loop !19

415:                                              ; preds = %348
  br label %478

416:                                              ; preds = %58
  %417 = load ptr, ptr %5, align 8
  %418 = getelementptr inbounds %struct.png_row_info_struct, ptr %417, i32 0, i32 5
  %419 = load i8, ptr %418, align 1
  %420 = zext i8 %419 to i32
  %421 = ashr i32 %420, 3
  %422 = sext i32 %421 to i64
  store i64 %422, ptr %46, align 8
  %423 = load ptr, ptr %6, align 8
  %424 = load ptr, ptr %5, align 8
  %425 = getelementptr inbounds %struct.png_row_info_struct, ptr %424, i32 0, i32 0
  %426 = load i32, ptr %425, align 8
  %427 = sub i32 %426, 1
  %428 = zext i32 %427 to i64
  %429 = load i64, ptr %46, align 8
  %430 = mul i64 %428, %429
  %431 = getelementptr inbounds i8, ptr %423, i64 %430
  store ptr %431, ptr %47, align 8
  %432 = load ptr, ptr %6, align 8
  %433 = load i32, ptr %9, align 4
  %434 = sub i32 %433, 1
  %435 = zext i32 %434 to i64
  %436 = load i64, ptr %46, align 8
  %437 = mul i64 %435, %436
  %438 = getelementptr inbounds i8, ptr %432, i64 %437
  store ptr %438, ptr %48, align 8
  %439 = load i32, ptr %7, align 4
  %440 = sext i32 %439 to i64
  %441 = getelementptr inbounds [7 x i8], ptr @png_pass_inc, i64 0, i64 %440
  %442 = load i8, ptr %441, align 1
  %443 = zext i8 %442 to i32
  store i32 %443, ptr %49, align 4
  store i32 0, ptr %50, align 4
  br label %444

444:                                              ; preds = %474, %416
  %445 = load i32, ptr %50, align 4
  %446 = load ptr, ptr %5, align 8
  %447 = getelementptr inbounds %struct.png_row_info_struct, ptr %446, i32 0, i32 0
  %448 = load i32, ptr %447, align 8
  %449 = icmp ult i32 %445, %448
  br i1 %449, label %450, label %477

450:                                              ; preds = %444
  %451 = getelementptr inbounds [8 x i8], ptr %51, i64 0, i64 0
  %452 = load ptr, ptr %47, align 8
  %453 = load i64, ptr %46, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %451, ptr align 1 %452, i64 %453, i1 false)
  store i32 0, ptr %52, align 4
  br label %454

454:                                              ; preds = %466, %450
  %455 = load i32, ptr %52, align 4
  %456 = load i32, ptr %49, align 4
  %457 = icmp slt i32 %455, %456
  br i1 %457, label %458, label %469

458:                                              ; preds = %454
  %459 = load ptr, ptr %48, align 8
  %460 = getelementptr inbounds [8 x i8], ptr %51, i64 0, i64 0
  %461 = load i64, ptr %46, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %459, ptr align 1 %460, i64 %461, i1 false)
  %462 = load i64, ptr %46, align 8
  %463 = load ptr, ptr %48, align 8
  %464 = sub i64 0, %462
  %465 = getelementptr inbounds i8, ptr %463, i64 %464
  store ptr %465, ptr %48, align 8
  br label %466

466:                                              ; preds = %458
  %467 = load i32, ptr %52, align 4
  %468 = add nsw i32 %467, 1
  store i32 %468, ptr %52, align 4
  br label %454, !llvm.loop !20

469:                                              ; preds = %454
  %470 = load i64, ptr %46, align 8
  %471 = load ptr, ptr %47, align 8
  %472 = sub i64 0, %470
  %473 = getelementptr inbounds i8, ptr %471, i64 %472
  store ptr %473, ptr %47, align 8
  br label %474

474:                                              ; preds = %469
  %475 = load i32, ptr %50, align 4
  %476 = add i32 %475, 1
  store i32 %476, ptr %50, align 4
  br label %444, !llvm.loop !21

477:                                              ; preds = %444
  br label %478

478:                                              ; preds = %477, %415, %299, %183
  %479 = load i32, ptr %9, align 4
  %480 = load ptr, ptr %5, align 8
  %481 = getelementptr inbounds %struct.png_row_info_struct, ptr %480, i32 0, i32 0
  store i32 %479, ptr %481, align 8
  %482 = load ptr, ptr %5, align 8
  %483 = getelementptr inbounds %struct.png_row_info_struct, ptr %482, i32 0, i32 5
  %484 = load i8, ptr %483, align 1
  %485 = zext i8 %484 to i32
  %486 = icmp sge i32 %485, 8
  br i1 %486, label %487, label %496

487:                                              ; preds = %478
  %488 = load i32, ptr %9, align 4
  %489 = zext i32 %488 to i64
  %490 = load ptr, ptr %5, align 8
  %491 = getelementptr inbounds %struct.png_row_info_struct, ptr %490, i32 0, i32 5
  %492 = load i8, ptr %491, align 1
  %493 = zext i8 %492 to i64
  %494 = lshr i64 %493, 3
  %495 = mul i64 %489, %494
  br label %506

496:                                              ; preds = %478
  %497 = load i32, ptr %9, align 4
  %498 = zext i32 %497 to i64
  %499 = load ptr, ptr %5, align 8
  %500 = getelementptr inbounds %struct.png_row_info_struct, ptr %499, i32 0, i32 5
  %501 = load i8, ptr %500, align 1
  %502 = zext i8 %501 to i64
  %503 = mul i64 %498, %502
  %504 = add i64 %503, 7
  %505 = lshr i64 %504, 3
  br label %506

506:                                              ; preds = %496, %487
  %507 = phi i64 [ %495, %487 ], [ %505, %496 ]
  %508 = load ptr, ptr %5, align 8
  %509 = getelementptr inbounds %struct.png_row_info_struct, ptr %508, i32 0, i32 1
  store i64 %507, ptr %509, align 8
  br label %510

510:                                              ; preds = %506, %55, %4
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_read_filter_row(ptr noalias noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store i32 %4, ptr %10, align 4
  %11 = load i32, ptr %10, align 4
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %35

13:                                               ; preds = %5
  %14 = load i32, ptr %10, align 4
  %15 = icmp slt i32 %14, 5
  br i1 %15, label %16, label %35

16:                                               ; preds = %13
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds %struct.png_struct_def, ptr %17, i32 0, i32 149
  %19 = getelementptr inbounds [4 x ptr], ptr %18, i64 0, i64 0
  %20 = load ptr, ptr %19, align 8
  %21 = icmp eq ptr %20, null
  br i1 %21, label %22, label %24

22:                                               ; preds = %16
  %23 = load ptr, ptr %6, align 8
  call void @png_init_filter_functions(ptr noundef %23)
  br label %24

24:                                               ; preds = %22, %16
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds %struct.png_struct_def, ptr %25, i32 0, i32 149
  %27 = load i32, ptr %10, align 4
  %28 = sub nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [4 x ptr], ptr %26, i64 0, i64 %29
  %31 = load ptr, ptr %30, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = load ptr, ptr %8, align 8
  %34 = load ptr, ptr %9, align 8
  call void %31(ptr noundef %32, ptr noundef %33, ptr noundef %34)
  br label %35

35:                                               ; preds = %24, %13, %5
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_init_filter_functions(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.png_struct_def, ptr %4, i32 0, i32 65
  %6 = load i8, ptr %5, align 2
  %7 = zext i8 %6 to i32
  %8 = add nsw i32 %7, 7
  %9 = ashr i32 %8, 3
  store i32 %9, ptr %3, align 4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 149
  %12 = getelementptr inbounds [4 x ptr], ptr %11, i64 0, i64 0
  store ptr @png_read_filter_row_sub, ptr %12, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.png_struct_def, ptr %13, i32 0, i32 149
  %15 = getelementptr inbounds [4 x ptr], ptr %14, i64 0, i64 1
  store ptr @png_read_filter_row_up, ptr %15, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 149
  %18 = getelementptr inbounds [4 x ptr], ptr %17, i64 0, i64 2
  store ptr @png_read_filter_row_avg, ptr %18, align 8
  %19 = load i32, ptr %3, align 4
  %20 = icmp eq i32 %19, 1
  br i1 %20, label %21, label %25

21:                                               ; preds = %1
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds %struct.png_struct_def, ptr %22, i32 0, i32 149
  %24 = getelementptr inbounds [4 x ptr], ptr %23, i64 0, i64 3
  store ptr @png_read_filter_row_paeth_1byte_pixel, ptr %24, align 8
  br label %29

25:                                               ; preds = %1
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds %struct.png_struct_def, ptr %26, i32 0, i32 149
  %28 = getelementptr inbounds [4 x ptr], ptr %27, i64 0, i64 3
  store ptr @png_read_filter_row_paeth_multibyte_pixel, ptr %28, align 8
  br label %29

29:                                               ; preds = %25, %21
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_read_IDAT_data(ptr noalias noundef %0, ptr noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca [1024 x i8], align 16
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.png_struct_def, ptr %13, i32 0, i32 19
  %15 = getelementptr inbounds %struct.z_stream_s, ptr %14, i32 0, i32 3
  store ptr %12, ptr %15, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 19
  %18 = getelementptr inbounds %struct.z_stream_s, ptr %17, i32 0, i32 4
  store i32 0, ptr %18, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = icmp eq ptr %19, null
  br i1 %20, label %21, label %22

21:                                               ; preds = %3
  store i64 0, ptr %6, align 8
  br label %22

22:                                               ; preds = %21, %3
  br label %23

23:                                               ; preds = %202, %22
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.png_struct_def, ptr %24, i32 0, i32 19
  %26 = getelementptr inbounds %struct.z_stream_s, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 8
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %100

29:                                               ; preds = %23
  br label %30

30:                                               ; preds = %48, %29
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.png_struct_def, ptr %31, i32 0, i32 51
  %33 = load i32, ptr %32, align 8
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %49

35:                                               ; preds = %30
  %36 = load ptr, ptr %4, align 8
  %37 = call i32 @png_crc_finish(ptr noundef %36, i32 noundef 0)
  %38 = load ptr, ptr %4, align 8
  %39 = call i32 @png_read_chunk_header(ptr noundef %38)
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.png_struct_def, ptr %40, i32 0, i32 51
  store i32 %39, ptr %41, align 8
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds %struct.png_struct_def, ptr %42, i32 0, i32 45
  %44 = load i32, ptr %43, align 8
  %45 = icmp ne i32 %44, 1229209940
  br i1 %45, label %46, label %48

46:                                               ; preds = %35
  %47 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %47, ptr noundef @.str.21) #6
  unreachable

48:                                               ; preds = %35
  br label %30, !llvm.loop !22

49:                                               ; preds = %30
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds %struct.png_struct_def, ptr %50, i32 0, i32 146
  %52 = load i32, ptr %51, align 8
  store i32 %52, ptr %9, align 4
  %53 = load i32, ptr %9, align 4
  %54 = zext i32 %53 to i64
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds %struct.png_struct_def, ptr %55, i32 0, i32 141
  %57 = load i64, ptr %56, align 8
  %58 = icmp ugt i64 %54, %57
  br i1 %58, label %59, label %64

59:                                               ; preds = %49
  %60 = load ptr, ptr %4, align 8
  %61 = getelementptr inbounds %struct.png_struct_def, ptr %60, i32 0, i32 141
  %62 = load i64, ptr %61, align 8
  %63 = trunc i64 %62 to i32
  store i32 %63, ptr %9, align 4
  br label %64

64:                                               ; preds = %59, %49
  %65 = load i32, ptr %9, align 4
  %66 = load ptr, ptr %4, align 8
  %67 = getelementptr inbounds %struct.png_struct_def, ptr %66, i32 0, i32 51
  %68 = load i32, ptr %67, align 8
  %69 = icmp ugt i32 %65, %68
  br i1 %69, label %70, label %74

70:                                               ; preds = %64
  %71 = load ptr, ptr %4, align 8
  %72 = getelementptr inbounds %struct.png_struct_def, ptr %71, i32 0, i32 51
  %73 = load i32, ptr %72, align 8
  store i32 %73, ptr %9, align 4
  br label %74

74:                                               ; preds = %70, %64
  %75 = load ptr, ptr %4, align 8
  %76 = load i32, ptr %9, align 4
  %77 = zext i32 %76 to i64
  %78 = call ptr @png_read_buffer(ptr noundef %75, i64 noundef %77)
  store ptr %78, ptr %10, align 8
  %79 = load ptr, ptr %10, align 8
  %80 = icmp eq ptr %79, null
  br i1 %80, label %81, label %83

81:                                               ; preds = %74
  %82 = load ptr, ptr %4, align 8
  call void @png_chunk_error(ptr noundef %82, ptr noundef @.str.22) #6
  unreachable

83:                                               ; preds = %74
  %84 = load ptr, ptr %4, align 8
  %85 = load ptr, ptr %10, align 8
  %86 = load i32, ptr %9, align 4
  call void @png_crc_read(ptr noundef %84, ptr noundef %85, i32 noundef %86)
  %87 = load i32, ptr %9, align 4
  %88 = load ptr, ptr %4, align 8
  %89 = getelementptr inbounds %struct.png_struct_def, ptr %88, i32 0, i32 51
  %90 = load i32, ptr %89, align 8
  %91 = sub i32 %90, %87
  store i32 %91, ptr %89, align 8
  %92 = load ptr, ptr %10, align 8
  %93 = load ptr, ptr %4, align 8
  %94 = getelementptr inbounds %struct.png_struct_def, ptr %93, i32 0, i32 19
  %95 = getelementptr inbounds %struct.z_stream_s, ptr %94, i32 0, i32 0
  store ptr %92, ptr %95, align 8
  %96 = load i32, ptr %9, align 4
  %97 = load ptr, ptr %4, align 8
  %98 = getelementptr inbounds %struct.png_struct_def, ptr %97, i32 0, i32 19
  %99 = getelementptr inbounds %struct.z_stream_s, ptr %98, i32 0, i32 1
  store i32 %96, ptr %99, align 8
  br label %100

100:                                              ; preds = %83, %23
  %101 = load ptr, ptr %5, align 8
  %102 = icmp ne ptr %101, null
  br i1 %102, label %103, label %120

103:                                              ; preds = %100
  store i32 -1, ptr %11, align 4
  %104 = load i32, ptr %11, align 4
  %105 = zext i32 %104 to i64
  %106 = load i64, ptr %6, align 8
  %107 = icmp ugt i64 %105, %106
  br i1 %107, label %108, label %111

108:                                              ; preds = %103
  %109 = load i64, ptr %6, align 8
  %110 = trunc i64 %109 to i32
  store i32 %110, ptr %11, align 4
  br label %111

111:                                              ; preds = %108, %103
  %112 = load i32, ptr %11, align 4
  %113 = zext i32 %112 to i64
  %114 = load i64, ptr %6, align 8
  %115 = sub i64 %114, %113
  store i64 %115, ptr %6, align 8
  %116 = load i32, ptr %11, align 4
  %117 = load ptr, ptr %4, align 8
  %118 = getelementptr inbounds %struct.png_struct_def, ptr %117, i32 0, i32 19
  %119 = getelementptr inbounds %struct.z_stream_s, ptr %118, i32 0, i32 4
  store i32 %116, ptr %119, align 8
  br label %128

120:                                              ; preds = %100
  %121 = getelementptr inbounds [1024 x i8], ptr %8, i64 0, i64 0
  %122 = load ptr, ptr %4, align 8
  %123 = getelementptr inbounds %struct.png_struct_def, ptr %122, i32 0, i32 19
  %124 = getelementptr inbounds %struct.z_stream_s, ptr %123, i32 0, i32 3
  store ptr %121, ptr %124, align 8
  %125 = load ptr, ptr %4, align 8
  %126 = getelementptr inbounds %struct.png_struct_def, ptr %125, i32 0, i32 19
  %127 = getelementptr inbounds %struct.z_stream_s, ptr %126, i32 0, i32 4
  store i32 1024, ptr %127, align 8
  br label %128

128:                                              ; preds = %120, %111
  %129 = load ptr, ptr %4, align 8
  %130 = call i32 @png_zlib_inflate(ptr noundef %129, i32 noundef 0)
  store i32 %130, ptr %7, align 4
  %131 = load ptr, ptr %5, align 8
  %132 = icmp ne ptr %131, null
  br i1 %132, label %133, label %141

133:                                              ; preds = %128
  %134 = load ptr, ptr %4, align 8
  %135 = getelementptr inbounds %struct.png_struct_def, ptr %134, i32 0, i32 19
  %136 = getelementptr inbounds %struct.z_stream_s, ptr %135, i32 0, i32 4
  %137 = load i32, ptr %136, align 8
  %138 = zext i32 %137 to i64
  %139 = load i64, ptr %6, align 8
  %140 = add i64 %139, %138
  store i64 %140, ptr %6, align 8
  br label %150

141:                                              ; preds = %128
  %142 = load ptr, ptr %4, align 8
  %143 = getelementptr inbounds %struct.png_struct_def, ptr %142, i32 0, i32 19
  %144 = getelementptr inbounds %struct.z_stream_s, ptr %143, i32 0, i32 4
  %145 = load i32, ptr %144, align 8
  %146 = zext i32 %145 to i64
  %147 = sub i64 1024, %146
  %148 = load i64, ptr %6, align 8
  %149 = add i64 %148, %147
  store i64 %149, ptr %6, align 8
  br label %150

150:                                              ; preds = %141, %133
  %151 = load ptr, ptr %4, align 8
  %152 = getelementptr inbounds %struct.png_struct_def, ptr %151, i32 0, i32 19
  %153 = getelementptr inbounds %struct.z_stream_s, ptr %152, i32 0, i32 4
  store i32 0, ptr %153, align 8
  %154 = load i32, ptr %7, align 4
  %155 = icmp eq i32 %154, 1
  br i1 %155, label %156, label %181

156:                                              ; preds = %150
  %157 = load ptr, ptr %4, align 8
  %158 = getelementptr inbounds %struct.png_struct_def, ptr %157, i32 0, i32 19
  %159 = getelementptr inbounds %struct.z_stream_s, ptr %158, i32 0, i32 3
  store ptr null, ptr %159, align 8
  %160 = load ptr, ptr %4, align 8
  %161 = getelementptr inbounds %struct.png_struct_def, ptr %160, i32 0, i32 15
  %162 = load i32, ptr %161, align 4
  %163 = or i32 %162, 8
  store i32 %163, ptr %161, align 4
  %164 = load ptr, ptr %4, align 8
  %165 = getelementptr inbounds %struct.png_struct_def, ptr %164, i32 0, i32 16
  %166 = load i32, ptr %165, align 8
  %167 = or i32 %166, 8
  store i32 %167, ptr %165, align 8
  %168 = load ptr, ptr %4, align 8
  %169 = getelementptr inbounds %struct.png_struct_def, ptr %168, i32 0, i32 19
  %170 = getelementptr inbounds %struct.z_stream_s, ptr %169, i32 0, i32 1
  %171 = load i32, ptr %170, align 8
  %172 = icmp ugt i32 %171, 0
  br i1 %172, label %178, label %173

173:                                              ; preds = %156
  %174 = load ptr, ptr %4, align 8
  %175 = getelementptr inbounds %struct.png_struct_def, ptr %174, i32 0, i32 51
  %176 = load i32, ptr %175, align 8
  %177 = icmp ugt i32 %176, 0
  br i1 %177, label %178, label %180

178:                                              ; preds = %173, %156
  %179 = load ptr, ptr %4, align 8
  call void @png_chunk_benign_error(ptr noundef %179, ptr noundef @.str.23)
  br label %180

180:                                              ; preds = %178, %173
  br label %205

181:                                              ; preds = %150
  %182 = load i32, ptr %7, align 4
  %183 = icmp ne i32 %182, 0
  br i1 %183, label %184, label %201

184:                                              ; preds = %181
  %185 = load ptr, ptr %4, align 8
  %186 = load i32, ptr %7, align 4
  call void @png_zstream_error(ptr noundef %185, i32 noundef %186)
  %187 = load ptr, ptr %5, align 8
  %188 = icmp ne ptr %187, null
  br i1 %188, label %189, label %195

189:                                              ; preds = %184
  %190 = load ptr, ptr %4, align 8
  %191 = load ptr, ptr %4, align 8
  %192 = getelementptr inbounds %struct.png_struct_def, ptr %191, i32 0, i32 19
  %193 = getelementptr inbounds %struct.z_stream_s, ptr %192, i32 0, i32 6
  %194 = load ptr, ptr %193, align 8
  call void @png_chunk_error(ptr noundef %190, ptr noundef %194) #6
  unreachable

195:                                              ; preds = %184
  %196 = load ptr, ptr %4, align 8
  %197 = load ptr, ptr %4, align 8
  %198 = getelementptr inbounds %struct.png_struct_def, ptr %197, i32 0, i32 19
  %199 = getelementptr inbounds %struct.z_stream_s, ptr %198, i32 0, i32 6
  %200 = load ptr, ptr %199, align 8
  call void @png_chunk_benign_error(ptr noundef %196, ptr noundef %200)
  br label %216

201:                                              ; preds = %181
  br label %202

202:                                              ; preds = %201
  %203 = load i64, ptr %6, align 8
  %204 = icmp ugt i64 %203, 0
  br i1 %204, label %23, label %205, !llvm.loop !23

205:                                              ; preds = %202, %180
  %206 = load i64, ptr %6, align 8
  %207 = icmp ugt i64 %206, 0
  br i1 %207, label %208, label %216

208:                                              ; preds = %205
  %209 = load ptr, ptr %5, align 8
  %210 = icmp ne ptr %209, null
  br i1 %210, label %211, label %213

211:                                              ; preds = %208
  %212 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %212, ptr noundef @.str.21) #6
  unreachable

213:                                              ; preds = %208
  %214 = load ptr, ptr %4, align 8
  call void @png_chunk_benign_error(ptr noundef %214, ptr noundef @.str.24)
  br label %215

215:                                              ; preds = %213
  br label %216

216:                                              ; preds = %195, %215, %205
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal ptr @png_read_buffer(ptr noalias noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.png_struct_def, ptr %7, i32 0, i32 144
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %6, align 8
  %10 = load i64, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.png_struct_def, ptr %11, i32 0, i32 141
  %13 = load i64, ptr %12, align 8
  %14 = icmp ugt i64 %10, %13
  br i1 %14, label %15, label %16

15:                                               ; preds = %2
  store ptr null, ptr %3, align 8
  br label %53

16:                                               ; preds = %2
  %17 = load ptr, ptr %6, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %32

19:                                               ; preds = %16
  %20 = load i64, ptr %5, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds %struct.png_struct_def, ptr %21, i32 0, i32 145
  %23 = load i64, ptr %22, align 8
  %24 = icmp ugt i64 %20, %23
  br i1 %24, label %25, label %32

25:                                               ; preds = %19
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.png_struct_def, ptr %26, i32 0, i32 144
  store ptr null, ptr %27, align 8
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds %struct.png_struct_def, ptr %28, i32 0, i32 145
  store i64 0, ptr %29, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = load ptr, ptr %6, align 8
  call void @png_free(ptr noundef %30, ptr noundef %31)
  store ptr null, ptr %6, align 8
  br label %32

32:                                               ; preds = %25, %19, %16
  %33 = load ptr, ptr %6, align 8
  %34 = icmp eq ptr %33, null
  br i1 %34, label %35, label %51

35:                                               ; preds = %32
  %36 = load ptr, ptr %4, align 8
  %37 = load i64, ptr %5, align 8
  %38 = call noalias ptr @png_malloc_base(ptr noundef %36, i64 noundef %37)
  store ptr %38, ptr %6, align 8
  %39 = load ptr, ptr %6, align 8
  %40 = icmp ne ptr %39, null
  br i1 %40, label %41, label %50

41:                                               ; preds = %35
  %42 = load ptr, ptr %6, align 8
  %43 = load i64, ptr %5, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %42, i8 0, i64 %43, i1 false)
  %44 = load ptr, ptr %6, align 8
  %45 = load ptr, ptr %4, align 8
  %46 = getelementptr inbounds %struct.png_struct_def, ptr %45, i32 0, i32 144
  store ptr %44, ptr %46, align 8
  %47 = load i64, ptr %5, align 8
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds %struct.png_struct_def, ptr %48, i32 0, i32 145
  store i64 %47, ptr %49, align 8
  br label %50

50:                                               ; preds = %41, %35
  br label %51

51:                                               ; preds = %50, %32
  %52 = load ptr, ptr %6, align 8
  store ptr %52, ptr %3, align 8
  br label %53

53:                                               ; preds = %51, %15
  %54 = load ptr, ptr %3, align 8
  ret ptr %54
}

declare void @png_zstream_error(ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_read_finish_IDAT(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.png_struct_def, ptr %3, i32 0, i32 16
  %5 = load i32, ptr %4, align 8
  %6 = and i32 %5, 8
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %28

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8
  call void @png_read_IDAT_data(ptr noundef %9, ptr noundef null, i64 noundef 0)
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 19
  %12 = getelementptr inbounds %struct.z_stream_s, ptr %11, i32 0, i32 3
  store ptr null, ptr %12, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.png_struct_def, ptr %13, i32 0, i32 16
  %15 = load i32, ptr %14, align 8
  %16 = and i32 %15, 8
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %27

18:                                               ; preds = %8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.png_struct_def, ptr %19, i32 0, i32 15
  %21 = load i32, ptr %20, align 4
  %22 = or i32 %21, 8
  store i32 %22, ptr %20, align 4
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.png_struct_def, ptr %23, i32 0, i32 16
  %25 = load i32, ptr %24, align 8
  %26 = or i32 %25, 8
  store i32 %26, ptr %24, align 8
  br label %27

27:                                               ; preds = %18, %8
  br label %28

28:                                               ; preds = %27, %1
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.png_struct_def, ptr %29, i32 0, i32 18
  %31 = load i32, ptr %30, align 8
  %32 = icmp eq i32 %31, 1229209940
  br i1 %32, label %33, label %47

33:                                               ; preds = %28
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds %struct.png_struct_def, ptr %34, i32 0, i32 19
  %36 = getelementptr inbounds %struct.z_stream_s, ptr %35, i32 0, i32 0
  store ptr null, ptr %36, align 8
  %37 = load ptr, ptr %2, align 8
  %38 = getelementptr inbounds %struct.png_struct_def, ptr %37, i32 0, i32 19
  %39 = getelementptr inbounds %struct.z_stream_s, ptr %38, i32 0, i32 1
  store i32 0, ptr %39, align 8
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds %struct.png_struct_def, ptr %40, i32 0, i32 18
  store i32 0, ptr %41, align 8
  %42 = load ptr, ptr %2, align 8
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds %struct.png_struct_def, ptr %43, i32 0, i32 51
  %45 = load i32, ptr %44, align 8
  %46 = call i32 @png_crc_finish(ptr noundef %42, i32 noundef %45)
  br label %47

47:                                               ; preds = %33, %28
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_read_finish_row(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.png_struct_def, ptr %3, i32 0, i32 44
  %5 = load i32, ptr %4, align 4
  %6 = add i32 %5, 1
  store i32 %6, ptr %4, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.png_struct_def, ptr %7, i32 0, i32 44
  %9 = load i32, ptr %8, align 4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 40
  %12 = load i32, ptr %11, align 4
  %13 = icmp ult i32 %9, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %1
  br label %133

15:                                               ; preds = %1
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 59
  %18 = load i8, ptr %17, align 4
  %19 = zext i8 %18 to i32
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %131

21:                                               ; preds = %15
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds %struct.png_struct_def, ptr %22, i32 0, i32 44
  store i32 0, ptr %23, align 4
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds %struct.png_struct_def, ptr %24, i32 0, i32 46
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.png_struct_def, ptr %27, i32 0, i32 42
  %29 = load i64, ptr %28, align 8
  %30 = add i64 %29, 1
  call void @llvm.memset.p0.i64(ptr align 1 %26, i8 0, i64 %30, i1 false)
  br label %31

31:                                               ; preds = %121, %21
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds %struct.png_struct_def, ptr %32, i32 0, i32 60
  %34 = load i8, ptr %33, align 1
  %35 = add i8 %34, 1
  store i8 %35, ptr %33, align 1
  %36 = load ptr, ptr %2, align 8
  %37 = getelementptr inbounds %struct.png_struct_def, ptr %36, i32 0, i32 60
  %38 = load i8, ptr %37, align 1
  %39 = zext i8 %38 to i32
  %40 = icmp sge i32 %39, 7
  br i1 %40, label %41, label %42

41:                                               ; preds = %31
  br label %123

42:                                               ; preds = %31
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds %struct.png_struct_def, ptr %43, i32 0, i32 38
  %45 = load i32, ptr %44, align 4
  %46 = load ptr, ptr %2, align 8
  %47 = getelementptr inbounds %struct.png_struct_def, ptr %46, i32 0, i32 60
  %48 = load i8, ptr %47, align 1
  %49 = zext i8 %48 to i64
  %50 = getelementptr inbounds [7 x i8], ptr @png_pass_inc, i64 0, i64 %49
  %51 = load i8, ptr %50, align 1
  %52 = zext i8 %51 to i32
  %53 = add i32 %45, %52
  %54 = sub i32 %53, 1
  %55 = load ptr, ptr %2, align 8
  %56 = getelementptr inbounds %struct.png_struct_def, ptr %55, i32 0, i32 60
  %57 = load i8, ptr %56, align 1
  %58 = zext i8 %57 to i64
  %59 = getelementptr inbounds [7 x i8], ptr @png_pass_start, i64 0, i64 %58
  %60 = load i8, ptr %59, align 1
  %61 = zext i8 %60 to i32
  %62 = sub i32 %54, %61
  %63 = load ptr, ptr %2, align 8
  %64 = getelementptr inbounds %struct.png_struct_def, ptr %63, i32 0, i32 60
  %65 = load i8, ptr %64, align 1
  %66 = zext i8 %65 to i64
  %67 = getelementptr inbounds [7 x i8], ptr @png_pass_inc, i64 0, i64 %66
  %68 = load i8, ptr %67, align 1
  %69 = zext i8 %68 to i32
  %70 = udiv i32 %62, %69
  %71 = load ptr, ptr %2, align 8
  %72 = getelementptr inbounds %struct.png_struct_def, ptr %71, i32 0, i32 43
  store i32 %70, ptr %72, align 8
  %73 = load ptr, ptr %2, align 8
  %74 = getelementptr inbounds %struct.png_struct_def, ptr %73, i32 0, i32 17
  %75 = load i32, ptr %74, align 4
  %76 = and i32 %75, 2
  %77 = icmp eq i32 %76, 0
  br i1 %77, label %78, label %109

78:                                               ; preds = %42
  %79 = load ptr, ptr %2, align 8
  %80 = getelementptr inbounds %struct.png_struct_def, ptr %79, i32 0, i32 39
  %81 = load i32, ptr %80, align 8
  %82 = load ptr, ptr %2, align 8
  %83 = getelementptr inbounds %struct.png_struct_def, ptr %82, i32 0, i32 60
  %84 = load i8, ptr %83, align 1
  %85 = zext i8 %84 to i64
  %86 = getelementptr inbounds [7 x i8], ptr @png_pass_yinc, i64 0, i64 %85
  %87 = load i8, ptr %86, align 1
  %88 = zext i8 %87 to i32
  %89 = add i32 %81, %88
  %90 = sub i32 %89, 1
  %91 = load ptr, ptr %2, align 8
  %92 = getelementptr inbounds %struct.png_struct_def, ptr %91, i32 0, i32 60
  %93 = load i8, ptr %92, align 1
  %94 = zext i8 %93 to i64
  %95 = getelementptr inbounds [7 x i8], ptr @png_pass_ystart, i64 0, i64 %94
  %96 = load i8, ptr %95, align 1
  %97 = zext i8 %96 to i32
  %98 = sub i32 %90, %97
  %99 = load ptr, ptr %2, align 8
  %100 = getelementptr inbounds %struct.png_struct_def, ptr %99, i32 0, i32 60
  %101 = load i8, ptr %100, align 1
  %102 = zext i8 %101 to i64
  %103 = getelementptr inbounds [7 x i8], ptr @png_pass_yinc, i64 0, i64 %102
  %104 = load i8, ptr %103, align 1
  %105 = zext i8 %104 to i32
  %106 = udiv i32 %98, %105
  %107 = load ptr, ptr %2, align 8
  %108 = getelementptr inbounds %struct.png_struct_def, ptr %107, i32 0, i32 40
  store i32 %106, ptr %108, align 4
  br label %110

109:                                              ; preds = %42
  br label %123

110:                                              ; preds = %78
  br label %111

111:                                              ; preds = %110
  %112 = load ptr, ptr %2, align 8
  %113 = getelementptr inbounds %struct.png_struct_def, ptr %112, i32 0, i32 40
  %114 = load i32, ptr %113, align 4
  %115 = icmp eq i32 %114, 0
  br i1 %115, label %121, label %116

116:                                              ; preds = %111
  %117 = load ptr, ptr %2, align 8
  %118 = getelementptr inbounds %struct.png_struct_def, ptr %117, i32 0, i32 43
  %119 = load i32, ptr %118, align 8
  %120 = icmp eq i32 %119, 0
  br label %121

121:                                              ; preds = %116, %111
  %122 = phi i1 [ true, %111 ], [ %120, %116 ]
  br i1 %122, label %31, label %123, !llvm.loop !24

123:                                              ; preds = %121, %109, %41
  %124 = load ptr, ptr %2, align 8
  %125 = getelementptr inbounds %struct.png_struct_def, ptr %124, i32 0, i32 60
  %126 = load i8, ptr %125, align 1
  %127 = zext i8 %126 to i32
  %128 = icmp slt i32 %127, 7
  br i1 %128, label %129, label %130

129:                                              ; preds = %123
  br label %133

130:                                              ; preds = %123
  br label %131

131:                                              ; preds = %130, %15
  %132 = load ptr, ptr %2, align 8
  call void @png_read_finish_IDAT(ptr noundef %132)
  br label %133

133:                                              ; preds = %131, %129, %14
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_read_start_row(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %9 = load ptr, ptr %2, align 8
  call void @png_init_read_transformations(ptr noundef %9)
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 59
  %12 = load i8, ptr %11, align 4
  %13 = zext i8 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %74

15:                                               ; preds = %1
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 17
  %18 = load i32, ptr %17, align 4
  %19 = and i32 %18, 2
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %37

21:                                               ; preds = %15
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds %struct.png_struct_def, ptr %22, i32 0, i32 39
  %24 = load i32, ptr %23, align 8
  %25 = load i8, ptr @png_pass_yinc, align 1
  %26 = zext i8 %25 to i32
  %27 = add i32 %24, %26
  %28 = sub i32 %27, 1
  %29 = load i8, ptr @png_pass_ystart, align 1
  %30 = zext i8 %29 to i32
  %31 = sub i32 %28, %30
  %32 = load i8, ptr @png_pass_yinc, align 1
  %33 = zext i8 %32 to i32
  %34 = udiv i32 %31, %33
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds %struct.png_struct_def, ptr %35, i32 0, i32 40
  store i32 %34, ptr %36, align 4
  br label %43

37:                                               ; preds = %15
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr inbounds %struct.png_struct_def, ptr %38, i32 0, i32 39
  %40 = load i32, ptr %39, align 8
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds %struct.png_struct_def, ptr %41, i32 0, i32 40
  store i32 %40, ptr %42, align 4
  br label %43

43:                                               ; preds = %37, %21
  %44 = load ptr, ptr %2, align 8
  %45 = getelementptr inbounds %struct.png_struct_def, ptr %44, i32 0, i32 38
  %46 = load i32, ptr %45, align 4
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds %struct.png_struct_def, ptr %47, i32 0, i32 60
  %49 = load i8, ptr %48, align 1
  %50 = zext i8 %49 to i64
  %51 = getelementptr inbounds [7 x i8], ptr @png_pass_inc, i64 0, i64 %50
  %52 = load i8, ptr %51, align 1
  %53 = zext i8 %52 to i32
  %54 = add i32 %46, %53
  %55 = sub i32 %54, 1
  %56 = load ptr, ptr %2, align 8
  %57 = getelementptr inbounds %struct.png_struct_def, ptr %56, i32 0, i32 60
  %58 = load i8, ptr %57, align 1
  %59 = zext i8 %58 to i64
  %60 = getelementptr inbounds [7 x i8], ptr @png_pass_start, i64 0, i64 %59
  %61 = load i8, ptr %60, align 1
  %62 = zext i8 %61 to i32
  %63 = sub i32 %55, %62
  %64 = load ptr, ptr %2, align 8
  %65 = getelementptr inbounds %struct.png_struct_def, ptr %64, i32 0, i32 60
  %66 = load i8, ptr %65, align 1
  %67 = zext i8 %66 to i64
  %68 = getelementptr inbounds [7 x i8], ptr @png_pass_inc, i64 0, i64 %67
  %69 = load i8, ptr %68, align 1
  %70 = zext i8 %69 to i32
  %71 = udiv i32 %63, %70
  %72 = load ptr, ptr %2, align 8
  %73 = getelementptr inbounds %struct.png_struct_def, ptr %72, i32 0, i32 43
  store i32 %71, ptr %73, align 8
  br label %85

74:                                               ; preds = %1
  %75 = load ptr, ptr %2, align 8
  %76 = getelementptr inbounds %struct.png_struct_def, ptr %75, i32 0, i32 39
  %77 = load i32, ptr %76, align 8
  %78 = load ptr, ptr %2, align 8
  %79 = getelementptr inbounds %struct.png_struct_def, ptr %78, i32 0, i32 40
  store i32 %77, ptr %79, align 4
  %80 = load ptr, ptr %2, align 8
  %81 = getelementptr inbounds %struct.png_struct_def, ptr %80, i32 0, i32 38
  %82 = load i32, ptr %81, align 4
  %83 = load ptr, ptr %2, align 8
  %84 = getelementptr inbounds %struct.png_struct_def, ptr %83, i32 0, i32 43
  store i32 %82, ptr %84, align 8
  br label %85

85:                                               ; preds = %74, %43
  %86 = load ptr, ptr %2, align 8
  %87 = getelementptr inbounds %struct.png_struct_def, ptr %86, i32 0, i32 65
  %88 = load i8, ptr %87, align 2
  %89 = zext i8 %88 to i32
  store i32 %89, ptr %3, align 4
  %90 = load ptr, ptr %2, align 8
  %91 = getelementptr inbounds %struct.png_struct_def, ptr %90, i32 0, i32 17
  %92 = load i32, ptr %91, align 4
  %93 = and i32 %92, 4
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %102

95:                                               ; preds = %85
  %96 = load ptr, ptr %2, align 8
  %97 = getelementptr inbounds %struct.png_struct_def, ptr %96, i32 0, i32 63
  %98 = load i8, ptr %97, align 8
  %99 = zext i8 %98 to i32
  %100 = icmp slt i32 %99, 8
  br i1 %100, label %101, label %102

101:                                              ; preds = %95
  store i32 8, ptr %3, align 4
  br label %102

102:                                              ; preds = %101, %95, %85
  %103 = load ptr, ptr %2, align 8
  %104 = getelementptr inbounds %struct.png_struct_def, ptr %103, i32 0, i32 17
  %105 = load i32, ptr %104, align 4
  %106 = and i32 %105, 4096
  %107 = icmp ne i32 %106, 0
  br i1 %107, label %108, label %164

108:                                              ; preds = %102
  %109 = load ptr, ptr %2, align 8
  %110 = getelementptr inbounds %struct.png_struct_def, ptr %109, i32 0, i32 62
  %111 = load i8, ptr %110, align 1
  %112 = zext i8 %111 to i32
  %113 = icmp eq i32 %112, 3
  br i1 %113, label %114, label %123

114:                                              ; preds = %108
  %115 = load ptr, ptr %2, align 8
  %116 = getelementptr inbounds %struct.png_struct_def, ptr %115, i32 0, i32 56
  %117 = load i16, ptr %116, align 8
  %118 = zext i16 %117 to i32
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %120, label %121

120:                                              ; preds = %114
  store i32 32, ptr %3, align 4
  br label %122

121:                                              ; preds = %114
  store i32 24, ptr %3, align 4
  br label %122

122:                                              ; preds = %121, %120
  br label %163

123:                                              ; preds = %108
  %124 = load ptr, ptr %2, align 8
  %125 = getelementptr inbounds %struct.png_struct_def, ptr %124, i32 0, i32 62
  %126 = load i8, ptr %125, align 1
  %127 = zext i8 %126 to i32
  %128 = icmp eq i32 %127, 0
  br i1 %128, label %129, label %143

129:                                              ; preds = %123
  %130 = load i32, ptr %3, align 4
  %131 = icmp ult i32 %130, 8
  br i1 %131, label %132, label %133

132:                                              ; preds = %129
  store i32 8, ptr %3, align 4
  br label %133

133:                                              ; preds = %132, %129
  %134 = load ptr, ptr %2, align 8
  %135 = getelementptr inbounds %struct.png_struct_def, ptr %134, i32 0, i32 56
  %136 = load i16, ptr %135, align 8
  %137 = zext i16 %136 to i32
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %139, label %142

139:                                              ; preds = %133
  %140 = load i32, ptr %3, align 4
  %141 = mul i32 %140, 2
  store i32 %141, ptr %3, align 4
  br label %142

142:                                              ; preds = %139, %133
  br label %162

143:                                              ; preds = %123
  %144 = load ptr, ptr %2, align 8
  %145 = getelementptr inbounds %struct.png_struct_def, ptr %144, i32 0, i32 62
  %146 = load i8, ptr %145, align 1
  %147 = zext i8 %146 to i32
  %148 = icmp eq i32 %147, 2
  br i1 %148, label %149, label %161

149:                                              ; preds = %143
  %150 = load ptr, ptr %2, align 8
  %151 = getelementptr inbounds %struct.png_struct_def, ptr %150, i32 0, i32 56
  %152 = load i16, ptr %151, align 8
  %153 = zext i16 %152 to i32
  %154 = icmp ne i32 %153, 0
  br i1 %154, label %155, label %160

155:                                              ; preds = %149
  %156 = load i32, ptr %3, align 4
  %157 = mul i32 %156, 4
  store i32 %157, ptr %3, align 4
  %158 = load i32, ptr %3, align 4
  %159 = udiv i32 %158, 3
  store i32 %159, ptr %3, align 4
  br label %160

160:                                              ; preds = %155, %149
  br label %161

161:                                              ; preds = %160, %143
  br label %162

162:                                              ; preds = %161, %142
  br label %163

163:                                              ; preds = %162, %122
  br label %164

164:                                              ; preds = %163, %102
  %165 = load ptr, ptr %2, align 8
  %166 = getelementptr inbounds %struct.png_struct_def, ptr %165, i32 0, i32 17
  %167 = load i32, ptr %166, align 4
  %168 = and i32 %167, 512
  %169 = icmp ne i32 %168, 0
  br i1 %169, label %170, label %192

170:                                              ; preds = %164
  %171 = load ptr, ptr %2, align 8
  %172 = getelementptr inbounds %struct.png_struct_def, ptr %171, i32 0, i32 17
  %173 = load i32, ptr %172, align 4
  %174 = and i32 %173, 4096
  %175 = icmp ne i32 %174, 0
  br i1 %175, label %176, label %186

176:                                              ; preds = %170
  %177 = load ptr, ptr %2, align 8
  %178 = getelementptr inbounds %struct.png_struct_def, ptr %177, i32 0, i32 63
  %179 = load i8, ptr %178, align 8
  %180 = zext i8 %179 to i32
  %181 = icmp slt i32 %180, 16
  br i1 %181, label %182, label %185

182:                                              ; preds = %176
  %183 = load i32, ptr %3, align 4
  %184 = mul i32 %183, 2
  store i32 %184, ptr %3, align 4
  br label %185

185:                                              ; preds = %182, %176
  br label %191

186:                                              ; preds = %170
  %187 = load ptr, ptr %2, align 8
  %188 = getelementptr inbounds %struct.png_struct_def, ptr %187, i32 0, i32 17
  %189 = load i32, ptr %188, align 4
  %190 = and i32 %189, -513
  store i32 %190, ptr %188, align 4
  br label %191

191:                                              ; preds = %186, %185
  br label %192

192:                                              ; preds = %191, %164
  %193 = load ptr, ptr %2, align 8
  %194 = getelementptr inbounds %struct.png_struct_def, ptr %193, i32 0, i32 17
  %195 = load i32, ptr %194, align 4
  %196 = and i32 %195, 32768
  %197 = icmp ne i32 %196, 0
  br i1 %197, label %198, label %230

198:                                              ; preds = %192
  %199 = load ptr, ptr %2, align 8
  %200 = getelementptr inbounds %struct.png_struct_def, ptr %199, i32 0, i32 62
  %201 = load i8, ptr %200, align 1
  %202 = zext i8 %201 to i32
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %204, label %210

204:                                              ; preds = %198
  %205 = load i32, ptr %3, align 4
  %206 = icmp ule i32 %205, 8
  br i1 %206, label %207, label %208

207:                                              ; preds = %204
  store i32 16, ptr %3, align 4
  br label %209

208:                                              ; preds = %204
  store i32 32, ptr %3, align 4
  br label %209

209:                                              ; preds = %208, %207
  br label %229

210:                                              ; preds = %198
  %211 = load ptr, ptr %2, align 8
  %212 = getelementptr inbounds %struct.png_struct_def, ptr %211, i32 0, i32 62
  %213 = load i8, ptr %212, align 1
  %214 = zext i8 %213 to i32
  %215 = icmp eq i32 %214, 2
  br i1 %215, label %222, label %216

216:                                              ; preds = %210
  %217 = load ptr, ptr %2, align 8
  %218 = getelementptr inbounds %struct.png_struct_def, ptr %217, i32 0, i32 62
  %219 = load i8, ptr %218, align 1
  %220 = zext i8 %219 to i32
  %221 = icmp eq i32 %220, 3
  br i1 %221, label %222, label %228

222:                                              ; preds = %216, %210
  %223 = load i32, ptr %3, align 4
  %224 = icmp ule i32 %223, 32
  br i1 %224, label %225, label %226

225:                                              ; preds = %222
  store i32 32, ptr %3, align 4
  br label %227

226:                                              ; preds = %222
  store i32 64, ptr %3, align 4
  br label %227

227:                                              ; preds = %226, %225
  br label %228

228:                                              ; preds = %227, %216
  br label %229

229:                                              ; preds = %228, %209
  br label %230

230:                                              ; preds = %229, %192
  %231 = load ptr, ptr %2, align 8
  %232 = getelementptr inbounds %struct.png_struct_def, ptr %231, i32 0, i32 17
  %233 = load i32, ptr %232, align 4
  %234 = and i32 %233, 16384
  %235 = icmp ne i32 %234, 0
  br i1 %235, label %236, label %289

236:                                              ; preds = %230
  %237 = load ptr, ptr %2, align 8
  %238 = getelementptr inbounds %struct.png_struct_def, ptr %237, i32 0, i32 56
  %239 = load i16, ptr %238, align 8
  %240 = zext i16 %239 to i32
  %241 = icmp ne i32 %240, 0
  br i1 %241, label %242, label %248

242:                                              ; preds = %236
  %243 = load ptr, ptr %2, align 8
  %244 = getelementptr inbounds %struct.png_struct_def, ptr %243, i32 0, i32 17
  %245 = load i32, ptr %244, align 4
  %246 = and i32 %245, 4096
  %247 = icmp ne i32 %246, 0
  br i1 %247, label %260, label %248

248:                                              ; preds = %242, %236
  %249 = load ptr, ptr %2, align 8
  %250 = getelementptr inbounds %struct.png_struct_def, ptr %249, i32 0, i32 17
  %251 = load i32, ptr %250, align 4
  %252 = and i32 %251, 32768
  %253 = icmp ne i32 %252, 0
  br i1 %253, label %260, label %254

254:                                              ; preds = %248
  %255 = load ptr, ptr %2, align 8
  %256 = getelementptr inbounds %struct.png_struct_def, ptr %255, i32 0, i32 62
  %257 = load i8, ptr %256, align 1
  %258 = zext i8 %257 to i32
  %259 = icmp eq i32 %258, 4
  br i1 %259, label %260, label %266

260:                                              ; preds = %254, %248, %242
  %261 = load i32, ptr %3, align 4
  %262 = icmp ule i32 %261, 16
  br i1 %262, label %263, label %264

263:                                              ; preds = %260
  store i32 32, ptr %3, align 4
  br label %265

264:                                              ; preds = %260
  store i32 64, ptr %3, align 4
  br label %265

265:                                              ; preds = %264, %263
  br label %288

266:                                              ; preds = %254
  %267 = load i32, ptr %3, align 4
  %268 = icmp ule i32 %267, 8
  br i1 %268, label %269, label %278

269:                                              ; preds = %266
  %270 = load ptr, ptr %2, align 8
  %271 = getelementptr inbounds %struct.png_struct_def, ptr %270, i32 0, i32 62
  %272 = load i8, ptr %271, align 1
  %273 = zext i8 %272 to i32
  %274 = icmp eq i32 %273, 6
  br i1 %274, label %275, label %276

275:                                              ; preds = %269
  store i32 32, ptr %3, align 4
  br label %277

276:                                              ; preds = %269
  store i32 24, ptr %3, align 4
  br label %277

277:                                              ; preds = %276, %275
  br label %287

278:                                              ; preds = %266
  %279 = load ptr, ptr %2, align 8
  %280 = getelementptr inbounds %struct.png_struct_def, ptr %279, i32 0, i32 62
  %281 = load i8, ptr %280, align 1
  %282 = zext i8 %281 to i32
  %283 = icmp eq i32 %282, 6
  br i1 %283, label %284, label %285

284:                                              ; preds = %278
  store i32 64, ptr %3, align 4
  br label %286

285:                                              ; preds = %278
  store i32 48, ptr %3, align 4
  br label %286

286:                                              ; preds = %285, %284
  br label %287

287:                                              ; preds = %286, %277
  br label %288

288:                                              ; preds = %287, %265
  br label %289

289:                                              ; preds = %288, %230
  %290 = load ptr, ptr %2, align 8
  %291 = getelementptr inbounds %struct.png_struct_def, ptr %290, i32 0, i32 17
  %292 = load i32, ptr %291, align 4
  %293 = and i32 %292, 1048576
  %294 = icmp ne i32 %293, 0
  br i1 %294, label %295, label %311

295:                                              ; preds = %289
  %296 = load ptr, ptr %2, align 8
  %297 = getelementptr inbounds %struct.png_struct_def, ptr %296, i32 0, i32 13
  %298 = load i8, ptr %297, align 8
  %299 = zext i8 %298 to i32
  %300 = load ptr, ptr %2, align 8
  %301 = getelementptr inbounds %struct.png_struct_def, ptr %300, i32 0, i32 14
  %302 = load i8, ptr %301, align 1
  %303 = zext i8 %302 to i32
  %304 = mul nsw i32 %299, %303
  store i32 %304, ptr %5, align 4
  %305 = load i32, ptr %5, align 4
  %306 = load i32, ptr %3, align 4
  %307 = icmp ugt i32 %305, %306
  br i1 %307, label %308, label %310

308:                                              ; preds = %295
  %309 = load i32, ptr %5, align 4
  store i32 %309, ptr %3, align 4
  br label %310

310:                                              ; preds = %308, %295
  br label %311

311:                                              ; preds = %310, %289
  %312 = load i32, ptr %3, align 4
  %313 = trunc i32 %312 to i8
  %314 = load ptr, ptr %2, align 8
  %315 = getelementptr inbounds %struct.png_struct_def, ptr %314, i32 0, i32 69
  store i8 %313, ptr %315, align 2
  %316 = load ptr, ptr %2, align 8
  %317 = getelementptr inbounds %struct.png_struct_def, ptr %316, i32 0, i32 70
  store i8 0, ptr %317, align 1
  %318 = load ptr, ptr %2, align 8
  %319 = getelementptr inbounds %struct.png_struct_def, ptr %318, i32 0, i32 38
  %320 = load i32, ptr %319, align 4
  %321 = add i32 %320, 7
  %322 = and i32 %321, -8
  %323 = zext i32 %322 to i64
  store i64 %323, ptr %4, align 8
  %324 = load i32, ptr %3, align 4
  %325 = icmp uge i32 %324, 8
  br i1 %325, label %326, label %332

326:                                              ; preds = %311
  %327 = load i64, ptr %4, align 8
  %328 = load i32, ptr %3, align 4
  %329 = zext i32 %328 to i64
  %330 = lshr i64 %329, 3
  %331 = mul i64 %327, %330
  br label %339

332:                                              ; preds = %311
  %333 = load i64, ptr %4, align 8
  %334 = load i32, ptr %3, align 4
  %335 = zext i32 %334 to i64
  %336 = mul i64 %333, %335
  %337 = add i64 %336, 7
  %338 = lshr i64 %337, 3
  br label %339

339:                                              ; preds = %332, %326
  %340 = phi i64 [ %331, %326 ], [ %338, %332 ]
  %341 = add i64 %340, 1
  %342 = load i32, ptr %3, align 4
  %343 = add i32 %342, 7
  %344 = lshr i32 %343, 3
  %345 = zext i32 %344 to i64
  %346 = add i64 %341, %345
  store i64 %346, ptr %4, align 8
  %347 = load i64, ptr %4, align 8
  %348 = add i64 %347, 48
  %349 = load ptr, ptr %2, align 8
  %350 = getelementptr inbounds %struct.png_struct_def, ptr %349, i32 0, i32 143
  %351 = load i64, ptr %350, align 8
  %352 = icmp ugt i64 %348, %351
  br i1 %352, label %353, label %420

353:                                              ; preds = %339
  %354 = load ptr, ptr %2, align 8
  %355 = load ptr, ptr %2, align 8
  %356 = getelementptr inbounds %struct.png_struct_def, ptr %355, i32 0, i32 133
  %357 = load ptr, ptr %356, align 8
  call void @png_free(ptr noundef %354, ptr noundef %357)
  %358 = load ptr, ptr %2, align 8
  %359 = load ptr, ptr %2, align 8
  %360 = getelementptr inbounds %struct.png_struct_def, ptr %359, i32 0, i32 148
  %361 = load ptr, ptr %360, align 8
  call void @png_free(ptr noundef %358, ptr noundef %361)
  %362 = load ptr, ptr %2, align 8
  %363 = getelementptr inbounds %struct.png_struct_def, ptr %362, i32 0, i32 59
  %364 = load i8, ptr %363, align 4
  %365 = zext i8 %364 to i32
  %366 = icmp ne i32 %365, 0
  br i1 %366, label %367, label %374

367:                                              ; preds = %353
  %368 = load ptr, ptr %2, align 8
  %369 = load i64, ptr %4, align 8
  %370 = add i64 %369, 48
  %371 = call noalias ptr @png_calloc(ptr noundef %368, i64 noundef %370)
  %372 = load ptr, ptr %2, align 8
  %373 = getelementptr inbounds %struct.png_struct_def, ptr %372, i32 0, i32 133
  store ptr %371, ptr %373, align 8
  br label %381

374:                                              ; preds = %353
  %375 = load ptr, ptr %2, align 8
  %376 = load i64, ptr %4, align 8
  %377 = add i64 %376, 48
  %378 = call noalias ptr @png_malloc(ptr noundef %375, i64 noundef %377)
  %379 = load ptr, ptr %2, align 8
  %380 = getelementptr inbounds %struct.png_struct_def, ptr %379, i32 0, i32 133
  store ptr %378, ptr %380, align 8
  br label %381

381:                                              ; preds = %374, %367
  %382 = load ptr, ptr %2, align 8
  %383 = load i64, ptr %4, align 8
  %384 = add i64 %383, 48
  %385 = call noalias ptr @png_malloc(ptr noundef %382, i64 noundef %384)
  %386 = load ptr, ptr %2, align 8
  %387 = getelementptr inbounds %struct.png_struct_def, ptr %386, i32 0, i32 148
  store ptr %385, ptr %387, align 8
  %388 = load ptr, ptr %2, align 8
  %389 = getelementptr inbounds %struct.png_struct_def, ptr %388, i32 0, i32 133
  %390 = load ptr, ptr %389, align 8
  %391 = getelementptr inbounds i8, ptr %390, i64 32
  store ptr %391, ptr %6, align 8
  %392 = load ptr, ptr %6, align 8
  %393 = ptrtoint ptr %392 to i64
  %394 = and i64 %393, 15
  store i64 %394, ptr %7, align 8
  %395 = load ptr, ptr %6, align 8
  %396 = load i64, ptr %7, align 8
  %397 = sub i64 0, %396
  %398 = getelementptr inbounds i8, ptr %395, i64 %397
  %399 = getelementptr inbounds i8, ptr %398, i64 -1
  %400 = load ptr, ptr %2, align 8
  %401 = getelementptr inbounds %struct.png_struct_def, ptr %400, i32 0, i32 47
  store ptr %399, ptr %401, align 8
  %402 = load ptr, ptr %2, align 8
  %403 = getelementptr inbounds %struct.png_struct_def, ptr %402, i32 0, i32 148
  %404 = load ptr, ptr %403, align 8
  %405 = getelementptr inbounds i8, ptr %404, i64 32
  store ptr %405, ptr %6, align 8
  %406 = load ptr, ptr %6, align 8
  %407 = ptrtoint ptr %406 to i64
  %408 = and i64 %407, 15
  store i64 %408, ptr %7, align 8
  %409 = load ptr, ptr %6, align 8
  %410 = load i64, ptr %7, align 8
  %411 = sub i64 0, %410
  %412 = getelementptr inbounds i8, ptr %409, i64 %411
  %413 = getelementptr inbounds i8, ptr %412, i64 -1
  %414 = load ptr, ptr %2, align 8
  %415 = getelementptr inbounds %struct.png_struct_def, ptr %414, i32 0, i32 46
  store ptr %413, ptr %415, align 8
  %416 = load i64, ptr %4, align 8
  %417 = add i64 %416, 48
  %418 = load ptr, ptr %2, align 8
  %419 = getelementptr inbounds %struct.png_struct_def, ptr %418, i32 0, i32 143
  store i64 %417, ptr %419, align 8
  br label %420

420:                                              ; preds = %381, %339
  %421 = load ptr, ptr %2, align 8
  %422 = getelementptr inbounds %struct.png_struct_def, ptr %421, i32 0, i32 42
  %423 = load i64, ptr %422, align 8
  %424 = icmp ugt i64 %423, -2
  br i1 %424, label %425, label %427

425:                                              ; preds = %420
  %426 = load ptr, ptr %2, align 8
  call void @png_error(ptr noundef %426, ptr noundef @.str.25) #6
  unreachable

427:                                              ; preds = %420
  %428 = load ptr, ptr %2, align 8
  %429 = getelementptr inbounds %struct.png_struct_def, ptr %428, i32 0, i32 46
  %430 = load ptr, ptr %429, align 8
  %431 = load ptr, ptr %2, align 8
  %432 = getelementptr inbounds %struct.png_struct_def, ptr %431, i32 0, i32 42
  %433 = load i64, ptr %432, align 8
  %434 = add i64 %433, 1
  call void @llvm.memset.p0.i64(ptr align 1 %430, i8 0, i64 %434, i1 false)
  %435 = load ptr, ptr %2, align 8
  %436 = getelementptr inbounds %struct.png_struct_def, ptr %435, i32 0, i32 144
  %437 = load ptr, ptr %436, align 8
  %438 = icmp ne ptr %437, null
  br i1 %438, label %439, label %449

439:                                              ; preds = %427
  %440 = load ptr, ptr %2, align 8
  %441 = getelementptr inbounds %struct.png_struct_def, ptr %440, i32 0, i32 144
  %442 = load ptr, ptr %441, align 8
  store ptr %442, ptr %8, align 8
  %443 = load ptr, ptr %2, align 8
  %444 = getelementptr inbounds %struct.png_struct_def, ptr %443, i32 0, i32 145
  store i64 0, ptr %444, align 8
  %445 = load ptr, ptr %2, align 8
  %446 = getelementptr inbounds %struct.png_struct_def, ptr %445, i32 0, i32 144
  store ptr null, ptr %446, align 8
  %447 = load ptr, ptr %2, align 8
  %448 = load ptr, ptr %8, align 8
  call void @png_free(ptr noundef %447, ptr noundef %448)
  br label %449

449:                                              ; preds = %439, %427
  %450 = load ptr, ptr %2, align 8
  %451 = call i32 @png_inflate_claim(ptr noundef %450, i32 noundef 1229209940)
  %452 = icmp ne i32 %451, 0
  br i1 %452, label %453, label %459

453:                                              ; preds = %449
  %454 = load ptr, ptr %2, align 8
  %455 = load ptr, ptr %2, align 8
  %456 = getelementptr inbounds %struct.png_struct_def, ptr %455, i32 0, i32 19
  %457 = getelementptr inbounds %struct.z_stream_s, ptr %456, i32 0, i32 6
  %458 = load ptr, ptr %457, align 8
  call void @png_error(ptr noundef %454, ptr noundef %458) #6
  unreachable

459:                                              ; preds = %449
  %460 = load ptr, ptr %2, align 8
  %461 = getelementptr inbounds %struct.png_struct_def, ptr %460, i32 0, i32 16
  %462 = load i32, ptr %461, align 8
  %463 = or i32 %462, 64
  store i32 %463, ptr %461, align 8
  ret void
}

declare void @png_init_read_transformations(ptr noundef) #2

declare noalias ptr @png_calloc(ptr noundef, i64 noundef) #2

declare noalias ptr @png_malloc(ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_inflate_claim(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca [64 x i8], align 16
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.png_struct_def, ptr %8, i32 0, i32 18
  %10 = load i32, ptr %9, align 8
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %48

12:                                               ; preds = %2
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.png_struct_def, ptr %13, i32 0, i32 18
  %15 = load i32, ptr %14, align 8
  %16 = lshr i32 %15, 24
  %17 = and i32 %16, 255
  %18 = trunc i32 %17 to i8
  %19 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  %20 = getelementptr inbounds i8, ptr %19, i64 0
  store i8 %18, ptr %20, align 16
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.png_struct_def, ptr %21, i32 0, i32 18
  %23 = load i32, ptr %22, align 8
  %24 = lshr i32 %23, 16
  %25 = and i32 %24, 255
  %26 = trunc i32 %25 to i8
  %27 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  %28 = getelementptr inbounds i8, ptr %27, i64 1
  store i8 %26, ptr %28, align 1
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.png_struct_def, ptr %29, i32 0, i32 18
  %31 = load i32, ptr %30, align 8
  %32 = lshr i32 %31, 8
  %33 = and i32 %32, 255
  %34 = trunc i32 %33 to i8
  %35 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  %36 = getelementptr inbounds i8, ptr %35, i64 2
  store i8 %34, ptr %36, align 2
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds %struct.png_struct_def, ptr %37, i32 0, i32 18
  %39 = load i32, ptr %38, align 8
  %40 = and i32 %39, 255
  %41 = trunc i32 %40 to i8
  %42 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  %43 = getelementptr inbounds i8, ptr %42, i64 3
  store i8 %41, ptr %43, align 1
  %44 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  %45 = call i64 @png_safecat(ptr noundef %44, i64 noundef 64, i64 noundef 4, ptr noundef @.str.57)
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds [64 x i8], ptr %5, i64 0, i64 0
  call void @png_chunk_error(ptr noundef %46, ptr noundef %47) #6
  unreachable

48:                                               ; preds = %2
  store i32 0, ptr %7, align 4
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds %struct.png_struct_def, ptr %49, i32 0, i32 115
  %51 = load i32, ptr %50, align 8
  %52 = lshr i32 %51, 2
  %53 = and i32 %52, 3
  %54 = icmp eq i32 %53, 3
  br i1 %54, label %55, label %58

55:                                               ; preds = %48
  store i32 15, ptr %7, align 4
  %56 = load ptr, ptr %3, align 8
  %57 = getelementptr inbounds %struct.png_struct_def, ptr %56, i32 0, i32 71
  store i8 0, ptr %57, align 8
  br label %61

58:                                               ; preds = %48
  %59 = load ptr, ptr %3, align 8
  %60 = getelementptr inbounds %struct.png_struct_def, ptr %59, i32 0, i32 71
  store i8 1, ptr %60, align 8
  br label %61

61:                                               ; preds = %58, %55
  %62 = load ptr, ptr %3, align 8
  %63 = getelementptr inbounds %struct.png_struct_def, ptr %62, i32 0, i32 19
  %64 = getelementptr inbounds %struct.z_stream_s, ptr %63, i32 0, i32 0
  store ptr null, ptr %64, align 8
  %65 = load ptr, ptr %3, align 8
  %66 = getelementptr inbounds %struct.png_struct_def, ptr %65, i32 0, i32 19
  %67 = getelementptr inbounds %struct.z_stream_s, ptr %66, i32 0, i32 1
  store i32 0, ptr %67, align 8
  %68 = load ptr, ptr %3, align 8
  %69 = getelementptr inbounds %struct.png_struct_def, ptr %68, i32 0, i32 19
  %70 = getelementptr inbounds %struct.z_stream_s, ptr %69, i32 0, i32 3
  store ptr null, ptr %70, align 8
  %71 = load ptr, ptr %3, align 8
  %72 = getelementptr inbounds %struct.png_struct_def, ptr %71, i32 0, i32 19
  %73 = getelementptr inbounds %struct.z_stream_s, ptr %72, i32 0, i32 4
  store i32 0, ptr %73, align 8
  %74 = load ptr, ptr %3, align 8
  %75 = getelementptr inbounds %struct.png_struct_def, ptr %74, i32 0, i32 16
  %76 = load i32, ptr %75, align 8
  %77 = and i32 %76, 2
  %78 = icmp ne i32 %77, 0
  br i1 %78, label %79, label %84

79:                                               ; preds = %61
  %80 = load ptr, ptr %3, align 8
  %81 = getelementptr inbounds %struct.png_struct_def, ptr %80, i32 0, i32 19
  %82 = load i32, ptr %7, align 4
  %83 = call i32 @inflateReset2(ptr noundef %81, i32 noundef %82)
  store i32 %83, ptr %6, align 4
  br label %97

84:                                               ; preds = %61
  %85 = load ptr, ptr %3, align 8
  %86 = getelementptr inbounds %struct.png_struct_def, ptr %85, i32 0, i32 19
  %87 = load i32, ptr %7, align 4
  %88 = call i32 @inflateInit2_(ptr noundef %86, i32 noundef %87, ptr noundef @.str.58, i32 noundef 112)
  store i32 %88, ptr %6, align 4
  %89 = load i32, ptr %6, align 4
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %91, label %96

91:                                               ; preds = %84
  %92 = load ptr, ptr %3, align 8
  %93 = getelementptr inbounds %struct.png_struct_def, ptr %92, i32 0, i32 16
  %94 = load i32, ptr %93, align 8
  %95 = or i32 %94, 2
  store i32 %95, ptr %93, align 8
  br label %96

96:                                               ; preds = %91, %84
  br label %97

97:                                               ; preds = %96, %79
  %98 = load i32, ptr %6, align 4
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %104

100:                                              ; preds = %97
  %101 = load i32, ptr %4, align 4
  %102 = load ptr, ptr %3, align 8
  %103 = getelementptr inbounds %struct.png_struct_def, ptr %102, i32 0, i32 18
  store i32 %101, ptr %103, align 8
  br label %107

104:                                              ; preds = %97
  %105 = load ptr, ptr %3, align 8
  %106 = load i32, ptr %6, align 4
  call void @png_zstream_error(ptr noundef %105, i32 noundef %106)
  br label %107

107:                                              ; preds = %104, %100
  %108 = load i32, ptr %6, align 4
  ret i32 %108
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_crc_error(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca [4 x i8], align 1
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 1, ptr %8, align 4
  %9 = load i32, ptr %5, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %18, label %11

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.png_struct_def, ptr %12, i32 0, i32 45
  %14 = load i32, ptr %13, align 8
  %15 = lshr i32 %14, 29
  %16 = and i32 1, %15
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %26

18:                                               ; preds = %11, %2
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.png_struct_def, ptr %19, i32 0, i32 16
  %21 = load i32, ptr %20, align 8
  %22 = and i32 %21, 768
  %23 = icmp eq i32 %22, 768
  br i1 %23, label %24, label %25

24:                                               ; preds = %18
  store i32 0, ptr %8, align 4
  br label %25

25:                                               ; preds = %24, %18
  br label %34

26:                                               ; preds = %11
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.png_struct_def, ptr %27, i32 0, i32 16
  %29 = load i32, ptr %28, align 8
  %30 = and i32 %29, 2048
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

32:                                               ; preds = %26
  store i32 0, ptr %8, align 4
  br label %33

33:                                               ; preds = %32, %26
  br label %34

34:                                               ; preds = %33, %25
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds %struct.png_struct_def, ptr %35, i32 0, i32 147
  store i32 129, ptr %36, align 4
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  call void @png_read_data(ptr noundef %37, ptr noundef %38, i64 noundef 4)
  %39 = load i32, ptr %8, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %69

41:                                               ; preds = %34
  %42 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %43 = load i8, ptr %42, align 1
  %44 = zext i8 %43 to i32
  %45 = shl i32 %44, 24
  %46 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %47 = getelementptr inbounds i8, ptr %46, i64 1
  %48 = load i8, ptr %47, align 1
  %49 = zext i8 %48 to i32
  %50 = shl i32 %49, 16
  %51 = add i32 %45, %50
  %52 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %53 = getelementptr inbounds i8, ptr %52, i64 2
  %54 = load i8, ptr %53, align 1
  %55 = zext i8 %54 to i32
  %56 = shl i32 %55, 8
  %57 = add i32 %51, %56
  %58 = getelementptr inbounds [4 x i8], ptr %6, i64 0, i64 0
  %59 = getelementptr inbounds i8, ptr %58, i64 3
  %60 = load i8, ptr %59, align 1
  %61 = zext i8 %60 to i32
  %62 = add i32 %57, %61
  store i32 %62, ptr %7, align 4
  %63 = load i32, ptr %7, align 4
  %64 = load ptr, ptr %4, align 8
  %65 = getelementptr inbounds %struct.png_struct_def, ptr %64, i32 0, i32 52
  %66 = load i32, ptr %65, align 4
  %67 = icmp ne i32 %63, %66
  %68 = zext i1 %67 to i32
  store i32 %68, ptr %3, align 4
  br label %70

69:                                               ; preds = %34
  store i32 0, ptr %3, align 4
  br label %70

70:                                               ; preds = %69, %41
  %71 = load i32, ptr %3, align 4
  ret i32 %71
}

declare noalias ptr @png_malloc_warn(ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_IHDR(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca [13 x i8], align 1
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds %struct.png_struct_def, ptr %15, i32 0, i32 15
  %17 = load i32, ptr %16, align 4
  %18 = or i32 %17, 1
  store i32 %18, ptr %16, align 4
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds [13 x i8], ptr %7, i64 0, i64 0
  call void @png_crc_read(ptr noundef %19, ptr noundef %20, i32 noundef 13)
  %21 = load ptr, ptr %4, align 8
  %22 = call i32 @png_crc_finish(ptr noundef %21, i32 noundef 0)
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds [13 x i8], ptr %7, i64 0, i64 0
  %25 = call i32 @png_get_uint_31(ptr noundef %23, ptr noundef %24)
  store i32 %25, ptr %8, align 4
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds [13 x i8], ptr %7, i64 0, i64 0
  %28 = getelementptr inbounds i8, ptr %27, i64 4
  %29 = call i32 @png_get_uint_31(ptr noundef %26, ptr noundef %28)
  store i32 %29, ptr %9, align 4
  %30 = getelementptr inbounds [13 x i8], ptr %7, i64 0, i64 8
  %31 = load i8, ptr %30, align 1
  %32 = zext i8 %31 to i32
  store i32 %32, ptr %10, align 4
  %33 = getelementptr inbounds [13 x i8], ptr %7, i64 0, i64 9
  %34 = load i8, ptr %33, align 1
  %35 = zext i8 %34 to i32
  store i32 %35, ptr %11, align 4
  %36 = getelementptr inbounds [13 x i8], ptr %7, i64 0, i64 10
  %37 = load i8, ptr %36, align 1
  %38 = zext i8 %37 to i32
  store i32 %38, ptr %12, align 4
  %39 = getelementptr inbounds [13 x i8], ptr %7, i64 0, i64 11
  %40 = load i8, ptr %39, align 1
  %41 = zext i8 %40 to i32
  store i32 %41, ptr %13, align 4
  %42 = getelementptr inbounds [13 x i8], ptr %7, i64 0, i64 12
  %43 = load i8, ptr %42, align 1
  %44 = zext i8 %43 to i32
  store i32 %44, ptr %14, align 4
  %45 = load i32, ptr %8, align 4
  %46 = load ptr, ptr %4, align 8
  %47 = getelementptr inbounds %struct.png_struct_def, ptr %46, i32 0, i32 38
  store i32 %45, ptr %47, align 4
  %48 = load i32, ptr %9, align 4
  %49 = load ptr, ptr %4, align 8
  %50 = getelementptr inbounds %struct.png_struct_def, ptr %49, i32 0, i32 39
  store i32 %48, ptr %50, align 8
  %51 = load i32, ptr %10, align 4
  %52 = trunc i32 %51 to i8
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds %struct.png_struct_def, ptr %53, i32 0, i32 63
  store i8 %52, ptr %54, align 8
  %55 = load i32, ptr %14, align 4
  %56 = trunc i32 %55 to i8
  %57 = load ptr, ptr %4, align 8
  %58 = getelementptr inbounds %struct.png_struct_def, ptr %57, i32 0, i32 59
  store i8 %56, ptr %58, align 4
  %59 = load i32, ptr %11, align 4
  %60 = trunc i32 %59 to i8
  %61 = load ptr, ptr %4, align 8
  %62 = getelementptr inbounds %struct.png_struct_def, ptr %61, i32 0, i32 62
  store i8 %60, ptr %62, align 1
  %63 = load i32, ptr %13, align 4
  %64 = trunc i32 %63 to i8
  %65 = load ptr, ptr %4, align 8
  %66 = getelementptr inbounds %struct.png_struct_def, ptr %65, i32 0, i32 129
  store i8 %64, ptr %66, align 4
  %67 = load i32, ptr %12, align 4
  %68 = trunc i32 %67 to i8
  %69 = load ptr, ptr %4, align 8
  %70 = getelementptr inbounds %struct.png_struct_def, ptr %69, i32 0, i32 137
  store i8 %68, ptr %70, align 8
  %71 = load ptr, ptr %4, align 8
  %72 = getelementptr inbounds %struct.png_struct_def, ptr %71, i32 0, i32 62
  %73 = load i8, ptr %72, align 1
  %74 = zext i8 %73 to i32
  switch i32 %74, label %75 [
    i32 0, label %76
    i32 3, label %76
    i32 2, label %79
    i32 4, label %82
    i32 6, label %85
  ]

75:                                               ; preds = %3
  br label %76

76:                                               ; preds = %3, %3, %75
  %77 = load ptr, ptr %4, align 8
  %78 = getelementptr inbounds %struct.png_struct_def, ptr %77, i32 0, i32 66
  store i8 1, ptr %78, align 1
  br label %88

79:                                               ; preds = %3
  %80 = load ptr, ptr %4, align 8
  %81 = getelementptr inbounds %struct.png_struct_def, ptr %80, i32 0, i32 66
  store i8 3, ptr %81, align 1
  br label %88

82:                                               ; preds = %3
  %83 = load ptr, ptr %4, align 8
  %84 = getelementptr inbounds %struct.png_struct_def, ptr %83, i32 0, i32 66
  store i8 2, ptr %84, align 1
  br label %88

85:                                               ; preds = %3
  %86 = load ptr, ptr %4, align 8
  %87 = getelementptr inbounds %struct.png_struct_def, ptr %86, i32 0, i32 66
  store i8 4, ptr %87, align 1
  br label %88

88:                                               ; preds = %85, %82, %79, %76
  %89 = load ptr, ptr %4, align 8
  %90 = getelementptr inbounds %struct.png_struct_def, ptr %89, i32 0, i32 63
  %91 = load i8, ptr %90, align 8
  %92 = zext i8 %91 to i32
  %93 = load ptr, ptr %4, align 8
  %94 = getelementptr inbounds %struct.png_struct_def, ptr %93, i32 0, i32 66
  %95 = load i8, ptr %94, align 1
  %96 = zext i8 %95 to i32
  %97 = mul nsw i32 %92, %96
  %98 = trunc i32 %97 to i8
  %99 = load ptr, ptr %4, align 8
  %100 = getelementptr inbounds %struct.png_struct_def, ptr %99, i32 0, i32 65
  store i8 %98, ptr %100, align 2
  %101 = load ptr, ptr %4, align 8
  %102 = getelementptr inbounds %struct.png_struct_def, ptr %101, i32 0, i32 65
  %103 = load i8, ptr %102, align 2
  %104 = zext i8 %103 to i32
  %105 = icmp sge i32 %104, 8
  br i1 %105, label %106, label %117

106:                                              ; preds = %88
  %107 = load ptr, ptr %4, align 8
  %108 = getelementptr inbounds %struct.png_struct_def, ptr %107, i32 0, i32 38
  %109 = load i32, ptr %108, align 4
  %110 = zext i32 %109 to i64
  %111 = load ptr, ptr %4, align 8
  %112 = getelementptr inbounds %struct.png_struct_def, ptr %111, i32 0, i32 65
  %113 = load i8, ptr %112, align 2
  %114 = zext i8 %113 to i64
  %115 = lshr i64 %114, 3
  %116 = mul i64 %110, %115
  br label %129

117:                                              ; preds = %88
  %118 = load ptr, ptr %4, align 8
  %119 = getelementptr inbounds %struct.png_struct_def, ptr %118, i32 0, i32 38
  %120 = load i32, ptr %119, align 4
  %121 = zext i32 %120 to i64
  %122 = load ptr, ptr %4, align 8
  %123 = getelementptr inbounds %struct.png_struct_def, ptr %122, i32 0, i32 65
  %124 = load i8, ptr %123, align 2
  %125 = zext i8 %124 to i64
  %126 = mul i64 %121, %125
  %127 = add i64 %126, 7
  %128 = lshr i64 %127, 3
  br label %129

129:                                              ; preds = %117, %106
  %130 = phi i64 [ %116, %106 ], [ %128, %117 ]
  %131 = load ptr, ptr %4, align 8
  %132 = getelementptr inbounds %struct.png_struct_def, ptr %131, i32 0, i32 42
  store i64 %130, ptr %132, align 8
  %133 = load ptr, ptr %4, align 8
  %134 = load ptr, ptr %5, align 8
  %135 = load i32, ptr %8, align 4
  %136 = load i32, ptr %9, align 4
  %137 = load i32, ptr %10, align 4
  %138 = load i32, ptr %11, align 4
  %139 = load i32, ptr %14, align 4
  %140 = load i32, ptr %12, align 4
  %141 = load i32, ptr %13, align 4
  call void @png_set_IHDR(ptr noundef %133, ptr noundef %134, i32 noundef %135, i32 noundef %136, i32 noundef %137, i32 noundef %138, i32 noundef %139, i32 noundef %140, i32 noundef %141)
  ret i32 3
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_PLTE(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca [768 x i8], align 16
  %14 = alloca [256 x %struct.png_color_struct], align 16
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr null, ptr %8, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds %struct.png_struct_def, ptr %15, i32 0, i32 15
  %17 = load i32, ptr %16, align 4
  %18 = and i32 %17, 2
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %21

20:                                               ; preds = %3
  store ptr @.str.13, ptr %8, align 8
  br label %153

21:                                               ; preds = %3
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds %struct.png_struct_def, ptr %22, i32 0, i32 15
  %24 = load i32, ptr %23, align 4
  %25 = and i32 %24, 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %21
  store ptr @.str.12, ptr %8, align 8
  br label %152

28:                                               ; preds = %21
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds %struct.png_struct_def, ptr %29, i32 0, i32 62
  %31 = load i8, ptr %30, align 1
  %32 = zext i8 %31 to i32
  %33 = and i32 %32, 2
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %28
  store ptr @.str.29, ptr %8, align 8
  br label %151

36:                                               ; preds = %28
  %37 = load i32, ptr %7, align 4
  %38 = icmp ugt i32 %37, 768
  br i1 %38, label %43, label %39

39:                                               ; preds = %36
  %40 = load i32, ptr %7, align 4
  %41 = urem i32 %40, 3
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %44

43:                                               ; preds = %39, %36
  store ptr @.str.30, ptr %8, align 8
  br label %150

44:                                               ; preds = %39
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds %struct.png_struct_def, ptr %45, i32 0, i32 62
  %47 = load i8, ptr %46, align 1
  %48 = zext i8 %47 to i32
  %49 = icmp ne i32 %48, 3
  br i1 %49, label %50, label %63

50:                                               ; preds = %44
  %51 = load ptr, ptr %5, align 8
  %52 = getelementptr inbounds %struct.png_struct_def, ptr %51, i32 0, i32 37
  %53 = load i32, ptr %52, align 8
  %54 = and i32 %53, 67108864
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %62, label %56

56:                                               ; preds = %50
  %57 = load ptr, ptr %5, align 8
  %58 = getelementptr inbounds %struct.png_struct_def, ptr %57, i32 0, i32 37
  %59 = load i32, ptr %58, align 8
  %60 = and i32 %59, 32
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %63

62:                                               ; preds = %56, %50
  store ptr @.str.12, ptr %8, align 8
  br label %149

63:                                               ; preds = %56, %44
  %64 = load ptr, ptr %5, align 8
  %65 = getelementptr inbounds %struct.png_struct_def, ptr %64, i32 0, i32 62
  %66 = load i8, ptr %65, align 1
  %67 = zext i8 %66 to i32
  %68 = icmp eq i32 %67, 3
  br i1 %68, label %69, label %75

69:                                               ; preds = %63
  %70 = load ptr, ptr %5, align 8
  %71 = getelementptr inbounds %struct.png_struct_def, ptr %70, i32 0, i32 63
  %72 = load i8, ptr %71, align 8
  %73 = zext i8 %72 to i32
  %74 = shl i32 1, %73
  br label %76

75:                                               ; preds = %63
  br label %76

76:                                               ; preds = %75, %69
  %77 = phi i32 [ %74, %69 ], [ 256, %75 ]
  store i32 %77, ptr %9, align 4
  %78 = load i32, ptr %7, align 4
  %79 = load i32, ptr %9, align 4
  %80 = mul i32 3, %79
  %81 = icmp ugt i32 %78, %80
  br i1 %81, label %82, label %84

82:                                               ; preds = %76
  %83 = load i32, ptr %9, align 4
  br label %87

84:                                               ; preds = %76
  %85 = load i32, ptr %7, align 4
  %86 = udiv i32 %85, 3
  br label %87

87:                                               ; preds = %84, %82
  %88 = phi i32 [ %83, %82 ], [ %86, %84 ]
  store i32 %88, ptr %10, align 4
  %89 = load ptr, ptr %5, align 8
  %90 = getelementptr inbounds [768 x i8], ptr %13, i64 0, i64 0
  %91 = load i32, ptr %10, align 4
  %92 = mul i32 %91, 3
  call void @png_crc_read(ptr noundef %89, ptr noundef %90, i32 noundef %92)
  %93 = load ptr, ptr %5, align 8
  %94 = load i32, ptr %7, align 4
  %95 = load i32, ptr %10, align 4
  %96 = mul i32 3, %95
  %97 = sub i32 %94, %96
  %98 = load ptr, ptr %5, align 8
  %99 = getelementptr inbounds %struct.png_struct_def, ptr %98, i32 0, i32 62
  %100 = load i8, ptr %99, align 1
  %101 = zext i8 %100 to i32
  %102 = icmp ne i32 %101, 3
  %103 = zext i1 %102 to i32
  %104 = call i32 @png_crc_finish_critical(ptr noundef %93, i32 noundef %97, i32 noundef %103)
  store i32 0, ptr %11, align 4
  store i32 0, ptr %12, align 4
  br label %105

105:                                              ; preds = %137, %87
  %106 = load i32, ptr %11, align 4
  %107 = load i32, ptr %10, align 4
  %108 = icmp ult i32 %106, %107
  br i1 %108, label %109, label %140

109:                                              ; preds = %105
  %110 = load i32, ptr %12, align 4
  %111 = add i32 %110, 1
  store i32 %111, ptr %12, align 4
  %112 = zext i32 %110 to i64
  %113 = getelementptr inbounds [768 x i8], ptr %13, i64 0, i64 %112
  %114 = load i8, ptr %113, align 1
  %115 = load i32, ptr %11, align 4
  %116 = zext i32 %115 to i64
  %117 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %14, i64 0, i64 %116
  %118 = getelementptr inbounds %struct.png_color_struct, ptr %117, i32 0, i32 0
  store i8 %114, ptr %118, align 1
  %119 = load i32, ptr %12, align 4
  %120 = add i32 %119, 1
  store i32 %120, ptr %12, align 4
  %121 = zext i32 %119 to i64
  %122 = getelementptr inbounds [768 x i8], ptr %13, i64 0, i64 %121
  %123 = load i8, ptr %122, align 1
  %124 = load i32, ptr %11, align 4
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %14, i64 0, i64 %125
  %127 = getelementptr inbounds %struct.png_color_struct, ptr %126, i32 0, i32 1
  store i8 %123, ptr %127, align 1
  %128 = load i32, ptr %12, align 4
  %129 = add i32 %128, 1
  store i32 %129, ptr %12, align 4
  %130 = zext i32 %128 to i64
  %131 = getelementptr inbounds [768 x i8], ptr %13, i64 0, i64 %130
  %132 = load i8, ptr %131, align 1
  %133 = load i32, ptr %11, align 4
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %14, i64 0, i64 %134
  %136 = getelementptr inbounds %struct.png_color_struct, ptr %135, i32 0, i32 2
  store i8 %132, ptr %136, align 1
  br label %137

137:                                              ; preds = %109
  %138 = load i32, ptr %11, align 4
  %139 = add i32 %138, 1
  store i32 %139, ptr %11, align 4
  br label %105, !llvm.loop !25

140:                                              ; preds = %105
  %141 = load ptr, ptr %5, align 8
  %142 = getelementptr inbounds %struct.png_struct_def, ptr %141, i32 0, i32 15
  %143 = load i32, ptr %142, align 4
  %144 = or i32 %143, 2
  store i32 %144, ptr %142, align 4
  %145 = load ptr, ptr %5, align 8
  %146 = load ptr, ptr %6, align 8
  %147 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %14, i64 0, i64 0
  %148 = load i32, ptr %10, align 4
  call void @png_set_PLTE(ptr noundef %145, ptr noundef %146, ptr noundef %147, i32 noundef %148)
  store i32 3, ptr %4, align 4
  br label %176

149:                                              ; preds = %62
  br label %150

150:                                              ; preds = %149, %43
  br label %151

151:                                              ; preds = %150, %35
  br label %152

152:                                              ; preds = %151, %27
  br label %153

153:                                              ; preds = %152, %20
  %154 = load ptr, ptr %5, align 8
  %155 = getelementptr inbounds %struct.png_struct_def, ptr %154, i32 0, i32 62
  %156 = load i8, ptr %155, align 1
  %157 = zext i8 %156 to i32
  %158 = icmp eq i32 %157, 3
  br i1 %158, label %159, label %165

159:                                              ; preds = %153
  %160 = load ptr, ptr %5, align 8
  %161 = load i32, ptr %7, align 4
  %162 = call i32 @png_crc_finish(ptr noundef %160, i32 noundef %161)
  %163 = load ptr, ptr %5, align 8
  %164 = load ptr, ptr %8, align 8
  call void @png_chunk_error(ptr noundef %163, ptr noundef %164) #6
  unreachable

165:                                              ; preds = %153
  %166 = load ptr, ptr %5, align 8
  %167 = load i32, ptr %7, align 4
  %168 = call i32 @png_crc_finish_critical(ptr noundef %166, i32 noundef %167, i32 noundef 1)
  %169 = load ptr, ptr %5, align 8
  %170 = load ptr, ptr %8, align 8
  call void @png_chunk_benign_error(ptr noundef %169, ptr noundef %170)
  br label %171

171:                                              ; preds = %165
  %172 = load ptr, ptr %8, align 8
  %173 = icmp ne ptr %172, null
  %174 = zext i1 %173 to i64
  %175 = select i1 %173, i32 0, i32 0
  store i32 %175, ptr %4, align 4
  br label %176

176:                                              ; preds = %171, %140
  %177 = load i32, ptr %4, align 4
  ret i32 %177
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_IEND(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds %struct.png_struct_def, ptr %7, i32 0, i32 15
  %9 = load i32, ptr %8, align 4
  %10 = or i32 %9, 24
  store i32 %10, ptr %8, align 4
  %11 = load i32, ptr %6, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %3
  %14 = load ptr, ptr %4, align 8
  call void @png_chunk_benign_error(ptr noundef %14, ptr noundef @.str.30)
  br label %15

15:                                               ; preds = %13, %3
  %16 = load ptr, ptr %4, align 8
  %17 = load i32, ptr %6, align 4
  %18 = call i32 @png_crc_finish_critical(ptr noundef %16, i32 noundef %17, i32 noundef 1)
  ret i32 3
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_bKGD(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [6 x i8], align 1
  %10 = alloca %struct.png_color_16_struct, align 2
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.png_struct_def, ptr %11, i32 0, i32 62
  %13 = load i8, ptr %12, align 1
  %14 = zext i8 %13 to i32
  %15 = icmp eq i32 %14, 3
  br i1 %15, label %16, label %28

16:                                               ; preds = %3
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.png_struct_def, ptr %17, i32 0, i32 15
  %19 = load i32, ptr %18, align 4
  %20 = and i32 %19, 2
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %27

22:                                               ; preds = %16
  %23 = load ptr, ptr %5, align 8
  %24 = load i32, ptr %7, align 4
  %25 = call i32 @png_crc_finish(ptr noundef %23, i32 noundef %24)
  %26 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %26, ptr noundef @.str.12)
  store i32 0, ptr %4, align 4
  br label %239

27:                                               ; preds = %16
  store i32 1, ptr %8, align 4
  br label %38

28:                                               ; preds = %3
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds %struct.png_struct_def, ptr %29, i32 0, i32 62
  %31 = load i8, ptr %30, align 1
  %32 = zext i8 %31 to i32
  %33 = and i32 %32, 2
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %28
  store i32 6, ptr %8, align 4
  br label %37

36:                                               ; preds = %28
  store i32 2, ptr %8, align 4
  br label %37

37:                                               ; preds = %36, %35
  br label %38

38:                                               ; preds = %37, %27
  %39 = load i32, ptr %7, align 4
  %40 = load i32, ptr %8, align 4
  %41 = icmp ne i32 %39, %40
  br i1 %41, label %42, label %47

42:                                               ; preds = %38
  %43 = load ptr, ptr %5, align 8
  %44 = load i32, ptr %7, align 4
  %45 = call i32 @png_crc_finish(ptr noundef %43, i32 noundef %44)
  %46 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %46, ptr noundef @.str.30)
  store i32 0, ptr %4, align 4
  br label %239

47:                                               ; preds = %38
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %50 = load i32, ptr %8, align 4
  call void @png_crc_read(ptr noundef %48, ptr noundef %49, i32 noundef %50)
  %51 = load ptr, ptr %5, align 8
  %52 = call i32 @png_crc_finish(ptr noundef %51, i32 noundef 0)
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %55

54:                                               ; preds = %47
  store i32 0, ptr %4, align 4
  br label %239

55:                                               ; preds = %47
  %56 = load ptr, ptr %5, align 8
  %57 = getelementptr inbounds %struct.png_struct_def, ptr %56, i32 0, i32 62
  %58 = load i8, ptr %57, align 1
  %59 = zext i8 %58 to i32
  %60 = icmp eq i32 %59, 3
  br i1 %60, label %61, label %124

61:                                               ; preds = %55
  %62 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %63 = load i8, ptr %62, align 1
  %64 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 0
  store i8 %63, ptr %64, align 2
  %65 = load ptr, ptr %6, align 8
  %66 = icmp ne ptr %65, null
  br i1 %66, label %67, label %118

67:                                               ; preds = %61
  %68 = load ptr, ptr %6, align 8
  %69 = getelementptr inbounds %struct.png_info_def, ptr %68, i32 0, i32 5
  %70 = load i16, ptr %69, align 8
  %71 = zext i16 %70 to i32
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %118

73:                                               ; preds = %67
  %74 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %75 = load i8, ptr %74, align 1
  %76 = zext i8 %75 to i32
  %77 = load ptr, ptr %6, align 8
  %78 = getelementptr inbounds %struct.png_info_def, ptr %77, i32 0, i32 5
  %79 = load i16, ptr %78, align 8
  %80 = zext i16 %79 to i32
  %81 = icmp sge i32 %76, %80
  br i1 %81, label %82, label %84

82:                                               ; preds = %73
  %83 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %83, ptr noundef @.str.31)
  store i32 0, ptr %4, align 4
  br label %239

84:                                               ; preds = %73
  %85 = load ptr, ptr %5, align 8
  %86 = getelementptr inbounds %struct.png_struct_def, ptr %85, i32 0, i32 53
  %87 = load ptr, ptr %86, align 8
  %88 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %89 = load i8, ptr %88, align 1
  %90 = zext i8 %89 to i64
  %91 = getelementptr inbounds %struct.png_color_struct, ptr %87, i64 %90
  %92 = getelementptr inbounds %struct.png_color_struct, ptr %91, i32 0, i32 0
  %93 = load i8, ptr %92, align 1
  %94 = zext i8 %93 to i16
  %95 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 1
  store i16 %94, ptr %95, align 2
  %96 = load ptr, ptr %5, align 8
  %97 = getelementptr inbounds %struct.png_struct_def, ptr %96, i32 0, i32 53
  %98 = load ptr, ptr %97, align 8
  %99 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %100 = load i8, ptr %99, align 1
  %101 = zext i8 %100 to i64
  %102 = getelementptr inbounds %struct.png_color_struct, ptr %98, i64 %101
  %103 = getelementptr inbounds %struct.png_color_struct, ptr %102, i32 0, i32 1
  %104 = load i8, ptr %103, align 1
  %105 = zext i8 %104 to i16
  %106 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 2
  store i16 %105, ptr %106, align 2
  %107 = load ptr, ptr %5, align 8
  %108 = getelementptr inbounds %struct.png_struct_def, ptr %107, i32 0, i32 53
  %109 = load ptr, ptr %108, align 8
  %110 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %111 = load i8, ptr %110, align 1
  %112 = zext i8 %111 to i64
  %113 = getelementptr inbounds %struct.png_color_struct, ptr %109, i64 %112
  %114 = getelementptr inbounds %struct.png_color_struct, ptr %113, i32 0, i32 2
  %115 = load i8, ptr %114, align 1
  %116 = zext i8 %115 to i16
  %117 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 3
  store i16 %116, ptr %117, align 2
  br label %122

118:                                              ; preds = %67, %61
  %119 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 3
  store i16 0, ptr %119, align 2
  %120 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 2
  store i16 0, ptr %120, align 2
  %121 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 1
  store i16 0, ptr %121, align 2
  br label %122

122:                                              ; preds = %118, %84
  %123 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 4
  store i16 0, ptr %123, align 2
  br label %236

124:                                              ; preds = %55
  %125 = load ptr, ptr %5, align 8
  %126 = getelementptr inbounds %struct.png_struct_def, ptr %125, i32 0, i32 62
  %127 = load i8, ptr %126, align 1
  %128 = zext i8 %127 to i32
  %129 = and i32 %128, 2
  %130 = icmp eq i32 %129, 0
  br i1 %130, label %131, label %171

131:                                              ; preds = %124
  %132 = load ptr, ptr %5, align 8
  %133 = getelementptr inbounds %struct.png_struct_def, ptr %132, i32 0, i32 63
  %134 = load i8, ptr %133, align 8
  %135 = zext i8 %134 to i32
  %136 = icmp sle i32 %135, 8
  br i1 %136, label %137, label %155

137:                                              ; preds = %131
  %138 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %139 = load i8, ptr %138, align 1
  %140 = zext i8 %139 to i32
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %152, label %142

142:                                              ; preds = %137
  %143 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 1
  %144 = load i8, ptr %143, align 1
  %145 = zext i8 %144 to i32
  %146 = load ptr, ptr %5, align 8
  %147 = getelementptr inbounds %struct.png_struct_def, ptr %146, i32 0, i32 63
  %148 = load i8, ptr %147, align 8
  %149 = zext i8 %148 to i32
  %150 = shl i32 1, %149
  %151 = icmp uge i32 %145, %150
  br i1 %151, label %152, label %154

152:                                              ; preds = %142, %137
  %153 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %153, ptr noundef @.str.32)
  store i32 0, ptr %4, align 4
  br label %239

154:                                              ; preds = %142
  br label %155

155:                                              ; preds = %154, %131
  %156 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 0
  store i8 0, ptr %156, align 2
  %157 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %158 = load i8, ptr %157, align 1
  %159 = zext i8 %158 to i32
  %160 = shl i32 %159, 8
  %161 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %162 = getelementptr inbounds i8, ptr %161, i64 1
  %163 = load i8, ptr %162, align 1
  %164 = zext i8 %163 to i32
  %165 = add i32 %160, %164
  %166 = trunc i32 %165 to i16
  %167 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 4
  store i16 %166, ptr %167, align 2
  %168 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 3
  store i16 %166, ptr %168, align 2
  %169 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 2
  store i16 %166, ptr %169, align 2
  %170 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 1
  store i16 %166, ptr %170, align 2
  br label %235

171:                                              ; preds = %124
  %172 = load ptr, ptr %5, align 8
  %173 = getelementptr inbounds %struct.png_struct_def, ptr %172, i32 0, i32 63
  %174 = load i8, ptr %173, align 8
  %175 = zext i8 %174 to i32
  %176 = icmp sle i32 %175, 8
  br i1 %176, label %177, label %195

177:                                              ; preds = %171
  %178 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %179 = load i8, ptr %178, align 1
  %180 = zext i8 %179 to i32
  %181 = icmp ne i32 %180, 0
  br i1 %181, label %192, label %182

182:                                              ; preds = %177
  %183 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 2
  %184 = load i8, ptr %183, align 1
  %185 = zext i8 %184 to i32
  %186 = icmp ne i32 %185, 0
  br i1 %186, label %192, label %187

187:                                              ; preds = %182
  %188 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 4
  %189 = load i8, ptr %188, align 1
  %190 = zext i8 %189 to i32
  %191 = icmp ne i32 %190, 0
  br i1 %191, label %192, label %194

192:                                              ; preds = %187, %182, %177
  %193 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %193, ptr noundef @.str.33)
  store i32 0, ptr %4, align 4
  br label %239

194:                                              ; preds = %187
  br label %195

195:                                              ; preds = %194, %171
  %196 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 0
  store i8 0, ptr %196, align 2
  %197 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %198 = load i8, ptr %197, align 1
  %199 = zext i8 %198 to i32
  %200 = shl i32 %199, 8
  %201 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %202 = getelementptr inbounds i8, ptr %201, i64 1
  %203 = load i8, ptr %202, align 1
  %204 = zext i8 %203 to i32
  %205 = add i32 %200, %204
  %206 = trunc i32 %205 to i16
  %207 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 1
  store i16 %206, ptr %207, align 2
  %208 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %209 = getelementptr inbounds i8, ptr %208, i64 2
  %210 = load i8, ptr %209, align 1
  %211 = zext i8 %210 to i32
  %212 = shl i32 %211, 8
  %213 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %214 = getelementptr inbounds i8, ptr %213, i64 2
  %215 = getelementptr inbounds i8, ptr %214, i64 1
  %216 = load i8, ptr %215, align 1
  %217 = zext i8 %216 to i32
  %218 = add i32 %212, %217
  %219 = trunc i32 %218 to i16
  %220 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 2
  store i16 %219, ptr %220, align 2
  %221 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %222 = getelementptr inbounds i8, ptr %221, i64 4
  %223 = load i8, ptr %222, align 1
  %224 = zext i8 %223 to i32
  %225 = shl i32 %224, 8
  %226 = getelementptr inbounds [6 x i8], ptr %9, i64 0, i64 0
  %227 = getelementptr inbounds i8, ptr %226, i64 4
  %228 = getelementptr inbounds i8, ptr %227, i64 1
  %229 = load i8, ptr %228, align 1
  %230 = zext i8 %229 to i32
  %231 = add i32 %225, %230
  %232 = trunc i32 %231 to i16
  %233 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 3
  store i16 %232, ptr %233, align 2
  %234 = getelementptr inbounds %struct.png_color_16_struct, ptr %10, i32 0, i32 4
  store i16 0, ptr %234, align 2
  br label %235

235:                                              ; preds = %195, %155
  br label %236

236:                                              ; preds = %235, %122
  %237 = load ptr, ptr %5, align 8
  %238 = load ptr, ptr %6, align 8
  call void @png_set_bKGD(ptr noundef %237, ptr noundef %238, ptr noundef %10)
  store i32 3, ptr %4, align 4
  br label %239

239:                                              ; preds = %236, %192, %152, %82, %54, %42, %22
  %240 = load i32, ptr %4, align 4
  ret i32 %240
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_cHRM(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.png_xy, align 4
  %10 = alloca [32 x i8], align 16
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  call void @png_crc_read(ptr noundef %11, ptr noundef %12, i32 noundef 32)
  %13 = load ptr, ptr %5, align 8
  %14 = call i32 @png_crc_finish(ptr noundef %13, i32 noundef 0)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %82

17:                                               ; preds = %3
  %18 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %19 = getelementptr inbounds i8, ptr %18, i64 0
  %20 = call i32 @png_get_int_32_checked(ptr noundef %19, ptr noundef %8)
  %21 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 6
  store i32 %20, ptr %21, align 4
  %22 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %23 = getelementptr inbounds i8, ptr %22, i64 4
  %24 = call i32 @png_get_int_32_checked(ptr noundef %23, ptr noundef %8)
  %25 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 7
  store i32 %24, ptr %25, align 4
  %26 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %27 = getelementptr inbounds i8, ptr %26, i64 8
  %28 = call i32 @png_get_int_32_checked(ptr noundef %27, ptr noundef %8)
  %29 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 0
  store i32 %28, ptr %29, align 4
  %30 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %31 = getelementptr inbounds i8, ptr %30, i64 12
  %32 = call i32 @png_get_int_32_checked(ptr noundef %31, ptr noundef %8)
  %33 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 1
  store i32 %32, ptr %33, align 4
  %34 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %35 = getelementptr inbounds i8, ptr %34, i64 16
  %36 = call i32 @png_get_int_32_checked(ptr noundef %35, ptr noundef %8)
  %37 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 2
  store i32 %36, ptr %37, align 4
  %38 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %39 = getelementptr inbounds i8, ptr %38, i64 20
  %40 = call i32 @png_get_int_32_checked(ptr noundef %39, ptr noundef %8)
  %41 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 3
  store i32 %40, ptr %41, align 4
  %42 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %43 = getelementptr inbounds i8, ptr %42, i64 24
  %44 = call i32 @png_get_int_32_checked(ptr noundef %43, ptr noundef %8)
  %45 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 4
  store i32 %44, ptr %45, align 4
  %46 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %47 = getelementptr inbounds i8, ptr %46, i64 28
  %48 = call i32 @png_get_int_32_checked(ptr noundef %47, ptr noundef %8)
  %49 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 5
  store i32 %48, ptr %49, align 4
  %50 = load i32, ptr %8, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %54

52:                                               ; preds = %17
  %53 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %53, ptr noundef @.str.30)
  store i32 0, ptr %4, align 4
  br label %82

54:                                               ; preds = %17
  %55 = load ptr, ptr %5, align 8
  %56 = load ptr, ptr %6, align 8
  %57 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 6
  %58 = load i32, ptr %57, align 4
  %59 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 7
  %60 = load i32, ptr %59, align 4
  %61 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 0
  %62 = load i32, ptr %61, align 4
  %63 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 1
  %64 = load i32, ptr %63, align 4
  %65 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 2
  %66 = load i32, ptr %65, align 4
  %67 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 3
  %68 = load i32, ptr %67, align 4
  %69 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 4
  %70 = load i32, ptr %69, align 4
  %71 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 5
  %72 = load i32, ptr %71, align 4
  call void @png_set_cHRM_fixed(ptr noundef %55, ptr noundef %56, i32 noundef %58, i32 noundef %60, i32 noundef %62, i32 noundef %64, i32 noundef %66, i32 noundef %68, i32 noundef %70, i32 noundef %72)
  %73 = load ptr, ptr %5, align 8
  %74 = getelementptr inbounds %struct.png_struct_def, ptr %73, i32 0, i32 37
  %75 = load i32, ptr %74, align 8
  %76 = and i32 %75, 65536
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %81, label %78

78:                                               ; preds = %54
  %79 = load ptr, ptr %5, align 8
  %80 = getelementptr inbounds %struct.png_struct_def, ptr %79, i32 0, i32 80
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %80, ptr align 4 %9, i64 32, i1 false)
  br label %81

81:                                               ; preds = %78, %54
  store i32 3, ptr %4, align 4
  br label %82

82:                                               ; preds = %81, %52, %16
  %83 = load i32, ptr %4, align 4
  ret i32 %83
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_cICP(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca [4 x i8], align 1
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds [4 x i8], ptr %8, i64 0, i64 0
  call void @png_crc_read(ptr noundef %9, ptr noundef %10, i32 noundef 4)
  %11 = load ptr, ptr %5, align 8
  %12 = call i32 @png_crc_finish(ptr noundef %11, i32 noundef 0)
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %33

15:                                               ; preds = %3
  %16 = load ptr, ptr %5, align 8
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds [4 x i8], ptr %8, i64 0, i64 0
  %19 = load i8, ptr %18, align 1
  %20 = getelementptr inbounds [4 x i8], ptr %8, i64 0, i64 1
  %21 = load i8, ptr %20, align 1
  %22 = getelementptr inbounds [4 x i8], ptr %8, i64 0, i64 2
  %23 = load i8, ptr %22, align 1
  %24 = getelementptr inbounds [4 x i8], ptr %8, i64 0, i64 3
  %25 = load i8, ptr %24, align 1
  call void @png_set_cICP(ptr noundef %16, ptr noundef %17, i8 noundef zeroext %19, i8 noundef zeroext %21, i8 noundef zeroext %23, i8 noundef zeroext %25)
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds %struct.png_struct_def, ptr %26, i32 0, i32 37
  %28 = load i32, ptr %27, align 8
  %29 = and i32 %28, 65536
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %32, label %31

31:                                               ; preds = %15
  br label %32

32:                                               ; preds = %31, %15
  store i32 3, ptr %4, align 4
  br label %33

33:                                               ; preds = %32, %14
  %34 = load i32, ptr %4, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_cLLI(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca [8 x i8], align 1
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds [8 x i8], ptr %8, i64 0, i64 0
  call void @png_crc_read(ptr noundef %9, ptr noundef %10, i32 noundef 8)
  %11 = load ptr, ptr %5, align 8
  %12 = call i32 @png_crc_finish(ptr noundef %11, i32 noundef 0)
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %64

15:                                               ; preds = %3
  %16 = load ptr, ptr %5, align 8
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds [8 x i8], ptr %8, i64 0, i64 0
  %19 = load i8, ptr %18, align 1
  %20 = zext i8 %19 to i32
  %21 = shl i32 %20, 24
  %22 = getelementptr inbounds [8 x i8], ptr %8, i64 0, i64 0
  %23 = getelementptr inbounds i8, ptr %22, i64 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i32
  %26 = shl i32 %25, 16
  %27 = add i32 %21, %26
  %28 = getelementptr inbounds [8 x i8], ptr %8, i64 0, i64 0
  %29 = getelementptr inbounds i8, ptr %28, i64 2
  %30 = load i8, ptr %29, align 1
  %31 = zext i8 %30 to i32
  %32 = shl i32 %31, 8
  %33 = add i32 %27, %32
  %34 = getelementptr inbounds [8 x i8], ptr %8, i64 0, i64 0
  %35 = getelementptr inbounds i8, ptr %34, i64 3
  %36 = load i8, ptr %35, align 1
  %37 = zext i8 %36 to i32
  %38 = add i32 %33, %37
  %39 = getelementptr inbounds [8 x i8], ptr %8, i64 0, i64 0
  %40 = getelementptr inbounds i8, ptr %39, i64 4
  %41 = load i8, ptr %40, align 1
  %42 = zext i8 %41 to i32
  %43 = shl i32 %42, 24
  %44 = getelementptr inbounds [8 x i8], ptr %8, i64 0, i64 0
  %45 = getelementptr inbounds i8, ptr %44, i64 4
  %46 = getelementptr inbounds i8, ptr %45, i64 1
  %47 = load i8, ptr %46, align 1
  %48 = zext i8 %47 to i32
  %49 = shl i32 %48, 16
  %50 = add i32 %43, %49
  %51 = getelementptr inbounds [8 x i8], ptr %8, i64 0, i64 0
  %52 = getelementptr inbounds i8, ptr %51, i64 4
  %53 = getelementptr inbounds i8, ptr %52, i64 2
  %54 = load i8, ptr %53, align 1
  %55 = zext i8 %54 to i32
  %56 = shl i32 %55, 8
  %57 = add i32 %50, %56
  %58 = getelementptr inbounds [8 x i8], ptr %8, i64 0, i64 0
  %59 = getelementptr inbounds i8, ptr %58, i64 4
  %60 = getelementptr inbounds i8, ptr %59, i64 3
  %61 = load i8, ptr %60, align 1
  %62 = zext i8 %61 to i32
  %63 = add i32 %57, %62
  call void @png_set_cLLI_fixed(ptr noundef %16, ptr noundef %17, i32 noundef %38, i32 noundef %63)
  store i32 3, ptr %4, align 4
  br label %64

64:                                               ; preds = %15, %14
  %65 = load i32, ptr %4, align 4
  ret i32 %65
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_eXIf(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr null, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load i32, ptr %7, align 4
  %12 = zext i32 %11 to i64
  %13 = call ptr @png_read_buffer(ptr noundef %10, i64 noundef %12)
  store ptr %13, ptr %8, align 8
  %14 = load ptr, ptr %8, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %21

16:                                               ; preds = %3
  %17 = load ptr, ptr %5, align 8
  %18 = load i32, ptr %7, align 4
  %19 = call i32 @png_crc_finish(ptr noundef %17, i32 noundef %18)
  %20 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %20, ptr noundef @.str.22)
  store i32 0, ptr %4, align 4
  br label %63

21:                                               ; preds = %3
  %22 = load ptr, ptr %5, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = load i32, ptr %7, align 4
  call void @png_crc_read(ptr noundef %22, ptr noundef %23, i32 noundef %24)
  %25 = load ptr, ptr %5, align 8
  %26 = call i32 @png_crc_finish(ptr noundef %25, i32 noundef 0)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %29

28:                                               ; preds = %21
  store i32 0, ptr %4, align 4
  br label %63

29:                                               ; preds = %21
  %30 = load ptr, ptr %8, align 8
  %31 = load i8, ptr %30, align 1
  %32 = zext i8 %31 to i32
  %33 = shl i32 %32, 24
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds i8, ptr %34, i64 1
  %36 = load i8, ptr %35, align 1
  %37 = zext i8 %36 to i32
  %38 = shl i32 %37, 16
  %39 = add i32 %33, %38
  %40 = load ptr, ptr %8, align 8
  %41 = getelementptr inbounds i8, ptr %40, i64 2
  %42 = load i8, ptr %41, align 1
  %43 = zext i8 %42 to i32
  %44 = shl i32 %43, 8
  %45 = add i32 %39, %44
  %46 = load ptr, ptr %8, align 8
  %47 = getelementptr inbounds i8, ptr %46, i64 3
  %48 = load i8, ptr %47, align 1
  %49 = zext i8 %48 to i32
  %50 = add i32 %45, %49
  store i32 %50, ptr %9, align 4
  %51 = load i32, ptr %9, align 4
  %52 = icmp ne i32 %51, 1229531648
  br i1 %52, label %53, label %58

53:                                               ; preds = %29
  %54 = load i32, ptr %9, align 4
  %55 = icmp ne i32 %54, 1296891946
  br i1 %55, label %56, label %58

56:                                               ; preds = %53
  %57 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %57, ptr noundef @.str.30)
  store i32 0, ptr %4, align 4
  br label %63

58:                                               ; preds = %53, %29
  %59 = load ptr, ptr %5, align 8
  %60 = load ptr, ptr %6, align 8
  %61 = load i32, ptr %7, align 4
  %62 = load ptr, ptr %8, align 8
  call void @png_set_eXIf_1(ptr noundef %59, ptr noundef %60, i32 noundef %61, ptr noundef %62)
  store i32 3, ptr %4, align 4
  br label %63

63:                                               ; preds = %58, %56, %28, %16
  %64 = load i32, ptr %4, align 4
  ret i32 %64
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_gAMA(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [4 x i8], align 1
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds [4 x i8], ptr %9, i64 0, i64 0
  call void @png_crc_read(ptr noundef %10, ptr noundef %11, i32 noundef 4)
  %12 = load ptr, ptr %5, align 8
  %13 = call i32 @png_crc_finish(ptr noundef %12, i32 noundef 0)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %55

16:                                               ; preds = %3
  %17 = getelementptr inbounds [4 x i8], ptr %9, i64 0, i64 0
  %18 = load i8, ptr %17, align 1
  %19 = zext i8 %18 to i32
  %20 = shl i32 %19, 24
  %21 = getelementptr inbounds [4 x i8], ptr %9, i64 0, i64 0
  %22 = getelementptr inbounds i8, ptr %21, i64 1
  %23 = load i8, ptr %22, align 1
  %24 = zext i8 %23 to i32
  %25 = shl i32 %24, 16
  %26 = add i32 %20, %25
  %27 = getelementptr inbounds [4 x i8], ptr %9, i64 0, i64 0
  %28 = getelementptr inbounds i8, ptr %27, i64 2
  %29 = load i8, ptr %28, align 1
  %30 = zext i8 %29 to i32
  %31 = shl i32 %30, 8
  %32 = add i32 %26, %31
  %33 = getelementptr inbounds [4 x i8], ptr %9, i64 0, i64 0
  %34 = getelementptr inbounds i8, ptr %33, i64 3
  %35 = load i8, ptr %34, align 1
  %36 = zext i8 %35 to i32
  %37 = add i32 %32, %36
  store i32 %37, ptr %8, align 4
  %38 = load i32, ptr %8, align 4
  %39 = icmp ugt i32 %38, 2147483647
  br i1 %39, label %40, label %42

40:                                               ; preds = %16
  %41 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %41, ptr noundef @.str.30)
  store i32 0, ptr %4, align 4
  br label %55

42:                                               ; preds = %16
  %43 = load ptr, ptr %5, align 8
  %44 = load ptr, ptr %6, align 8
  %45 = load i32, ptr %8, align 4
  call void @png_set_gAMA_fixed(ptr noundef %43, ptr noundef %44, i32 noundef %45)
  %46 = load ptr, ptr %5, align 8
  %47 = getelementptr inbounds %struct.png_struct_def, ptr %46, i32 0, i32 84
  %48 = load i32, ptr %47, align 4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %54

50:                                               ; preds = %42
  %51 = load i32, ptr %8, align 4
  %52 = load ptr, ptr %5, align 8
  %53 = getelementptr inbounds %struct.png_struct_def, ptr %52, i32 0, i32 84
  store i32 %51, ptr %53, align 4
  br label %54

54:                                               ; preds = %50, %42
  store i32 3, ptr %4, align 4
  br label %55

55:                                               ; preds = %54, %40, %15
  %56 = load i32, ptr %4, align 4
  ret i32 %56
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_hIST(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [256 x i16], align 16
  %11 = alloca [2 x i8], align 1
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %12 = load i32, ptr %7, align 4
  %13 = udiv i32 %12, 2
  store i32 %13, ptr %8, align 4
  %14 = load i32, ptr %7, align 4
  %15 = load i32, ptr %8, align 4
  %16 = mul i32 %15, 2
  %17 = icmp ne i32 %14, %16
  br i1 %17, label %28, label %18

18:                                               ; preds = %3
  %19 = load i32, ptr %8, align 4
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds %struct.png_struct_def, ptr %20, i32 0, i32 54
  %22 = load i16, ptr %21, align 8
  %23 = zext i16 %22 to i32
  %24 = icmp ne i32 %19, %23
  br i1 %24, label %28, label %25

25:                                               ; preds = %18
  %26 = load i32, ptr %8, align 4
  %27 = icmp ugt i32 %26, 256
  br i1 %27, label %28, label %33

28:                                               ; preds = %25, %18, %3
  %29 = load ptr, ptr %5, align 8
  %30 = load i32, ptr %7, align 4
  %31 = call i32 @png_crc_finish(ptr noundef %29, i32 noundef %30)
  %32 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %32, ptr noundef @.str.30)
  store i32 0, ptr %4, align 4
  br label %66

33:                                               ; preds = %25
  store i32 0, ptr %9, align 4
  br label %34

34:                                               ; preds = %54, %33
  %35 = load i32, ptr %9, align 4
  %36 = load i32, ptr %8, align 4
  %37 = icmp ult i32 %35, %36
  br i1 %37, label %38, label %57

38:                                               ; preds = %34
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds [2 x i8], ptr %11, i64 0, i64 0
  call void @png_crc_read(ptr noundef %39, ptr noundef %40, i32 noundef 2)
  %41 = getelementptr inbounds [2 x i8], ptr %11, i64 0, i64 0
  %42 = load i8, ptr %41, align 1
  %43 = zext i8 %42 to i32
  %44 = shl i32 %43, 8
  %45 = getelementptr inbounds [2 x i8], ptr %11, i64 0, i64 0
  %46 = getelementptr inbounds i8, ptr %45, i64 1
  %47 = load i8, ptr %46, align 1
  %48 = zext i8 %47 to i32
  %49 = add i32 %44, %48
  %50 = trunc i32 %49 to i16
  %51 = load i32, ptr %9, align 4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds [256 x i16], ptr %10, i64 0, i64 %52
  store i16 %50, ptr %53, align 2
  br label %54

54:                                               ; preds = %38
  %55 = load i32, ptr %9, align 4
  %56 = add i32 %55, 1
  store i32 %56, ptr %9, align 4
  br label %34, !llvm.loop !26

57:                                               ; preds = %34
  %58 = load ptr, ptr %5, align 8
  %59 = call i32 @png_crc_finish(ptr noundef %58, i32 noundef 0)
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %62

61:                                               ; preds = %57
  store i32 0, ptr %4, align 4
  br label %66

62:                                               ; preds = %57
  %63 = load ptr, ptr %5, align 8
  %64 = load ptr, ptr %6, align 8
  %65 = getelementptr inbounds [256 x i16], ptr %10, i64 0, i64 0
  call void @png_set_hIST(ptr noundef %63, ptr noundef %64, ptr noundef %65)
  store i32 3, ptr %4, align 4
  br label %66

66:                                               ; preds = %62, %61, %28
  %67 = load i32, ptr %4, align 4
  ret i32 %67
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_iCCP(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [81 x i8], align 16
  %13 = alloca [132 x i8], align 16
  %14 = alloca [1024 x i8], align 16
  %15 = alloca i64, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr null, ptr %8, align 8
  store i32 0, ptr %9, align 4
  store i32 81, ptr %10, align 4
  %19 = load i32, ptr %10, align 4
  %20 = load i32, ptr %7, align 4
  %21 = icmp ugt i32 %19, %20
  br i1 %21, label %22, label %24

22:                                               ; preds = %3
  %23 = load i32, ptr %7, align 4
  store i32 %23, ptr %10, align 4
  br label %24

24:                                               ; preds = %22, %3
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds [81 x i8], ptr %12, i64 0, i64 0
  %27 = load i32, ptr %10, align 4
  call void @png_crc_read(ptr noundef %25, ptr noundef %26, i32 noundef %27)
  %28 = load i32, ptr %10, align 4
  %29 = load i32, ptr %7, align 4
  %30 = sub i32 %29, %28
  store i32 %30, ptr %7, align 4
  %31 = load i32, ptr %7, align 4
  %32 = icmp ult i32 %31, 11
  br i1 %32, label %33, label %38

33:                                               ; preds = %24
  %34 = load ptr, ptr %5, align 8
  %35 = load i32, ptr %7, align 4
  %36 = call i32 @png_crc_finish(ptr noundef %34, i32 noundef %35)
  %37 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %37, ptr noundef @.str.14)
  store i32 0, ptr %4, align 4
  br label %333

38:                                               ; preds = %24
  store i32 0, ptr %11, align 4
  br label %39

39:                                               ; preds = %55, %38
  %40 = load i32, ptr %11, align 4
  %41 = icmp ult i32 %40, 80
  br i1 %41, label %42, label %53

42:                                               ; preds = %39
  %43 = load i32, ptr %11, align 4
  %44 = load i32, ptr %10, align 4
  %45 = icmp ult i32 %43, %44
  br i1 %45, label %46, label %53

46:                                               ; preds = %42
  %47 = load i32, ptr %11, align 4
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds [81 x i8], ptr %12, i64 0, i64 %48
  %50 = load i8, ptr %49, align 1
  %51 = sext i8 %50 to i32
  %52 = icmp ne i32 %51, 0
  br label %53

53:                                               ; preds = %46, %42, %39
  %54 = phi i1 [ false, %42 ], [ false, %39 ], [ %52, %46 ]
  br i1 %54, label %55, label %58

55:                                               ; preds = %53
  %56 = load i32, ptr %11, align 4
  %57 = add i32 %56, 1
  store i32 %57, ptr %11, align 4
  br label %39, !llvm.loop !27

58:                                               ; preds = %53
  %59 = load i32, ptr %11, align 4
  %60 = icmp uge i32 %59, 1
  br i1 %60, label %61, label %318

61:                                               ; preds = %58
  %62 = load i32, ptr %11, align 4
  %63 = icmp ule i32 %62, 79
  br i1 %63, label %64, label %318

64:                                               ; preds = %61
  %65 = load i32, ptr %11, align 4
  %66 = add i32 %65, 1
  %67 = load i32, ptr %10, align 4
  %68 = icmp ult i32 %66, %67
  br i1 %68, label %69, label %316

69:                                               ; preds = %64
  %70 = load i32, ptr %11, align 4
  %71 = add i32 %70, 1
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds [81 x i8], ptr %12, i64 0, i64 %72
  %74 = load i8, ptr %73, align 1
  %75 = sext i8 %74 to i32
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %316

77:                                               ; preds = %69
  %78 = load i32, ptr %11, align 4
  %79 = add i32 %78, 2
  %80 = load i32, ptr %10, align 4
  %81 = sub i32 %80, %79
  store i32 %81, ptr %10, align 4
  %82 = load ptr, ptr %5, align 8
  %83 = call i32 @png_inflate_claim(ptr noundef %82, i32 noundef 1766015824)
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %85, label %310

85:                                               ; preds = %77
  call void @llvm.memset.p0.i64(ptr align 16 %13, i8 0, i64 132, i1 false)
  store i64 132, ptr %15, align 8
  %86 = getelementptr inbounds [81 x i8], ptr %12, i64 0, i64 0
  %87 = load i32, ptr %11, align 4
  %88 = add i32 %87, 2
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i8, ptr %86, i64 %89
  %91 = load ptr, ptr %5, align 8
  %92 = getelementptr inbounds %struct.png_struct_def, ptr %91, i32 0, i32 19
  %93 = getelementptr inbounds %struct.z_stream_s, ptr %92, i32 0, i32 0
  store ptr %90, ptr %93, align 8
  %94 = load i32, ptr %10, align 4
  %95 = load ptr, ptr %5, align 8
  %96 = getelementptr inbounds %struct.png_struct_def, ptr %95, i32 0, i32 19
  %97 = getelementptr inbounds %struct.z_stream_s, ptr %96, i32 0, i32 1
  store i32 %94, ptr %97, align 8
  %98 = load ptr, ptr %5, align 8
  %99 = getelementptr inbounds [1024 x i8], ptr %14, i64 0, i64 0
  %100 = getelementptr inbounds [132 x i8], ptr %13, i64 0, i64 0
  %101 = call i32 @png_inflate_read(ptr noundef %98, ptr noundef %99, i32 noundef 1024, ptr noundef %7, ptr noundef %100, ptr noundef %15, i32 noundef 0)
  %102 = load i64, ptr %15, align 8
  %103 = icmp eq i64 %102, 0
  br i1 %103, label %104, label %302

104:                                              ; preds = %85
  %105 = getelementptr inbounds [132 x i8], ptr %13, i64 0, i64 0
  %106 = load i8, ptr %105, align 16
  %107 = zext i8 %106 to i32
  %108 = shl i32 %107, 24
  %109 = getelementptr inbounds [132 x i8], ptr %13, i64 0, i64 0
  %110 = getelementptr inbounds i8, ptr %109, i64 1
  %111 = load i8, ptr %110, align 1
  %112 = zext i8 %111 to i32
  %113 = shl i32 %112, 16
  %114 = add i32 %108, %113
  %115 = getelementptr inbounds [132 x i8], ptr %13, i64 0, i64 0
  %116 = getelementptr inbounds i8, ptr %115, i64 2
  %117 = load i8, ptr %116, align 1
  %118 = zext i8 %117 to i32
  %119 = shl i32 %118, 8
  %120 = add i32 %114, %119
  %121 = getelementptr inbounds [132 x i8], ptr %13, i64 0, i64 0
  %122 = getelementptr inbounds i8, ptr %121, i64 3
  %123 = load i8, ptr %122, align 1
  %124 = zext i8 %123 to i32
  %125 = add i32 %120, %124
  store i32 %125, ptr %16, align 4
  %126 = load ptr, ptr %5, align 8
  %127 = getelementptr inbounds [81 x i8], ptr %12, i64 0, i64 0
  %128 = load i32, ptr %16, align 4
  %129 = call i32 @png_icc_check_length(ptr noundef %126, ptr noundef %127, i32 noundef %128)
  %130 = icmp ne i32 %129, 0
  br i1 %130, label %131, label %301

131:                                              ; preds = %104
  %132 = load ptr, ptr %5, align 8
  %133 = getelementptr inbounds [81 x i8], ptr %12, i64 0, i64 0
  %134 = load i32, ptr %16, align 4
  %135 = getelementptr inbounds [132 x i8], ptr %13, i64 0, i64 0
  %136 = load ptr, ptr %5, align 8
  %137 = getelementptr inbounds %struct.png_struct_def, ptr %136, i32 0, i32 62
  %138 = load i8, ptr %137, align 1
  %139 = zext i8 %138 to i32
  %140 = call i32 @png_icc_check_header(ptr noundef %132, ptr noundef %133, i32 noundef %134, ptr noundef %135, i32 noundef %139)
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %300

142:                                              ; preds = %131
  %143 = getelementptr inbounds [132 x i8], ptr %13, i64 0, i64 0
  %144 = getelementptr inbounds i8, ptr %143, i64 128
  %145 = load i8, ptr %144, align 1
  %146 = zext i8 %145 to i32
  %147 = shl i32 %146, 24
  %148 = getelementptr inbounds [132 x i8], ptr %13, i64 0, i64 0
  %149 = getelementptr inbounds i8, ptr %148, i64 128
  %150 = getelementptr inbounds i8, ptr %149, i64 1
  %151 = load i8, ptr %150, align 1
  %152 = zext i8 %151 to i32
  %153 = shl i32 %152, 16
  %154 = add i32 %147, %153
  %155 = getelementptr inbounds [132 x i8], ptr %13, i64 0, i64 0
  %156 = getelementptr inbounds i8, ptr %155, i64 128
  %157 = getelementptr inbounds i8, ptr %156, i64 2
  %158 = load i8, ptr %157, align 1
  %159 = zext i8 %158 to i32
  %160 = shl i32 %159, 8
  %161 = add i32 %154, %160
  %162 = getelementptr inbounds [132 x i8], ptr %13, i64 0, i64 0
  %163 = getelementptr inbounds i8, ptr %162, i64 128
  %164 = getelementptr inbounds i8, ptr %163, i64 3
  %165 = load i8, ptr %164, align 1
  %166 = zext i8 %165 to i32
  %167 = add i32 %161, %166
  store i32 %167, ptr %17, align 4
  %168 = load ptr, ptr %5, align 8
  %169 = load i32, ptr %16, align 4
  %170 = zext i32 %169 to i64
  %171 = call ptr @png_read_buffer(ptr noundef %168, i64 noundef %170)
  store ptr %171, ptr %18, align 8
  %172 = load ptr, ptr %18, align 8
  %173 = icmp ne ptr %172, null
  br i1 %173, label %174, label %298

174:                                              ; preds = %142
  %175 = load ptr, ptr %18, align 8
  %176 = getelementptr inbounds [132 x i8], ptr %13, i64 0, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %175, ptr align 16 %176, i64 132, i1 false)
  %177 = load i32, ptr %17, align 4
  %178 = mul i32 12, %177
  %179 = zext i32 %178 to i64
  store i64 %179, ptr %15, align 8
  %180 = load ptr, ptr %5, align 8
  %181 = getelementptr inbounds [1024 x i8], ptr %14, i64 0, i64 0
  %182 = load ptr, ptr %18, align 8
  %183 = getelementptr inbounds i8, ptr %182, i64 132
  %184 = call i32 @png_inflate_read(ptr noundef %180, ptr noundef %181, i32 noundef 1024, ptr noundef %7, ptr noundef %183, ptr noundef %15, i32 noundef 0)
  %185 = load i64, ptr %15, align 8
  %186 = icmp eq i64 %185, 0
  br i1 %186, label %187, label %292

187:                                              ; preds = %174
  %188 = load ptr, ptr %5, align 8
  %189 = getelementptr inbounds [81 x i8], ptr %12, i64 0, i64 0
  %190 = load i32, ptr %16, align 4
  %191 = load ptr, ptr %18, align 8
  %192 = call i32 @png_icc_check_tag_table(ptr noundef %188, ptr noundef %189, i32 noundef %190, ptr noundef %191)
  %193 = icmp ne i32 %192, 0
  br i1 %193, label %194, label %291

194:                                              ; preds = %187
  %195 = load i32, ptr %16, align 4
  %196 = zext i32 %195 to i64
  %197 = sub i64 %196, 132
  %198 = load i32, ptr %17, align 4
  %199 = mul i32 12, %198
  %200 = zext i32 %199 to i64
  %201 = sub i64 %197, %200
  store i64 %201, ptr %15, align 8
  %202 = load ptr, ptr %5, align 8
  %203 = getelementptr inbounds [1024 x i8], ptr %14, i64 0, i64 0
  %204 = load ptr, ptr %18, align 8
  %205 = getelementptr inbounds i8, ptr %204, i64 132
  %206 = load i32, ptr %17, align 4
  %207 = mul i32 12, %206
  %208 = zext i32 %207 to i64
  %209 = getelementptr inbounds i8, ptr %205, i64 %208
  %210 = call i32 @png_inflate_read(ptr noundef %202, ptr noundef %203, i32 noundef 1024, ptr noundef %7, ptr noundef %209, ptr noundef %15, i32 noundef 1)
  %211 = load i32, ptr %7, align 4
  %212 = icmp ugt i32 %211, 0
  br i1 %212, label %213, label %220

213:                                              ; preds = %194
  %214 = load ptr, ptr %5, align 8
  %215 = getelementptr inbounds %struct.png_struct_def, ptr %214, i32 0, i32 16
  %216 = load i32, ptr %215, align 8
  %217 = and i32 %216, 1048576
  %218 = icmp ne i32 %217, 0
  br i1 %218, label %220, label %219

219:                                              ; preds = %213
  store ptr @.str.34, ptr %8, align 8
  br label %282

220:                                              ; preds = %213, %194
  %221 = load i64, ptr %15, align 8
  %222 = icmp eq i64 %221, 0
  br i1 %222, label %223, label %281

223:                                              ; preds = %220
  %224 = load i32, ptr %7, align 4
  %225 = icmp ugt i32 %224, 0
  br i1 %225, label %226, label %228

226:                                              ; preds = %223
  %227 = load ptr, ptr %5, align 8
  call void @png_chunk_warning(ptr noundef %227, ptr noundef @.str.34)
  br label %228

228:                                              ; preds = %226, %223
  %229 = load ptr, ptr %5, align 8
  %230 = load i32, ptr %7, align 4
  %231 = call i32 @png_crc_finish(ptr noundef %229, i32 noundef %230)
  store i32 1, ptr %9, align 4
  %232 = load ptr, ptr %6, align 8
  %233 = icmp ne ptr %232, null
  br i1 %233, label %234, label %274

234:                                              ; preds = %228
  %235 = load ptr, ptr %5, align 8
  %236 = load ptr, ptr %6, align 8
  call void @png_free_data(ptr noundef %235, ptr noundef %236, i32 noundef 16, i32 noundef 0)
  %237 = load ptr, ptr %5, align 8
  %238 = load i32, ptr %11, align 4
  %239 = add i32 %238, 1
  %240 = zext i32 %239 to i64
  %241 = call noalias ptr @png_malloc_base(ptr noundef %237, i64 noundef %240)
  %242 = load ptr, ptr %6, align 8
  %243 = getelementptr inbounds %struct.png_info_def, ptr %242, i32 0, i32 20
  store ptr %241, ptr %243, align 8
  %244 = load ptr, ptr %6, align 8
  %245 = getelementptr inbounds %struct.png_info_def, ptr %244, i32 0, i32 20
  %246 = load ptr, ptr %245, align 8
  %247 = icmp ne ptr %246, null
  br i1 %247, label %248, label %272

248:                                              ; preds = %234
  %249 = load ptr, ptr %6, align 8
  %250 = getelementptr inbounds %struct.png_info_def, ptr %249, i32 0, i32 20
  %251 = load ptr, ptr %250, align 8
  %252 = getelementptr inbounds [81 x i8], ptr %12, i64 0, i64 0
  %253 = load i32, ptr %11, align 4
  %254 = add i32 %253, 1
  %255 = zext i32 %254 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %251, ptr align 16 %252, i64 %255, i1 false)
  %256 = load i32, ptr %16, align 4
  %257 = load ptr, ptr %6, align 8
  %258 = getelementptr inbounds %struct.png_info_def, ptr %257, i32 0, i32 22
  store i32 %256, ptr %258, align 8
  %259 = load ptr, ptr %18, align 8
  %260 = load ptr, ptr %6, align 8
  %261 = getelementptr inbounds %struct.png_info_def, ptr %260, i32 0, i32 21
  store ptr %259, ptr %261, align 8
  %262 = load ptr, ptr %5, align 8
  %263 = getelementptr inbounds %struct.png_struct_def, ptr %262, i32 0, i32 144
  store ptr null, ptr %263, align 8
  %264 = load ptr, ptr %6, align 8
  %265 = getelementptr inbounds %struct.png_info_def, ptr %264, i32 0, i32 59
  %266 = load i32, ptr %265, align 4
  %267 = or i32 %266, 16
  store i32 %267, ptr %265, align 4
  %268 = load ptr, ptr %6, align 8
  %269 = getelementptr inbounds %struct.png_info_def, ptr %268, i32 0, i32 2
  %270 = load i32, ptr %269, align 8
  %271 = or i32 %270, 4096
  store i32 %271, ptr %269, align 8
  br label %273

272:                                              ; preds = %234
  store ptr @.str.22, ptr %8, align 8
  br label %273

273:                                              ; preds = %272, %248
  br label %274

274:                                              ; preds = %273, %228
  %275 = load ptr, ptr %8, align 8
  %276 = icmp eq ptr %275, null
  br i1 %276, label %277, label %280

277:                                              ; preds = %274
  %278 = load ptr, ptr %5, align 8
  %279 = getelementptr inbounds %struct.png_struct_def, ptr %278, i32 0, i32 18
  store i32 0, ptr %279, align 8
  store i32 3, ptr %4, align 4
  br label %333

280:                                              ; preds = %274
  br label %281

281:                                              ; preds = %280, %220
  br label %282

282:                                              ; preds = %281, %219
  %283 = load ptr, ptr %8, align 8
  %284 = icmp eq ptr %283, null
  br i1 %284, label %285, label %290

285:                                              ; preds = %282
  %286 = load ptr, ptr %5, align 8
  %287 = getelementptr inbounds %struct.png_struct_def, ptr %286, i32 0, i32 19
  %288 = getelementptr inbounds %struct.z_stream_s, ptr %287, i32 0, i32 6
  %289 = load ptr, ptr %288, align 8
  store ptr %289, ptr %8, align 8
  br label %290

290:                                              ; preds = %285, %282
  br label %291

291:                                              ; preds = %290, %187
  br label %297

292:                                              ; preds = %174
  %293 = load ptr, ptr %5, align 8
  %294 = getelementptr inbounds %struct.png_struct_def, ptr %293, i32 0, i32 19
  %295 = getelementptr inbounds %struct.z_stream_s, ptr %294, i32 0, i32 6
  %296 = load ptr, ptr %295, align 8
  store ptr %296, ptr %8, align 8
  br label %297

297:                                              ; preds = %292, %291
  br label %299

298:                                              ; preds = %142
  store ptr @.str.22, ptr %8, align 8
  br label %299

299:                                              ; preds = %298, %297
  br label %300

300:                                              ; preds = %299, %131
  br label %301

301:                                              ; preds = %300, %104
  br label %307

302:                                              ; preds = %85
  %303 = load ptr, ptr %5, align 8
  %304 = getelementptr inbounds %struct.png_struct_def, ptr %303, i32 0, i32 19
  %305 = getelementptr inbounds %struct.z_stream_s, ptr %304, i32 0, i32 6
  %306 = load ptr, ptr %305, align 8
  store ptr %306, ptr %8, align 8
  br label %307

307:                                              ; preds = %302, %301
  %308 = load ptr, ptr %5, align 8
  %309 = getelementptr inbounds %struct.png_struct_def, ptr %308, i32 0, i32 18
  store i32 0, ptr %309, align 8
  br label %315

310:                                              ; preds = %77
  %311 = load ptr, ptr %5, align 8
  %312 = getelementptr inbounds %struct.png_struct_def, ptr %311, i32 0, i32 19
  %313 = getelementptr inbounds %struct.z_stream_s, ptr %312, i32 0, i32 6
  %314 = load ptr, ptr %313, align 8
  store ptr %314, ptr %8, align 8
  br label %315

315:                                              ; preds = %310, %307
  br label %317

316:                                              ; preds = %69, %64
  store ptr @.str.35, ptr %8, align 8
  br label %317

317:                                              ; preds = %316, %315
  br label %319

318:                                              ; preds = %61, %58
  store ptr @.str.36, ptr %8, align 8
  br label %319

319:                                              ; preds = %318, %317
  %320 = load i32, ptr %9, align 4
  %321 = icmp eq i32 %320, 0
  br i1 %321, label %322, label %326

322:                                              ; preds = %319
  %323 = load ptr, ptr %5, align 8
  %324 = load i32, ptr %7, align 4
  %325 = call i32 @png_crc_finish(ptr noundef %323, i32 noundef %324)
  br label %326

326:                                              ; preds = %322, %319
  %327 = load ptr, ptr %8, align 8
  %328 = icmp ne ptr %327, null
  br i1 %328, label %329, label %332

329:                                              ; preds = %326
  %330 = load ptr, ptr %5, align 8
  %331 = load ptr, ptr %8, align 8
  call void @png_chunk_benign_error(ptr noundef %330, ptr noundef %331)
  br label %332

332:                                              ; preds = %329, %326
  store i32 0, ptr %4, align 4
  br label %333

333:                                              ; preds = %332, %277, %33
  %334 = load i32, ptr %4, align 4
  ret i32 %334
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_iTXt(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i64, align 8
  %15 = alloca %struct.png_text_struct, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr null, ptr %8, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 140
  %18 = load i32, ptr %17, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %41

20:                                               ; preds = %3
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds %struct.png_struct_def, ptr %21, i32 0, i32 140
  %23 = load i32, ptr %22, align 4
  %24 = icmp eq i32 %23, 1
  br i1 %24, label %25, label %29

25:                                               ; preds = %20
  %26 = load ptr, ptr %5, align 8
  %27 = load i32, ptr %7, align 4
  %28 = call i32 @png_crc_finish(ptr noundef %26, i32 noundef %27)
  store i32 0, ptr %4, align 4
  br label %277

29:                                               ; preds = %20
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.png_struct_def, ptr %30, i32 0, i32 140
  %32 = load i32, ptr %31, align 4
  %33 = add i32 %32, -1
  store i32 %33, ptr %31, align 4
  %34 = icmp eq i32 %33, 1
  br i1 %34, label %35, label %40

35:                                               ; preds = %29
  %36 = load ptr, ptr %5, align 8
  %37 = load i32, ptr %7, align 4
  %38 = call i32 @png_crc_finish(ptr noundef %36, i32 noundef %37)
  %39 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %39, ptr noundef @.str.9)
  store i32 0, ptr %4, align 4
  br label %277

40:                                               ; preds = %29
  br label %41

41:                                               ; preds = %40, %3
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds %struct.png_struct_def, ptr %42, i32 0, i32 15
  %44 = load i32, ptr %43, align 4
  %45 = and i32 %44, 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %52

47:                                               ; preds = %41
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds %struct.png_struct_def, ptr %48, i32 0, i32 15
  %50 = load i32, ptr %49, align 4
  %51 = or i32 %50, 8
  store i32 %51, ptr %49, align 4
  br label %52

52:                                               ; preds = %47, %41
  %53 = load ptr, ptr %5, align 8
  %54 = load i32, ptr %7, align 4
  %55 = add i32 %54, 1
  %56 = zext i32 %55 to i64
  %57 = call ptr @png_read_buffer(ptr noundef %53, i64 noundef %56)
  store ptr %57, ptr %9, align 8
  %58 = load ptr, ptr %9, align 8
  %59 = icmp eq ptr %58, null
  br i1 %59, label %60, label %65

60:                                               ; preds = %52
  %61 = load ptr, ptr %5, align 8
  %62 = load i32, ptr %7, align 4
  %63 = call i32 @png_crc_finish(ptr noundef %61, i32 noundef %62)
  %64 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %64, ptr noundef @.str.22)
  store i32 0, ptr %4, align 4
  br label %277

65:                                               ; preds = %52
  %66 = load ptr, ptr %5, align 8
  %67 = load ptr, ptr %9, align 8
  %68 = load i32, ptr %7, align 4
  call void @png_crc_read(ptr noundef %66, ptr noundef %67, i32 noundef %68)
  %69 = load ptr, ptr %5, align 8
  %70 = call i32 @png_crc_finish(ptr noundef %69, i32 noundef 0)
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %73

72:                                               ; preds = %65
  store i32 0, ptr %4, align 4
  br label %277

73:                                               ; preds = %65
  store i32 0, ptr %10, align 4
  br label %74

74:                                               ; preds = %89, %73
  %75 = load i32, ptr %10, align 4
  %76 = load i32, ptr %7, align 4
  %77 = icmp ult i32 %75, %76
  br i1 %77, label %78, label %86

78:                                               ; preds = %74
  %79 = load ptr, ptr %9, align 8
  %80 = load i32, ptr %10, align 4
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds i8, ptr %79, i64 %81
  %83 = load i8, ptr %82, align 1
  %84 = zext i8 %83 to i32
  %85 = icmp ne i32 %84, 0
  br label %86

86:                                               ; preds = %78, %74
  %87 = phi i1 [ false, %74 ], [ %85, %78 ]
  br i1 %87, label %88, label %92

88:                                               ; preds = %86
  br label %89

89:                                               ; preds = %88
  %90 = load i32, ptr %10, align 4
  %91 = add i32 %90, 1
  store i32 %91, ptr %10, align 4
  br label %74, !llvm.loop !28

92:                                               ; preds = %86
  %93 = load i32, ptr %10, align 4
  %94 = icmp ugt i32 %93, 79
  br i1 %94, label %98, label %95

95:                                               ; preds = %92
  %96 = load i32, ptr %10, align 4
  %97 = icmp ult i32 %96, 1
  br i1 %97, label %98, label %99

98:                                               ; preds = %95, %92
  store ptr @.str.36, ptr %8, align 8
  br label %270

99:                                               ; preds = %95
  %100 = load i32, ptr %10, align 4
  %101 = add i32 %100, 5
  %102 = load i32, ptr %7, align 4
  %103 = icmp ugt i32 %101, %102
  br i1 %103, label %104, label %105

104:                                              ; preds = %99
  store ptr @.str.38, ptr %8, align 8
  br label %269

105:                                              ; preds = %99
  %106 = load ptr, ptr %9, align 8
  %107 = load i32, ptr %10, align 4
  %108 = add i32 %107, 1
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds i8, ptr %106, i64 %109
  %111 = load i8, ptr %110, align 1
  %112 = zext i8 %111 to i32
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %132, label %114

114:                                              ; preds = %105
  %115 = load ptr, ptr %9, align 8
  %116 = load i32, ptr %10, align 4
  %117 = add i32 %116, 1
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds i8, ptr %115, i64 %118
  %120 = load i8, ptr %119, align 1
  %121 = zext i8 %120 to i32
  %122 = icmp eq i32 %121, 1
  br i1 %122, label %123, label %267

123:                                              ; preds = %114
  %124 = load ptr, ptr %9, align 8
  %125 = load i32, ptr %10, align 4
  %126 = add i32 %125, 2
  %127 = zext i32 %126 to i64
  %128 = getelementptr inbounds i8, ptr %124, i64 %127
  %129 = load i8, ptr %128, align 1
  %130 = zext i8 %129 to i32
  %131 = icmp eq i32 %130, 0
  br i1 %131, label %132, label %267

132:                                              ; preds = %123, %105
  %133 = load ptr, ptr %9, align 8
  %134 = load i32, ptr %10, align 4
  %135 = add i32 %134, 1
  %136 = zext i32 %135 to i64
  %137 = getelementptr inbounds i8, ptr %133, i64 %136
  %138 = load i8, ptr %137, align 1
  %139 = zext i8 %138 to i32
  %140 = icmp ne i32 %139, 0
  %141 = zext i1 %140 to i32
  store i32 %141, ptr %11, align 4
  store i64 0, ptr %14, align 8
  %142 = load i32, ptr %10, align 4
  %143 = add i32 %142, 3
  store i32 %143, ptr %10, align 4
  %144 = load i32, ptr %10, align 4
  store i32 %144, ptr %12, align 4
  br label %145

145:                                              ; preds = %160, %132
  %146 = load i32, ptr %10, align 4
  %147 = load i32, ptr %7, align 4
  %148 = icmp ult i32 %146, %147
  br i1 %148, label %149, label %157

149:                                              ; preds = %145
  %150 = load ptr, ptr %9, align 8
  %151 = load i32, ptr %10, align 4
  %152 = zext i32 %151 to i64
  %153 = getelementptr inbounds i8, ptr %150, i64 %152
  %154 = load i8, ptr %153, align 1
  %155 = zext i8 %154 to i32
  %156 = icmp ne i32 %155, 0
  br label %157

157:                                              ; preds = %149, %145
  %158 = phi i1 [ false, %145 ], [ %156, %149 ]
  br i1 %158, label %159, label %163

159:                                              ; preds = %157
  br label %160

160:                                              ; preds = %159
  %161 = load i32, ptr %10, align 4
  %162 = add i32 %161, 1
  store i32 %162, ptr %10, align 4
  br label %145, !llvm.loop !29

163:                                              ; preds = %157
  %164 = load i32, ptr %10, align 4
  %165 = add i32 %164, 1
  store i32 %165, ptr %10, align 4
  store i32 %165, ptr %13, align 4
  br label %166

166:                                              ; preds = %181, %163
  %167 = load i32, ptr %10, align 4
  %168 = load i32, ptr %7, align 4
  %169 = icmp ult i32 %167, %168
  br i1 %169, label %170, label %178

170:                                              ; preds = %166
  %171 = load ptr, ptr %9, align 8
  %172 = load i32, ptr %10, align 4
  %173 = zext i32 %172 to i64
  %174 = getelementptr inbounds i8, ptr %171, i64 %173
  %175 = load i8, ptr %174, align 1
  %176 = zext i8 %175 to i32
  %177 = icmp ne i32 %176, 0
  br label %178

178:                                              ; preds = %170, %166
  %179 = phi i1 [ false, %166 ], [ %177, %170 ]
  br i1 %179, label %180, label %184

180:                                              ; preds = %178
  br label %181

181:                                              ; preds = %180
  %182 = load i32, ptr %10, align 4
  %183 = add i32 %182, 1
  store i32 %183, ptr %10, align 4
  br label %166, !llvm.loop !30

184:                                              ; preds = %178
  %185 = load i32, ptr %10, align 4
  %186 = add i32 %185, 1
  store i32 %186, ptr %10, align 4
  %187 = load i32, ptr %11, align 4
  %188 = icmp eq i32 %187, 0
  br i1 %188, label %189, label %198

189:                                              ; preds = %184
  %190 = load i32, ptr %10, align 4
  %191 = load i32, ptr %7, align 4
  %192 = icmp ule i32 %190, %191
  br i1 %192, label %193, label %198

193:                                              ; preds = %189
  %194 = load i32, ptr %7, align 4
  %195 = load i32, ptr %10, align 4
  %196 = sub i32 %194, %195
  %197 = zext i32 %196 to i64
  store i64 %197, ptr %14, align 8
  br label %223

198:                                              ; preds = %189, %184
  %199 = load i32, ptr %11, align 4
  %200 = icmp ne i32 %199, 0
  br i1 %200, label %201, label %221

201:                                              ; preds = %198
  %202 = load i32, ptr %10, align 4
  %203 = load i32, ptr %7, align 4
  %204 = icmp ult i32 %202, %203
  br i1 %204, label %205, label %221

205:                                              ; preds = %201
  store i64 -1, ptr %14, align 8
  %206 = load ptr, ptr %5, align 8
  %207 = load i32, ptr %7, align 4
  %208 = load i32, ptr %10, align 4
  %209 = call i32 @png_decompress_chunk(ptr noundef %206, i32 noundef %207, i32 noundef %208, ptr noundef %14, i32 noundef 1)
  %210 = icmp eq i32 %209, 1
  br i1 %210, label %211, label %215

211:                                              ; preds = %205
  %212 = load ptr, ptr %5, align 8
  %213 = getelementptr inbounds %struct.png_struct_def, ptr %212, i32 0, i32 144
  %214 = load ptr, ptr %213, align 8
  store ptr %214, ptr %9, align 8
  br label %220

215:                                              ; preds = %205
  %216 = load ptr, ptr %5, align 8
  %217 = getelementptr inbounds %struct.png_struct_def, ptr %216, i32 0, i32 19
  %218 = getelementptr inbounds %struct.z_stream_s, ptr %217, i32 0, i32 6
  %219 = load ptr, ptr %218, align 8
  store ptr %219, ptr %8, align 8
  br label %220

220:                                              ; preds = %215, %211
  br label %222

221:                                              ; preds = %201, %198
  store ptr @.str.38, ptr %8, align 8
  br label %222

222:                                              ; preds = %221, %220
  br label %223

223:                                              ; preds = %222, %193
  %224 = load ptr, ptr %8, align 8
  %225 = icmp eq ptr %224, null
  br i1 %225, label %226, label %266

226:                                              ; preds = %223
  %227 = load ptr, ptr %9, align 8
  %228 = load i64, ptr %14, align 8
  %229 = load i32, ptr %10, align 4
  %230 = zext i32 %229 to i64
  %231 = add i64 %228, %230
  %232 = getelementptr inbounds i8, ptr %227, i64 %231
  store i8 0, ptr %232, align 1
  %233 = load i32, ptr %11, align 4
  %234 = icmp eq i32 %233, 0
  br i1 %234, label %235, label %237

235:                                              ; preds = %226
  %236 = getelementptr inbounds %struct.png_text_struct, ptr %15, i32 0, i32 0
  store i32 1, ptr %236, align 8
  br label %239

237:                                              ; preds = %226
  %238 = getelementptr inbounds %struct.png_text_struct, ptr %15, i32 0, i32 0
  store i32 2, ptr %238, align 8
  br label %239

239:                                              ; preds = %237, %235
  %240 = load ptr, ptr %9, align 8
  %241 = getelementptr inbounds %struct.png_text_struct, ptr %15, i32 0, i32 1
  store ptr %240, ptr %241, align 8
  %242 = load ptr, ptr %9, align 8
  %243 = load i32, ptr %12, align 4
  %244 = zext i32 %243 to i64
  %245 = getelementptr inbounds i8, ptr %242, i64 %244
  %246 = getelementptr inbounds %struct.png_text_struct, ptr %15, i32 0, i32 5
  store ptr %245, ptr %246, align 8
  %247 = load ptr, ptr %9, align 8
  %248 = load i32, ptr %13, align 4
  %249 = zext i32 %248 to i64
  %250 = getelementptr inbounds i8, ptr %247, i64 %249
  %251 = getelementptr inbounds %struct.png_text_struct, ptr %15, i32 0, i32 6
  store ptr %250, ptr %251, align 8
  %252 = load ptr, ptr %9, align 8
  %253 = load i32, ptr %10, align 4
  %254 = zext i32 %253 to i64
  %255 = getelementptr inbounds i8, ptr %252, i64 %254
  %256 = getelementptr inbounds %struct.png_text_struct, ptr %15, i32 0, i32 2
  store ptr %255, ptr %256, align 8
  %257 = getelementptr inbounds %struct.png_text_struct, ptr %15, i32 0, i32 3
  store i64 0, ptr %257, align 8
  %258 = load i64, ptr %14, align 8
  %259 = getelementptr inbounds %struct.png_text_struct, ptr %15, i32 0, i32 4
  store i64 %258, ptr %259, align 8
  %260 = load ptr, ptr %5, align 8
  %261 = load ptr, ptr %6, align 8
  %262 = call i32 @png_set_text_2(ptr noundef %260, ptr noundef %261, ptr noundef %15, i32 noundef 1)
  %263 = icmp eq i32 %262, 0
  br i1 %263, label %264, label %265

264:                                              ; preds = %239
  store i32 3, ptr %4, align 4
  br label %277

265:                                              ; preds = %239
  store ptr @.str.22, ptr %8, align 8
  br label %266

266:                                              ; preds = %265, %223
  br label %268

267:                                              ; preds = %123, %114
  store ptr @.str.39, ptr %8, align 8
  br label %268

268:                                              ; preds = %267, %266
  br label %269

269:                                              ; preds = %268, %104
  br label %270

270:                                              ; preds = %269, %98
  %271 = load ptr, ptr %8, align 8
  %272 = icmp ne ptr %271, null
  br i1 %272, label %273, label %276

273:                                              ; preds = %270
  %274 = load ptr, ptr %5, align 8
  %275 = load ptr, ptr %8, align 8
  call void @png_chunk_benign_error(ptr noundef %274, ptr noundef %275)
  br label %276

276:                                              ; preds = %273, %270
  store i32 0, ptr %4, align 4
  br label %277

277:                                              ; preds = %276, %264, %72, %60, %35, %25
  %278 = load i32, ptr %4, align 4
  ret i32 %278
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_mDCV(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.png_xy, align 4
  %9 = alloca [24 x i8], align 16
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  call void @png_crc_read(ptr noundef %10, ptr noundef %11, i32 noundef 24)
  %12 = load ptr, ptr %5, align 8
  %13 = call i32 @png_crc_finish(ptr noundef %12, i32 noundef 0)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %207

16:                                               ; preds = %3
  %17 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %18 = getelementptr inbounds i8, ptr %17, i64 0
  %19 = load i8, ptr %18, align 1
  %20 = zext i8 %19 to i32
  %21 = shl i32 %20, 8
  %22 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %23 = getelementptr inbounds i8, ptr %22, i64 0
  %24 = getelementptr inbounds i8, ptr %23, i64 1
  %25 = load i8, ptr %24, align 1
  %26 = zext i8 %25 to i32
  %27 = add i32 %21, %26
  %28 = trunc i32 %27 to i16
  %29 = zext i16 %28 to i32
  %30 = shl i32 %29, 1
  %31 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 0
  store i32 %30, ptr %31, align 4
  %32 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %33 = getelementptr inbounds i8, ptr %32, i64 2
  %34 = load i8, ptr %33, align 1
  %35 = zext i8 %34 to i32
  %36 = shl i32 %35, 8
  %37 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %38 = getelementptr inbounds i8, ptr %37, i64 2
  %39 = getelementptr inbounds i8, ptr %38, i64 1
  %40 = load i8, ptr %39, align 1
  %41 = zext i8 %40 to i32
  %42 = add i32 %36, %41
  %43 = trunc i32 %42 to i16
  %44 = zext i16 %43 to i32
  %45 = shl i32 %44, 1
  %46 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 1
  store i32 %45, ptr %46, align 4
  %47 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %48 = getelementptr inbounds i8, ptr %47, i64 4
  %49 = load i8, ptr %48, align 1
  %50 = zext i8 %49 to i32
  %51 = shl i32 %50, 8
  %52 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %53 = getelementptr inbounds i8, ptr %52, i64 4
  %54 = getelementptr inbounds i8, ptr %53, i64 1
  %55 = load i8, ptr %54, align 1
  %56 = zext i8 %55 to i32
  %57 = add i32 %51, %56
  %58 = trunc i32 %57 to i16
  %59 = zext i16 %58 to i32
  %60 = shl i32 %59, 1
  %61 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 2
  store i32 %60, ptr %61, align 4
  %62 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %63 = getelementptr inbounds i8, ptr %62, i64 6
  %64 = load i8, ptr %63, align 1
  %65 = zext i8 %64 to i32
  %66 = shl i32 %65, 8
  %67 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %68 = getelementptr inbounds i8, ptr %67, i64 6
  %69 = getelementptr inbounds i8, ptr %68, i64 1
  %70 = load i8, ptr %69, align 1
  %71 = zext i8 %70 to i32
  %72 = add i32 %66, %71
  %73 = trunc i32 %72 to i16
  %74 = zext i16 %73 to i32
  %75 = shl i32 %74, 1
  %76 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 3
  store i32 %75, ptr %76, align 4
  %77 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %78 = getelementptr inbounds i8, ptr %77, i64 8
  %79 = load i8, ptr %78, align 1
  %80 = zext i8 %79 to i32
  %81 = shl i32 %80, 8
  %82 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %83 = getelementptr inbounds i8, ptr %82, i64 8
  %84 = getelementptr inbounds i8, ptr %83, i64 1
  %85 = load i8, ptr %84, align 1
  %86 = zext i8 %85 to i32
  %87 = add i32 %81, %86
  %88 = trunc i32 %87 to i16
  %89 = zext i16 %88 to i32
  %90 = shl i32 %89, 1
  %91 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 4
  store i32 %90, ptr %91, align 4
  %92 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %93 = getelementptr inbounds i8, ptr %92, i64 10
  %94 = load i8, ptr %93, align 1
  %95 = zext i8 %94 to i32
  %96 = shl i32 %95, 8
  %97 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %98 = getelementptr inbounds i8, ptr %97, i64 10
  %99 = getelementptr inbounds i8, ptr %98, i64 1
  %100 = load i8, ptr %99, align 1
  %101 = zext i8 %100 to i32
  %102 = add i32 %96, %101
  %103 = trunc i32 %102 to i16
  %104 = zext i16 %103 to i32
  %105 = shl i32 %104, 1
  %106 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 5
  store i32 %105, ptr %106, align 4
  %107 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %108 = getelementptr inbounds i8, ptr %107, i64 12
  %109 = load i8, ptr %108, align 1
  %110 = zext i8 %109 to i32
  %111 = shl i32 %110, 8
  %112 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %113 = getelementptr inbounds i8, ptr %112, i64 12
  %114 = getelementptr inbounds i8, ptr %113, i64 1
  %115 = load i8, ptr %114, align 1
  %116 = zext i8 %115 to i32
  %117 = add i32 %111, %116
  %118 = trunc i32 %117 to i16
  %119 = zext i16 %118 to i32
  %120 = shl i32 %119, 1
  %121 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 6
  store i32 %120, ptr %121, align 4
  %122 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %123 = getelementptr inbounds i8, ptr %122, i64 14
  %124 = load i8, ptr %123, align 1
  %125 = zext i8 %124 to i32
  %126 = shl i32 %125, 8
  %127 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %128 = getelementptr inbounds i8, ptr %127, i64 14
  %129 = getelementptr inbounds i8, ptr %128, i64 1
  %130 = load i8, ptr %129, align 1
  %131 = zext i8 %130 to i32
  %132 = add i32 %126, %131
  %133 = trunc i32 %132 to i16
  %134 = zext i16 %133 to i32
  %135 = shl i32 %134, 1
  %136 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 7
  store i32 %135, ptr %136, align 4
  %137 = load ptr, ptr %5, align 8
  %138 = load ptr, ptr %6, align 8
  %139 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 6
  %140 = load i32, ptr %139, align 4
  %141 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 7
  %142 = load i32, ptr %141, align 4
  %143 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 0
  %144 = load i32, ptr %143, align 4
  %145 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 1
  %146 = load i32, ptr %145, align 4
  %147 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 2
  %148 = load i32, ptr %147, align 4
  %149 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 3
  %150 = load i32, ptr %149, align 4
  %151 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 4
  %152 = load i32, ptr %151, align 4
  %153 = getelementptr inbounds %struct.png_xy, ptr %8, i32 0, i32 5
  %154 = load i32, ptr %153, align 4
  %155 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %156 = getelementptr inbounds i8, ptr %155, i64 16
  %157 = load i8, ptr %156, align 1
  %158 = zext i8 %157 to i32
  %159 = shl i32 %158, 24
  %160 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %161 = getelementptr inbounds i8, ptr %160, i64 16
  %162 = getelementptr inbounds i8, ptr %161, i64 1
  %163 = load i8, ptr %162, align 1
  %164 = zext i8 %163 to i32
  %165 = shl i32 %164, 16
  %166 = add i32 %159, %165
  %167 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %168 = getelementptr inbounds i8, ptr %167, i64 16
  %169 = getelementptr inbounds i8, ptr %168, i64 2
  %170 = load i8, ptr %169, align 1
  %171 = zext i8 %170 to i32
  %172 = shl i32 %171, 8
  %173 = add i32 %166, %172
  %174 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %175 = getelementptr inbounds i8, ptr %174, i64 16
  %176 = getelementptr inbounds i8, ptr %175, i64 3
  %177 = load i8, ptr %176, align 1
  %178 = zext i8 %177 to i32
  %179 = add i32 %173, %178
  %180 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %181 = getelementptr inbounds i8, ptr %180, i64 20
  %182 = load i8, ptr %181, align 1
  %183 = zext i8 %182 to i32
  %184 = shl i32 %183, 24
  %185 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %186 = getelementptr inbounds i8, ptr %185, i64 20
  %187 = getelementptr inbounds i8, ptr %186, i64 1
  %188 = load i8, ptr %187, align 1
  %189 = zext i8 %188 to i32
  %190 = shl i32 %189, 16
  %191 = add i32 %184, %190
  %192 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %193 = getelementptr inbounds i8, ptr %192, i64 20
  %194 = getelementptr inbounds i8, ptr %193, i64 2
  %195 = load i8, ptr %194, align 1
  %196 = zext i8 %195 to i32
  %197 = shl i32 %196, 8
  %198 = add i32 %191, %197
  %199 = getelementptr inbounds [24 x i8], ptr %9, i64 0, i64 0
  %200 = getelementptr inbounds i8, ptr %199, i64 20
  %201 = getelementptr inbounds i8, ptr %200, i64 3
  %202 = load i8, ptr %201, align 1
  %203 = zext i8 %202 to i32
  %204 = add i32 %198, %203
  call void @png_set_mDCV_fixed(ptr noundef %137, ptr noundef %138, i32 noundef %140, i32 noundef %142, i32 noundef %144, i32 noundef %146, i32 noundef %148, i32 noundef %150, i32 noundef %152, i32 noundef %154, i32 noundef %179, i32 noundef %204)
  %205 = load ptr, ptr %5, align 8
  %206 = getelementptr inbounds %struct.png_struct_def, ptr %205, i32 0, i32 80
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %206, ptr align 4 %8, i64 32, i1 false)
  store i32 3, ptr %4, align 4
  br label %207

207:                                              ; preds = %16, %15
  %208 = load i32, ptr %4, align 4
  ret i32 %208
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_oFFs(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca [9 x i8], align 1
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  call void @png_crc_read(ptr noundef %12, ptr noundef %13, i32 noundef 9)
  %14 = load ptr, ptr %5, align 8
  %15 = call i32 @png_crc_finish(ptr noundef %14, i32 noundef 0)
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %146

18:                                               ; preds = %3
  %19 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %20 = load i8, ptr %19, align 1
  %21 = zext i8 %20 to i32
  %22 = and i32 %21, 128
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %50

24:                                               ; preds = %18
  %25 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %26 = load i8, ptr %25, align 1
  %27 = zext i8 %26 to i32
  %28 = shl i32 %27, 24
  %29 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %30 = getelementptr inbounds i8, ptr %29, i64 1
  %31 = load i8, ptr %30, align 1
  %32 = zext i8 %31 to i32
  %33 = shl i32 %32, 16
  %34 = add i32 %28, %33
  %35 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %36 = getelementptr inbounds i8, ptr %35, i64 2
  %37 = load i8, ptr %36, align 1
  %38 = zext i8 %37 to i32
  %39 = shl i32 %38, 8
  %40 = add i32 %34, %39
  %41 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %42 = getelementptr inbounds i8, ptr %41, i64 3
  %43 = load i8, ptr %42, align 1
  %44 = zext i8 %43 to i32
  %45 = add i32 %40, %44
  %46 = xor i32 %45, -1
  %47 = add i32 %46, 1
  %48 = and i32 %47, 2147483647
  %49 = sub nsw i32 0, %48
  br label %72

50:                                               ; preds = %18
  %51 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %52 = load i8, ptr %51, align 1
  %53 = zext i8 %52 to i32
  %54 = shl i32 %53, 24
  %55 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %56 = getelementptr inbounds i8, ptr %55, i64 1
  %57 = load i8, ptr %56, align 1
  %58 = zext i8 %57 to i32
  %59 = shl i32 %58, 16
  %60 = add i32 %54, %59
  %61 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %62 = getelementptr inbounds i8, ptr %61, i64 2
  %63 = load i8, ptr %62, align 1
  %64 = zext i8 %63 to i32
  %65 = shl i32 %64, 8
  %66 = add i32 %60, %65
  %67 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %68 = getelementptr inbounds i8, ptr %67, i64 3
  %69 = load i8, ptr %68, align 1
  %70 = zext i8 %69 to i32
  %71 = add i32 %66, %70
  br label %72

72:                                               ; preds = %50, %24
  %73 = phi i32 [ %49, %24 ], [ %71, %50 ]
  store i32 %73, ptr %9, align 4
  %74 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %75 = getelementptr inbounds i8, ptr %74, i64 4
  %76 = load i8, ptr %75, align 1
  %77 = zext i8 %76 to i32
  %78 = and i32 %77, 128
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %110

80:                                               ; preds = %72
  %81 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %82 = getelementptr inbounds i8, ptr %81, i64 4
  %83 = load i8, ptr %82, align 1
  %84 = zext i8 %83 to i32
  %85 = shl i32 %84, 24
  %86 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %87 = getelementptr inbounds i8, ptr %86, i64 4
  %88 = getelementptr inbounds i8, ptr %87, i64 1
  %89 = load i8, ptr %88, align 1
  %90 = zext i8 %89 to i32
  %91 = shl i32 %90, 16
  %92 = add i32 %85, %91
  %93 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %94 = getelementptr inbounds i8, ptr %93, i64 4
  %95 = getelementptr inbounds i8, ptr %94, i64 2
  %96 = load i8, ptr %95, align 1
  %97 = zext i8 %96 to i32
  %98 = shl i32 %97, 8
  %99 = add i32 %92, %98
  %100 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %101 = getelementptr inbounds i8, ptr %100, i64 4
  %102 = getelementptr inbounds i8, ptr %101, i64 3
  %103 = load i8, ptr %102, align 1
  %104 = zext i8 %103 to i32
  %105 = add i32 %99, %104
  %106 = xor i32 %105, -1
  %107 = add i32 %106, 1
  %108 = and i32 %107, 2147483647
  %109 = sub nsw i32 0, %108
  br label %136

110:                                              ; preds = %72
  %111 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %112 = getelementptr inbounds i8, ptr %111, i64 4
  %113 = load i8, ptr %112, align 1
  %114 = zext i8 %113 to i32
  %115 = shl i32 %114, 24
  %116 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %117 = getelementptr inbounds i8, ptr %116, i64 4
  %118 = getelementptr inbounds i8, ptr %117, i64 1
  %119 = load i8, ptr %118, align 1
  %120 = zext i8 %119 to i32
  %121 = shl i32 %120, 16
  %122 = add i32 %115, %121
  %123 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %124 = getelementptr inbounds i8, ptr %123, i64 4
  %125 = getelementptr inbounds i8, ptr %124, i64 2
  %126 = load i8, ptr %125, align 1
  %127 = zext i8 %126 to i32
  %128 = shl i32 %127, 8
  %129 = add i32 %122, %128
  %130 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %131 = getelementptr inbounds i8, ptr %130, i64 4
  %132 = getelementptr inbounds i8, ptr %131, i64 3
  %133 = load i8, ptr %132, align 1
  %134 = zext i8 %133 to i32
  %135 = add i32 %129, %134
  br label %136

136:                                              ; preds = %110, %80
  %137 = phi i32 [ %109, %80 ], [ %135, %110 ]
  store i32 %137, ptr %10, align 4
  %138 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 8
  %139 = load i8, ptr %138, align 1
  %140 = zext i8 %139 to i32
  store i32 %140, ptr %11, align 4
  %141 = load ptr, ptr %5, align 8
  %142 = load ptr, ptr %6, align 8
  %143 = load i32, ptr %9, align 4
  %144 = load i32, ptr %10, align 4
  %145 = load i32, ptr %11, align 4
  call void @png_set_oFFs(ptr noundef %141, ptr noundef %142, i32 noundef %143, i32 noundef %144, i32 noundef %145)
  store i32 3, ptr %4, align 4
  br label %146

146:                                              ; preds = %136, %17
  %147 = load i32, ptr %4, align 4
  ret i32 %147
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_pCAL(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %18 = load ptr, ptr %5, align 8
  %19 = load i32, ptr %7, align 4
  %20 = add i32 %19, 1
  %21 = zext i32 %20 to i64
  %22 = call ptr @png_read_buffer(ptr noundef %18, i64 noundef %21)
  store ptr %22, ptr %12, align 8
  %23 = load ptr, ptr %12, align 8
  %24 = icmp eq ptr %23, null
  br i1 %24, label %25, label %30

25:                                               ; preds = %3
  %26 = load ptr, ptr %5, align 8
  %27 = load i32, ptr %7, align 4
  %28 = call i32 @png_crc_finish(ptr noundef %26, i32 noundef %27)
  %29 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %29, ptr noundef @.str.22)
  store i32 0, ptr %4, align 4
  br label %317

30:                                               ; preds = %3
  %31 = load ptr, ptr %5, align 8
  %32 = load ptr, ptr %12, align 8
  %33 = load i32, ptr %7, align 4
  call void @png_crc_read(ptr noundef %31, ptr noundef %32, i32 noundef %33)
  %34 = load ptr, ptr %5, align 8
  %35 = call i32 @png_crc_finish(ptr noundef %34, i32 noundef 0)
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %38

37:                                               ; preds = %30
  store i32 0, ptr %4, align 4
  br label %317

38:                                               ; preds = %30
  %39 = load ptr, ptr %12, align 8
  %40 = load i32, ptr %7, align 4
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i8, ptr %39, i64 %41
  store i8 0, ptr %42, align 1
  %43 = load ptr, ptr %12, align 8
  store ptr %43, ptr %13, align 8
  br label %44

44:                                               ; preds = %49, %38
  %45 = load ptr, ptr %13, align 8
  %46 = load i8, ptr %45, align 1
  %47 = icmp ne i8 %46, 0
  br i1 %47, label %48, label %52

48:                                               ; preds = %44
  br label %49

49:                                               ; preds = %48
  %50 = load ptr, ptr %13, align 8
  %51 = getelementptr inbounds i8, ptr %50, i32 1
  store ptr %51, ptr %13, align 8
  br label %44, !llvm.loop !31

52:                                               ; preds = %44
  %53 = load ptr, ptr %12, align 8
  %54 = load i32, ptr %7, align 4
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds i8, ptr %53, i64 %55
  store ptr %56, ptr %15, align 8
  %57 = load ptr, ptr %15, align 8
  %58 = load ptr, ptr %13, align 8
  %59 = ptrtoint ptr %57 to i64
  %60 = ptrtoint ptr %58 to i64
  %61 = sub i64 %59, %60
  %62 = icmp sle i64 %61, 12
  br i1 %62, label %63, label %65

63:                                               ; preds = %52
  %64 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %64, ptr noundef @.str.30)
  store i32 0, ptr %4, align 4
  br label %317

65:                                               ; preds = %52
  %66 = load ptr, ptr %13, align 8
  %67 = getelementptr inbounds i8, ptr %66, i64 1
  %68 = load i8, ptr %67, align 1
  %69 = zext i8 %68 to i32
  %70 = and i32 %69, 128
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %102

72:                                               ; preds = %65
  %73 = load ptr, ptr %13, align 8
  %74 = getelementptr inbounds i8, ptr %73, i64 1
  %75 = load i8, ptr %74, align 1
  %76 = zext i8 %75 to i32
  %77 = shl i32 %76, 24
  %78 = load ptr, ptr %13, align 8
  %79 = getelementptr inbounds i8, ptr %78, i64 1
  %80 = getelementptr inbounds i8, ptr %79, i64 1
  %81 = load i8, ptr %80, align 1
  %82 = zext i8 %81 to i32
  %83 = shl i32 %82, 16
  %84 = add i32 %77, %83
  %85 = load ptr, ptr %13, align 8
  %86 = getelementptr inbounds i8, ptr %85, i64 1
  %87 = getelementptr inbounds i8, ptr %86, i64 2
  %88 = load i8, ptr %87, align 1
  %89 = zext i8 %88 to i32
  %90 = shl i32 %89, 8
  %91 = add i32 %84, %90
  %92 = load ptr, ptr %13, align 8
  %93 = getelementptr inbounds i8, ptr %92, i64 1
  %94 = getelementptr inbounds i8, ptr %93, i64 3
  %95 = load i8, ptr %94, align 1
  %96 = zext i8 %95 to i32
  %97 = add i32 %91, %96
  %98 = xor i32 %97, -1
  %99 = add i32 %98, 1
  %100 = and i32 %99, 2147483647
  %101 = sub nsw i32 0, %100
  br label %128

102:                                              ; preds = %65
  %103 = load ptr, ptr %13, align 8
  %104 = getelementptr inbounds i8, ptr %103, i64 1
  %105 = load i8, ptr %104, align 1
  %106 = zext i8 %105 to i32
  %107 = shl i32 %106, 24
  %108 = load ptr, ptr %13, align 8
  %109 = getelementptr inbounds i8, ptr %108, i64 1
  %110 = getelementptr inbounds i8, ptr %109, i64 1
  %111 = load i8, ptr %110, align 1
  %112 = zext i8 %111 to i32
  %113 = shl i32 %112, 16
  %114 = add i32 %107, %113
  %115 = load ptr, ptr %13, align 8
  %116 = getelementptr inbounds i8, ptr %115, i64 1
  %117 = getelementptr inbounds i8, ptr %116, i64 2
  %118 = load i8, ptr %117, align 1
  %119 = zext i8 %118 to i32
  %120 = shl i32 %119, 8
  %121 = add i32 %114, %120
  %122 = load ptr, ptr %13, align 8
  %123 = getelementptr inbounds i8, ptr %122, i64 1
  %124 = getelementptr inbounds i8, ptr %123, i64 3
  %125 = load i8, ptr %124, align 1
  %126 = zext i8 %125 to i32
  %127 = add i32 %121, %126
  br label %128

128:                                              ; preds = %102, %72
  %129 = phi i32 [ %101, %72 ], [ %127, %102 ]
  store i32 %129, ptr %8, align 4
  %130 = load ptr, ptr %13, align 8
  %131 = getelementptr inbounds i8, ptr %130, i64 5
  %132 = load i8, ptr %131, align 1
  %133 = zext i8 %132 to i32
  %134 = and i32 %133, 128
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %136, label %166

136:                                              ; preds = %128
  %137 = load ptr, ptr %13, align 8
  %138 = getelementptr inbounds i8, ptr %137, i64 5
  %139 = load i8, ptr %138, align 1
  %140 = zext i8 %139 to i32
  %141 = shl i32 %140, 24
  %142 = load ptr, ptr %13, align 8
  %143 = getelementptr inbounds i8, ptr %142, i64 5
  %144 = getelementptr inbounds i8, ptr %143, i64 1
  %145 = load i8, ptr %144, align 1
  %146 = zext i8 %145 to i32
  %147 = shl i32 %146, 16
  %148 = add i32 %141, %147
  %149 = load ptr, ptr %13, align 8
  %150 = getelementptr inbounds i8, ptr %149, i64 5
  %151 = getelementptr inbounds i8, ptr %150, i64 2
  %152 = load i8, ptr %151, align 1
  %153 = zext i8 %152 to i32
  %154 = shl i32 %153, 8
  %155 = add i32 %148, %154
  %156 = load ptr, ptr %13, align 8
  %157 = getelementptr inbounds i8, ptr %156, i64 5
  %158 = getelementptr inbounds i8, ptr %157, i64 3
  %159 = load i8, ptr %158, align 1
  %160 = zext i8 %159 to i32
  %161 = add i32 %155, %160
  %162 = xor i32 %161, -1
  %163 = add i32 %162, 1
  %164 = and i32 %163, 2147483647
  %165 = sub nsw i32 0, %164
  br label %192

166:                                              ; preds = %128
  %167 = load ptr, ptr %13, align 8
  %168 = getelementptr inbounds i8, ptr %167, i64 5
  %169 = load i8, ptr %168, align 1
  %170 = zext i8 %169 to i32
  %171 = shl i32 %170, 24
  %172 = load ptr, ptr %13, align 8
  %173 = getelementptr inbounds i8, ptr %172, i64 5
  %174 = getelementptr inbounds i8, ptr %173, i64 1
  %175 = load i8, ptr %174, align 1
  %176 = zext i8 %175 to i32
  %177 = shl i32 %176, 16
  %178 = add i32 %171, %177
  %179 = load ptr, ptr %13, align 8
  %180 = getelementptr inbounds i8, ptr %179, i64 5
  %181 = getelementptr inbounds i8, ptr %180, i64 2
  %182 = load i8, ptr %181, align 1
  %183 = zext i8 %182 to i32
  %184 = shl i32 %183, 8
  %185 = add i32 %178, %184
  %186 = load ptr, ptr %13, align 8
  %187 = getelementptr inbounds i8, ptr %186, i64 5
  %188 = getelementptr inbounds i8, ptr %187, i64 3
  %189 = load i8, ptr %188, align 1
  %190 = zext i8 %189 to i32
  %191 = add i32 %185, %190
  br label %192

192:                                              ; preds = %166, %136
  %193 = phi i32 [ %165, %136 ], [ %191, %166 ]
  store i32 %193, ptr %9, align 4
  %194 = load ptr, ptr %13, align 8
  %195 = getelementptr inbounds i8, ptr %194, i64 9
  %196 = load i8, ptr %195, align 1
  store i8 %196, ptr %10, align 1
  %197 = load ptr, ptr %13, align 8
  %198 = getelementptr inbounds i8, ptr %197, i64 10
  %199 = load i8, ptr %198, align 1
  store i8 %199, ptr %11, align 1
  %200 = load ptr, ptr %13, align 8
  %201 = getelementptr inbounds i8, ptr %200, i64 11
  store ptr %201, ptr %14, align 8
  %202 = load i8, ptr %10, align 1
  %203 = zext i8 %202 to i32
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %205, label %209

205:                                              ; preds = %192
  %206 = load i8, ptr %11, align 1
  %207 = zext i8 %206 to i32
  %208 = icmp ne i32 %207, 2
  br i1 %208, label %233, label %209

209:                                              ; preds = %205, %192
  %210 = load i8, ptr %10, align 1
  %211 = zext i8 %210 to i32
  %212 = icmp eq i32 %211, 1
  br i1 %212, label %213, label %217

213:                                              ; preds = %209
  %214 = load i8, ptr %11, align 1
  %215 = zext i8 %214 to i32
  %216 = icmp ne i32 %215, 3
  br i1 %216, label %233, label %217

217:                                              ; preds = %213, %209
  %218 = load i8, ptr %10, align 1
  %219 = zext i8 %218 to i32
  %220 = icmp eq i32 %219, 2
  br i1 %220, label %221, label %225

221:                                              ; preds = %217
  %222 = load i8, ptr %11, align 1
  %223 = zext i8 %222 to i32
  %224 = icmp ne i32 %223, 3
  br i1 %224, label %233, label %225

225:                                              ; preds = %221, %217
  %226 = load i8, ptr %10, align 1
  %227 = zext i8 %226 to i32
  %228 = icmp eq i32 %227, 3
  br i1 %228, label %229, label %235

229:                                              ; preds = %225
  %230 = load i8, ptr %11, align 1
  %231 = zext i8 %230 to i32
  %232 = icmp ne i32 %231, 4
  br i1 %232, label %233, label %235

233:                                              ; preds = %229, %221, %213, %205
  %234 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %234, ptr noundef @.str.40)
  store i32 0, ptr %4, align 4
  br label %317

235:                                              ; preds = %229, %225
  %236 = load i8, ptr %10, align 1
  %237 = zext i8 %236 to i32
  %238 = icmp sge i32 %237, 4
  br i1 %238, label %239, label %241

239:                                              ; preds = %235
  %240 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %240, ptr noundef @.str.41)
  br label %241

241:                                              ; preds = %239, %235
  br label %242

242:                                              ; preds = %241
  %243 = load ptr, ptr %14, align 8
  store ptr %243, ptr %13, align 8
  br label %244

244:                                              ; preds = %249, %242
  %245 = load ptr, ptr %13, align 8
  %246 = load i8, ptr %245, align 1
  %247 = icmp ne i8 %246, 0
  br i1 %247, label %248, label %252

248:                                              ; preds = %244
  br label %249

249:                                              ; preds = %248
  %250 = load ptr, ptr %13, align 8
  %251 = getelementptr inbounds i8, ptr %250, i32 1
  store ptr %251, ptr %13, align 8
  br label %244, !llvm.loop !32

252:                                              ; preds = %244
  %253 = load ptr, ptr %5, align 8
  %254 = load i8, ptr %11, align 1
  %255 = zext i8 %254 to i64
  %256 = mul i64 %255, 8
  %257 = call noalias ptr @png_malloc_warn(ptr noundef %253, i64 noundef %256)
  store ptr %257, ptr %16, align 8
  %258 = load ptr, ptr %16, align 8
  %259 = icmp eq ptr %258, null
  br i1 %259, label %260, label %262

260:                                              ; preds = %252
  %261 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %261, ptr noundef @.str.22)
  store i32 0, ptr %4, align 4
  br label %317

262:                                              ; preds = %252
  store i32 0, ptr %17, align 4
  br label %263

263:                                              ; preds = %300, %262
  %264 = load i32, ptr %17, align 4
  %265 = load i8, ptr %11, align 1
  %266 = zext i8 %265 to i32
  %267 = icmp slt i32 %264, %266
  br i1 %267, label %268, label %303

268:                                              ; preds = %263
  %269 = load ptr, ptr %13, align 8
  %270 = getelementptr inbounds i8, ptr %269, i32 1
  store ptr %270, ptr %13, align 8
  %271 = load ptr, ptr %13, align 8
  %272 = load ptr, ptr %16, align 8
  %273 = load i32, ptr %17, align 4
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds ptr, ptr %272, i64 %274
  store ptr %271, ptr %275, align 8
  br label %276

276:                                              ; preds = %288, %268
  %277 = load ptr, ptr %13, align 8
  %278 = load ptr, ptr %15, align 8
  %279 = icmp ule ptr %277, %278
  br i1 %279, label %280, label %285

280:                                              ; preds = %276
  %281 = load ptr, ptr %13, align 8
  %282 = load i8, ptr %281, align 1
  %283 = zext i8 %282 to i32
  %284 = icmp ne i32 %283, 0
  br label %285

285:                                              ; preds = %280, %276
  %286 = phi i1 [ false, %276 ], [ %284, %280 ]
  br i1 %286, label %287, label %291

287:                                              ; preds = %285
  br label %288

288:                                              ; preds = %287
  %289 = load ptr, ptr %13, align 8
  %290 = getelementptr inbounds i8, ptr %289, i32 1
  store ptr %290, ptr %13, align 8
  br label %276, !llvm.loop !33

291:                                              ; preds = %285
  %292 = load ptr, ptr %13, align 8
  %293 = load ptr, ptr %15, align 8
  %294 = icmp ugt ptr %292, %293
  br i1 %294, label %295, label %299

295:                                              ; preds = %291
  %296 = load ptr, ptr %5, align 8
  %297 = load ptr, ptr %16, align 8
  call void @png_free(ptr noundef %296, ptr noundef %297)
  %298 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %298, ptr noundef @.str.42)
  store i32 0, ptr %4, align 4
  br label %317

299:                                              ; preds = %291
  br label %300

300:                                              ; preds = %299
  %301 = load i32, ptr %17, align 4
  %302 = add nsw i32 %301, 1
  store i32 %302, ptr %17, align 4
  br label %263, !llvm.loop !34

303:                                              ; preds = %263
  %304 = load ptr, ptr %5, align 8
  %305 = load ptr, ptr %6, align 8
  %306 = load ptr, ptr %12, align 8
  %307 = load i32, ptr %8, align 4
  %308 = load i32, ptr %9, align 4
  %309 = load i8, ptr %10, align 1
  %310 = zext i8 %309 to i32
  %311 = load i8, ptr %11, align 1
  %312 = zext i8 %311 to i32
  %313 = load ptr, ptr %14, align 8
  %314 = load ptr, ptr %16, align 8
  call void @png_set_pCAL(ptr noundef %304, ptr noundef %305, ptr noundef %306, i32 noundef %307, i32 noundef %308, i32 noundef %310, i32 noundef %312, ptr noundef %313, ptr noundef %314)
  %315 = load ptr, ptr %5, align 8
  %316 = load ptr, ptr %16, align 8
  call void @png_free(ptr noundef %315, ptr noundef %316)
  store i32 3, ptr %4, align 4
  br label %317

317:                                              ; preds = %303, %295, %260, %233, %63, %37, %25
  %318 = load i32, ptr %4, align 4
  ret i32 %318
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_pHYs(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca [9 x i8], align 1
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  call void @png_crc_read(ptr noundef %12, ptr noundef %13, i32 noundef 9)
  %14 = load ptr, ptr %5, align 8
  %15 = call i32 @png_crc_finish(ptr noundef %14, i32 noundef 0)
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %73

18:                                               ; preds = %3
  %19 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %20 = load i8, ptr %19, align 1
  %21 = zext i8 %20 to i32
  %22 = shl i32 %21, 24
  %23 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %24 = getelementptr inbounds i8, ptr %23, i64 1
  %25 = load i8, ptr %24, align 1
  %26 = zext i8 %25 to i32
  %27 = shl i32 %26, 16
  %28 = add i32 %22, %27
  %29 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %30 = getelementptr inbounds i8, ptr %29, i64 2
  %31 = load i8, ptr %30, align 1
  %32 = zext i8 %31 to i32
  %33 = shl i32 %32, 8
  %34 = add i32 %28, %33
  %35 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %36 = getelementptr inbounds i8, ptr %35, i64 3
  %37 = load i8, ptr %36, align 1
  %38 = zext i8 %37 to i32
  %39 = add i32 %34, %38
  store i32 %39, ptr %9, align 4
  %40 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %41 = getelementptr inbounds i8, ptr %40, i64 4
  %42 = load i8, ptr %41, align 1
  %43 = zext i8 %42 to i32
  %44 = shl i32 %43, 24
  %45 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %46 = getelementptr inbounds i8, ptr %45, i64 4
  %47 = getelementptr inbounds i8, ptr %46, i64 1
  %48 = load i8, ptr %47, align 1
  %49 = zext i8 %48 to i32
  %50 = shl i32 %49, 16
  %51 = add i32 %44, %50
  %52 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %53 = getelementptr inbounds i8, ptr %52, i64 4
  %54 = getelementptr inbounds i8, ptr %53, i64 2
  %55 = load i8, ptr %54, align 1
  %56 = zext i8 %55 to i32
  %57 = shl i32 %56, 8
  %58 = add i32 %51, %57
  %59 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 0
  %60 = getelementptr inbounds i8, ptr %59, i64 4
  %61 = getelementptr inbounds i8, ptr %60, i64 3
  %62 = load i8, ptr %61, align 1
  %63 = zext i8 %62 to i32
  %64 = add i32 %58, %63
  store i32 %64, ptr %10, align 4
  %65 = getelementptr inbounds [9 x i8], ptr %8, i64 0, i64 8
  %66 = load i8, ptr %65, align 1
  %67 = zext i8 %66 to i32
  store i32 %67, ptr %11, align 4
  %68 = load ptr, ptr %5, align 8
  %69 = load ptr, ptr %6, align 8
  %70 = load i32, ptr %9, align 4
  %71 = load i32, ptr %10, align 4
  %72 = load i32, ptr %11, align 4
  call void @png_set_pHYs(ptr noundef %68, ptr noundef %69, i32 noundef %70, i32 noundef %71, i32 noundef %72)
  store i32 3, ptr %4, align 4
  br label %73

73:                                               ; preds = %18, %17
  %74 = load i32, ptr %4, align 4
  ret i32 %74
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_sBIT(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8, align 1
  %11 = alloca [4 x i8], align 1
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.png_struct_def, ptr %12, i32 0, i32 62
  %14 = load i8, ptr %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp eq i32 %15, 3
  br i1 %16, label %17, label %18

17:                                               ; preds = %3
  store i32 3, ptr %8, align 4
  store i8 8, ptr %10, align 1
  br label %26

18:                                               ; preds = %3
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.png_struct_def, ptr %19, i32 0, i32 66
  %21 = load i8, ptr %20, align 1
  %22 = zext i8 %21 to i32
  store i32 %22, ptr %8, align 4
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %struct.png_struct_def, ptr %23, i32 0, i32 63
  %25 = load i8, ptr %24, align 8
  store i8 %25, ptr %10, align 1
  br label %26

26:                                               ; preds = %18, %17
  %27 = load i32, ptr %7, align 4
  %28 = load i32, ptr %8, align 4
  %29 = icmp ne i32 %27, %28
  br i1 %29, label %30, label %35

30:                                               ; preds = %26
  %31 = load ptr, ptr %5, align 8
  %32 = load i32, ptr %7, align 4
  %33 = call i32 @png_crc_finish(ptr noundef %31, i32 noundef %32)
  %34 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %34, ptr noundef @.str.43)
  store i32 0, ptr %4, align 4
  br label %134

35:                                               ; preds = %26
  %36 = load i8, ptr %10, align 1
  %37 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 3
  store i8 %36, ptr %37, align 1
  %38 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 2
  store i8 %36, ptr %38, align 1
  %39 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 1
  store i8 %36, ptr %39, align 1
  %40 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 0
  store i8 %36, ptr %40, align 1
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 0
  %43 = load i32, ptr %8, align 4
  call void @png_crc_read(ptr noundef %41, ptr noundef %42, i32 noundef %43)
  %44 = load ptr, ptr %5, align 8
  %45 = call i32 @png_crc_finish(ptr noundef %44, i32 noundef 0)
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %48

47:                                               ; preds = %35
  store i32 0, ptr %4, align 4
  br label %134

48:                                               ; preds = %35
  store i32 0, ptr %9, align 4
  br label %49

49:                                               ; preds = %72, %48
  %50 = load i32, ptr %9, align 4
  %51 = load i32, ptr %8, align 4
  %52 = icmp ult i32 %50, %51
  br i1 %52, label %53, label %75

53:                                               ; preds = %49
  %54 = load i32, ptr %9, align 4
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 %55
  %57 = load i8, ptr %56, align 1
  %58 = zext i8 %57 to i32
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %69, label %60

60:                                               ; preds = %53
  %61 = load i32, ptr %9, align 4
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 %62
  %64 = load i8, ptr %63, align 1
  %65 = zext i8 %64 to i32
  %66 = load i8, ptr %10, align 1
  %67 = zext i8 %66 to i32
  %68 = icmp sgt i32 %65, %67
  br i1 %68, label %69, label %71

69:                                               ; preds = %60, %53
  %70 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %70, ptr noundef @.str.30)
  store i32 0, ptr %4, align 4
  br label %134

71:                                               ; preds = %60
  br label %72

72:                                               ; preds = %71
  %73 = load i32, ptr %9, align 4
  %74 = add i32 %73, 1
  store i32 %74, ptr %9, align 4
  br label %49, !llvm.loop !35

75:                                               ; preds = %49
  %76 = load ptr, ptr %5, align 8
  %77 = getelementptr inbounds %struct.png_struct_def, ptr %76, i32 0, i32 62
  %78 = load i8, ptr %77, align 1
  %79 = zext i8 %78 to i32
  %80 = and i32 %79, 2
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %82, label %103

82:                                               ; preds = %75
  %83 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 0
  %84 = load i8, ptr %83, align 1
  %85 = load ptr, ptr %5, align 8
  %86 = getelementptr inbounds %struct.png_struct_def, ptr %85, i32 0, i32 92
  %87 = getelementptr inbounds %struct.png_color_8_struct, ptr %86, i32 0, i32 0
  store i8 %84, ptr %87, align 8
  %88 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 1
  %89 = load i8, ptr %88, align 1
  %90 = load ptr, ptr %5, align 8
  %91 = getelementptr inbounds %struct.png_struct_def, ptr %90, i32 0, i32 92
  %92 = getelementptr inbounds %struct.png_color_8_struct, ptr %91, i32 0, i32 1
  store i8 %89, ptr %92, align 1
  %93 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 2
  %94 = load i8, ptr %93, align 1
  %95 = load ptr, ptr %5, align 8
  %96 = getelementptr inbounds %struct.png_struct_def, ptr %95, i32 0, i32 92
  %97 = getelementptr inbounds %struct.png_color_8_struct, ptr %96, i32 0, i32 2
  store i8 %94, ptr %97, align 2
  %98 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 3
  %99 = load i8, ptr %98, align 1
  %100 = load ptr, ptr %5, align 8
  %101 = getelementptr inbounds %struct.png_struct_def, ptr %100, i32 0, i32 92
  %102 = getelementptr inbounds %struct.png_color_8_struct, ptr %101, i32 0, i32 4
  store i8 %99, ptr %102, align 4
  br label %129

103:                                              ; preds = %75
  %104 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 0
  %105 = load i8, ptr %104, align 1
  %106 = load ptr, ptr %5, align 8
  %107 = getelementptr inbounds %struct.png_struct_def, ptr %106, i32 0, i32 92
  %108 = getelementptr inbounds %struct.png_color_8_struct, ptr %107, i32 0, i32 3
  store i8 %105, ptr %108, align 1
  %109 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 0
  %110 = load i8, ptr %109, align 1
  %111 = load ptr, ptr %5, align 8
  %112 = getelementptr inbounds %struct.png_struct_def, ptr %111, i32 0, i32 92
  %113 = getelementptr inbounds %struct.png_color_8_struct, ptr %112, i32 0, i32 0
  store i8 %110, ptr %113, align 8
  %114 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 0
  %115 = load i8, ptr %114, align 1
  %116 = load ptr, ptr %5, align 8
  %117 = getelementptr inbounds %struct.png_struct_def, ptr %116, i32 0, i32 92
  %118 = getelementptr inbounds %struct.png_color_8_struct, ptr %117, i32 0, i32 1
  store i8 %115, ptr %118, align 1
  %119 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 0
  %120 = load i8, ptr %119, align 1
  %121 = load ptr, ptr %5, align 8
  %122 = getelementptr inbounds %struct.png_struct_def, ptr %121, i32 0, i32 92
  %123 = getelementptr inbounds %struct.png_color_8_struct, ptr %122, i32 0, i32 2
  store i8 %120, ptr %123, align 2
  %124 = getelementptr inbounds [4 x i8], ptr %11, i64 0, i64 1
  %125 = load i8, ptr %124, align 1
  %126 = load ptr, ptr %5, align 8
  %127 = getelementptr inbounds %struct.png_struct_def, ptr %126, i32 0, i32 92
  %128 = getelementptr inbounds %struct.png_color_8_struct, ptr %127, i32 0, i32 4
  store i8 %125, ptr %128, align 4
  br label %129

129:                                              ; preds = %103, %82
  %130 = load ptr, ptr %5, align 8
  %131 = load ptr, ptr %6, align 8
  %132 = load ptr, ptr %5, align 8
  %133 = getelementptr inbounds %struct.png_struct_def, ptr %132, i32 0, i32 92
  call void @png_set_sBIT(ptr noundef %130, ptr noundef %131, ptr noundef %133)
  store i32 3, ptr %4, align 4
  br label %134

134:                                              ; preds = %129, %69, %47, %30
  %135 = load i32, ptr %4, align 4
  ret i32 %135
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_sCAL(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %12 = load ptr, ptr %5, align 8
  %13 = load i32, ptr %7, align 4
  %14 = add i32 %13, 1
  %15 = zext i32 %14 to i64
  %16 = call ptr @png_read_buffer(ptr noundef %12, i64 noundef %15)
  store ptr %16, ptr %8, align 8
  %17 = load ptr, ptr %8, align 8
  %18 = icmp eq ptr %17, null
  br i1 %18, label %19, label %24

19:                                               ; preds = %3
  %20 = load ptr, ptr %5, align 8
  %21 = load i32, ptr %7, align 4
  %22 = call i32 @png_crc_finish(ptr noundef %20, i32 noundef %21)
  %23 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %23, ptr noundef @.str.22)
  store i32 0, ptr %4, align 4
  br label %117

24:                                               ; preds = %3
  %25 = load ptr, ptr %5, align 8
  %26 = load ptr, ptr %8, align 8
  %27 = load i32, ptr %7, align 4
  call void @png_crc_read(ptr noundef %25, ptr noundef %26, i32 noundef %27)
  %28 = load ptr, ptr %8, align 8
  %29 = load i32, ptr %7, align 4
  %30 = zext i32 %29 to i64
  %31 = getelementptr inbounds i8, ptr %28, i64 %30
  store i8 0, ptr %31, align 1
  %32 = load ptr, ptr %5, align 8
  %33 = call i32 @png_crc_finish(ptr noundef %32, i32 noundef 0)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %24
  store i32 0, ptr %4, align 4
  br label %117

36:                                               ; preds = %24
  %37 = load ptr, ptr %8, align 8
  %38 = getelementptr inbounds i8, ptr %37, i64 0
  %39 = load i8, ptr %38, align 1
  %40 = zext i8 %39 to i32
  %41 = icmp ne i32 %40, 1
  br i1 %41, label %42, label %50

42:                                               ; preds = %36
  %43 = load ptr, ptr %8, align 8
  %44 = getelementptr inbounds i8, ptr %43, i64 0
  %45 = load i8, ptr %44, align 1
  %46 = zext i8 %45 to i32
  %47 = icmp ne i32 %46, 2
  br i1 %47, label %48, label %50

48:                                               ; preds = %42
  %49 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %49, ptr noundef @.str.44)
  store i32 0, ptr %4, align 4
  br label %117

50:                                               ; preds = %42, %36
  store i64 1, ptr %9, align 8
  store i32 0, ptr %10, align 4
  %51 = load ptr, ptr %8, align 8
  %52 = load i32, ptr %7, align 4
  %53 = zext i32 %52 to i64
  %54 = call i32 @png_check_fp_number(ptr noundef %51, i64 noundef %53, ptr noundef %10, ptr noundef %9)
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %69, label %56

56:                                               ; preds = %50
  %57 = load i64, ptr %9, align 8
  %58 = load i32, ptr %7, align 4
  %59 = zext i32 %58 to i64
  %60 = icmp uge i64 %57, %59
  br i1 %60, label %69, label %61

61:                                               ; preds = %56
  %62 = load ptr, ptr %8, align 8
  %63 = load i64, ptr %9, align 8
  %64 = add i64 %63, 1
  store i64 %64, ptr %9, align 8
  %65 = getelementptr inbounds i8, ptr %62, i64 %63
  %66 = load i8, ptr %65, align 1
  %67 = zext i8 %66 to i32
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %71

69:                                               ; preds = %61, %56, %50
  %70 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %70, ptr noundef @.str.45)
  br label %116

71:                                               ; preds = %61
  %72 = load i32, ptr %10, align 4
  %73 = and i32 %72, 392
  %74 = icmp eq i32 %73, 264
  %75 = zext i1 %74 to i32
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %79

77:                                               ; preds = %71
  %78 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %78, ptr noundef @.str.46)
  br label %115

79:                                               ; preds = %71
  %80 = load i64, ptr %9, align 8
  store i64 %80, ptr %11, align 8
  store i32 0, ptr %10, align 4
  %81 = load ptr, ptr %8, align 8
  %82 = load i32, ptr %7, align 4
  %83 = zext i32 %82 to i64
  %84 = call i32 @png_check_fp_number(ptr noundef %81, i64 noundef %83, ptr noundef %10, ptr noundef %9)
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %91, label %86

86:                                               ; preds = %79
  %87 = load i64, ptr %9, align 8
  %88 = load i32, ptr %7, align 4
  %89 = zext i32 %88 to i64
  %90 = icmp ne i64 %87, %89
  br i1 %90, label %91, label %93

91:                                               ; preds = %86, %79
  %92 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %92, ptr noundef @.str.47)
  br label %114

93:                                               ; preds = %86
  %94 = load i32, ptr %10, align 4
  %95 = and i32 %94, 392
  %96 = icmp eq i32 %95, 264
  %97 = zext i1 %96 to i32
  %98 = icmp eq i32 %97, 0
  br i1 %98, label %99, label %101

99:                                               ; preds = %93
  %100 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %100, ptr noundef @.str.48)
  br label %113

101:                                              ; preds = %93
  %102 = load ptr, ptr %5, align 8
  %103 = load ptr, ptr %6, align 8
  %104 = load ptr, ptr %8, align 8
  %105 = getelementptr inbounds i8, ptr %104, i64 0
  %106 = load i8, ptr %105, align 1
  %107 = zext i8 %106 to i32
  %108 = load ptr, ptr %8, align 8
  %109 = getelementptr inbounds i8, ptr %108, i64 1
  %110 = load ptr, ptr %8, align 8
  %111 = load i64, ptr %11, align 8
  %112 = getelementptr inbounds i8, ptr %110, i64 %111
  call void @png_set_sCAL_s(ptr noundef %102, ptr noundef %103, i32 noundef %107, ptr noundef %109, ptr noundef %112)
  store i32 3, ptr %4, align 4
  br label %117

113:                                              ; preds = %99
  br label %114

114:                                              ; preds = %113, %91
  br label %115

115:                                              ; preds = %114, %77
  br label %116

116:                                              ; preds = %115, %69
  store i32 0, ptr %4, align 4
  br label %117

117:                                              ; preds = %116, %101, %48, %35, %19
  %118 = load i32, ptr %4, align 4
  ret i32 %118
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_sPLT(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %struct.png_sPLT_struct, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 0, ptr %15, align 4
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.png_struct_def, ptr %18, i32 0, i32 140
  %20 = load i32, ptr %19, align 4
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %43

22:                                               ; preds = %3
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds %struct.png_struct_def, ptr %23, i32 0, i32 140
  %25 = load i32, ptr %24, align 4
  %26 = icmp eq i32 %25, 1
  br i1 %26, label %27, label %31

27:                                               ; preds = %22
  %28 = load ptr, ptr %5, align 8
  %29 = load i32, ptr %7, align 4
  %30 = call i32 @png_crc_finish(ptr noundef %28, i32 noundef %29)
  store i32 0, ptr %4, align 4
  br label %270

31:                                               ; preds = %22
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds %struct.png_struct_def, ptr %32, i32 0, i32 140
  %34 = load i32, ptr %33, align 4
  %35 = add i32 %34, -1
  store i32 %35, ptr %33, align 4
  %36 = icmp eq i32 %35, 1
  br i1 %36, label %37, label %42

37:                                               ; preds = %31
  %38 = load ptr, ptr %5, align 8
  call void @png_warning(ptr noundef %38, ptr noundef @.str.49)
  %39 = load ptr, ptr %5, align 8
  %40 = load i32, ptr %7, align 4
  %41 = call i32 @png_crc_finish(ptr noundef %39, i32 noundef %40)
  store i32 0, ptr %4, align 4
  br label %270

42:                                               ; preds = %31
  br label %43

43:                                               ; preds = %42, %3
  %44 = load ptr, ptr %5, align 8
  %45 = load i32, ptr %7, align 4
  %46 = add i32 %45, 1
  %47 = zext i32 %46 to i64
  %48 = call ptr @png_read_buffer(ptr noundef %44, i64 noundef %47)
  store ptr %48, ptr %9, align 8
  %49 = load ptr, ptr %9, align 8
  %50 = icmp eq ptr %49, null
  br i1 %50, label %51, label %56

51:                                               ; preds = %43
  %52 = load ptr, ptr %5, align 8
  %53 = load i32, ptr %7, align 4
  %54 = call i32 @png_crc_finish(ptr noundef %52, i32 noundef %53)
  %55 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %55, ptr noundef @.str.22)
  store i32 0, ptr %4, align 4
  br label %270

56:                                               ; preds = %43
  %57 = load ptr, ptr %5, align 8
  %58 = load ptr, ptr %9, align 8
  %59 = load i32, ptr %7, align 4
  call void @png_crc_read(ptr noundef %57, ptr noundef %58, i32 noundef %59)
  %60 = load ptr, ptr %5, align 8
  %61 = load i32, ptr %15, align 4
  %62 = call i32 @png_crc_finish(ptr noundef %60, i32 noundef %61)
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %65

64:                                               ; preds = %56
  store i32 0, ptr %4, align 4
  br label %270

65:                                               ; preds = %56
  %66 = load ptr, ptr %9, align 8
  %67 = load i32, ptr %7, align 4
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds i8, ptr %66, i64 %68
  store i8 0, ptr %69, align 1
  %70 = load ptr, ptr %9, align 8
  store ptr %70, ptr %8, align 8
  br label %71

71:                                               ; preds = %76, %65
  %72 = load ptr, ptr %8, align 8
  %73 = load i8, ptr %72, align 1
  %74 = icmp ne i8 %73, 0
  br i1 %74, label %75, label %79

75:                                               ; preds = %71
  br label %76

76:                                               ; preds = %75
  %77 = load ptr, ptr %8, align 8
  %78 = getelementptr inbounds i8, ptr %77, i32 1
  store ptr %78, ptr %8, align 8
  br label %71, !llvm.loop !36

79:                                               ; preds = %71
  %80 = load ptr, ptr %8, align 8
  %81 = getelementptr inbounds i8, ptr %80, i32 1
  store ptr %81, ptr %8, align 8
  %82 = load i32, ptr %7, align 4
  %83 = icmp ult i32 %82, 2
  br i1 %83, label %92, label %84

84:                                               ; preds = %79
  %85 = load ptr, ptr %8, align 8
  %86 = load ptr, ptr %9, align 8
  %87 = load i32, ptr %7, align 4
  %88 = sub i32 %87, 2
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds i8, ptr %86, i64 %89
  %91 = icmp ugt ptr %85, %90
  br i1 %91, label %92, label %94

92:                                               ; preds = %84, %79
  %93 = load ptr, ptr %5, align 8
  call void @png_warning(ptr noundef %93, ptr noundef @.str.50)
  store i32 0, ptr %4, align 4
  br label %270

94:                                               ; preds = %84
  %95 = load ptr, ptr %8, align 8
  %96 = getelementptr inbounds i8, ptr %95, i32 1
  store ptr %96, ptr %8, align 8
  %97 = load i8, ptr %95, align 1
  %98 = getelementptr inbounds %struct.png_sPLT_struct, ptr %10, i32 0, i32 1
  store i8 %97, ptr %98, align 8
  %99 = getelementptr inbounds %struct.png_sPLT_struct, ptr %10, i32 0, i32 1
  %100 = load i8, ptr %99, align 8
  %101 = zext i8 %100 to i32
  %102 = icmp eq i32 %101, 8
  %103 = zext i1 %102 to i64
  %104 = select i1 %102, i32 6, i32 10
  store i32 %104, ptr %13, align 4
  %105 = load i32, ptr %7, align 4
  %106 = load ptr, ptr %8, align 8
  %107 = load ptr, ptr %9, align 8
  %108 = ptrtoint ptr %106 to i64
  %109 = ptrtoint ptr %107 to i64
  %110 = sub i64 %108, %109
  %111 = trunc i64 %110 to i32
  %112 = sub i32 %105, %111
  store i32 %112, ptr %12, align 4
  %113 = load i32, ptr %12, align 4
  %114 = load i32, ptr %13, align 4
  %115 = urem i32 %113, %114
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %117, label %119

117:                                              ; preds = %94
  %118 = load ptr, ptr %5, align 8
  call void @png_warning(ptr noundef %118, ptr noundef @.str.51)
  store i32 0, ptr %4, align 4
  br label %270

119:                                              ; preds = %94
  %120 = load i32, ptr %12, align 4
  %121 = load i32, ptr %13, align 4
  %122 = udiv i32 %120, %121
  store i32 %122, ptr %16, align 4
  store i64 1844674407370955161, ptr %17, align 8
  %123 = load i32, ptr %16, align 4
  %124 = zext i32 %123 to i64
  %125 = load i64, ptr %17, align 8
  %126 = icmp ugt i64 %124, %125
  br i1 %126, label %127, label %129

127:                                              ; preds = %119
  %128 = load ptr, ptr %5, align 8
  call void @png_warning(ptr noundef %128, ptr noundef @.str.52)
  store i32 0, ptr %4, align 4
  br label %270

129:                                              ; preds = %119
  %130 = load i32, ptr %12, align 4
  %131 = load i32, ptr %13, align 4
  %132 = udiv i32 %130, %131
  %133 = getelementptr inbounds %struct.png_sPLT_struct, ptr %10, i32 0, i32 3
  store i32 %132, ptr %133, align 8
  %134 = load ptr, ptr %5, align 8
  %135 = getelementptr inbounds %struct.png_sPLT_struct, ptr %10, i32 0, i32 3
  %136 = load i32, ptr %135, align 8
  %137 = sext i32 %136 to i64
  %138 = mul i64 %137, 10
  %139 = call noalias ptr @png_malloc_warn(ptr noundef %134, i64 noundef %138)
  %140 = getelementptr inbounds %struct.png_sPLT_struct, ptr %10, i32 0, i32 2
  store ptr %139, ptr %140, align 8
  %141 = getelementptr inbounds %struct.png_sPLT_struct, ptr %10, i32 0, i32 2
  %142 = load ptr, ptr %141, align 8
  %143 = icmp eq ptr %142, null
  br i1 %143, label %144, label %146

144:                                              ; preds = %129
  %145 = load ptr, ptr %5, align 8
  call void @png_warning(ptr noundef %145, ptr noundef @.str.53)
  store i32 0, ptr %4, align 4
  br label %270

146:                                              ; preds = %129
  store i32 0, ptr %14, align 4
  br label %147

147:                                              ; preds = %259, %146
  %148 = load i32, ptr %14, align 4
  %149 = getelementptr inbounds %struct.png_sPLT_struct, ptr %10, i32 0, i32 3
  %150 = load i32, ptr %149, align 8
  %151 = icmp slt i32 %148, %150
  br i1 %151, label %152, label %262

152:                                              ; preds = %147
  %153 = getelementptr inbounds %struct.png_sPLT_struct, ptr %10, i32 0, i32 2
  %154 = load ptr, ptr %153, align 8
  %155 = load i32, ptr %14, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds %struct.png_sPLT_entry_struct, ptr %154, i64 %156
  store ptr %157, ptr %11, align 8
  %158 = getelementptr inbounds %struct.png_sPLT_struct, ptr %10, i32 0, i32 1
  %159 = load i8, ptr %158, align 8
  %160 = zext i8 %159 to i32
  %161 = icmp eq i32 %160, 8
  br i1 %161, label %162, label %187

162:                                              ; preds = %152
  %163 = load ptr, ptr %8, align 8
  %164 = getelementptr inbounds i8, ptr %163, i32 1
  store ptr %164, ptr %8, align 8
  %165 = load i8, ptr %163, align 1
  %166 = zext i8 %165 to i16
  %167 = load ptr, ptr %11, align 8
  %168 = getelementptr inbounds %struct.png_sPLT_entry_struct, ptr %167, i32 0, i32 0
  store i16 %166, ptr %168, align 2
  %169 = load ptr, ptr %8, align 8
  %170 = getelementptr inbounds i8, ptr %169, i32 1
  store ptr %170, ptr %8, align 8
  %171 = load i8, ptr %169, align 1
  %172 = zext i8 %171 to i16
  %173 = load ptr, ptr %11, align 8
  %174 = getelementptr inbounds %struct.png_sPLT_entry_struct, ptr %173, i32 0, i32 1
  store i16 %172, ptr %174, align 2
  %175 = load ptr, ptr %8, align 8
  %176 = getelementptr inbounds i8, ptr %175, i32 1
  store ptr %176, ptr %8, align 8
  %177 = load i8, ptr %175, align 1
  %178 = zext i8 %177 to i16
  %179 = load ptr, ptr %11, align 8
  %180 = getelementptr inbounds %struct.png_sPLT_entry_struct, ptr %179, i32 0, i32 2
  store i16 %178, ptr %180, align 2
  %181 = load ptr, ptr %8, align 8
  %182 = getelementptr inbounds i8, ptr %181, i32 1
  store ptr %182, ptr %8, align 8
  %183 = load i8, ptr %181, align 1
  %184 = zext i8 %183 to i16
  %185 = load ptr, ptr %11, align 8
  %186 = getelementptr inbounds %struct.png_sPLT_entry_struct, ptr %185, i32 0, i32 3
  store i16 %184, ptr %186, align 2
  br label %244

187:                                              ; preds = %152
  %188 = load ptr, ptr %8, align 8
  %189 = load i8, ptr %188, align 1
  %190 = zext i8 %189 to i32
  %191 = shl i32 %190, 8
  %192 = load ptr, ptr %8, align 8
  %193 = getelementptr inbounds i8, ptr %192, i64 1
  %194 = load i8, ptr %193, align 1
  %195 = zext i8 %194 to i32
  %196 = add i32 %191, %195
  %197 = trunc i32 %196 to i16
  %198 = load ptr, ptr %11, align 8
  %199 = getelementptr inbounds %struct.png_sPLT_entry_struct, ptr %198, i32 0, i32 0
  store i16 %197, ptr %199, align 2
  %200 = load ptr, ptr %8, align 8
  %201 = getelementptr inbounds i8, ptr %200, i64 2
  store ptr %201, ptr %8, align 8
  %202 = load ptr, ptr %8, align 8
  %203 = load i8, ptr %202, align 1
  %204 = zext i8 %203 to i32
  %205 = shl i32 %204, 8
  %206 = load ptr, ptr %8, align 8
  %207 = getelementptr inbounds i8, ptr %206, i64 1
  %208 = load i8, ptr %207, align 1
  %209 = zext i8 %208 to i32
  %210 = add i32 %205, %209
  %211 = trunc i32 %210 to i16
  %212 = load ptr, ptr %11, align 8
  %213 = getelementptr inbounds %struct.png_sPLT_entry_struct, ptr %212, i32 0, i32 1
  store i16 %211, ptr %213, align 2
  %214 = load ptr, ptr %8, align 8
  %215 = getelementptr inbounds i8, ptr %214, i64 2
  store ptr %215, ptr %8, align 8
  %216 = load ptr, ptr %8, align 8
  %217 = load i8, ptr %216, align 1
  %218 = zext i8 %217 to i32
  %219 = shl i32 %218, 8
  %220 = load ptr, ptr %8, align 8
  %221 = getelementptr inbounds i8, ptr %220, i64 1
  %222 = load i8, ptr %221, align 1
  %223 = zext i8 %222 to i32
  %224 = add i32 %219, %223
  %225 = trunc i32 %224 to i16
  %226 = load ptr, ptr %11, align 8
  %227 = getelementptr inbounds %struct.png_sPLT_entry_struct, ptr %226, i32 0, i32 2
  store i16 %225, ptr %227, align 2
  %228 = load ptr, ptr %8, align 8
  %229 = getelementptr inbounds i8, ptr %228, i64 2
  store ptr %229, ptr %8, align 8
  %230 = load ptr, ptr %8, align 8
  %231 = load i8, ptr %230, align 1
  %232 = zext i8 %231 to i32
  %233 = shl i32 %232, 8
  %234 = load ptr, ptr %8, align 8
  %235 = getelementptr inbounds i8, ptr %234, i64 1
  %236 = load i8, ptr %235, align 1
  %237 = zext i8 %236 to i32
  %238 = add i32 %233, %237
  %239 = trunc i32 %238 to i16
  %240 = load ptr, ptr %11, align 8
  %241 = getelementptr inbounds %struct.png_sPLT_entry_struct, ptr %240, i32 0, i32 3
  store i16 %239, ptr %241, align 2
  %242 = load ptr, ptr %8, align 8
  %243 = getelementptr inbounds i8, ptr %242, i64 2
  store ptr %243, ptr %8, align 8
  br label %244

244:                                              ; preds = %187, %162
  %245 = load ptr, ptr %8, align 8
  %246 = load i8, ptr %245, align 1
  %247 = zext i8 %246 to i32
  %248 = shl i32 %247, 8
  %249 = load ptr, ptr %8, align 8
  %250 = getelementptr inbounds i8, ptr %249, i64 1
  %251 = load i8, ptr %250, align 1
  %252 = zext i8 %251 to i32
  %253 = add i32 %248, %252
  %254 = trunc i32 %253 to i16
  %255 = load ptr, ptr %11, align 8
  %256 = getelementptr inbounds %struct.png_sPLT_entry_struct, ptr %255, i32 0, i32 4
  store i16 %254, ptr %256, align 2
  %257 = load ptr, ptr %8, align 8
  %258 = getelementptr inbounds i8, ptr %257, i64 2
  store ptr %258, ptr %8, align 8
  br label %259

259:                                              ; preds = %244
  %260 = load i32, ptr %14, align 4
  %261 = add nsw i32 %260, 1
  store i32 %261, ptr %14, align 4
  br label %147, !llvm.loop !37

262:                                              ; preds = %147
  %263 = load ptr, ptr %9, align 8
  %264 = getelementptr inbounds %struct.png_sPLT_struct, ptr %10, i32 0, i32 0
  store ptr %263, ptr %264, align 8
  %265 = load ptr, ptr %5, align 8
  %266 = load ptr, ptr %6, align 8
  call void @png_set_sPLT(ptr noundef %265, ptr noundef %266, ptr noundef %10, i32 noundef 1)
  %267 = load ptr, ptr %5, align 8
  %268 = getelementptr inbounds %struct.png_sPLT_struct, ptr %10, i32 0, i32 2
  %269 = load ptr, ptr %268, align 8
  call void @png_free(ptr noundef %267, ptr noundef %269)
  store i32 3, ptr %4, align 4
  br label %270

270:                                              ; preds = %262, %144, %127, %117, %92, %64, %51, %37, %27
  %271 = load i32, ptr %4, align 4
  ret i32 %271
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_sRGB(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8, align 1
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %9 = load ptr, ptr %5, align 8
  call void @png_crc_read(ptr noundef %9, ptr noundef %8, i32 noundef 1)
  %10 = load ptr, ptr %5, align 8
  %11 = call i32 @png_crc_finish(ptr noundef %10, i32 noundef 0)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %39

14:                                               ; preds = %3
  %15 = load i8, ptr %8, align 1
  %16 = zext i8 %15 to i32
  %17 = icmp sgt i32 %16, 3
  br i1 %17, label %18, label %20

18:                                               ; preds = %14
  %19 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %19, ptr noundef @.str.30)
  store i32 0, ptr %4, align 4
  br label %39

20:                                               ; preds = %14
  %21 = load ptr, ptr %5, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = load i8, ptr %8, align 1
  %24 = zext i8 %23 to i32
  call void @png_set_sRGB(ptr noundef %21, ptr noundef %22, i32 noundef %24)
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds %struct.png_struct_def, ptr %25, i32 0, i32 37
  %27 = load i32, ptr %26, align 8
  %28 = and i32 %27, 128
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %35

30:                                               ; preds = %20
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds %struct.png_struct_def, ptr %31, i32 0, i32 84
  %33 = load i32, ptr %32, align 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %38

35:                                               ; preds = %30, %20
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds %struct.png_struct_def, ptr %36, i32 0, i32 84
  store i32 45455, ptr %37, align 4
  br label %38

38:                                               ; preds = %35, %30
  store i32 3, ptr %4, align 4
  br label %39

39:                                               ; preds = %38, %18, %13
  %40 = load i32, ptr %4, align 4
  ret i32 %40
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_tEXt(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.png_text_struct, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 0, ptr %12, align 4
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.png_struct_def, ptr %13, i32 0, i32 140
  %15 = load i32, ptr %14, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %38

17:                                               ; preds = %3
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.png_struct_def, ptr %18, i32 0, i32 140
  %20 = load i32, ptr %19, align 4
  %21 = icmp eq i32 %20, 1
  br i1 %21, label %22, label %26

22:                                               ; preds = %17
  %23 = load ptr, ptr %5, align 8
  %24 = load i32, ptr %7, align 4
  %25 = call i32 @png_crc_finish(ptr noundef %23, i32 noundef %24)
  store i32 0, ptr %4, align 4
  br label %115

26:                                               ; preds = %17
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds %struct.png_struct_def, ptr %27, i32 0, i32 140
  %29 = load i32, ptr %28, align 4
  %30 = add i32 %29, -1
  store i32 %30, ptr %28, align 4
  %31 = icmp eq i32 %30, 1
  br i1 %31, label %32, label %37

32:                                               ; preds = %26
  %33 = load ptr, ptr %5, align 8
  %34 = load i32, ptr %7, align 4
  %35 = call i32 @png_crc_finish(ptr noundef %33, i32 noundef %34)
  %36 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %36, ptr noundef @.str.9)
  store i32 0, ptr %4, align 4
  br label %115

37:                                               ; preds = %26
  br label %38

38:                                               ; preds = %37, %3
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds %struct.png_struct_def, ptr %39, i32 0, i32 15
  %41 = load i32, ptr %40, align 4
  %42 = and i32 %41, 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %49

44:                                               ; preds = %38
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds %struct.png_struct_def, ptr %45, i32 0, i32 15
  %47 = load i32, ptr %46, align 4
  %48 = or i32 %47, 8
  store i32 %48, ptr %46, align 4
  br label %49

49:                                               ; preds = %44, %38
  %50 = load ptr, ptr %5, align 8
  %51 = load i32, ptr %7, align 4
  %52 = add i32 %51, 1
  %53 = zext i32 %52 to i64
  %54 = call ptr @png_read_buffer(ptr noundef %50, i64 noundef %53)
  store ptr %54, ptr %9, align 8
  %55 = load ptr, ptr %9, align 8
  %56 = icmp eq ptr %55, null
  br i1 %56, label %57, label %62

57:                                               ; preds = %49
  %58 = load ptr, ptr %5, align 8
  %59 = load i32, ptr %7, align 4
  %60 = call i32 @png_crc_finish(ptr noundef %58, i32 noundef %59)
  %61 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %61, ptr noundef @.str.22)
  store i32 0, ptr %4, align 4
  br label %115

62:                                               ; preds = %49
  %63 = load ptr, ptr %5, align 8
  %64 = load ptr, ptr %9, align 8
  %65 = load i32, ptr %7, align 4
  call void @png_crc_read(ptr noundef %63, ptr noundef %64, i32 noundef %65)
  %66 = load ptr, ptr %5, align 8
  %67 = load i32, ptr %12, align 4
  %68 = call i32 @png_crc_finish(ptr noundef %66, i32 noundef %67)
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %71

70:                                               ; preds = %62
  store i32 0, ptr %4, align 4
  br label %115

71:                                               ; preds = %62
  %72 = load ptr, ptr %9, align 8
  store ptr %72, ptr %10, align 8
  %73 = load ptr, ptr %10, align 8
  %74 = load i32, ptr %7, align 4
  %75 = zext i32 %74 to i64
  %76 = getelementptr inbounds i8, ptr %73, i64 %75
  store i8 0, ptr %76, align 1
  %77 = load ptr, ptr %10, align 8
  store ptr %77, ptr %11, align 8
  br label %78

78:                                               ; preds = %83, %71
  %79 = load ptr, ptr %11, align 8
  %80 = load i8, ptr %79, align 1
  %81 = icmp ne i8 %80, 0
  br i1 %81, label %82, label %86

82:                                               ; preds = %78
  br label %83

83:                                               ; preds = %82
  %84 = load ptr, ptr %11, align 8
  %85 = getelementptr inbounds i8, ptr %84, i32 1
  store ptr %85, ptr %11, align 8
  br label %78, !llvm.loop !38

86:                                               ; preds = %78
  %87 = load ptr, ptr %11, align 8
  %88 = load ptr, ptr %10, align 8
  %89 = load i32, ptr %7, align 4
  %90 = zext i32 %89 to i64
  %91 = getelementptr inbounds i8, ptr %88, i64 %90
  %92 = icmp ne ptr %87, %91
  br i1 %92, label %93, label %96

93:                                               ; preds = %86
  %94 = load ptr, ptr %11, align 8
  %95 = getelementptr inbounds i8, ptr %94, i32 1
  store ptr %95, ptr %11, align 8
  br label %96

96:                                               ; preds = %93, %86
  %97 = getelementptr inbounds %struct.png_text_struct, ptr %8, i32 0, i32 0
  store i32 -1, ptr %97, align 8
  %98 = load ptr, ptr %10, align 8
  %99 = getelementptr inbounds %struct.png_text_struct, ptr %8, i32 0, i32 1
  store ptr %98, ptr %99, align 8
  %100 = getelementptr inbounds %struct.png_text_struct, ptr %8, i32 0, i32 5
  store ptr null, ptr %100, align 8
  %101 = getelementptr inbounds %struct.png_text_struct, ptr %8, i32 0, i32 6
  store ptr null, ptr %101, align 8
  %102 = getelementptr inbounds %struct.png_text_struct, ptr %8, i32 0, i32 4
  store i64 0, ptr %102, align 8
  %103 = load ptr, ptr %11, align 8
  %104 = getelementptr inbounds %struct.png_text_struct, ptr %8, i32 0, i32 2
  store ptr %103, ptr %104, align 8
  %105 = load ptr, ptr %11, align 8
  %106 = call i64 @strlen(ptr noundef %105) #7
  %107 = getelementptr inbounds %struct.png_text_struct, ptr %8, i32 0, i32 3
  store i64 %106, ptr %107, align 8
  %108 = load ptr, ptr %5, align 8
  %109 = load ptr, ptr %6, align 8
  %110 = call i32 @png_set_text_2(ptr noundef %108, ptr noundef %109, ptr noundef %8, i32 noundef 1)
  %111 = icmp eq i32 %110, 0
  br i1 %111, label %112, label %113

112:                                              ; preds = %96
  store i32 3, ptr %4, align 4
  br label %115

113:                                              ; preds = %96
  %114 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %114, ptr noundef @.str.22)
  store i32 0, ptr %4, align 4
  br label %115

115:                                              ; preds = %113, %112, %70, %57, %32, %22
  %116 = load i32, ptr %4, align 4
  ret i32 %116
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_tIME(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca [7 x i8], align 1
  %9 = alloca %struct.png_time_struct, align 2
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 15
  %12 = load i32, ptr %11, align 4
  %13 = and i32 %12, 4
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %20

15:                                               ; preds = %3
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 15
  %18 = load i32, ptr %17, align 4
  %19 = or i32 %18, 8
  store i32 %19, ptr %17, align 4
  br label %20

20:                                               ; preds = %15, %3
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds [7 x i8], ptr %8, i64 0, i64 0
  call void @png_crc_read(ptr noundef %21, ptr noundef %22, i32 noundef 7)
  %23 = load ptr, ptr %5, align 8
  %24 = call i32 @png_crc_finish(ptr noundef %23, i32 noundef 0)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %20
  store i32 0, ptr %4, align 4
  br label %56

27:                                               ; preds = %20
  %28 = getelementptr inbounds [7 x i8], ptr %8, i64 0, i64 6
  %29 = load i8, ptr %28, align 1
  %30 = getelementptr inbounds %struct.png_time_struct, ptr %9, i32 0, i32 5
  store i8 %29, ptr %30, align 2
  %31 = getelementptr inbounds [7 x i8], ptr %8, i64 0, i64 5
  %32 = load i8, ptr %31, align 1
  %33 = getelementptr inbounds %struct.png_time_struct, ptr %9, i32 0, i32 4
  store i8 %32, ptr %33, align 1
  %34 = getelementptr inbounds [7 x i8], ptr %8, i64 0, i64 4
  %35 = load i8, ptr %34, align 1
  %36 = getelementptr inbounds %struct.png_time_struct, ptr %9, i32 0, i32 3
  store i8 %35, ptr %36, align 2
  %37 = getelementptr inbounds [7 x i8], ptr %8, i64 0, i64 3
  %38 = load i8, ptr %37, align 1
  %39 = getelementptr inbounds %struct.png_time_struct, ptr %9, i32 0, i32 2
  store i8 %38, ptr %39, align 1
  %40 = getelementptr inbounds [7 x i8], ptr %8, i64 0, i64 2
  %41 = load i8, ptr %40, align 1
  %42 = getelementptr inbounds %struct.png_time_struct, ptr %9, i32 0, i32 1
  store i8 %41, ptr %42, align 2
  %43 = getelementptr inbounds [7 x i8], ptr %8, i64 0, i64 0
  %44 = load i8, ptr %43, align 1
  %45 = zext i8 %44 to i32
  %46 = shl i32 %45, 8
  %47 = getelementptr inbounds [7 x i8], ptr %8, i64 0, i64 0
  %48 = getelementptr inbounds i8, ptr %47, i64 1
  %49 = load i8, ptr %48, align 1
  %50 = zext i8 %49 to i32
  %51 = add i32 %46, %50
  %52 = trunc i32 %51 to i16
  %53 = getelementptr inbounds %struct.png_time_struct, ptr %9, i32 0, i32 0
  store i16 %52, ptr %53, align 2
  %54 = load ptr, ptr %5, align 8
  %55 = load ptr, ptr %6, align 8
  call void @png_set_tIME(ptr noundef %54, ptr noundef %55, ptr noundef %9)
  store i32 3, ptr %4, align 4
  br label %56

56:                                               ; preds = %27, %26
  %57 = load i32, ptr %4, align 4
  ret i32 %57
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_tRNS(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca [256 x i8], align 16
  %9 = alloca [2 x i8], align 1
  %10 = alloca [6 x i8], align 1
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.png_struct_def, ptr %11, i32 0, i32 62
  %13 = load i8, ptr %12, align 1
  %14 = zext i8 %13 to i32
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %42

16:                                               ; preds = %3
  %17 = load i32, ptr %7, align 4
  %18 = icmp ne i32 %17, 2
  br i1 %18, label %19, label %24

19:                                               ; preds = %16
  %20 = load ptr, ptr %5, align 8
  %21 = load i32, ptr %7, align 4
  %22 = call i32 @png_crc_finish(ptr noundef %20, i32 noundef %21)
  %23 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %23, ptr noundef @.str.30)
  store i32 0, ptr %4, align 4
  br label %172

24:                                               ; preds = %16
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds [2 x i8], ptr %9, i64 0, i64 0
  call void @png_crc_read(ptr noundef %25, ptr noundef %26, i32 noundef 2)
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds %struct.png_struct_def, ptr %27, i32 0, i32 56
  store i16 1, ptr %28, align 8
  %29 = getelementptr inbounds [2 x i8], ptr %9, i64 0, i64 0
  %30 = load i8, ptr %29, align 1
  %31 = zext i8 %30 to i32
  %32 = shl i32 %31, 8
  %33 = getelementptr inbounds [2 x i8], ptr %9, i64 0, i64 0
  %34 = getelementptr inbounds i8, ptr %33, i64 1
  %35 = load i8, ptr %34, align 1
  %36 = zext i8 %35 to i32
  %37 = add i32 %32, %36
  %38 = trunc i32 %37 to i16
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds %struct.png_struct_def, ptr %39, i32 0, i32 95
  %41 = getelementptr inbounds %struct.png_color_16_struct, ptr %40, i32 0, i32 4
  store i16 %38, ptr %41, align 8
  br label %155

42:                                               ; preds = %3
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds %struct.png_struct_def, ptr %43, i32 0, i32 62
  %45 = load i8, ptr %44, align 1
  %46 = zext i8 %45 to i32
  %47 = icmp eq i32 %46, 2
  br i1 %47, label %48, label %105

48:                                               ; preds = %42
  %49 = load i32, ptr %7, align 4
  %50 = icmp ne i32 %49, 6
  br i1 %50, label %51, label %56

51:                                               ; preds = %48
  %52 = load ptr, ptr %5, align 8
  %53 = load i32, ptr %7, align 4
  %54 = call i32 @png_crc_finish(ptr noundef %52, i32 noundef %53)
  %55 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %55, ptr noundef @.str.30)
  store i32 0, ptr %4, align 4
  br label %172

56:                                               ; preds = %48
  %57 = load ptr, ptr %5, align 8
  %58 = getelementptr inbounds [6 x i8], ptr %10, i64 0, i64 0
  %59 = load i32, ptr %7, align 4
  call void @png_crc_read(ptr noundef %57, ptr noundef %58, i32 noundef %59)
  %60 = load ptr, ptr %5, align 8
  %61 = getelementptr inbounds %struct.png_struct_def, ptr %60, i32 0, i32 56
  store i16 1, ptr %61, align 8
  %62 = getelementptr inbounds [6 x i8], ptr %10, i64 0, i64 0
  %63 = load i8, ptr %62, align 1
  %64 = zext i8 %63 to i32
  %65 = shl i32 %64, 8
  %66 = getelementptr inbounds [6 x i8], ptr %10, i64 0, i64 0
  %67 = getelementptr inbounds i8, ptr %66, i64 1
  %68 = load i8, ptr %67, align 1
  %69 = zext i8 %68 to i32
  %70 = add i32 %65, %69
  %71 = trunc i32 %70 to i16
  %72 = load ptr, ptr %5, align 8
  %73 = getelementptr inbounds %struct.png_struct_def, ptr %72, i32 0, i32 95
  %74 = getelementptr inbounds %struct.png_color_16_struct, ptr %73, i32 0, i32 1
  store i16 %71, ptr %74, align 2
  %75 = getelementptr inbounds [6 x i8], ptr %10, i64 0, i64 0
  %76 = getelementptr inbounds i8, ptr %75, i64 2
  %77 = load i8, ptr %76, align 1
  %78 = zext i8 %77 to i32
  %79 = shl i32 %78, 8
  %80 = getelementptr inbounds [6 x i8], ptr %10, i64 0, i64 0
  %81 = getelementptr inbounds i8, ptr %80, i64 2
  %82 = getelementptr inbounds i8, ptr %81, i64 1
  %83 = load i8, ptr %82, align 1
  %84 = zext i8 %83 to i32
  %85 = add i32 %79, %84
  %86 = trunc i32 %85 to i16
  %87 = load ptr, ptr %5, align 8
  %88 = getelementptr inbounds %struct.png_struct_def, ptr %87, i32 0, i32 95
  %89 = getelementptr inbounds %struct.png_color_16_struct, ptr %88, i32 0, i32 2
  store i16 %86, ptr %89, align 4
  %90 = getelementptr inbounds [6 x i8], ptr %10, i64 0, i64 0
  %91 = getelementptr inbounds i8, ptr %90, i64 4
  %92 = load i8, ptr %91, align 1
  %93 = zext i8 %92 to i32
  %94 = shl i32 %93, 8
  %95 = getelementptr inbounds [6 x i8], ptr %10, i64 0, i64 0
  %96 = getelementptr inbounds i8, ptr %95, i64 4
  %97 = getelementptr inbounds i8, ptr %96, i64 1
  %98 = load i8, ptr %97, align 1
  %99 = zext i8 %98 to i32
  %100 = add i32 %94, %99
  %101 = trunc i32 %100 to i16
  %102 = load ptr, ptr %5, align 8
  %103 = getelementptr inbounds %struct.png_struct_def, ptr %102, i32 0, i32 95
  %104 = getelementptr inbounds %struct.png_color_16_struct, ptr %103, i32 0, i32 3
  store i16 %101, ptr %104, align 2
  br label %154

105:                                              ; preds = %42
  %106 = load ptr, ptr %5, align 8
  %107 = getelementptr inbounds %struct.png_struct_def, ptr %106, i32 0, i32 62
  %108 = load i8, ptr %107, align 1
  %109 = zext i8 %108 to i32
  %110 = icmp eq i32 %109, 3
  br i1 %110, label %111, label %148

111:                                              ; preds = %105
  %112 = load ptr, ptr %5, align 8
  %113 = getelementptr inbounds %struct.png_struct_def, ptr %112, i32 0, i32 15
  %114 = load i32, ptr %113, align 4
  %115 = and i32 %114, 2
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %117, label %122

117:                                              ; preds = %111
  %118 = load ptr, ptr %5, align 8
  %119 = load i32, ptr %7, align 4
  %120 = call i32 @png_crc_finish(ptr noundef %118, i32 noundef %119)
  %121 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %121, ptr noundef @.str.12)
  store i32 0, ptr %4, align 4
  br label %172

122:                                              ; preds = %111
  %123 = load i32, ptr %7, align 4
  %124 = load ptr, ptr %5, align 8
  %125 = getelementptr inbounds %struct.png_struct_def, ptr %124, i32 0, i32 54
  %126 = load i16, ptr %125, align 8
  %127 = zext i16 %126 to i32
  %128 = icmp ugt i32 %123, %127
  br i1 %128, label %135, label %129

129:                                              ; preds = %122
  %130 = load i32, ptr %7, align 4
  %131 = icmp ugt i32 %130, 256
  br i1 %131, label %135, label %132

132:                                              ; preds = %129
  %133 = load i32, ptr %7, align 4
  %134 = icmp eq i32 %133, 0
  br i1 %134, label %135, label %140

135:                                              ; preds = %132, %129, %122
  %136 = load ptr, ptr %5, align 8
  %137 = load i32, ptr %7, align 4
  %138 = call i32 @png_crc_finish(ptr noundef %136, i32 noundef %137)
  %139 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %139, ptr noundef @.str.30)
  store i32 0, ptr %4, align 4
  br label %172

140:                                              ; preds = %132
  %141 = load ptr, ptr %5, align 8
  %142 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %143 = load i32, ptr %7, align 4
  call void @png_crc_read(ptr noundef %141, ptr noundef %142, i32 noundef %143)
  %144 = load i32, ptr %7, align 4
  %145 = trunc i32 %144 to i16
  %146 = load ptr, ptr %5, align 8
  %147 = getelementptr inbounds %struct.png_struct_def, ptr %146, i32 0, i32 56
  store i16 %145, ptr %147, align 8
  br label %153

148:                                              ; preds = %105
  %149 = load ptr, ptr %5, align 8
  %150 = load i32, ptr %7, align 4
  %151 = call i32 @png_crc_finish(ptr noundef %149, i32 noundef %150)
  %152 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %152, ptr noundef @.str.54)
  store i32 0, ptr %4, align 4
  br label %172

153:                                              ; preds = %140
  br label %154

154:                                              ; preds = %153, %56
  br label %155

155:                                              ; preds = %154, %24
  %156 = load ptr, ptr %5, align 8
  %157 = call i32 @png_crc_finish(ptr noundef %156, i32 noundef 0)
  %158 = icmp ne i32 %157, 0
  br i1 %158, label %159, label %162

159:                                              ; preds = %155
  %160 = load ptr, ptr %5, align 8
  %161 = getelementptr inbounds %struct.png_struct_def, ptr %160, i32 0, i32 56
  store i16 0, ptr %161, align 8
  store i32 0, ptr %4, align 4
  br label %172

162:                                              ; preds = %155
  %163 = load ptr, ptr %5, align 8
  %164 = load ptr, ptr %6, align 8
  %165 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %166 = load ptr, ptr %5, align 8
  %167 = getelementptr inbounds %struct.png_struct_def, ptr %166, i32 0, i32 56
  %168 = load i16, ptr %167, align 8
  %169 = zext i16 %168 to i32
  %170 = load ptr, ptr %5, align 8
  %171 = getelementptr inbounds %struct.png_struct_def, ptr %170, i32 0, i32 95
  call void @png_set_tRNS(ptr noundef %163, ptr noundef %164, ptr noundef %165, i32 noundef %169, ptr noundef %171)
  store i32 3, ptr %4, align 4
  br label %172

172:                                              ; preds = %162, %159, %148, %135, %117, %51, %19
  %173 = load i32, ptr %4, align 4
  ret i32 %173
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_handle_zTXt(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  %12 = alloca %struct.png_text_struct, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr null, ptr %8, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.png_struct_def, ptr %13, i32 0, i32 140
  %15 = load i32, ptr %14, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %38

17:                                               ; preds = %3
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.png_struct_def, ptr %18, i32 0, i32 140
  %20 = load i32, ptr %19, align 4
  %21 = icmp eq i32 %20, 1
  br i1 %21, label %22, label %26

22:                                               ; preds = %17
  %23 = load ptr, ptr %5, align 8
  %24 = load i32, ptr %7, align 4
  %25 = call i32 @png_crc_finish(ptr noundef %23, i32 noundef %24)
  store i32 0, ptr %4, align 4
  br label %167

26:                                               ; preds = %17
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds %struct.png_struct_def, ptr %27, i32 0, i32 140
  %29 = load i32, ptr %28, align 4
  %30 = add i32 %29, -1
  store i32 %30, ptr %28, align 4
  %31 = icmp eq i32 %30, 1
  br i1 %31, label %32, label %37

32:                                               ; preds = %26
  %33 = load ptr, ptr %5, align 8
  %34 = load i32, ptr %7, align 4
  %35 = call i32 @png_crc_finish(ptr noundef %33, i32 noundef %34)
  %36 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %36, ptr noundef @.str.9)
  store i32 0, ptr %4, align 4
  br label %167

37:                                               ; preds = %26
  br label %38

38:                                               ; preds = %37, %3
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds %struct.png_struct_def, ptr %39, i32 0, i32 15
  %41 = load i32, ptr %40, align 4
  %42 = and i32 %41, 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %49

44:                                               ; preds = %38
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds %struct.png_struct_def, ptr %45, i32 0, i32 15
  %47 = load i32, ptr %46, align 4
  %48 = or i32 %47, 8
  store i32 %48, ptr %46, align 4
  br label %49

49:                                               ; preds = %44, %38
  %50 = load ptr, ptr %5, align 8
  %51 = load i32, ptr %7, align 4
  %52 = zext i32 %51 to i64
  %53 = call ptr @png_read_buffer(ptr noundef %50, i64 noundef %52)
  store ptr %53, ptr %9, align 8
  %54 = load ptr, ptr %9, align 8
  %55 = icmp eq ptr %54, null
  br i1 %55, label %56, label %61

56:                                               ; preds = %49
  %57 = load ptr, ptr %5, align 8
  %58 = load i32, ptr %7, align 4
  %59 = call i32 @png_crc_finish(ptr noundef %57, i32 noundef %58)
  %60 = load ptr, ptr %5, align 8
  call void @png_chunk_benign_error(ptr noundef %60, ptr noundef @.str.22)
  store i32 0, ptr %4, align 4
  br label %167

61:                                               ; preds = %49
  %62 = load ptr, ptr %5, align 8
  %63 = load ptr, ptr %9, align 8
  %64 = load i32, ptr %7, align 4
  call void @png_crc_read(ptr noundef %62, ptr noundef %63, i32 noundef %64)
  %65 = load ptr, ptr %5, align 8
  %66 = call i32 @png_crc_finish(ptr noundef %65, i32 noundef 0)
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %69

68:                                               ; preds = %61
  store i32 0, ptr %4, align 4
  br label %167

69:                                               ; preds = %61
  store i32 0, ptr %10, align 4
  br label %70

70:                                               ; preds = %85, %69
  %71 = load i32, ptr %10, align 4
  %72 = load i32, ptr %7, align 4
  %73 = icmp ult i32 %71, %72
  br i1 %73, label %74, label %82

74:                                               ; preds = %70
  %75 = load ptr, ptr %9, align 8
  %76 = load i32, ptr %10, align 4
  %77 = zext i32 %76 to i64
  %78 = getelementptr inbounds i8, ptr %75, i64 %77
  %79 = load i8, ptr %78, align 1
  %80 = zext i8 %79 to i32
  %81 = icmp ne i32 %80, 0
  br label %82

82:                                               ; preds = %74, %70
  %83 = phi i1 [ false, %70 ], [ %81, %74 ]
  br i1 %83, label %84, label %88

84:                                               ; preds = %82
  br label %85

85:                                               ; preds = %84
  %86 = load i32, ptr %10, align 4
  %87 = add i32 %86, 1
  store i32 %87, ptr %10, align 4
  br label %70, !llvm.loop !39

88:                                               ; preds = %82
  %89 = load i32, ptr %10, align 4
  %90 = icmp ugt i32 %89, 79
  br i1 %90, label %94, label %91

91:                                               ; preds = %88
  %92 = load i32, ptr %10, align 4
  %93 = icmp ult i32 %92, 1
  br i1 %93, label %94, label %95

94:                                               ; preds = %91, %88
  store ptr @.str.36, ptr %8, align 8
  br label %164

95:                                               ; preds = %91
  %96 = load i32, ptr %10, align 4
  %97 = add i32 %96, 3
  %98 = load i32, ptr %7, align 4
  %99 = icmp ugt i32 %97, %98
  br i1 %99, label %100, label %101

100:                                              ; preds = %95
  store ptr @.str.38, ptr %8, align 8
  br label %163

101:                                              ; preds = %95
  %102 = load ptr, ptr %9, align 8
  %103 = load i32, ptr %10, align 4
  %104 = add i32 %103, 1
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i8, ptr %102, i64 %105
  %107 = load i8, ptr %106, align 1
  %108 = zext i8 %107 to i32
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %111

110:                                              ; preds = %101
  store ptr @.str.55, ptr %8, align 8
  br label %162

111:                                              ; preds = %101
  store i64 -1, ptr %11, align 8
  %112 = load ptr, ptr %5, align 8
  %113 = load i32, ptr %7, align 4
  %114 = load i32, ptr %10, align 4
  %115 = add i32 %114, 2
  %116 = call i32 @png_decompress_chunk(ptr noundef %112, i32 noundef %113, i32 noundef %115, ptr noundef %11, i32 noundef 1)
  %117 = icmp eq i32 %116, 1
  br i1 %117, label %118, label %156

118:                                              ; preds = %111
  %119 = load ptr, ptr %5, align 8
  %120 = getelementptr inbounds %struct.png_struct_def, ptr %119, i32 0, i32 144
  %121 = load ptr, ptr %120, align 8
  %122 = icmp eq ptr %121, null
  br i1 %122, label %123, label %124

123:                                              ; preds = %118
  store ptr @.str.56, ptr %8, align 8
  br label %155

124:                                              ; preds = %118
  %125 = load ptr, ptr %5, align 8
  %126 = getelementptr inbounds %struct.png_struct_def, ptr %125, i32 0, i32 144
  %127 = load ptr, ptr %126, align 8
  store ptr %127, ptr %9, align 8
  %128 = load ptr, ptr %9, align 8
  %129 = load i64, ptr %11, align 8
  %130 = load i32, ptr %10, align 4
  %131 = add i32 %130, 2
  %132 = zext i32 %131 to i64
  %133 = add i64 %129, %132
  %134 = getelementptr inbounds i8, ptr %128, i64 %133
  store i8 0, ptr %134, align 1
  %135 = getelementptr inbounds %struct.png_text_struct, ptr %12, i32 0, i32 0
  store i32 0, ptr %135, align 8
  %136 = load ptr, ptr %9, align 8
  %137 = getelementptr inbounds %struct.png_text_struct, ptr %12, i32 0, i32 1
  store ptr %136, ptr %137, align 8
  %138 = load ptr, ptr %9, align 8
  %139 = load i32, ptr %10, align 4
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds i8, ptr %138, i64 %140
  %142 = getelementptr inbounds i8, ptr %141, i64 2
  %143 = getelementptr inbounds %struct.png_text_struct, ptr %12, i32 0, i32 2
  store ptr %142, ptr %143, align 8
  %144 = load i64, ptr %11, align 8
  %145 = getelementptr inbounds %struct.png_text_struct, ptr %12, i32 0, i32 3
  store i64 %144, ptr %145, align 8
  %146 = getelementptr inbounds %struct.png_text_struct, ptr %12, i32 0, i32 4
  store i64 0, ptr %146, align 8
  %147 = getelementptr inbounds %struct.png_text_struct, ptr %12, i32 0, i32 5
  store ptr null, ptr %147, align 8
  %148 = getelementptr inbounds %struct.png_text_struct, ptr %12, i32 0, i32 6
  store ptr null, ptr %148, align 8
  %149 = load ptr, ptr %5, align 8
  %150 = load ptr, ptr %6, align 8
  %151 = call i32 @png_set_text_2(ptr noundef %149, ptr noundef %150, ptr noundef %12, i32 noundef 1)
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %153, label %154

153:                                              ; preds = %124
  store i32 3, ptr %4, align 4
  br label %167

154:                                              ; preds = %124
  store ptr @.str.22, ptr %8, align 8
  br label %155

155:                                              ; preds = %154, %123
  br label %161

156:                                              ; preds = %111
  %157 = load ptr, ptr %5, align 8
  %158 = getelementptr inbounds %struct.png_struct_def, ptr %157, i32 0, i32 19
  %159 = getelementptr inbounds %struct.z_stream_s, ptr %158, i32 0, i32 6
  %160 = load ptr, ptr %159, align 8
  store ptr %160, ptr %8, align 8
  br label %161

161:                                              ; preds = %156, %155
  br label %162

162:                                              ; preds = %161, %110
  br label %163

163:                                              ; preds = %162, %100
  br label %164

164:                                              ; preds = %163, %94
  %165 = load ptr, ptr %5, align 8
  %166 = load ptr, ptr %8, align 8
  call void @png_chunk_benign_error(ptr noundef %165, ptr noundef %166)
  store i32 0, ptr %4, align 4
  br label %167

167:                                              ; preds = %164, %153, %68, %56, %32, %22
  %168 = load i32, ptr %4, align 4
  ret i32 %168
}

declare void @png_set_IHDR(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare void @png_set_PLTE(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #2

declare void @png_set_bKGD(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_get_int_32_checked(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i8, ptr %7, align 1
  %9 = zext i8 %8 to i32
  %10 = shl i32 %9, 24
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds i8, ptr %11, i64 1
  %13 = load i8, ptr %12, align 1
  %14 = zext i8 %13 to i32
  %15 = shl i32 %14, 16
  %16 = add i32 %10, %15
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds i8, ptr %17, i64 2
  %19 = load i8, ptr %18, align 1
  %20 = zext i8 %19 to i32
  %21 = shl i32 %20, 8
  %22 = add i32 %16, %21
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds i8, ptr %23, i64 3
  %25 = load i8, ptr %24, align 1
  %26 = zext i8 %25 to i32
  %27 = add i32 %22, %26
  store i32 %27, ptr %6, align 4
  %28 = load i32, ptr %6, align 4
  %29 = and i32 %28, -2147483648
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %33

31:                                               ; preds = %2
  %32 = load i32, ptr %6, align 4
  store i32 %32, ptr %3, align 4
  br label %45

33:                                               ; preds = %2
  %34 = load i32, ptr %6, align 4
  %35 = xor i32 %34, -1
  %36 = add i32 %35, 1
  store i32 %36, ptr %6, align 4
  %37 = load i32, ptr %6, align 4
  %38 = and i32 %37, -2147483648
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %43

40:                                               ; preds = %33
  %41 = load i32, ptr %6, align 4
  %42 = sub nsw i32 0, %41
  store i32 %42, ptr %3, align 4
  br label %45

43:                                               ; preds = %33
  %44 = load ptr, ptr %5, align 8
  store i32 1, ptr %44, align 4
  store i32 0, ptr %3, align 4
  br label %45

45:                                               ; preds = %43, %40, %31
  %46 = load i32, ptr %3, align 4
  ret i32 %46
}

declare void @png_set_cHRM_fixed(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare void @png_set_cICP(ptr noundef, ptr noundef, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext) #2

declare void @png_set_cLLI_fixed(ptr noundef, ptr noundef, i32 noundef, i32 noundef) #2

declare void @png_set_eXIf_1(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

declare void @png_set_gAMA_fixed(ptr noundef, ptr noundef, i32 noundef) #2

declare void @png_set_hIST(ptr noundef, ptr noundef, ptr noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_inflate_read(ptr noalias noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, i32 noundef %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store ptr %0, ptr %9, align 8
  store ptr %1, ptr %10, align 8
  store i32 %2, ptr %11, align 4
  store ptr %3, ptr %12, align 8
  store ptr %4, ptr %13, align 8
  store ptr %5, ptr %14, align 8
  store i32 %6, ptr %15, align 4
  %18 = load ptr, ptr %9, align 8
  %19 = getelementptr inbounds %struct.png_struct_def, ptr %18, i32 0, i32 18
  %20 = load i32, ptr %19, align 8
  %21 = load ptr, ptr %9, align 8
  %22 = getelementptr inbounds %struct.png_struct_def, ptr %21, i32 0, i32 45
  %23 = load i32, ptr %22, align 8
  %24 = icmp eq i32 %20, %23
  br i1 %24, label %25, label %139

25:                                               ; preds = %7
  %26 = load ptr, ptr %13, align 8
  %27 = load ptr, ptr %9, align 8
  %28 = getelementptr inbounds %struct.png_struct_def, ptr %27, i32 0, i32 19
  %29 = getelementptr inbounds %struct.z_stream_s, ptr %28, i32 0, i32 3
  store ptr %26, ptr %29, align 8
  %30 = load ptr, ptr %9, align 8
  %31 = getelementptr inbounds %struct.png_struct_def, ptr %30, i32 0, i32 19
  %32 = getelementptr inbounds %struct.z_stream_s, ptr %31, i32 0, i32 4
  store i32 0, ptr %32, align 8
  br label %33

33:                                               ; preds = %122, %25
  %34 = load ptr, ptr %9, align 8
  %35 = getelementptr inbounds %struct.png_struct_def, ptr %34, i32 0, i32 19
  %36 = getelementptr inbounds %struct.z_stream_s, ptr %35, i32 0, i32 1
  %37 = load i32, ptr %36, align 8
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %67

39:                                               ; preds = %33
  %40 = load i32, ptr %11, align 4
  %41 = load ptr, ptr %12, align 8
  %42 = load i32, ptr %41, align 4
  %43 = icmp ugt i32 %40, %42
  br i1 %43, label %44, label %47

44:                                               ; preds = %39
  %45 = load ptr, ptr %12, align 8
  %46 = load i32, ptr %45, align 4
  store i32 %46, ptr %11, align 4
  br label %47

47:                                               ; preds = %44, %39
  %48 = load i32, ptr %11, align 4
  %49 = load ptr, ptr %12, align 8
  %50 = load i32, ptr %49, align 4
  %51 = sub i32 %50, %48
  store i32 %51, ptr %49, align 4
  %52 = load i32, ptr %11, align 4
  %53 = icmp ugt i32 %52, 0
  br i1 %53, label %54, label %58

54:                                               ; preds = %47
  %55 = load ptr, ptr %9, align 8
  %56 = load ptr, ptr %10, align 8
  %57 = load i32, ptr %11, align 4
  call void @png_crc_read(ptr noundef %55, ptr noundef %56, i32 noundef %57)
  br label %58

58:                                               ; preds = %54, %47
  %59 = load ptr, ptr %10, align 8
  %60 = load ptr, ptr %9, align 8
  %61 = getelementptr inbounds %struct.png_struct_def, ptr %60, i32 0, i32 19
  %62 = getelementptr inbounds %struct.z_stream_s, ptr %61, i32 0, i32 0
  store ptr %59, ptr %62, align 8
  %63 = load i32, ptr %11, align 4
  %64 = load ptr, ptr %9, align 8
  %65 = getelementptr inbounds %struct.png_struct_def, ptr %64, i32 0, i32 19
  %66 = getelementptr inbounds %struct.z_stream_s, ptr %65, i32 0, i32 1
  store i32 %63, ptr %66, align 8
  br label %67

67:                                               ; preds = %58, %33
  %68 = load ptr, ptr %9, align 8
  %69 = getelementptr inbounds %struct.png_struct_def, ptr %68, i32 0, i32 19
  %70 = getelementptr inbounds %struct.z_stream_s, ptr %69, i32 0, i32 4
  %71 = load i32, ptr %70, align 8
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %93

73:                                               ; preds = %67
  store i32 -1, ptr %17, align 4
  %74 = load i32, ptr %17, align 4
  %75 = zext i32 %74 to i64
  %76 = load ptr, ptr %14, align 8
  %77 = load i64, ptr %76, align 8
  %78 = icmp ugt i64 %75, %77
  br i1 %78, label %79, label %83

79:                                               ; preds = %73
  %80 = load ptr, ptr %14, align 8
  %81 = load i64, ptr %80, align 8
  %82 = trunc i64 %81 to i32
  store i32 %82, ptr %17, align 4
  br label %83

83:                                               ; preds = %79, %73
  %84 = load i32, ptr %17, align 4
  %85 = zext i32 %84 to i64
  %86 = load ptr, ptr %14, align 8
  %87 = load i64, ptr %86, align 8
  %88 = sub i64 %87, %85
  store i64 %88, ptr %86, align 8
  %89 = load i32, ptr %17, align 4
  %90 = load ptr, ptr %9, align 8
  %91 = getelementptr inbounds %struct.png_struct_def, ptr %90, i32 0, i32 19
  %92 = getelementptr inbounds %struct.z_stream_s, ptr %91, i32 0, i32 4
  store i32 %89, ptr %92, align 8
  br label %93

93:                                               ; preds = %83, %67
  %94 = load ptr, ptr %9, align 8
  %95 = load ptr, ptr %12, align 8
  %96 = load i32, ptr %95, align 4
  %97 = icmp ugt i32 %96, 0
  br i1 %97, label %98, label %99

98:                                               ; preds = %93
  br label %104

99:                                               ; preds = %93
  %100 = load i32, ptr %15, align 4
  %101 = icmp ne i32 %100, 0
  %102 = zext i1 %101 to i64
  %103 = select i1 %101, i32 4, i32 2
  br label %104

104:                                              ; preds = %99, %98
  %105 = phi i32 [ 0, %98 ], [ %103, %99 ]
  %106 = call i32 @png_zlib_inflate(ptr noundef %94, i32 noundef %105)
  store i32 %106, ptr %16, align 4
  br label %107

107:                                              ; preds = %104
  %108 = load i32, ptr %16, align 4
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %122

110:                                              ; preds = %107
  %111 = load ptr, ptr %14, align 8
  %112 = load i64, ptr %111, align 8
  %113 = icmp ugt i64 %112, 0
  br i1 %113, label %120, label %114

114:                                              ; preds = %110
  %115 = load ptr, ptr %9, align 8
  %116 = getelementptr inbounds %struct.png_struct_def, ptr %115, i32 0, i32 19
  %117 = getelementptr inbounds %struct.z_stream_s, ptr %116, i32 0, i32 4
  %118 = load i32, ptr %117, align 8
  %119 = icmp ugt i32 %118, 0
  br label %120

120:                                              ; preds = %114, %110
  %121 = phi i1 [ true, %110 ], [ %119, %114 ]
  br label %122

122:                                              ; preds = %120, %107
  %123 = phi i1 [ false, %107 ], [ %121, %120 ]
  br i1 %123, label %33, label %124, !llvm.loop !40

124:                                              ; preds = %122
  %125 = load ptr, ptr %9, align 8
  %126 = getelementptr inbounds %struct.png_struct_def, ptr %125, i32 0, i32 19
  %127 = getelementptr inbounds %struct.z_stream_s, ptr %126, i32 0, i32 4
  %128 = load i32, ptr %127, align 8
  %129 = zext i32 %128 to i64
  %130 = load ptr, ptr %14, align 8
  %131 = load i64, ptr %130, align 8
  %132 = add i64 %131, %129
  store i64 %132, ptr %130, align 8
  %133 = load ptr, ptr %9, align 8
  %134 = getelementptr inbounds %struct.png_struct_def, ptr %133, i32 0, i32 19
  %135 = getelementptr inbounds %struct.z_stream_s, ptr %134, i32 0, i32 4
  store i32 0, ptr %135, align 8
  %136 = load ptr, ptr %9, align 8
  %137 = load i32, ptr %16, align 4
  call void @png_zstream_error(ptr noundef %136, i32 noundef %137)
  %138 = load i32, ptr %16, align 4
  store i32 %138, ptr %8, align 4
  br label %143

139:                                              ; preds = %7
  %140 = load ptr, ptr %9, align 8
  %141 = getelementptr inbounds %struct.png_struct_def, ptr %140, i32 0, i32 19
  %142 = getelementptr inbounds %struct.z_stream_s, ptr %141, i32 0, i32 6
  store ptr @.str.37, ptr %142, align 8
  store i32 -2, ptr %8, align 4
  br label %143

143:                                              ; preds = %139, %124
  %144 = load i32, ptr %8, align 4
  ret i32 %144
}

declare i32 @png_icc_check_length(ptr noundef, ptr noundef, i32 noundef) #2

declare i32 @png_icc_check_header(ptr noundef, ptr noundef, i32 noundef, ptr noundef, i32 noundef) #2

declare i32 @png_icc_check_tag_table(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

declare void @png_free_data(ptr noundef, ptr noundef, i32 noundef, i32 noundef) #2

declare noalias ptr @png_malloc_base(ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_decompress_chunk(ptr noalias noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i64, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store ptr %3, ptr %10, align 8
  store i32 %4, ptr %11, align 4
  %19 = load ptr, ptr %7, align 8
  %20 = getelementptr inbounds %struct.png_struct_def, ptr %19, i32 0, i32 141
  %21 = load i64, ptr %20, align 8
  store i64 %21, ptr %12, align 8
  %22 = load i64, ptr %12, align 8
  %23 = load i32, ptr %9, align 4
  %24 = load i32, ptr %11, align 4
  %25 = icmp ne i32 %24, 0
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = zext i32 %27 to i64
  %29 = icmp uge i64 %22, %28
  br i1 %29, label %30, label %195

30:                                               ; preds = %5
  %31 = load i32, ptr %9, align 4
  %32 = load i32, ptr %11, align 4
  %33 = icmp ne i32 %32, 0
  %34 = zext i1 %33 to i32
  %35 = add i32 %31, %34
  %36 = zext i32 %35 to i64
  %37 = load i64, ptr %12, align 8
  %38 = sub i64 %37, %36
  store i64 %38, ptr %12, align 8
  %39 = load i64, ptr %12, align 8
  %40 = load ptr, ptr %10, align 8
  %41 = load i64, ptr %40, align 8
  %42 = icmp ult i64 %39, %41
  br i1 %42, label %43, label %46

43:                                               ; preds = %30
  %44 = load i64, ptr %12, align 8
  %45 = load ptr, ptr %10, align 8
  store i64 %44, ptr %45, align 8
  br label %46

46:                                               ; preds = %43, %30
  %47 = load ptr, ptr %7, align 8
  %48 = load ptr, ptr %7, align 8
  %49 = getelementptr inbounds %struct.png_struct_def, ptr %48, i32 0, i32 45
  %50 = load i32, ptr %49, align 8
  %51 = call i32 @png_inflate_claim(ptr noundef %47, i32 noundef %50)
  store i32 %51, ptr %13, align 4
  %52 = load i32, ptr %13, align 4
  %53 = icmp eq i32 %52, 0
  br i1 %53, label %54, label %188

54:                                               ; preds = %46
  %55 = load i32, ptr %8, align 4
  %56 = load i32, ptr %9, align 4
  %57 = sub i32 %55, %56
  store i32 %57, ptr %14, align 4
  %58 = load ptr, ptr %7, align 8
  %59 = load ptr, ptr %7, align 8
  %60 = getelementptr inbounds %struct.png_struct_def, ptr %59, i32 0, i32 45
  %61 = load i32, ptr %60, align 8
  %62 = load ptr, ptr %7, align 8
  %63 = getelementptr inbounds %struct.png_struct_def, ptr %62, i32 0, i32 144
  %64 = load ptr, ptr %63, align 8
  %65 = load i32, ptr %9, align 4
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i8, ptr %64, i64 %66
  %68 = load ptr, ptr %10, align 8
  %69 = call i32 @png_inflate(ptr noundef %58, i32 noundef %61, i32 noundef 1, ptr noundef %67, ptr noundef %14, ptr noundef null, ptr noundef %68)
  store i32 %69, ptr %13, align 4
  %70 = load i32, ptr %13, align 4
  %71 = icmp eq i32 %70, 1
  br i1 %71, label %72, label %180

72:                                               ; preds = %54
  %73 = load ptr, ptr %7, align 8
  %74 = getelementptr inbounds %struct.png_struct_def, ptr %73, i32 0, i32 19
  %75 = call i32 @inflateReset(ptr noundef %74)
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %176

77:                                               ; preds = %72
  %78 = load ptr, ptr %10, align 8
  %79 = load i64, ptr %78, align 8
  store i64 %79, ptr %15, align 8
  %80 = load i32, ptr %9, align 4
  %81 = zext i32 %80 to i64
  %82 = load i64, ptr %15, align 8
  %83 = add i64 %81, %82
  %84 = load i32, ptr %11, align 4
  %85 = icmp ne i32 %84, 0
  %86 = zext i1 %85 to i32
  %87 = sext i32 %86 to i64
  %88 = add i64 %83, %87
  store i64 %88, ptr %16, align 8
  %89 = load ptr, ptr %7, align 8
  %90 = load i64, ptr %16, align 8
  %91 = call noalias ptr @png_malloc_base(ptr noundef %89, i64 noundef %90)
  store ptr %91, ptr %17, align 8
  %92 = load ptr, ptr %17, align 8
  %93 = icmp ne ptr %92, null
  br i1 %93, label %94, label %173

94:                                               ; preds = %77
  %95 = load ptr, ptr %17, align 8
  %96 = load i64, ptr %16, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %95, i8 0, i64 %96, i1 false)
  %97 = load ptr, ptr %7, align 8
  %98 = load ptr, ptr %7, align 8
  %99 = getelementptr inbounds %struct.png_struct_def, ptr %98, i32 0, i32 45
  %100 = load i32, ptr %99, align 8
  %101 = load ptr, ptr %7, align 8
  %102 = getelementptr inbounds %struct.png_struct_def, ptr %101, i32 0, i32 144
  %103 = load ptr, ptr %102, align 8
  %104 = load i32, ptr %9, align 4
  %105 = zext i32 %104 to i64
  %106 = getelementptr inbounds i8, ptr %103, i64 %105
  %107 = load ptr, ptr %17, align 8
  %108 = load i32, ptr %9, align 4
  %109 = zext i32 %108 to i64
  %110 = getelementptr inbounds i8, ptr %107, i64 %109
  %111 = load ptr, ptr %10, align 8
  %112 = call i32 @png_inflate(ptr noundef %97, i32 noundef %100, i32 noundef 1, ptr noundef %106, ptr noundef %14, ptr noundef %110, ptr noundef %111)
  store i32 %112, ptr %13, align 4
  %113 = load i32, ptr %13, align 4
  %114 = icmp eq i32 %113, 1
  br i1 %114, label %115, label %154

115:                                              ; preds = %94
  %116 = load i64, ptr %15, align 8
  %117 = load ptr, ptr %10, align 8
  %118 = load i64, ptr %117, align 8
  %119 = icmp eq i64 %116, %118
  br i1 %119, label %120, label %152

120:                                              ; preds = %115
  %121 = load i32, ptr %11, align 4
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %123, label %131

123:                                              ; preds = %120
  %124 = load ptr, ptr %17, align 8
  %125 = load i32, ptr %9, align 4
  %126 = zext i32 %125 to i64
  %127 = load ptr, ptr %10, align 8
  %128 = load i64, ptr %127, align 8
  %129 = add i64 %126, %128
  %130 = getelementptr inbounds i8, ptr %124, i64 %129
  store i8 0, ptr %130, align 1
  br label %131

131:                                              ; preds = %123, %120
  %132 = load i32, ptr %9, align 4
  %133 = icmp ugt i32 %132, 0
  br i1 %133, label %134, label %141

134:                                              ; preds = %131
  %135 = load ptr, ptr %17, align 8
  %136 = load ptr, ptr %7, align 8
  %137 = getelementptr inbounds %struct.png_struct_def, ptr %136, i32 0, i32 144
  %138 = load ptr, ptr %137, align 8
  %139 = load i32, ptr %9, align 4
  %140 = zext i32 %139 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %135, ptr align 1 %138, i64 %140, i1 false)
  br label %141

141:                                              ; preds = %134, %131
  %142 = load ptr, ptr %7, align 8
  %143 = getelementptr inbounds %struct.png_struct_def, ptr %142, i32 0, i32 144
  %144 = load ptr, ptr %143, align 8
  store ptr %144, ptr %18, align 8
  %145 = load ptr, ptr %17, align 8
  %146 = load ptr, ptr %7, align 8
  %147 = getelementptr inbounds %struct.png_struct_def, ptr %146, i32 0, i32 144
  store ptr %145, ptr %147, align 8
  %148 = load i64, ptr %16, align 8
  %149 = load ptr, ptr %7, align 8
  %150 = getelementptr inbounds %struct.png_struct_def, ptr %149, i32 0, i32 145
  store i64 %148, ptr %150, align 8
  %151 = load ptr, ptr %18, align 8
  store ptr %151, ptr %17, align 8
  br label %153

152:                                              ; preds = %115
  store i32 -7, ptr %13, align 4
  br label %153

153:                                              ; preds = %152, %141
  br label %159

154:                                              ; preds = %94
  %155 = load i32, ptr %13, align 4
  %156 = icmp eq i32 %155, 0
  br i1 %156, label %157, label %158

157:                                              ; preds = %154
  store i32 -7, ptr %13, align 4
  br label %158

158:                                              ; preds = %157, %154
  br label %159

159:                                              ; preds = %158, %153
  %160 = load ptr, ptr %7, align 8
  %161 = load ptr, ptr %17, align 8
  call void @png_free(ptr noundef %160, ptr noundef %161)
  %162 = load i32, ptr %13, align 4
  %163 = icmp eq i32 %162, 1
  br i1 %163, label %164, label %172

164:                                              ; preds = %159
  %165 = load i32, ptr %8, align 4
  %166 = load i32, ptr %9, align 4
  %167 = sub i32 %165, %166
  %168 = load i32, ptr %14, align 4
  %169 = icmp ne i32 %167, %168
  br i1 %169, label %170, label %172

170:                                              ; preds = %164
  %171 = load ptr, ptr %7, align 8
  call void @png_chunk_benign_error(ptr noundef %171, ptr noundef @.str.34)
  br label %172

172:                                              ; preds = %170, %164, %159
  br label %175

173:                                              ; preds = %77
  store i32 -4, ptr %13, align 4
  %174 = load ptr, ptr %7, align 8
  call void @png_zstream_error(ptr noundef %174, i32 noundef -4)
  br label %175

175:                                              ; preds = %173, %172
  br label %179

176:                                              ; preds = %72
  %177 = load ptr, ptr %7, align 8
  %178 = load i32, ptr %13, align 4
  call void @png_zstream_error(ptr noundef %177, i32 noundef %178)
  store i32 -7, ptr %13, align 4
  br label %179

179:                                              ; preds = %176, %175
  br label %185

180:                                              ; preds = %54
  %181 = load i32, ptr %13, align 4
  %182 = icmp eq i32 %181, 0
  br i1 %182, label %183, label %184

183:                                              ; preds = %180
  store i32 -7, ptr %13, align 4
  br label %184

184:                                              ; preds = %183, %180
  br label %185

185:                                              ; preds = %184, %179
  %186 = load ptr, ptr %7, align 8
  %187 = getelementptr inbounds %struct.png_struct_def, ptr %186, i32 0, i32 18
  store i32 0, ptr %187, align 8
  br label %193

188:                                              ; preds = %46
  %189 = load i32, ptr %13, align 4
  %190 = icmp eq i32 %189, 1
  br i1 %190, label %191, label %192

191:                                              ; preds = %188
  store i32 -7, ptr %13, align 4
  br label %192

192:                                              ; preds = %191, %188
  br label %193

193:                                              ; preds = %192, %185
  %194 = load i32, ptr %13, align 4
  store i32 %194, ptr %6, align 4
  br label %197

195:                                              ; preds = %5
  %196 = load ptr, ptr %7, align 8
  call void @png_zstream_error(ptr noundef %196, i32 noundef -4)
  store i32 -4, ptr %6, align 4
  br label %197

197:                                              ; preds = %195, %193
  %198 = load i32, ptr %6, align 4
  ret i32 %198
}

declare i32 @png_set_text_2(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_inflate(ptr noalias noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i64, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca [1024 x i8], align 16
  store ptr %0, ptr %9, align 8
  store i32 %1, ptr %10, align 4
  store i32 %2, ptr %11, align 4
  store ptr %3, ptr %12, align 8
  store ptr %4, ptr %13, align 8
  store ptr %5, ptr %14, align 8
  store ptr %6, ptr %15, align 8
  %21 = load ptr, ptr %9, align 8
  %22 = getelementptr inbounds %struct.png_struct_def, ptr %21, i32 0, i32 18
  %23 = load i32, ptr %22, align 8
  %24 = load i32, ptr %10, align 4
  %25 = icmp eq i32 %23, %24
  br i1 %25, label %26, label %160

26:                                               ; preds = %7
  %27 = load ptr, ptr %15, align 8
  %28 = load i64, ptr %27, align 8
  store i64 %28, ptr %17, align 8
  %29 = load ptr, ptr %13, align 8
  %30 = load i32, ptr %29, align 4
  store i32 %30, ptr %18, align 4
  %31 = load ptr, ptr %12, align 8
  %32 = load ptr, ptr %9, align 8
  %33 = getelementptr inbounds %struct.png_struct_def, ptr %32, i32 0, i32 19
  %34 = getelementptr inbounds %struct.z_stream_s, ptr %33, i32 0, i32 0
  store ptr %31, ptr %34, align 8
  %35 = load ptr, ptr %9, align 8
  %36 = getelementptr inbounds %struct.png_struct_def, ptr %35, i32 0, i32 19
  %37 = getelementptr inbounds %struct.z_stream_s, ptr %36, i32 0, i32 1
  store i32 0, ptr %37, align 8
  %38 = load ptr, ptr %9, align 8
  %39 = getelementptr inbounds %struct.png_struct_def, ptr %38, i32 0, i32 19
  %40 = getelementptr inbounds %struct.z_stream_s, ptr %39, i32 0, i32 4
  store i32 0, ptr %40, align 8
  %41 = load ptr, ptr %14, align 8
  %42 = icmp ne ptr %41, null
  br i1 %42, label %43, label %48

43:                                               ; preds = %26
  %44 = load ptr, ptr %14, align 8
  %45 = load ptr, ptr %9, align 8
  %46 = getelementptr inbounds %struct.png_struct_def, ptr %45, i32 0, i32 19
  %47 = getelementptr inbounds %struct.z_stream_s, ptr %46, i32 0, i32 3
  store ptr %44, ptr %47, align 8
  br label %48

48:                                               ; preds = %43, %26
  br label %49

49:                                               ; preds = %117, %48
  %50 = load ptr, ptr %9, align 8
  %51 = getelementptr inbounds %struct.png_struct_def, ptr %50, i32 0, i32 19
  %52 = getelementptr inbounds %struct.z_stream_s, ptr %51, i32 0, i32 1
  %53 = load i32, ptr %52, align 8
  %54 = load i32, ptr %18, align 4
  %55 = add i32 %54, %53
  store i32 %55, ptr %18, align 4
  store i32 -1, ptr %19, align 4
  %56 = load i32, ptr %18, align 4
  %57 = load i32, ptr %19, align 4
  %58 = icmp ult i32 %56, %57
  br i1 %58, label %59, label %61

59:                                               ; preds = %49
  %60 = load i32, ptr %18, align 4
  store i32 %60, ptr %19, align 4
  br label %61

61:                                               ; preds = %59, %49
  %62 = load i32, ptr %19, align 4
  %63 = load i32, ptr %18, align 4
  %64 = sub i32 %63, %62
  store i32 %64, ptr %18, align 4
  %65 = load i32, ptr %19, align 4
  %66 = load ptr, ptr %9, align 8
  %67 = getelementptr inbounds %struct.png_struct_def, ptr %66, i32 0, i32 19
  %68 = getelementptr inbounds %struct.z_stream_s, ptr %67, i32 0, i32 1
  store i32 %65, ptr %68, align 8
  %69 = load ptr, ptr %9, align 8
  %70 = getelementptr inbounds %struct.png_struct_def, ptr %69, i32 0, i32 19
  %71 = getelementptr inbounds %struct.z_stream_s, ptr %70, i32 0, i32 4
  %72 = load i32, ptr %71, align 8
  %73 = zext i32 %72 to i64
  %74 = load i64, ptr %17, align 8
  %75 = add i64 %74, %73
  store i64 %75, ptr %17, align 8
  store i32 -1, ptr %19, align 4
  %76 = load ptr, ptr %14, align 8
  %77 = icmp eq ptr %76, null
  br i1 %77, label %78, label %88

78:                                               ; preds = %61
  %79 = getelementptr inbounds [1024 x i8], ptr %20, i64 0, i64 0
  %80 = load ptr, ptr %9, align 8
  %81 = getelementptr inbounds %struct.png_struct_def, ptr %80, i32 0, i32 19
  %82 = getelementptr inbounds %struct.z_stream_s, ptr %81, i32 0, i32 3
  store ptr %79, ptr %82, align 8
  %83 = load i32, ptr %19, align 4
  %84 = zext i32 %83 to i64
  %85 = icmp ult i64 1024, %84
  br i1 %85, label %86, label %87

86:                                               ; preds = %78
  store i32 1024, ptr %19, align 4
  br label %87

87:                                               ; preds = %86, %78
  br label %88

88:                                               ; preds = %87, %61
  %89 = load i64, ptr %17, align 8
  %90 = load i32, ptr %19, align 4
  %91 = zext i32 %90 to i64
  %92 = icmp ult i64 %89, %91
  br i1 %92, label %93, label %96

93:                                               ; preds = %88
  %94 = load i64, ptr %17, align 8
  %95 = trunc i64 %94 to i32
  store i32 %95, ptr %19, align 4
  br label %96

96:                                               ; preds = %93, %88
  %97 = load i32, ptr %19, align 4
  %98 = load ptr, ptr %9, align 8
  %99 = getelementptr inbounds %struct.png_struct_def, ptr %98, i32 0, i32 19
  %100 = getelementptr inbounds %struct.z_stream_s, ptr %99, i32 0, i32 4
  store i32 %97, ptr %100, align 8
  %101 = load i32, ptr %19, align 4
  %102 = zext i32 %101 to i64
  %103 = load i64, ptr %17, align 8
  %104 = sub i64 %103, %102
  store i64 %104, ptr %17, align 8
  %105 = load ptr, ptr %9, align 8
  %106 = load i64, ptr %17, align 8
  %107 = icmp ugt i64 %106, 0
  br i1 %107, label %108, label %109

108:                                              ; preds = %96
  br label %114

109:                                              ; preds = %96
  %110 = load i32, ptr %11, align 4
  %111 = icmp ne i32 %110, 0
  %112 = zext i1 %111 to i64
  %113 = select i1 %111, i32 4, i32 2
  br label %114

114:                                              ; preds = %109, %108
  %115 = phi i32 [ 0, %108 ], [ %113, %109 ]
  %116 = call i32 @png_zlib_inflate(ptr noundef %105, i32 noundef %115)
  store i32 %116, ptr %16, align 4
  br label %117

117:                                              ; preds = %114
  %118 = load i32, ptr %16, align 4
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %49, label %120, !llvm.loop !41

120:                                              ; preds = %117
  %121 = load ptr, ptr %14, align 8
  %122 = icmp eq ptr %121, null
  br i1 %122, label %123, label %127

123:                                              ; preds = %120
  %124 = load ptr, ptr %9, align 8
  %125 = getelementptr inbounds %struct.png_struct_def, ptr %124, i32 0, i32 19
  %126 = getelementptr inbounds %struct.z_stream_s, ptr %125, i32 0, i32 3
  store ptr null, ptr %126, align 8
  br label %127

127:                                              ; preds = %123, %120
  %128 = load ptr, ptr %9, align 8
  %129 = getelementptr inbounds %struct.png_struct_def, ptr %128, i32 0, i32 19
  %130 = getelementptr inbounds %struct.z_stream_s, ptr %129, i32 0, i32 1
  %131 = load i32, ptr %130, align 8
  %132 = load i32, ptr %18, align 4
  %133 = add i32 %132, %131
  store i32 %133, ptr %18, align 4
  %134 = load ptr, ptr %9, align 8
  %135 = getelementptr inbounds %struct.png_struct_def, ptr %134, i32 0, i32 19
  %136 = getelementptr inbounds %struct.z_stream_s, ptr %135, i32 0, i32 4
  %137 = load i32, ptr %136, align 8
  %138 = zext i32 %137 to i64
  %139 = load i64, ptr %17, align 8
  %140 = add i64 %139, %138
  store i64 %140, ptr %17, align 8
  %141 = load i64, ptr %17, align 8
  %142 = icmp ugt i64 %141, 0
  br i1 %142, label %143, label %148

143:                                              ; preds = %127
  %144 = load i64, ptr %17, align 8
  %145 = load ptr, ptr %15, align 8
  %146 = load i64, ptr %145, align 8
  %147 = sub i64 %146, %144
  store i64 %147, ptr %145, align 8
  br label %148

148:                                              ; preds = %143, %127
  %149 = load i32, ptr %18, align 4
  %150 = icmp ugt i32 %149, 0
  br i1 %150, label %151, label %156

151:                                              ; preds = %148
  %152 = load i32, ptr %18, align 4
  %153 = load ptr, ptr %13, align 8
  %154 = load i32, ptr %153, align 4
  %155 = sub i32 %154, %152
  store i32 %155, ptr %153, align 4
  br label %156

156:                                              ; preds = %151, %148
  %157 = load ptr, ptr %9, align 8
  %158 = load i32, ptr %16, align 4
  call void @png_zstream_error(ptr noundef %157, i32 noundef %158)
  %159 = load i32, ptr %16, align 4
  store i32 %159, ptr %8, align 4
  br label %164

160:                                              ; preds = %7
  %161 = load ptr, ptr %9, align 8
  %162 = getelementptr inbounds %struct.png_struct_def, ptr %161, i32 0, i32 19
  %163 = getelementptr inbounds %struct.z_stream_s, ptr %162, i32 0, i32 6
  store ptr @.str.37, ptr %163, align 8
  store i32 -2, ptr %8, align 4
  br label %164

164:                                              ; preds = %160, %156
  %165 = load i32, ptr %8, align 4
  ret i32 %165
}

declare i32 @inflateReset(ptr noundef) #2

declare void @png_set_mDCV_fixed(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare void @png_set_oFFs(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare void @png_set_pCAL(ptr noundef, ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare void @png_set_pHYs(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef) #2

declare void @png_set_sBIT(ptr noundef, ptr noundef, ptr noundef) #2

declare i32 @png_check_fp_number(ptr noundef, i64 noundef, ptr noundef, ptr noundef) #2

declare void @png_set_sCAL_s(ptr noundef, ptr noundef, i32 noundef, ptr noundef, ptr noundef) #2

declare void @png_warning(ptr noundef, ptr noundef) #2

declare void @png_set_sPLT(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #2

declare void @png_set_sRGB(ptr noundef, ptr noundef, i32 noundef) #2

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #5

declare void @png_set_tIME(ptr noundef, ptr noundef, ptr noundef) #2

declare void @png_set_tRNS(ptr noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_read_filter_row_sub(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.png_row_info_struct, ptr %11, i32 0, i32 1
  %13 = load i64, ptr %12, align 8
  store i64 %13, ptr %8, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.png_row_info_struct, ptr %14, i32 0, i32 5
  %16 = load i8, ptr %15, align 1
  %17 = zext i8 %16 to i32
  %18 = add nsw i32 %17, 7
  %19 = ashr i32 %18, 3
  store i32 %19, ptr %9, align 4
  %20 = load ptr, ptr %5, align 8
  %21 = load i32, ptr %9, align 4
  %22 = zext i32 %21 to i64
  %23 = getelementptr inbounds i8, ptr %20, i64 %22
  store ptr %23, ptr %10, align 8
  %24 = load ptr, ptr %6, align 8
  %25 = load i32, ptr %9, align 4
  %26 = zext i32 %25 to i64
  store i64 %26, ptr %7, align 8
  br label %27

27:                                               ; preds = %48, %3
  %28 = load i64, ptr %7, align 8
  %29 = load i64, ptr %8, align 8
  %30 = icmp ult i64 %28, %29
  br i1 %30, label %31, label %51

31:                                               ; preds = %27
  %32 = load ptr, ptr %10, align 8
  %33 = load i8, ptr %32, align 1
  %34 = zext i8 %33 to i32
  %35 = load ptr, ptr %10, align 8
  %36 = load i32, ptr %9, align 4
  %37 = zext i32 %36 to i64
  %38 = sub i64 0, %37
  %39 = getelementptr inbounds i8, ptr %35, i64 %38
  %40 = load i8, ptr %39, align 1
  %41 = zext i8 %40 to i32
  %42 = add nsw i32 %34, %41
  %43 = and i32 %42, 255
  %44 = trunc i32 %43 to i8
  %45 = load ptr, ptr %10, align 8
  store i8 %44, ptr %45, align 1
  %46 = load ptr, ptr %10, align 8
  %47 = getelementptr inbounds i8, ptr %46, i32 1
  store ptr %47, ptr %10, align 8
  br label %48

48:                                               ; preds = %31
  %49 = load i64, ptr %7, align 8
  %50 = add i64 %49, 1
  store i64 %50, ptr %7, align 8
  br label %27, !llvm.loop !42

51:                                               ; preds = %27
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_read_filter_row_up(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds %struct.png_row_info_struct, ptr %11, i32 0, i32 1
  %13 = load i64, ptr %12, align 8
  store i64 %13, ptr %8, align 8
  %14 = load ptr, ptr %5, align 8
  store ptr %14, ptr %9, align 8
  %15 = load ptr, ptr %6, align 8
  store ptr %15, ptr %10, align 8
  store i64 0, ptr %7, align 8
  br label %16

16:                                               ; preds = %34, %3
  %17 = load i64, ptr %7, align 8
  %18 = load i64, ptr %8, align 8
  %19 = icmp ult i64 %17, %18
  br i1 %19, label %20, label %37

20:                                               ; preds = %16
  %21 = load ptr, ptr %9, align 8
  %22 = load i8, ptr %21, align 1
  %23 = zext i8 %22 to i32
  %24 = load ptr, ptr %10, align 8
  %25 = getelementptr inbounds i8, ptr %24, i32 1
  store ptr %25, ptr %10, align 8
  %26 = load i8, ptr %24, align 1
  %27 = zext i8 %26 to i32
  %28 = add nsw i32 %23, %27
  %29 = and i32 %28, 255
  %30 = trunc i32 %29 to i8
  %31 = load ptr, ptr %9, align 8
  store i8 %30, ptr %31, align 1
  %32 = load ptr, ptr %9, align 8
  %33 = getelementptr inbounds i8, ptr %32, i32 1
  store ptr %33, ptr %9, align 8
  br label %34

34:                                               ; preds = %20
  %35 = load i64, ptr %7, align 8
  %36 = add i64 %35, 1
  store i64 %36, ptr %7, align 8
  br label %16, !llvm.loop !43

37:                                               ; preds = %16
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_read_filter_row_avg(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %12 = load ptr, ptr %5, align 8
  store ptr %12, ptr %8, align 8
  %13 = load ptr, ptr %6, align 8
  store ptr %13, ptr %9, align 8
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.png_row_info_struct, ptr %14, i32 0, i32 5
  %16 = load i8, ptr %15, align 1
  %17 = zext i8 %16 to i32
  %18 = add nsw i32 %17, 7
  %19 = ashr i32 %18, 3
  store i32 %19, ptr %10, align 4
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.png_row_info_struct, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = load i32, ptr %10, align 4
  %24 = zext i32 %23 to i64
  %25 = sub i64 %22, %24
  store i64 %25, ptr %11, align 8
  store i64 0, ptr %7, align 8
  br label %26

26:                                               ; preds = %46, %3
  %27 = load i64, ptr %7, align 8
  %28 = load i32, ptr %10, align 4
  %29 = zext i32 %28 to i64
  %30 = icmp ult i64 %27, %29
  br i1 %30, label %31, label %49

31:                                               ; preds = %26
  %32 = load ptr, ptr %8, align 8
  %33 = load i8, ptr %32, align 1
  %34 = zext i8 %33 to i32
  %35 = load ptr, ptr %9, align 8
  %36 = getelementptr inbounds i8, ptr %35, i32 1
  store ptr %36, ptr %9, align 8
  %37 = load i8, ptr %35, align 1
  %38 = zext i8 %37 to i32
  %39 = sdiv i32 %38, 2
  %40 = add nsw i32 %34, %39
  %41 = and i32 %40, 255
  %42 = trunc i32 %41 to i8
  %43 = load ptr, ptr %8, align 8
  store i8 %42, ptr %43, align 1
  %44 = load ptr, ptr %8, align 8
  %45 = getelementptr inbounds i8, ptr %44, i32 1
  store ptr %45, ptr %8, align 8
  br label %46

46:                                               ; preds = %31
  %47 = load i64, ptr %7, align 8
  %48 = add i64 %47, 1
  store i64 %48, ptr %7, align 8
  br label %26, !llvm.loop !44

49:                                               ; preds = %26
  store i64 0, ptr %7, align 8
  br label %50

50:                                               ; preds = %77, %49
  %51 = load i64, ptr %7, align 8
  %52 = load i64, ptr %11, align 8
  %53 = icmp ult i64 %51, %52
  br i1 %53, label %54, label %80

54:                                               ; preds = %50
  %55 = load ptr, ptr %8, align 8
  %56 = load i8, ptr %55, align 1
  %57 = zext i8 %56 to i32
  %58 = load ptr, ptr %9, align 8
  %59 = getelementptr inbounds i8, ptr %58, i32 1
  store ptr %59, ptr %9, align 8
  %60 = load i8, ptr %58, align 1
  %61 = zext i8 %60 to i32
  %62 = load ptr, ptr %8, align 8
  %63 = load i32, ptr %10, align 4
  %64 = zext i32 %63 to i64
  %65 = sub i64 0, %64
  %66 = getelementptr inbounds i8, ptr %62, i64 %65
  %67 = load i8, ptr %66, align 1
  %68 = zext i8 %67 to i32
  %69 = add nsw i32 %61, %68
  %70 = sdiv i32 %69, 2
  %71 = add nsw i32 %57, %70
  %72 = and i32 %71, 255
  %73 = trunc i32 %72 to i8
  %74 = load ptr, ptr %8, align 8
  store i8 %73, ptr %74, align 1
  %75 = load ptr, ptr %8, align 8
  %76 = getelementptr inbounds i8, ptr %75, i32 1
  store ptr %76, ptr %8, align 8
  br label %77

77:                                               ; preds = %54
  %78 = load i64, ptr %7, align 8
  %79 = add i64 %78, 1
  store i64 %79, ptr %7, align 8
  br label %50, !llvm.loop !45

80:                                               ; preds = %50
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_read_filter_row_paeth_1byte_pixel(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds %struct.png_row_info_struct, ptr %16, i32 0, i32 1
  %18 = load i64, ptr %17, align 8
  %19 = getelementptr inbounds i8, ptr %15, i64 %18
  store ptr %19, ptr %7, align 8
  %20 = load ptr, ptr %6, align 8
  %21 = getelementptr inbounds i8, ptr %20, i32 1
  store ptr %21, ptr %6, align 8
  %22 = load i8, ptr %20, align 1
  %23 = zext i8 %22 to i32
  store i32 %23, ptr %9, align 4
  %24 = load ptr, ptr %5, align 8
  %25 = load i8, ptr %24, align 1
  %26 = zext i8 %25 to i32
  %27 = load i32, ptr %9, align 4
  %28 = add nsw i32 %26, %27
  store i32 %28, ptr %8, align 4
  %29 = load i32, ptr %8, align 4
  %30 = trunc i32 %29 to i8
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds i8, ptr %31, i32 1
  store ptr %32, ptr %5, align 8
  store i8 %30, ptr %31, align 1
  br label %33

33:                                               ; preds = %95, %3
  %34 = load ptr, ptr %5, align 8
  %35 = load ptr, ptr %7, align 8
  %36 = icmp ult ptr %34, %35
  br i1 %36, label %37, label %106

37:                                               ; preds = %33
  %38 = load i32, ptr %8, align 4
  %39 = and i32 %38, 255
  store i32 %39, ptr %8, align 4
  %40 = load ptr, ptr %6, align 8
  %41 = getelementptr inbounds i8, ptr %40, i32 1
  store ptr %41, ptr %6, align 8
  %42 = load i8, ptr %40, align 1
  %43 = zext i8 %42 to i32
  store i32 %43, ptr %10, align 4
  %44 = load i32, ptr %10, align 4
  %45 = load i32, ptr %9, align 4
  %46 = sub nsw i32 %44, %45
  store i32 %46, ptr %14, align 4
  %47 = load i32, ptr %8, align 4
  %48 = load i32, ptr %9, align 4
  %49 = sub nsw i32 %47, %48
  store i32 %49, ptr %13, align 4
  %50 = load i32, ptr %14, align 4
  %51 = icmp slt i32 %50, 0
  br i1 %51, label %52, label %55

52:                                               ; preds = %37
  %53 = load i32, ptr %14, align 4
  %54 = sub nsw i32 0, %53
  br label %57

55:                                               ; preds = %37
  %56 = load i32, ptr %14, align 4
  br label %57

57:                                               ; preds = %55, %52
  %58 = phi i32 [ %54, %52 ], [ %56, %55 ]
  store i32 %58, ptr %11, align 4
  %59 = load i32, ptr %13, align 4
  %60 = icmp slt i32 %59, 0
  br i1 %60, label %61, label %64

61:                                               ; preds = %57
  %62 = load i32, ptr %13, align 4
  %63 = sub nsw i32 0, %62
  br label %66

64:                                               ; preds = %57
  %65 = load i32, ptr %13, align 4
  br label %66

66:                                               ; preds = %64, %61
  %67 = phi i32 [ %63, %61 ], [ %65, %64 ]
  store i32 %67, ptr %12, align 4
  %68 = load i32, ptr %14, align 4
  %69 = load i32, ptr %13, align 4
  %70 = add nsw i32 %68, %69
  %71 = icmp slt i32 %70, 0
  br i1 %71, label %72, label %77

72:                                               ; preds = %66
  %73 = load i32, ptr %14, align 4
  %74 = load i32, ptr %13, align 4
  %75 = add nsw i32 %73, %74
  %76 = sub nsw i32 0, %75
  br label %81

77:                                               ; preds = %66
  %78 = load i32, ptr %14, align 4
  %79 = load i32, ptr %13, align 4
  %80 = add nsw i32 %78, %79
  br label %81

81:                                               ; preds = %77, %72
  %82 = phi i32 [ %76, %72 ], [ %80, %77 ]
  store i32 %82, ptr %13, align 4
  %83 = load i32, ptr %12, align 4
  %84 = load i32, ptr %11, align 4
  %85 = icmp slt i32 %83, %84
  br i1 %85, label %86, label %89

86:                                               ; preds = %81
  %87 = load i32, ptr %12, align 4
  store i32 %87, ptr %11, align 4
  %88 = load i32, ptr %10, align 4
  store i32 %88, ptr %8, align 4
  br label %89

89:                                               ; preds = %86, %81
  %90 = load i32, ptr %13, align 4
  %91 = load i32, ptr %11, align 4
  %92 = icmp slt i32 %90, %91
  br i1 %92, label %93, label %95

93:                                               ; preds = %89
  %94 = load i32, ptr %9, align 4
  store i32 %94, ptr %8, align 4
  br label %95

95:                                               ; preds = %93, %89
  %96 = load i32, ptr %10, align 4
  store i32 %96, ptr %9, align 4
  %97 = load ptr, ptr %5, align 8
  %98 = load i8, ptr %97, align 1
  %99 = zext i8 %98 to i32
  %100 = load i32, ptr %8, align 4
  %101 = add nsw i32 %100, %99
  store i32 %101, ptr %8, align 4
  %102 = load i32, ptr %8, align 4
  %103 = trunc i32 %102 to i8
  %104 = load ptr, ptr %5, align 8
  %105 = getelementptr inbounds i8, ptr %104, i32 1
  store ptr %105, ptr %5, align 8
  store i8 %103, ptr %104, align 1
  br label %33, !llvm.loop !46

106:                                              ; preds = %33
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_read_filter_row_paeth_multibyte_pixel(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.png_row_info_struct, ptr %17, i32 0, i32 5
  %19 = load i8, ptr %18, align 1
  %20 = zext i8 %19 to i32
  %21 = add nsw i32 %20, 7
  %22 = ashr i32 %21, 3
  store i32 %22, ptr %7, align 4
  %23 = load ptr, ptr %5, align 8
  %24 = load i32, ptr %7, align 4
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds i8, ptr %23, i64 %25
  store ptr %26, ptr %8, align 8
  br label %27

27:                                               ; preds = %31, %3
  %28 = load ptr, ptr %5, align 8
  %29 = load ptr, ptr %8, align 8
  %30 = icmp ult ptr %28, %29
  br i1 %30, label %31, label %44

31:                                               ; preds = %27
  %32 = load ptr, ptr %5, align 8
  %33 = load i8, ptr %32, align 1
  %34 = zext i8 %33 to i32
  %35 = load ptr, ptr %6, align 8
  %36 = getelementptr inbounds i8, ptr %35, i32 1
  store ptr %36, ptr %6, align 8
  %37 = load i8, ptr %35, align 1
  %38 = zext i8 %37 to i32
  %39 = add nsw i32 %34, %38
  store i32 %39, ptr %9, align 4
  %40 = load i32, ptr %9, align 4
  %41 = trunc i32 %40 to i8
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds i8, ptr %42, i32 1
  store ptr %43, ptr %5, align 8
  store i8 %41, ptr %42, align 1
  br label %27, !llvm.loop !47

44:                                               ; preds = %27
  %45 = load ptr, ptr %8, align 8
  %46 = load ptr, ptr %4, align 8
  %47 = getelementptr inbounds %struct.png_row_info_struct, ptr %46, i32 0, i32 1
  %48 = load i64, ptr %47, align 8
  %49 = load i32, ptr %7, align 4
  %50 = zext i32 %49 to i64
  %51 = sub i64 %48, %50
  %52 = getelementptr inbounds i8, ptr %45, i64 %51
  store ptr %52, ptr %8, align 8
  br label %53

53:                                               ; preds = %127, %44
  %54 = load ptr, ptr %5, align 8
  %55 = load ptr, ptr %8, align 8
  %56 = icmp ult ptr %54, %55
  br i1 %56, label %57, label %137

57:                                               ; preds = %53
  %58 = load ptr, ptr %6, align 8
  %59 = load i32, ptr %7, align 4
  %60 = zext i32 %59 to i64
  %61 = sub i64 0, %60
  %62 = getelementptr inbounds i8, ptr %58, i64 %61
  %63 = load i8, ptr %62, align 1
  %64 = zext i8 %63 to i32
  store i32 %64, ptr %12, align 4
  %65 = load ptr, ptr %5, align 8
  %66 = load i32, ptr %7, align 4
  %67 = zext i32 %66 to i64
  %68 = sub i64 0, %67
  %69 = getelementptr inbounds i8, ptr %65, i64 %68
  %70 = load i8, ptr %69, align 1
  %71 = zext i8 %70 to i32
  store i32 %71, ptr %10, align 4
  %72 = load ptr, ptr %6, align 8
  %73 = getelementptr inbounds i8, ptr %72, i32 1
  store ptr %73, ptr %6, align 8
  %74 = load i8, ptr %72, align 1
  %75 = zext i8 %74 to i32
  store i32 %75, ptr %11, align 4
  %76 = load i32, ptr %11, align 4
  %77 = load i32, ptr %12, align 4
  %78 = sub nsw i32 %76, %77
  store i32 %78, ptr %16, align 4
  %79 = load i32, ptr %10, align 4
  %80 = load i32, ptr %12, align 4
  %81 = sub nsw i32 %79, %80
  store i32 %81, ptr %15, align 4
  %82 = load i32, ptr %16, align 4
  %83 = icmp slt i32 %82, 0
  br i1 %83, label %84, label %87

84:                                               ; preds = %57
  %85 = load i32, ptr %16, align 4
  %86 = sub nsw i32 0, %85
  br label %89

87:                                               ; preds = %57
  %88 = load i32, ptr %16, align 4
  br label %89

89:                                               ; preds = %87, %84
  %90 = phi i32 [ %86, %84 ], [ %88, %87 ]
  store i32 %90, ptr %13, align 4
  %91 = load i32, ptr %15, align 4
  %92 = icmp slt i32 %91, 0
  br i1 %92, label %93, label %96

93:                                               ; preds = %89
  %94 = load i32, ptr %15, align 4
  %95 = sub nsw i32 0, %94
  br label %98

96:                                               ; preds = %89
  %97 = load i32, ptr %15, align 4
  br label %98

98:                                               ; preds = %96, %93
  %99 = phi i32 [ %95, %93 ], [ %97, %96 ]
  store i32 %99, ptr %14, align 4
  %100 = load i32, ptr %16, align 4
  %101 = load i32, ptr %15, align 4
  %102 = add nsw i32 %100, %101
  %103 = icmp slt i32 %102, 0
  br i1 %103, label %104, label %109

104:                                              ; preds = %98
  %105 = load i32, ptr %16, align 4
  %106 = load i32, ptr %15, align 4
  %107 = add nsw i32 %105, %106
  %108 = sub nsw i32 0, %107
  br label %113

109:                                              ; preds = %98
  %110 = load i32, ptr %16, align 4
  %111 = load i32, ptr %15, align 4
  %112 = add nsw i32 %110, %111
  br label %113

113:                                              ; preds = %109, %104
  %114 = phi i32 [ %108, %104 ], [ %112, %109 ]
  store i32 %114, ptr %15, align 4
  %115 = load i32, ptr %14, align 4
  %116 = load i32, ptr %13, align 4
  %117 = icmp slt i32 %115, %116
  br i1 %117, label %118, label %121

118:                                              ; preds = %113
  %119 = load i32, ptr %14, align 4
  store i32 %119, ptr %13, align 4
  %120 = load i32, ptr %11, align 4
  store i32 %120, ptr %10, align 4
  br label %121

121:                                              ; preds = %118, %113
  %122 = load i32, ptr %15, align 4
  %123 = load i32, ptr %13, align 4
  %124 = icmp slt i32 %122, %123
  br i1 %124, label %125, label %127

125:                                              ; preds = %121
  %126 = load i32, ptr %12, align 4
  store i32 %126, ptr %10, align 4
  br label %127

127:                                              ; preds = %125, %121
  %128 = load ptr, ptr %5, align 8
  %129 = load i8, ptr %128, align 1
  %130 = zext i8 %129 to i32
  %131 = load i32, ptr %10, align 4
  %132 = add nsw i32 %131, %130
  store i32 %132, ptr %10, align 4
  %133 = load i32, ptr %10, align 4
  %134 = trunc i32 %133 to i8
  %135 = load ptr, ptr %5, align 8
  %136 = getelementptr inbounds i8, ptr %135, i32 1
  store ptr %136, ptr %5, align 8
  store i8 %134, ptr %135, align 1
  br label %53, !llvm.loop !48

137:                                              ; preds = %53
  ret void
}

declare i64 @png_safecat(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #2

declare i32 @inflateReset2(ptr noundef, i32 noundef) #2

declare i32 @inflateInit2_(ptr noundef, i32 noundef, ptr noundef, i32 noundef) #2

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn }
attributes #7 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 2}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 19.1.7"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
!18 = distinct !{!18, !6}
!19 = distinct !{!19, !6}
!20 = distinct !{!20, !6}
!21 = distinct !{!21, !6}
!22 = distinct !{!22, !6}
!23 = distinct !{!23, !6}
!24 = distinct !{!24, !6}
!25 = distinct !{!25, !6}
!26 = distinct !{!26, !6}
!27 = distinct !{!27, !6}
!28 = distinct !{!28, !6}
!29 = distinct !{!29, !6}
!30 = distinct !{!30, !6}
!31 = distinct !{!31, !6}
!32 = distinct !{!32, !6}
!33 = distinct !{!33, !6}
!34 = distinct !{!34, !6}
!35 = distinct !{!35, !6}
!36 = distinct !{!36, !6}
!37 = distinct !{!37, !6}
!38 = distinct !{!38, !6}
!39 = distinct !{!39, !6}
!40 = distinct !{!40, !6}
!41 = distinct !{!41, !6}
!42 = distinct !{!42, !6}
!43 = distinct !{!43, !6}
!44 = distinct !{!44, !6}
!45 = distinct !{!45, !6}
!46 = distinct !{!46, !6}
!47 = distinct !{!47, !6}
!48 = distinct !{!48, !6}
