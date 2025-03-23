; ModuleID = '/mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/004_ibpng/pngread.c'
source_filename = "/mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/004_ibpng/pngread.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.png_xy = type { i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.png_struct_def = type { [1 x %struct.__jmp_buf_tag], ptr, ptr, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i8, i8, i32, i32, i32, i32, %struct.z_stream_s, ptr, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, i32, i32, i32, ptr, ptr, ptr, ptr, i64, i32, i32, ptr, i16, i32, i16, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i16, i8, i32, %struct.png_color_16_struct, %struct.png_color_16_struct, ptr, i32, i32, %struct.png_xy, i32, i32, i32, i32, i32, ptr, ptr, ptr, ptr, ptr, ptr, %struct.png_color_8_struct, %struct.png_color_8_struct, ptr, %struct.png_color_16_struct, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i64, i64, i64, i64, i32, i32, ptr, ptr, i32, [29 x i8], i32, ptr, ptr, i32, i32, ptr, i8, i8, i16, i16, ptr, i32, i8, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i8, i32, i32, i32, i64, %struct.png_unknown_chunk_t, i64, ptr, i64, i32, i32, ptr, [4 x ptr] }
%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }
%struct.z_stream_s = type { ptr, i32, i64, ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, i32, i64, i64 }
%struct.png_color_8_struct = type { i8, i8, i8, i8, i8 }
%struct.png_color_16_struct = type { i8, i16, i16, i16, i16 }
%struct.png_unknown_chunk_t = type { [5 x i8], ptr, i64, i8 }
%struct.png_row_info_struct = type { i32, i64, i8, i8, i8, i8 }
%struct.png_info_def = type { i32, i32, i32, i64, ptr, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8, [8 x i8], i8, i8, i8, i8, ptr, ptr, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, ptr, %struct.png_time_struct, %struct.png_color_8_struct, ptr, %struct.png_color_16_struct, %struct.png_color_16_struct, i32, i32, i8, i32, i32, i8, i32, ptr, ptr, ptr, i32, i32, ptr, ptr, i8, i8, i32, ptr, i32, ptr, i32, i8, ptr, ptr, ptr, %struct.png_xy, i32, i32 }
%struct.png_time_struct = type { i16, i8, i8, i8, i8, i8 }
%struct.png_image = type { ptr, i32, i32, i32, i32, i32, i32, i32, [64 x i8] }
%struct.png_control = type { ptr, ptr, ptr, ptr, i64, i8 }
%struct.png_image_read_control = type { ptr, ptr, i32, ptr, ptr, ptr, ptr, i64, i32, i32, i32 }
%struct.png_color_struct = type { i8, i8, i8 }

@.str = private unnamed_addr constant [25 x i8] c"Missing IHDR before IDAT\00", align 1
@.str.1 = private unnamed_addr constant [25 x i8] c"Missing PLTE before IDAT\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Too many IDATs found\00", align 1
@.str.3 = private unnamed_addr constant [58 x i8] c"png_read_update_info/png_start_read_image: duplicate call\00", align 1
@.str.4 = private unnamed_addr constant [58 x i8] c"png_start_read_image/png_read_update_info: duplicate call\00", align 1
@.str.5 = private unnamed_addr constant [33 x i8] c"Invalid attempt to read row data\00", align 1
@.str.6 = private unnamed_addr constant [26 x i8] c"bad adaptive filter value\00", align 1
@.str.7 = private unnamed_addr constant [24 x i8] c"sequential row overflow\00", align 1
@.str.8 = private unnamed_addr constant [47 x i8] c"internal sequential row size calculation error\00", align 1
@.str.9 = private unnamed_addr constant [65 x i8] c"Interlace handling should be turned on when using png_read_image\00", align 1
@.str.10 = private unnamed_addr constant [41 x i8] c"Read palette index exceeding num_palette\00", align 1
@.str.11 = private unnamed_addr constant [22 x i8] c".Too many IDATs found\00", align 1
@.str.12 = private unnamed_addr constant [23 x i8] c"..Too many IDATs found\00", align 1
@.str.13 = private unnamed_addr constant [49 x i8] c"Image is too high to process with png_read_png()\00", align 1
@.str.14 = private unnamed_addr constant [50 x i8] c"png_image_begin_read_from_stdio: invalid argument\00", align 1
@.str.15 = private unnamed_addr constant [61 x i8] c"png_image_begin_read_from_stdio: incorrect PNG_IMAGE_VERSION\00", align 1
@.str.16 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str.17 = private unnamed_addr constant [49 x i8] c"png_image_begin_read_from_file: invalid argument\00", align 1
@.str.18 = private unnamed_addr constant [60 x i8] c"png_image_begin_read_from_file: incorrect PNG_IMAGE_VERSION\00", align 1
@.str.19 = private unnamed_addr constant [51 x i8] c"png_image_begin_read_from_memory: invalid argument\00", align 1
@.str.20 = private unnamed_addr constant [62 x i8] c"png_image_begin_read_from_memory: incorrect PNG_IMAGE_VERSION\00", align 1
@.str.21 = private unnamed_addr constant [47 x i8] c"png_image_finish_read[color-map]: no color-map\00", align 1
@.str.22 = private unnamed_addr constant [39 x i8] c"png_image_finish_read: image too large\00", align 1
@.str.23 = private unnamed_addr constant [40 x i8] c"png_image_finish_read: invalid argument\00", align 1
@.str.24 = private unnamed_addr constant [44 x i8] c"png_image_finish_read: row_stride too large\00", align 1
@.str.25 = private unnamed_addr constant [49 x i8] c"png_image_finish_read: damaged PNG_IMAGE_VERSION\00", align 1
@.str.26 = private unnamed_addr constant [11 x i8] c"1.6.48.git\00", align 1
@.str.27 = private unnamed_addr constant [30 x i8] c"png_image_read: out of memory\00", align 1
@.str.28 = private unnamed_addr constant [40 x i8] c"png_image_read: opaque pointer not NULL\00", align 1
@chromaticities_match_sRGB.sRGB_xy = internal constant %struct.png_xy { i32 64000, i32 33000, i32 30000, i32 60000, i32 15000, i32 6000, i32 31270, i32 32900 }, align 4
@.str.29 = private unnamed_addr constant [24 x i8] c"read beyond end of data\00", align 1
@.str.30 = private unnamed_addr constant [20 x i8] c"invalid memory read\00", align 1
@.str.31 = private unnamed_addr constant [63 x i8] c"background color must be supplied to remove alpha/transparency\00", align 1
@.str.32 = private unnamed_addr constant [35 x i8] c"gray[8] color-map: too few entries\00", align 1
@.str.33 = private unnamed_addr constant [36 x i8] c"gray[16] color-map: too few entries\00", align 1
@png_sRGB_base = external constant [512 x i16], align 16
@png_sRGB_delta = external constant [512 x i8], align 16
@.str.34 = private unnamed_addr constant [38 x i8] c"gray+alpha color-map: too few entries\00", align 1
@.str.35 = private unnamed_addr constant [38 x i8] c"gray-alpha color-map: too few entries\00", align 1
@.str.36 = private unnamed_addr constant [36 x i8] c"ga-alpha color-map: too few entries\00", align 1
@png_sRGB_table = external constant [256 x i16], align 16
@.str.37 = private unnamed_addr constant [35 x i8] c"rgb[ga] color-map: too few entries\00", align 1
@.str.38 = private unnamed_addr constant [37 x i8] c"rgb[gray] color-map: too few entries\00", align 1
@.str.39 = private unnamed_addr constant [37 x i8] c"rgb+alpha color-map: too few entries\00", align 1
@.str.40 = private unnamed_addr constant [37 x i8] c"rgb-alpha color-map: too few entries\00", align 1
@.str.41 = private unnamed_addr constant [31 x i8] c"rgb color-map: too few entries\00", align 1
@.str.42 = private unnamed_addr constant [35 x i8] c"palette color-map: too few entries\00", align 1
@.str.43 = private unnamed_addr constant [23 x i8] c"invalid PNG color type\00", align 1
@.str.44 = private unnamed_addr constant [33 x i8] c"bad data option (internal error)\00", align 1
@.str.45 = private unnamed_addr constant [40 x i8] c"color map overflow (BAD internal error)\00", align 1
@.str.46 = private unnamed_addr constant [39 x i8] c"bad processing option (internal error)\00", align 1
@.str.47 = private unnamed_addr constant [38 x i8] c"bad background index (internal error)\00", align 1
@.str.48 = private unnamed_addr constant [29 x i8] c"color-map index out of range\00", align 1
@.str.49 = private unnamed_addr constant [30 x i8] c"bad encoding (internal error)\00", align 1
@.str.50 = private unnamed_addr constant [32 x i8] c"internal: default gamma not set\00", align 1
@.str.51 = private unnamed_addr constant [37 x i8] c"unexpected encoding (internal error)\00", align 1
@.str.52 = private unnamed_addr constant [42 x i8] c"bad color-map processing (internal error)\00", align 1
@png_image_skip_unused_chunks.chunks_to_process = internal constant [35 x i8] c"bKGD\00cHRM\00cICP\00gAMA\00mDCV\00sBIT\00sRGB\00", align 16
@.str.53 = private unnamed_addr constant [23 x i8] c"unknown interlace type\00", align 1
@.str.54 = private unnamed_addr constant [43 x i8] c"png_read_image: unsupported transformation\00", align 1
@.str.55 = private unnamed_addr constant [35 x i8] c"png_image_read: alpha channel lost\00", align 1
@.str.56 = private unnamed_addr constant [37 x i8] c"unexpected alpha swap transformation\00", align 1
@.str.57 = private unnamed_addr constant [40 x i8] c"png_read_image: invalid transformations\00", align 1
@.str.58 = private unnamed_addr constant [17 x i8] c"lost rgb to gray\00", align 1
@.str.59 = private unnamed_addr constant [19 x i8] c"unexpected compose\00", align 1
@.str.60 = private unnamed_addr constant [21 x i8] c"lost/gained channels\00", align 1
@.str.61 = private unnamed_addr constant [32 x i8] c"unexpected 8-bit transformation\00", align 1
@.str.62 = private unnamed_addr constant [21 x i8] c"unexpected bit depth\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define noalias ptr @png_create_read_struct(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = load ptr, ptr %7, align 8
  %12 = load ptr, ptr %8, align 8
  %13 = call noalias ptr @png_create_read_struct_2(ptr noundef %9, ptr noundef %10, ptr noundef %11, ptr noundef %12, ptr noundef null, ptr noundef null, ptr noundef null)
  ret ptr %13
}

; Function Attrs: noinline nounwind sspstrong uwtable
define noalias ptr @png_create_read_struct_2(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) #0 {
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  store ptr %0, ptr %8, align 8
  store ptr %1, ptr %9, align 8
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store ptr %4, ptr %12, align 8
  store ptr %5, ptr %13, align 8
  store ptr %6, ptr %14, align 8
  %16 = load ptr, ptr %8, align 8
  %17 = load ptr, ptr %9, align 8
  %18 = load ptr, ptr %10, align 8
  %19 = load ptr, ptr %11, align 8
  %20 = load ptr, ptr %12, align 8
  %21 = load ptr, ptr %13, align 8
  %22 = load ptr, ptr %14, align 8
  %23 = call noalias ptr @png_create_png_struct(ptr noundef %16, ptr noundef %17, ptr noundef %18, ptr noundef %19, ptr noundef %20, ptr noundef %21, ptr noundef %22)
  store ptr %23, ptr %15, align 8
  %24 = load ptr, ptr %15, align 8
  %25 = icmp ne ptr %24, null
  br i1 %25, label %26, label %36

26:                                               ; preds = %7
  %27 = load ptr, ptr %15, align 8
  %28 = getelementptr inbounds %struct.png_struct_def, ptr %27, i32 0, i32 15
  store i32 32768, ptr %28, align 4
  %29 = load ptr, ptr %15, align 8
  %30 = getelementptr inbounds %struct.png_struct_def, ptr %29, i32 0, i32 146
  store i32 8192, ptr %30, align 8
  %31 = load ptr, ptr %15, align 8
  %32 = getelementptr inbounds %struct.png_struct_def, ptr %31, i32 0, i32 16
  %33 = load i32, ptr %32, align 8
  %34 = or i32 %33, 1048576
  store i32 %34, ptr %32, align 8
  %35 = load ptr, ptr %15, align 8
  call void @png_set_read_fn(ptr noundef %35, ptr noundef null, ptr noundef null)
  br label %36

36:                                               ; preds = %26, %7
  %37 = load ptr, ptr %15, align 8
  ret ptr %37
}

declare noalias ptr @png_create_png_struct(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare void @png_set_read_fn(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_read_info(ptr noalias noundef %0, ptr noalias noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %13, label %10

10:                                               ; preds = %2
  %11 = load ptr, ptr %4, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %10, %2
  br label %136

14:                                               ; preds = %10
  %15 = load ptr, ptr %3, align 8
  %16 = load ptr, ptr %4, align 8
  call void @png_read_sig(ptr noundef %15, ptr noundef %16)
  br label %17

17:                                               ; preds = %135, %14
  %18 = load ptr, ptr %3, align 8
  %19 = call i32 @png_read_chunk_header(ptr noundef %18)
  store i32 %19, ptr %6, align 4
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.png_struct_def, ptr %20, i32 0, i32 45
  %22 = load i32, ptr %21, align 8
  store i32 %22, ptr %7, align 4
  %23 = load i32, ptr %7, align 4
  %24 = icmp eq i32 %23, 1229209940
  br i1 %24, label %25, label %62

25:                                               ; preds = %17
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds %struct.png_struct_def, ptr %26, i32 0, i32 15
  %28 = load i32, ptr %27, align 4
  %29 = and i32 %28, 1
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %33

31:                                               ; preds = %25
  %32 = load ptr, ptr %3, align 8
  call void @png_chunk_error(ptr noundef %32, ptr noundef @.str) #8
  unreachable

33:                                               ; preds = %25
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds %struct.png_struct_def, ptr %34, i32 0, i32 62
  %36 = load i8, ptr %35, align 1
  %37 = zext i8 %36 to i32
  %38 = icmp eq i32 %37, 3
  br i1 %38, label %39, label %47

39:                                               ; preds = %33
  %40 = load ptr, ptr %3, align 8
  %41 = getelementptr inbounds %struct.png_struct_def, ptr %40, i32 0, i32 15
  %42 = load i32, ptr %41, align 4
  %43 = and i32 %42, 2
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %47

45:                                               ; preds = %39
  %46 = load ptr, ptr %3, align 8
  call void @png_chunk_error(ptr noundef %46, ptr noundef @.str.1) #8
  unreachable

47:                                               ; preds = %39, %33
  %48 = load ptr, ptr %3, align 8
  %49 = getelementptr inbounds %struct.png_struct_def, ptr %48, i32 0, i32 15
  %50 = load i32, ptr %49, align 4
  %51 = and i32 %50, 8
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %55

53:                                               ; preds = %47
  %54 = load ptr, ptr %3, align 8
  call void @png_chunk_benign_error(ptr noundef %54, ptr noundef @.str.2)
  br label %55

55:                                               ; preds = %53, %47
  br label %56

56:                                               ; preds = %55
  br label %57

57:                                               ; preds = %56
  %58 = load ptr, ptr %3, align 8
  %59 = getelementptr inbounds %struct.png_struct_def, ptr %58, i32 0, i32 15
  %60 = load i32, ptr %59, align 4
  %61 = or i32 %60, 4
  store i32 %61, ptr %59, align 4
  br label %78

62:                                               ; preds = %17
  %63 = load ptr, ptr %3, align 8
  %64 = getelementptr inbounds %struct.png_struct_def, ptr %63, i32 0, i32 15
  %65 = load i32, ptr %64, align 4
  %66 = and i32 %65, 4
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %77

68:                                               ; preds = %62
  %69 = load ptr, ptr %3, align 8
  %70 = getelementptr inbounds %struct.png_struct_def, ptr %69, i32 0, i32 15
  %71 = load i32, ptr %70, align 4
  %72 = or i32 %71, 8192
  store i32 %72, ptr %70, align 4
  %73 = load ptr, ptr %3, align 8
  %74 = getelementptr inbounds %struct.png_struct_def, ptr %73, i32 0, i32 15
  %75 = load i32, ptr %74, align 4
  %76 = or i32 %75, 8
  store i32 %76, ptr %74, align 4
  br label %77

77:                                               ; preds = %68, %62
  br label %78

78:                                               ; preds = %77, %57
  %79 = load i32, ptr %7, align 4
  %80 = icmp eq i32 %79, 1229472850
  br i1 %80, label %81, label %86

81:                                               ; preds = %78
  %82 = load ptr, ptr %3, align 8
  %83 = load ptr, ptr %4, align 8
  %84 = load i32, ptr %6, align 4
  %85 = call i32 @png_handle_chunk(ptr noundef %82, ptr noundef %83, i32 noundef %84)
  br label %135

86:                                               ; preds = %78
  %87 = load i32, ptr %7, align 4
  %88 = icmp eq i32 %87, 1229278788
  br i1 %88, label %89, label %94

89:                                               ; preds = %86
  %90 = load ptr, ptr %3, align 8
  %91 = load ptr, ptr %4, align 8
  %92 = load i32, ptr %6, align 4
  %93 = call i32 @png_handle_chunk(ptr noundef %90, ptr noundef %91, i32 noundef %92)
  br label %134

94:                                               ; preds = %86
  %95 = load ptr, ptr %3, align 8
  %96 = load i32, ptr %7, align 4
  %97 = call i32 @png_chunk_unknown_handling(ptr noundef %95, i32 noundef %96)
  store i32 %97, ptr %5, align 4
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %99, label %120

99:                                               ; preds = %94
  %100 = load ptr, ptr %3, align 8
  %101 = load ptr, ptr %4, align 8
  %102 = load i32, ptr %6, align 4
  %103 = load i32, ptr %5, align 4
  %104 = call i32 @png_handle_unknown(ptr noundef %100, ptr noundef %101, i32 noundef %102, i32 noundef %103)
  %105 = load i32, ptr %7, align 4
  %106 = icmp eq i32 %105, 1347179589
  br i1 %106, label %107, label %112

107:                                              ; preds = %99
  %108 = load ptr, ptr %3, align 8
  %109 = getelementptr inbounds %struct.png_struct_def, ptr %108, i32 0, i32 15
  %110 = load i32, ptr %109, align 4
  %111 = or i32 %110, 2
  store i32 %111, ptr %109, align 4
  br label %119

112:                                              ; preds = %99
  %113 = load i32, ptr %7, align 4
  %114 = icmp eq i32 %113, 1229209940
  br i1 %114, label %115, label %118

115:                                              ; preds = %112
  %116 = load ptr, ptr %3, align 8
  %117 = getelementptr inbounds %struct.png_struct_def, ptr %116, i32 0, i32 51
  store i32 0, ptr %117, align 8
  br label %136

118:                                              ; preds = %112
  br label %119

119:                                              ; preds = %118, %107
  br label %133

120:                                              ; preds = %94
  %121 = load i32, ptr %7, align 4
  %122 = icmp eq i32 %121, 1229209940
  br i1 %122, label %123, label %127

123:                                              ; preds = %120
  %124 = load i32, ptr %6, align 4
  %125 = load ptr, ptr %3, align 8
  %126 = getelementptr inbounds %struct.png_struct_def, ptr %125, i32 0, i32 51
  store i32 %124, ptr %126, align 8
  br label %136

127:                                              ; preds = %120
  %128 = load ptr, ptr %3, align 8
  %129 = load ptr, ptr %4, align 8
  %130 = load i32, ptr %6, align 4
  %131 = call i32 @png_handle_chunk(ptr noundef %128, ptr noundef %129, i32 noundef %130)
  br label %132

132:                                              ; preds = %127
  br label %133

133:                                              ; preds = %132, %119
  br label %134

134:                                              ; preds = %133, %89
  br label %135

135:                                              ; preds = %134, %81
  br label %17

136:                                              ; preds = %13, %123, %115
  ret void
}

declare void @png_read_sig(ptr noundef, ptr noundef) #1

declare i32 @png_read_chunk_header(ptr noundef) #1

; Function Attrs: noreturn
declare void @png_chunk_error(ptr noundef, ptr noundef) #2

declare void @png_chunk_benign_error(ptr noundef, ptr noundef) #1

declare i32 @png_handle_chunk(ptr noundef, ptr noundef, i32 noundef) #1

declare i32 @png_chunk_unknown_handling(ptr noundef, i32 noundef) #1

declare i32 @png_handle_unknown(ptr noundef, ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_read_update_info(ptr noalias noundef %0, ptr noalias noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %20

7:                                                ; preds = %2
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.png_struct_def, ptr %8, i32 0, i32 16
  %10 = load i32, ptr %9, align 8
  %11 = and i32 %10, 64
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %17

13:                                               ; preds = %7
  %14 = load ptr, ptr %3, align 8
  call void @png_read_start_row(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = load ptr, ptr %4, align 8
  call void @png_read_transform_info(ptr noundef %15, ptr noundef %16)
  br label %19

17:                                               ; preds = %7
  %18 = load ptr, ptr %3, align 8
  call void @png_app_error(ptr noundef %18, ptr noundef @.str.3)
  br label %19

19:                                               ; preds = %17, %13
  br label %20

20:                                               ; preds = %19, %2
  ret void
}

declare void @png_read_start_row(ptr noundef) #1

declare void @png_read_transform_info(ptr noundef, ptr noundef) #1

declare void @png_app_error(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_start_read_image(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %16

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.png_struct_def, ptr %6, i32 0, i32 16
  %8 = load i32, ptr %7, align 8
  %9 = and i32 %8, 64
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %5
  %12 = load ptr, ptr %2, align 8
  call void @png_read_start_row(ptr noundef %12)
  br label %15

13:                                               ; preds = %5
  %14 = load ptr, ptr %2, align 8
  call void @png_app_error(ptr noundef %14, ptr noundef @.str.4)
  br label %15

15:                                               ; preds = %13, %11
  br label %16

16:                                               ; preds = %15, %1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_read_row(ptr noalias noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.png_row_info_struct, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %3
  br label %422

11:                                               ; preds = %3
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.png_struct_def, ptr %12, i32 0, i32 16
  %14 = load i32, ptr %13, align 8
  %15 = and i32 %14, 64
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

17:                                               ; preds = %11
  %18 = load ptr, ptr %4, align 8
  call void @png_read_start_row(ptr noundef %18)
  br label %19

19:                                               ; preds = %17, %11
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.png_struct_def, ptr %20, i32 0, i32 43
  %22 = load i32, ptr %21, align 8
  %23 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 0
  store i32 %22, ptr %23, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.png_struct_def, ptr %24, i32 0, i32 62
  %26 = load i8, ptr %25, align 1
  %27 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 2
  store i8 %26, ptr %27, align 8
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds %struct.png_struct_def, ptr %28, i32 0, i32 63
  %30 = load i8, ptr %29, align 8
  %31 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 3
  store i8 %30, ptr %31, align 1
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds %struct.png_struct_def, ptr %32, i32 0, i32 66
  %34 = load i8, ptr %33, align 1
  %35 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 4
  store i8 %34, ptr %35, align 2
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds %struct.png_struct_def, ptr %36, i32 0, i32 65
  %38 = load i8, ptr %37, align 2
  %39 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 5
  store i8 %38, ptr %39, align 1
  %40 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 5
  %41 = load i8, ptr %40, align 1
  %42 = zext i8 %41 to i32
  %43 = icmp sge i32 %42, 8
  br i1 %43, label %44, label %53

44:                                               ; preds = %19
  %45 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 0
  %46 = load i32, ptr %45, align 8
  %47 = zext i32 %46 to i64
  %48 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 5
  %49 = load i8, ptr %48, align 1
  %50 = zext i8 %49 to i64
  %51 = lshr i64 %50, 3
  %52 = mul i64 %47, %51
  br label %63

53:                                               ; preds = %19
  %54 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 0
  %55 = load i32, ptr %54, align 8
  %56 = zext i32 %55 to i64
  %57 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 5
  %58 = load i8, ptr %57, align 1
  %59 = zext i8 %58 to i64
  %60 = mul i64 %56, %59
  %61 = add i64 %60, 7
  %62 = lshr i64 %61, 3
  br label %63

63:                                               ; preds = %53, %44
  %64 = phi i64 [ %52, %44 ], [ %62, %53 ]
  %65 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 1
  store i64 %64, ptr %65, align 8
  %66 = load ptr, ptr %4, align 8
  %67 = getelementptr inbounds %struct.png_struct_def, ptr %66, i32 0, i32 44
  %68 = load i32, ptr %67, align 4
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %77

70:                                               ; preds = %63
  %71 = load ptr, ptr %4, align 8
  %72 = getelementptr inbounds %struct.png_struct_def, ptr %71, i32 0, i32 60
  %73 = load i8, ptr %72, align 1
  %74 = zext i8 %73 to i32
  %75 = icmp eq i32 %74, 0
  br i1 %75, label %76, label %77

76:                                               ; preds = %70
  br label %77

77:                                               ; preds = %76, %70, %63
  %78 = load ptr, ptr %4, align 8
  %79 = getelementptr inbounds %struct.png_struct_def, ptr %78, i32 0, i32 59
  %80 = load i8, ptr %79, align 4
  %81 = zext i8 %80 to i32
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %83, label %222

83:                                               ; preds = %77
  %84 = load ptr, ptr %4, align 8
  %85 = getelementptr inbounds %struct.png_struct_def, ptr %84, i32 0, i32 17
  %86 = load i32, ptr %85, align 4
  %87 = and i32 %86, 2
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %89, label %222

89:                                               ; preds = %83
  %90 = load ptr, ptr %4, align 8
  %91 = getelementptr inbounds %struct.png_struct_def, ptr %90, i32 0, i32 60
  %92 = load i8, ptr %91, align 1
  %93 = zext i8 %92 to i32
  switch i32 %93, label %211 [
    i32 0, label %94
    i32 1, label %109
    i32 2, label %129
    i32 3, label %150
    i32 4, label %170
    i32 5, label %191
    i32 6, label %212
  ]

94:                                               ; preds = %89
  %95 = load ptr, ptr %4, align 8
  %96 = getelementptr inbounds %struct.png_struct_def, ptr %95, i32 0, i32 44
  %97 = load i32, ptr %96, align 4
  %98 = and i32 %97, 7
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %108

100:                                              ; preds = %94
  %101 = load ptr, ptr %6, align 8
  %102 = icmp ne ptr %101, null
  br i1 %102, label %103, label %106

103:                                              ; preds = %100
  %104 = load ptr, ptr %4, align 8
  %105 = load ptr, ptr %6, align 8
  call void @png_combine_row(ptr noundef %104, ptr noundef %105, i32 noundef 1)
  br label %106

106:                                              ; preds = %103, %100
  %107 = load ptr, ptr %4, align 8
  call void @png_read_finish_row(ptr noundef %107)
  br label %422

108:                                              ; preds = %94
  br label %221

109:                                              ; preds = %89
  %110 = load ptr, ptr %4, align 8
  %111 = getelementptr inbounds %struct.png_struct_def, ptr %110, i32 0, i32 44
  %112 = load i32, ptr %111, align 4
  %113 = and i32 %112, 7
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %120, label %115

115:                                              ; preds = %109
  %116 = load ptr, ptr %4, align 8
  %117 = getelementptr inbounds %struct.png_struct_def, ptr %116, i32 0, i32 38
  %118 = load i32, ptr %117, align 4
  %119 = icmp ult i32 %118, 5
  br i1 %119, label %120, label %128

120:                                              ; preds = %115, %109
  %121 = load ptr, ptr %6, align 8
  %122 = icmp ne ptr %121, null
  br i1 %122, label %123, label %126

123:                                              ; preds = %120
  %124 = load ptr, ptr %4, align 8
  %125 = load ptr, ptr %6, align 8
  call void @png_combine_row(ptr noundef %124, ptr noundef %125, i32 noundef 1)
  br label %126

126:                                              ; preds = %123, %120
  %127 = load ptr, ptr %4, align 8
  call void @png_read_finish_row(ptr noundef %127)
  br label %422

128:                                              ; preds = %115
  br label %221

129:                                              ; preds = %89
  %130 = load ptr, ptr %4, align 8
  %131 = getelementptr inbounds %struct.png_struct_def, ptr %130, i32 0, i32 44
  %132 = load i32, ptr %131, align 4
  %133 = and i32 %132, 7
  %134 = icmp ne i32 %133, 4
  br i1 %134, label %135, label %149

135:                                              ; preds = %129
  %136 = load ptr, ptr %6, align 8
  %137 = icmp ne ptr %136, null
  br i1 %137, label %138, label %147

138:                                              ; preds = %135
  %139 = load ptr, ptr %4, align 8
  %140 = getelementptr inbounds %struct.png_struct_def, ptr %139, i32 0, i32 44
  %141 = load i32, ptr %140, align 4
  %142 = and i32 %141, 4
  %143 = icmp ne i32 %142, 0
  br i1 %143, label %144, label %147

144:                                              ; preds = %138
  %145 = load ptr, ptr %4, align 8
  %146 = load ptr, ptr %6, align 8
  call void @png_combine_row(ptr noundef %145, ptr noundef %146, i32 noundef 1)
  br label %147

147:                                              ; preds = %144, %138, %135
  %148 = load ptr, ptr %4, align 8
  call void @png_read_finish_row(ptr noundef %148)
  br label %422

149:                                              ; preds = %129
  br label %221

150:                                              ; preds = %89
  %151 = load ptr, ptr %4, align 8
  %152 = getelementptr inbounds %struct.png_struct_def, ptr %151, i32 0, i32 44
  %153 = load i32, ptr %152, align 4
  %154 = and i32 %153, 3
  %155 = icmp ne i32 %154, 0
  br i1 %155, label %161, label %156

156:                                              ; preds = %150
  %157 = load ptr, ptr %4, align 8
  %158 = getelementptr inbounds %struct.png_struct_def, ptr %157, i32 0, i32 38
  %159 = load i32, ptr %158, align 4
  %160 = icmp ult i32 %159, 3
  br i1 %160, label %161, label %169

161:                                              ; preds = %156, %150
  %162 = load ptr, ptr %6, align 8
  %163 = icmp ne ptr %162, null
  br i1 %163, label %164, label %167

164:                                              ; preds = %161
  %165 = load ptr, ptr %4, align 8
  %166 = load ptr, ptr %6, align 8
  call void @png_combine_row(ptr noundef %165, ptr noundef %166, i32 noundef 1)
  br label %167

167:                                              ; preds = %164, %161
  %168 = load ptr, ptr %4, align 8
  call void @png_read_finish_row(ptr noundef %168)
  br label %422

169:                                              ; preds = %156
  br label %221

170:                                              ; preds = %89
  %171 = load ptr, ptr %4, align 8
  %172 = getelementptr inbounds %struct.png_struct_def, ptr %171, i32 0, i32 44
  %173 = load i32, ptr %172, align 4
  %174 = and i32 %173, 3
  %175 = icmp ne i32 %174, 2
  br i1 %175, label %176, label %190

176:                                              ; preds = %170
  %177 = load ptr, ptr %6, align 8
  %178 = icmp ne ptr %177, null
  br i1 %178, label %179, label %188

179:                                              ; preds = %176
  %180 = load ptr, ptr %4, align 8
  %181 = getelementptr inbounds %struct.png_struct_def, ptr %180, i32 0, i32 44
  %182 = load i32, ptr %181, align 4
  %183 = and i32 %182, 2
  %184 = icmp ne i32 %183, 0
  br i1 %184, label %185, label %188

185:                                              ; preds = %179
  %186 = load ptr, ptr %4, align 8
  %187 = load ptr, ptr %6, align 8
  call void @png_combine_row(ptr noundef %186, ptr noundef %187, i32 noundef 1)
  br label %188

188:                                              ; preds = %185, %179, %176
  %189 = load ptr, ptr %4, align 8
  call void @png_read_finish_row(ptr noundef %189)
  br label %422

190:                                              ; preds = %170
  br label %221

191:                                              ; preds = %89
  %192 = load ptr, ptr %4, align 8
  %193 = getelementptr inbounds %struct.png_struct_def, ptr %192, i32 0, i32 44
  %194 = load i32, ptr %193, align 4
  %195 = and i32 %194, 1
  %196 = icmp ne i32 %195, 0
  br i1 %196, label %202, label %197

197:                                              ; preds = %191
  %198 = load ptr, ptr %4, align 8
  %199 = getelementptr inbounds %struct.png_struct_def, ptr %198, i32 0, i32 38
  %200 = load i32, ptr %199, align 4
  %201 = icmp ult i32 %200, 2
  br i1 %201, label %202, label %210

202:                                              ; preds = %197, %191
  %203 = load ptr, ptr %6, align 8
  %204 = icmp ne ptr %203, null
  br i1 %204, label %205, label %208

205:                                              ; preds = %202
  %206 = load ptr, ptr %4, align 8
  %207 = load ptr, ptr %6, align 8
  call void @png_combine_row(ptr noundef %206, ptr noundef %207, i32 noundef 1)
  br label %208

208:                                              ; preds = %205, %202
  %209 = load ptr, ptr %4, align 8
  call void @png_read_finish_row(ptr noundef %209)
  br label %422

210:                                              ; preds = %197
  br label %221

211:                                              ; preds = %89
  br label %212

212:                                              ; preds = %89, %211
  %213 = load ptr, ptr %4, align 8
  %214 = getelementptr inbounds %struct.png_struct_def, ptr %213, i32 0, i32 44
  %215 = load i32, ptr %214, align 4
  %216 = and i32 %215, 1
  %217 = icmp eq i32 %216, 0
  br i1 %217, label %218, label %220

218:                                              ; preds = %212
  %219 = load ptr, ptr %4, align 8
  call void @png_read_finish_row(ptr noundef %219)
  br label %422

220:                                              ; preds = %212
  br label %221

221:                                              ; preds = %220, %210, %190, %169, %149, %128, %108
  br label %222

222:                                              ; preds = %221, %83, %77
  %223 = load ptr, ptr %4, align 8
  %224 = getelementptr inbounds %struct.png_struct_def, ptr %223, i32 0, i32 15
  %225 = load i32, ptr %224, align 4
  %226 = and i32 %225, 4
  %227 = icmp eq i32 %226, 0
  br i1 %227, label %228, label %230

228:                                              ; preds = %222
  %229 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %229, ptr noundef @.str.5) #8
  unreachable

230:                                              ; preds = %222
  %231 = load ptr, ptr %4, align 8
  %232 = getelementptr inbounds %struct.png_struct_def, ptr %231, i32 0, i32 47
  %233 = load ptr, ptr %232, align 8
  %234 = getelementptr inbounds i8, ptr %233, i64 0
  store i8 -1, ptr %234, align 1
  %235 = load ptr, ptr %4, align 8
  %236 = load ptr, ptr %4, align 8
  %237 = getelementptr inbounds %struct.png_struct_def, ptr %236, i32 0, i32 47
  %238 = load ptr, ptr %237, align 8
  %239 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 1
  %240 = load i64, ptr %239, align 8
  %241 = add i64 %240, 1
  call void @png_read_IDAT_data(ptr noundef %235, ptr noundef %238, i64 noundef %241)
  %242 = load ptr, ptr %4, align 8
  %243 = getelementptr inbounds %struct.png_struct_def, ptr %242, i32 0, i32 47
  %244 = load ptr, ptr %243, align 8
  %245 = getelementptr inbounds i8, ptr %244, i64 0
  %246 = load i8, ptr %245, align 1
  %247 = zext i8 %246 to i32
  %248 = icmp sgt i32 %247, 0
  br i1 %248, label %249, label %276

249:                                              ; preds = %230
  %250 = load ptr, ptr %4, align 8
  %251 = getelementptr inbounds %struct.png_struct_def, ptr %250, i32 0, i32 47
  %252 = load ptr, ptr %251, align 8
  %253 = getelementptr inbounds i8, ptr %252, i64 0
  %254 = load i8, ptr %253, align 1
  %255 = zext i8 %254 to i32
  %256 = icmp slt i32 %255, 5
  br i1 %256, label %257, label %273

257:                                              ; preds = %249
  %258 = load ptr, ptr %4, align 8
  %259 = load ptr, ptr %4, align 8
  %260 = getelementptr inbounds %struct.png_struct_def, ptr %259, i32 0, i32 47
  %261 = load ptr, ptr %260, align 8
  %262 = getelementptr inbounds i8, ptr %261, i64 1
  %263 = load ptr, ptr %4, align 8
  %264 = getelementptr inbounds %struct.png_struct_def, ptr %263, i32 0, i32 46
  %265 = load ptr, ptr %264, align 8
  %266 = getelementptr inbounds i8, ptr %265, i64 1
  %267 = load ptr, ptr %4, align 8
  %268 = getelementptr inbounds %struct.png_struct_def, ptr %267, i32 0, i32 47
  %269 = load ptr, ptr %268, align 8
  %270 = getelementptr inbounds i8, ptr %269, i64 0
  %271 = load i8, ptr %270, align 1
  %272 = zext i8 %271 to i32
  call void @png_read_filter_row(ptr noundef %258, ptr noundef %7, ptr noundef %262, ptr noundef %266, i32 noundef %272)
  br label %275

273:                                              ; preds = %249
  %274 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %274, ptr noundef @.str.6) #8
  unreachable

275:                                              ; preds = %257
  br label %276

276:                                              ; preds = %275, %230
  %277 = load ptr, ptr %4, align 8
  %278 = getelementptr inbounds %struct.png_struct_def, ptr %277, i32 0, i32 46
  %279 = load ptr, ptr %278, align 8
  %280 = load ptr, ptr %4, align 8
  %281 = getelementptr inbounds %struct.png_struct_def, ptr %280, i32 0, i32 47
  %282 = load ptr, ptr %281, align 8
  %283 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 1
  %284 = load i64, ptr %283, align 8
  %285 = add i64 %284, 1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %279, ptr align 1 %282, i64 %285, i1 false)
  %286 = load ptr, ptr %4, align 8
  %287 = getelementptr inbounds %struct.png_struct_def, ptr %286, i32 0, i32 128
  %288 = load i32, ptr %287, align 8
  %289 = and i32 %288, 4
  %290 = icmp ne i32 %289, 0
  br i1 %290, label %291, label %302

291:                                              ; preds = %276
  %292 = load ptr, ptr %4, align 8
  %293 = getelementptr inbounds %struct.png_struct_def, ptr %292, i32 0, i32 129
  %294 = load i8, ptr %293, align 4
  %295 = zext i8 %294 to i32
  %296 = icmp eq i32 %295, 64
  br i1 %296, label %297, label %302

297:                                              ; preds = %291
  %298 = load ptr, ptr %4, align 8
  %299 = getelementptr inbounds %struct.png_struct_def, ptr %298, i32 0, i32 47
  %300 = load ptr, ptr %299, align 8
  %301 = getelementptr inbounds i8, ptr %300, i64 1
  call void @png_do_read_intrapixel(ptr noundef %7, ptr noundef %301)
  br label %302

302:                                              ; preds = %297, %291, %276
  %303 = load ptr, ptr %4, align 8
  %304 = getelementptr inbounds %struct.png_struct_def, ptr %303, i32 0, i32 17
  %305 = load i32, ptr %304, align 4
  %306 = icmp ne i32 %305, 0
  br i1 %306, label %312, label %307

307:                                              ; preds = %302
  %308 = load ptr, ptr %4, align 8
  %309 = getelementptr inbounds %struct.png_struct_def, ptr %308, i32 0, i32 55
  %310 = load i32, ptr %309, align 4
  %311 = icmp sge i32 %310, 0
  br i1 %311, label %312, label %314

312:                                              ; preds = %307, %302
  %313 = load ptr, ptr %4, align 8
  call void @png_do_read_transformations(ptr noundef %313, ptr noundef %7)
  br label %314

314:                                              ; preds = %312, %307
  %315 = load ptr, ptr %4, align 8
  %316 = getelementptr inbounds %struct.png_struct_def, ptr %315, i32 0, i32 70
  %317 = load i8, ptr %316, align 1
  %318 = zext i8 %317 to i32
  %319 = icmp eq i32 %318, 0
  br i1 %319, label %320, label %336

320:                                              ; preds = %314
  %321 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 5
  %322 = load i8, ptr %321, align 1
  %323 = load ptr, ptr %4, align 8
  %324 = getelementptr inbounds %struct.png_struct_def, ptr %323, i32 0, i32 70
  store i8 %322, ptr %324, align 1
  %325 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 5
  %326 = load i8, ptr %325, align 1
  %327 = zext i8 %326 to i32
  %328 = load ptr, ptr %4, align 8
  %329 = getelementptr inbounds %struct.png_struct_def, ptr %328, i32 0, i32 69
  %330 = load i8, ptr %329, align 2
  %331 = zext i8 %330 to i32
  %332 = icmp sgt i32 %327, %331
  br i1 %332, label %333, label %335

333:                                              ; preds = %320
  %334 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %334, ptr noundef @.str.7) #8
  unreachable

335:                                              ; preds = %320
  br label %348

336:                                              ; preds = %314
  %337 = load ptr, ptr %4, align 8
  %338 = getelementptr inbounds %struct.png_struct_def, ptr %337, i32 0, i32 70
  %339 = load i8, ptr %338, align 1
  %340 = zext i8 %339 to i32
  %341 = getelementptr inbounds %struct.png_row_info_struct, ptr %7, i32 0, i32 5
  %342 = load i8, ptr %341, align 1
  %343 = zext i8 %342 to i32
  %344 = icmp ne i32 %340, %343
  br i1 %344, label %345, label %347

345:                                              ; preds = %336
  %346 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %346, ptr noundef @.str.8) #8
  unreachable

347:                                              ; preds = %336
  br label %348

348:                                              ; preds = %347, %335
  %349 = load ptr, ptr %4, align 8
  %350 = getelementptr inbounds %struct.png_struct_def, ptr %349, i32 0, i32 59
  %351 = load i8, ptr %350, align 4
  %352 = zext i8 %351 to i32
  %353 = icmp ne i32 %352, 0
  br i1 %353, label %354, label %391

354:                                              ; preds = %348
  %355 = load ptr, ptr %4, align 8
  %356 = getelementptr inbounds %struct.png_struct_def, ptr %355, i32 0, i32 17
  %357 = load i32, ptr %356, align 4
  %358 = and i32 %357, 2
  %359 = icmp ne i32 %358, 0
  br i1 %359, label %360, label %391

360:                                              ; preds = %354
  %361 = load ptr, ptr %4, align 8
  %362 = getelementptr inbounds %struct.png_struct_def, ptr %361, i32 0, i32 60
  %363 = load i8, ptr %362, align 1
  %364 = zext i8 %363 to i32
  %365 = icmp slt i32 %364, 6
  br i1 %365, label %366, label %378

366:                                              ; preds = %360
  %367 = load ptr, ptr %4, align 8
  %368 = getelementptr inbounds %struct.png_struct_def, ptr %367, i32 0, i32 47
  %369 = load ptr, ptr %368, align 8
  %370 = getelementptr inbounds i8, ptr %369, i64 1
  %371 = load ptr, ptr %4, align 8
  %372 = getelementptr inbounds %struct.png_struct_def, ptr %371, i32 0, i32 60
  %373 = load i8, ptr %372, align 1
  %374 = zext i8 %373 to i32
  %375 = load ptr, ptr %4, align 8
  %376 = getelementptr inbounds %struct.png_struct_def, ptr %375, i32 0, i32 17
  %377 = load i32, ptr %376, align 4
  call void @png_do_read_interlace(ptr noundef %7, ptr noundef %370, i32 noundef %374, i32 noundef %377)
  br label %378

378:                                              ; preds = %366, %360
  %379 = load ptr, ptr %6, align 8
  %380 = icmp ne ptr %379, null
  br i1 %380, label %381, label %384

381:                                              ; preds = %378
  %382 = load ptr, ptr %4, align 8
  %383 = load ptr, ptr %6, align 8
  call void @png_combine_row(ptr noundef %382, ptr noundef %383, i32 noundef 1)
  br label %384

384:                                              ; preds = %381, %378
  %385 = load ptr, ptr %5, align 8
  %386 = icmp ne ptr %385, null
  br i1 %386, label %387, label %390

387:                                              ; preds = %384
  %388 = load ptr, ptr %4, align 8
  %389 = load ptr, ptr %5, align 8
  call void @png_combine_row(ptr noundef %388, ptr noundef %389, i32 noundef 0)
  br label %390

390:                                              ; preds = %387, %384
  br label %404

391:                                              ; preds = %354, %348
  %392 = load ptr, ptr %5, align 8
  %393 = icmp ne ptr %392, null
  br i1 %393, label %394, label %397

394:                                              ; preds = %391
  %395 = load ptr, ptr %4, align 8
  %396 = load ptr, ptr %5, align 8
  call void @png_combine_row(ptr noundef %395, ptr noundef %396, i32 noundef -1)
  br label %397

397:                                              ; preds = %394, %391
  %398 = load ptr, ptr %6, align 8
  %399 = icmp ne ptr %398, null
  br i1 %399, label %400, label %403

400:                                              ; preds = %397
  %401 = load ptr, ptr %4, align 8
  %402 = load ptr, ptr %6, align 8
  call void @png_combine_row(ptr noundef %401, ptr noundef %402, i32 noundef -1)
  br label %403

403:                                              ; preds = %400, %397
  br label %404

404:                                              ; preds = %403, %390
  %405 = load ptr, ptr %4, align 8
  call void @png_read_finish_row(ptr noundef %405)
  %406 = load ptr, ptr %4, align 8
  %407 = getelementptr inbounds %struct.png_struct_def, ptr %406, i32 0, i32 96
  %408 = load ptr, ptr %407, align 8
  %409 = icmp ne ptr %408, null
  br i1 %409, label %410, label %422

410:                                              ; preds = %404
  %411 = load ptr, ptr %4, align 8
  %412 = getelementptr inbounds %struct.png_struct_def, ptr %411, i32 0, i32 96
  %413 = load ptr, ptr %412, align 8
  %414 = load ptr, ptr %4, align 8
  %415 = load ptr, ptr %4, align 8
  %416 = getelementptr inbounds %struct.png_struct_def, ptr %415, i32 0, i32 44
  %417 = load i32, ptr %416, align 4
  %418 = load ptr, ptr %4, align 8
  %419 = getelementptr inbounds %struct.png_struct_def, ptr %418, i32 0, i32 60
  %420 = load i8, ptr %419, align 1
  %421 = zext i8 %420 to i32
  call void %413(ptr noundef %414, i32 noundef %417, i32 noundef %421)
  br label %422

422:                                              ; preds = %10, %106, %126, %147, %167, %188, %208, %218, %410, %404
  ret void
}

declare void @png_combine_row(ptr noundef, ptr noundef, i32 noundef) #1

declare void @png_read_finish_row(ptr noundef) #1

; Function Attrs: noreturn
declare void @png_error(ptr noundef, ptr noundef) #2

declare void @png_read_IDAT_data(ptr noundef, ptr noundef, i64 noundef) #1

declare void @png_read_filter_row(ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_do_read_intrapixel(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.png_row_info_struct, ptr %16, i32 0, i32 2
  %18 = load i8, ptr %17, align 8
  %19 = zext i8 %18 to i32
  %20 = and i32 %19, 2
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %187

22:                                               ; preds = %2
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.png_row_info_struct, ptr %23, i32 0, i32 0
  %25 = load i32, ptr %24, align 8
  store i32 %25, ptr %6, align 4
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds %struct.png_row_info_struct, ptr %26, i32 0, i32 3
  %28 = load i8, ptr %27, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp eq i32 %29, 8
  br i1 %30, label %31, label %88

31:                                               ; preds = %22
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds %struct.png_row_info_struct, ptr %32, i32 0, i32 2
  %34 = load i8, ptr %33, align 8
  %35 = zext i8 %34 to i32
  %36 = icmp eq i32 %35, 2
  br i1 %36, label %37, label %38

37:                                               ; preds = %31
  store i32 3, ptr %5, align 4
  br label %47

38:                                               ; preds = %31
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.png_row_info_struct, ptr %39, i32 0, i32 2
  %41 = load i8, ptr %40, align 8
  %42 = zext i8 %41 to i32
  %43 = icmp eq i32 %42, 6
  br i1 %43, label %44, label %45

44:                                               ; preds = %38
  store i32 4, ptr %5, align 4
  br label %46

45:                                               ; preds = %38
  br label %187

46:                                               ; preds = %44
  br label %47

47:                                               ; preds = %46, %37
  store i32 0, ptr %8, align 4
  %48 = load ptr, ptr %4, align 8
  store ptr %48, ptr %7, align 8
  br label %49

49:                                               ; preds = %80, %47
  %50 = load i32, ptr %8, align 4
  %51 = load i32, ptr %6, align 4
  %52 = icmp ult i32 %50, %51
  br i1 %52, label %53, label %87

53:                                               ; preds = %49
  %54 = load ptr, ptr %7, align 8
  %55 = load i8, ptr %54, align 1
  %56 = zext i8 %55 to i32
  %57 = add nsw i32 256, %56
  %58 = load ptr, ptr %7, align 8
  %59 = getelementptr inbounds i8, ptr %58, i64 1
  %60 = load i8, ptr %59, align 1
  %61 = zext i8 %60 to i32
  %62 = add nsw i32 %57, %61
  %63 = and i32 %62, 255
  %64 = trunc i32 %63 to i8
  %65 = load ptr, ptr %7, align 8
  store i8 %64, ptr %65, align 1
  %66 = load ptr, ptr %7, align 8
  %67 = getelementptr inbounds i8, ptr %66, i64 2
  %68 = load i8, ptr %67, align 1
  %69 = zext i8 %68 to i32
  %70 = add nsw i32 256, %69
  %71 = load ptr, ptr %7, align 8
  %72 = getelementptr inbounds i8, ptr %71, i64 1
  %73 = load i8, ptr %72, align 1
  %74 = zext i8 %73 to i32
  %75 = add nsw i32 %70, %74
  %76 = and i32 %75, 255
  %77 = trunc i32 %76 to i8
  %78 = load ptr, ptr %7, align 8
  %79 = getelementptr inbounds i8, ptr %78, i64 2
  store i8 %77, ptr %79, align 1
  br label %80

80:                                               ; preds = %53
  %81 = load i32, ptr %8, align 4
  %82 = add i32 %81, 1
  store i32 %82, ptr %8, align 4
  %83 = load i32, ptr %5, align 4
  %84 = load ptr, ptr %7, align 8
  %85 = sext i32 %83 to i64
  %86 = getelementptr inbounds i8, ptr %84, i64 %85
  store ptr %86, ptr %7, align 8
  br label %49, !llvm.loop !5

87:                                               ; preds = %49
  br label %186

88:                                               ; preds = %22
  %89 = load ptr, ptr %3, align 8
  %90 = getelementptr inbounds %struct.png_row_info_struct, ptr %89, i32 0, i32 3
  %91 = load i8, ptr %90, align 1
  %92 = zext i8 %91 to i32
  %93 = icmp eq i32 %92, 16
  br i1 %93, label %94, label %185

94:                                               ; preds = %88
  %95 = load ptr, ptr %3, align 8
  %96 = getelementptr inbounds %struct.png_row_info_struct, ptr %95, i32 0, i32 2
  %97 = load i8, ptr %96, align 8
  %98 = zext i8 %97 to i32
  %99 = icmp eq i32 %98, 2
  br i1 %99, label %100, label %101

100:                                              ; preds = %94
  store i32 6, ptr %5, align 4
  br label %110

101:                                              ; preds = %94
  %102 = load ptr, ptr %3, align 8
  %103 = getelementptr inbounds %struct.png_row_info_struct, ptr %102, i32 0, i32 2
  %104 = load i8, ptr %103, align 8
  %105 = zext i8 %104 to i32
  %106 = icmp eq i32 %105, 6
  br i1 %106, label %107, label %108

107:                                              ; preds = %101
  store i32 8, ptr %5, align 4
  br label %109

108:                                              ; preds = %101
  br label %187

109:                                              ; preds = %107
  br label %110

110:                                              ; preds = %109, %100
  store i32 0, ptr %10, align 4
  %111 = load ptr, ptr %4, align 8
  store ptr %111, ptr %9, align 8
  br label %112

112:                                              ; preds = %177, %110
  %113 = load i32, ptr %10, align 4
  %114 = load i32, ptr %6, align 4
  %115 = icmp ult i32 %113, %114
  br i1 %115, label %116, label %184

116:                                              ; preds = %112
  %117 = load ptr, ptr %9, align 8
  %118 = load i8, ptr %117, align 1
  %119 = zext i8 %118 to i32
  %120 = shl i32 %119, 8
  %121 = load ptr, ptr %9, align 8
  %122 = getelementptr inbounds i8, ptr %121, i64 1
  %123 = load i8, ptr %122, align 1
  %124 = zext i8 %123 to i32
  %125 = or i32 %120, %124
  store i32 %125, ptr %11, align 4
  %126 = load ptr, ptr %9, align 8
  %127 = getelementptr inbounds i8, ptr %126, i64 2
  %128 = load i8, ptr %127, align 1
  %129 = zext i8 %128 to i32
  %130 = shl i32 %129, 8
  %131 = load ptr, ptr %9, align 8
  %132 = getelementptr inbounds i8, ptr %131, i64 3
  %133 = load i8, ptr %132, align 1
  %134 = zext i8 %133 to i32
  %135 = or i32 %130, %134
  store i32 %135, ptr %12, align 4
  %136 = load ptr, ptr %9, align 8
  %137 = getelementptr inbounds i8, ptr %136, i64 4
  %138 = load i8, ptr %137, align 1
  %139 = zext i8 %138 to i32
  %140 = shl i32 %139, 8
  %141 = load ptr, ptr %9, align 8
  %142 = getelementptr inbounds i8, ptr %141, i64 5
  %143 = load i8, ptr %142, align 1
  %144 = zext i8 %143 to i32
  %145 = or i32 %140, %144
  store i32 %145, ptr %13, align 4
  %146 = load i32, ptr %11, align 4
  %147 = load i32, ptr %12, align 4
  %148 = add i32 %146, %147
  %149 = add i32 %148, 65536
  %150 = and i32 %149, 65535
  store i32 %150, ptr %14, align 4
  %151 = load i32, ptr %13, align 4
  %152 = load i32, ptr %12, align 4
  %153 = add i32 %151, %152
  %154 = add i32 %153, 65536
  %155 = and i32 %154, 65535
  store i32 %155, ptr %15, align 4
  %156 = load i32, ptr %14, align 4
  %157 = lshr i32 %156, 8
  %158 = and i32 %157, 255
  %159 = trunc i32 %158 to i8
  %160 = load ptr, ptr %9, align 8
  store i8 %159, ptr %160, align 1
  %161 = load i32, ptr %14, align 4
  %162 = and i32 %161, 255
  %163 = trunc i32 %162 to i8
  %164 = load ptr, ptr %9, align 8
  %165 = getelementptr inbounds i8, ptr %164, i64 1
  store i8 %163, ptr %165, align 1
  %166 = load i32, ptr %15, align 4
  %167 = lshr i32 %166, 8
  %168 = and i32 %167, 255
  %169 = trunc i32 %168 to i8
  %170 = load ptr, ptr %9, align 8
  %171 = getelementptr inbounds i8, ptr %170, i64 4
  store i8 %169, ptr %171, align 1
  %172 = load i32, ptr %15, align 4
  %173 = and i32 %172, 255
  %174 = trunc i32 %173 to i8
  %175 = load ptr, ptr %9, align 8
  %176 = getelementptr inbounds i8, ptr %175, i64 5
  store i8 %174, ptr %176, align 1
  br label %177

177:                                              ; preds = %116
  %178 = load i32, ptr %10, align 4
  %179 = add i32 %178, 1
  store i32 %179, ptr %10, align 4
  %180 = load i32, ptr %5, align 4
  %181 = load ptr, ptr %9, align 8
  %182 = sext i32 %180 to i64
  %183 = getelementptr inbounds i8, ptr %181, i64 %182
  store ptr %183, ptr %9, align 8
  br label %112, !llvm.loop !7

184:                                              ; preds = %112
  br label %185

185:                                              ; preds = %184, %88
  br label %186

186:                                              ; preds = %185, %87
  br label %187

187:                                              ; preds = %45, %108, %186, %2
  ret void
}

declare void @png_do_read_transformations(ptr noundef, ptr noundef) #1

declare void @png_do_read_interlace(ptr noundef, ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_read_rows(ptr noalias noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  %16 = load ptr, ptr %5, align 8
  %17 = icmp eq ptr %16, null
  br i1 %17, label %18, label %19

18:                                               ; preds = %4
  br label %86

19:                                               ; preds = %4
  %20 = load ptr, ptr %6, align 8
  store ptr %20, ptr %10, align 8
  %21 = load ptr, ptr %7, align 8
  store ptr %21, ptr %11, align 8
  %22 = load ptr, ptr %10, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %46

24:                                               ; preds = %19
  %25 = load ptr, ptr %11, align 8
  %26 = icmp ne ptr %25, null
  br i1 %26, label %27, label %46

27:                                               ; preds = %24
  store i32 0, ptr %9, align 4
  br label %28

28:                                               ; preds = %42, %27
  %29 = load i32, ptr %9, align 4
  %30 = load i32, ptr %8, align 4
  %31 = icmp ult i32 %29, %30
  br i1 %31, label %32, label %45

32:                                               ; preds = %28
  %33 = load ptr, ptr %10, align 8
  %34 = getelementptr inbounds ptr, ptr %33, i32 1
  store ptr %34, ptr %10, align 8
  %35 = load ptr, ptr %33, align 8
  store ptr %35, ptr %12, align 8
  %36 = load ptr, ptr %11, align 8
  %37 = getelementptr inbounds ptr, ptr %36, i32 1
  store ptr %37, ptr %11, align 8
  %38 = load ptr, ptr %36, align 8
  store ptr %38, ptr %13, align 8
  %39 = load ptr, ptr %5, align 8
  %40 = load ptr, ptr %12, align 8
  %41 = load ptr, ptr %13, align 8
  call void @png_read_row(ptr noundef %39, ptr noundef %40, ptr noundef %41)
  br label %42

42:                                               ; preds = %32
  %43 = load i32, ptr %9, align 4
  %44 = add i32 %43, 1
  store i32 %44, ptr %9, align 4
  br label %28, !llvm.loop !8

45:                                               ; preds = %28
  br label %86

46:                                               ; preds = %24, %19
  %47 = load ptr, ptr %10, align 8
  %48 = icmp ne ptr %47, null
  br i1 %48, label %49, label %65

49:                                               ; preds = %46
  store i32 0, ptr %9, align 4
  br label %50

50:                                               ; preds = %61, %49
  %51 = load i32, ptr %9, align 4
  %52 = load i32, ptr %8, align 4
  %53 = icmp ult i32 %51, %52
  br i1 %53, label %54, label %64

54:                                               ; preds = %50
  %55 = load ptr, ptr %10, align 8
  %56 = load ptr, ptr %55, align 8
  store ptr %56, ptr %14, align 8
  %57 = load ptr, ptr %5, align 8
  %58 = load ptr, ptr %14, align 8
  call void @png_read_row(ptr noundef %57, ptr noundef %58, ptr noundef null)
  %59 = load ptr, ptr %10, align 8
  %60 = getelementptr inbounds ptr, ptr %59, i32 1
  store ptr %60, ptr %10, align 8
  br label %61

61:                                               ; preds = %54
  %62 = load i32, ptr %9, align 4
  %63 = add i32 %62, 1
  store i32 %63, ptr %9, align 4
  br label %50, !llvm.loop !9

64:                                               ; preds = %50
  br label %85

65:                                               ; preds = %46
  %66 = load ptr, ptr %11, align 8
  %67 = icmp ne ptr %66, null
  br i1 %67, label %68, label %84

68:                                               ; preds = %65
  store i32 0, ptr %9, align 4
  br label %69

69:                                               ; preds = %80, %68
  %70 = load i32, ptr %9, align 4
  %71 = load i32, ptr %8, align 4
  %72 = icmp ult i32 %70, %71
  br i1 %72, label %73, label %83

73:                                               ; preds = %69
  %74 = load ptr, ptr %11, align 8
  %75 = load ptr, ptr %74, align 8
  store ptr %75, ptr %15, align 8
  %76 = load ptr, ptr %5, align 8
  %77 = load ptr, ptr %15, align 8
  call void @png_read_row(ptr noundef %76, ptr noundef null, ptr noundef %77)
  %78 = load ptr, ptr %11, align 8
  %79 = getelementptr inbounds ptr, ptr %78, i32 1
  store ptr %79, ptr %11, align 8
  br label %80

80:                                               ; preds = %73
  %81 = load i32, ptr %9, align 4
  %82 = add i32 %81, 1
  store i32 %82, ptr %9, align 4
  br label %69, !llvm.loop !10

83:                                               ; preds = %69
  br label %84

84:                                               ; preds = %83, %65
  br label %85

85:                                               ; preds = %84, %64
  br label %86

86:                                               ; preds = %18, %85, %45
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_read_image(ptr noalias noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %12, label %13

12:                                               ; preds = %2
  br label %72

13:                                               ; preds = %2
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.png_struct_def, ptr %14, i32 0, i32 16
  %16 = load i32, ptr %15, align 8
  %17 = and i32 %16, 64
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %23

19:                                               ; preds = %13
  %20 = load ptr, ptr %3, align 8
  %21 = call i32 @png_set_interlace_handling(ptr noundef %20)
  store i32 %21, ptr %7, align 4
  %22 = load ptr, ptr %3, align 8
  call void @png_start_read_image(ptr noundef %22)
  br label %45

23:                                               ; preds = %13
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.png_struct_def, ptr %24, i32 0, i32 59
  %26 = load i8, ptr %25, align 4
  %27 = zext i8 %26 to i32
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %42

29:                                               ; preds = %23
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds %struct.png_struct_def, ptr %30, i32 0, i32 17
  %32 = load i32, ptr %31, align 4
  %33 = and i32 %32, 2
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %42

35:                                               ; preds = %29
  %36 = load ptr, ptr %3, align 8
  call void @png_warning(ptr noundef %36, ptr noundef @.str.9)
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds %struct.png_struct_def, ptr %37, i32 0, i32 39
  %39 = load i32, ptr %38, align 8
  %40 = load ptr, ptr %3, align 8
  %41 = getelementptr inbounds %struct.png_struct_def, ptr %40, i32 0, i32 40
  store i32 %39, ptr %41, align 4
  br label %42

42:                                               ; preds = %35, %29, %23
  %43 = load ptr, ptr %3, align 8
  %44 = call i32 @png_set_interlace_handling(ptr noundef %43)
  store i32 %44, ptr %7, align 4
  br label %45

45:                                               ; preds = %42, %19
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds %struct.png_struct_def, ptr %46, i32 0, i32 39
  %48 = load i32, ptr %47, align 8
  store i32 %48, ptr %6, align 4
  store i32 0, ptr %8, align 4
  br label %49

49:                                               ; preds = %69, %45
  %50 = load i32, ptr %8, align 4
  %51 = load i32, ptr %7, align 4
  %52 = icmp slt i32 %50, %51
  br i1 %52, label %53, label %72

53:                                               ; preds = %49
  %54 = load ptr, ptr %4, align 8
  store ptr %54, ptr %9, align 8
  store i32 0, ptr %5, align 4
  br label %55

55:                                               ; preds = %65, %53
  %56 = load i32, ptr %5, align 4
  %57 = load i32, ptr %6, align 4
  %58 = icmp ult i32 %56, %57
  br i1 %58, label %59, label %68

59:                                               ; preds = %55
  %60 = load ptr, ptr %3, align 8
  %61 = load ptr, ptr %9, align 8
  %62 = load ptr, ptr %61, align 8
  call void @png_read_row(ptr noundef %60, ptr noundef %62, ptr noundef null)
  %63 = load ptr, ptr %9, align 8
  %64 = getelementptr inbounds ptr, ptr %63, i32 1
  store ptr %64, ptr %9, align 8
  br label %65

65:                                               ; preds = %59
  %66 = load i32, ptr %5, align 4
  %67 = add i32 %66, 1
  store i32 %67, ptr %5, align 4
  br label %55, !llvm.loop !11

68:                                               ; preds = %55
  br label %69

69:                                               ; preds = %68
  %70 = load i32, ptr %8, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %8, align 4
  br label %49, !llvm.loop !12

72:                                               ; preds = %12, %49
  ret void
}

declare i32 @png_set_interlace_handling(ptr noundef) #1

declare void @png_warning(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_read_end(ptr noalias noundef %0, ptr noalias noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  br label %151

11:                                               ; preds = %2
  %12 = load ptr, ptr %3, align 8
  %13 = call i32 @png_chunk_unknown_handling(ptr noundef %12, i32 noundef 1229209940)
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %11
  %16 = load ptr, ptr %3, align 8
  call void @png_read_finish_IDAT(ptr noundef %16)
  br label %17

17:                                               ; preds = %15, %11
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.png_struct_def, ptr %18, i32 0, i32 62
  %20 = load i8, ptr %19, align 1
  %21 = zext i8 %20 to i32
  %22 = icmp eq i32 %21, 3
  br i1 %22, label %23, label %34

23:                                               ; preds = %17
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.png_struct_def, ptr %24, i32 0, i32 55
  %26 = load i32, ptr %25, align 4
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds %struct.png_struct_def, ptr %27, i32 0, i32 54
  %29 = load i16, ptr %28, align 8
  %30 = zext i16 %29 to i32
  %31 = icmp sge i32 %26, %30
  br i1 %31, label %32, label %34

32:                                               ; preds = %23
  %33 = load ptr, ptr %3, align 8
  call void @png_benign_error(ptr noundef %33, ptr noundef @.str.10)
  br label %34

34:                                               ; preds = %32, %23, %17
  br label %35

35:                                               ; preds = %145, %34
  %36 = load ptr, ptr %3, align 8
  %37 = call i32 @png_read_chunk_header(ptr noundef %36)
  store i32 %37, ptr %6, align 4
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds %struct.png_struct_def, ptr %38, i32 0, i32 45
  %40 = load i32, ptr %39, align 8
  store i32 %40, ptr %7, align 4
  %41 = load i32, ptr %7, align 4
  %42 = icmp ne i32 %41, 1229209940
  br i1 %42, label %43, label %48

43:                                               ; preds = %35
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds %struct.png_struct_def, ptr %44, i32 0, i32 15
  %46 = load i32, ptr %45, align 4
  %47 = or i32 %46, 8192
  store i32 %47, ptr %45, align 4
  br label %48

48:                                               ; preds = %43, %35
  %49 = load i32, ptr %7, align 4
  %50 = icmp eq i32 %49, 1229278788
  br i1 %50, label %51, label %56

51:                                               ; preds = %48
  %52 = load ptr, ptr %3, align 8
  %53 = load ptr, ptr %4, align 8
  %54 = load i32, ptr %6, align 4
  %55 = call i32 @png_handle_chunk(ptr noundef %52, ptr noundef %53, i32 noundef %54)
  br label %144

56:                                               ; preds = %48
  %57 = load i32, ptr %7, align 4
  %58 = icmp eq i32 %57, 1229472850
  br i1 %58, label %59, label %64

59:                                               ; preds = %56
  %60 = load ptr, ptr %3, align 8
  %61 = load ptr, ptr %4, align 8
  %62 = load i32, ptr %6, align 4
  %63 = call i32 @png_handle_chunk(ptr noundef %60, ptr noundef %61, i32 noundef %62)
  br label %143

64:                                               ; preds = %56
  %65 = load ptr, ptr %4, align 8
  %66 = icmp eq ptr %65, null
  br i1 %66, label %67, label %71

67:                                               ; preds = %64
  %68 = load ptr, ptr %3, align 8
  %69 = load i32, ptr %6, align 4
  %70 = call i32 @png_crc_finish(ptr noundef %68, i32 noundef %69)
  br label %142

71:                                               ; preds = %64
  %72 = load ptr, ptr %3, align 8
  %73 = load i32, ptr %7, align 4
  %74 = call i32 @png_chunk_unknown_handling(ptr noundef %72, i32 noundef %73)
  store i32 %74, ptr %5, align 4
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %111

76:                                               ; preds = %71
  %77 = load i32, ptr %7, align 4
  %78 = icmp eq i32 %77, 1229209940
  br i1 %78, label %79, label %97

79:                                               ; preds = %76
  %80 = load i32, ptr %6, align 4
  %81 = icmp ugt i32 %80, 0
  br i1 %81, label %82, label %88

82:                                               ; preds = %79
  %83 = load ptr, ptr %3, align 8
  %84 = getelementptr inbounds %struct.png_struct_def, ptr %83, i32 0, i32 16
  %85 = load i32, ptr %84, align 8
  %86 = and i32 %85, 8
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %88, label %94

88:                                               ; preds = %82, %79
  %89 = load ptr, ptr %3, align 8
  %90 = getelementptr inbounds %struct.png_struct_def, ptr %89, i32 0, i32 15
  %91 = load i32, ptr %90, align 4
  %92 = and i32 %91, 8192
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %94, label %96

94:                                               ; preds = %88, %82
  %95 = load ptr, ptr %3, align 8
  call void @png_benign_error(ptr noundef %95, ptr noundef @.str.11)
  br label %96

96:                                               ; preds = %94, %88
  br label %97

97:                                               ; preds = %96, %76
  %98 = load ptr, ptr %3, align 8
  %99 = load ptr, ptr %4, align 8
  %100 = load i32, ptr %6, align 4
  %101 = load i32, ptr %5, align 4
  %102 = call i32 @png_handle_unknown(ptr noundef %98, ptr noundef %99, i32 noundef %100, i32 noundef %101)
  %103 = load i32, ptr %7, align 4
  %104 = icmp eq i32 %103, 1347179589
  br i1 %104, label %105, label %110

105:                                              ; preds = %97
  %106 = load ptr, ptr %3, align 8
  %107 = getelementptr inbounds %struct.png_struct_def, ptr %106, i32 0, i32 15
  %108 = load i32, ptr %107, align 4
  %109 = or i32 %108, 2
  store i32 %109, ptr %107, align 4
  br label %110

110:                                              ; preds = %105, %97
  br label %141

111:                                              ; preds = %71
  %112 = load i32, ptr %7, align 4
  %113 = icmp eq i32 %112, 1229209940
  br i1 %113, label %114, label %135

114:                                              ; preds = %111
  %115 = load i32, ptr %6, align 4
  %116 = icmp ugt i32 %115, 0
  br i1 %116, label %117, label %123

117:                                              ; preds = %114
  %118 = load ptr, ptr %3, align 8
  %119 = getelementptr inbounds %struct.png_struct_def, ptr %118, i32 0, i32 16
  %120 = load i32, ptr %119, align 8
  %121 = and i32 %120, 8
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %123, label %129

123:                                              ; preds = %117, %114
  %124 = load ptr, ptr %3, align 8
  %125 = getelementptr inbounds %struct.png_struct_def, ptr %124, i32 0, i32 15
  %126 = load i32, ptr %125, align 4
  %127 = and i32 %126, 8192
  %128 = icmp ne i32 %127, 0
  br i1 %128, label %129, label %131

129:                                              ; preds = %123, %117
  %130 = load ptr, ptr %3, align 8
  call void @png_benign_error(ptr noundef %130, ptr noundef @.str.12)
  br label %131

131:                                              ; preds = %129, %123
  %132 = load ptr, ptr %3, align 8
  %133 = load i32, ptr %6, align 4
  %134 = call i32 @png_crc_finish(ptr noundef %132, i32 noundef %133)
  br label %140

135:                                              ; preds = %111
  %136 = load ptr, ptr %3, align 8
  %137 = load ptr, ptr %4, align 8
  %138 = load i32, ptr %6, align 4
  %139 = call i32 @png_handle_chunk(ptr noundef %136, ptr noundef %137, i32 noundef %138)
  br label %140

140:                                              ; preds = %135, %131
  br label %141

141:                                              ; preds = %140, %110
  br label %142

142:                                              ; preds = %141, %67
  br label %143

143:                                              ; preds = %142, %59
  br label %144

144:                                              ; preds = %143, %51
  br label %145

145:                                              ; preds = %144
  %146 = load ptr, ptr %3, align 8
  %147 = getelementptr inbounds %struct.png_struct_def, ptr %146, i32 0, i32 15
  %148 = load i32, ptr %147, align 4
  %149 = and i32 %148, 16
  %150 = icmp eq i32 %149, 0
  br i1 %150, label %35, label %151, !llvm.loop !13

151:                                              ; preds = %10, %145
  ret void
}

declare void @png_read_finish_IDAT(ptr noundef) #1

declare void @png_benign_error(ptr noundef, ptr noundef) #1

declare i32 @png_crc_finish(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_destroy_read_struct(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store ptr null, ptr %7, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %13

10:                                               ; preds = %3
  %11 = load ptr, ptr %4, align 8
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %7, align 8
  br label %13

13:                                               ; preds = %10, %3
  %14 = load ptr, ptr %7, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  br label %25

17:                                               ; preds = %13
  %18 = load ptr, ptr %7, align 8
  %19 = load ptr, ptr %6, align 8
  call void @png_destroy_info_struct(ptr noundef %18, ptr noundef %19)
  %20 = load ptr, ptr %7, align 8
  %21 = load ptr, ptr %5, align 8
  call void @png_destroy_info_struct(ptr noundef %20, ptr noundef %21)
  %22 = load ptr, ptr %4, align 8
  store ptr null, ptr %22, align 8
  %23 = load ptr, ptr %7, align 8
  call void @png_read_destroy(ptr noundef %23)
  %24 = load ptr, ptr %7, align 8
  call void @png_destroy_png_struct(ptr noundef %24)
  br label %25

25:                                               ; preds = %17, %16
  ret void
}

declare void @png_destroy_info_struct(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_read_destroy(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @png_destroy_gamma_table(ptr noundef %3)
  %4 = load ptr, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.png_struct_def, ptr %5, i32 0, i32 133
  %7 = load ptr, ptr %6, align 8
  call void @png_free(ptr noundef %4, ptr noundef %7)
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds %struct.png_struct_def, ptr %8, i32 0, i32 133
  store ptr null, ptr %9, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.png_struct_def, ptr %11, i32 0, i32 148
  %13 = load ptr, ptr %12, align 8
  call void @png_free(ptr noundef %10, ptr noundef %13)
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.png_struct_def, ptr %14, i32 0, i32 148
  store ptr null, ptr %15, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.png_struct_def, ptr %17, i32 0, i32 144
  %19 = load ptr, ptr %18, align 8
  call void @png_free(ptr noundef %16, ptr noundef %19)
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.png_struct_def, ptr %20, i32 0, i32 144
  store ptr null, ptr %21, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.png_struct_def, ptr %23, i32 0, i32 113
  %25 = load ptr, ptr %24, align 8
  call void @png_free(ptr noundef %22, ptr noundef %25)
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds %struct.png_struct_def, ptr %26, i32 0, i32 113
  store ptr null, ptr %27, align 8
  %28 = load ptr, ptr %2, align 8
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds %struct.png_struct_def, ptr %29, i32 0, i32 114
  %31 = load ptr, ptr %30, align 8
  call void @png_free(ptr noundef %28, ptr noundef %31)
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds %struct.png_struct_def, ptr %32, i32 0, i32 114
  store ptr null, ptr %33, align 8
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds %struct.png_struct_def, ptr %34, i32 0, i32 117
  %36 = load i32, ptr %35, align 4
  %37 = and i32 %36, 4096
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %46

39:                                               ; preds = %1
  %40 = load ptr, ptr %2, align 8
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds %struct.png_struct_def, ptr %41, i32 0, i32 53
  %43 = load ptr, ptr %42, align 8
  call void @png_zfree(ptr noundef %40, ptr noundef %43)
  %44 = load ptr, ptr %2, align 8
  %45 = getelementptr inbounds %struct.png_struct_def, ptr %44, i32 0, i32 53
  store ptr null, ptr %45, align 8
  br label %46

46:                                               ; preds = %39, %1
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds %struct.png_struct_def, ptr %47, i32 0, i32 117
  %49 = load i32, ptr %48, align 4
  %50 = and i32 %49, -4097
  store i32 %50, ptr %48, align 4
  %51 = load ptr, ptr %2, align 8
  %52 = getelementptr inbounds %struct.png_struct_def, ptr %51, i32 0, i32 117
  %53 = load i32, ptr %52, align 4
  %54 = and i32 %53, 8192
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %63

56:                                               ; preds = %46
  %57 = load ptr, ptr %2, align 8
  %58 = load ptr, ptr %2, align 8
  %59 = getelementptr inbounds %struct.png_struct_def, ptr %58, i32 0, i32 94
  %60 = load ptr, ptr %59, align 8
  call void @png_free(ptr noundef %57, ptr noundef %60)
  %61 = load ptr, ptr %2, align 8
  %62 = getelementptr inbounds %struct.png_struct_def, ptr %61, i32 0, i32 94
  store ptr null, ptr %62, align 8
  br label %63

63:                                               ; preds = %56, %46
  %64 = load ptr, ptr %2, align 8
  %65 = getelementptr inbounds %struct.png_struct_def, ptr %64, i32 0, i32 117
  %66 = load i32, ptr %65, align 4
  %67 = and i32 %66, -8193
  store i32 %67, ptr %65, align 4
  %68 = load ptr, ptr %2, align 8
  %69 = getelementptr inbounds %struct.png_struct_def, ptr %68, i32 0, i32 19
  %70 = call i32 @inflateEnd(ptr noundef %69)
  %71 = load ptr, ptr %2, align 8
  %72 = load ptr, ptr %2, align 8
  %73 = getelementptr inbounds %struct.png_struct_def, ptr %72, i32 0, i32 102
  %74 = load ptr, ptr %73, align 8
  call void @png_free(ptr noundef %71, ptr noundef %74)
  %75 = load ptr, ptr %2, align 8
  %76 = getelementptr inbounds %struct.png_struct_def, ptr %75, i32 0, i32 102
  store ptr null, ptr %76, align 8
  %77 = load ptr, ptr %2, align 8
  %78 = load ptr, ptr %2, align 8
  %79 = getelementptr inbounds %struct.png_struct_def, ptr %78, i32 0, i32 142
  %80 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %79, i32 0, i32 1
  %81 = load ptr, ptr %80, align 8
  call void @png_free(ptr noundef %77, ptr noundef %81)
  %82 = load ptr, ptr %2, align 8
  %83 = getelementptr inbounds %struct.png_struct_def, ptr %82, i32 0, i32 142
  %84 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %83, i32 0, i32 1
  store ptr null, ptr %84, align 8
  %85 = load ptr, ptr %2, align 8
  %86 = load ptr, ptr %2, align 8
  %87 = getelementptr inbounds %struct.png_struct_def, ptr %86, i32 0, i32 122
  %88 = load ptr, ptr %87, align 8
  call void @png_free(ptr noundef %85, ptr noundef %88)
  %89 = load ptr, ptr %2, align 8
  %90 = getelementptr inbounds %struct.png_struct_def, ptr %89, i32 0, i32 122
  store ptr null, ptr %90, align 8
  %91 = load ptr, ptr %2, align 8
  %92 = load ptr, ptr %2, align 8
  %93 = getelementptr inbounds %struct.png_struct_def, ptr %92, i32 0, i32 127
  %94 = load ptr, ptr %93, align 8
  call void @png_free(ptr noundef %91, ptr noundef %94)
  %95 = load ptr, ptr %2, align 8
  %96 = getelementptr inbounds %struct.png_struct_def, ptr %95, i32 0, i32 127
  store ptr null, ptr %96, align 8
  ret void
}

declare void @png_destroy_png_struct(ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_read_status_fn(ptr noalias noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %12

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 96
  store ptr %9, ptr %11, align 8
  br label %12

12:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_read_png(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr %3, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = icmp eq ptr %10, null
  br i1 %11, label %15, label %12

12:                                               ; preds = %4
  %13 = load ptr, ptr %6, align 8
  %14 = icmp eq ptr %13, null
  br i1 %14, label %15, label %16

15:                                               ; preds = %12, %4
  br label %195

16:                                               ; preds = %12
  %17 = load ptr, ptr %5, align 8
  %18 = load ptr, ptr %6, align 8
  call void @png_read_info(ptr noundef %17, ptr noundef %18)
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds %struct.png_info_def, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = zext i32 %21 to i64
  %23 = icmp ugt i64 %22, 536870911
  br i1 %23, label %24, label %26

24:                                               ; preds = %16
  %25 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %25, ptr noundef @.str.13) #8
  unreachable

26:                                               ; preds = %16
  %27 = load i32, ptr %7, align 4
  %28 = and i32 %27, 32768
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %32

30:                                               ; preds = %26
  %31 = load ptr, ptr %5, align 8
  call void @png_set_scale_16(ptr noundef %31)
  br label %32

32:                                               ; preds = %30, %26
  %33 = load i32, ptr %7, align 4
  %34 = and i32 %33, 1
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %38

36:                                               ; preds = %32
  %37 = load ptr, ptr %5, align 8
  call void @png_set_strip_16(ptr noundef %37)
  br label %38

38:                                               ; preds = %36, %32
  %39 = load i32, ptr %7, align 4
  %40 = and i32 %39, 2
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %44

42:                                               ; preds = %38
  %43 = load ptr, ptr %5, align 8
  call void @png_set_strip_alpha(ptr noundef %43)
  br label %44

44:                                               ; preds = %42, %38
  %45 = load i32, ptr %7, align 4
  %46 = and i32 %45, 4
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %50

48:                                               ; preds = %44
  %49 = load ptr, ptr %5, align 8
  call void @png_set_packing(ptr noundef %49)
  br label %50

50:                                               ; preds = %48, %44
  %51 = load i32, ptr %7, align 4
  %52 = and i32 %51, 8
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %56

54:                                               ; preds = %50
  %55 = load ptr, ptr %5, align 8
  call void @png_set_packswap(ptr noundef %55)
  br label %56

56:                                               ; preds = %54, %50
  %57 = load i32, ptr %7, align 4
  %58 = and i32 %57, 16
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %62

60:                                               ; preds = %56
  %61 = load ptr, ptr %5, align 8
  call void @png_set_expand(ptr noundef %61)
  br label %62

62:                                               ; preds = %60, %56
  %63 = load i32, ptr %7, align 4
  %64 = and i32 %63, 32
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %68

66:                                               ; preds = %62
  %67 = load ptr, ptr %5, align 8
  call void @png_set_invert_mono(ptr noundef %67)
  br label %68

68:                                               ; preds = %66, %62
  %69 = load i32, ptr %7, align 4
  %70 = and i32 %69, 64
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %83

72:                                               ; preds = %68
  %73 = load ptr, ptr %6, align 8
  %74 = getelementptr inbounds %struct.png_info_def, ptr %73, i32 0, i32 2
  %75 = load i32, ptr %74, align 8
  %76 = and i32 %75, 2
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %82

78:                                               ; preds = %72
  %79 = load ptr, ptr %5, align 8
  %80 = load ptr, ptr %6, align 8
  %81 = getelementptr inbounds %struct.png_info_def, ptr %80, i32 0, i32 39
  call void @png_set_shift(ptr noundef %79, ptr noundef %81)
  br label %82

82:                                               ; preds = %78, %72
  br label %83

83:                                               ; preds = %82, %68
  %84 = load i32, ptr %7, align 4
  %85 = and i32 %84, 128
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %89

87:                                               ; preds = %83
  %88 = load ptr, ptr %5, align 8
  call void @png_set_bgr(ptr noundef %88)
  br label %89

89:                                               ; preds = %87, %83
  %90 = load i32, ptr %7, align 4
  %91 = and i32 %90, 256
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %93, label %95

93:                                               ; preds = %89
  %94 = load ptr, ptr %5, align 8
  call void @png_set_swap_alpha(ptr noundef %94)
  br label %95

95:                                               ; preds = %93, %89
  %96 = load i32, ptr %7, align 4
  %97 = and i32 %96, 512
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %99, label %101

99:                                               ; preds = %95
  %100 = load ptr, ptr %5, align 8
  call void @png_set_swap(ptr noundef %100)
  br label %101

101:                                              ; preds = %99, %95
  %102 = load i32, ptr %7, align 4
  %103 = and i32 %102, 1024
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %105, label %107

105:                                              ; preds = %101
  %106 = load ptr, ptr %5, align 8
  call void @png_set_invert_alpha(ptr noundef %106)
  br label %107

107:                                              ; preds = %105, %101
  %108 = load i32, ptr %7, align 4
  %109 = and i32 %108, 8192
  %110 = icmp ne i32 %109, 0
  br i1 %110, label %111, label %113

111:                                              ; preds = %107
  %112 = load ptr, ptr %5, align 8
  call void @png_set_gray_to_rgb(ptr noundef %112)
  br label %113

113:                                              ; preds = %111, %107
  %114 = load i32, ptr %7, align 4
  %115 = and i32 %114, 16384
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %117, label %119

117:                                              ; preds = %113
  %118 = load ptr, ptr %5, align 8
  call void @png_set_expand_16(ptr noundef %118)
  br label %119

119:                                              ; preds = %117, %113
  %120 = load ptr, ptr %5, align 8
  %121 = call i32 @png_set_interlace_handling(ptr noundef %120)
  %122 = load ptr, ptr %5, align 8
  %123 = load ptr, ptr %6, align 8
  call void @png_read_update_info(ptr noundef %122, ptr noundef %123)
  %124 = load ptr, ptr %5, align 8
  %125 = load ptr, ptr %6, align 8
  call void @png_free_data(ptr noundef %124, ptr noundef %125, i32 noundef 64, i32 noundef 0)
  %126 = load ptr, ptr %6, align 8
  %127 = getelementptr inbounds %struct.png_info_def, ptr %126, i32 0, i32 67
  %128 = load ptr, ptr %127, align 8
  %129 = icmp eq ptr %128, null
  br i1 %129, label %130, label %183

130:                                              ; preds = %119
  %131 = load ptr, ptr %5, align 8
  %132 = load ptr, ptr %6, align 8
  %133 = getelementptr inbounds %struct.png_info_def, ptr %132, i32 0, i32 1
  %134 = load i32, ptr %133, align 4
  %135 = zext i32 %134 to i64
  %136 = mul i64 %135, 8
  %137 = call noalias ptr @png_malloc(ptr noundef %131, i64 noundef %136)
  %138 = load ptr, ptr %6, align 8
  %139 = getelementptr inbounds %struct.png_info_def, ptr %138, i32 0, i32 67
  store ptr %137, ptr %139, align 8
  store i32 0, ptr %9, align 4
  br label %140

140:                                              ; preds = %153, %130
  %141 = load i32, ptr %9, align 4
  %142 = load ptr, ptr %6, align 8
  %143 = getelementptr inbounds %struct.png_info_def, ptr %142, i32 0, i32 1
  %144 = load i32, ptr %143, align 4
  %145 = icmp ult i32 %141, %144
  br i1 %145, label %146, label %156

146:                                              ; preds = %140
  %147 = load ptr, ptr %6, align 8
  %148 = getelementptr inbounds %struct.png_info_def, ptr %147, i32 0, i32 67
  %149 = load ptr, ptr %148, align 8
  %150 = load i32, ptr %9, align 4
  %151 = zext i32 %150 to i64
  %152 = getelementptr inbounds ptr, ptr %149, i64 %151
  store ptr null, ptr %152, align 8
  br label %153

153:                                              ; preds = %146
  %154 = load i32, ptr %9, align 4
  %155 = add i32 %154, 1
  store i32 %155, ptr %9, align 4
  br label %140, !llvm.loop !14

156:                                              ; preds = %140
  %157 = load ptr, ptr %6, align 8
  %158 = getelementptr inbounds %struct.png_info_def, ptr %157, i32 0, i32 59
  %159 = load i32, ptr %158, align 4
  %160 = or i32 %159, 64
  store i32 %160, ptr %158, align 4
  store i32 0, ptr %9, align 4
  br label %161

161:                                              ; preds = %179, %156
  %162 = load i32, ptr %9, align 4
  %163 = load ptr, ptr %6, align 8
  %164 = getelementptr inbounds %struct.png_info_def, ptr %163, i32 0, i32 1
  %165 = load i32, ptr %164, align 4
  %166 = icmp ult i32 %162, %165
  br i1 %166, label %167, label %182

167:                                              ; preds = %161
  %168 = load ptr, ptr %5, align 8
  %169 = load ptr, ptr %6, align 8
  %170 = getelementptr inbounds %struct.png_info_def, ptr %169, i32 0, i32 3
  %171 = load i64, ptr %170, align 8
  %172 = call noalias ptr @png_malloc(ptr noundef %168, i64 noundef %171)
  %173 = load ptr, ptr %6, align 8
  %174 = getelementptr inbounds %struct.png_info_def, ptr %173, i32 0, i32 67
  %175 = load ptr, ptr %174, align 8
  %176 = load i32, ptr %9, align 4
  %177 = zext i32 %176 to i64
  %178 = getelementptr inbounds ptr, ptr %175, i64 %177
  store ptr %172, ptr %178, align 8
  br label %179

179:                                              ; preds = %167
  %180 = load i32, ptr %9, align 4
  %181 = add i32 %180, 1
  store i32 %181, ptr %9, align 4
  br label %161, !llvm.loop !15

182:                                              ; preds = %161
  br label %183

183:                                              ; preds = %182, %119
  %184 = load ptr, ptr %5, align 8
  %185 = load ptr, ptr %6, align 8
  %186 = getelementptr inbounds %struct.png_info_def, ptr %185, i32 0, i32 67
  %187 = load ptr, ptr %186, align 8
  call void @png_read_image(ptr noundef %184, ptr noundef %187)
  %188 = load ptr, ptr %6, align 8
  %189 = getelementptr inbounds %struct.png_info_def, ptr %188, i32 0, i32 2
  %190 = load i32, ptr %189, align 8
  %191 = or i32 %190, 32768
  store i32 %191, ptr %189, align 8
  %192 = load ptr, ptr %5, align 8
  %193 = load ptr, ptr %6, align 8
  call void @png_read_end(ptr noundef %192, ptr noundef %193)
  %194 = load ptr, ptr %8, align 8
  br label %195

195:                                              ; preds = %183, %15
  ret void
}

declare void @png_set_scale_16(ptr noundef) #1

declare void @png_set_strip_16(ptr noundef) #1

declare void @png_set_strip_alpha(ptr noundef) #1

declare void @png_set_packing(ptr noundef) #1

declare void @png_set_packswap(ptr noundef) #1

declare void @png_set_expand(ptr noundef) #1

declare void @png_set_invert_mono(ptr noundef) #1

declare void @png_set_shift(ptr noundef, ptr noundef) #1

declare void @png_set_bgr(ptr noundef) #1

declare void @png_set_swap_alpha(ptr noundef) #1

declare void @png_set_swap(ptr noundef) #1

declare void @png_set_invert_alpha(ptr noundef) #1

declare void @png_set_gray_to_rgb(ptr noundef) #1

declare void @png_set_expand_16(ptr noundef) #1

declare void @png_free_data(ptr noundef, ptr noundef, i32 noundef, i32 noundef) #1

declare noalias ptr @png_malloc(ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_image_begin_read_from_stdio(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %36

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.png_image, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 8
  %12 = icmp eq i32 %11, 1
  br i1 %12, label %13, label %36

13:                                               ; preds = %8
  %14 = load ptr, ptr %5, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %32

16:                                               ; preds = %13
  %17 = load ptr, ptr %4, align 8
  %18 = call i32 @png_image_read_init(ptr noundef %17)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %31

20:                                               ; preds = %16
  %21 = load ptr, ptr %5, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.png_image, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = getelementptr inbounds %struct.png_control, ptr %24, i32 0, i32 0
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds %struct.png_struct_def, ptr %26, i32 0, i32 9
  store ptr %21, ptr %27, align 8
  %28 = load ptr, ptr %4, align 8
  %29 = load ptr, ptr %4, align 8
  %30 = call i32 @png_safe_execute(ptr noundef %28, ptr noundef @png_image_read_header, ptr noundef %29)
  store i32 %30, ptr %3, align 4
  br label %44

31:                                               ; preds = %16
  br label %35

32:                                               ; preds = %13
  %33 = load ptr, ptr %4, align 8
  %34 = call i32 @png_image_error(ptr noundef %33, ptr noundef @.str.14)
  store i32 %34, ptr %3, align 4
  br label %44

35:                                               ; preds = %31
  br label %43

36:                                               ; preds = %8, %2
  %37 = load ptr, ptr %4, align 8
  %38 = icmp ne ptr %37, null
  br i1 %38, label %39, label %42

39:                                               ; preds = %36
  %40 = load ptr, ptr %4, align 8
  %41 = call i32 @png_image_error(ptr noundef %40, ptr noundef @.str.15)
  store i32 %41, ptr %3, align 4
  br label %44

42:                                               ; preds = %36
  br label %43

43:                                               ; preds = %42, %35
  store i32 0, ptr %3, align 4
  br label %44

44:                                               ; preds = %43, %39, %32, %20
  %45 = load i32, ptr %3, align 4
  ret i32 %45
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_read_init(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %struct.png_image, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %51

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = call noalias ptr @png_create_read_struct(ptr noundef @.str.26, ptr noundef %12, ptr noundef @png_safe_error, ptr noundef @png_safe_warning)
  store ptr %13, ptr %4, align 8
  %14 = load ptr, ptr %3, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %14, i8 0, i64 104, i1 false)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.png_image, ptr %15, i32 0, i32 1
  store i32 1, ptr %16, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %48

19:                                               ; preds = %11
  %20 = load ptr, ptr %4, align 8
  %21 = call noalias ptr @png_create_info_struct(ptr noundef %20)
  store ptr %21, ptr %5, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %47

24:                                               ; preds = %19
  %25 = load ptr, ptr %4, align 8
  %26 = call noalias ptr @png_malloc_warn(ptr noundef %25, i64 noundef 48)
  store ptr %26, ptr %6, align 8
  %27 = load ptr, ptr %6, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %29, label %45

29:                                               ; preds = %24
  %30 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %30, i8 0, i64 48, i1 false)
  %31 = load ptr, ptr %4, align 8
  %32 = load ptr, ptr %6, align 8
  %33 = getelementptr inbounds %struct.png_control, ptr %32, i32 0, i32 0
  store ptr %31, ptr %33, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = load ptr, ptr %6, align 8
  %36 = getelementptr inbounds %struct.png_control, ptr %35, i32 0, i32 1
  store ptr %34, ptr %36, align 8
  %37 = load ptr, ptr %6, align 8
  %38 = getelementptr inbounds %struct.png_control, ptr %37, i32 0, i32 5
  %39 = load i8, ptr %38, align 8
  %40 = and i8 %39, -2
  %41 = or i8 %40, 0
  store i8 %41, ptr %38, align 8
  %42 = load ptr, ptr %6, align 8
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds %struct.png_image, ptr %43, i32 0, i32 0
  store ptr %42, ptr %44, align 8
  store i32 1, ptr %2, align 4
  br label %54

45:                                               ; preds = %24
  %46 = load ptr, ptr %4, align 8
  call void @png_destroy_info_struct(ptr noundef %46, ptr noundef %5)
  br label %47

47:                                               ; preds = %45, %19
  call void @png_destroy_read_struct(ptr noundef %4, ptr noundef null, ptr noundef null)
  br label %48

48:                                               ; preds = %47, %11
  %49 = load ptr, ptr %3, align 8
  %50 = call i32 @png_image_error(ptr noundef %49, ptr noundef @.str.27)
  store i32 %50, ptr %2, align 4
  br label %54

51:                                               ; preds = %1
  %52 = load ptr, ptr %3, align 8
  %53 = call i32 @png_image_error(ptr noundef %52, ptr noundef @.str.28)
  store i32 %53, ptr %2, align 4
  br label %54

54:                                               ; preds = %51, %48, %29
  %55 = load i32, ptr %2, align 4
  ret i32 %55
}

declare i32 @png_safe_execute(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_read_header(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %8 = load ptr, ptr %2, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.png_image, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %struct.png_control, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %4, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.png_image, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = getelementptr inbounds %struct.png_control, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %5, align 8
  %19 = load ptr, ptr %4, align 8
  call void @png_set_benign_errors(ptr noundef %19, i32 noundef 1)
  %20 = load ptr, ptr %4, align 8
  %21 = load ptr, ptr %5, align 8
  call void @png_read_info(ptr noundef %20, ptr noundef %21)
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds %struct.png_struct_def, ptr %22, i32 0, i32 38
  %24 = load i32, ptr %23, align 4
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.png_image, ptr %25, i32 0, i32 2
  store i32 %24, ptr %26, align 4
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.png_struct_def, ptr %27, i32 0, i32 39
  %29 = load i32, ptr %28, align 8
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds %struct.png_image, ptr %30, i32 0, i32 3
  store i32 %29, ptr %31, align 8
  %32 = load ptr, ptr %4, align 8
  %33 = call i32 @png_image_format(ptr noundef %32)
  store i32 %33, ptr %6, align 4
  %34 = load i32, ptr %6, align 4
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds %struct.png_image, ptr %35, i32 0, i32 4
  store i32 %34, ptr %36, align 4
  %37 = load i32, ptr %6, align 4
  %38 = and i32 %37, 2
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %49

40:                                               ; preds = %1
  %41 = load ptr, ptr %4, align 8
  %42 = call i32 @png_image_is_not_sRGB(ptr noundef %41)
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %49

44:                                               ; preds = %40
  %45 = load ptr, ptr %3, align 8
  %46 = getelementptr inbounds %struct.png_image, ptr %45, i32 0, i32 5
  %47 = load i32, ptr %46, align 8
  %48 = or i32 %47, 1
  store i32 %48, ptr %46, align 8
  br label %49

49:                                               ; preds = %44, %40, %1
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds %struct.png_struct_def, ptr %50, i32 0, i32 62
  %52 = load i8, ptr %51, align 1
  %53 = zext i8 %52 to i32
  switch i32 %53, label %65 [
    i32 0, label %54
    i32 3, label %60
  ]

54:                                               ; preds = %49
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds %struct.png_struct_def, ptr %55, i32 0, i32 63
  %57 = load i8, ptr %56, align 8
  %58 = zext i8 %57 to i32
  %59 = shl i32 1, %58
  store i32 %59, ptr %7, align 4
  br label %66

60:                                               ; preds = %49
  %61 = load ptr, ptr %4, align 8
  %62 = getelementptr inbounds %struct.png_struct_def, ptr %61, i32 0, i32 54
  %63 = load i16, ptr %62, align 8
  %64 = zext i16 %63 to i32
  store i32 %64, ptr %7, align 4
  br label %66

65:                                               ; preds = %49
  store i32 256, ptr %7, align 4
  br label %66

66:                                               ; preds = %65, %60, %54
  %67 = load i32, ptr %7, align 4
  %68 = icmp ugt i32 %67, 256
  br i1 %68, label %69, label %70

69:                                               ; preds = %66
  store i32 256, ptr %7, align 4
  br label %70

70:                                               ; preds = %69, %66
  %71 = load i32, ptr %7, align 4
  %72 = load ptr, ptr %3, align 8
  %73 = getelementptr inbounds %struct.png_image, ptr %72, i32 0, i32 6
  store i32 %71, ptr %73, align 4
  ret i32 1
}

declare i32 @png_image_error(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_image_begin_read_from_file(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %58

9:                                                ; preds = %2
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.png_image, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 1
  br i1 %13, label %14, label %58

14:                                               ; preds = %9
  %15 = load ptr, ptr %5, align 8
  %16 = icmp ne ptr %15, null
  br i1 %16, label %17, label %54

17:                                               ; preds = %14
  %18 = load ptr, ptr %5, align 8
  %19 = call noalias ptr @fopen(ptr noundef %18, ptr noundef @.str.16)
  store ptr %19, ptr %6, align 8
  %20 = load ptr, ptr %6, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %22, label %47

22:                                               ; preds = %17
  %23 = load ptr, ptr %4, align 8
  %24 = call i32 @png_image_read_init(ptr noundef %23)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %44

26:                                               ; preds = %22
  %27 = load ptr, ptr %6, align 8
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds %struct.png_image, ptr %28, i32 0, i32 0
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds %struct.png_control, ptr %30, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = getelementptr inbounds %struct.png_struct_def, ptr %32, i32 0, i32 9
  store ptr %27, ptr %33, align 8
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds %struct.png_image, ptr %34, i32 0, i32 0
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds %struct.png_control, ptr %36, i32 0, i32 5
  %38 = load i8, ptr %37, align 8
  %39 = and i8 %38, -3
  %40 = or i8 %39, 2
  store i8 %40, ptr %37, align 8
  %41 = load ptr, ptr %4, align 8
  %42 = load ptr, ptr %4, align 8
  %43 = call i32 @png_safe_execute(ptr noundef %41, ptr noundef @png_image_read_header, ptr noundef %42)
  store i32 %43, ptr %3, align 4
  br label %66

44:                                               ; preds = %22
  %45 = load ptr, ptr %6, align 8
  %46 = call i32 @fclose(ptr noundef %45)
  br label %53

47:                                               ; preds = %17
  %48 = load ptr, ptr %4, align 8
  %49 = call ptr @__errno_location() #9
  %50 = load i32, ptr %49, align 4
  %51 = call ptr @strerror(i32 noundef %50) #10
  %52 = call i32 @png_image_error(ptr noundef %48, ptr noundef %51)
  store i32 %52, ptr %3, align 4
  br label %66

53:                                               ; preds = %44
  br label %57

54:                                               ; preds = %14
  %55 = load ptr, ptr %4, align 8
  %56 = call i32 @png_image_error(ptr noundef %55, ptr noundef @.str.17)
  store i32 %56, ptr %3, align 4
  br label %66

57:                                               ; preds = %53
  br label %65

58:                                               ; preds = %9, %2
  %59 = load ptr, ptr %4, align 8
  %60 = icmp ne ptr %59, null
  br i1 %60, label %61, label %64

61:                                               ; preds = %58
  %62 = load ptr, ptr %4, align 8
  %63 = call i32 @png_image_error(ptr noundef %62, ptr noundef @.str.18)
  store i32 %63, ptr %3, align 4
  br label %66

64:                                               ; preds = %58
  br label %65

65:                                               ; preds = %64, %57
  store i32 0, ptr %3, align 4
  br label %66

66:                                               ; preds = %65, %61, %54, %47, %26
  %67 = load i32, ptr %3, align 4
  ret i32 %67
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fclose(ptr noundef) #1

; Function Attrs: nounwind
declare ptr @strerror(i32 noundef) #4

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__errno_location() #5

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_image_begin_read_from_memory(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %57

10:                                               ; preds = %3
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds %struct.png_image, ptr %11, i32 0, i32 1
  %13 = load i32, ptr %12, align 8
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %15, label %57

15:                                               ; preds = %10
  %16 = load ptr, ptr %6, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %53

18:                                               ; preds = %15
  %19 = load i64, ptr %7, align 8
  %20 = icmp ugt i64 %19, 0
  br i1 %20, label %21, label %53

21:                                               ; preds = %18
  %22 = load ptr, ptr %5, align 8
  %23 = call i32 @png_image_read_init(ptr noundef %22)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %52

25:                                               ; preds = %21
  %26 = load ptr, ptr %6, align 8
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds %struct.png_image, ptr %27, i32 0, i32 0
  %29 = load ptr, ptr %28, align 8
  %30 = getelementptr inbounds %struct.png_control, ptr %29, i32 0, i32 3
  store ptr %26, ptr %30, align 8
  %31 = load i64, ptr %7, align 8
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds %struct.png_image, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds %struct.png_control, ptr %34, i32 0, i32 4
  store i64 %31, ptr %35, align 8
  %36 = load ptr, ptr %5, align 8
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds %struct.png_image, ptr %37, i32 0, i32 0
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds %struct.png_control, ptr %39, i32 0, i32 0
  %41 = load ptr, ptr %40, align 8
  %42 = getelementptr inbounds %struct.png_struct_def, ptr %41, i32 0, i32 9
  store ptr %36, ptr %42, align 8
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds %struct.png_image, ptr %43, i32 0, i32 0
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds %struct.png_control, ptr %45, i32 0, i32 0
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr inbounds %struct.png_struct_def, ptr %47, i32 0, i32 8
  store ptr @png_image_memory_read, ptr %48, align 8
  %49 = load ptr, ptr %5, align 8
  %50 = load ptr, ptr %5, align 8
  %51 = call i32 @png_safe_execute(ptr noundef %49, ptr noundef @png_image_read_header, ptr noundef %50)
  store i32 %51, ptr %4, align 4
  br label %65

52:                                               ; preds = %21
  br label %56

53:                                               ; preds = %18, %15
  %54 = load ptr, ptr %5, align 8
  %55 = call i32 @png_image_error(ptr noundef %54, ptr noundef @.str.19)
  store i32 %55, ptr %4, align 4
  br label %65

56:                                               ; preds = %52
  br label %64

57:                                               ; preds = %10, %3
  %58 = load ptr, ptr %5, align 8
  %59 = icmp ne ptr %58, null
  br i1 %59, label %60, label %63

60:                                               ; preds = %57
  %61 = load ptr, ptr %5, align 8
  %62 = call i32 @png_image_error(ptr noundef %61, ptr noundef @.str.20)
  store i32 %62, ptr %4, align 4
  br label %65

63:                                               ; preds = %57
  br label %64

64:                                               ; preds = %63, %56
  store i32 0, ptr %4, align 4
  br label %65

65:                                               ; preds = %64, %60, %53, %25
  %66 = load i32, ptr %4, align 4
  ret i32 %66
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_image_memory_read(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %57

13:                                               ; preds = %3
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.png_struct_def, ptr %14, i32 0, i32 9
  %16 = load ptr, ptr %15, align 8
  store ptr %16, ptr %7, align 8
  %17 = load ptr, ptr %7, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %55

19:                                               ; preds = %13
  %20 = load ptr, ptr %7, align 8
  %21 = getelementptr inbounds %struct.png_image, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %8, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %54

25:                                               ; preds = %19
  %26 = load ptr, ptr %8, align 8
  %27 = getelementptr inbounds %struct.png_control, ptr %26, i32 0, i32 3
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %9, align 8
  %29 = load ptr, ptr %8, align 8
  %30 = getelementptr inbounds %struct.png_control, ptr %29, i32 0, i32 4
  %31 = load i64, ptr %30, align 8
  store i64 %31, ptr %10, align 8
  %32 = load ptr, ptr %9, align 8
  %33 = icmp ne ptr %32, null
  br i1 %33, label %34, label %52

34:                                               ; preds = %25
  %35 = load i64, ptr %10, align 8
  %36 = load i64, ptr %6, align 8
  %37 = icmp uge i64 %35, %36
  br i1 %37, label %38, label %52

38:                                               ; preds = %34
  %39 = load ptr, ptr %5, align 8
  %40 = load ptr, ptr %9, align 8
  %41 = load i64, ptr %6, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %39, ptr align 1 %40, i64 %41, i1 false)
  %42 = load ptr, ptr %9, align 8
  %43 = load i64, ptr %6, align 8
  %44 = getelementptr inbounds i8, ptr %42, i64 %43
  %45 = load ptr, ptr %8, align 8
  %46 = getelementptr inbounds %struct.png_control, ptr %45, i32 0, i32 3
  store ptr %44, ptr %46, align 8
  %47 = load i64, ptr %10, align 8
  %48 = load i64, ptr %6, align 8
  %49 = sub i64 %47, %48
  %50 = load ptr, ptr %8, align 8
  %51 = getelementptr inbounds %struct.png_control, ptr %50, i32 0, i32 4
  store i64 %49, ptr %51, align 8
  br label %57

52:                                               ; preds = %34, %25
  %53 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %53, ptr noundef @.str.29) #8
  unreachable

54:                                               ; preds = %19
  br label %55

55:                                               ; preds = %54, %13
  %56 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %56, ptr noundef @.str.30) #8
  unreachable

57:                                               ; preds = %38, %3
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_image_finish_read(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca %struct.png_image_read_control, align 8
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store i32 %3, ptr %10, align 4
  store ptr %4, ptr %11, align 8
  %17 = load ptr, ptr %7, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %158

19:                                               ; preds = %5
  %20 = load ptr, ptr %7, align 8
  %21 = getelementptr inbounds %struct.png_image, ptr %20, i32 0, i32 1
  %22 = load i32, ptr %21, align 8
  %23 = icmp eq i32 %22, 1
  br i1 %23, label %24, label %158

24:                                               ; preds = %19
  %25 = load ptr, ptr %7, align 8
  %26 = getelementptr inbounds %struct.png_image, ptr %25, i32 0, i32 4
  %27 = load i32, ptr %26, align 4
  %28 = and i32 %27, 8
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %24
  br label %37

31:                                               ; preds = %24
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds %struct.png_image, ptr %32, i32 0, i32 4
  %34 = load i32, ptr %33, align 4
  %35 = and i32 %34, 3
  %36 = add i32 %35, 1
  br label %37

37:                                               ; preds = %31, %30
  %38 = phi i32 [ 1, %30 ], [ %36, %31 ]
  store i32 %38, ptr %12, align 4
  %39 = load ptr, ptr %7, align 8
  %40 = getelementptr inbounds %struct.png_image, ptr %39, i32 0, i32 2
  %41 = load i32, ptr %40, align 4
  %42 = load i32, ptr %12, align 4
  %43 = udiv i32 2147483647, %42
  %44 = icmp ule i32 %41, %43
  br i1 %44, label %45, label %155

45:                                               ; preds = %37
  %46 = load ptr, ptr %7, align 8
  %47 = getelementptr inbounds %struct.png_image, ptr %46, i32 0, i32 2
  %48 = load i32, ptr %47, align 4
  %49 = load i32, ptr %12, align 4
  %50 = mul i32 %48, %49
  store i32 %50, ptr %14, align 4
  %51 = load i32, ptr %10, align 4
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %53, label %55

53:                                               ; preds = %45
  %54 = load i32, ptr %14, align 4
  store i32 %54, ptr %10, align 4
  br label %55

55:                                               ; preds = %53, %45
  %56 = load i32, ptr %10, align 4
  %57 = icmp slt i32 %56, 0
  br i1 %57, label %58, label %61

58:                                               ; preds = %55
  %59 = load i32, ptr %10, align 4
  %60 = sub nsw i32 0, %59
  store i32 %60, ptr %13, align 4
  br label %63

61:                                               ; preds = %55
  %62 = load i32, ptr %10, align 4
  store i32 %62, ptr %13, align 4
  br label %63

63:                                               ; preds = %61, %58
  %64 = load ptr, ptr %7, align 8
  %65 = getelementptr inbounds %struct.png_image, ptr %64, i32 0, i32 0
  %66 = load ptr, ptr %65, align 8
  %67 = icmp ne ptr %66, null
  br i1 %67, label %68, label %152

68:                                               ; preds = %63
  %69 = load ptr, ptr %9, align 8
  %70 = icmp ne ptr %69, null
  br i1 %70, label %71, label %152

71:                                               ; preds = %68
  %72 = load i32, ptr %13, align 4
  %73 = load i32, ptr %14, align 4
  %74 = icmp uge i32 %72, %73
  br i1 %74, label %75, label %152

75:                                               ; preds = %71
  %76 = load ptr, ptr %7, align 8
  %77 = getelementptr inbounds %struct.png_image, ptr %76, i32 0, i32 3
  %78 = load i32, ptr %77, align 8
  %79 = load ptr, ptr %7, align 8
  %80 = getelementptr inbounds %struct.png_image, ptr %79, i32 0, i32 4
  %81 = load i32, ptr %80, align 4
  %82 = and i32 %81, 8
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %85

84:                                               ; preds = %75
  br label %92

85:                                               ; preds = %75
  %86 = load ptr, ptr %7, align 8
  %87 = getelementptr inbounds %struct.png_image, ptr %86, i32 0, i32 4
  %88 = load i32, ptr %87, align 4
  %89 = and i32 %88, 4
  %90 = lshr i32 %89, 2
  %91 = add i32 %90, 1
  br label %92

92:                                               ; preds = %85, %84
  %93 = phi i32 [ 1, %84 ], [ %91, %85 ]
  %94 = udiv i32 -1, %93
  %95 = load i32, ptr %13, align 4
  %96 = udiv i32 %94, %95
  %97 = icmp ule i32 %78, %96
  br i1 %97, label %98, label %149

98:                                               ; preds = %92
  %99 = load ptr, ptr %7, align 8
  %100 = getelementptr inbounds %struct.png_image, ptr %99, i32 0, i32 4
  %101 = load i32, ptr %100, align 4
  %102 = and i32 %101, 8
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %112, label %104

104:                                              ; preds = %98
  %105 = load ptr, ptr %7, align 8
  %106 = getelementptr inbounds %struct.png_image, ptr %105, i32 0, i32 6
  %107 = load i32, ptr %106, align 4
  %108 = icmp ugt i32 %107, 0
  br i1 %108, label %109, label %146

109:                                              ; preds = %104
  %110 = load ptr, ptr %11, align 8
  %111 = icmp ne ptr %110, null
  br i1 %111, label %112, label %146

112:                                              ; preds = %109, %98
  call void @llvm.memset.p0.i64(ptr align 8 %16, i8 0, i64 80, i1 false)
  %113 = load ptr, ptr %7, align 8
  %114 = getelementptr inbounds %struct.png_image_read_control, ptr %16, i32 0, i32 0
  store ptr %113, ptr %114, align 8
  %115 = load ptr, ptr %9, align 8
  %116 = getelementptr inbounds %struct.png_image_read_control, ptr %16, i32 0, i32 1
  store ptr %115, ptr %116, align 8
  %117 = load i32, ptr %10, align 4
  %118 = getelementptr inbounds %struct.png_image_read_control, ptr %16, i32 0, i32 2
  store i32 %117, ptr %118, align 8
  %119 = load ptr, ptr %11, align 8
  %120 = getelementptr inbounds %struct.png_image_read_control, ptr %16, i32 0, i32 3
  store ptr %119, ptr %120, align 8
  %121 = load ptr, ptr %8, align 8
  %122 = getelementptr inbounds %struct.png_image_read_control, ptr %16, i32 0, i32 4
  store ptr %121, ptr %122, align 8
  %123 = getelementptr inbounds %struct.png_image_read_control, ptr %16, i32 0, i32 5
  store ptr null, ptr %123, align 8
  %124 = load ptr, ptr %7, align 8
  %125 = getelementptr inbounds %struct.png_image, ptr %124, i32 0, i32 4
  %126 = load i32, ptr %125, align 4
  %127 = and i32 %126, 8
  %128 = icmp ne i32 %127, 0
  br i1 %128, label %129, label %140

129:                                              ; preds = %112
  %130 = load ptr, ptr %7, align 8
  %131 = call i32 @png_safe_execute(ptr noundef %130, ptr noundef @png_image_read_colormap, ptr noundef %16)
  %132 = icmp ne i32 %131, 0
  br i1 %132, label %133, label %137

133:                                              ; preds = %129
  %134 = load ptr, ptr %7, align 8
  %135 = call i32 @png_safe_execute(ptr noundef %134, ptr noundef @png_image_read_colormapped, ptr noundef %16)
  %136 = icmp ne i32 %135, 0
  br label %137

137:                                              ; preds = %133, %129
  %138 = phi i1 [ false, %129 ], [ %136, %133 ]
  %139 = zext i1 %138 to i32
  store i32 %139, ptr %15, align 4
  br label %143

140:                                              ; preds = %112
  %141 = load ptr, ptr %7, align 8
  %142 = call i32 @png_safe_execute(ptr noundef %141, ptr noundef @png_image_read_direct, ptr noundef %16)
  store i32 %142, ptr %15, align 4
  br label %143

143:                                              ; preds = %140, %137
  %144 = load ptr, ptr %7, align 8
  call void @png_image_free(ptr noundef %144)
  %145 = load i32, ptr %15, align 4
  store i32 %145, ptr %6, align 4
  br label %166

146:                                              ; preds = %109, %104
  %147 = load ptr, ptr %7, align 8
  %148 = call i32 @png_image_error(ptr noundef %147, ptr noundef @.str.21)
  store i32 %148, ptr %6, align 4
  br label %166

149:                                              ; preds = %92
  %150 = load ptr, ptr %7, align 8
  %151 = call i32 @png_image_error(ptr noundef %150, ptr noundef @.str.22)
  store i32 %151, ptr %6, align 4
  br label %166

152:                                              ; preds = %71, %68, %63
  %153 = load ptr, ptr %7, align 8
  %154 = call i32 @png_image_error(ptr noundef %153, ptr noundef @.str.23)
  store i32 %154, ptr %6, align 4
  br label %166

155:                                              ; preds = %37
  %156 = load ptr, ptr %7, align 8
  %157 = call i32 @png_image_error(ptr noundef %156, ptr noundef @.str.24)
  store i32 %157, ptr %6, align 4
  br label %166

158:                                              ; preds = %19, %5
  %159 = load ptr, ptr %7, align 8
  %160 = icmp ne ptr %159, null
  br i1 %160, label %161, label %164

161:                                              ; preds = %158
  %162 = load ptr, ptr %7, align 8
  %163 = call i32 @png_image_error(ptr noundef %162, ptr noundef @.str.25)
  store i32 %163, ptr %6, align 4
  br label %166

164:                                              ; preds = %158
  br label %165

165:                                              ; preds = %164
  store i32 0, ptr %6, align 4
  br label %166

166:                                              ; preds = %165, %161, %155, %152, %149, %146, %143
  %167 = load i32, ptr %6, align 4
  ret i32 %167
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #6

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_read_colormap(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca %struct.png_color_16_struct, align 2
  %23 = alloca i32, align 4
  %24 = alloca %struct.png_color_16_struct, align 2
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca %struct.png_color_16_struct, align 2
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca %struct.png_color_16_struct, align 2
  %46 = alloca i32, align 4
  %47 = alloca ptr, align 8
  %48 = alloca ptr, align 8
  %49 = alloca i32, align 4
  %50 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %51 = load ptr, ptr %2, align 8
  store ptr %51, ptr %3, align 8
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds %struct.png_image_read_control, ptr %52, i32 0, i32 0
  %54 = load ptr, ptr %53, align 8
  store ptr %54, ptr %4, align 8
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds %struct.png_image, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  %58 = getelementptr inbounds %struct.png_control, ptr %57, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  store ptr %59, ptr %5, align 8
  %60 = load ptr, ptr %4, align 8
  %61 = getelementptr inbounds %struct.png_image, ptr %60, i32 0, i32 4
  %62 = load i32, ptr %61, align 4
  store i32 %62, ptr %6, align 4
  %63 = load i32, ptr %6, align 4
  %64 = and i32 %63, 4
  %65 = icmp ne i32 %64, 0
  %66 = zext i1 %65 to i64
  %67 = select i1 %65, i32 2, i32 1
  store i32 %67, ptr %7, align 4
  store i32 0, ptr %10, align 4
  store i32 256, ptr %11, align 4
  store i32 0, ptr %15, align 4
  %68 = load ptr, ptr %5, align 8
  %69 = getelementptr inbounds %struct.png_struct_def, ptr %68, i32 0, i32 62
  %70 = load i8, ptr %69, align 1
  %71 = zext i8 %70 to i32
  %72 = and i32 %71, 4
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %80, label %74

74:                                               ; preds = %1
  %75 = load ptr, ptr %5, align 8
  %76 = getelementptr inbounds %struct.png_struct_def, ptr %75, i32 0, i32 56
  %77 = load i16, ptr %76, align 8
  %78 = zext i16 %77 to i32
  %79 = icmp sgt i32 %78, 0
  br i1 %79, label %80, label %123

80:                                               ; preds = %74, %1
  %81 = load i32, ptr %6, align 4
  %82 = and i32 %81, 1
  %83 = icmp eq i32 %82, 0
  br i1 %83, label %84, label %123

84:                                               ; preds = %80
  %85 = load i32, ptr %7, align 4
  %86 = icmp eq i32 %85, 2
  br i1 %86, label %87, label %88

87:                                               ; preds = %84
  store i32 0, ptr %12, align 4
  store i32 0, ptr %13, align 4
  store i32 0, ptr %14, align 4
  br label %122

88:                                               ; preds = %84
  %89 = load ptr, ptr %3, align 8
  %90 = getelementptr inbounds %struct.png_image_read_control, ptr %89, i32 0, i32 4
  %91 = load ptr, ptr %90, align 8
  %92 = icmp eq ptr %91, null
  br i1 %92, label %93, label %95

93:                                               ; preds = %88
  %94 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %94, ptr noundef @.str.31) #8
  unreachable

95:                                               ; preds = %88
  %96 = load ptr, ptr %3, align 8
  %97 = getelementptr inbounds %struct.png_image_read_control, ptr %96, i32 0, i32 4
  %98 = load ptr, ptr %97, align 8
  %99 = getelementptr inbounds %struct.png_color_struct, ptr %98, i32 0, i32 1
  %100 = load i8, ptr %99, align 1
  %101 = zext i8 %100 to i32
  store i32 %101, ptr %13, align 4
  %102 = load i32, ptr %6, align 4
  %103 = and i32 %102, 2
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %105, label %118

105:                                              ; preds = %95
  %106 = load ptr, ptr %3, align 8
  %107 = getelementptr inbounds %struct.png_image_read_control, ptr %106, i32 0, i32 4
  %108 = load ptr, ptr %107, align 8
  %109 = getelementptr inbounds %struct.png_color_struct, ptr %108, i32 0, i32 0
  %110 = load i8, ptr %109, align 1
  %111 = zext i8 %110 to i32
  store i32 %111, ptr %12, align 4
  %112 = load ptr, ptr %3, align 8
  %113 = getelementptr inbounds %struct.png_image_read_control, ptr %112, i32 0, i32 4
  %114 = load ptr, ptr %113, align 8
  %115 = getelementptr inbounds %struct.png_color_struct, ptr %114, i32 0, i32 2
  %116 = load i8, ptr %115, align 1
  %117 = zext i8 %116 to i32
  store i32 %117, ptr %14, align 4
  br label %120

118:                                              ; preds = %95
  %119 = load i32, ptr %13, align 4
  store i32 %119, ptr %12, align 4
  store i32 %119, ptr %14, align 4
  br label %120

120:                                              ; preds = %118, %105
  br label %121

121:                                              ; preds = %120
  br label %122

122:                                              ; preds = %121, %87
  br label %129

123:                                              ; preds = %80, %74
  %124 = load i32, ptr %7, align 4
  %125 = icmp eq i32 %124, 2
  br i1 %125, label %126, label %127

126:                                              ; preds = %123
  store i32 65535, ptr %13, align 4
  store i32 65535, ptr %12, align 4
  store i32 65535, ptr %14, align 4
  br label %128

127:                                              ; preds = %123
  store i32 255, ptr %13, align 4
  store i32 255, ptr %12, align 4
  store i32 255, ptr %14, align 4
  br label %128

128:                                              ; preds = %127, %126
  br label %129

129:                                              ; preds = %128, %122
  %130 = load ptr, ptr %5, align 8
  %131 = getelementptr inbounds %struct.png_struct_def, ptr %130, i32 0, i32 63
  %132 = load i8, ptr %131, align 8
  %133 = zext i8 %132 to i32
  %134 = icmp eq i32 %133, 16
  br i1 %134, label %135, label %144

135:                                              ; preds = %129
  %136 = load ptr, ptr %4, align 8
  %137 = getelementptr inbounds %struct.png_image, ptr %136, i32 0, i32 5
  %138 = load i32, ptr %137, align 8
  %139 = and i32 %138, 4
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %141, label %144

141:                                              ; preds = %135
  %142 = load ptr, ptr %5, align 8
  %143 = getelementptr inbounds %struct.png_struct_def, ptr %142, i32 0, i32 85
  store i32 100000, ptr %143, align 8
  br label %147

144:                                              ; preds = %135, %129
  %145 = load ptr, ptr %5, align 8
  %146 = getelementptr inbounds %struct.png_struct_def, ptr %145, i32 0, i32 85
  store i32 45455, ptr %146, align 8
  br label %147

147:                                              ; preds = %144, %141
  %148 = load ptr, ptr %5, align 8
  %149 = getelementptr inbounds %struct.png_struct_def, ptr %148, i32 0, i32 62
  %150 = load i8, ptr %149, align 1
  %151 = zext i8 %150 to i32
  switch i32 %151, label %1208 [
    i32 0, label %152
    i32 4, label %320
    i32 2, label %577
    i32 6, label %577
    i32 3, label %1003
  ]

152:                                              ; preds = %147
  %153 = load ptr, ptr %5, align 8
  %154 = getelementptr inbounds %struct.png_struct_def, ptr %153, i32 0, i32 63
  %155 = load i8, ptr %154, align 8
  %156 = zext i8 %155 to i32
  %157 = icmp sle i32 %156, 8
  br i1 %157, label %158, label %234

158:                                              ; preds = %152
  store i32 256, ptr %19, align 4
  store i32 0, ptr %20, align 4
  %159 = load ptr, ptr %5, align 8
  %160 = getelementptr inbounds %struct.png_struct_def, ptr %159, i32 0, i32 63
  %161 = load i8, ptr %160, align 8
  %162 = zext i8 %161 to i32
  %163 = shl i32 1, %162
  store i32 %163, ptr %8, align 4
  %164 = load i32, ptr %8, align 4
  %165 = load ptr, ptr %4, align 8
  %166 = getelementptr inbounds %struct.png_image, ptr %165, i32 0, i32 6
  %167 = load i32, ptr %166, align 4
  %168 = icmp ugt i32 %164, %167
  br i1 %168, label %169, label %171

169:                                              ; preds = %158
  %170 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %170, ptr noundef @.str.32) #8
  unreachable

171:                                              ; preds = %158
  %172 = load i32, ptr %8, align 4
  %173 = sub i32 %172, 1
  %174 = udiv i32 255, %173
  store i32 %174, ptr %16, align 4
  store i32 0, ptr %9, align 4
  %175 = load ptr, ptr %5, align 8
  %176 = getelementptr inbounds %struct.png_struct_def, ptr %175, i32 0, i32 56
  %177 = load i16, ptr %176, align 8
  %178 = zext i16 %177 to i32
  %179 = icmp sgt i32 %178, 0
  br i1 %179, label %180, label %195

180:                                              ; preds = %171
  %181 = load ptr, ptr %5, align 8
  %182 = getelementptr inbounds %struct.png_struct_def, ptr %181, i32 0, i32 95
  %183 = getelementptr inbounds %struct.png_color_16_struct, ptr %182, i32 0, i32 4
  %184 = load i16, ptr %183, align 8
  %185 = zext i16 %184 to i32
  store i32 %185, ptr %19, align 4
  %186 = load i32, ptr %6, align 4
  %187 = and i32 %186, 1
  %188 = icmp eq i32 %187, 0
  br i1 %188, label %189, label %194

189:                                              ; preds = %180
  %190 = load i32, ptr %7, align 4
  %191 = icmp eq i32 %190, 2
  %192 = zext i1 %191 to i64
  %193 = select i1 %191, i32 65535, i32 255
  store i32 %193, ptr %20, align 4
  br label %194

194:                                              ; preds = %189, %180
  br label %195

195:                                              ; preds = %194, %171
  store i32 0, ptr %18, align 4
  store i32 0, ptr %17, align 4
  br label %196

196:                                              ; preds = %219, %195
  %197 = load i32, ptr %17, align 4
  %198 = load i32, ptr %8, align 4
  %199 = icmp ult i32 %197, %198
  br i1 %199, label %200, label %225

200:                                              ; preds = %196
  %201 = load i32, ptr %17, align 4
  %202 = load i32, ptr %19, align 4
  %203 = icmp ne i32 %201, %202
  br i1 %203, label %204, label %210

204:                                              ; preds = %200
  %205 = load ptr, ptr %3, align 8
  %206 = load i32, ptr %17, align 4
  %207 = load i32, ptr %18, align 4
  %208 = load i32, ptr %18, align 4
  %209 = load i32, ptr %18, align 4
  call void @png_create_colormap_entry(ptr noundef %205, i32 noundef %206, i32 noundef %207, i32 noundef %208, i32 noundef %209, i32 noundef 255, i32 noundef 3)
  br label %218

210:                                              ; preds = %200
  %211 = load ptr, ptr %3, align 8
  %212 = load i32, ptr %17, align 4
  %213 = load i32, ptr %12, align 4
  %214 = load i32, ptr %13, align 4
  %215 = load i32, ptr %14, align 4
  %216 = load i32, ptr %20, align 4
  %217 = load i32, ptr %7, align 4
  call void @png_create_colormap_entry(ptr noundef %211, i32 noundef %212, i32 noundef %213, i32 noundef %214, i32 noundef %215, i32 noundef %216, i32 noundef %217)
  br label %218

218:                                              ; preds = %210, %204
  br label %219

219:                                              ; preds = %218
  %220 = load i32, ptr %17, align 4
  %221 = add i32 %220, 1
  store i32 %221, ptr %17, align 4
  %222 = load i32, ptr %16, align 4
  %223 = load i32, ptr %18, align 4
  %224 = add i32 %223, %222
  store i32 %224, ptr %18, align 4
  br label %196, !llvm.loop !16

225:                                              ; preds = %196
  store i32 3, ptr %10, align 4
  %226 = load ptr, ptr %5, align 8
  %227 = getelementptr inbounds %struct.png_struct_def, ptr %226, i32 0, i32 63
  %228 = load i8, ptr %227, align 8
  %229 = zext i8 %228 to i32
  %230 = icmp slt i32 %229, 8
  br i1 %230, label %231, label %233

231:                                              ; preds = %225
  %232 = load ptr, ptr %5, align 8
  call void @png_set_packing(ptr noundef %232)
  br label %233

233:                                              ; preds = %231, %225
  br label %319

234:                                              ; preds = %152
  store i32 1, ptr %10, align 4
  %235 = load ptr, ptr %4, align 8
  %236 = getelementptr inbounds %struct.png_image, ptr %235, i32 0, i32 6
  %237 = load i32, ptr %236, align 4
  %238 = icmp ugt i32 256, %237
  br i1 %238, label %239, label %241

239:                                              ; preds = %234
  %240 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %240, ptr noundef @.str.33) #8
  unreachable

241:                                              ; preds = %234
  %242 = load ptr, ptr %3, align 8
  %243 = call i32 @make_gray_colormap(ptr noundef %242)
  store i32 %243, ptr %8, align 4
  %244 = load ptr, ptr %5, align 8
  %245 = getelementptr inbounds %struct.png_struct_def, ptr %244, i32 0, i32 56
  %246 = load i16, ptr %245, align 8
  %247 = zext i16 %246 to i32
  %248 = icmp sgt i32 %247, 0
  br i1 %248, label %249, label %317

249:                                              ; preds = %241
  %250 = load i32, ptr %6, align 4
  %251 = and i32 %250, 1
  %252 = icmp ne i32 %251, 0
  br i1 %252, label %253, label %254

253:                                              ; preds = %249
  store i32 0, ptr %21, align 4
  br label %310

254:                                              ; preds = %249
  %255 = load i32, ptr %12, align 4
  %256 = load i32, ptr %13, align 4
  %257 = icmp eq i32 %255, %256
  br i1 %257, label %258, label %305

258:                                              ; preds = %254
  %259 = load i32, ptr %13, align 4
  %260 = load i32, ptr %14, align 4
  %261 = icmp eq i32 %259, %260
  br i1 %261, label %262, label %305

262:                                              ; preds = %258
  %263 = load i32, ptr %13, align 4
  store i32 %263, ptr %23, align 4
  %264 = load i32, ptr %7, align 4
  %265 = icmp eq i32 %264, 2
  br i1 %265, label %266, label %296

266:                                              ; preds = %262
  %267 = load i32, ptr %23, align 4
  %268 = mul i32 %267, 255
  %269 = lshr i32 %268, 15
  %270 = zext i32 %269 to i64
  %271 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %270
  %272 = load i16, ptr %271, align 2
  %273 = zext i16 %272 to i32
  %274 = load i32, ptr %23, align 4
  %275 = mul i32 %274, 255
  %276 = and i32 %275, 32767
  %277 = load i32, ptr %23, align 4
  %278 = mul i32 %277, 255
  %279 = lshr i32 %278, 15
  %280 = zext i32 %279 to i64
  %281 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %280
  %282 = load i8, ptr %281, align 1
  %283 = zext i8 %282 to i32
  %284 = mul i32 %276, %283
  %285 = lshr i32 %284, 12
  %286 = add i32 %273, %285
  %287 = lshr i32 %286, 8
  %288 = and i32 255, %287
  %289 = trunc i32 %288 to i8
  %290 = zext i8 %289 to i32
  store i32 %290, ptr %23, align 4
  %291 = load ptr, ptr %3, align 8
  %292 = load i32, ptr %23, align 4
  %293 = load i32, ptr %13, align 4
  %294 = load i32, ptr %13, align 4
  %295 = load i32, ptr %13, align 4
  call void @png_create_colormap_entry(ptr noundef %291, i32 noundef %292, i32 noundef %293, i32 noundef %294, i32 noundef %295, i32 noundef 65535, i32 noundef 2)
  br label %296

296:                                              ; preds = %266, %262
  %297 = getelementptr inbounds %struct.png_color_16_struct, ptr %22, i32 0, i32 0
  store i8 0, ptr %297, align 2
  %298 = load i32, ptr %23, align 4
  %299 = trunc i32 %298 to i16
  %300 = getelementptr inbounds %struct.png_color_16_struct, ptr %22, i32 0, i32 3
  store i16 %299, ptr %300, align 2
  %301 = getelementptr inbounds %struct.png_color_16_struct, ptr %22, i32 0, i32 2
  store i16 %299, ptr %301, align 2
  %302 = getelementptr inbounds %struct.png_color_16_struct, ptr %22, i32 0, i32 1
  store i16 %299, ptr %302, align 2
  %303 = getelementptr inbounds %struct.png_color_16_struct, ptr %22, i32 0, i32 4
  store i16 %299, ptr %303, align 2
  %304 = load ptr, ptr %5, align 8
  call void @png_set_background_fixed(ptr noundef %304, ptr noundef %22, i32 noundef 1, i32 noundef 0, i32 noundef 0)
  store i32 0, ptr %9, align 4
  br label %1210

305:                                              ; preds = %258, %254
  %306 = load i32, ptr %7, align 4
  %307 = icmp eq i32 %306, 2
  %308 = zext i1 %307 to i64
  %309 = select i1 %307, i32 65535, i32 255
  store i32 %309, ptr %21, align 4
  br label %310

310:                                              ; preds = %305, %253
  store i32 1, ptr %15, align 4
  store i32 2, ptr %9, align 4
  store i32 254, ptr %11, align 4
  %311 = load ptr, ptr %3, align 8
  %312 = load i32, ptr %12, align 4
  %313 = load i32, ptr %13, align 4
  %314 = load i32, ptr %14, align 4
  %315 = load i32, ptr %21, align 4
  %316 = load i32, ptr %7, align 4
  call void @png_create_colormap_entry(ptr noundef %311, i32 noundef 254, i32 noundef %312, i32 noundef %313, i32 noundef %314, i32 noundef %315, i32 noundef %316)
  br label %318

317:                                              ; preds = %241
  store i32 0, ptr %9, align 4
  br label %318

318:                                              ; preds = %317, %310
  br label %319

319:                                              ; preds = %318, %233
  br label %1210

320:                                              ; preds = %147
  store i32 1, ptr %10, align 4
  %321 = load i32, ptr %6, align 4
  %322 = and i32 %321, 1
  %323 = icmp ne i32 %322, 0
  br i1 %323, label %324, label %334

324:                                              ; preds = %320
  %325 = load ptr, ptr %4, align 8
  %326 = getelementptr inbounds %struct.png_image, ptr %325, i32 0, i32 6
  %327 = load i32, ptr %326, align 4
  %328 = icmp ugt i32 256, %327
  br i1 %328, label %329, label %331

329:                                              ; preds = %324
  %330 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %330, ptr noundef @.str.34) #8
  unreachable

331:                                              ; preds = %324
  %332 = load ptr, ptr %3, align 8
  %333 = call i32 @make_ga_colormap(ptr noundef %332)
  store i32 %333, ptr %8, align 4
  store i32 231, ptr %11, align 4
  store i32 1, ptr %9, align 4
  br label %576

334:                                              ; preds = %320
  %335 = load i32, ptr %6, align 4
  %336 = and i32 %335, 2
  %337 = icmp eq i32 %336, 0
  br i1 %337, label %346, label %338

338:                                              ; preds = %334
  %339 = load i32, ptr %12, align 4
  %340 = load i32, ptr %13, align 4
  %341 = icmp eq i32 %339, %340
  br i1 %341, label %342, label %398

342:                                              ; preds = %338
  %343 = load i32, ptr %13, align 4
  %344 = load i32, ptr %14, align 4
  %345 = icmp eq i32 %343, %344
  br i1 %345, label %346, label %398

346:                                              ; preds = %342, %334
  %347 = load i32, ptr %13, align 4
  store i32 %347, ptr %25, align 4
  %348 = load ptr, ptr %4, align 8
  %349 = getelementptr inbounds %struct.png_image, ptr %348, i32 0, i32 6
  %350 = load i32, ptr %349, align 4
  %351 = icmp ugt i32 256, %350
  br i1 %351, label %352, label %354

352:                                              ; preds = %346
  %353 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %353, ptr noundef @.str.35) #8
  unreachable

354:                                              ; preds = %346
  %355 = load ptr, ptr %3, align 8
  %356 = call i32 @make_gray_colormap(ptr noundef %355)
  store i32 %356, ptr %8, align 4
  %357 = load i32, ptr %7, align 4
  %358 = icmp eq i32 %357, 2
  br i1 %358, label %359, label %389

359:                                              ; preds = %354
  %360 = load i32, ptr %25, align 4
  %361 = mul i32 %360, 255
  %362 = lshr i32 %361, 15
  %363 = zext i32 %362 to i64
  %364 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %363
  %365 = load i16, ptr %364, align 2
  %366 = zext i16 %365 to i32
  %367 = load i32, ptr %25, align 4
  %368 = mul i32 %367, 255
  %369 = and i32 %368, 32767
  %370 = load i32, ptr %25, align 4
  %371 = mul i32 %370, 255
  %372 = lshr i32 %371, 15
  %373 = zext i32 %372 to i64
  %374 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %373
  %375 = load i8, ptr %374, align 1
  %376 = zext i8 %375 to i32
  %377 = mul i32 %369, %376
  %378 = lshr i32 %377, 12
  %379 = add i32 %366, %378
  %380 = lshr i32 %379, 8
  %381 = and i32 255, %380
  %382 = trunc i32 %381 to i8
  %383 = zext i8 %382 to i32
  store i32 %383, ptr %25, align 4
  %384 = load ptr, ptr %3, align 8
  %385 = load i32, ptr %25, align 4
  %386 = load i32, ptr %13, align 4
  %387 = load i32, ptr %13, align 4
  %388 = load i32, ptr %13, align 4
  call void @png_create_colormap_entry(ptr noundef %384, i32 noundef %385, i32 noundef %386, i32 noundef %387, i32 noundef %388, i32 noundef 65535, i32 noundef 2)
  br label %389

389:                                              ; preds = %359, %354
  %390 = getelementptr inbounds %struct.png_color_16_struct, ptr %24, i32 0, i32 0
  store i8 0, ptr %390, align 2
  %391 = load i32, ptr %25, align 4
  %392 = trunc i32 %391 to i16
  %393 = getelementptr inbounds %struct.png_color_16_struct, ptr %24, i32 0, i32 3
  store i16 %392, ptr %393, align 2
  %394 = getelementptr inbounds %struct.png_color_16_struct, ptr %24, i32 0, i32 2
  store i16 %392, ptr %394, align 2
  %395 = getelementptr inbounds %struct.png_color_16_struct, ptr %24, i32 0, i32 1
  store i16 %392, ptr %395, align 2
  %396 = getelementptr inbounds %struct.png_color_16_struct, ptr %24, i32 0, i32 4
  store i16 %392, ptr %396, align 2
  %397 = load ptr, ptr %5, align 8
  call void @png_set_background_fixed(ptr noundef %397, ptr noundef %24, i32 noundef 1, i32 noundef 0, i32 noundef 0)
  store i32 0, ptr %9, align 4
  br label %575

398:                                              ; preds = %342, %338
  %399 = load ptr, ptr %4, align 8
  %400 = getelementptr inbounds %struct.png_image, ptr %399, i32 0, i32 6
  %401 = load i32, ptr %400, align 4
  %402 = icmp ugt i32 256, %401
  br i1 %402, label %403, label %405

403:                                              ; preds = %398
  %404 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %404, ptr noundef @.str.36) #8
  unreachable

405:                                              ; preds = %398
  store i32 0, ptr %26, align 4
  br label %406

406:                                              ; preds = %409, %405
  %407 = load i32, ptr %26, align 4
  %408 = icmp ult i32 %407, 231
  br i1 %408, label %409, label %420

409:                                              ; preds = %406
  %410 = load i32, ptr %26, align 4
  %411 = mul i32 %410, 256
  %412 = add i32 %411, 115
  %413 = udiv i32 %412, 231
  store i32 %413, ptr %28, align 4
  %414 = load ptr, ptr %3, align 8
  %415 = load i32, ptr %26, align 4
  %416 = add i32 %415, 1
  store i32 %416, ptr %26, align 4
  %417 = load i32, ptr %28, align 4
  %418 = load i32, ptr %28, align 4
  %419 = load i32, ptr %28, align 4
  call void @png_create_colormap_entry(ptr noundef %414, i32 noundef %415, i32 noundef %417, i32 noundef %418, i32 noundef %419, i32 noundef 255, i32 noundef 1)
  br label %406, !llvm.loop !17

420:                                              ; preds = %406
  %421 = load i32, ptr %26, align 4
  store i32 %421, ptr %11, align 4
  %422 = load ptr, ptr %3, align 8
  %423 = load i32, ptr %26, align 4
  %424 = add i32 %423, 1
  store i32 %424, ptr %26, align 4
  %425 = load i32, ptr %12, align 4
  %426 = load i32, ptr %13, align 4
  %427 = load i32, ptr %14, align 4
  %428 = load i32, ptr %7, align 4
  %429 = icmp eq i32 %428, 2
  %430 = zext i1 %429 to i64
  %431 = select i1 %429, i32 65535, i32 255
  %432 = load i32, ptr %7, align 4
  call void @png_create_colormap_entry(ptr noundef %422, i32 noundef %423, i32 noundef %425, i32 noundef %426, i32 noundef %427, i32 noundef %431, i32 noundef %432)
  %433 = load i32, ptr %7, align 4
  %434 = icmp eq i32 %433, 1
  br i1 %434, label %435, label %451

435:                                              ; preds = %420
  %436 = load i32, ptr %12, align 4
  %437 = zext i32 %436 to i64
  %438 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %437
  %439 = load i16, ptr %438, align 2
  %440 = zext i16 %439 to i32
  store i32 %440, ptr %12, align 4
  %441 = load i32, ptr %13, align 4
  %442 = zext i32 %441 to i64
  %443 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %442
  %444 = load i16, ptr %443, align 2
  %445 = zext i16 %444 to i32
  store i32 %445, ptr %13, align 4
  %446 = load i32, ptr %14, align 4
  %447 = zext i32 %446 to i64
  %448 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %447
  %449 = load i16, ptr %448, align 2
  %450 = zext i16 %449 to i32
  store i32 %450, ptr %14, align 4
  br label %451

451:                                              ; preds = %435, %420
  store i32 1, ptr %27, align 4
  br label %452

452:                                              ; preds = %570, %451
  %453 = load i32, ptr %27, align 4
  %454 = icmp ult i32 %453, 5
  br i1 %454, label %455, label %573

455:                                              ; preds = %452
  %456 = load i32, ptr %27, align 4
  %457 = mul i32 51, %456
  store i32 %457, ptr %30, align 4
  %458 = load i32, ptr %30, align 4
  %459 = sub i32 255, %458
  %460 = load i32, ptr %12, align 4
  %461 = mul i32 %459, %460
  store i32 %461, ptr %31, align 4
  %462 = load i32, ptr %30, align 4
  %463 = sub i32 255, %462
  %464 = load i32, ptr %13, align 4
  %465 = mul i32 %463, %464
  store i32 %465, ptr %32, align 4
  %466 = load i32, ptr %30, align 4
  %467 = sub i32 255, %466
  %468 = load i32, ptr %14, align 4
  %469 = mul i32 %467, %468
  store i32 %469, ptr %33, align 4
  store i32 0, ptr %29, align 4
  br label %470

470:                                              ; preds = %566, %455
  %471 = load i32, ptr %29, align 4
  %472 = icmp ult i32 %471, 6
  br i1 %472, label %473, label %569

473:                                              ; preds = %470
  %474 = load i32, ptr %29, align 4
  %475 = mul i32 %474, 51
  %476 = zext i32 %475 to i64
  %477 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %476
  %478 = load i16, ptr %477, align 2
  %479 = zext i16 %478 to i32
  %480 = load i32, ptr %30, align 4
  %481 = mul i32 %479, %480
  store i32 %481, ptr %34, align 4
  %482 = load ptr, ptr %3, align 8
  %483 = load i32, ptr %26, align 4
  %484 = add i32 %483, 1
  store i32 %484, ptr %26, align 4
  %485 = load i32, ptr %34, align 4
  %486 = load i32, ptr %31, align 4
  %487 = add i32 %485, %486
  %488 = lshr i32 %487, 15
  %489 = zext i32 %488 to i64
  %490 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %489
  %491 = load i16, ptr %490, align 2
  %492 = zext i16 %491 to i32
  %493 = load i32, ptr %34, align 4
  %494 = load i32, ptr %31, align 4
  %495 = add i32 %493, %494
  %496 = and i32 %495, 32767
  %497 = load i32, ptr %34, align 4
  %498 = load i32, ptr %31, align 4
  %499 = add i32 %497, %498
  %500 = lshr i32 %499, 15
  %501 = zext i32 %500 to i64
  %502 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %501
  %503 = load i8, ptr %502, align 1
  %504 = zext i8 %503 to i32
  %505 = mul i32 %496, %504
  %506 = lshr i32 %505, 12
  %507 = add i32 %492, %506
  %508 = lshr i32 %507, 8
  %509 = and i32 255, %508
  %510 = trunc i32 %509 to i8
  %511 = zext i8 %510 to i32
  %512 = load i32, ptr %34, align 4
  %513 = load i32, ptr %32, align 4
  %514 = add i32 %512, %513
  %515 = lshr i32 %514, 15
  %516 = zext i32 %515 to i64
  %517 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %516
  %518 = load i16, ptr %517, align 2
  %519 = zext i16 %518 to i32
  %520 = load i32, ptr %34, align 4
  %521 = load i32, ptr %32, align 4
  %522 = add i32 %520, %521
  %523 = and i32 %522, 32767
  %524 = load i32, ptr %34, align 4
  %525 = load i32, ptr %32, align 4
  %526 = add i32 %524, %525
  %527 = lshr i32 %526, 15
  %528 = zext i32 %527 to i64
  %529 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %528
  %530 = load i8, ptr %529, align 1
  %531 = zext i8 %530 to i32
  %532 = mul i32 %523, %531
  %533 = lshr i32 %532, 12
  %534 = add i32 %519, %533
  %535 = lshr i32 %534, 8
  %536 = and i32 255, %535
  %537 = trunc i32 %536 to i8
  %538 = zext i8 %537 to i32
  %539 = load i32, ptr %34, align 4
  %540 = load i32, ptr %33, align 4
  %541 = add i32 %539, %540
  %542 = lshr i32 %541, 15
  %543 = zext i32 %542 to i64
  %544 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %543
  %545 = load i16, ptr %544, align 2
  %546 = zext i16 %545 to i32
  %547 = load i32, ptr %34, align 4
  %548 = load i32, ptr %33, align 4
  %549 = add i32 %547, %548
  %550 = and i32 %549, 32767
  %551 = load i32, ptr %34, align 4
  %552 = load i32, ptr %33, align 4
  %553 = add i32 %551, %552
  %554 = lshr i32 %553, 15
  %555 = zext i32 %554 to i64
  %556 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %555
  %557 = load i8, ptr %556, align 1
  %558 = zext i8 %557 to i32
  %559 = mul i32 %550, %558
  %560 = lshr i32 %559, 12
  %561 = add i32 %546, %560
  %562 = lshr i32 %561, 8
  %563 = and i32 255, %562
  %564 = trunc i32 %563 to i8
  %565 = zext i8 %564 to i32
  call void @png_create_colormap_entry(ptr noundef %482, i32 noundef %483, i32 noundef %511, i32 noundef %538, i32 noundef %565, i32 noundef 255, i32 noundef 1)
  br label %566

566:                                              ; preds = %473
  %567 = load i32, ptr %29, align 4
  %568 = add i32 %567, 1
  store i32 %568, ptr %29, align 4
  br label %470, !llvm.loop !18

569:                                              ; preds = %470
  br label %570

570:                                              ; preds = %569
  %571 = load i32, ptr %27, align 4
  %572 = add i32 %571, 1
  store i32 %572, ptr %27, align 4
  br label %452, !llvm.loop !19

573:                                              ; preds = %452
  %574 = load i32, ptr %26, align 4
  store i32 %574, ptr %8, align 4
  store i32 1, ptr %9, align 4
  br label %575

575:                                              ; preds = %573, %389
  br label %576

576:                                              ; preds = %575, %331
  br label %1210

577:                                              ; preds = %147, %147
  %578 = load i32, ptr %6, align 4
  %579 = and i32 %578, 2
  %580 = icmp eq i32 %579, 0
  br i1 %580, label %581, label %723

581:                                              ; preds = %577
  %582 = load ptr, ptr %5, align 8
  call void @png_set_rgb_to_gray_fixed(ptr noundef %582, i32 noundef 1, i32 noundef -1, i32 noundef -1)
  store i32 1, ptr %10, align 4
  %583 = load ptr, ptr %5, align 8
  %584 = getelementptr inbounds %struct.png_struct_def, ptr %583, i32 0, i32 62
  %585 = load i8, ptr %584, align 1
  %586 = zext i8 %585 to i32
  %587 = icmp eq i32 %586, 6
  br i1 %587, label %594, label %588

588:                                              ; preds = %581
  %589 = load ptr, ptr %5, align 8
  %590 = getelementptr inbounds %struct.png_struct_def, ptr %589, i32 0, i32 56
  %591 = load i16, ptr %590, align 8
  %592 = zext i16 %591 to i32
  %593 = icmp sgt i32 %592, 0
  br i1 %593, label %594, label %608

594:                                              ; preds = %588, %581
  %595 = load i32, ptr %6, align 4
  %596 = and i32 %595, 1
  %597 = icmp ne i32 %596, 0
  br i1 %597, label %598, label %608

598:                                              ; preds = %594
  store i32 1, ptr %15, align 4
  %599 = load ptr, ptr %4, align 8
  %600 = getelementptr inbounds %struct.png_image, ptr %599, i32 0, i32 6
  %601 = load i32, ptr %600, align 4
  %602 = icmp ugt i32 256, %601
  br i1 %602, label %603, label %605

603:                                              ; preds = %598
  %604 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %604, ptr noundef @.str.37) #8
  unreachable

605:                                              ; preds = %598
  %606 = load ptr, ptr %3, align 8
  %607 = call i32 @make_ga_colormap(ptr noundef %606)
  store i32 %607, ptr %8, align 4
  store i32 231, ptr %11, align 4
  store i32 1, ptr %9, align 4
  br label %722

608:                                              ; preds = %594, %588
  %609 = load ptr, ptr %5, align 8
  %610 = call i32 @png_resolve_file_gamma(ptr noundef %609)
  store i32 %610, ptr %35, align 4
  %611 = load ptr, ptr %4, align 8
  %612 = getelementptr inbounds %struct.png_image, ptr %611, i32 0, i32 6
  %613 = load i32, ptr %612, align 4
  %614 = icmp ugt i32 256, %613
  br i1 %614, label %615, label %617

615:                                              ; preds = %608
  %616 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %616, ptr noundef @.str.38) #8
  unreachable

617:                                              ; preds = %608
  %618 = load ptr, ptr %5, align 8
  %619 = getelementptr inbounds %struct.png_struct_def, ptr %618, i32 0, i32 62
  %620 = load i8, ptr %619, align 1
  %621 = zext i8 %620 to i32
  %622 = icmp eq i32 %621, 6
  br i1 %622, label %629, label %623

623:                                              ; preds = %617
  %624 = load ptr, ptr %5, align 8
  %625 = getelementptr inbounds %struct.png_struct_def, ptr %624, i32 0, i32 56
  %626 = load i16, ptr %625, align 8
  %627 = zext i16 %626 to i32
  %628 = icmp sgt i32 %627, 0
  br i1 %628, label %629, label %636

629:                                              ; preds = %623, %617
  %630 = load i32, ptr %35, align 4
  %631 = call i32 @png_gamma_not_sRGB(i32 noundef %630)
  %632 = icmp ne i32 %631, 0
  br i1 %632, label %633, label %636

633:                                              ; preds = %629
  %634 = load ptr, ptr %3, align 8
  %635 = call i32 @make_gray_file_colormap(ptr noundef %634)
  store i32 %635, ptr %8, align 4
  store i32 3, ptr %10, align 4
  br label %639

636:                                              ; preds = %629, %623
  %637 = load ptr, ptr %3, align 8
  %638 = call i32 @make_gray_colormap(ptr noundef %637)
  store i32 %638, ptr %8, align 4
  br label %639

639:                                              ; preds = %636, %633
  %640 = load ptr, ptr %5, align 8
  %641 = getelementptr inbounds %struct.png_struct_def, ptr %640, i32 0, i32 62
  %642 = load i8, ptr %641, align 1
  %643 = zext i8 %642 to i32
  %644 = icmp eq i32 %643, 6
  br i1 %644, label %651, label %645

645:                                              ; preds = %639
  %646 = load ptr, ptr %5, align 8
  %647 = getelementptr inbounds %struct.png_struct_def, ptr %646, i32 0, i32 56
  %648 = load i16, ptr %647, align 8
  %649 = zext i16 %648 to i32
  %650 = icmp sgt i32 %649, 0
  br i1 %650, label %651, label %721

651:                                              ; preds = %645, %639
  %652 = load i32, ptr %13, align 4
  store i32 %652, ptr %37, align 4
  %653 = load i32, ptr %10, align 4
  %654 = icmp eq i32 %653, 3
  br i1 %654, label %655, label %678

655:                                              ; preds = %651
  %656 = load i32, ptr %7, align 4
  %657 = icmp eq i32 %656, 1
  br i1 %657, label %658, label %664

658:                                              ; preds = %655
  %659 = load i32, ptr %37, align 4
  %660 = zext i32 %659 to i64
  %661 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %660
  %662 = load i16, ptr %661, align 2
  %663 = zext i16 %662 to i32
  store i32 %663, ptr %37, align 4
  br label %664

664:                                              ; preds = %658, %655
  %665 = load i32, ptr %37, align 4
  %666 = load i32, ptr %35, align 4
  %667 = call zeroext i16 @png_gamma_16bit_correct(i32 noundef %665, i32 noundef %666)
  %668 = zext i16 %667 to i32
  %669 = mul i32 %668, 255
  %670 = add i32 %669, 32895
  %671 = lshr i32 %670, 16
  store i32 %671, ptr %37, align 4
  %672 = load ptr, ptr %3, align 8
  %673 = load i32, ptr %37, align 4
  %674 = load i32, ptr %13, align 4
  %675 = load i32, ptr %13, align 4
  %676 = load i32, ptr %13, align 4
  %677 = load i32, ptr %7, align 4
  call void @png_create_colormap_entry(ptr noundef %672, i32 noundef %673, i32 noundef %674, i32 noundef %675, i32 noundef %676, i32 noundef 0, i32 noundef %677)
  br label %712

678:                                              ; preds = %651
  %679 = load i32, ptr %7, align 4
  %680 = icmp eq i32 %679, 2
  br i1 %680, label %681, label %711

681:                                              ; preds = %678
  %682 = load i32, ptr %37, align 4
  %683 = mul i32 %682, 255
  %684 = lshr i32 %683, 15
  %685 = zext i32 %684 to i64
  %686 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %685
  %687 = load i16, ptr %686, align 2
  %688 = zext i16 %687 to i32
  %689 = load i32, ptr %37, align 4
  %690 = mul i32 %689, 255
  %691 = and i32 %690, 32767
  %692 = load i32, ptr %37, align 4
  %693 = mul i32 %692, 255
  %694 = lshr i32 %693, 15
  %695 = zext i32 %694 to i64
  %696 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %695
  %697 = load i8, ptr %696, align 1
  %698 = zext i8 %697 to i32
  %699 = mul i32 %691, %698
  %700 = lshr i32 %699, 12
  %701 = add i32 %688, %700
  %702 = lshr i32 %701, 8
  %703 = and i32 255, %702
  %704 = trunc i32 %703 to i8
  %705 = zext i8 %704 to i32
  store i32 %705, ptr %37, align 4
  %706 = load ptr, ptr %3, align 8
  %707 = load i32, ptr %37, align 4
  %708 = load i32, ptr %13, align 4
  %709 = load i32, ptr %13, align 4
  %710 = load i32, ptr %13, align 4
  call void @png_create_colormap_entry(ptr noundef %706, i32 noundef %707, i32 noundef %708, i32 noundef %709, i32 noundef %710, i32 noundef 0, i32 noundef 2)
  br label %711

711:                                              ; preds = %681, %678
  br label %712

712:                                              ; preds = %711, %664
  %713 = getelementptr inbounds %struct.png_color_16_struct, ptr %36, i32 0, i32 0
  store i8 0, ptr %713, align 2
  %714 = load i32, ptr %37, align 4
  %715 = trunc i32 %714 to i16
  %716 = getelementptr inbounds %struct.png_color_16_struct, ptr %36, i32 0, i32 3
  store i16 %715, ptr %716, align 2
  %717 = getelementptr inbounds %struct.png_color_16_struct, ptr %36, i32 0, i32 2
  store i16 %715, ptr %717, align 2
  %718 = getelementptr inbounds %struct.png_color_16_struct, ptr %36, i32 0, i32 1
  store i16 %715, ptr %718, align 2
  %719 = getelementptr inbounds %struct.png_color_16_struct, ptr %36, i32 0, i32 4
  store i16 %715, ptr %719, align 2
  store i32 1, ptr %15, align 4
  %720 = load ptr, ptr %5, align 8
  call void @png_set_background_fixed(ptr noundef %720, ptr noundef %36, i32 noundef 1, i32 noundef 0, i32 noundef 0)
  br label %721

721:                                              ; preds = %712, %645
  store i32 0, ptr %9, align 4
  br label %722

722:                                              ; preds = %721, %605
  br label %1002

723:                                              ; preds = %577
  store i32 1, ptr %10, align 4
  %724 = load ptr, ptr %5, align 8
  %725 = getelementptr inbounds %struct.png_struct_def, ptr %724, i32 0, i32 62
  %726 = load i8, ptr %725, align 1
  %727 = zext i8 %726 to i32
  %728 = icmp eq i32 %727, 6
  br i1 %728, label %735, label %729

729:                                              ; preds = %723
  %730 = load ptr, ptr %5, align 8
  %731 = getelementptr inbounds %struct.png_struct_def, ptr %730, i32 0, i32 56
  %732 = load i16, ptr %731, align 8
  %733 = zext i16 %732 to i32
  %734 = icmp sgt i32 %733, 0
  br i1 %734, label %735, label %991

735:                                              ; preds = %729, %723
  %736 = load i32, ptr %6, align 4
  %737 = and i32 %736, 1
  %738 = icmp ne i32 %737, 0
  br i1 %738, label %739, label %786

739:                                              ; preds = %735
  %740 = load ptr, ptr %4, align 8
  %741 = getelementptr inbounds %struct.png_image, ptr %740, i32 0, i32 6
  %742 = load i32, ptr %741, align 4
  %743 = icmp ugt i32 244, %742
  br i1 %743, label %744, label %746

744:                                              ; preds = %739
  %745 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %745, ptr noundef @.str.39) #8
  unreachable

746:                                              ; preds = %739
  %747 = load ptr, ptr %3, align 8
  %748 = call i32 @make_rgb_colormap(ptr noundef %747)
  store i32 %748, ptr %8, align 4
  %749 = load ptr, ptr %3, align 8
  %750 = load i32, ptr %8, align 4
  call void @png_create_colormap_entry(ptr noundef %749, i32 noundef %750, i32 noundef 255, i32 noundef 255, i32 noundef 255, i32 noundef 0, i32 noundef 1)
  %751 = load i32, ptr %8, align 4
  %752 = add i32 %751, 1
  store i32 %752, ptr %8, align 4
  store i32 %751, ptr %11, align 4
  store i32 0, ptr %38, align 4
  br label %753

753:                                              ; preds = %781, %746
  %754 = load i32, ptr %38, align 4
  %755 = icmp ult i32 %754, 256
  br i1 %755, label %756, label %785

756:                                              ; preds = %753
  store i32 0, ptr %39, align 4
  br label %757

757:                                              ; preds = %776, %756
  %758 = load i32, ptr %39, align 4
  %759 = icmp ult i32 %758, 256
  br i1 %759, label %760, label %780

760:                                              ; preds = %757
  store i32 0, ptr %40, align 4
  br label %761

761:                                              ; preds = %771, %760
  %762 = load i32, ptr %40, align 4
  %763 = icmp ult i32 %762, 256
  br i1 %763, label %764, label %775

764:                                              ; preds = %761
  %765 = load ptr, ptr %3, align 8
  %766 = load i32, ptr %8, align 4
  %767 = add i32 %766, 1
  store i32 %767, ptr %8, align 4
  %768 = load i32, ptr %38, align 4
  %769 = load i32, ptr %39, align 4
  %770 = load i32, ptr %40, align 4
  call void @png_create_colormap_entry(ptr noundef %765, i32 noundef %766, i32 noundef %768, i32 noundef %769, i32 noundef %770, i32 noundef 128, i32 noundef 1)
  br label %771

771:                                              ; preds = %764
  %772 = load i32, ptr %40, align 4
  %773 = shl i32 %772, 1
  %774 = or i32 %773, 127
  store i32 %774, ptr %40, align 4
  br label %761, !llvm.loop !20

775:                                              ; preds = %761
  br label %776

776:                                              ; preds = %775
  %777 = load i32, ptr %39, align 4
  %778 = shl i32 %777, 1
  %779 = or i32 %778, 127
  store i32 %779, ptr %39, align 4
  br label %757, !llvm.loop !21

780:                                              ; preds = %757
  br label %781

781:                                              ; preds = %780
  %782 = load i32, ptr %38, align 4
  %783 = shl i32 %782, 1
  %784 = or i32 %783, 127
  store i32 %784, ptr %38, align 4
  br label %753, !llvm.loop !22

785:                                              ; preds = %753
  store i32 1, ptr %15, align 4
  store i32 4, ptr %9, align 4
  br label %990

786:                                              ; preds = %735
  %787 = load i32, ptr %6, align 4
  %788 = and i32 %787, 3
  %789 = add i32 %788, 1
  %790 = load i32, ptr %6, align 4
  %791 = and i32 %790, 4
  %792 = lshr i32 %791, 2
  %793 = add i32 %792, 1
  %794 = mul i32 %789, %793
  store i32 %794, ptr %41, align 4
  %795 = load ptr, ptr %4, align 8
  %796 = getelementptr inbounds %struct.png_image, ptr %795, i32 0, i32 6
  %797 = load i32, ptr %796, align 4
  %798 = icmp ugt i32 244, %797
  br i1 %798, label %799, label %801

799:                                              ; preds = %786
  %800 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %800, ptr noundef @.str.40) #8
  unreachable

801:                                              ; preds = %786
  %802 = load ptr, ptr %3, align 8
  %803 = call i32 @make_rgb_colormap(ptr noundef %802)
  store i32 %803, ptr %8, align 4
  %804 = load ptr, ptr %3, align 8
  %805 = load i32, ptr %8, align 4
  %806 = load i32, ptr %12, align 4
  %807 = load i32, ptr %13, align 4
  %808 = load i32, ptr %14, align 4
  %809 = load i32, ptr %7, align 4
  call void @png_create_colormap_entry(ptr noundef %804, i32 noundef %805, i32 noundef %806, i32 noundef %807, i32 noundef %808, i32 noundef 0, i32 noundef %809)
  %810 = load i32, ptr %7, align 4
  %811 = icmp eq i32 %810, 2
  br i1 %811, label %812, label %885

812:                                              ; preds = %801
  %813 = load i32, ptr %12, align 4
  %814 = mul i32 %813, 255
  %815 = lshr i32 %814, 15
  %816 = zext i32 %815 to i64
  %817 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %816
  %818 = load i16, ptr %817, align 2
  %819 = zext i16 %818 to i32
  %820 = load i32, ptr %12, align 4
  %821 = mul i32 %820, 255
  %822 = and i32 %821, 32767
  %823 = load i32, ptr %12, align 4
  %824 = mul i32 %823, 255
  %825 = lshr i32 %824, 15
  %826 = zext i32 %825 to i64
  %827 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %826
  %828 = load i8, ptr %827, align 1
  %829 = zext i8 %828 to i32
  %830 = mul i32 %822, %829
  %831 = lshr i32 %830, 12
  %832 = add i32 %819, %831
  %833 = lshr i32 %832, 8
  %834 = and i32 255, %833
  %835 = trunc i32 %834 to i8
  %836 = zext i8 %835 to i32
  store i32 %836, ptr %42, align 4
  %837 = load i32, ptr %13, align 4
  %838 = mul i32 %837, 255
  %839 = lshr i32 %838, 15
  %840 = zext i32 %839 to i64
  %841 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %840
  %842 = load i16, ptr %841, align 2
  %843 = zext i16 %842 to i32
  %844 = load i32, ptr %13, align 4
  %845 = mul i32 %844, 255
  %846 = and i32 %845, 32767
  %847 = load i32, ptr %13, align 4
  %848 = mul i32 %847, 255
  %849 = lshr i32 %848, 15
  %850 = zext i32 %849 to i64
  %851 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %850
  %852 = load i8, ptr %851, align 1
  %853 = zext i8 %852 to i32
  %854 = mul i32 %846, %853
  %855 = lshr i32 %854, 12
  %856 = add i32 %843, %855
  %857 = lshr i32 %856, 8
  %858 = and i32 255, %857
  %859 = trunc i32 %858 to i8
  %860 = zext i8 %859 to i32
  store i32 %860, ptr %43, align 4
  %861 = load i32, ptr %14, align 4
  %862 = mul i32 %861, 255
  %863 = lshr i32 %862, 15
  %864 = zext i32 %863 to i64
  %865 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %864
  %866 = load i16, ptr %865, align 2
  %867 = zext i16 %866 to i32
  %868 = load i32, ptr %14, align 4
  %869 = mul i32 %868, 255
  %870 = and i32 %869, 32767
  %871 = load i32, ptr %14, align 4
  %872 = mul i32 %871, 255
  %873 = lshr i32 %872, 15
  %874 = zext i32 %873 to i64
  %875 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %874
  %876 = load i8, ptr %875, align 1
  %877 = zext i8 %876 to i32
  %878 = mul i32 %870, %877
  %879 = lshr i32 %878, 12
  %880 = add i32 %867, %879
  %881 = lshr i32 %880, 8
  %882 = and i32 255, %881
  %883 = trunc i32 %882 to i8
  %884 = zext i8 %883 to i32
  store i32 %884, ptr %44, align 4
  br label %889

885:                                              ; preds = %801
  %886 = load i32, ptr %12, align 4
  store i32 %886, ptr %42, align 4
  %887 = load i32, ptr %13, align 4
  store i32 %887, ptr %43, align 4
  %888 = load i32, ptr %13, align 4
  store i32 %888, ptr %44, align 4
  br label %889

889:                                              ; preds = %885, %812
  %890 = load ptr, ptr %3, align 8
  %891 = getelementptr inbounds %struct.png_image_read_control, ptr %890, i32 0, i32 3
  %892 = load ptr, ptr %891, align 8
  %893 = load i32, ptr %41, align 4
  %894 = load i32, ptr %8, align 4
  %895 = mul i32 %893, %894
  %896 = zext i32 %895 to i64
  %897 = getelementptr inbounds i8, ptr %892, i64 %896
  %898 = load ptr, ptr %3, align 8
  %899 = getelementptr inbounds %struct.png_image_read_control, ptr %898, i32 0, i32 3
  %900 = load ptr, ptr %899, align 8
  %901 = load i32, ptr %41, align 4
  %902 = load i32, ptr %42, align 4
  %903 = mul i32 %902, 5
  %904 = add i32 %903, 130
  %905 = lshr i32 %904, 8
  %906 = mul i32 6, %905
  %907 = load i32, ptr %43, align 4
  %908 = mul i32 %907, 5
  %909 = add i32 %908, 130
  %910 = lshr i32 %909, 8
  %911 = add i32 %906, %910
  %912 = mul i32 6, %911
  %913 = load i32, ptr %44, align 4
  %914 = mul i32 %913, 5
  %915 = add i32 %914, 130
  %916 = lshr i32 %915, 8
  %917 = add i32 %912, %916
  %918 = trunc i32 %917 to i8
  %919 = zext i8 %918 to i32
  %920 = mul i32 %901, %919
  %921 = zext i32 %920 to i64
  %922 = getelementptr inbounds i8, ptr %900, i64 %921
  %923 = load i32, ptr %41, align 4
  %924 = zext i32 %923 to i64
  %925 = call i32 @memcmp(ptr noundef %897, ptr noundef %922, i64 noundef %924) #11
  %926 = icmp ne i32 %925, 0
  br i1 %926, label %927, label %976

927:                                              ; preds = %889
  %928 = load i32, ptr %8, align 4
  %929 = add i32 %928, 1
  store i32 %929, ptr %8, align 4
  store i32 %928, ptr %11, align 4
  store i32 0, ptr %42, align 4
  br label %930

930:                                              ; preds = %971, %927
  %931 = load i32, ptr %42, align 4
  %932 = icmp ult i32 %931, 256
  br i1 %932, label %933, label %975

933:                                              ; preds = %930
  store i32 0, ptr %43, align 4
  br label %934

934:                                              ; preds = %966, %933
  %935 = load i32, ptr %43, align 4
  %936 = icmp ult i32 %935, 256
  br i1 %936, label %937, label %970

937:                                              ; preds = %934
  store i32 0, ptr %44, align 4
  br label %938

938:                                              ; preds = %961, %937
  %939 = load i32, ptr %44, align 4
  %940 = icmp ult i32 %939, 256
  br i1 %940, label %941, label %965

941:                                              ; preds = %938
  %942 = load ptr, ptr %3, align 8
  %943 = load i32, ptr %8, align 4
  %944 = add i32 %943, 1
  store i32 %944, ptr %8, align 4
  %945 = load ptr, ptr %3, align 8
  %946 = load i32, ptr %42, align 4
  %947 = load i32, ptr %12, align 4
  %948 = load i32, ptr %7, align 4
  %949 = call i32 @png_colormap_compose(ptr noundef %945, i32 noundef %946, i32 noundef 1, i32 noundef 128, i32 noundef %947, i32 noundef %948)
  %950 = load ptr, ptr %3, align 8
  %951 = load i32, ptr %43, align 4
  %952 = load i32, ptr %13, align 4
  %953 = load i32, ptr %7, align 4
  %954 = call i32 @png_colormap_compose(ptr noundef %950, i32 noundef %951, i32 noundef 1, i32 noundef 128, i32 noundef %952, i32 noundef %953)
  %955 = load ptr, ptr %3, align 8
  %956 = load i32, ptr %44, align 4
  %957 = load i32, ptr %14, align 4
  %958 = load i32, ptr %7, align 4
  %959 = call i32 @png_colormap_compose(ptr noundef %955, i32 noundef %956, i32 noundef 1, i32 noundef 128, i32 noundef %957, i32 noundef %958)
  %960 = load i32, ptr %7, align 4
  call void @png_create_colormap_entry(ptr noundef %942, i32 noundef %943, i32 noundef %949, i32 noundef %954, i32 noundef %959, i32 noundef 0, i32 noundef %960)
  br label %961

961:                                              ; preds = %941
  %962 = load i32, ptr %44, align 4
  %963 = shl i32 %962, 1
  %964 = or i32 %963, 127
  store i32 %964, ptr %44, align 4
  br label %938, !llvm.loop !23

965:                                              ; preds = %938
  br label %966

966:                                              ; preds = %965
  %967 = load i32, ptr %43, align 4
  %968 = shl i32 %967, 1
  %969 = or i32 %968, 127
  store i32 %969, ptr %43, align 4
  br label %934, !llvm.loop !24

970:                                              ; preds = %934
  br label %971

971:                                              ; preds = %970
  %972 = load i32, ptr %42, align 4
  %973 = shl i32 %972, 1
  %974 = or i32 %973, 127
  store i32 %974, ptr %42, align 4
  br label %930, !llvm.loop !25

975:                                              ; preds = %930
  store i32 1, ptr %15, align 4
  store i32 4, ptr %9, align 4
  br label %989

976:                                              ; preds = %889
  %977 = getelementptr inbounds %struct.png_color_16_struct, ptr %45, i32 0, i32 0
  store i8 0, ptr %977, align 2
  %978 = load i32, ptr %12, align 4
  %979 = trunc i32 %978 to i16
  %980 = getelementptr inbounds %struct.png_color_16_struct, ptr %45, i32 0, i32 1
  store i16 %979, ptr %980, align 2
  %981 = load i32, ptr %13, align 4
  %982 = trunc i32 %981 to i16
  %983 = getelementptr inbounds %struct.png_color_16_struct, ptr %45, i32 0, i32 2
  store i16 %982, ptr %983, align 2
  %984 = getelementptr inbounds %struct.png_color_16_struct, ptr %45, i32 0, i32 4
  store i16 %982, ptr %984, align 2
  %985 = load i32, ptr %14, align 4
  %986 = trunc i32 %985 to i16
  %987 = getelementptr inbounds %struct.png_color_16_struct, ptr %45, i32 0, i32 3
  store i16 %986, ptr %987, align 2
  %988 = load ptr, ptr %5, align 8
  call void @png_set_background_fixed(ptr noundef %988, ptr noundef %45, i32 noundef 1, i32 noundef 0, i32 noundef 0)
  store i32 3, ptr %9, align 4
  br label %989

989:                                              ; preds = %976, %975
  br label %990

990:                                              ; preds = %989, %785
  br label %1001

991:                                              ; preds = %729
  %992 = load ptr, ptr %4, align 8
  %993 = getelementptr inbounds %struct.png_image, ptr %992, i32 0, i32 6
  %994 = load i32, ptr %993, align 4
  %995 = icmp ugt i32 216, %994
  br i1 %995, label %996, label %998

996:                                              ; preds = %991
  %997 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %997, ptr noundef @.str.41) #8
  unreachable

998:                                              ; preds = %991
  %999 = load ptr, ptr %3, align 8
  %1000 = call i32 @make_rgb_colormap(ptr noundef %999)
  store i32 %1000, ptr %8, align 4
  store i32 3, ptr %9, align 4
  br label %1001

1001:                                             ; preds = %998, %990
  br label %1002

1002:                                             ; preds = %1001, %722
  br label %1210

1003:                                             ; preds = %147
  %1004 = load ptr, ptr %5, align 8
  %1005 = getelementptr inbounds %struct.png_struct_def, ptr %1004, i32 0, i32 56
  %1006 = load i16, ptr %1005, align 8
  %1007 = zext i16 %1006 to i32
  store i32 %1007, ptr %46, align 4
  %1008 = load i32, ptr %46, align 4
  %1009 = icmp ugt i32 %1008, 0
  br i1 %1009, label %1010, label %1014

1010:                                             ; preds = %1003
  %1011 = load ptr, ptr %5, align 8
  %1012 = getelementptr inbounds %struct.png_struct_def, ptr %1011, i32 0, i32 94
  %1013 = load ptr, ptr %1012, align 8
  br label %1015

1014:                                             ; preds = %1003
  br label %1015

1015:                                             ; preds = %1014, %1010
  %1016 = phi ptr [ %1013, %1010 ], [ null, %1014 ]
  store ptr %1016, ptr %47, align 8
  %1017 = load ptr, ptr %5, align 8
  %1018 = getelementptr inbounds %struct.png_struct_def, ptr %1017, i32 0, i32 53
  %1019 = load ptr, ptr %1018, align 8
  store ptr %1019, ptr %48, align 8
  %1020 = load ptr, ptr %47, align 8
  %1021 = icmp ne ptr %1020, null
  br i1 %1021, label %1022, label %1026

1022:                                             ; preds = %1015
  %1023 = load i32, ptr %6, align 4
  %1024 = and i32 %1023, 1
  %1025 = icmp eq i32 %1024, 0
  br label %1026

1026:                                             ; preds = %1022, %1015
  %1027 = phi i1 [ false, %1015 ], [ %1025, %1022 ]
  %1028 = zext i1 %1027 to i32
  store i32 %1028, ptr %49, align 4
  %1029 = load ptr, ptr %47, align 8
  %1030 = icmp eq ptr %1029, null
  br i1 %1030, label %1031, label %1032

1031:                                             ; preds = %1026
  store i32 0, ptr %46, align 4
  br label %1032

1032:                                             ; preds = %1031, %1026
  store i32 0, ptr %9, align 4
  store i32 3, ptr %10, align 4
  %1033 = load ptr, ptr %5, align 8
  %1034 = getelementptr inbounds %struct.png_struct_def, ptr %1033, i32 0, i32 54
  %1035 = load i16, ptr %1034, align 8
  %1036 = zext i16 %1035 to i32
  store i32 %1036, ptr %8, align 4
  %1037 = load i32, ptr %8, align 4
  %1038 = icmp ugt i32 %1037, 256
  br i1 %1038, label %1039, label %1040

1039:                                             ; preds = %1032
  store i32 256, ptr %8, align 4
  br label %1040

1040:                                             ; preds = %1039, %1032
  %1041 = load i32, ptr %8, align 4
  %1042 = load ptr, ptr %4, align 8
  %1043 = getelementptr inbounds %struct.png_image, ptr %1042, i32 0, i32 6
  %1044 = load i32, ptr %1043, align 4
  %1045 = icmp ugt i32 %1041, %1044
  br i1 %1045, label %1046, label %1048

1046:                                             ; preds = %1040
  %1047 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %1047, ptr noundef @.str.42) #8
  unreachable

1048:                                             ; preds = %1040
  store i32 0, ptr %50, align 4
  br label %1049

1049:                                             ; preds = %1196, %1048
  %1050 = load i32, ptr %50, align 4
  %1051 = load i32, ptr %8, align 4
  %1052 = icmp ult i32 %1050, %1051
  br i1 %1052, label %1053, label %1199

1053:                                             ; preds = %1049
  %1054 = load i32, ptr %49, align 4
  %1055 = icmp ne i32 %1054, 0
  br i1 %1055, label %1056, label %1158

1056:                                             ; preds = %1053
  %1057 = load i32, ptr %50, align 4
  %1058 = load i32, ptr %46, align 4
  %1059 = icmp ult i32 %1057, %1058
  br i1 %1059, label %1060, label %1158

1060:                                             ; preds = %1056
  %1061 = load ptr, ptr %47, align 8
  %1062 = load i32, ptr %50, align 4
  %1063 = zext i32 %1062 to i64
  %1064 = getelementptr inbounds i8, ptr %1061, i64 %1063
  %1065 = load i8, ptr %1064, align 1
  %1066 = zext i8 %1065 to i32
  %1067 = icmp slt i32 %1066, 255
  br i1 %1067, label %1068, label %1158

1068:                                             ; preds = %1060
  %1069 = load ptr, ptr %47, align 8
  %1070 = load i32, ptr %50, align 4
  %1071 = zext i32 %1070 to i64
  %1072 = getelementptr inbounds i8, ptr %1069, i64 %1071
  %1073 = load i8, ptr %1072, align 1
  %1074 = zext i8 %1073 to i32
  %1075 = icmp eq i32 %1074, 0
  br i1 %1075, label %1076, label %1083

1076:                                             ; preds = %1068
  %1077 = load ptr, ptr %3, align 8
  %1078 = load i32, ptr %50, align 4
  %1079 = load i32, ptr %12, align 4
  %1080 = load i32, ptr %13, align 4
  %1081 = load i32, ptr %14, align 4
  %1082 = load i32, ptr %7, align 4
  call void @png_create_colormap_entry(ptr noundef %1077, i32 noundef %1078, i32 noundef %1079, i32 noundef %1080, i32 noundef %1081, i32 noundef 0, i32 noundef %1082)
  br label %1157

1083:                                             ; preds = %1068
  %1084 = load ptr, ptr %3, align 8
  %1085 = load i32, ptr %50, align 4
  %1086 = load ptr, ptr %3, align 8
  %1087 = load ptr, ptr %48, align 8
  %1088 = load i32, ptr %50, align 4
  %1089 = zext i32 %1088 to i64
  %1090 = getelementptr inbounds %struct.png_color_struct, ptr %1087, i64 %1089
  %1091 = getelementptr inbounds %struct.png_color_struct, ptr %1090, i32 0, i32 0
  %1092 = load i8, ptr %1091, align 1
  %1093 = zext i8 %1092 to i32
  %1094 = load ptr, ptr %47, align 8
  %1095 = load i32, ptr %50, align 4
  %1096 = zext i32 %1095 to i64
  %1097 = getelementptr inbounds i8, ptr %1094, i64 %1096
  %1098 = load i8, ptr %1097, align 1
  %1099 = zext i8 %1098 to i32
  %1100 = load i32, ptr %12, align 4
  %1101 = load i32, ptr %7, align 4
  %1102 = call i32 @png_colormap_compose(ptr noundef %1086, i32 noundef %1093, i32 noundef 3, i32 noundef %1099, i32 noundef %1100, i32 noundef %1101)
  %1103 = load ptr, ptr %3, align 8
  %1104 = load ptr, ptr %48, align 8
  %1105 = load i32, ptr %50, align 4
  %1106 = zext i32 %1105 to i64
  %1107 = getelementptr inbounds %struct.png_color_struct, ptr %1104, i64 %1106
  %1108 = getelementptr inbounds %struct.png_color_struct, ptr %1107, i32 0, i32 1
  %1109 = load i8, ptr %1108, align 1
  %1110 = zext i8 %1109 to i32
  %1111 = load ptr, ptr %47, align 8
  %1112 = load i32, ptr %50, align 4
  %1113 = zext i32 %1112 to i64
  %1114 = getelementptr inbounds i8, ptr %1111, i64 %1113
  %1115 = load i8, ptr %1114, align 1
  %1116 = zext i8 %1115 to i32
  %1117 = load i32, ptr %13, align 4
  %1118 = load i32, ptr %7, align 4
  %1119 = call i32 @png_colormap_compose(ptr noundef %1103, i32 noundef %1110, i32 noundef 3, i32 noundef %1116, i32 noundef %1117, i32 noundef %1118)
  %1120 = load ptr, ptr %3, align 8
  %1121 = load ptr, ptr %48, align 8
  %1122 = load i32, ptr %50, align 4
  %1123 = zext i32 %1122 to i64
  %1124 = getelementptr inbounds %struct.png_color_struct, ptr %1121, i64 %1123
  %1125 = getelementptr inbounds %struct.png_color_struct, ptr %1124, i32 0, i32 2
  %1126 = load i8, ptr %1125, align 1
  %1127 = zext i8 %1126 to i32
  %1128 = load ptr, ptr %47, align 8
  %1129 = load i32, ptr %50, align 4
  %1130 = zext i32 %1129 to i64
  %1131 = getelementptr inbounds i8, ptr %1128, i64 %1130
  %1132 = load i8, ptr %1131, align 1
  %1133 = zext i8 %1132 to i32
  %1134 = load i32, ptr %14, align 4
  %1135 = load i32, ptr %7, align 4
  %1136 = call i32 @png_colormap_compose(ptr noundef %1120, i32 noundef %1127, i32 noundef 3, i32 noundef %1133, i32 noundef %1134, i32 noundef %1135)
  %1137 = load i32, ptr %7, align 4
  %1138 = icmp eq i32 %1137, 2
  br i1 %1138, label %1139, label %1147

1139:                                             ; preds = %1083
  %1140 = load ptr, ptr %47, align 8
  %1141 = load i32, ptr %50, align 4
  %1142 = zext i32 %1141 to i64
  %1143 = getelementptr inbounds i8, ptr %1140, i64 %1142
  %1144 = load i8, ptr %1143, align 1
  %1145 = zext i8 %1144 to i32
  %1146 = mul i32 %1145, 257
  br label %1154

1147:                                             ; preds = %1083
  %1148 = load ptr, ptr %47, align 8
  %1149 = load i32, ptr %50, align 4
  %1150 = zext i32 %1149 to i64
  %1151 = getelementptr inbounds i8, ptr %1148, i64 %1150
  %1152 = load i8, ptr %1151, align 1
  %1153 = zext i8 %1152 to i32
  br label %1154

1154:                                             ; preds = %1147, %1139
  %1155 = phi i32 [ %1146, %1139 ], [ %1153, %1147 ]
  %1156 = load i32, ptr %7, align 4
  call void @png_create_colormap_entry(ptr noundef %1084, i32 noundef %1085, i32 noundef %1102, i32 noundef %1119, i32 noundef %1136, i32 noundef %1155, i32 noundef %1156)
  br label %1157

1157:                                             ; preds = %1154, %1076
  br label %1195

1158:                                             ; preds = %1060, %1056, %1053
  %1159 = load ptr, ptr %3, align 8
  %1160 = load i32, ptr %50, align 4
  %1161 = load ptr, ptr %48, align 8
  %1162 = load i32, ptr %50, align 4
  %1163 = zext i32 %1162 to i64
  %1164 = getelementptr inbounds %struct.png_color_struct, ptr %1161, i64 %1163
  %1165 = getelementptr inbounds %struct.png_color_struct, ptr %1164, i32 0, i32 0
  %1166 = load i8, ptr %1165, align 1
  %1167 = zext i8 %1166 to i32
  %1168 = load ptr, ptr %48, align 8
  %1169 = load i32, ptr %50, align 4
  %1170 = zext i32 %1169 to i64
  %1171 = getelementptr inbounds %struct.png_color_struct, ptr %1168, i64 %1170
  %1172 = getelementptr inbounds %struct.png_color_struct, ptr %1171, i32 0, i32 1
  %1173 = load i8, ptr %1172, align 1
  %1174 = zext i8 %1173 to i32
  %1175 = load ptr, ptr %48, align 8
  %1176 = load i32, ptr %50, align 4
  %1177 = zext i32 %1176 to i64
  %1178 = getelementptr inbounds %struct.png_color_struct, ptr %1175, i64 %1177
  %1179 = getelementptr inbounds %struct.png_color_struct, ptr %1178, i32 0, i32 2
  %1180 = load i8, ptr %1179, align 1
  %1181 = zext i8 %1180 to i32
  %1182 = load i32, ptr %50, align 4
  %1183 = load i32, ptr %46, align 4
  %1184 = icmp ult i32 %1182, %1183
  br i1 %1184, label %1185, label %1192

1185:                                             ; preds = %1158
  %1186 = load ptr, ptr %47, align 8
  %1187 = load i32, ptr %50, align 4
  %1188 = zext i32 %1187 to i64
  %1189 = getelementptr inbounds i8, ptr %1186, i64 %1188
  %1190 = load i8, ptr %1189, align 1
  %1191 = zext i8 %1190 to i32
  br label %1193

1192:                                             ; preds = %1158
  br label %1193

1193:                                             ; preds = %1192, %1185
  %1194 = phi i32 [ %1191, %1185 ], [ 255, %1192 ]
  call void @png_create_colormap_entry(ptr noundef %1159, i32 noundef %1160, i32 noundef %1167, i32 noundef %1174, i32 noundef %1181, i32 noundef %1194, i32 noundef 3)
  br label %1195

1195:                                             ; preds = %1193, %1157
  br label %1196

1196:                                             ; preds = %1195
  %1197 = load i32, ptr %50, align 4
  %1198 = add i32 %1197, 1
  store i32 %1198, ptr %50, align 4
  br label %1049, !llvm.loop !26

1199:                                             ; preds = %1049
  %1200 = load ptr, ptr %5, align 8
  %1201 = getelementptr inbounds %struct.png_struct_def, ptr %1200, i32 0, i32 63
  %1202 = load i8, ptr %1201, align 8
  %1203 = zext i8 %1202 to i32
  %1204 = icmp slt i32 %1203, 8
  br i1 %1204, label %1205, label %1207

1205:                                             ; preds = %1199
  %1206 = load ptr, ptr %5, align 8
  call void @png_set_packing(ptr noundef %1206)
  br label %1207

1207:                                             ; preds = %1205, %1199
  br label %1210

1208:                                             ; preds = %147
  %1209 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %1209, ptr noundef @.str.43) #8
  unreachable

1210:                                             ; preds = %1207, %1002, %576, %319, %296
  %1211 = load i32, ptr %15, align 4
  %1212 = icmp ne i32 %1211, 0
  br i1 %1212, label %1213, label %1228

1213:                                             ; preds = %1210
  %1214 = load ptr, ptr %5, align 8
  %1215 = getelementptr inbounds %struct.png_struct_def, ptr %1214, i32 0, i32 56
  %1216 = load i16, ptr %1215, align 8
  %1217 = zext i16 %1216 to i32
  %1218 = icmp sgt i32 %1217, 0
  br i1 %1218, label %1219, label %1228

1219:                                             ; preds = %1213
  %1220 = load ptr, ptr %5, align 8
  %1221 = getelementptr inbounds %struct.png_struct_def, ptr %1220, i32 0, i32 62
  %1222 = load i8, ptr %1221, align 1
  %1223 = zext i8 %1222 to i32
  %1224 = and i32 %1223, 4
  %1225 = icmp eq i32 %1224, 0
  br i1 %1225, label %1226, label %1228

1226:                                             ; preds = %1219
  %1227 = load ptr, ptr %5, align 8
  call void @png_set_tRNS_to_alpha(ptr noundef %1227)
  br label %1228

1228:                                             ; preds = %1226, %1219, %1213, %1210
  %1229 = load i32, ptr %10, align 4
  switch i32 %1229, label %1241 [
    i32 1, label %1230
    i32 3, label %1232
  ]

1230:                                             ; preds = %1228
  %1231 = load ptr, ptr %5, align 8
  call void @png_set_alpha_mode_fixed(ptr noundef %1231, i32 noundef 0, i32 noundef 220000)
  br label %1232

1232:                                             ; preds = %1228, %1230
  %1233 = load ptr, ptr %5, align 8
  %1234 = getelementptr inbounds %struct.png_struct_def, ptr %1233, i32 0, i32 63
  %1235 = load i8, ptr %1234, align 8
  %1236 = zext i8 %1235 to i32
  %1237 = icmp sgt i32 %1236, 8
  br i1 %1237, label %1238, label %1240

1238:                                             ; preds = %1232
  %1239 = load ptr, ptr %5, align 8
  call void @png_set_scale_16(ptr noundef %1239)
  br label %1240

1240:                                             ; preds = %1238, %1232
  br label %1243

1241:                                             ; preds = %1228
  %1242 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %1242, ptr noundef @.str.44) #8
  unreachable

1243:                                             ; preds = %1240
  %1244 = load i32, ptr %8, align 4
  %1245 = icmp ugt i32 %1244, 256
  br i1 %1245, label %1252, label %1246

1246:                                             ; preds = %1243
  %1247 = load i32, ptr %8, align 4
  %1248 = load ptr, ptr %4, align 8
  %1249 = getelementptr inbounds %struct.png_image, ptr %1248, i32 0, i32 6
  %1250 = load i32, ptr %1249, align 4
  %1251 = icmp ugt i32 %1247, %1250
  br i1 %1251, label %1252, label %1254

1252:                                             ; preds = %1246, %1243
  %1253 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %1253, ptr noundef @.str.45) #8
  unreachable

1254:                                             ; preds = %1246
  %1255 = load i32, ptr %8, align 4
  %1256 = load ptr, ptr %4, align 8
  %1257 = getelementptr inbounds %struct.png_image, ptr %1256, i32 0, i32 6
  store i32 %1255, ptr %1257, align 4
  %1258 = load i32, ptr %9, align 4
  switch i32 %1258, label %1288 [
    i32 0, label %1259
    i32 1, label %1264
    i32 2, label %1269
    i32 3, label %1278
    i32 4, label %1283
  ]

1259:                                             ; preds = %1254
  %1260 = load i32, ptr %11, align 4
  %1261 = icmp ne i32 %1260, 256
  br i1 %1261, label %1262, label %1263

1262:                                             ; preds = %1259
  br label %1290

1263:                                             ; preds = %1259
  br label %1292

1264:                                             ; preds = %1254
  %1265 = load i32, ptr %11, align 4
  %1266 = icmp ne i32 %1265, 231
  br i1 %1266, label %1267, label %1268

1267:                                             ; preds = %1264
  br label %1290

1268:                                             ; preds = %1264
  br label %1292

1269:                                             ; preds = %1254
  %1270 = load i32, ptr %11, align 4
  %1271 = load i32, ptr %8, align 4
  %1272 = icmp uge i32 %1270, %1271
  br i1 %1272, label %1276, label %1273

1273:                                             ; preds = %1269
  %1274 = load i32, ptr %11, align 4
  %1275 = icmp ne i32 %1274, 254
  br i1 %1275, label %1276, label %1277

1276:                                             ; preds = %1273, %1269
  br label %1290

1277:                                             ; preds = %1273
  br label %1292

1278:                                             ; preds = %1254
  %1279 = load i32, ptr %11, align 4
  %1280 = icmp ne i32 %1279, 256
  br i1 %1280, label %1281, label %1282

1281:                                             ; preds = %1278
  br label %1290

1282:                                             ; preds = %1278
  br label %1292

1283:                                             ; preds = %1254
  %1284 = load i32, ptr %11, align 4
  %1285 = icmp ne i32 %1284, 216
  br i1 %1285, label %1286, label %1287

1286:                                             ; preds = %1283
  br label %1290

1287:                                             ; preds = %1283
  br label %1292

1288:                                             ; preds = %1254
  %1289 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %1289, ptr noundef @.str.46) #8
  unreachable

1290:                                             ; preds = %1286, %1281, %1276, %1267, %1262
  %1291 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %1291, ptr noundef @.str.47) #8
  unreachable

1292:                                             ; preds = %1287, %1282, %1277, %1268, %1263
  %1293 = load i32, ptr %9, align 4
  %1294 = load ptr, ptr %3, align 8
  %1295 = getelementptr inbounds %struct.png_image_read_control, ptr %1294, i32 0, i32 10
  store i32 %1293, ptr %1295, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_read_colormapped(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca i64, align 8
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %18 = load ptr, ptr %3, align 8
  store ptr %18, ptr %4, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.png_image_read_control, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %5, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds %struct.png_image, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %6, align 8
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds %struct.png_control, ptr %25, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %7, align 8
  %28 = load ptr, ptr %6, align 8
  %29 = getelementptr inbounds %struct.png_control, ptr %28, i32 0, i32 1
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %8, align 8
  store i32 0, ptr %9, align 4
  %31 = load ptr, ptr %7, align 8
  call void @png_image_skip_unused_chunks(ptr noundef %31)
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds %struct.png_image_read_control, ptr %32, i32 0, i32 10
  %34 = load i32, ptr %33, align 8
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %39

36:                                               ; preds = %1
  %37 = load ptr, ptr %7, align 8
  %38 = call i32 @png_set_interlace_handling(ptr noundef %37)
  store i32 %38, ptr %9, align 4
  br label %39

39:                                               ; preds = %36, %1
  %40 = load ptr, ptr %7, align 8
  %41 = load ptr, ptr %8, align 8
  call void @png_read_update_info(ptr noundef %40, ptr noundef %41)
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds %struct.png_image_read_control, ptr %42, i32 0, i32 10
  %44 = load i32, ptr %43, align 8
  switch i32 %44, label %137 [
    i32 0, label %45
    i32 2, label %65
    i32 1, label %65
    i32 3, label %89
    i32 4, label %113
  ]

45:                                               ; preds = %39
  %46 = load ptr, ptr %8, align 8
  %47 = getelementptr inbounds %struct.png_info_def, ptr %46, i32 0, i32 8
  %48 = load i8, ptr %47, align 1
  %49 = zext i8 %48 to i32
  %50 = icmp eq i32 %49, 3
  br i1 %50, label %57, label %51

51:                                               ; preds = %45
  %52 = load ptr, ptr %8, align 8
  %53 = getelementptr inbounds %struct.png_info_def, ptr %52, i32 0, i32 8
  %54 = load i8, ptr %53, align 1
  %55 = zext i8 %54 to i32
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %64

57:                                               ; preds = %51, %45
  %58 = load ptr, ptr %8, align 8
  %59 = getelementptr inbounds %struct.png_info_def, ptr %58, i32 0, i32 7
  %60 = load i8, ptr %59, align 4
  %61 = zext i8 %60 to i32
  %62 = icmp eq i32 %61, 8
  br i1 %62, label %63, label %64

63:                                               ; preds = %57
  br label %140

64:                                               ; preds = %57, %51
  br label %138

65:                                               ; preds = %39, %39
  %66 = load ptr, ptr %8, align 8
  %67 = getelementptr inbounds %struct.png_info_def, ptr %66, i32 0, i32 8
  %68 = load i8, ptr %67, align 1
  %69 = zext i8 %68 to i32
  %70 = icmp eq i32 %69, 4
  br i1 %70, label %71, label %88

71:                                               ; preds = %65
  %72 = load ptr, ptr %8, align 8
  %73 = getelementptr inbounds %struct.png_info_def, ptr %72, i32 0, i32 7
  %74 = load i8, ptr %73, align 4
  %75 = zext i8 %74 to i32
  %76 = icmp eq i32 %75, 8
  br i1 %76, label %77, label %88

77:                                               ; preds = %71
  %78 = load ptr, ptr %7, align 8
  %79 = getelementptr inbounds %struct.png_struct_def, ptr %78, i32 0, i32 82
  %80 = load i32, ptr %79, align 4
  %81 = icmp eq i32 %80, 220000
  br i1 %81, label %82, label %88

82:                                               ; preds = %77
  %83 = load ptr, ptr %5, align 8
  %84 = getelementptr inbounds %struct.png_image, ptr %83, i32 0, i32 6
  %85 = load i32, ptr %84, align 4
  %86 = icmp eq i32 %85, 256
  br i1 %86, label %87, label %88

87:                                               ; preds = %82
  br label %140

88:                                               ; preds = %82, %77, %71, %65
  br label %138

89:                                               ; preds = %39
  %90 = load ptr, ptr %8, align 8
  %91 = getelementptr inbounds %struct.png_info_def, ptr %90, i32 0, i32 8
  %92 = load i8, ptr %91, align 1
  %93 = zext i8 %92 to i32
  %94 = icmp eq i32 %93, 2
  br i1 %94, label %95, label %112

95:                                               ; preds = %89
  %96 = load ptr, ptr %8, align 8
  %97 = getelementptr inbounds %struct.png_info_def, ptr %96, i32 0, i32 7
  %98 = load i8, ptr %97, align 4
  %99 = zext i8 %98 to i32
  %100 = icmp eq i32 %99, 8
  br i1 %100, label %101, label %112

101:                                              ; preds = %95
  %102 = load ptr, ptr %7, align 8
  %103 = getelementptr inbounds %struct.png_struct_def, ptr %102, i32 0, i32 82
  %104 = load i32, ptr %103, align 4
  %105 = icmp eq i32 %104, 220000
  br i1 %105, label %106, label %112

106:                                              ; preds = %101
  %107 = load ptr, ptr %5, align 8
  %108 = getelementptr inbounds %struct.png_image, ptr %107, i32 0, i32 6
  %109 = load i32, ptr %108, align 4
  %110 = icmp eq i32 %109, 216
  br i1 %110, label %111, label %112

111:                                              ; preds = %106
  br label %140

112:                                              ; preds = %106, %101, %95, %89
  br label %138

113:                                              ; preds = %39
  %114 = load ptr, ptr %8, align 8
  %115 = getelementptr inbounds %struct.png_info_def, ptr %114, i32 0, i32 8
  %116 = load i8, ptr %115, align 1
  %117 = zext i8 %116 to i32
  %118 = icmp eq i32 %117, 6
  br i1 %118, label %119, label %136

119:                                              ; preds = %113
  %120 = load ptr, ptr %8, align 8
  %121 = getelementptr inbounds %struct.png_info_def, ptr %120, i32 0, i32 7
  %122 = load i8, ptr %121, align 4
  %123 = zext i8 %122 to i32
  %124 = icmp eq i32 %123, 8
  br i1 %124, label %125, label %136

125:                                              ; preds = %119
  %126 = load ptr, ptr %7, align 8
  %127 = getelementptr inbounds %struct.png_struct_def, ptr %126, i32 0, i32 82
  %128 = load i32, ptr %127, align 4
  %129 = icmp eq i32 %128, 220000
  br i1 %129, label %130, label %136

130:                                              ; preds = %125
  %131 = load ptr, ptr %5, align 8
  %132 = getelementptr inbounds %struct.png_image, ptr %131, i32 0, i32 6
  %133 = load i32, ptr %132, align 4
  %134 = icmp eq i32 %133, 244
  br i1 %134, label %135, label %136

135:                                              ; preds = %130
  br label %140

136:                                              ; preds = %130, %125, %119, %113
  br label %138

137:                                              ; preds = %39
  br label %138

138:                                              ; preds = %137, %136, %112, %88, %64
  %139 = load ptr, ptr %7, align 8
  call void @png_error(ptr noundef %139, ptr noundef @.str.52) #8
  unreachable

140:                                              ; preds = %135, %111, %87, %63
  %141 = load ptr, ptr %4, align 8
  %142 = getelementptr inbounds %struct.png_image_read_control, ptr %141, i32 0, i32 1
  %143 = load ptr, ptr %142, align 8
  store ptr %143, ptr %10, align 8
  %144 = load ptr, ptr %4, align 8
  %145 = getelementptr inbounds %struct.png_image_read_control, ptr %144, i32 0, i32 2
  %146 = load i32, ptr %145, align 8
  %147 = sext i32 %146 to i64
  store i64 %147, ptr %11, align 8
  %148 = load i64, ptr %11, align 8
  %149 = icmp slt i64 %148, 0
  br i1 %149, label %150, label %163

150:                                              ; preds = %140
  %151 = load ptr, ptr %10, align 8
  store ptr %151, ptr %12, align 8
  %152 = load ptr, ptr %5, align 8
  %153 = getelementptr inbounds %struct.png_image, ptr %152, i32 0, i32 3
  %154 = load i32, ptr %153, align 8
  %155 = sub i32 %154, 1
  %156 = zext i32 %155 to i64
  %157 = load i64, ptr %11, align 8
  %158 = sub nsw i64 0, %157
  %159 = mul nsw i64 %156, %158
  %160 = load ptr, ptr %12, align 8
  %161 = getelementptr inbounds i8, ptr %160, i64 %159
  store ptr %161, ptr %12, align 8
  %162 = load ptr, ptr %12, align 8
  store ptr %162, ptr %10, align 8
  br label %163

163:                                              ; preds = %150, %140
  %164 = load ptr, ptr %10, align 8
  %165 = load ptr, ptr %4, align 8
  %166 = getelementptr inbounds %struct.png_image_read_control, ptr %165, i32 0, i32 6
  store ptr %164, ptr %166, align 8
  %167 = load i64, ptr %11, align 8
  %168 = load ptr, ptr %4, align 8
  %169 = getelementptr inbounds %struct.png_image_read_control, ptr %168, i32 0, i32 7
  store i64 %167, ptr %169, align 8
  %170 = load i32, ptr %9, align 4
  %171 = icmp eq i32 %170, 0
  br i1 %171, label %172, label %189

172:                                              ; preds = %163
  %173 = load ptr, ptr %7, align 8
  %174 = load ptr, ptr %7, align 8
  %175 = load ptr, ptr %8, align 8
  %176 = call i64 @png_get_rowbytes(ptr noundef %174, ptr noundef %175)
  %177 = call noalias ptr @png_malloc(ptr noundef %173, i64 noundef %176)
  store ptr %177, ptr %14, align 8
  %178 = load ptr, ptr %14, align 8
  %179 = load ptr, ptr %4, align 8
  %180 = getelementptr inbounds %struct.png_image_read_control, ptr %179, i32 0, i32 5
  store ptr %178, ptr %180, align 8
  %181 = load ptr, ptr %5, align 8
  %182 = load ptr, ptr %4, align 8
  %183 = call i32 @png_safe_execute(ptr noundef %181, ptr noundef @png_image_read_and_map, ptr noundef %182)
  store i32 %183, ptr %13, align 4
  %184 = load ptr, ptr %4, align 8
  %185 = getelementptr inbounds %struct.png_image_read_control, ptr %184, i32 0, i32 5
  store ptr null, ptr %185, align 8
  %186 = load ptr, ptr %7, align 8
  %187 = load ptr, ptr %14, align 8
  call void @png_free(ptr noundef %186, ptr noundef %187)
  %188 = load i32, ptr %13, align 4
  store i32 %188, ptr %2, align 4
  br label %218

189:                                              ; preds = %163
  %190 = load ptr, ptr %4, align 8
  %191 = getelementptr inbounds %struct.png_image_read_control, ptr %190, i32 0, i32 7
  %192 = load i64, ptr %191, align 8
  store i64 %192, ptr %15, align 8
  br label %193

193:                                              ; preds = %216, %189
  %194 = load i32, ptr %9, align 4
  %195 = add nsw i32 %194, -1
  store i32 %195, ptr %9, align 4
  %196 = icmp sge i32 %195, 0
  br i1 %196, label %197, label %217

197:                                              ; preds = %193
  %198 = load ptr, ptr %5, align 8
  %199 = getelementptr inbounds %struct.png_image, ptr %198, i32 0, i32 3
  %200 = load i32, ptr %199, align 8
  store i32 %200, ptr %16, align 4
  %201 = load ptr, ptr %4, align 8
  %202 = getelementptr inbounds %struct.png_image_read_control, ptr %201, i32 0, i32 6
  %203 = load ptr, ptr %202, align 8
  store ptr %203, ptr %17, align 8
  br label %204

204:                                              ; preds = %213, %197
  %205 = load i32, ptr %16, align 4
  %206 = icmp ugt i32 %205, 0
  br i1 %206, label %207, label %216

207:                                              ; preds = %204
  %208 = load ptr, ptr %7, align 8
  %209 = load ptr, ptr %17, align 8
  call void @png_read_row(ptr noundef %208, ptr noundef %209, ptr noundef null)
  %210 = load i64, ptr %15, align 8
  %211 = load ptr, ptr %17, align 8
  %212 = getelementptr inbounds i8, ptr %211, i64 %210
  store ptr %212, ptr %17, align 8
  br label %213

213:                                              ; preds = %207
  %214 = load i32, ptr %16, align 4
  %215 = add i32 %214, -1
  store i32 %215, ptr %16, align 4
  br label %204, !llvm.loop !27

216:                                              ; preds = %204
  br label %193, !llvm.loop !28

217:                                              ; preds = %193
  store i32 1, ptr %2, align 4
  br label %218

218:                                              ; preds = %217, %172
  %219 = load i32, ptr %2, align 4
  ret i32 %219
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_read_direct(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
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
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca %struct.png_color_16_struct, align 2
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i16, align 2
  %23 = alloca i32, align 4
  %24 = alloca ptr, align 8
  %25 = alloca i64, align 8
  %26 = alloca ptr, align 8
  %27 = alloca i32, align 4
  %28 = alloca ptr, align 8
  %29 = alloca i32, align 4
  %30 = alloca ptr, align 8
  %31 = alloca i64, align 8
  %32 = alloca i32, align 4
  %33 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %34 = load ptr, ptr %3, align 8
  store ptr %34, ptr %4, align 8
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds %struct.png_image_read_control, ptr %35, i32 0, i32 0
  %37 = load ptr, ptr %36, align 8
  store ptr %37, ptr %5, align 8
  %38 = load ptr, ptr %5, align 8
  %39 = getelementptr inbounds %struct.png_image, ptr %38, i32 0, i32 0
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds %struct.png_control, ptr %40, i32 0, i32 0
  %42 = load ptr, ptr %41, align 8
  store ptr %42, ptr %6, align 8
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds %struct.png_image, ptr %43, i32 0, i32 0
  %45 = load ptr, ptr %44, align 8
  %46 = getelementptr inbounds %struct.png_control, ptr %45, i32 0, i32 1
  %47 = load ptr, ptr %46, align 8
  store ptr %47, ptr %7, align 8
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds %struct.png_image, ptr %48, i32 0, i32 4
  %50 = load i32, ptr %49, align 4
  store i32 %50, ptr %8, align 4
  %51 = load i32, ptr %8, align 4
  %52 = and i32 %51, 4
  %53 = icmp ne i32 %52, 0
  %54 = zext i1 %53 to i32
  store i32 %54, ptr %9, align 4
  store i32 0, ptr %10, align 4
  store i32 0, ptr %11, align 4
  store i32 0, ptr %12, align 4
  %55 = load ptr, ptr %6, align 8
  call void @png_set_expand(ptr noundef %55)
  %56 = load ptr, ptr %6, align 8
  %57 = call i32 @png_image_format(ptr noundef %56)
  %58 = and i32 %57, -9
  store i32 %58, ptr %13, align 4
  %59 = load i32, ptr %8, align 4
  %60 = load i32, ptr %13, align 4
  %61 = xor i32 %59, %60
  store i32 %61, ptr %14, align 4
  %62 = load i32, ptr %14, align 4
  %63 = and i32 %62, 2
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %81

65:                                               ; preds = %1
  %66 = load i32, ptr %8, align 4
  %67 = and i32 %66, 2
  %68 = icmp ne i32 %67, 0
  br i1 %68, label %69, label %71

69:                                               ; preds = %65
  %70 = load ptr, ptr %6, align 8
  call void @png_set_gray_to_rgb(ptr noundef %70)
  br label %78

71:                                               ; preds = %65
  %72 = load i32, ptr %13, align 4
  %73 = and i32 %72, 1
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %76

75:                                               ; preds = %71
  store i32 1, ptr %11, align 4
  br label %76

76:                                               ; preds = %75, %71
  %77 = load ptr, ptr %6, align 8
  call void @png_set_rgb_to_gray_fixed(ptr noundef %77, i32 noundef 1, i32 noundef -1, i32 noundef -1)
  br label %78

78:                                               ; preds = %76, %69
  %79 = load i32, ptr %14, align 4
  %80 = and i32 %79, -3
  store i32 %80, ptr %14, align 4
  br label %81

81:                                               ; preds = %78, %1
  %82 = load i32, ptr %13, align 4
  %83 = and i32 %82, 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %85, label %92

85:                                               ; preds = %81
  %86 = load ptr, ptr %5, align 8
  %87 = getelementptr inbounds %struct.png_image, ptr %86, i32 0, i32 5
  %88 = load i32, ptr %87, align 8
  %89 = and i32 %88, 4
  %90 = icmp eq i32 %89, 0
  br i1 %90, label %91, label %92

91:                                               ; preds = %85
  store i32 100000, ptr %17, align 4
  br label %93

92:                                               ; preds = %85, %81
  store i32 -1, ptr %17, align 4
  br label %93

93:                                               ; preds = %92, %91
  %94 = load ptr, ptr %6, align 8
  %95 = load i32, ptr %17, align 4
  call void @png_set_alpha_mode_fixed(ptr noundef %94, i32 noundef 0, i32 noundef %95)
  %96 = load i32, ptr %9, align 4
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %105

98:                                               ; preds = %93
  %99 = load i32, ptr %13, align 4
  %100 = and i32 %99, 1
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %102, label %103

102:                                              ; preds = %98
  store i32 1, ptr %16, align 4
  br label %104

103:                                              ; preds = %98
  store i32 0, ptr %16, align 4
  br label %104

104:                                              ; preds = %103, %102
  store i32 100000, ptr %15, align 4
  br label %106

105:                                              ; preds = %93
  store i32 0, ptr %16, align 4
  store i32 -1, ptr %15, align 4
  br label %106

106:                                              ; preds = %105, %104
  %107 = load i32, ptr %14, align 4
  %108 = and i32 %107, 64
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %113

110:                                              ; preds = %106
  store i32 2, ptr %16, align 4
  %111 = load i32, ptr %14, align 4
  %112 = and i32 %111, -65
  store i32 %112, ptr %14, align 4
  br label %113

113:                                              ; preds = %110, %106
  %114 = load i32, ptr %11, align 4
  %115 = icmp ne i32 %114, 0
  br i1 %115, label %116, label %133

116:                                              ; preds = %113
  %117 = load i32, ptr %15, align 4
  %118 = load ptr, ptr %6, align 8
  %119 = call i32 @png_resolve_file_gamma(ptr noundef %118)
  %120 = call i32 @png_muldiv(ptr noundef %18, i32 noundef %117, i32 noundef %119, i32 noundef 100000)
  %121 = icmp ne i32 %120, 0
  br i1 %121, label %122, label %127

122:                                              ; preds = %116
  %123 = load i32, ptr %18, align 4
  %124 = call i32 @png_gamma_significant(i32 noundef %123)
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %126, label %127

126:                                              ; preds = %122
  store i32 0, ptr %11, align 4
  br label %132

127:                                              ; preds = %122, %116
  %128 = load i32, ptr %16, align 4
  %129 = icmp eq i32 %128, 1
  br i1 %129, label %130, label %131

130:                                              ; preds = %127
  store i32 2, ptr %11, align 4
  store i32 0, ptr %16, align 4
  br label %131

131:                                              ; preds = %130, %127
  br label %132

132:                                              ; preds = %131, %126
  br label %133

133:                                              ; preds = %132, %113
  %134 = load i32, ptr %14, align 4
  %135 = and i32 %134, 4
  %136 = icmp ne i32 %135, 0
  br i1 %136, label %137, label %147

137:                                              ; preds = %133
  %138 = load i32, ptr %9, align 4
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %140, label %142

140:                                              ; preds = %137
  %141 = load ptr, ptr %6, align 8
  call void @png_set_expand_16(ptr noundef %141)
  br label %144

142:                                              ; preds = %137
  %143 = load ptr, ptr %6, align 8
  call void @png_set_scale_16(ptr noundef %143)
  br label %144

144:                                              ; preds = %142, %140
  %145 = load i32, ptr %14, align 4
  %146 = and i32 %145, -5
  store i32 %146, ptr %14, align 4
  br label %147

147:                                              ; preds = %144, %133
  %148 = load i32, ptr %14, align 4
  %149 = and i32 %148, 1
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %151, label %224

151:                                              ; preds = %147
  %152 = load i32, ptr %13, align 4
  %153 = and i32 %152, 1
  %154 = icmp ne i32 %153, 0
  br i1 %154, label %155, label %204

155:                                              ; preds = %151
  %156 = load i32, ptr %11, align 4
  %157 = icmp ne i32 %156, 0
  br i1 %157, label %158, label %159

158:                                              ; preds = %155
  store i32 2, ptr %11, align 4
  br label %203

159:                                              ; preds = %155
  %160 = load i32, ptr %9, align 4
  %161 = icmp ne i32 %160, 0
  br i1 %161, label %162, label %164

162:                                              ; preds = %159
  %163 = load ptr, ptr %6, align 8
  call void @png_set_strip_alpha(ptr noundef %163)
  br label %202

164:                                              ; preds = %159
  %165 = load ptr, ptr %4, align 8
  %166 = getelementptr inbounds %struct.png_image_read_control, ptr %165, i32 0, i32 4
  %167 = load ptr, ptr %166, align 8
  %168 = icmp ne ptr %167, null
  br i1 %168, label %169, label %200

169:                                              ; preds = %164
  %170 = getelementptr inbounds %struct.png_color_16_struct, ptr %19, i32 0, i32 0
  store i8 0, ptr %170, align 2
  %171 = load ptr, ptr %4, align 8
  %172 = getelementptr inbounds %struct.png_image_read_control, ptr %171, i32 0, i32 4
  %173 = load ptr, ptr %172, align 8
  %174 = getelementptr inbounds %struct.png_color_struct, ptr %173, i32 0, i32 0
  %175 = load i8, ptr %174, align 1
  %176 = zext i8 %175 to i16
  %177 = getelementptr inbounds %struct.png_color_16_struct, ptr %19, i32 0, i32 1
  store i16 %176, ptr %177, align 2
  %178 = load ptr, ptr %4, align 8
  %179 = getelementptr inbounds %struct.png_image_read_control, ptr %178, i32 0, i32 4
  %180 = load ptr, ptr %179, align 8
  %181 = getelementptr inbounds %struct.png_color_struct, ptr %180, i32 0, i32 1
  %182 = load i8, ptr %181, align 1
  %183 = zext i8 %182 to i16
  %184 = getelementptr inbounds %struct.png_color_16_struct, ptr %19, i32 0, i32 2
  store i16 %183, ptr %184, align 2
  %185 = load ptr, ptr %4, align 8
  %186 = getelementptr inbounds %struct.png_image_read_control, ptr %185, i32 0, i32 4
  %187 = load ptr, ptr %186, align 8
  %188 = getelementptr inbounds %struct.png_color_struct, ptr %187, i32 0, i32 2
  %189 = load i8, ptr %188, align 1
  %190 = zext i8 %189 to i16
  %191 = getelementptr inbounds %struct.png_color_16_struct, ptr %19, i32 0, i32 3
  store i16 %190, ptr %191, align 2
  %192 = load ptr, ptr %4, align 8
  %193 = getelementptr inbounds %struct.png_image_read_control, ptr %192, i32 0, i32 4
  %194 = load ptr, ptr %193, align 8
  %195 = getelementptr inbounds %struct.png_color_struct, ptr %194, i32 0, i32 1
  %196 = load i8, ptr %195, align 1
  %197 = zext i8 %196 to i16
  %198 = getelementptr inbounds %struct.png_color_16_struct, ptr %19, i32 0, i32 4
  store i16 %197, ptr %198, align 2
  %199 = load ptr, ptr %6, align 8
  call void @png_set_background_fixed(ptr noundef %199, ptr noundef %19, i32 noundef 1, i32 noundef 0, i32 noundef 0)
  br label %201

200:                                              ; preds = %164
  store i32 1, ptr %10, align 4
  store i32 2, ptr %16, align 4
  br label %201

201:                                              ; preds = %200, %169
  br label %202

202:                                              ; preds = %201, %162
  br label %203

203:                                              ; preds = %202, %158
  br label %221

204:                                              ; preds = %151
  %205 = load i32, ptr %9, align 4
  %206 = icmp ne i32 %205, 0
  br i1 %206, label %207, label %208

207:                                              ; preds = %204
  store i32 65535, ptr %20, align 4
  br label %209

208:                                              ; preds = %204
  store i32 255, ptr %20, align 4
  br label %209

209:                                              ; preds = %208, %207
  %210 = load i32, ptr %8, align 4
  %211 = and i32 %210, 32
  %212 = icmp ne i32 %211, 0
  br i1 %212, label %213, label %216

213:                                              ; preds = %209
  store i32 0, ptr %21, align 4
  %214 = load i32, ptr %14, align 4
  %215 = and i32 %214, -33
  store i32 %215, ptr %14, align 4
  br label %217

216:                                              ; preds = %209
  store i32 1, ptr %21, align 4
  br label %217

217:                                              ; preds = %216, %213
  %218 = load ptr, ptr %6, align 8
  %219 = load i32, ptr %20, align 4
  %220 = load i32, ptr %21, align 4
  call void @png_set_add_alpha(ptr noundef %218, i32 noundef %219, i32 noundef %220)
  br label %221

221:                                              ; preds = %217, %203
  %222 = load i32, ptr %14, align 4
  %223 = and i32 %222, -2
  store i32 %223, ptr %14, align 4
  br label %224

224:                                              ; preds = %221, %147
  %225 = load ptr, ptr %6, align 8
  %226 = load i32, ptr %16, align 4
  %227 = load i32, ptr %15, align 4
  call void @png_set_alpha_mode_fixed(ptr noundef %225, i32 noundef %226, i32 noundef %227)
  %228 = load i32, ptr %14, align 4
  %229 = and i32 %228, 16
  %230 = icmp ne i32 %229, 0
  br i1 %230, label %231, label %243

231:                                              ; preds = %224
  %232 = load i32, ptr %8, align 4
  %233 = and i32 %232, 2
  %234 = icmp ne i32 %233, 0
  br i1 %234, label %235, label %237

235:                                              ; preds = %231
  %236 = load ptr, ptr %6, align 8
  call void @png_set_bgr(ptr noundef %236)
  br label %240

237:                                              ; preds = %231
  %238 = load i32, ptr %8, align 4
  %239 = and i32 %238, -17
  store i32 %239, ptr %8, align 4
  br label %240

240:                                              ; preds = %237, %235
  %241 = load i32, ptr %14, align 4
  %242 = and i32 %241, -17
  store i32 %242, ptr %14, align 4
  br label %243

243:                                              ; preds = %240, %224
  %244 = load i32, ptr %14, align 4
  %245 = and i32 %244, 32
  %246 = icmp ne i32 %245, 0
  br i1 %246, label %247, label %263

247:                                              ; preds = %243
  %248 = load i32, ptr %8, align 4
  %249 = and i32 %248, 1
  %250 = icmp ne i32 %249, 0
  br i1 %250, label %251, label %257

251:                                              ; preds = %247
  %252 = load i32, ptr %11, align 4
  %253 = icmp ne i32 %252, 2
  br i1 %253, label %254, label %256

254:                                              ; preds = %251
  %255 = load ptr, ptr %6, align 8
  call void @png_set_swap_alpha(ptr noundef %255)
  br label %256

256:                                              ; preds = %254, %251
  br label %260

257:                                              ; preds = %247
  %258 = load i32, ptr %8, align 4
  %259 = and i32 %258, -33
  store i32 %259, ptr %8, align 4
  br label %260

260:                                              ; preds = %257, %256
  %261 = load i32, ptr %14, align 4
  %262 = and i32 %261, -33
  store i32 %262, ptr %14, align 4
  br label %263

263:                                              ; preds = %260, %243
  %264 = load i32, ptr %9, align 4
  %265 = icmp ne i32 %264, 0
  br i1 %265, label %266, label %273

266:                                              ; preds = %263
  store i16 1, ptr %22, align 2
  %267 = load i8, ptr %22, align 2
  %268 = zext i8 %267 to i32
  %269 = icmp ne i32 %268, 0
  br i1 %269, label %270, label %272

270:                                              ; preds = %266
  %271 = load ptr, ptr %6, align 8
  call void @png_set_swap(ptr noundef %271)
  br label %272

272:                                              ; preds = %270, %266
  br label %273

273:                                              ; preds = %272, %263
  %274 = load i32, ptr %14, align 4
  %275 = icmp ne i32 %274, 0
  br i1 %275, label %276, label %278

276:                                              ; preds = %273
  %277 = load ptr, ptr %6, align 8
  call void @png_error(ptr noundef %277, ptr noundef @.str.54) #8
  unreachable

278:                                              ; preds = %273
  %279 = load ptr, ptr %6, align 8
  call void @png_image_skip_unused_chunks(ptr noundef %279)
  %280 = load i32, ptr %10, align 4
  %281 = icmp eq i32 %280, 0
  br i1 %281, label %282, label %288

282:                                              ; preds = %278
  %283 = load i32, ptr %11, align 4
  %284 = icmp ne i32 %283, 2
  br i1 %284, label %285, label %288

285:                                              ; preds = %282
  %286 = load ptr, ptr %6, align 8
  %287 = call i32 @png_set_interlace_handling(ptr noundef %286)
  store i32 %287, ptr %12, align 4
  br label %288

288:                                              ; preds = %285, %282, %278
  %289 = load ptr, ptr %6, align 8
  %290 = load ptr, ptr %7, align 8
  call void @png_read_update_info(ptr noundef %289, ptr noundef %290)
  store i32 0, ptr %23, align 4
  %291 = load ptr, ptr %7, align 8
  %292 = getelementptr inbounds %struct.png_info_def, ptr %291, i32 0, i32 8
  %293 = load i8, ptr %292, align 1
  %294 = zext i8 %293 to i32
  %295 = and i32 %294, 2
  %296 = icmp ne i32 %295, 0
  br i1 %296, label %297, label %300

297:                                              ; preds = %288
  %298 = load i32, ptr %23, align 4
  %299 = or i32 %298, 2
  store i32 %299, ptr %23, align 4
  br label %300

300:                                              ; preds = %297, %288
  %301 = load ptr, ptr %7, align 8
  %302 = getelementptr inbounds %struct.png_info_def, ptr %301, i32 0, i32 8
  %303 = load i8, ptr %302, align 1
  %304 = zext i8 %303 to i32
  %305 = and i32 %304, 4
  %306 = icmp ne i32 %305, 0
  br i1 %306, label %307, label %322

307:                                              ; preds = %300
  %308 = load i32, ptr %10, align 4
  %309 = icmp eq i32 %308, 0
  br i1 %309, label %310, label %321

310:                                              ; preds = %307
  %311 = load i32, ptr %11, align 4
  %312 = icmp ne i32 %311, 2
  br i1 %312, label %317, label %313

313:                                              ; preds = %310
  %314 = load i32, ptr %8, align 4
  %315 = and i32 %314, 1
  %316 = icmp ne i32 %315, 0
  br i1 %316, label %317, label %320

317:                                              ; preds = %313, %310
  %318 = load i32, ptr %23, align 4
  %319 = or i32 %318, 1
  store i32 %319, ptr %23, align 4
  br label %320

320:                                              ; preds = %317, %313
  br label %321

321:                                              ; preds = %320, %307
  br label %328

322:                                              ; preds = %300
  %323 = load i32, ptr %10, align 4
  %324 = icmp ne i32 %323, 0
  br i1 %324, label %325, label %327

325:                                              ; preds = %322
  %326 = load ptr, ptr %6, align 8
  call void @png_error(ptr noundef %326, ptr noundef @.str.55) #8
  unreachable

327:                                              ; preds = %322
  br label %328

328:                                              ; preds = %327, %321
  %329 = load i32, ptr %8, align 4
  %330 = and i32 %329, 64
  %331 = icmp ne i32 %330, 0
  br i1 %331, label %332, label %335

332:                                              ; preds = %328
  %333 = load i32, ptr %23, align 4
  %334 = or i32 %333, 64
  store i32 %334, ptr %23, align 4
  br label %335

335:                                              ; preds = %332, %328
  %336 = load ptr, ptr %7, align 8
  %337 = getelementptr inbounds %struct.png_info_def, ptr %336, i32 0, i32 7
  %338 = load i8, ptr %337, align 4
  %339 = zext i8 %338 to i32
  %340 = icmp eq i32 %339, 16
  br i1 %340, label %341, label %344

341:                                              ; preds = %335
  %342 = load i32, ptr %23, align 4
  %343 = or i32 %342, 4
  store i32 %343, ptr %23, align 4
  br label %344

344:                                              ; preds = %341, %335
  %345 = load ptr, ptr %6, align 8
  %346 = getelementptr inbounds %struct.png_struct_def, ptr %345, i32 0, i32 17
  %347 = load i32, ptr %346, align 4
  %348 = and i32 %347, 1
  %349 = icmp ne i32 %348, 0
  br i1 %349, label %350, label %353

350:                                              ; preds = %344
  %351 = load i32, ptr %23, align 4
  %352 = or i32 %351, 16
  store i32 %352, ptr %23, align 4
  br label %353

353:                                              ; preds = %350, %344
  %354 = load i32, ptr %11, align 4
  %355 = icmp eq i32 %354, 2
  br i1 %355, label %356, label %364

356:                                              ; preds = %353
  %357 = load i32, ptr %8, align 4
  %358 = and i32 %357, 32
  %359 = icmp ne i32 %358, 0
  br i1 %359, label %360, label %363

360:                                              ; preds = %356
  %361 = load i32, ptr %23, align 4
  %362 = or i32 %361, 32
  store i32 %362, ptr %23, align 4
  br label %363

363:                                              ; preds = %360, %356
  br label %364

364:                                              ; preds = %363, %353
  %365 = load ptr, ptr %6, align 8
  %366 = getelementptr inbounds %struct.png_struct_def, ptr %365, i32 0, i32 17
  %367 = load i32, ptr %366, align 4
  %368 = and i32 %367, 131072
  %369 = icmp ne i32 %368, 0
  br i1 %369, label %382, label %370

370:                                              ; preds = %364
  %371 = load ptr, ptr %6, align 8
  %372 = getelementptr inbounds %struct.png_struct_def, ptr %371, i32 0, i32 17
  %373 = load i32, ptr %372, align 4
  %374 = and i32 %373, 16777216
  %375 = icmp ne i32 %374, 0
  br i1 %375, label %376, label %390

376:                                              ; preds = %370
  %377 = load ptr, ptr %6, align 8
  %378 = getelementptr inbounds %struct.png_struct_def, ptr %377, i32 0, i32 16
  %379 = load i32, ptr %378, align 8
  %380 = and i32 %379, 128
  %381 = icmp eq i32 %380, 0
  br i1 %381, label %382, label %390

382:                                              ; preds = %376, %364
  %383 = load i32, ptr %11, align 4
  %384 = icmp eq i32 %383, 2
  br i1 %384, label %385, label %387

385:                                              ; preds = %382
  %386 = load ptr, ptr %6, align 8
  call void @png_error(ptr noundef %386, ptr noundef @.str.56) #8
  unreachable

387:                                              ; preds = %382
  %388 = load i32, ptr %23, align 4
  %389 = or i32 %388, 32
  store i32 %389, ptr %23, align 4
  br label %390

390:                                              ; preds = %387, %376, %370
  %391 = load i32, ptr %23, align 4
  %392 = load i32, ptr %8, align 4
  %393 = icmp ne i32 %391, %392
  br i1 %393, label %394, label %396

394:                                              ; preds = %390
  %395 = load ptr, ptr %6, align 8
  call void @png_error(ptr noundef %395, ptr noundef @.str.57) #8
  unreachable

396:                                              ; preds = %390
  %397 = load ptr, ptr %4, align 8
  %398 = getelementptr inbounds %struct.png_image_read_control, ptr %397, i32 0, i32 1
  %399 = load ptr, ptr %398, align 8
  store ptr %399, ptr %24, align 8
  %400 = load ptr, ptr %4, align 8
  %401 = getelementptr inbounds %struct.png_image_read_control, ptr %400, i32 0, i32 2
  %402 = load i32, ptr %401, align 8
  %403 = sext i32 %402 to i64
  store i64 %403, ptr %25, align 8
  %404 = load i32, ptr %9, align 4
  %405 = icmp ne i32 %404, 0
  br i1 %405, label %406, label %409

406:                                              ; preds = %396
  %407 = load i64, ptr %25, align 8
  %408 = mul nsw i64 %407, 2
  store i64 %408, ptr %25, align 8
  br label %409

409:                                              ; preds = %406, %396
  %410 = load i64, ptr %25, align 8
  %411 = icmp slt i64 %410, 0
  br i1 %411, label %412, label %425

412:                                              ; preds = %409
  %413 = load ptr, ptr %24, align 8
  store ptr %413, ptr %26, align 8
  %414 = load ptr, ptr %5, align 8
  %415 = getelementptr inbounds %struct.png_image, ptr %414, i32 0, i32 3
  %416 = load i32, ptr %415, align 8
  %417 = sub i32 %416, 1
  %418 = zext i32 %417 to i64
  %419 = load i64, ptr %25, align 8
  %420 = sub nsw i64 0, %419
  %421 = mul nsw i64 %418, %420
  %422 = load ptr, ptr %26, align 8
  %423 = getelementptr inbounds i8, ptr %422, i64 %421
  store ptr %423, ptr %26, align 8
  %424 = load ptr, ptr %26, align 8
  store ptr %424, ptr %24, align 8
  br label %425

425:                                              ; preds = %412, %409
  %426 = load ptr, ptr %24, align 8
  %427 = load ptr, ptr %4, align 8
  %428 = getelementptr inbounds %struct.png_image_read_control, ptr %427, i32 0, i32 6
  store ptr %426, ptr %428, align 8
  %429 = load i64, ptr %25, align 8
  %430 = load ptr, ptr %4, align 8
  %431 = getelementptr inbounds %struct.png_image_read_control, ptr %430, i32 0, i32 7
  store i64 %429, ptr %431, align 8
  %432 = load i32, ptr %10, align 4
  %433 = icmp ne i32 %432, 0
  br i1 %433, label %434, label %451

434:                                              ; preds = %425
  %435 = load ptr, ptr %6, align 8
  %436 = load ptr, ptr %6, align 8
  %437 = load ptr, ptr %7, align 8
  %438 = call i64 @png_get_rowbytes(ptr noundef %436, ptr noundef %437)
  %439 = call noalias ptr @png_malloc(ptr noundef %435, i64 noundef %438)
  store ptr %439, ptr %28, align 8
  %440 = load ptr, ptr %28, align 8
  %441 = load ptr, ptr %4, align 8
  %442 = getelementptr inbounds %struct.png_image_read_control, ptr %441, i32 0, i32 5
  store ptr %440, ptr %442, align 8
  %443 = load ptr, ptr %5, align 8
  %444 = load ptr, ptr %4, align 8
  %445 = call i32 @png_safe_execute(ptr noundef %443, ptr noundef @png_image_read_composite, ptr noundef %444)
  store i32 %445, ptr %27, align 4
  %446 = load ptr, ptr %4, align 8
  %447 = getelementptr inbounds %struct.png_image_read_control, ptr %446, i32 0, i32 5
  store ptr null, ptr %447, align 8
  %448 = load ptr, ptr %6, align 8
  %449 = load ptr, ptr %28, align 8
  call void @png_free(ptr noundef %448, ptr noundef %449)
  %450 = load i32, ptr %27, align 4
  store i32 %450, ptr %2, align 4
  br label %500

451:                                              ; preds = %425
  %452 = load i32, ptr %11, align 4
  %453 = icmp eq i32 %452, 2
  br i1 %453, label %454, label %471

454:                                              ; preds = %451
  %455 = load ptr, ptr %6, align 8
  %456 = load ptr, ptr %6, align 8
  %457 = load ptr, ptr %7, align 8
  %458 = call i64 @png_get_rowbytes(ptr noundef %456, ptr noundef %457)
  %459 = call noalias ptr @png_malloc(ptr noundef %455, i64 noundef %458)
  store ptr %459, ptr %30, align 8
  %460 = load ptr, ptr %30, align 8
  %461 = load ptr, ptr %4, align 8
  %462 = getelementptr inbounds %struct.png_image_read_control, ptr %461, i32 0, i32 5
  store ptr %460, ptr %462, align 8
  %463 = load ptr, ptr %5, align 8
  %464 = load ptr, ptr %4, align 8
  %465 = call i32 @png_safe_execute(ptr noundef %463, ptr noundef @png_image_read_background, ptr noundef %464)
  store i32 %465, ptr %29, align 4
  %466 = load ptr, ptr %4, align 8
  %467 = getelementptr inbounds %struct.png_image_read_control, ptr %466, i32 0, i32 5
  store ptr null, ptr %467, align 8
  %468 = load ptr, ptr %6, align 8
  %469 = load ptr, ptr %30, align 8
  call void @png_free(ptr noundef %468, ptr noundef %469)
  %470 = load i32, ptr %29, align 4
  store i32 %470, ptr %2, align 4
  br label %500

471:                                              ; preds = %451
  %472 = load ptr, ptr %4, align 8
  %473 = getelementptr inbounds %struct.png_image_read_control, ptr %472, i32 0, i32 7
  %474 = load i64, ptr %473, align 8
  store i64 %474, ptr %31, align 8
  br label %475

475:                                              ; preds = %498, %471
  %476 = load i32, ptr %12, align 4
  %477 = add nsw i32 %476, -1
  store i32 %477, ptr %12, align 4
  %478 = icmp sge i32 %477, 0
  br i1 %478, label %479, label %499

479:                                              ; preds = %475
  %480 = load ptr, ptr %5, align 8
  %481 = getelementptr inbounds %struct.png_image, ptr %480, i32 0, i32 3
  %482 = load i32, ptr %481, align 8
  store i32 %482, ptr %32, align 4
  %483 = load ptr, ptr %4, align 8
  %484 = getelementptr inbounds %struct.png_image_read_control, ptr %483, i32 0, i32 6
  %485 = load ptr, ptr %484, align 8
  store ptr %485, ptr %33, align 8
  br label %486

486:                                              ; preds = %495, %479
  %487 = load i32, ptr %32, align 4
  %488 = icmp ugt i32 %487, 0
  br i1 %488, label %489, label %498

489:                                              ; preds = %486
  %490 = load ptr, ptr %6, align 8
  %491 = load ptr, ptr %33, align 8
  call void @png_read_row(ptr noundef %490, ptr noundef %491, ptr noundef null)
  %492 = load i64, ptr %31, align 8
  %493 = load ptr, ptr %33, align 8
  %494 = getelementptr inbounds i8, ptr %493, i64 %492
  store ptr %494, ptr %33, align 8
  br label %495

495:                                              ; preds = %489
  %496 = load i32, ptr %32, align 4
  %497 = add i32 %496, -1
  store i32 %497, ptr %32, align 4
  br label %486, !llvm.loop !29

498:                                              ; preds = %486
  br label %475, !llvm.loop !30

499:                                              ; preds = %475
  store i32 1, ptr %2, align 4
  br label %500

500:                                              ; preds = %499, %454, %434
  %501 = load i32, ptr %2, align 4
  ret i32 %501
}

declare void @png_image_free(ptr noundef) #1

declare void @png_destroy_gamma_table(ptr noundef) #1

declare void @png_free(ptr noundef, ptr noundef) #1

declare void @png_zfree(ptr noundef, ptr noundef) #1

declare i32 @inflateEnd(ptr noundef) #1

; Function Attrs: noreturn
declare void @png_safe_error(ptr noundef, ptr noundef) #2

declare void @png_safe_warning(ptr noundef, ptr noundef) #1

declare noalias ptr @png_create_info_struct(ptr noundef) #1

declare noalias ptr @png_malloc_warn(ptr noundef, i64 noundef) #1

declare void @png_set_benign_errors(ptr noundef, i32 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_format(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds %struct.png_struct_def, ptr %4, i32 0, i32 62
  %6 = load i8, ptr %5, align 1
  %7 = zext i8 %6 to i32
  %8 = and i32 %7, 2
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %13

10:                                               ; preds = %1
  %11 = load i32, ptr %3, align 4
  %12 = or i32 %11, 2
  store i32 %12, ptr %3, align 4
  br label %13

13:                                               ; preds = %10, %1
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.png_struct_def, ptr %14, i32 0, i32 62
  %16 = load i8, ptr %15, align 1
  %17 = zext i8 %16 to i32
  %18 = and i32 %17, 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %23

20:                                               ; preds = %13
  %21 = load i32, ptr %3, align 4
  %22 = or i32 %21, 1
  store i32 %22, ptr %3, align 4
  br label %33

23:                                               ; preds = %13
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds %struct.png_struct_def, ptr %24, i32 0, i32 56
  %26 = load i16, ptr %25, align 8
  %27 = zext i16 %26 to i32
  %28 = icmp sgt i32 %27, 0
  br i1 %28, label %29, label %32

29:                                               ; preds = %23
  %30 = load i32, ptr %3, align 4
  %31 = or i32 %30, 1
  store i32 %31, ptr %3, align 4
  br label %32

32:                                               ; preds = %29, %23
  br label %33

33:                                               ; preds = %32, %20
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds %struct.png_struct_def, ptr %34, i32 0, i32 63
  %36 = load i8, ptr %35, align 8
  %37 = zext i8 %36 to i32
  %38 = icmp eq i32 %37, 16
  br i1 %38, label %39, label %42

39:                                               ; preds = %33
  %40 = load i32, ptr %3, align 4
  %41 = or i32 %40, 4
  store i32 %41, ptr %3, align 4
  br label %42

42:                                               ; preds = %39, %33
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds %struct.png_struct_def, ptr %43, i32 0, i32 62
  %45 = load i8, ptr %44, align 1
  %46 = zext i8 %45 to i32
  %47 = and i32 %46, 1
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %52

49:                                               ; preds = %42
  %50 = load i32, ptr %3, align 4
  %51 = or i32 %50, 8
  store i32 %51, ptr %3, align 4
  br label %52

52:                                               ; preds = %49, %42
  %53 = load i32, ptr %3, align 4
  ret i32 %53
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_is_not_sRGB(ptr noalias noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.png_struct_def, ptr %4, i32 0, i32 37
  %6 = load i32, ptr %5, align 8
  %7 = and i32 %6, 128
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %15, label %9

9:                                                ; preds = %1
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 37
  %12 = load i32, ptr %11, align 8
  %13 = and i32 %12, 65536
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %22

15:                                               ; preds = %9, %1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 80
  %18 = call i32 @chromaticities_match_sRGB(ptr noundef %17)
  %19 = icmp ne i32 %18, 0
  %20 = xor i1 %19, true
  %21 = zext i1 %20 to i32
  store i32 %21, ptr %2, align 4
  br label %43

22:                                               ; preds = %9
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.png_struct_def, ptr %23, i32 0, i32 37
  %25 = load i32, ptr %24, align 8
  %26 = and i32 %25, 8388608
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %29

28:                                               ; preds = %22
  store i32 0, ptr %2, align 4
  br label %43

29:                                               ; preds = %22
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds %struct.png_struct_def, ptr %30, i32 0, i32 37
  %32 = load i32, ptr %31, align 8
  %33 = and i32 %32, 64
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %42

35:                                               ; preds = %29
  %36 = load ptr, ptr %3, align 8
  %37 = getelementptr inbounds %struct.png_struct_def, ptr %36, i32 0, i32 80
  %38 = call i32 @chromaticities_match_sRGB(ptr noundef %37)
  %39 = icmp ne i32 %38, 0
  %40 = xor i1 %39, true
  %41 = zext i1 %40 to i32
  store i32 %41, ptr %2, align 4
  br label %43

42:                                               ; preds = %29
  store i32 0, ptr %2, align 4
  br label %43

43:                                               ; preds = %42, %35, %28, %15
  %44 = load i32, ptr %2, align 4
  ret i32 %44
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @chromaticities_match_sRGB(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.png_xy, ptr %4, i32 0, i32 6
  %6 = load i32, ptr %5, align 4
  %7 = icmp slt i32 %6, 30270
  br i1 %7, label %83, label %8

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.png_xy, ptr %9, i32 0, i32 6
  %11 = load i32, ptr %10, align 4
  %12 = icmp sgt i32 %11, 32270
  br i1 %12, label %83, label %13

13:                                               ; preds = %8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.png_xy, ptr %14, i32 0, i32 7
  %16 = load i32, ptr %15, align 4
  %17 = icmp slt i32 %16, 31900
  br i1 %17, label %83, label %18

18:                                               ; preds = %13
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.png_xy, ptr %19, i32 0, i32 7
  %21 = load i32, ptr %20, align 4
  %22 = icmp sgt i32 %21, 33900
  br i1 %22, label %83, label %23

23:                                               ; preds = %18
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds %struct.png_xy, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 4
  %27 = icmp slt i32 %26, 63000
  br i1 %27, label %83, label %28

28:                                               ; preds = %23
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.png_xy, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %30, align 4
  %32 = icmp sgt i32 %31, 65000
  br i1 %32, label %83, label %33

33:                                               ; preds = %28
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds %struct.png_xy, ptr %34, i32 0, i32 1
  %36 = load i32, ptr %35, align 4
  %37 = icmp slt i32 %36, 32000
  br i1 %37, label %83, label %38

38:                                               ; preds = %33
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds %struct.png_xy, ptr %39, i32 0, i32 1
  %41 = load i32, ptr %40, align 4
  %42 = icmp sgt i32 %41, 34000
  br i1 %42, label %83, label %43

43:                                               ; preds = %38
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds %struct.png_xy, ptr %44, i32 0, i32 2
  %46 = load i32, ptr %45, align 4
  %47 = icmp slt i32 %46, 29000
  br i1 %47, label %83, label %48

48:                                               ; preds = %43
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds %struct.png_xy, ptr %49, i32 0, i32 2
  %51 = load i32, ptr %50, align 4
  %52 = icmp sgt i32 %51, 31000
  br i1 %52, label %83, label %53

53:                                               ; preds = %48
  %54 = load ptr, ptr %3, align 8
  %55 = getelementptr inbounds %struct.png_xy, ptr %54, i32 0, i32 3
  %56 = load i32, ptr %55, align 4
  %57 = icmp slt i32 %56, 59000
  br i1 %57, label %83, label %58

58:                                               ; preds = %53
  %59 = load ptr, ptr %3, align 8
  %60 = getelementptr inbounds %struct.png_xy, ptr %59, i32 0, i32 3
  %61 = load i32, ptr %60, align 4
  %62 = icmp sgt i32 %61, 61000
  br i1 %62, label %83, label %63

63:                                               ; preds = %58
  %64 = load ptr, ptr %3, align 8
  %65 = getelementptr inbounds %struct.png_xy, ptr %64, i32 0, i32 4
  %66 = load i32, ptr %65, align 4
  %67 = icmp slt i32 %66, 14000
  br i1 %67, label %83, label %68

68:                                               ; preds = %63
  %69 = load ptr, ptr %3, align 8
  %70 = getelementptr inbounds %struct.png_xy, ptr %69, i32 0, i32 4
  %71 = load i32, ptr %70, align 4
  %72 = icmp sgt i32 %71, 16000
  br i1 %72, label %83, label %73

73:                                               ; preds = %68
  %74 = load ptr, ptr %3, align 8
  %75 = getelementptr inbounds %struct.png_xy, ptr %74, i32 0, i32 5
  %76 = load i32, ptr %75, align 4
  %77 = icmp slt i32 %76, 5000
  br i1 %77, label %83, label %78

78:                                               ; preds = %73
  %79 = load ptr, ptr %3, align 8
  %80 = getelementptr inbounds %struct.png_xy, ptr %79, i32 0, i32 5
  %81 = load i32, ptr %80, align 4
  %82 = icmp sgt i32 %81, 7000
  br i1 %82, label %83, label %84

83:                                               ; preds = %78, %73, %68, %63, %58, %53, %48, %43, %38, %33, %28, %23, %18, %13, %8, %1
  store i32 0, ptr %2, align 4
  br label %85

84:                                               ; preds = %78
  store i32 1, ptr %2, align 4
  br label %85

85:                                               ; preds = %84, %83
  %86 = load i32, ptr %2, align 4
  ret i32 %86
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_create_colormap_entry(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6) #0 {
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  store ptr %0, ptr %8, align 8
  store i32 %1, ptr %9, align 4
  store i32 %2, ptr %10, align 4
  store i32 %3, ptr %11, align 4
  store i32 %4, ptr %12, align 4
  store i32 %5, ptr %13, align 4
  store i32 %6, ptr %14, align 4
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr inbounds %struct.png_image_read_control, ptr %24, i32 0, i32 0
  %26 = load ptr, ptr %25, align 8
  store ptr %26, ptr %15, align 8
  %27 = load ptr, ptr %15, align 8
  %28 = getelementptr inbounds %struct.png_image, ptr %27, i32 0, i32 4
  %29 = load i32, ptr %28, align 4
  %30 = and i32 %29, 4
  %31 = icmp ne i32 %30, 0
  %32 = zext i1 %31 to i64
  %33 = select i1 %31, i32 2, i32 1
  store i32 %33, ptr %16, align 4
  %34 = load ptr, ptr %15, align 8
  %35 = getelementptr inbounds %struct.png_image, ptr %34, i32 0, i32 4
  %36 = load i32, ptr %35, align 4
  %37 = and i32 %36, 2
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %49

39:                                               ; preds = %7
  %40 = load i32, ptr %10, align 4
  %41 = load i32, ptr %11, align 4
  %42 = icmp ne i32 %40, %41
  br i1 %42, label %47, label %43

43:                                               ; preds = %39
  %44 = load i32, ptr %11, align 4
  %45 = load i32, ptr %12, align 4
  %46 = icmp ne i32 %44, %45
  br label %47

47:                                               ; preds = %43, %39
  %48 = phi i1 [ true, %39 ], [ %46, %43 ]
  br label %49

49:                                               ; preds = %47, %7
  %50 = phi i1 [ false, %7 ], [ %48, %47 ]
  %51 = zext i1 %50 to i32
  store i32 %51, ptr %17, align 4
  %52 = load i32, ptr %9, align 4
  %53 = icmp ugt i32 %52, 255
  br i1 %53, label %54, label %60

54:                                               ; preds = %49
  %55 = load ptr, ptr %15, align 8
  %56 = getelementptr inbounds %struct.png_image, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  %58 = getelementptr inbounds %struct.png_control, ptr %57, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  call void @png_error(ptr noundef %59, ptr noundef @.str.48) #8
  unreachable

60:                                               ; preds = %49
  %61 = load i32, ptr %14, align 4
  %62 = icmp eq i32 %61, 3
  br i1 %62, label %63, label %74

63:                                               ; preds = %60
  %64 = load ptr, ptr %8, align 8
  %65 = getelementptr inbounds %struct.png_image_read_control, ptr %64, i32 0, i32 8
  %66 = load i32, ptr %65, align 8
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %70

68:                                               ; preds = %63
  %69 = load ptr, ptr %8, align 8
  call void @set_file_encoding(ptr noundef %69)
  br label %70

70:                                               ; preds = %68, %63
  %71 = load ptr, ptr %8, align 8
  %72 = getelementptr inbounds %struct.png_image_read_control, ptr %71, i32 0, i32 8
  %73 = load i32, ptr %72, align 8
  store i32 %73, ptr %14, align 4
  br label %74

74:                                               ; preds = %70, %60
  %75 = load i32, ptr %14, align 4
  %76 = icmp eq i32 %75, 3
  br i1 %76, label %77, label %178

77:                                               ; preds = %74
  %78 = load ptr, ptr %8, align 8
  %79 = getelementptr inbounds %struct.png_image_read_control, ptr %78, i32 0, i32 9
  %80 = load i32, ptr %79, align 4
  store i32 %80, ptr %18, align 4
  %81 = load i32, ptr %10, align 4
  %82 = mul i32 %81, 257
  %83 = load i32, ptr %18, align 4
  %84 = call zeroext i16 @png_gamma_16bit_correct(i32 noundef %82, i32 noundef %83)
  %85 = zext i16 %84 to i32
  store i32 %85, ptr %10, align 4
  %86 = load i32, ptr %11, align 4
  %87 = mul i32 %86, 257
  %88 = load i32, ptr %18, align 4
  %89 = call zeroext i16 @png_gamma_16bit_correct(i32 noundef %87, i32 noundef %88)
  %90 = zext i16 %89 to i32
  store i32 %90, ptr %11, align 4
  %91 = load i32, ptr %12, align 4
  %92 = mul i32 %91, 257
  %93 = load i32, ptr %18, align 4
  %94 = call zeroext i16 @png_gamma_16bit_correct(i32 noundef %92, i32 noundef %93)
  %95 = zext i16 %94 to i32
  store i32 %95, ptr %12, align 4
  %96 = load i32, ptr %17, align 4
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %101, label %98

98:                                               ; preds = %77
  %99 = load i32, ptr %16, align 4
  %100 = icmp eq i32 %99, 2
  br i1 %100, label %101, label %104

101:                                              ; preds = %98, %77
  %102 = load i32, ptr %13, align 4
  %103 = mul i32 %102, 257
  store i32 %103, ptr %13, align 4
  store i32 2, ptr %14, align 4
  br label %177

104:                                              ; preds = %98
  %105 = load i32, ptr %10, align 4
  %106 = mul i32 %105, 255
  %107 = lshr i32 %106, 15
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %108
  %110 = load i16, ptr %109, align 2
  %111 = zext i16 %110 to i32
  %112 = load i32, ptr %10, align 4
  %113 = mul i32 %112, 255
  %114 = and i32 %113, 32767
  %115 = load i32, ptr %10, align 4
  %116 = mul i32 %115, 255
  %117 = lshr i32 %116, 15
  %118 = zext i32 %117 to i64
  %119 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %118
  %120 = load i8, ptr %119, align 1
  %121 = zext i8 %120 to i32
  %122 = mul i32 %114, %121
  %123 = lshr i32 %122, 12
  %124 = add i32 %111, %123
  %125 = lshr i32 %124, 8
  %126 = and i32 255, %125
  %127 = trunc i32 %126 to i8
  %128 = zext i8 %127 to i32
  store i32 %128, ptr %10, align 4
  %129 = load i32, ptr %11, align 4
  %130 = mul i32 %129, 255
  %131 = lshr i32 %130, 15
  %132 = zext i32 %131 to i64
  %133 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %132
  %134 = load i16, ptr %133, align 2
  %135 = zext i16 %134 to i32
  %136 = load i32, ptr %11, align 4
  %137 = mul i32 %136, 255
  %138 = and i32 %137, 32767
  %139 = load i32, ptr %11, align 4
  %140 = mul i32 %139, 255
  %141 = lshr i32 %140, 15
  %142 = zext i32 %141 to i64
  %143 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %142
  %144 = load i8, ptr %143, align 1
  %145 = zext i8 %144 to i32
  %146 = mul i32 %138, %145
  %147 = lshr i32 %146, 12
  %148 = add i32 %135, %147
  %149 = lshr i32 %148, 8
  %150 = and i32 255, %149
  %151 = trunc i32 %150 to i8
  %152 = zext i8 %151 to i32
  store i32 %152, ptr %11, align 4
  %153 = load i32, ptr %12, align 4
  %154 = mul i32 %153, 255
  %155 = lshr i32 %154, 15
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %156
  %158 = load i16, ptr %157, align 2
  %159 = zext i16 %158 to i32
  %160 = load i32, ptr %12, align 4
  %161 = mul i32 %160, 255
  %162 = and i32 %161, 32767
  %163 = load i32, ptr %12, align 4
  %164 = mul i32 %163, 255
  %165 = lshr i32 %164, 15
  %166 = zext i32 %165 to i64
  %167 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %166
  %168 = load i8, ptr %167, align 1
  %169 = zext i8 %168 to i32
  %170 = mul i32 %162, %169
  %171 = lshr i32 %170, 12
  %172 = add i32 %159, %171
  %173 = lshr i32 %172, 8
  %174 = and i32 255, %173
  %175 = trunc i32 %174 to i8
  %176 = zext i8 %175 to i32
  store i32 %176, ptr %12, align 4
  store i32 1, ptr %14, align 4
  br label %177

177:                                              ; preds = %104, %101
  br label %219

178:                                              ; preds = %74
  %179 = load i32, ptr %14, align 4
  %180 = icmp eq i32 %179, 4
  br i1 %180, label %181, label %190

181:                                              ; preds = %178
  %182 = load i32, ptr %10, align 4
  %183 = mul i32 %182, 257
  store i32 %183, ptr %10, align 4
  %184 = load i32, ptr %11, align 4
  %185 = mul i32 %184, 257
  store i32 %185, ptr %11, align 4
  %186 = load i32, ptr %12, align 4
  %187 = mul i32 %186, 257
  store i32 %187, ptr %12, align 4
  %188 = load i32, ptr %13, align 4
  %189 = mul i32 %188, 257
  store i32 %189, ptr %13, align 4
  store i32 2, ptr %14, align 4
  br label %218

190:                                              ; preds = %178
  %191 = load i32, ptr %14, align 4
  %192 = icmp eq i32 %191, 1
  br i1 %192, label %193, label %217

193:                                              ; preds = %190
  %194 = load i32, ptr %17, align 4
  %195 = icmp ne i32 %194, 0
  br i1 %195, label %199, label %196

196:                                              ; preds = %193
  %197 = load i32, ptr %16, align 4
  %198 = icmp eq i32 %197, 2
  br i1 %198, label %199, label %217

199:                                              ; preds = %196, %193
  %200 = load i32, ptr %10, align 4
  %201 = zext i32 %200 to i64
  %202 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %201
  %203 = load i16, ptr %202, align 2
  %204 = zext i16 %203 to i32
  store i32 %204, ptr %10, align 4
  %205 = load i32, ptr %11, align 4
  %206 = zext i32 %205 to i64
  %207 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %206
  %208 = load i16, ptr %207, align 2
  %209 = zext i16 %208 to i32
  store i32 %209, ptr %11, align 4
  %210 = load i32, ptr %12, align 4
  %211 = zext i32 %210 to i64
  %212 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %211
  %213 = load i16, ptr %212, align 2
  %214 = zext i16 %213 to i32
  store i32 %214, ptr %12, align 4
  %215 = load i32, ptr %13, align 4
  %216 = mul i32 %215, 257
  store i32 %216, ptr %13, align 4
  store i32 2, ptr %14, align 4
  br label %217

217:                                              ; preds = %199, %196, %190
  br label %218

218:                                              ; preds = %217, %181
  br label %219

219:                                              ; preds = %218, %177
  %220 = load i32, ptr %14, align 4
  %221 = icmp eq i32 %220, 2
  br i1 %221, label %222, label %361

222:                                              ; preds = %219
  %223 = load i32, ptr %17, align 4
  %224 = icmp ne i32 %223, 0
  br i1 %224, label %225, label %279

225:                                              ; preds = %222
  %226 = load i32, ptr %10, align 4
  %227 = mul i32 6968, %226
  %228 = load i32, ptr %11, align 4
  %229 = mul i32 23434, %228
  %230 = add i32 %227, %229
  %231 = load i32, ptr %12, align 4
  %232 = mul i32 2366, %231
  %233 = add i32 %230, %232
  store i32 %233, ptr %19, align 4
  %234 = load i32, ptr %16, align 4
  %235 = icmp eq i32 %234, 2
  br i1 %235, label %236, label %240

236:                                              ; preds = %225
  %237 = load i32, ptr %19, align 4
  %238 = add i32 %237, 16384
  %239 = lshr i32 %238, 15
  store i32 %239, ptr %19, align 4
  br label %277

240:                                              ; preds = %225
  %241 = load i32, ptr %19, align 4
  %242 = add i32 %241, 128
  %243 = lshr i32 %242, 8
  store i32 %243, ptr %19, align 4
  %244 = load i32, ptr %19, align 4
  %245 = mul i32 %244, 255
  store i32 %245, ptr %19, align 4
  %246 = load i32, ptr %19, align 4
  %247 = add i32 %246, 64
  %248 = lshr i32 %247, 7
  %249 = lshr i32 %248, 15
  %250 = zext i32 %249 to i64
  %251 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %250
  %252 = load i16, ptr %251, align 2
  %253 = zext i16 %252 to i32
  %254 = load i32, ptr %19, align 4
  %255 = add i32 %254, 64
  %256 = lshr i32 %255, 7
  %257 = and i32 %256, 32767
  %258 = load i32, ptr %19, align 4
  %259 = add i32 %258, 64
  %260 = lshr i32 %259, 7
  %261 = lshr i32 %260, 15
  %262 = zext i32 %261 to i64
  %263 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %262
  %264 = load i8, ptr %263, align 1
  %265 = zext i8 %264 to i32
  %266 = mul i32 %257, %265
  %267 = lshr i32 %266, 12
  %268 = add i32 %253, %267
  %269 = lshr i32 %268, 8
  %270 = and i32 255, %269
  %271 = trunc i32 %270 to i8
  %272 = zext i8 %271 to i32
  store i32 %272, ptr %19, align 4
  %273 = load i32, ptr %13, align 4
  %274 = mul i32 %273, 255
  %275 = add i32 %274, 32895
  %276 = lshr i32 %275, 16
  store i32 %276, ptr %13, align 4
  store i32 1, ptr %14, align 4
  br label %277

277:                                              ; preds = %240, %236
  %278 = load i32, ptr %19, align 4
  store i32 %278, ptr %11, align 4
  store i32 %278, ptr %10, align 4
  store i32 %278, ptr %12, align 4
  br label %360

279:                                              ; preds = %222
  %280 = load i32, ptr %16, align 4
  %281 = icmp eq i32 %280, 1
  br i1 %281, label %282, label %359

282:                                              ; preds = %279
  %283 = load i32, ptr %10, align 4
  %284 = mul i32 %283, 255
  %285 = lshr i32 %284, 15
  %286 = zext i32 %285 to i64
  %287 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %286
  %288 = load i16, ptr %287, align 2
  %289 = zext i16 %288 to i32
  %290 = load i32, ptr %10, align 4
  %291 = mul i32 %290, 255
  %292 = and i32 %291, 32767
  %293 = load i32, ptr %10, align 4
  %294 = mul i32 %293, 255
  %295 = lshr i32 %294, 15
  %296 = zext i32 %295 to i64
  %297 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %296
  %298 = load i8, ptr %297, align 1
  %299 = zext i8 %298 to i32
  %300 = mul i32 %292, %299
  %301 = lshr i32 %300, 12
  %302 = add i32 %289, %301
  %303 = lshr i32 %302, 8
  %304 = and i32 255, %303
  %305 = trunc i32 %304 to i8
  %306 = zext i8 %305 to i32
  store i32 %306, ptr %10, align 4
  %307 = load i32, ptr %11, align 4
  %308 = mul i32 %307, 255
  %309 = lshr i32 %308, 15
  %310 = zext i32 %309 to i64
  %311 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %310
  %312 = load i16, ptr %311, align 2
  %313 = zext i16 %312 to i32
  %314 = load i32, ptr %11, align 4
  %315 = mul i32 %314, 255
  %316 = and i32 %315, 32767
  %317 = load i32, ptr %11, align 4
  %318 = mul i32 %317, 255
  %319 = lshr i32 %318, 15
  %320 = zext i32 %319 to i64
  %321 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %320
  %322 = load i8, ptr %321, align 1
  %323 = zext i8 %322 to i32
  %324 = mul i32 %316, %323
  %325 = lshr i32 %324, 12
  %326 = add i32 %313, %325
  %327 = lshr i32 %326, 8
  %328 = and i32 255, %327
  %329 = trunc i32 %328 to i8
  %330 = zext i8 %329 to i32
  store i32 %330, ptr %11, align 4
  %331 = load i32, ptr %12, align 4
  %332 = mul i32 %331, 255
  %333 = lshr i32 %332, 15
  %334 = zext i32 %333 to i64
  %335 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %334
  %336 = load i16, ptr %335, align 2
  %337 = zext i16 %336 to i32
  %338 = load i32, ptr %12, align 4
  %339 = mul i32 %338, 255
  %340 = and i32 %339, 32767
  %341 = load i32, ptr %12, align 4
  %342 = mul i32 %341, 255
  %343 = lshr i32 %342, 15
  %344 = zext i32 %343 to i64
  %345 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %344
  %346 = load i8, ptr %345, align 1
  %347 = zext i8 %346 to i32
  %348 = mul i32 %340, %347
  %349 = lshr i32 %348, 12
  %350 = add i32 %337, %349
  %351 = lshr i32 %350, 8
  %352 = and i32 255, %351
  %353 = trunc i32 %352 to i8
  %354 = zext i8 %353 to i32
  store i32 %354, ptr %12, align 4
  %355 = load i32, ptr %13, align 4
  %356 = mul i32 %355, 255
  %357 = add i32 %356, 32895
  %358 = lshr i32 %357, 16
  store i32 %358, ptr %13, align 4
  store i32 1, ptr %14, align 4
  br label %359

359:                                              ; preds = %282, %279
  br label %360

360:                                              ; preds = %359, %277
  br label %361

361:                                              ; preds = %360, %219
  %362 = load i32, ptr %14, align 4
  %363 = load i32, ptr %16, align 4
  %364 = icmp ne i32 %362, %363
  br i1 %364, label %365, label %371

365:                                              ; preds = %361
  %366 = load ptr, ptr %15, align 8
  %367 = getelementptr inbounds %struct.png_image, ptr %366, i32 0, i32 0
  %368 = load ptr, ptr %367, align 8
  %369 = getelementptr inbounds %struct.png_control, ptr %368, i32 0, i32 0
  %370 = load ptr, ptr %369, align 8
  call void @png_error(ptr noundef %370, ptr noundef @.str.49) #8
  unreachable

371:                                              ; preds = %361
  %372 = load ptr, ptr %15, align 8
  %373 = getelementptr inbounds %struct.png_image, ptr %372, i32 0, i32 4
  %374 = load i32, ptr %373, align 4
  %375 = and i32 %374, 32
  %376 = icmp ne i32 %375, 0
  br i1 %376, label %377, label %383

377:                                              ; preds = %371
  %378 = load ptr, ptr %15, align 8
  %379 = getelementptr inbounds %struct.png_image, ptr %378, i32 0, i32 4
  %380 = load i32, ptr %379, align 4
  %381 = and i32 %380, 1
  %382 = icmp ne i32 %381, 0
  br label %383

383:                                              ; preds = %377, %371
  %384 = phi i1 [ false, %371 ], [ %382, %377 ]
  %385 = zext i1 %384 to i32
  store i32 %385, ptr %20, align 4
  %386 = load ptr, ptr %15, align 8
  %387 = getelementptr inbounds %struct.png_image, ptr %386, i32 0, i32 4
  %388 = load i32, ptr %387, align 4
  %389 = and i32 %388, 16
  %390 = icmp ne i32 %389, 0
  %391 = zext i1 %390 to i64
  %392 = select i1 %390, i32 2, i32 0
  store i32 %392, ptr %21, align 4
  %393 = load i32, ptr %16, align 4
  %394 = icmp eq i32 %393, 2
  br i1 %394, label %395, label %504

395:                                              ; preds = %383
  %396 = load ptr, ptr %8, align 8
  %397 = getelementptr inbounds %struct.png_image_read_control, ptr %396, i32 0, i32 3
  %398 = load ptr, ptr %397, align 8
  store ptr %398, ptr %22, align 8
  %399 = load i32, ptr %9, align 4
  %400 = load ptr, ptr %15, align 8
  %401 = getelementptr inbounds %struct.png_image, ptr %400, i32 0, i32 4
  %402 = load i32, ptr %401, align 4
  %403 = and i32 %402, 3
  %404 = add i32 %403, 1
  %405 = mul i32 %399, %404
  %406 = load ptr, ptr %22, align 8
  %407 = zext i32 %405 to i64
  %408 = getelementptr inbounds i16, ptr %406, i64 %407
  store ptr %408, ptr %22, align 8
  %409 = load ptr, ptr %15, align 8
  %410 = getelementptr inbounds %struct.png_image, ptr %409, i32 0, i32 4
  %411 = load i32, ptr %410, align 4
  %412 = and i32 %411, 3
  %413 = add i32 %412, 1
  switch i32 %413, label %502 [
    i32 4, label %414
    i32 3, label %424
    i32 2, label %473
    i32 1, label %481
  ]

414:                                              ; preds = %395
  %415 = load i32, ptr %13, align 4
  %416 = trunc i32 %415 to i16
  %417 = load ptr, ptr %22, align 8
  %418 = load i32, ptr %20, align 4
  %419 = icmp ne i32 %418, 0
  %420 = zext i1 %419 to i64
  %421 = select i1 %419, i32 0, i32 3
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds i16, ptr %417, i64 %422
  store i16 %416, ptr %423, align 2
  br label %424

424:                                              ; preds = %395, %414
  %425 = load i32, ptr %13, align 4
  %426 = icmp ult i32 %425, 65535
  br i1 %426, label %427, label %448

427:                                              ; preds = %424
  %428 = load i32, ptr %13, align 4
  %429 = icmp ugt i32 %428, 0
  br i1 %429, label %430, label %446

430:                                              ; preds = %427
  %431 = load i32, ptr %12, align 4
  %432 = load i32, ptr %13, align 4
  %433 = mul i32 %431, %432
  %434 = add i32 %433, 32767
  %435 = udiv i32 %434, 65535
  store i32 %435, ptr %12, align 4
  %436 = load i32, ptr %11, align 4
  %437 = load i32, ptr %13, align 4
  %438 = mul i32 %436, %437
  %439 = add i32 %438, 32767
  %440 = udiv i32 %439, 65535
  store i32 %440, ptr %11, align 4
  %441 = load i32, ptr %10, align 4
  %442 = load i32, ptr %13, align 4
  %443 = mul i32 %441, %442
  %444 = add i32 %443, 32767
  %445 = udiv i32 %444, 65535
  store i32 %445, ptr %10, align 4
  br label %447

446:                                              ; preds = %427
  store i32 0, ptr %12, align 4
  store i32 0, ptr %11, align 4
  store i32 0, ptr %10, align 4
  br label %447

447:                                              ; preds = %446, %430
  br label %448

448:                                              ; preds = %447, %424
  %449 = load i32, ptr %12, align 4
  %450 = trunc i32 %449 to i16
  %451 = load ptr, ptr %22, align 8
  %452 = load i32, ptr %20, align 4
  %453 = load i32, ptr %21, align 4
  %454 = xor i32 2, %453
  %455 = add nsw i32 %452, %454
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds i16, ptr %451, i64 %456
  store i16 %450, ptr %457, align 2
  %458 = load i32, ptr %11, align 4
  %459 = trunc i32 %458 to i16
  %460 = load ptr, ptr %22, align 8
  %461 = load i32, ptr %20, align 4
  %462 = add nsw i32 %461, 1
  %463 = sext i32 %462 to i64
  %464 = getelementptr inbounds i16, ptr %460, i64 %463
  store i16 %459, ptr %464, align 2
  %465 = load i32, ptr %10, align 4
  %466 = trunc i32 %465 to i16
  %467 = load ptr, ptr %22, align 8
  %468 = load i32, ptr %20, align 4
  %469 = load i32, ptr %21, align 4
  %470 = add nsw i32 %468, %469
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds i16, ptr %467, i64 %471
  store i16 %466, ptr %472, align 2
  br label %503

473:                                              ; preds = %395
  %474 = load i32, ptr %13, align 4
  %475 = trunc i32 %474 to i16
  %476 = load ptr, ptr %22, align 8
  %477 = load i32, ptr %20, align 4
  %478 = xor i32 1, %477
  %479 = sext i32 %478 to i64
  %480 = getelementptr inbounds i16, ptr %476, i64 %479
  store i16 %475, ptr %480, align 2
  br label %481

481:                                              ; preds = %395, %473
  %482 = load i32, ptr %13, align 4
  %483 = icmp ult i32 %482, 65535
  br i1 %483, label %484, label %495

484:                                              ; preds = %481
  %485 = load i32, ptr %13, align 4
  %486 = icmp ugt i32 %485, 0
  br i1 %486, label %487, label %493

487:                                              ; preds = %484
  %488 = load i32, ptr %11, align 4
  %489 = load i32, ptr %13, align 4
  %490 = mul i32 %488, %489
  %491 = add i32 %490, 32767
  %492 = udiv i32 %491, 65535
  store i32 %492, ptr %11, align 4
  br label %494

493:                                              ; preds = %484
  store i32 0, ptr %11, align 4
  br label %494

494:                                              ; preds = %493, %487
  br label %495

495:                                              ; preds = %494, %481
  %496 = load i32, ptr %11, align 4
  %497 = trunc i32 %496 to i16
  %498 = load ptr, ptr %22, align 8
  %499 = load i32, ptr %20, align 4
  %500 = sext i32 %499 to i64
  %501 = getelementptr inbounds i16, ptr %498, i64 %500
  store i16 %497, ptr %501, align 2
  br label %503

502:                                              ; preds = %395
  br label %503

503:                                              ; preds = %502, %495, %448
  br label %575

504:                                              ; preds = %383
  %505 = load ptr, ptr %8, align 8
  %506 = getelementptr inbounds %struct.png_image_read_control, ptr %505, i32 0, i32 3
  %507 = load ptr, ptr %506, align 8
  store ptr %507, ptr %23, align 8
  %508 = load i32, ptr %9, align 4
  %509 = load ptr, ptr %15, align 8
  %510 = getelementptr inbounds %struct.png_image, ptr %509, i32 0, i32 4
  %511 = load i32, ptr %510, align 4
  %512 = and i32 %511, 3
  %513 = add i32 %512, 1
  %514 = mul i32 %508, %513
  %515 = load ptr, ptr %23, align 8
  %516 = zext i32 %514 to i64
  %517 = getelementptr inbounds i8, ptr %515, i64 %516
  store ptr %517, ptr %23, align 8
  %518 = load ptr, ptr %15, align 8
  %519 = getelementptr inbounds %struct.png_image, ptr %518, i32 0, i32 4
  %520 = load i32, ptr %519, align 4
  %521 = and i32 %520, 3
  %522 = add i32 %521, 1
  switch i32 %522, label %573 [
    i32 4, label %523
    i32 3, label %533
    i32 2, label %558
    i32 1, label %566
  ]

523:                                              ; preds = %504
  %524 = load i32, ptr %13, align 4
  %525 = trunc i32 %524 to i8
  %526 = load ptr, ptr %23, align 8
  %527 = load i32, ptr %20, align 4
  %528 = icmp ne i32 %527, 0
  %529 = zext i1 %528 to i64
  %530 = select i1 %528, i32 0, i32 3
  %531 = sext i32 %530 to i64
  %532 = getelementptr inbounds i8, ptr %526, i64 %531
  store i8 %525, ptr %532, align 1
  br label %533

533:                                              ; preds = %504, %523
  %534 = load i32, ptr %12, align 4
  %535 = trunc i32 %534 to i8
  %536 = load ptr, ptr %23, align 8
  %537 = load i32, ptr %20, align 4
  %538 = load i32, ptr %21, align 4
  %539 = xor i32 2, %538
  %540 = add nsw i32 %537, %539
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds i8, ptr %536, i64 %541
  store i8 %535, ptr %542, align 1
  %543 = load i32, ptr %11, align 4
  %544 = trunc i32 %543 to i8
  %545 = load ptr, ptr %23, align 8
  %546 = load i32, ptr %20, align 4
  %547 = add nsw i32 %546, 1
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds i8, ptr %545, i64 %548
  store i8 %544, ptr %549, align 1
  %550 = load i32, ptr %10, align 4
  %551 = trunc i32 %550 to i8
  %552 = load ptr, ptr %23, align 8
  %553 = load i32, ptr %20, align 4
  %554 = load i32, ptr %21, align 4
  %555 = add nsw i32 %553, %554
  %556 = sext i32 %555 to i64
  %557 = getelementptr inbounds i8, ptr %552, i64 %556
  store i8 %551, ptr %557, align 1
  br label %574

558:                                              ; preds = %504
  %559 = load i32, ptr %13, align 4
  %560 = trunc i32 %559 to i8
  %561 = load ptr, ptr %23, align 8
  %562 = load i32, ptr %20, align 4
  %563 = xor i32 1, %562
  %564 = sext i32 %563 to i64
  %565 = getelementptr inbounds i8, ptr %561, i64 %564
  store i8 %560, ptr %565, align 1
  br label %566

566:                                              ; preds = %504, %558
  %567 = load i32, ptr %11, align 4
  %568 = trunc i32 %567 to i8
  %569 = load ptr, ptr %23, align 8
  %570 = load i32, ptr %20, align 4
  %571 = sext i32 %570 to i64
  %572 = getelementptr inbounds i8, ptr %569, i64 %571
  store i8 %568, ptr %572, align 1
  br label %574

573:                                              ; preds = %504
  br label %574

574:                                              ; preds = %573, %566, %533
  br label %575

575:                                              ; preds = %574, %503
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @make_gray_colormap(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %13, %1
  %5 = load i32, ptr %3, align 4
  %6 = icmp ult i32 %5, 256
  br i1 %6, label %7, label %16

7:                                                ; preds = %4
  %8 = load ptr, ptr %2, align 8
  %9 = load i32, ptr %3, align 4
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %3, align 4
  call void @png_create_colormap_entry(ptr noundef %8, i32 noundef %9, i32 noundef %10, i32 noundef %11, i32 noundef %12, i32 noundef 255, i32 noundef 1)
  br label %13

13:                                               ; preds = %7
  %14 = load i32, ptr %3, align 4
  %15 = add i32 %14, 1
  store i32 %15, ptr %3, align 4
  br label %4, !llvm.loop !31

16:                                               ; preds = %4
  %17 = load i32, ptr %3, align 4
  ret i32 %17
}

declare void @png_set_background_fixed(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @make_ga_colormap(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %10, %1
  %8 = load i32, ptr %3, align 4
  %9 = icmp ult i32 %8, 231
  br i1 %9, label %10, label %21

10:                                               ; preds = %7
  %11 = load i32, ptr %3, align 4
  %12 = mul i32 %11, 256
  %13 = add i32 %12, 115
  %14 = udiv i32 %13, 231
  store i32 %14, ptr %5, align 4
  %15 = load ptr, ptr %2, align 8
  %16 = load i32, ptr %3, align 4
  %17 = add i32 %16, 1
  store i32 %17, ptr %3, align 4
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %5, align 4
  %20 = load i32, ptr %5, align 4
  call void @png_create_colormap_entry(ptr noundef %15, i32 noundef %16, i32 noundef %18, i32 noundef %19, i32 noundef %20, i32 noundef 255, i32 noundef 1)
  br label %7, !llvm.loop !32

21:                                               ; preds = %7
  %22 = load ptr, ptr %2, align 8
  %23 = load i32, ptr %3, align 4
  %24 = add i32 %23, 1
  store i32 %24, ptr %3, align 4
  call void @png_create_colormap_entry(ptr noundef %22, i32 noundef %23, i32 noundef 255, i32 noundef 255, i32 noundef 255, i32 noundef 0, i32 noundef 1)
  store i32 1, ptr %4, align 4
  br label %25

25:                                               ; preds = %48, %21
  %26 = load i32, ptr %4, align 4
  %27 = icmp ult i32 %26, 5
  br i1 %27, label %28, label %51

28:                                               ; preds = %25
  store i32 0, ptr %6, align 4
  br label %29

29:                                               ; preds = %44, %28
  %30 = load i32, ptr %6, align 4
  %31 = icmp ult i32 %30, 6
  br i1 %31, label %32, label %47

32:                                               ; preds = %29
  %33 = load ptr, ptr %2, align 8
  %34 = load i32, ptr %3, align 4
  %35 = add i32 %34, 1
  store i32 %35, ptr %3, align 4
  %36 = load i32, ptr %6, align 4
  %37 = mul i32 %36, 51
  %38 = load i32, ptr %6, align 4
  %39 = mul i32 %38, 51
  %40 = load i32, ptr %6, align 4
  %41 = mul i32 %40, 51
  %42 = load i32, ptr %4, align 4
  %43 = mul i32 %42, 51
  call void @png_create_colormap_entry(ptr noundef %33, i32 noundef %34, i32 noundef %37, i32 noundef %39, i32 noundef %41, i32 noundef %43, i32 noundef 1)
  br label %44

44:                                               ; preds = %32
  %45 = load i32, ptr %6, align 4
  %46 = add i32 %45, 1
  store i32 %46, ptr %6, align 4
  br label %29, !llvm.loop !33

47:                                               ; preds = %29
  br label %48

48:                                               ; preds = %47
  %49 = load i32, ptr %4, align 4
  %50 = add i32 %49, 1
  store i32 %50, ptr %4, align 4
  br label %25, !llvm.loop !34

51:                                               ; preds = %25
  %52 = load i32, ptr %3, align 4
  ret i32 %52
}

declare void @png_set_rgb_to_gray_fixed(ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

declare i32 @png_resolve_file_gamma(ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_gamma_not_sRGB(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = icmp slt i32 %4, 1000
  br i1 %5, label %9, label %6

6:                                                ; preds = %1
  %7 = load i32, ptr %3, align 4
  %8 = icmp sgt i32 %7, 10000000
  br i1 %8, label %9, label %10

9:                                                ; preds = %6, %1
  store i32 0, ptr %2, align 4
  br label %16

10:                                               ; preds = %6
  %11 = load i32, ptr %3, align 4
  %12 = mul nsw i32 %11, 11
  %13 = add nsw i32 %12, 2
  %14 = sdiv i32 %13, 5
  %15 = call i32 @png_gamma_significant(i32 noundef %14)
  store i32 %15, ptr %2, align 4
  br label %16

16:                                               ; preds = %10, %9
  %17 = load i32, ptr %2, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @make_gray_file_colormap(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %4

4:                                                ; preds = %13, %1
  %5 = load i32, ptr %3, align 4
  %6 = icmp ult i32 %5, 256
  br i1 %6, label %7, label %16

7:                                                ; preds = %4
  %8 = load ptr, ptr %2, align 8
  %9 = load i32, ptr %3, align 4
  %10 = load i32, ptr %3, align 4
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %3, align 4
  call void @png_create_colormap_entry(ptr noundef %8, i32 noundef %9, i32 noundef %10, i32 noundef %11, i32 noundef %12, i32 noundef 255, i32 noundef 3)
  br label %13

13:                                               ; preds = %7
  %14 = load i32, ptr %3, align 4
  %15 = add i32 %14, 1
  store i32 %15, ptr %3, align 4
  br label %4, !llvm.loop !35

16:                                               ; preds = %4
  %17 = load i32, ptr %3, align 4
  ret i32 %17
}

declare zeroext i16 @png_gamma_16bit_correct(i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @make_rgb_colormap(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %4, align 4
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %36, %1
  %8 = load i32, ptr %4, align 4
  %9 = icmp ult i32 %8, 6
  br i1 %9, label %10, label %39

10:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %11

11:                                               ; preds = %32, %10
  %12 = load i32, ptr %5, align 4
  %13 = icmp ult i32 %12, 6
  br i1 %13, label %14, label %35

14:                                               ; preds = %11
  store i32 0, ptr %6, align 4
  br label %15

15:                                               ; preds = %28, %14
  %16 = load i32, ptr %6, align 4
  %17 = icmp ult i32 %16, 6
  br i1 %17, label %18, label %31

18:                                               ; preds = %15
  %19 = load ptr, ptr %2, align 8
  %20 = load i32, ptr %3, align 4
  %21 = add i32 %20, 1
  store i32 %21, ptr %3, align 4
  %22 = load i32, ptr %4, align 4
  %23 = mul i32 %22, 51
  %24 = load i32, ptr %5, align 4
  %25 = mul i32 %24, 51
  %26 = load i32, ptr %6, align 4
  %27 = mul i32 %26, 51
  call void @png_create_colormap_entry(ptr noundef %19, i32 noundef %20, i32 noundef %23, i32 noundef %25, i32 noundef %27, i32 noundef 255, i32 noundef 1)
  br label %28

28:                                               ; preds = %18
  %29 = load i32, ptr %6, align 4
  %30 = add i32 %29, 1
  store i32 %30, ptr %6, align 4
  br label %15, !llvm.loop !36

31:                                               ; preds = %15
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %5, align 4
  %34 = add i32 %33, 1
  store i32 %34, ptr %5, align 4
  br label %11, !llvm.loop !37

35:                                               ; preds = %11
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %4, align 4
  %38 = add i32 %37, 1
  store i32 %38, ptr %4, align 4
  br label %7, !llvm.loop !38

39:                                               ; preds = %7
  %40 = load i32, ptr %3, align 4
  ret i32 %40
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) #7

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_colormap_compose(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
  store i32 %1, ptr %8, align 4
  store i32 %2, ptr %9, align 4
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  store i32 %5, ptr %12, align 4
  %15 = load ptr, ptr %7, align 8
  %16 = load i32, ptr %8, align 4
  %17 = load i32, ptr %9, align 4
  %18 = call i32 @decode_gamma(ptr noundef %15, i32 noundef %16, i32 noundef %17)
  store i32 %18, ptr %13, align 4
  %19 = load ptr, ptr %7, align 8
  %20 = load i32, ptr %11, align 4
  %21 = load i32, ptr %12, align 4
  %22 = call i32 @decode_gamma(ptr noundef %19, i32 noundef %20, i32 noundef %21)
  store i32 %22, ptr %14, align 4
  %23 = load i32, ptr %13, align 4
  %24 = load i32, ptr %10, align 4
  %25 = mul i32 %23, %24
  %26 = load i32, ptr %14, align 4
  %27 = load i32, ptr %10, align 4
  %28 = sub i32 255, %27
  %29 = mul i32 %26, %28
  %30 = add i32 %25, %29
  store i32 %30, ptr %13, align 4
  %31 = load i32, ptr %12, align 4
  %32 = icmp eq i32 %31, 2
  br i1 %32, label %33, label %43

33:                                               ; preds = %6
  %34 = load i32, ptr %13, align 4
  %35 = mul i32 %34, 257
  store i32 %35, ptr %13, align 4
  %36 = load i32, ptr %13, align 4
  %37 = lshr i32 %36, 16
  %38 = load i32, ptr %13, align 4
  %39 = add i32 %38, %37
  store i32 %39, ptr %13, align 4
  %40 = load i32, ptr %13, align 4
  %41 = add i32 %40, 32768
  %42 = lshr i32 %41, 16
  store i32 %42, ptr %13, align 4
  br label %65

43:                                               ; preds = %6
  %44 = load i32, ptr %13, align 4
  %45 = lshr i32 %44, 15
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %46
  %48 = load i16, ptr %47, align 2
  %49 = zext i16 %48 to i32
  %50 = load i32, ptr %13, align 4
  %51 = and i32 %50, 32767
  %52 = load i32, ptr %13, align 4
  %53 = lshr i32 %52, 15
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %54
  %56 = load i8, ptr %55, align 1
  %57 = zext i8 %56 to i32
  %58 = mul i32 %51, %57
  %59 = lshr i32 %58, 12
  %60 = add i32 %49, %59
  %61 = lshr i32 %60, 8
  %62 = and i32 255, %61
  %63 = trunc i32 %62 to i8
  %64 = zext i8 %63 to i32
  store i32 %64, ptr %13, align 4
  br label %65

65:                                               ; preds = %43, %33
  %66 = load i32, ptr %13, align 4
  ret i32 %66
}

declare void @png_set_tRNS_to_alpha(ptr noundef) #1

declare void @png_set_alpha_mode_fixed(ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @set_file_encoding(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.png_image_read_control, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr inbounds %struct.png_image, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds %struct.png_control, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %3, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = call i32 @png_resolve_file_gamma(ptr noundef %12)
  store i32 %13, ptr %4, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %1
  %17 = load ptr, ptr %3, align 8
  call void @png_error(ptr noundef %17, ptr noundef @.str.50) #8
  unreachable

18:                                               ; preds = %1
  %19 = load i32, ptr %4, align 4
  %20 = call i32 @png_gamma_significant(i32 noundef %19)
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %37

22:                                               ; preds = %18
  %23 = load i32, ptr %4, align 4
  %24 = call i32 @png_gamma_not_sRGB(i32 noundef %23)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %33

26:                                               ; preds = %22
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.png_image_read_control, ptr %27, i32 0, i32 8
  store i32 3, ptr %28, align 8
  %29 = load i32, ptr %4, align 4
  %30 = call i32 @png_reciprocal(i32 noundef %29)
  %31 = load ptr, ptr %2, align 8
  %32 = getelementptr inbounds %struct.png_image_read_control, ptr %31, i32 0, i32 9
  store i32 %30, ptr %32, align 4
  br label %36

33:                                               ; preds = %22
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds %struct.png_image_read_control, ptr %34, i32 0, i32 8
  store i32 1, ptr %35, align 8
  br label %36

36:                                               ; preds = %33, %26
  br label %40

37:                                               ; preds = %18
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr inbounds %struct.png_image_read_control, ptr %38, i32 0, i32 8
  store i32 4, ptr %39, align 8
  br label %40

40:                                               ; preds = %37, %36
  ret void
}

declare i32 @png_gamma_significant(i32 noundef) #1

declare i32 @png_reciprocal(i32 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @decode_gamma(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = load i32, ptr %6, align 4
  %8 = icmp eq i32 %7, 3
  br i1 %8, label %9, label %13

9:                                                ; preds = %3
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.png_image_read_control, ptr %10, i32 0, i32 8
  %12 = load i32, ptr %11, align 8
  store i32 %12, ptr %6, align 4
  br label %13

13:                                               ; preds = %9, %3
  %14 = load i32, ptr %6, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %21

16:                                               ; preds = %13
  %17 = load ptr, ptr %4, align 8
  call void @set_file_encoding(ptr noundef %17)
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.png_image_read_control, ptr %18, i32 0, i32 8
  %20 = load i32, ptr %19, align 8
  store i32 %20, ptr %6, align 4
  br label %21

21:                                               ; preds = %16, %13
  %22 = load i32, ptr %6, align 4
  switch i32 %22, label %41 [
    i32 3, label %23
    i32 1, label %31
    i32 2, label %37
    i32 4, label %38
  ]

23:                                               ; preds = %21
  %24 = load i32, ptr %5, align 4
  %25 = mul i32 %24, 257
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.png_image_read_control, ptr %26, i32 0, i32 9
  %28 = load i32, ptr %27, align 4
  %29 = call zeroext i16 @png_gamma_16bit_correct(i32 noundef %25, i32 noundef %28)
  %30 = zext i16 %29 to i32
  store i32 %30, ptr %5, align 4
  br label %49

31:                                               ; preds = %21
  %32 = load i32, ptr %5, align 4
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %33
  %35 = load i16, ptr %34, align 2
  %36 = zext i16 %35 to i32
  store i32 %36, ptr %5, align 4
  br label %49

37:                                               ; preds = %21
  br label %49

38:                                               ; preds = %21
  %39 = load i32, ptr %5, align 4
  %40 = mul i32 %39, 257
  store i32 %40, ptr %5, align 4
  br label %49

41:                                               ; preds = %21
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds %struct.png_image_read_control, ptr %42, i32 0, i32 0
  %44 = load ptr, ptr %43, align 8
  %45 = getelementptr inbounds %struct.png_image, ptr %44, i32 0, i32 0
  %46 = load ptr, ptr %45, align 8
  %47 = getelementptr inbounds %struct.png_control, ptr %46, i32 0, i32 0
  %48 = load ptr, ptr %47, align 8
  call void @png_error(ptr noundef %48, ptr noundef @.str.51) #8
  unreachable

49:                                               ; preds = %38, %37, %31, %23
  %50 = load i32, ptr %5, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_image_skip_unused_chunks(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  call void @png_set_keep_unknown_chunks(ptr noundef %3, i32 noundef 1, ptr noundef null, i32 noundef -1)
  %4 = load ptr, ptr %2, align 8
  call void @png_set_keep_unknown_chunks(ptr noundef %4, i32 noundef 0, ptr noundef @png_image_skip_unused_chunks.chunks_to_process, i32 noundef 7)
  ret void
}

declare i64 @png_get_rowbytes(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_read_and_map(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i8, align 1
  %24 = alloca i8, align 1
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %27 = load ptr, ptr %2, align 8
  store ptr %27, ptr %3, align 8
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds %struct.png_image_read_control, ptr %28, i32 0, i32 0
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %4, align 8
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.png_image, ptr %31, i32 0, i32 0
  %33 = load ptr, ptr %32, align 8
  %34 = getelementptr inbounds %struct.png_control, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %34, align 8
  store ptr %35, ptr %5, align 8
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds %struct.png_struct_def, ptr %36, i32 0, i32 59
  %38 = load i8, ptr %37, align 4
  %39 = zext i8 %38 to i32
  switch i32 %39, label %42 [
    i32 0, label %40
    i32 1, label %41
  ]

40:                                               ; preds = %1
  store i32 1, ptr %6, align 4
  br label %44

41:                                               ; preds = %1
  store i32 7, ptr %6, align 4
  br label %44

42:                                               ; preds = %1
  %43 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %43, ptr noundef @.str.53) #8
  unreachable

44:                                               ; preds = %41, %40
  %45 = load ptr, ptr %4, align 8
  %46 = getelementptr inbounds %struct.png_image, ptr %45, i32 0, i32 3
  %47 = load i32, ptr %46, align 8
  store i32 %47, ptr %7, align 4
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds %struct.png_image, ptr %48, i32 0, i32 2
  %50 = load i32, ptr %49, align 4
  store i32 %50, ptr %8, align 4
  %51 = load ptr, ptr %3, align 8
  %52 = getelementptr inbounds %struct.png_image_read_control, ptr %51, i32 0, i32 10
  %53 = load i32, ptr %52, align 8
  store i32 %53, ptr %9, align 4
  %54 = load ptr, ptr %3, align 8
  %55 = getelementptr inbounds %struct.png_image_read_control, ptr %54, i32 0, i32 6
  %56 = load ptr, ptr %55, align 8
  store ptr %56, ptr %10, align 8
  %57 = load ptr, ptr %3, align 8
  %58 = getelementptr inbounds %struct.png_image_read_control, ptr %57, i32 0, i32 7
  %59 = load i64, ptr %58, align 8
  store i64 %59, ptr %11, align 8
  store i32 0, ptr %12, align 4
  br label %60

60:                                               ; preds = %412, %44
  %61 = load i32, ptr %12, align 4
  %62 = load i32, ptr %6, align 4
  %63 = icmp slt i32 %61, %62
  br i1 %63, label %64, label %415

64:                                               ; preds = %60
  %65 = load ptr, ptr %5, align 8
  %66 = getelementptr inbounds %struct.png_struct_def, ptr %65, i32 0, i32 59
  %67 = load i8, ptr %66, align 4
  %68 = zext i8 %67 to i32
  %69 = icmp eq i32 %68, 1
  br i1 %69, label %70, label %136

70:                                               ; preds = %64
  %71 = load i32, ptr %8, align 4
  %72 = load i32, ptr %12, align 4
  %73 = icmp sgt i32 %72, 1
  br i1 %73, label %74, label %78

74:                                               ; preds = %70
  %75 = load i32, ptr %12, align 4
  %76 = sub nsw i32 7, %75
  %77 = ashr i32 %76, 1
  br label %79

78:                                               ; preds = %70
  br label %79

79:                                               ; preds = %78, %74
  %80 = phi i32 [ %77, %74 ], [ 3, %78 ]
  %81 = shl i32 1, %80
  %82 = sub nsw i32 %81, 1
  %83 = load i32, ptr %12, align 4
  %84 = and i32 1, %83
  %85 = load i32, ptr %12, align 4
  %86 = add nsw i32 %85, 1
  %87 = ashr i32 %86, 1
  %88 = sub nsw i32 3, %87
  %89 = shl i32 %84, %88
  %90 = and i32 %89, 7
  %91 = sub nsw i32 %82, %90
  %92 = add i32 %71, %91
  %93 = load i32, ptr %12, align 4
  %94 = icmp sgt i32 %93, 1
  br i1 %94, label %95, label %99

95:                                               ; preds = %79
  %96 = load i32, ptr %12, align 4
  %97 = sub nsw i32 7, %96
  %98 = ashr i32 %97, 1
  br label %100

99:                                               ; preds = %79
  br label %100

100:                                              ; preds = %99, %95
  %101 = phi i32 [ %98, %95 ], [ 3, %99 ]
  %102 = lshr i32 %92, %101
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %104, label %105

104:                                              ; preds = %100
  br label %412

105:                                              ; preds = %100
  %106 = load i32, ptr %12, align 4
  %107 = and i32 1, %106
  %108 = load i32, ptr %12, align 4
  %109 = add nsw i32 %108, 1
  %110 = ashr i32 %109, 1
  %111 = sub nsw i32 3, %110
  %112 = shl i32 %107, %111
  %113 = and i32 %112, 7
  store i32 %113, ptr %13, align 4
  %114 = load i32, ptr %12, align 4
  %115 = sub nsw i32 7, %114
  %116 = ashr i32 %115, 1
  %117 = shl i32 1, %116
  store i32 %117, ptr %14, align 4
  %118 = load i32, ptr %12, align 4
  %119 = xor i32 %118, -1
  %120 = and i32 1, %119
  %121 = load i32, ptr %12, align 4
  %122 = ashr i32 %121, 1
  %123 = sub nsw i32 3, %122
  %124 = shl i32 %120, %123
  %125 = and i32 %124, 7
  store i32 %125, ptr %16, align 4
  %126 = load i32, ptr %12, align 4
  %127 = icmp sgt i32 %126, 2
  br i1 %127, label %128, label %133

128:                                              ; preds = %105
  %129 = load i32, ptr %12, align 4
  %130 = sub nsw i32 %129, 1
  %131 = ashr i32 %130, 1
  %132 = ashr i32 8, %131
  br label %134

133:                                              ; preds = %105
  br label %134

134:                                              ; preds = %133, %128
  %135 = phi i32 [ %132, %128 ], [ 8, %133 ]
  store i32 %135, ptr %15, align 4
  br label %137

136:                                              ; preds = %64
  store i32 0, ptr %16, align 4
  store i32 0, ptr %13, align 4
  store i32 1, ptr %15, align 4
  store i32 1, ptr %14, align 4
  br label %137

137:                                              ; preds = %136, %134
  br label %138

138:                                              ; preds = %407, %137
  %139 = load i32, ptr %16, align 4
  %140 = load i32, ptr %7, align 4
  %141 = icmp ult i32 %139, %140
  br i1 %141, label %142, label %411

142:                                              ; preds = %138
  %143 = load ptr, ptr %3, align 8
  %144 = getelementptr inbounds %struct.png_image_read_control, ptr %143, i32 0, i32 5
  %145 = load ptr, ptr %144, align 8
  store ptr %145, ptr %17, align 8
  %146 = load ptr, ptr %10, align 8
  %147 = load i32, ptr %16, align 4
  %148 = zext i32 %147 to i64
  %149 = load i64, ptr %11, align 8
  %150 = mul nsw i64 %148, %149
  %151 = getelementptr inbounds i8, ptr %146, i64 %150
  store ptr %151, ptr %18, align 8
  %152 = load ptr, ptr %18, align 8
  %153 = load i32, ptr %8, align 4
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds i8, ptr %152, i64 %154
  store ptr %155, ptr %19, align 8
  %156 = load ptr, ptr %5, align 8
  %157 = load ptr, ptr %17, align 8
  call void @png_read_row(ptr noundef %156, ptr noundef %157, ptr noundef null)
  %158 = load i32, ptr %13, align 4
  %159 = load ptr, ptr %18, align 8
  %160 = zext i32 %158 to i64
  %161 = getelementptr inbounds i8, ptr %159, i64 %160
  store ptr %161, ptr %18, align 8
  %162 = load i32, ptr %9, align 4
  switch i32 %162, label %405 [
    i32 1, label %163
    i32 2, label %211
    i32 3, label %245
    i32 4, label %286
  ]

163:                                              ; preds = %142
  br label %164

164:                                              ; preds = %205, %163
  %165 = load ptr, ptr %18, align 8
  %166 = load ptr, ptr %19, align 8
  %167 = icmp ult ptr %165, %166
  br i1 %167, label %168, label %210

168:                                              ; preds = %164
  %169 = load ptr, ptr %17, align 8
  %170 = getelementptr inbounds i8, ptr %169, i32 1
  store ptr %170, ptr %17, align 8
  %171 = load i8, ptr %169, align 1
  %172 = zext i8 %171 to i32
  store i32 %172, ptr %20, align 4
  %173 = load ptr, ptr %17, align 8
  %174 = getelementptr inbounds i8, ptr %173, i32 1
  store ptr %174, ptr %17, align 8
  %175 = load i8, ptr %173, align 1
  %176 = zext i8 %175 to i32
  store i32 %176, ptr %21, align 4
  %177 = load i32, ptr %21, align 4
  %178 = icmp ugt i32 %177, 229
  br i1 %178, label %179, label %184

179:                                              ; preds = %168
  %180 = load i32, ptr %20, align 4
  %181 = mul i32 231, %180
  %182 = add i32 %181, 128
  %183 = lshr i32 %182, 8
  store i32 %183, ptr %22, align 4
  br label %201

184:                                              ; preds = %168
  %185 = load i32, ptr %21, align 4
  %186 = icmp ult i32 %185, 26
  br i1 %186, label %187, label %188

187:                                              ; preds = %184
  store i32 231, ptr %22, align 4
  br label %200

188:                                              ; preds = %184
  %189 = load i32, ptr %21, align 4
  %190 = mul i32 %189, 5
  %191 = add i32 %190, 130
  %192 = lshr i32 %191, 8
  %193 = mul i32 6, %192
  %194 = add i32 226, %193
  %195 = load i32, ptr %20, align 4
  %196 = mul i32 %195, 5
  %197 = add i32 %196, 130
  %198 = lshr i32 %197, 8
  %199 = add i32 %194, %198
  store i32 %199, ptr %22, align 4
  br label %200

200:                                              ; preds = %188, %187
  br label %201

201:                                              ; preds = %200, %179
  %202 = load i32, ptr %22, align 4
  %203 = trunc i32 %202 to i8
  %204 = load ptr, ptr %18, align 8
  store i8 %203, ptr %204, align 1
  br label %205

205:                                              ; preds = %201
  %206 = load i32, ptr %14, align 4
  %207 = load ptr, ptr %18, align 8
  %208 = zext i32 %206 to i64
  %209 = getelementptr inbounds i8, ptr %207, i64 %208
  store ptr %209, ptr %18, align 8
  br label %164, !llvm.loop !39

210:                                              ; preds = %164
  br label %406

211:                                              ; preds = %142
  br label %212

212:                                              ; preds = %239, %211
  %213 = load ptr, ptr %18, align 8
  %214 = load ptr, ptr %19, align 8
  %215 = icmp ult ptr %213, %214
  br i1 %215, label %216, label %244

216:                                              ; preds = %212
  %217 = load ptr, ptr %17, align 8
  %218 = getelementptr inbounds i8, ptr %217, i32 1
  store ptr %218, ptr %17, align 8
  %219 = load i8, ptr %217, align 1
  store i8 %219, ptr %23, align 1
  %220 = load ptr, ptr %17, align 8
  %221 = getelementptr inbounds i8, ptr %220, i32 1
  store ptr %221, ptr %17, align 8
  %222 = load i8, ptr %220, align 1
  store i8 %222, ptr %24, align 1
  %223 = load i8, ptr %24, align 1
  %224 = zext i8 %223 to i32
  %225 = icmp eq i32 %224, 0
  br i1 %225, label %226, label %228

226:                                              ; preds = %216
  %227 = load ptr, ptr %18, align 8
  store i8 -2, ptr %227, align 1
  br label %238

228:                                              ; preds = %216
  %229 = load i8, ptr %23, align 1
  %230 = zext i8 %229 to i32
  %231 = icmp ne i32 %230, 254
  br i1 %231, label %232, label %235

232:                                              ; preds = %228
  %233 = load i8, ptr %23, align 1
  %234 = load ptr, ptr %18, align 8
  store i8 %233, ptr %234, align 1
  br label %237

235:                                              ; preds = %228
  %236 = load ptr, ptr %18, align 8
  store i8 -1, ptr %236, align 1
  br label %237

237:                                              ; preds = %235, %232
  br label %238

238:                                              ; preds = %237, %226
  br label %239

239:                                              ; preds = %238
  %240 = load i32, ptr %14, align 4
  %241 = load ptr, ptr %18, align 8
  %242 = zext i32 %240 to i64
  %243 = getelementptr inbounds i8, ptr %241, i64 %242
  store ptr %243, ptr %18, align 8
  br label %212, !llvm.loop !40

244:                                              ; preds = %212
  br label %406

245:                                              ; preds = %142
  br label %246

246:                                              ; preds = %280, %245
  %247 = load ptr, ptr %18, align 8
  %248 = load ptr, ptr %19, align 8
  %249 = icmp ult ptr %247, %248
  br i1 %249, label %250, label %285

250:                                              ; preds = %246
  %251 = load ptr, ptr %17, align 8
  %252 = getelementptr inbounds i8, ptr %251, i64 0
  %253 = load i8, ptr %252, align 1
  %254 = zext i8 %253 to i32
  %255 = mul nsw i32 %254, 5
  %256 = add nsw i32 %255, 130
  %257 = ashr i32 %256, 8
  %258 = mul nsw i32 6, %257
  %259 = load ptr, ptr %17, align 8
  %260 = getelementptr inbounds i8, ptr %259, i64 1
  %261 = load i8, ptr %260, align 1
  %262 = zext i8 %261 to i32
  %263 = mul nsw i32 %262, 5
  %264 = add nsw i32 %263, 130
  %265 = ashr i32 %264, 8
  %266 = add nsw i32 %258, %265
  %267 = mul nsw i32 6, %266
  %268 = load ptr, ptr %17, align 8
  %269 = getelementptr inbounds i8, ptr %268, i64 2
  %270 = load i8, ptr %269, align 1
  %271 = zext i8 %270 to i32
  %272 = mul nsw i32 %271, 5
  %273 = add nsw i32 %272, 130
  %274 = ashr i32 %273, 8
  %275 = add nsw i32 %267, %274
  %276 = trunc i32 %275 to i8
  %277 = load ptr, ptr %18, align 8
  store i8 %276, ptr %277, align 1
  %278 = load ptr, ptr %17, align 8
  %279 = getelementptr inbounds i8, ptr %278, i64 3
  store ptr %279, ptr %17, align 8
  br label %280

280:                                              ; preds = %250
  %281 = load i32, ptr %14, align 4
  %282 = load ptr, ptr %18, align 8
  %283 = zext i32 %281 to i64
  %284 = getelementptr inbounds i8, ptr %282, i64 %283
  store ptr %284, ptr %18, align 8
  br label %246, !llvm.loop !41

285:                                              ; preds = %246
  br label %406

286:                                              ; preds = %142
  br label %287

287:                                              ; preds = %399, %286
  %288 = load ptr, ptr %18, align 8
  %289 = load ptr, ptr %19, align 8
  %290 = icmp ult ptr %288, %289
  br i1 %290, label %291, label %404

291:                                              ; preds = %287
  %292 = load ptr, ptr %17, align 8
  %293 = getelementptr inbounds i8, ptr %292, i64 3
  %294 = load i8, ptr %293, align 1
  %295 = zext i8 %294 to i32
  store i32 %295, ptr %25, align 4
  %296 = load i32, ptr %25, align 4
  %297 = icmp uge i32 %296, 196
  br i1 %297, label %298, label %326

298:                                              ; preds = %291
  %299 = load ptr, ptr %17, align 8
  %300 = getelementptr inbounds i8, ptr %299, i64 0
  %301 = load i8, ptr %300, align 1
  %302 = zext i8 %301 to i32
  %303 = mul nsw i32 %302, 5
  %304 = add nsw i32 %303, 130
  %305 = ashr i32 %304, 8
  %306 = mul nsw i32 6, %305
  %307 = load ptr, ptr %17, align 8
  %308 = getelementptr inbounds i8, ptr %307, i64 1
  %309 = load i8, ptr %308, align 1
  %310 = zext i8 %309 to i32
  %311 = mul nsw i32 %310, 5
  %312 = add nsw i32 %311, 130
  %313 = ashr i32 %312, 8
  %314 = add nsw i32 %306, %313
  %315 = mul nsw i32 6, %314
  %316 = load ptr, ptr %17, align 8
  %317 = getelementptr inbounds i8, ptr %316, i64 2
  %318 = load i8, ptr %317, align 1
  %319 = zext i8 %318 to i32
  %320 = mul nsw i32 %319, 5
  %321 = add nsw i32 %320, 130
  %322 = ashr i32 %321, 8
  %323 = add nsw i32 %315, %322
  %324 = trunc i32 %323 to i8
  %325 = load ptr, ptr %18, align 8
  store i8 %324, ptr %325, align 1
  br label %396

326:                                              ; preds = %291
  %327 = load i32, ptr %25, align 4
  %328 = icmp ult i32 %327, 64
  br i1 %328, label %329, label %331

329:                                              ; preds = %326
  %330 = load ptr, ptr %18, align 8
  store i8 -40, ptr %330, align 1
  br label %395

331:                                              ; preds = %326
  store i32 217, ptr %26, align 4
  %332 = load ptr, ptr %17, align 8
  %333 = getelementptr inbounds i8, ptr %332, i64 0
  %334 = load i8, ptr %333, align 1
  %335 = zext i8 %334 to i32
  %336 = and i32 %335, 128
  %337 = icmp ne i32 %336, 0
  br i1 %337, label %338, label %341

338:                                              ; preds = %331
  %339 = load i32, ptr %26, align 4
  %340 = add i32 %339, 9
  store i32 %340, ptr %26, align 4
  br label %341

341:                                              ; preds = %338, %331
  %342 = load ptr, ptr %17, align 8
  %343 = getelementptr inbounds i8, ptr %342, i64 0
  %344 = load i8, ptr %343, align 1
  %345 = zext i8 %344 to i32
  %346 = and i32 %345, 64
  %347 = icmp ne i32 %346, 0
  br i1 %347, label %348, label %351

348:                                              ; preds = %341
  %349 = load i32, ptr %26, align 4
  %350 = add i32 %349, 9
  store i32 %350, ptr %26, align 4
  br label %351

351:                                              ; preds = %348, %341
  %352 = load ptr, ptr %17, align 8
  %353 = getelementptr inbounds i8, ptr %352, i64 0
  %354 = load i8, ptr %353, align 1
  %355 = zext i8 %354 to i32
  %356 = and i32 %355, 128
  %357 = icmp ne i32 %356, 0
  br i1 %357, label %358, label %361

358:                                              ; preds = %351
  %359 = load i32, ptr %26, align 4
  %360 = add i32 %359, 3
  store i32 %360, ptr %26, align 4
  br label %361

361:                                              ; preds = %358, %351
  %362 = load ptr, ptr %17, align 8
  %363 = getelementptr inbounds i8, ptr %362, i64 0
  %364 = load i8, ptr %363, align 1
  %365 = zext i8 %364 to i32
  %366 = and i32 %365, 64
  %367 = icmp ne i32 %366, 0
  br i1 %367, label %368, label %371

368:                                              ; preds = %361
  %369 = load i32, ptr %26, align 4
  %370 = add i32 %369, 3
  store i32 %370, ptr %26, align 4
  br label %371

371:                                              ; preds = %368, %361
  %372 = load ptr, ptr %17, align 8
  %373 = getelementptr inbounds i8, ptr %372, i64 0
  %374 = load i8, ptr %373, align 1
  %375 = zext i8 %374 to i32
  %376 = and i32 %375, 128
  %377 = icmp ne i32 %376, 0
  br i1 %377, label %378, label %381

378:                                              ; preds = %371
  %379 = load i32, ptr %26, align 4
  %380 = add i32 %379, 1
  store i32 %380, ptr %26, align 4
  br label %381

381:                                              ; preds = %378, %371
  %382 = load ptr, ptr %17, align 8
  %383 = getelementptr inbounds i8, ptr %382, i64 0
  %384 = load i8, ptr %383, align 1
  %385 = zext i8 %384 to i32
  %386 = and i32 %385, 64
  %387 = icmp ne i32 %386, 0
  br i1 %387, label %388, label %391

388:                                              ; preds = %381
  %389 = load i32, ptr %26, align 4
  %390 = add i32 %389, 1
  store i32 %390, ptr %26, align 4
  br label %391

391:                                              ; preds = %388, %381
  %392 = load i32, ptr %26, align 4
  %393 = trunc i32 %392 to i8
  %394 = load ptr, ptr %18, align 8
  store i8 %393, ptr %394, align 1
  br label %395

395:                                              ; preds = %391, %329
  br label %396

396:                                              ; preds = %395, %298
  %397 = load ptr, ptr %17, align 8
  %398 = getelementptr inbounds i8, ptr %397, i64 4
  store ptr %398, ptr %17, align 8
  br label %399

399:                                              ; preds = %396
  %400 = load i32, ptr %14, align 4
  %401 = load ptr, ptr %18, align 8
  %402 = zext i32 %400 to i64
  %403 = getelementptr inbounds i8, ptr %401, i64 %402
  store ptr %403, ptr %18, align 8
  br label %287, !llvm.loop !42

404:                                              ; preds = %287
  br label %406

405:                                              ; preds = %142
  br label %406

406:                                              ; preds = %405, %404, %285, %244, %210
  br label %407

407:                                              ; preds = %406
  %408 = load i32, ptr %15, align 4
  %409 = load i32, ptr %16, align 4
  %410 = add i32 %409, %408
  store i32 %410, ptr %16, align 4
  br label %138, !llvm.loop !43

411:                                              ; preds = %138
  br label %412

412:                                              ; preds = %411, %104
  %413 = load i32, ptr %12, align 4
  %414 = add nsw i32 %413, 1
  store i32 %414, ptr %12, align 4
  br label %60, !llvm.loop !44

415:                                              ; preds = %60
  ret i32 1
}

declare void @png_set_keep_unknown_chunks(ptr noundef, i32 noundef, ptr noundef, i32 noundef) #1

declare i32 @png_muldiv(ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

declare void @png_set_add_alpha(ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_read_composite(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca i8, align 1
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %22 = load ptr, ptr %2, align 8
  store ptr %22, ptr %3, align 8
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.png_image_read_control, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %4, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.png_image, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds %struct.png_control, ptr %28, i32 0, i32 0
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %5, align 8
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds %struct.png_struct_def, ptr %31, i32 0, i32 59
  %33 = load i8, ptr %32, align 4
  %34 = zext i8 %33 to i32
  switch i32 %34, label %37 [
    i32 0, label %35
    i32 1, label %36
  ]

35:                                               ; preds = %1
  store i32 1, ptr %6, align 4
  br label %39

36:                                               ; preds = %1
  store i32 7, ptr %6, align 4
  br label %39

37:                                               ; preds = %1
  %38 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %38, ptr noundef @.str.53) #8
  unreachable

39:                                               ; preds = %36, %35
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.png_image, ptr %40, i32 0, i32 3
  %42 = load i32, ptr %41, align 8
  store i32 %42, ptr %7, align 4
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds %struct.png_image, ptr %43, i32 0, i32 2
  %45 = load i32, ptr %44, align 4
  store i32 %45, ptr %8, align 4
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds %struct.png_image_read_control, ptr %46, i32 0, i32 7
  %48 = load i64, ptr %47, align 8
  store i64 %48, ptr %9, align 8
  %49 = load ptr, ptr %4, align 8
  %50 = getelementptr inbounds %struct.png_image, ptr %49, i32 0, i32 4
  %51 = load i32, ptr %50, align 4
  %52 = and i32 %51, 2
  %53 = icmp ne i32 %52, 0
  %54 = zext i1 %53 to i64
  %55 = select i1 %53, i32 3, i32 1
  store i32 %55, ptr %10, align 4
  store i32 0, ptr %11, align 4
  br label %56

56:                                               ; preds = %263, %39
  %57 = load i32, ptr %11, align 4
  %58 = load i32, ptr %6, align 4
  %59 = icmp slt i32 %57, %58
  br i1 %59, label %60, label %266

60:                                               ; preds = %56
  %61 = load ptr, ptr %5, align 8
  %62 = getelementptr inbounds %struct.png_struct_def, ptr %61, i32 0, i32 59
  %63 = load i8, ptr %62, align 4
  %64 = zext i8 %63 to i32
  %65 = icmp eq i32 %64, 1
  br i1 %65, label %66, label %136

66:                                               ; preds = %60
  %67 = load i32, ptr %8, align 4
  %68 = load i32, ptr %11, align 4
  %69 = icmp sgt i32 %68, 1
  br i1 %69, label %70, label %74

70:                                               ; preds = %66
  %71 = load i32, ptr %11, align 4
  %72 = sub nsw i32 7, %71
  %73 = ashr i32 %72, 1
  br label %75

74:                                               ; preds = %66
  br label %75

75:                                               ; preds = %74, %70
  %76 = phi i32 [ %73, %70 ], [ 3, %74 ]
  %77 = shl i32 1, %76
  %78 = sub nsw i32 %77, 1
  %79 = load i32, ptr %11, align 4
  %80 = and i32 1, %79
  %81 = load i32, ptr %11, align 4
  %82 = add nsw i32 %81, 1
  %83 = ashr i32 %82, 1
  %84 = sub nsw i32 3, %83
  %85 = shl i32 %80, %84
  %86 = and i32 %85, 7
  %87 = sub nsw i32 %78, %86
  %88 = add i32 %67, %87
  %89 = load i32, ptr %11, align 4
  %90 = icmp sgt i32 %89, 1
  br i1 %90, label %91, label %95

91:                                               ; preds = %75
  %92 = load i32, ptr %11, align 4
  %93 = sub nsw i32 7, %92
  %94 = ashr i32 %93, 1
  br label %96

95:                                               ; preds = %75
  br label %96

96:                                               ; preds = %95, %91
  %97 = phi i32 [ %94, %91 ], [ 3, %95 ]
  %98 = lshr i32 %88, %97
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %101

100:                                              ; preds = %96
  br label %263

101:                                              ; preds = %96
  %102 = load i32, ptr %11, align 4
  %103 = and i32 1, %102
  %104 = load i32, ptr %11, align 4
  %105 = add nsw i32 %104, 1
  %106 = ashr i32 %105, 1
  %107 = sub nsw i32 3, %106
  %108 = shl i32 %103, %107
  %109 = and i32 %108, 7
  %110 = load i32, ptr %10, align 4
  %111 = mul i32 %109, %110
  store i32 %111, ptr %12, align 4
  %112 = load i32, ptr %11, align 4
  %113 = sub nsw i32 7, %112
  %114 = ashr i32 %113, 1
  %115 = shl i32 1, %114
  %116 = load i32, ptr %10, align 4
  %117 = mul i32 %115, %116
  store i32 %117, ptr %13, align 4
  %118 = load i32, ptr %11, align 4
  %119 = xor i32 %118, -1
  %120 = and i32 1, %119
  %121 = load i32, ptr %11, align 4
  %122 = ashr i32 %121, 1
  %123 = sub nsw i32 3, %122
  %124 = shl i32 %120, %123
  %125 = and i32 %124, 7
  store i32 %125, ptr %15, align 4
  %126 = load i32, ptr %11, align 4
  %127 = icmp sgt i32 %126, 2
  br i1 %127, label %128, label %133

128:                                              ; preds = %101
  %129 = load i32, ptr %11, align 4
  %130 = sub nsw i32 %129, 1
  %131 = ashr i32 %130, 1
  %132 = ashr i32 8, %131
  br label %134

133:                                              ; preds = %101
  br label %134

134:                                              ; preds = %133, %128
  %135 = phi i32 [ %132, %128 ], [ 8, %133 ]
  store i32 %135, ptr %14, align 4
  br label %138

136:                                              ; preds = %60
  store i32 0, ptr %15, align 4
  store i32 0, ptr %12, align 4
  %137 = load i32, ptr %10, align 4
  store i32 %137, ptr %13, align 4
  store i32 1, ptr %14, align 4
  br label %138

138:                                              ; preds = %136, %134
  br label %139

139:                                              ; preds = %258, %138
  %140 = load i32, ptr %15, align 4
  %141 = load i32, ptr %7, align 4
  %142 = icmp ult i32 %140, %141
  br i1 %142, label %143, label %262

143:                                              ; preds = %139
  %144 = load ptr, ptr %3, align 8
  %145 = getelementptr inbounds %struct.png_image_read_control, ptr %144, i32 0, i32 5
  %146 = load ptr, ptr %145, align 8
  store ptr %146, ptr %16, align 8
  %147 = load ptr, ptr %5, align 8
  %148 = load ptr, ptr %16, align 8
  call void @png_read_row(ptr noundef %147, ptr noundef %148, ptr noundef null)
  %149 = load ptr, ptr %3, align 8
  %150 = getelementptr inbounds %struct.png_image_read_control, ptr %149, i32 0, i32 6
  %151 = load ptr, ptr %150, align 8
  store ptr %151, ptr %17, align 8
  %152 = load i32, ptr %15, align 4
  %153 = zext i32 %152 to i64
  %154 = load i64, ptr %9, align 8
  %155 = mul nsw i64 %153, %154
  %156 = load ptr, ptr %17, align 8
  %157 = getelementptr inbounds i8, ptr %156, i64 %155
  store ptr %157, ptr %17, align 8
  %158 = load ptr, ptr %17, align 8
  %159 = load i32, ptr %8, align 4
  %160 = load i32, ptr %10, align 4
  %161 = mul i32 %159, %160
  %162 = zext i32 %161 to i64
  %163 = getelementptr inbounds i8, ptr %158, i64 %162
  store ptr %163, ptr %18, align 8
  %164 = load i32, ptr %12, align 4
  %165 = load ptr, ptr %17, align 8
  %166 = zext i32 %164 to i64
  %167 = getelementptr inbounds i8, ptr %165, i64 %166
  store ptr %167, ptr %17, align 8
  br label %168

168:                                              ; preds = %252, %143
  %169 = load ptr, ptr %17, align 8
  %170 = load ptr, ptr %18, align 8
  %171 = icmp ult ptr %169, %170
  br i1 %171, label %172, label %257

172:                                              ; preds = %168
  %173 = load ptr, ptr %16, align 8
  %174 = load i32, ptr %10, align 4
  %175 = zext i32 %174 to i64
  %176 = getelementptr inbounds i8, ptr %173, i64 %175
  %177 = load i8, ptr %176, align 1
  store i8 %177, ptr %19, align 1
  %178 = load i8, ptr %19, align 1
  %179 = zext i8 %178 to i32
  %180 = icmp sgt i32 %179, 0
  br i1 %180, label %181, label %246

181:                                              ; preds = %172
  store i32 0, ptr %20, align 4
  br label %182

182:                                              ; preds = %242, %181
  %183 = load i32, ptr %20, align 4
  %184 = load i32, ptr %10, align 4
  %185 = icmp ult i32 %183, %184
  br i1 %185, label %186, label %245

186:                                              ; preds = %182
  %187 = load ptr, ptr %16, align 8
  %188 = load i32, ptr %20, align 4
  %189 = zext i32 %188 to i64
  %190 = getelementptr inbounds i8, ptr %187, i64 %189
  %191 = load i8, ptr %190, align 1
  %192 = zext i8 %191 to i32
  store i32 %192, ptr %21, align 4
  %193 = load i8, ptr %19, align 1
  %194 = zext i8 %193 to i32
  %195 = icmp slt i32 %194, 255
  br i1 %195, label %196, label %235

196:                                              ; preds = %186
  %197 = load i32, ptr %21, align 4
  %198 = mul i32 %197, 65535
  store i32 %198, ptr %21, align 4
  %199 = load i8, ptr %19, align 1
  %200 = zext i8 %199 to i32
  %201 = sub nsw i32 255, %200
  %202 = load ptr, ptr %17, align 8
  %203 = load i32, ptr %20, align 4
  %204 = zext i32 %203 to i64
  %205 = getelementptr inbounds i8, ptr %202, i64 %204
  %206 = load i8, ptr %205, align 1
  %207 = zext i8 %206 to i64
  %208 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %207
  %209 = load i16, ptr %208, align 2
  %210 = zext i16 %209 to i32
  %211 = mul nsw i32 %201, %210
  %212 = load i32, ptr %21, align 4
  %213 = add i32 %212, %211
  store i32 %213, ptr %21, align 4
  %214 = load i32, ptr %21, align 4
  %215 = lshr i32 %214, 15
  %216 = zext i32 %215 to i64
  %217 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %216
  %218 = load i16, ptr %217, align 2
  %219 = zext i16 %218 to i32
  %220 = load i32, ptr %21, align 4
  %221 = and i32 %220, 32767
  %222 = load i32, ptr %21, align 4
  %223 = lshr i32 %222, 15
  %224 = zext i32 %223 to i64
  %225 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %224
  %226 = load i8, ptr %225, align 1
  %227 = zext i8 %226 to i32
  %228 = mul i32 %221, %227
  %229 = lshr i32 %228, 12
  %230 = add i32 %219, %229
  %231 = lshr i32 %230, 8
  %232 = and i32 255, %231
  %233 = trunc i32 %232 to i8
  %234 = zext i8 %233 to i32
  store i32 %234, ptr %21, align 4
  br label %235

235:                                              ; preds = %196, %186
  %236 = load i32, ptr %21, align 4
  %237 = trunc i32 %236 to i8
  %238 = load ptr, ptr %17, align 8
  %239 = load i32, ptr %20, align 4
  %240 = zext i32 %239 to i64
  %241 = getelementptr inbounds i8, ptr %238, i64 %240
  store i8 %237, ptr %241, align 1
  br label %242

242:                                              ; preds = %235
  %243 = load i32, ptr %20, align 4
  %244 = add i32 %243, 1
  store i32 %244, ptr %20, align 4
  br label %182, !llvm.loop !45

245:                                              ; preds = %182
  br label %246

246:                                              ; preds = %245, %172
  %247 = load i32, ptr %10, align 4
  %248 = add i32 %247, 1
  %249 = load ptr, ptr %16, align 8
  %250 = zext i32 %248 to i64
  %251 = getelementptr inbounds i8, ptr %249, i64 %250
  store ptr %251, ptr %16, align 8
  br label %252

252:                                              ; preds = %246
  %253 = load i32, ptr %13, align 4
  %254 = load ptr, ptr %17, align 8
  %255 = zext i32 %253 to i64
  %256 = getelementptr inbounds i8, ptr %254, i64 %255
  store ptr %256, ptr %17, align 8
  br label %168, !llvm.loop !46

257:                                              ; preds = %168
  br label %258

258:                                              ; preds = %257
  %259 = load i32, ptr %14, align 4
  %260 = load i32, ptr %15, align 4
  %261 = add i32 %260, %259
  store i32 %261, ptr %15, align 4
  br label %139, !llvm.loop !47

262:                                              ; preds = %139
  br label %263

263:                                              ; preds = %262, %100
  %264 = load i32, ptr %11, align 4
  %265 = add nsw i32 %264, 1
  store i32 %265, ptr %11, align 4
  br label %56, !llvm.loop !48

266:                                              ; preds = %56
  ret i32 1
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_read_background(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i64, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca i8, align 1
  %21 = alloca i32, align 4
  %22 = alloca i8, align 1
  %23 = alloca i16, align 2
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca i8, align 1
  %28 = alloca i32, align 4
  %29 = alloca ptr, align 8
  %30 = alloca i64, align 8
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca ptr, align 8
  %39 = alloca ptr, align 8
  %40 = alloca ptr, align 8
  %41 = alloca i32, align 4
  %42 = alloca i16, align 2
  store ptr %0, ptr %2, align 8
  %43 = load ptr, ptr %2, align 8
  store ptr %43, ptr %3, align 8
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds %struct.png_image_read_control, ptr %44, i32 0, i32 0
  %46 = load ptr, ptr %45, align 8
  store ptr %46, ptr %4, align 8
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds %struct.png_image, ptr %47, i32 0, i32 0
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds %struct.png_control, ptr %49, i32 0, i32 0
  %51 = load ptr, ptr %50, align 8
  store ptr %51, ptr %5, align 8
  %52 = load ptr, ptr %4, align 8
  %53 = getelementptr inbounds %struct.png_image, ptr %52, i32 0, i32 0
  %54 = load ptr, ptr %53, align 8
  %55 = getelementptr inbounds %struct.png_control, ptr %54, i32 0, i32 1
  %56 = load ptr, ptr %55, align 8
  store ptr %56, ptr %6, align 8
  %57 = load ptr, ptr %4, align 8
  %58 = getelementptr inbounds %struct.png_image, ptr %57, i32 0, i32 3
  %59 = load i32, ptr %58, align 8
  store i32 %59, ptr %7, align 4
  %60 = load ptr, ptr %4, align 8
  %61 = getelementptr inbounds %struct.png_image, ptr %60, i32 0, i32 2
  %62 = load i32, ptr %61, align 4
  store i32 %62, ptr %8, align 4
  %63 = load ptr, ptr %5, align 8
  %64 = getelementptr inbounds %struct.png_struct_def, ptr %63, i32 0, i32 17
  %65 = load i32, ptr %64, align 4
  %66 = and i32 %65, 6291456
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %70

68:                                               ; preds = %1
  %69 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %69, ptr noundef @.str.58) #8
  unreachable

70:                                               ; preds = %1
  %71 = load ptr, ptr %5, align 8
  %72 = getelementptr inbounds %struct.png_struct_def, ptr %71, i32 0, i32 17
  %73 = load i32, ptr %72, align 4
  %74 = and i32 %73, 128
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %78

76:                                               ; preds = %70
  %77 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %77, ptr noundef @.str.59) #8
  unreachable

78:                                               ; preds = %70
  %79 = load ptr, ptr %5, align 8
  %80 = load ptr, ptr %6, align 8
  %81 = call zeroext i8 @png_get_channels(ptr noundef %79, ptr noundef %80)
  %82 = zext i8 %81 to i32
  %83 = icmp ne i32 %82, 2
  br i1 %83, label %84, label %86

84:                                               ; preds = %78
  %85 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %85, ptr noundef @.str.60) #8
  unreachable

86:                                               ; preds = %78
  %87 = load ptr, ptr %4, align 8
  %88 = getelementptr inbounds %struct.png_image, ptr %87, i32 0, i32 4
  %89 = load i32, ptr %88, align 4
  %90 = and i32 %89, 4
  %91 = icmp eq i32 %90, 0
  br i1 %91, label %92, label %100

92:                                               ; preds = %86
  %93 = load ptr, ptr %4, align 8
  %94 = getelementptr inbounds %struct.png_image, ptr %93, i32 0, i32 4
  %95 = load i32, ptr %94, align 4
  %96 = and i32 %95, 1
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %100

98:                                               ; preds = %92
  %99 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %99, ptr noundef @.str.61) #8
  unreachable

100:                                              ; preds = %92, %86
  %101 = load ptr, ptr %5, align 8
  %102 = getelementptr inbounds %struct.png_struct_def, ptr %101, i32 0, i32 59
  %103 = load i8, ptr %102, align 4
  %104 = zext i8 %103 to i32
  switch i32 %104, label %107 [
    i32 0, label %105
    i32 1, label %106
  ]

105:                                              ; preds = %100
  store i32 1, ptr %10, align 4
  br label %109

106:                                              ; preds = %100
  store i32 7, ptr %10, align 4
  br label %109

107:                                              ; preds = %100
  %108 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %108, ptr noundef @.str.53) #8
  unreachable

109:                                              ; preds = %106, %105
  %110 = load ptr, ptr %6, align 8
  %111 = getelementptr inbounds %struct.png_info_def, ptr %110, i32 0, i32 7
  %112 = load i8, ptr %111, align 4
  %113 = zext i8 %112 to i32
  switch i32 %113, label %629 [
    i32 8, label %114
    i32 16, label %428
  ]

114:                                              ; preds = %109
  %115 = load ptr, ptr %3, align 8
  %116 = getelementptr inbounds %struct.png_image_read_control, ptr %115, i32 0, i32 6
  %117 = load ptr, ptr %116, align 8
  store ptr %117, ptr %11, align 8
  %118 = load ptr, ptr %3, align 8
  %119 = getelementptr inbounds %struct.png_image_read_control, ptr %118, i32 0, i32 7
  %120 = load i64, ptr %119, align 8
  store i64 %120, ptr %12, align 8
  store i32 0, ptr %9, align 4
  br label %121

121:                                              ; preds = %424, %114
  %122 = load i32, ptr %9, align 4
  %123 = load i32, ptr %10, align 4
  %124 = icmp slt i32 %122, %123
  br i1 %124, label %125, label %427

125:                                              ; preds = %121
  %126 = load ptr, ptr %5, align 8
  %127 = getelementptr inbounds %struct.png_struct_def, ptr %126, i32 0, i32 59
  %128 = load i8, ptr %127, align 4
  %129 = zext i8 %128 to i32
  %130 = icmp eq i32 %129, 1
  br i1 %130, label %131, label %197

131:                                              ; preds = %125
  %132 = load i32, ptr %8, align 4
  %133 = load i32, ptr %9, align 4
  %134 = icmp sgt i32 %133, 1
  br i1 %134, label %135, label %139

135:                                              ; preds = %131
  %136 = load i32, ptr %9, align 4
  %137 = sub nsw i32 7, %136
  %138 = ashr i32 %137, 1
  br label %140

139:                                              ; preds = %131
  br label %140

140:                                              ; preds = %139, %135
  %141 = phi i32 [ %138, %135 ], [ 3, %139 ]
  %142 = shl i32 1, %141
  %143 = sub nsw i32 %142, 1
  %144 = load i32, ptr %9, align 4
  %145 = and i32 1, %144
  %146 = load i32, ptr %9, align 4
  %147 = add nsw i32 %146, 1
  %148 = ashr i32 %147, 1
  %149 = sub nsw i32 3, %148
  %150 = shl i32 %145, %149
  %151 = and i32 %150, 7
  %152 = sub nsw i32 %143, %151
  %153 = add i32 %132, %152
  %154 = load i32, ptr %9, align 4
  %155 = icmp sgt i32 %154, 1
  br i1 %155, label %156, label %160

156:                                              ; preds = %140
  %157 = load i32, ptr %9, align 4
  %158 = sub nsw i32 7, %157
  %159 = ashr i32 %158, 1
  br label %161

160:                                              ; preds = %140
  br label %161

161:                                              ; preds = %160, %156
  %162 = phi i32 [ %159, %156 ], [ 3, %160 ]
  %163 = lshr i32 %153, %162
  %164 = icmp eq i32 %163, 0
  br i1 %164, label %165, label %166

165:                                              ; preds = %161
  br label %424

166:                                              ; preds = %161
  %167 = load i32, ptr %9, align 4
  %168 = and i32 1, %167
  %169 = load i32, ptr %9, align 4
  %170 = add nsw i32 %169, 1
  %171 = ashr i32 %170, 1
  %172 = sub nsw i32 3, %171
  %173 = shl i32 %168, %172
  %174 = and i32 %173, 7
  store i32 %174, ptr %13, align 4
  %175 = load i32, ptr %9, align 4
  %176 = sub nsw i32 7, %175
  %177 = ashr i32 %176, 1
  %178 = shl i32 1, %177
  store i32 %178, ptr %14, align 4
  %179 = load i32, ptr %9, align 4
  %180 = xor i32 %179, -1
  %181 = and i32 1, %180
  %182 = load i32, ptr %9, align 4
  %183 = ashr i32 %182, 1
  %184 = sub nsw i32 3, %183
  %185 = shl i32 %181, %184
  %186 = and i32 %185, 7
  store i32 %186, ptr %16, align 4
  %187 = load i32, ptr %9, align 4
  %188 = icmp sgt i32 %187, 2
  br i1 %188, label %189, label %194

189:                                              ; preds = %166
  %190 = load i32, ptr %9, align 4
  %191 = sub nsw i32 %190, 1
  %192 = ashr i32 %191, 1
  %193 = ashr i32 8, %192
  br label %195

194:                                              ; preds = %166
  br label %195

195:                                              ; preds = %194, %189
  %196 = phi i32 [ %193, %189 ], [ 8, %194 ]
  store i32 %196, ptr %15, align 4
  br label %198

197:                                              ; preds = %125
  store i32 0, ptr %16, align 4
  store i32 0, ptr %13, align 4
  store i32 1, ptr %15, align 4
  store i32 1, ptr %14, align 4
  br label %198

198:                                              ; preds = %197, %195
  %199 = load ptr, ptr %3, align 8
  %200 = getelementptr inbounds %struct.png_image_read_control, ptr %199, i32 0, i32 4
  %201 = load ptr, ptr %200, align 8
  %202 = icmp eq ptr %201, null
  br i1 %202, label %203, label %309

203:                                              ; preds = %198
  br label %204

204:                                              ; preds = %304, %203
  %205 = load i32, ptr %16, align 4
  %206 = load i32, ptr %7, align 4
  %207 = icmp ult i32 %205, %206
  br i1 %207, label %208, label %308

208:                                              ; preds = %204
  %209 = load ptr, ptr %3, align 8
  %210 = getelementptr inbounds %struct.png_image_read_control, ptr %209, i32 0, i32 5
  %211 = load ptr, ptr %210, align 8
  store ptr %211, ptr %17, align 8
  %212 = load ptr, ptr %11, align 8
  %213 = load i32, ptr %16, align 4
  %214 = zext i32 %213 to i64
  %215 = load i64, ptr %12, align 8
  %216 = mul nsw i64 %214, %215
  %217 = getelementptr inbounds i8, ptr %212, i64 %216
  store ptr %217, ptr %18, align 8
  %218 = load ptr, ptr %18, align 8
  %219 = load i32, ptr %8, align 4
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds i8, ptr %218, i64 %220
  store ptr %221, ptr %19, align 8
  %222 = load ptr, ptr %5, align 8
  %223 = load ptr, ptr %17, align 8
  call void @png_read_row(ptr noundef %222, ptr noundef %223, ptr noundef null)
  %224 = load i32, ptr %13, align 4
  %225 = load ptr, ptr %18, align 8
  %226 = zext i32 %224 to i64
  %227 = getelementptr inbounds i8, ptr %225, i64 %226
  store ptr %227, ptr %18, align 8
  br label %228

228:                                              ; preds = %298, %208
  %229 = load ptr, ptr %18, align 8
  %230 = load ptr, ptr %19, align 8
  %231 = icmp ult ptr %229, %230
  br i1 %231, label %232, label %303

232:                                              ; preds = %228
  %233 = load ptr, ptr %17, align 8
  %234 = getelementptr inbounds i8, ptr %233, i64 1
  %235 = load i8, ptr %234, align 1
  store i8 %235, ptr %20, align 1
  %236 = load i8, ptr %20, align 1
  %237 = zext i8 %236 to i32
  %238 = icmp sgt i32 %237, 0
  br i1 %238, label %239, label %295

239:                                              ; preds = %232
  %240 = load ptr, ptr %17, align 8
  %241 = getelementptr inbounds i8, ptr %240, i64 0
  %242 = load i8, ptr %241, align 1
  %243 = zext i8 %242 to i32
  store i32 %243, ptr %21, align 4
  %244 = load i8, ptr %20, align 1
  %245 = zext i8 %244 to i32
  %246 = icmp slt i32 %245, 255
  br i1 %246, label %247, label %290

247:                                              ; preds = %239
  %248 = load i32, ptr %21, align 4
  %249 = zext i32 %248 to i64
  %250 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %249
  %251 = load i16, ptr %250, align 2
  %252 = zext i16 %251 to i32
  %253 = load i8, ptr %20, align 1
  %254 = zext i8 %253 to i32
  %255 = mul nsw i32 %252, %254
  store i32 %255, ptr %21, align 4
  %256 = load ptr, ptr %18, align 8
  %257 = getelementptr inbounds i8, ptr %256, i64 0
  %258 = load i8, ptr %257, align 1
  %259 = zext i8 %258 to i64
  %260 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %259
  %261 = load i16, ptr %260, align 2
  %262 = zext i16 %261 to i32
  %263 = load i8, ptr %20, align 1
  %264 = zext i8 %263 to i32
  %265 = sub nsw i32 255, %264
  %266 = mul nsw i32 %262, %265
  %267 = load i32, ptr %21, align 4
  %268 = add i32 %267, %266
  store i32 %268, ptr %21, align 4
  %269 = load i32, ptr %21, align 4
  %270 = lshr i32 %269, 15
  %271 = zext i32 %270 to i64
  %272 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %271
  %273 = load i16, ptr %272, align 2
  %274 = zext i16 %273 to i32
  %275 = load i32, ptr %21, align 4
  %276 = and i32 %275, 32767
  %277 = load i32, ptr %21, align 4
  %278 = lshr i32 %277, 15
  %279 = zext i32 %278 to i64
  %280 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %279
  %281 = load i8, ptr %280, align 1
  %282 = zext i8 %281 to i32
  %283 = mul i32 %276, %282
  %284 = lshr i32 %283, 12
  %285 = add i32 %274, %284
  %286 = lshr i32 %285, 8
  %287 = and i32 255, %286
  %288 = trunc i32 %287 to i8
  %289 = zext i8 %288 to i32
  store i32 %289, ptr %21, align 4
  br label %290

290:                                              ; preds = %247, %239
  %291 = load i32, ptr %21, align 4
  %292 = trunc i32 %291 to i8
  %293 = load ptr, ptr %18, align 8
  %294 = getelementptr inbounds i8, ptr %293, i64 0
  store i8 %292, ptr %294, align 1
  br label %295

295:                                              ; preds = %290, %232
  %296 = load ptr, ptr %17, align 8
  %297 = getelementptr inbounds i8, ptr %296, i64 2
  store ptr %297, ptr %17, align 8
  br label %298

298:                                              ; preds = %295
  %299 = load i32, ptr %14, align 4
  %300 = load ptr, ptr %18, align 8
  %301 = zext i32 %299 to i64
  %302 = getelementptr inbounds i8, ptr %300, i64 %301
  store ptr %302, ptr %18, align 8
  br label %228, !llvm.loop !49

303:                                              ; preds = %228
  br label %304

304:                                              ; preds = %303
  %305 = load i32, ptr %15, align 4
  %306 = load i32, ptr %16, align 4
  %307 = add i32 %306, %305
  store i32 %307, ptr %16, align 4
  br label %204, !llvm.loop !50

308:                                              ; preds = %204
  br label %423

309:                                              ; preds = %198
  %310 = load ptr, ptr %3, align 8
  %311 = getelementptr inbounds %struct.png_image_read_control, ptr %310, i32 0, i32 4
  %312 = load ptr, ptr %311, align 8
  %313 = getelementptr inbounds %struct.png_color_struct, ptr %312, i32 0, i32 1
  %314 = load i8, ptr %313, align 1
  store i8 %314, ptr %22, align 1
  %315 = load i8, ptr %22, align 1
  %316 = zext i8 %315 to i64
  %317 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %316
  %318 = load i16, ptr %317, align 2
  store i16 %318, ptr %23, align 2
  br label %319

319:                                              ; preds = %418, %309
  %320 = load i32, ptr %16, align 4
  %321 = load i32, ptr %7, align 4
  %322 = icmp ult i32 %320, %321
  br i1 %322, label %323, label %422

323:                                              ; preds = %319
  %324 = load ptr, ptr %3, align 8
  %325 = getelementptr inbounds %struct.png_image_read_control, ptr %324, i32 0, i32 5
  %326 = load ptr, ptr %325, align 8
  store ptr %326, ptr %24, align 8
  %327 = load ptr, ptr %11, align 8
  %328 = load i32, ptr %16, align 4
  %329 = zext i32 %328 to i64
  %330 = load i64, ptr %12, align 8
  %331 = mul nsw i64 %329, %330
  %332 = getelementptr inbounds i8, ptr %327, i64 %331
  store ptr %332, ptr %25, align 8
  %333 = load ptr, ptr %25, align 8
  %334 = load i32, ptr %8, align 4
  %335 = zext i32 %334 to i64
  %336 = getelementptr inbounds i8, ptr %333, i64 %335
  store ptr %336, ptr %26, align 8
  %337 = load ptr, ptr %5, align 8
  %338 = load ptr, ptr %24, align 8
  call void @png_read_row(ptr noundef %337, ptr noundef %338, ptr noundef null)
  %339 = load i32, ptr %13, align 4
  %340 = load ptr, ptr %25, align 8
  %341 = zext i32 %339 to i64
  %342 = getelementptr inbounds i8, ptr %340, i64 %341
  store ptr %342, ptr %25, align 8
  br label %343

343:                                              ; preds = %412, %323
  %344 = load ptr, ptr %25, align 8
  %345 = load ptr, ptr %26, align 8
  %346 = icmp ult ptr %344, %345
  br i1 %346, label %347, label %417

347:                                              ; preds = %343
  %348 = load ptr, ptr %24, align 8
  %349 = getelementptr inbounds i8, ptr %348, i64 1
  %350 = load i8, ptr %349, align 1
  store i8 %350, ptr %27, align 1
  %351 = load i8, ptr %27, align 1
  %352 = zext i8 %351 to i32
  %353 = icmp sgt i32 %352, 0
  br i1 %353, label %354, label %405

354:                                              ; preds = %347
  %355 = load ptr, ptr %24, align 8
  %356 = getelementptr inbounds i8, ptr %355, i64 0
  %357 = load i8, ptr %356, align 1
  %358 = zext i8 %357 to i32
  store i32 %358, ptr %28, align 4
  %359 = load i8, ptr %27, align 1
  %360 = zext i8 %359 to i32
  %361 = icmp slt i32 %360, 255
  br i1 %361, label %362, label %400

362:                                              ; preds = %354
  %363 = load i32, ptr %28, align 4
  %364 = zext i32 %363 to i64
  %365 = getelementptr inbounds [256 x i16], ptr @png_sRGB_table, i64 0, i64 %364
  %366 = load i16, ptr %365, align 2
  %367 = zext i16 %366 to i32
  %368 = load i8, ptr %27, align 1
  %369 = zext i8 %368 to i32
  %370 = mul nsw i32 %367, %369
  store i32 %370, ptr %28, align 4
  %371 = load i16, ptr %23, align 2
  %372 = zext i16 %371 to i32
  %373 = load i8, ptr %27, align 1
  %374 = zext i8 %373 to i32
  %375 = sub nsw i32 255, %374
  %376 = mul nsw i32 %372, %375
  %377 = load i32, ptr %28, align 4
  %378 = add i32 %377, %376
  store i32 %378, ptr %28, align 4
  %379 = load i32, ptr %28, align 4
  %380 = lshr i32 %379, 15
  %381 = zext i32 %380 to i64
  %382 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %381
  %383 = load i16, ptr %382, align 2
  %384 = zext i16 %383 to i32
  %385 = load i32, ptr %28, align 4
  %386 = and i32 %385, 32767
  %387 = load i32, ptr %28, align 4
  %388 = lshr i32 %387, 15
  %389 = zext i32 %388 to i64
  %390 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %389
  %391 = load i8, ptr %390, align 1
  %392 = zext i8 %391 to i32
  %393 = mul i32 %386, %392
  %394 = lshr i32 %393, 12
  %395 = add i32 %384, %394
  %396 = lshr i32 %395, 8
  %397 = and i32 255, %396
  %398 = trunc i32 %397 to i8
  %399 = zext i8 %398 to i32
  store i32 %399, ptr %28, align 4
  br label %400

400:                                              ; preds = %362, %354
  %401 = load i32, ptr %28, align 4
  %402 = trunc i32 %401 to i8
  %403 = load ptr, ptr %25, align 8
  %404 = getelementptr inbounds i8, ptr %403, i64 0
  store i8 %402, ptr %404, align 1
  br label %409

405:                                              ; preds = %347
  %406 = load i8, ptr %22, align 1
  %407 = load ptr, ptr %25, align 8
  %408 = getelementptr inbounds i8, ptr %407, i64 0
  store i8 %406, ptr %408, align 1
  br label %409

409:                                              ; preds = %405, %400
  %410 = load ptr, ptr %24, align 8
  %411 = getelementptr inbounds i8, ptr %410, i64 2
  store ptr %411, ptr %24, align 8
  br label %412

412:                                              ; preds = %409
  %413 = load i32, ptr %14, align 4
  %414 = load ptr, ptr %25, align 8
  %415 = zext i32 %413 to i64
  %416 = getelementptr inbounds i8, ptr %414, i64 %415
  store ptr %416, ptr %25, align 8
  br label %343, !llvm.loop !51

417:                                              ; preds = %343
  br label %418

418:                                              ; preds = %417
  %419 = load i32, ptr %15, align 4
  %420 = load i32, ptr %16, align 4
  %421 = add i32 %420, %419
  store i32 %421, ptr %16, align 4
  br label %319, !llvm.loop !52

422:                                              ; preds = %319
  br label %423

423:                                              ; preds = %422, %308
  br label %424

424:                                              ; preds = %423, %165
  %425 = load i32, ptr %9, align 4
  %426 = add nsw i32 %425, 1
  store i32 %426, ptr %9, align 4
  br label %121, !llvm.loop !53

427:                                              ; preds = %121
  br label %631

428:                                              ; preds = %109
  %429 = load ptr, ptr %3, align 8
  %430 = getelementptr inbounds %struct.png_image_read_control, ptr %429, i32 0, i32 6
  %431 = load ptr, ptr %430, align 8
  store ptr %431, ptr %29, align 8
  %432 = load ptr, ptr %3, align 8
  %433 = getelementptr inbounds %struct.png_image_read_control, ptr %432, i32 0, i32 7
  %434 = load i64, ptr %433, align 8
  %435 = sdiv i64 %434, 2
  store i64 %435, ptr %30, align 8
  %436 = load ptr, ptr %4, align 8
  %437 = getelementptr inbounds %struct.png_image, ptr %436, i32 0, i32 4
  %438 = load i32, ptr %437, align 4
  %439 = and i32 %438, 1
  %440 = icmp ne i32 %439, 0
  %441 = zext i1 %440 to i32
  store i32 %441, ptr %31, align 4
  %442 = load i32, ptr %31, align 4
  %443 = add i32 1, %442
  store i32 %443, ptr %32, align 4
  store i32 0, ptr %33, align 4
  %444 = load i32, ptr %31, align 4
  %445 = icmp ne i32 %444, 0
  br i1 %445, label %446, label %453

446:                                              ; preds = %428
  %447 = load ptr, ptr %4, align 8
  %448 = getelementptr inbounds %struct.png_image, ptr %447, i32 0, i32 4
  %449 = load i32, ptr %448, align 4
  %450 = and i32 %449, 32
  %451 = icmp ne i32 %450, 0
  br i1 %451, label %452, label %453

452:                                              ; preds = %446
  store i32 1, ptr %33, align 4
  br label %453

453:                                              ; preds = %452, %446, %428
  store i32 0, ptr %9, align 4
  br label %454

454:                                              ; preds = %625, %453
  %455 = load i32, ptr %9, align 4
  %456 = load i32, ptr %10, align 4
  %457 = icmp slt i32 %455, %456
  br i1 %457, label %458, label %628

458:                                              ; preds = %454
  %459 = load ptr, ptr %5, align 8
  %460 = getelementptr inbounds %struct.png_struct_def, ptr %459, i32 0, i32 59
  %461 = load i8, ptr %460, align 4
  %462 = zext i8 %461 to i32
  %463 = icmp eq i32 %462, 1
  br i1 %463, label %464, label %534

464:                                              ; preds = %458
  %465 = load i32, ptr %8, align 4
  %466 = load i32, ptr %9, align 4
  %467 = icmp sgt i32 %466, 1
  br i1 %467, label %468, label %472

468:                                              ; preds = %464
  %469 = load i32, ptr %9, align 4
  %470 = sub nsw i32 7, %469
  %471 = ashr i32 %470, 1
  br label %473

472:                                              ; preds = %464
  br label %473

473:                                              ; preds = %472, %468
  %474 = phi i32 [ %471, %468 ], [ 3, %472 ]
  %475 = shl i32 1, %474
  %476 = sub nsw i32 %475, 1
  %477 = load i32, ptr %9, align 4
  %478 = and i32 1, %477
  %479 = load i32, ptr %9, align 4
  %480 = add nsw i32 %479, 1
  %481 = ashr i32 %480, 1
  %482 = sub nsw i32 3, %481
  %483 = shl i32 %478, %482
  %484 = and i32 %483, 7
  %485 = sub nsw i32 %476, %484
  %486 = add i32 %465, %485
  %487 = load i32, ptr %9, align 4
  %488 = icmp sgt i32 %487, 1
  br i1 %488, label %489, label %493

489:                                              ; preds = %473
  %490 = load i32, ptr %9, align 4
  %491 = sub nsw i32 7, %490
  %492 = ashr i32 %491, 1
  br label %494

493:                                              ; preds = %473
  br label %494

494:                                              ; preds = %493, %489
  %495 = phi i32 [ %492, %489 ], [ 3, %493 ]
  %496 = lshr i32 %486, %495
  %497 = icmp eq i32 %496, 0
  br i1 %497, label %498, label %499

498:                                              ; preds = %494
  br label %625

499:                                              ; preds = %494
  %500 = load i32, ptr %9, align 4
  %501 = and i32 1, %500
  %502 = load i32, ptr %9, align 4
  %503 = add nsw i32 %502, 1
  %504 = ashr i32 %503, 1
  %505 = sub nsw i32 3, %504
  %506 = shl i32 %501, %505
  %507 = and i32 %506, 7
  %508 = load i32, ptr %32, align 4
  %509 = mul i32 %507, %508
  store i32 %509, ptr %34, align 4
  %510 = load i32, ptr %9, align 4
  %511 = sub nsw i32 7, %510
  %512 = ashr i32 %511, 1
  %513 = shl i32 1, %512
  %514 = load i32, ptr %32, align 4
  %515 = mul i32 %513, %514
  store i32 %515, ptr %35, align 4
  %516 = load i32, ptr %9, align 4
  %517 = xor i32 %516, -1
  %518 = and i32 1, %517
  %519 = load i32, ptr %9, align 4
  %520 = ashr i32 %519, 1
  %521 = sub nsw i32 3, %520
  %522 = shl i32 %518, %521
  %523 = and i32 %522, 7
  store i32 %523, ptr %37, align 4
  %524 = load i32, ptr %9, align 4
  %525 = icmp sgt i32 %524, 2
  br i1 %525, label %526, label %531

526:                                              ; preds = %499
  %527 = load i32, ptr %9, align 4
  %528 = sub nsw i32 %527, 1
  %529 = ashr i32 %528, 1
  %530 = ashr i32 8, %529
  br label %532

531:                                              ; preds = %499
  br label %532

532:                                              ; preds = %531, %526
  %533 = phi i32 [ %530, %526 ], [ 8, %531 ]
  store i32 %533, ptr %36, align 4
  br label %536

534:                                              ; preds = %458
  store i32 0, ptr %37, align 4
  store i32 0, ptr %34, align 4
  %535 = load i32, ptr %32, align 4
  store i32 %535, ptr %35, align 4
  store i32 1, ptr %36, align 4
  br label %536

536:                                              ; preds = %534, %532
  br label %537

537:                                              ; preds = %620, %536
  %538 = load i32, ptr %37, align 4
  %539 = load i32, ptr %7, align 4
  %540 = icmp ult i32 %538, %539
  br i1 %540, label %541, label %624

541:                                              ; preds = %537
  %542 = load ptr, ptr %29, align 8
  %543 = load i32, ptr %37, align 4
  %544 = zext i32 %543 to i64
  %545 = load i64, ptr %30, align 8
  %546 = mul nsw i64 %544, %545
  %547 = getelementptr inbounds i16, ptr %542, i64 %546
  store ptr %547, ptr %39, align 8
  %548 = load ptr, ptr %39, align 8
  %549 = load i32, ptr %8, align 4
  %550 = load i32, ptr %32, align 4
  %551 = mul i32 %549, %550
  %552 = zext i32 %551 to i64
  %553 = getelementptr inbounds i16, ptr %548, i64 %552
  store ptr %553, ptr %40, align 8
  %554 = load ptr, ptr %5, align 8
  %555 = load ptr, ptr %3, align 8
  %556 = getelementptr inbounds %struct.png_image_read_control, ptr %555, i32 0, i32 5
  %557 = load ptr, ptr %556, align 8
  call void @png_read_row(ptr noundef %554, ptr noundef %557, ptr noundef null)
  %558 = load ptr, ptr %3, align 8
  %559 = getelementptr inbounds %struct.png_image_read_control, ptr %558, i32 0, i32 5
  %560 = load ptr, ptr %559, align 8
  store ptr %560, ptr %38, align 8
  %561 = load i32, ptr %34, align 4
  %562 = load ptr, ptr %39, align 8
  %563 = zext i32 %561 to i64
  %564 = getelementptr inbounds i16, ptr %562, i64 %563
  store ptr %564, ptr %39, align 8
  br label %565

565:                                              ; preds = %614, %541
  %566 = load ptr, ptr %39, align 8
  %567 = load ptr, ptr %40, align 8
  %568 = icmp ult ptr %566, %567
  br i1 %568, label %569, label %619

569:                                              ; preds = %565
  %570 = load ptr, ptr %38, align 8
  %571 = getelementptr inbounds i16, ptr %570, i64 0
  %572 = load i16, ptr %571, align 2
  %573 = zext i16 %572 to i32
  store i32 %573, ptr %41, align 4
  %574 = load ptr, ptr %38, align 8
  %575 = getelementptr inbounds i16, ptr %574, i64 1
  %576 = load i16, ptr %575, align 2
  store i16 %576, ptr %42, align 2
  %577 = load i16, ptr %42, align 2
  %578 = zext i16 %577 to i32
  %579 = icmp sgt i32 %578, 0
  br i1 %579, label %580, label %594

580:                                              ; preds = %569
  %581 = load i16, ptr %42, align 2
  %582 = zext i16 %581 to i32
  %583 = icmp slt i32 %582, 65535
  br i1 %583, label %584, label %593

584:                                              ; preds = %580
  %585 = load i16, ptr %42, align 2
  %586 = zext i16 %585 to i32
  %587 = load i32, ptr %41, align 4
  %588 = mul i32 %587, %586
  store i32 %588, ptr %41, align 4
  %589 = load i32, ptr %41, align 4
  %590 = add i32 %589, 32767
  store i32 %590, ptr %41, align 4
  %591 = load i32, ptr %41, align 4
  %592 = udiv i32 %591, 65535
  store i32 %592, ptr %41, align 4
  br label %593

593:                                              ; preds = %584, %580
  br label %595

594:                                              ; preds = %569
  store i32 0, ptr %41, align 4
  br label %595

595:                                              ; preds = %594, %593
  %596 = load i32, ptr %41, align 4
  %597 = trunc i32 %596 to i16
  %598 = load ptr, ptr %39, align 8
  %599 = load i32, ptr %33, align 4
  %600 = sext i32 %599 to i64
  %601 = getelementptr inbounds i16, ptr %598, i64 %600
  store i16 %597, ptr %601, align 2
  %602 = load i32, ptr %31, align 4
  %603 = icmp ne i32 %602, 0
  br i1 %603, label %604, label %611

604:                                              ; preds = %595
  %605 = load i16, ptr %42, align 2
  %606 = load ptr, ptr %39, align 8
  %607 = load i32, ptr %33, align 4
  %608 = xor i32 1, %607
  %609 = sext i32 %608 to i64
  %610 = getelementptr inbounds i16, ptr %606, i64 %609
  store i16 %605, ptr %610, align 2
  br label %611

611:                                              ; preds = %604, %595
  %612 = load ptr, ptr %38, align 8
  %613 = getelementptr inbounds i16, ptr %612, i64 2
  store ptr %613, ptr %38, align 8
  br label %614

614:                                              ; preds = %611
  %615 = load i32, ptr %35, align 4
  %616 = load ptr, ptr %39, align 8
  %617 = zext i32 %615 to i64
  %618 = getelementptr inbounds i16, ptr %616, i64 %617
  store ptr %618, ptr %39, align 8
  br label %565, !llvm.loop !54

619:                                              ; preds = %565
  br label %620

620:                                              ; preds = %619
  %621 = load i32, ptr %36, align 4
  %622 = load i32, ptr %37, align 4
  %623 = add i32 %622, %621
  store i32 %623, ptr %37, align 4
  br label %537, !llvm.loop !55

624:                                              ; preds = %537
  br label %625

625:                                              ; preds = %624, %498
  %626 = load i32, ptr %9, align 4
  %627 = add nsw i32 %626, 1
  store i32 %627, ptr %9, align 4
  br label %454, !llvm.loop !56

628:                                              ; preds = %454
  br label %631

629:                                              ; preds = %109
  %630 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %630, ptr noundef @.str.62) #8
  unreachable

631:                                              ; preds = %628, %427
  ret i32 1
}

declare zeroext i8 @png_get_channels(ptr noundef, ptr noundef) #1

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #7 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { noreturn }
attributes #9 = { nounwind willreturn memory(none) }
attributes #10 = { nounwind }
attributes #11 = { nounwind willreturn memory(read) }

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
!49 = distinct !{!49, !6}
!50 = distinct !{!50, !6}
!51 = distinct !{!51, !6}
!52 = distinct !{!52, !6}
!53 = distinct !{!53, !6}
!54 = distinct !{!54, !6}
!55 = distinct !{!55, !6}
!56 = distinct !{!56, !6}
