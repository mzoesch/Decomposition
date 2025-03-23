; ModuleID = '/mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/004_ibpng/pngwrite.c'
source_filename = "/mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/004_ibpng/pngwrite.c"
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
%struct.png_sPLT_struct = type { ptr, i8, ptr, i32 }
%struct.png_text_struct = type { i32, ptr, ptr, i64, i64, ptr, ptr }
%struct.tm = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i64, ptr }
%struct.png_row_info_struct = type { i32, i64, i8, i8, i8, i8 }
%struct.png_image_write_control = type { ptr, ptr, i32, ptr, i32, ptr, i64, ptr, ptr, i64, i64 }
%struct.png_image = type { ptr, i32, i32, i32, i32, i32, i32, i32, [64 x i8] }
%struct.png_control = type { ptr, ptr, ptr, ptr, i64, i8 }
%struct.png_color_struct = type { i8, i8, i8 }

@.str = private unnamed_addr constant [49 x i8] c"MNG features are not allowed in a PNG datastream\00", align 1
@.str.1 = private unnamed_addr constant [43 x i8] c"Valid palette required for paletted images\00", align 1
@.str.2 = private unnamed_addr constant [27 x i8] c"No IDATs written into file\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"Wrote palette index exceeding num_palette\00", align 1
@.str.4 = private unnamed_addr constant [53 x i8] c"png_write_info was never called before png_write_row\00", align 1
@.str.5 = private unnamed_addr constant [37 x i8] c"internal write transform logic error\00", align 1
@.str.6 = private unnamed_addr constant [32 x i8] c"Unknown row filter for method 0\00", align 1
@.str.7 = private unnamed_addr constant [57 x i8] c"png_set_filter: UP/AVG/PAETH cannot be added after start\00", align 1
@.str.8 = private unnamed_addr constant [29 x i8] c"Unknown custom filter method\00", align 1
@.str.9 = private unnamed_addr constant [49 x i8] c"Only compression windows <= 32k supported by PNG\00", align 1
@.str.10 = private unnamed_addr constant [49 x i8] c"Only compression windows >= 256 supported by PNG\00", align 1
@.str.11 = private unnamed_addr constant [46 x i8] c"Only compression method 8 is supported by PNG\00", align 1
@.str.12 = private unnamed_addr constant [37 x i8] c"no rows for png_write_image to write\00", align 1
@.str.13 = private unnamed_addr constant [55 x i8] c"PNG_TRANSFORM_STRIP_FILLER: BEFORE+AFTER not supported\00", align 1
@.str.14 = private unnamed_addr constant [44 x i8] c"png_image_write_to_memory: invalid argument\00", align 1
@.str.15 = private unnamed_addr constant [55 x i8] c"png_image_write_to_memory: incorrect PNG_IMAGE_VERSION\00", align 1
@.str.16 = private unnamed_addr constant [43 x i8] c"png_image_write_to_stdio: invalid argument\00", align 1
@.str.17 = private unnamed_addr constant [54 x i8] c"png_image_write_to_stdio: incorrect PNG_IMAGE_VERSION\00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str.19 = private unnamed_addr constant [42 x i8] c"png_image_write_to_file: invalid argument\00", align 1
@.str.20 = private unnamed_addr constant [53 x i8] c"png_image_write_to_file: incorrect PNG_IMAGE_VERSION\00", align 1
@.str.21 = private unnamed_addr constant [34 x i8] c"Writing zero-length unknown chunk\00", align 1
@.str.22 = private unnamed_addr constant [11 x i8] c"1.6.48.git\00", align 1
@.str.23 = private unnamed_addr constant [32 x i8] c"png_image_write_: out of memory\00", align 1
@.str.24 = private unnamed_addr constant [39 x i8] c"png_image_write_to_memory: PNG too big\00", align 1
@.str.25 = private unnamed_addr constant [23 x i8] c"memory image too large\00", align 1
@.str.26 = private unnamed_addr constant [30 x i8] c"supplied row stride too small\00", align 1
@.str.27 = private unnamed_addr constant [27 x i8] c"image row stride too large\00", align 1
@.str.28 = private unnamed_addr constant [36 x i8] c"no color-map for color-mapped image\00", align 1
@.str.29 = private unnamed_addr constant [44 x i8] c"png_write_image: unsupported transformation\00", align 1
@png_sRGB_base = external constant [512 x i16], align 16
@png_sRGB_delta = external constant [512 x i8], align 16
@.str.30 = private unnamed_addr constant [37 x i8] c"png_write_image: internal call error\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_write_info_before_PLTE(ptr noalias noundef %0, ptr noalias noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %2
  %8 = load ptr, ptr %4, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %7, %2
  br label %202

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.png_struct_def, ptr %12, i32 0, i32 15
  %14 = load i32, ptr %13, align 4
  %15 = and i32 %14, 1024
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %202

17:                                               ; preds = %11
  %18 = load ptr, ptr %3, align 8
  call void @png_write_sig(ptr noundef %18)
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds %struct.png_struct_def, ptr %19, i32 0, i32 15
  %21 = load i32, ptr %20, align 4
  %22 = and i32 %21, 4096
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %33

24:                                               ; preds = %17
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.png_struct_def, ptr %25, i32 0, i32 128
  %27 = load i32, ptr %26, align 8
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %33

29:                                               ; preds = %24
  %30 = load ptr, ptr %3, align 8
  call void @png_warning(ptr noundef %30, ptr noundef @.str)
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds %struct.png_struct_def, ptr %31, i32 0, i32 128
  store i32 0, ptr %32, align 8
  br label %33

33:                                               ; preds = %29, %24, %17
  %34 = load ptr, ptr %3, align 8
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds %struct.png_info_def, ptr %35, i32 0, i32 0
  %37 = load i32, ptr %36, align 8
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.png_info_def, ptr %38, i32 0, i32 1
  %40 = load i32, ptr %39, align 4
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.png_info_def, ptr %41, i32 0, i32 7
  %43 = load i8, ptr %42, align 4
  %44 = zext i8 %43 to i32
  %45 = load ptr, ptr %4, align 8
  %46 = getelementptr inbounds %struct.png_info_def, ptr %45, i32 0, i32 8
  %47 = load i8, ptr %46, align 1
  %48 = zext i8 %47 to i32
  %49 = load ptr, ptr %4, align 8
  %50 = getelementptr inbounds %struct.png_info_def, ptr %49, i32 0, i32 9
  %51 = load i8, ptr %50, align 2
  %52 = zext i8 %51 to i32
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds %struct.png_info_def, ptr %53, i32 0, i32 10
  %55 = load i8, ptr %54, align 1
  %56 = zext i8 %55 to i32
  %57 = load ptr, ptr %4, align 8
  %58 = getelementptr inbounds %struct.png_info_def, ptr %57, i32 0, i32 11
  %59 = load i8, ptr %58, align 8
  %60 = zext i8 %59 to i32
  call void @png_write_IHDR(ptr noundef %34, i32 noundef %37, i32 noundef %40, i32 noundef %44, i32 noundef %48, i32 noundef %52, i32 noundef %56, i32 noundef %60)
  %61 = load ptr, ptr %3, align 8
  %62 = load ptr, ptr %4, align 8
  call void @write_unknown_chunks(ptr noundef %61, ptr noundef %62, i32 noundef 1)
  %63 = load ptr, ptr %4, align 8
  %64 = getelementptr inbounds %struct.png_info_def, ptr %63, i32 0, i32 2
  %65 = load i32, ptr %64, align 8
  %66 = and i32 %65, 2
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %76

68:                                               ; preds = %33
  %69 = load ptr, ptr %3, align 8
  %70 = load ptr, ptr %4, align 8
  %71 = getelementptr inbounds %struct.png_info_def, ptr %70, i32 0, i32 39
  %72 = load ptr, ptr %4, align 8
  %73 = getelementptr inbounds %struct.png_info_def, ptr %72, i32 0, i32 8
  %74 = load i8, ptr %73, align 1
  %75 = zext i8 %74 to i32
  call void @png_write_sBIT(ptr noundef %69, ptr noundef %71, i32 noundef %75)
  br label %76

76:                                               ; preds = %68, %33
  %77 = load ptr, ptr %4, align 8
  %78 = getelementptr inbounds %struct.png_info_def, ptr %77, i32 0, i32 2
  %79 = load i32, ptr %78, align 8
  %80 = and i32 %79, 262144
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %82, label %90

82:                                               ; preds = %76
  %83 = load ptr, ptr %3, align 8
  %84 = load ptr, ptr %4, align 8
  %85 = getelementptr inbounds %struct.png_info_def, ptr %84, i32 0, i32 23
  %86 = load i32, ptr %85, align 4
  %87 = load ptr, ptr %4, align 8
  %88 = getelementptr inbounds %struct.png_info_def, ptr %87, i32 0, i32 24
  %89 = load i32, ptr %88, align 8
  call void @png_write_cLLI_fixed(ptr noundef %83, i32 noundef %86, i32 noundef %89)
  br label %90

90:                                               ; preds = %82, %76
  %91 = load ptr, ptr %4, align 8
  %92 = getelementptr inbounds %struct.png_info_def, ptr %91, i32 0, i32 2
  %93 = load i32, ptr %92, align 8
  %94 = and i32 %93, 524288
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %96, label %128

96:                                               ; preds = %90
  %97 = load ptr, ptr %3, align 8
  %98 = load ptr, ptr %4, align 8
  %99 = getelementptr inbounds %struct.png_info_def, ptr %98, i32 0, i32 25
  %100 = load i16, ptr %99, align 4
  %101 = load ptr, ptr %4, align 8
  %102 = getelementptr inbounds %struct.png_info_def, ptr %101, i32 0, i32 26
  %103 = load i16, ptr %102, align 2
  %104 = load ptr, ptr %4, align 8
  %105 = getelementptr inbounds %struct.png_info_def, ptr %104, i32 0, i32 27
  %106 = load i16, ptr %105, align 8
  %107 = load ptr, ptr %4, align 8
  %108 = getelementptr inbounds %struct.png_info_def, ptr %107, i32 0, i32 28
  %109 = load i16, ptr %108, align 2
  %110 = load ptr, ptr %4, align 8
  %111 = getelementptr inbounds %struct.png_info_def, ptr %110, i32 0, i32 29
  %112 = load i16, ptr %111, align 4
  %113 = load ptr, ptr %4, align 8
  %114 = getelementptr inbounds %struct.png_info_def, ptr %113, i32 0, i32 30
  %115 = load i16, ptr %114, align 2
  %116 = load ptr, ptr %4, align 8
  %117 = getelementptr inbounds %struct.png_info_def, ptr %116, i32 0, i32 31
  %118 = load i16, ptr %117, align 8
  %119 = load ptr, ptr %4, align 8
  %120 = getelementptr inbounds %struct.png_info_def, ptr %119, i32 0, i32 32
  %121 = load i16, ptr %120, align 2
  %122 = load ptr, ptr %4, align 8
  %123 = getelementptr inbounds %struct.png_info_def, ptr %122, i32 0, i32 33
  %124 = load i32, ptr %123, align 4
  %125 = load ptr, ptr %4, align 8
  %126 = getelementptr inbounds %struct.png_info_def, ptr %125, i32 0, i32 34
  %127 = load i32, ptr %126, align 8
  call void @png_write_mDCV_fixed(ptr noundef %97, i16 noundef zeroext %100, i16 noundef zeroext %103, i16 noundef zeroext %106, i16 noundef zeroext %109, i16 noundef zeroext %112, i16 noundef zeroext %115, i16 noundef zeroext %118, i16 noundef zeroext %121, i32 noundef %124, i32 noundef %127)
  br label %128

128:                                              ; preds = %96, %90
  %129 = load ptr, ptr %4, align 8
  %130 = getelementptr inbounds %struct.png_info_def, ptr %129, i32 0, i32 2
  %131 = load i32, ptr %130, align 8
  %132 = and i32 %131, 131072
  %133 = icmp ne i32 %132, 0
  br i1 %133, label %134, label %148

134:                                              ; preds = %128
  %135 = load ptr, ptr %3, align 8
  %136 = load ptr, ptr %4, align 8
  %137 = getelementptr inbounds %struct.png_info_def, ptr %136, i32 0, i32 16
  %138 = load i8, ptr %137, align 4
  %139 = load ptr, ptr %4, align 8
  %140 = getelementptr inbounds %struct.png_info_def, ptr %139, i32 0, i32 17
  %141 = load i8, ptr %140, align 1
  %142 = load ptr, ptr %4, align 8
  %143 = getelementptr inbounds %struct.png_info_def, ptr %142, i32 0, i32 18
  %144 = load i8, ptr %143, align 2
  %145 = load ptr, ptr %4, align 8
  %146 = getelementptr inbounds %struct.png_info_def, ptr %145, i32 0, i32 19
  %147 = load i8, ptr %146, align 1
  call void @png_write_cICP(ptr noundef %135, i8 noundef zeroext %138, i8 noundef zeroext %141, i8 noundef zeroext %144, i8 noundef zeroext %147)
  br label %148

148:                                              ; preds = %134, %128
  %149 = load ptr, ptr %4, align 8
  %150 = getelementptr inbounds %struct.png_info_def, ptr %149, i32 0, i32 2
  %151 = load i32, ptr %150, align 8
  %152 = and i32 %151, 4096
  %153 = icmp ne i32 %152, 0
  br i1 %153, label %154, label %165

154:                                              ; preds = %148
  %155 = load ptr, ptr %3, align 8
  %156 = load ptr, ptr %4, align 8
  %157 = getelementptr inbounds %struct.png_info_def, ptr %156, i32 0, i32 20
  %158 = load ptr, ptr %157, align 8
  %159 = load ptr, ptr %4, align 8
  %160 = getelementptr inbounds %struct.png_info_def, ptr %159, i32 0, i32 21
  %161 = load ptr, ptr %160, align 8
  %162 = load ptr, ptr %4, align 8
  %163 = getelementptr inbounds %struct.png_info_def, ptr %162, i32 0, i32 22
  %164 = load i32, ptr %163, align 8
  call void @png_write_iCCP(ptr noundef %155, ptr noundef %158, ptr noundef %161, i32 noundef %164)
  br label %165

165:                                              ; preds = %154, %148
  %166 = load ptr, ptr %4, align 8
  %167 = getelementptr inbounds %struct.png_info_def, ptr %166, i32 0, i32 2
  %168 = load i32, ptr %167, align 8
  %169 = and i32 %168, 2048
  %170 = icmp ne i32 %169, 0
  br i1 %170, label %171, label %176

171:                                              ; preds = %165
  %172 = load ptr, ptr %3, align 8
  %173 = load ptr, ptr %4, align 8
  %174 = getelementptr inbounds %struct.png_info_def, ptr %173, i32 0, i32 70
  %175 = load i32, ptr %174, align 4
  call void @png_write_sRGB(ptr noundef %172, i32 noundef %175)
  br label %176

176:                                              ; preds = %171, %165
  %177 = load ptr, ptr %4, align 8
  %178 = getelementptr inbounds %struct.png_info_def, ptr %177, i32 0, i32 2
  %179 = load i32, ptr %178, align 8
  %180 = and i32 %179, 1
  %181 = icmp ne i32 %180, 0
  br i1 %181, label %182, label %187

182:                                              ; preds = %176
  %183 = load ptr, ptr %3, align 8
  %184 = load ptr, ptr %4, align 8
  %185 = getelementptr inbounds %struct.png_info_def, ptr %184, i32 0, i32 69
  %186 = load i32, ptr %185, align 8
  call void @png_write_gAMA_fixed(ptr noundef %183, i32 noundef %186)
  br label %187

187:                                              ; preds = %182, %176
  %188 = load ptr, ptr %4, align 8
  %189 = getelementptr inbounds %struct.png_info_def, ptr %188, i32 0, i32 2
  %190 = load i32, ptr %189, align 8
  %191 = and i32 %190, 4
  %192 = icmp ne i32 %191, 0
  br i1 %192, label %193, label %197

193:                                              ; preds = %187
  %194 = load ptr, ptr %3, align 8
  %195 = load ptr, ptr %4, align 8
  %196 = getelementptr inbounds %struct.png_info_def, ptr %195, i32 0, i32 68
  call void @png_write_cHRM_fixed(ptr noundef %194, ptr noundef %196)
  br label %197

197:                                              ; preds = %193, %187
  %198 = load ptr, ptr %3, align 8
  %199 = getelementptr inbounds %struct.png_struct_def, ptr %198, i32 0, i32 15
  %200 = load i32, ptr %199, align 4
  %201 = or i32 %200, 1024
  store i32 %201, ptr %199, align 4
  br label %202

202:                                              ; preds = %10, %197, %11
  ret void
}

declare void @png_write_sig(ptr noundef) #1

declare void @png_warning(ptr noundef, ptr noundef) #1

declare void @png_write_IHDR(ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @write_unknown_chunks(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds %struct.png_info_def, ptr %9, i32 0, i32 61
  %11 = load i32, ptr %10, align 8
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %87

13:                                               ; preds = %3
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds %struct.png_info_def, ptr %14, i32 0, i32 60
  %16 = load ptr, ptr %15, align 8
  store ptr %16, ptr %7, align 8
  br label %17

17:                                               ; preds = %83, %13
  %18 = load ptr, ptr %7, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.png_info_def, ptr %19, i32 0, i32 60
  %21 = load ptr, ptr %20, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds %struct.png_info_def, ptr %22, i32 0, i32 61
  %24 = load i32, ptr %23, align 8
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %21, i64 %25
  %27 = icmp ult ptr %18, %26
  br i1 %27, label %28, label %86

28:                                               ; preds = %17
  %29 = load ptr, ptr %7, align 8
  %30 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %29, i32 0, i32 3
  %31 = load i8, ptr %30, align 8
  %32 = zext i8 %31 to i32
  %33 = load i32, ptr %6, align 4
  %34 = and i32 %32, %33
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %82

36:                                               ; preds = %28
  %37 = load ptr, ptr %4, align 8
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %38, i32 0, i32 0
  %40 = getelementptr inbounds [5 x i8], ptr %39, i64 0, i64 0
  %41 = call i32 @png_handle_as_unknown(ptr noundef %37, ptr noundef %40)
  store i32 %41, ptr %8, align 4
  %42 = load i32, ptr %8, align 4
  %43 = icmp ne i32 %42, 1
  br i1 %43, label %44, label %81

44:                                               ; preds = %36
  %45 = load ptr, ptr %7, align 8
  %46 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %45, i32 0, i32 0
  %47 = getelementptr inbounds [5 x i8], ptr %46, i64 0, i64 3
  %48 = load i8, ptr %47, align 1
  %49 = zext i8 %48 to i32
  %50 = and i32 %49, 32
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %63, label %52

52:                                               ; preds = %44
  %53 = load i32, ptr %8, align 4
  %54 = icmp eq i32 %53, 3
  br i1 %54, label %63, label %55

55:                                               ; preds = %52
  %56 = load i32, ptr %8, align 4
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %81

58:                                               ; preds = %55
  %59 = load ptr, ptr %4, align 8
  %60 = getelementptr inbounds %struct.png_struct_def, ptr %59, i32 0, i32 120
  %61 = load i32, ptr %60, align 8
  %62 = icmp eq i32 %61, 3
  br i1 %62, label %63, label %81

63:                                               ; preds = %58, %52, %44
  %64 = load ptr, ptr %7, align 8
  %65 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %64, i32 0, i32 2
  %66 = load i64, ptr %65, align 8
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %68, label %70

68:                                               ; preds = %63
  %69 = load ptr, ptr %4, align 8
  call void @png_warning(ptr noundef %69, ptr noundef @.str.21)
  br label %70

70:                                               ; preds = %68, %63
  %71 = load ptr, ptr %4, align 8
  %72 = load ptr, ptr %7, align 8
  %73 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %72, i32 0, i32 0
  %74 = getelementptr inbounds [5 x i8], ptr %73, i64 0, i64 0
  %75 = load ptr, ptr %7, align 8
  %76 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %75, i32 0, i32 1
  %77 = load ptr, ptr %76, align 8
  %78 = load ptr, ptr %7, align 8
  %79 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %78, i32 0, i32 2
  %80 = load i64, ptr %79, align 8
  call void @png_write_chunk(ptr noundef %71, ptr noundef %74, ptr noundef %77, i64 noundef %80)
  br label %81

81:                                               ; preds = %70, %58, %55, %36
  br label %82

82:                                               ; preds = %81, %28
  br label %83

83:                                               ; preds = %82
  %84 = load ptr, ptr %7, align 8
  %85 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %84, i32 1
  store ptr %85, ptr %7, align 8
  br label %17, !llvm.loop !5

86:                                               ; preds = %17
  br label %87

87:                                               ; preds = %86, %3
  ret void
}

declare void @png_write_sBIT(ptr noundef, ptr noundef, i32 noundef) #1

declare void @png_write_cLLI_fixed(ptr noundef, i32 noundef, i32 noundef) #1

declare void @png_write_mDCV_fixed(ptr noundef, i16 noundef zeroext, i16 noundef zeroext, i16 noundef zeroext, i16 noundef zeroext, i16 noundef zeroext, i16 noundef zeroext, i16 noundef zeroext, i16 noundef zeroext, i32 noundef, i32 noundef) #1

declare void @png_write_cICP(ptr noundef, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext, i8 noundef zeroext) #1

declare void @png_write_iCCP(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare void @png_write_sRGB(ptr noundef, i32 noundef) #1

declare void @png_write_gAMA_fixed(ptr noundef, i32 noundef) #1

declare void @png_write_cHRM_fixed(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_write_info(ptr noalias noundef %0, ptr noalias noundef %1) #0 {
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
  br label %450

14:                                               ; preds = %10
  %15 = load ptr, ptr %3, align 8
  %16 = load ptr, ptr %4, align 8
  call void @png_write_info_before_PLTE(ptr noundef %15, ptr noundef %16)
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.png_info_def, ptr %17, i32 0, i32 2
  %19 = load i32, ptr %18, align 8
  %20 = and i32 %19, 8
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %31

22:                                               ; preds = %14
  %23 = load ptr, ptr %3, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.png_info_def, ptr %24, i32 0, i32 4
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.png_info_def, ptr %27, i32 0, i32 5
  %29 = load i16, ptr %28, align 8
  %30 = zext i16 %29 to i32
  call void @png_write_PLTE(ptr noundef %23, ptr noundef %26, i32 noundef %30)
  br label %40

31:                                               ; preds = %14
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds %struct.png_info_def, ptr %32, i32 0, i32 8
  %34 = load i8, ptr %33, align 1
  %35 = zext i8 %34 to i32
  %36 = icmp eq i32 %35, 3
  br i1 %36, label %37, label %39

37:                                               ; preds = %31
  %38 = load ptr, ptr %3, align 8
  call void @png_error(ptr noundef %38, ptr noundef @.str.1) #7
  unreachable

39:                                               ; preds = %31
  br label %40

40:                                               ; preds = %39, %22
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.png_info_def, ptr %41, i32 0, i32 2
  %43 = load i32, ptr %42, align 8
  %44 = and i32 %43, 16
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %107

46:                                               ; preds = %40
  %47 = load ptr, ptr %3, align 8
  %48 = getelementptr inbounds %struct.png_struct_def, ptr %47, i32 0, i32 17
  %49 = load i32, ptr %48, align 4
  %50 = and i32 %49, 524288
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %92

52:                                               ; preds = %46
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds %struct.png_info_def, ptr %53, i32 0, i32 8
  %55 = load i8, ptr %54, align 1
  %56 = zext i8 %55 to i32
  %57 = icmp eq i32 %56, 3
  br i1 %57, label %58, label %92

58:                                               ; preds = %52
  %59 = load ptr, ptr %4, align 8
  %60 = getelementptr inbounds %struct.png_info_def, ptr %59, i32 0, i32 6
  %61 = load i16, ptr %60, align 2
  %62 = zext i16 %61 to i32
  store i32 %62, ptr %7, align 4
  %63 = load i32, ptr %7, align 4
  %64 = icmp sgt i32 %63, 256
  br i1 %64, label %65, label %66

65:                                               ; preds = %58
  store i32 256, ptr %7, align 4
  br label %66

66:                                               ; preds = %65, %58
  store i32 0, ptr %6, align 4
  br label %67

67:                                               ; preds = %88, %66
  %68 = load i32, ptr %6, align 4
  %69 = load i32, ptr %7, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %91

71:                                               ; preds = %67
  %72 = load ptr, ptr %4, align 8
  %73 = getelementptr inbounds %struct.png_info_def, ptr %72, i32 0, i32 40
  %74 = load ptr, ptr %73, align 8
  %75 = load i32, ptr %6, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i8, ptr %74, i64 %76
  %78 = load i8, ptr %77, align 1
  %79 = zext i8 %78 to i32
  %80 = sub nsw i32 255, %79
  %81 = trunc i32 %80 to i8
  %82 = load ptr, ptr %4, align 8
  %83 = getelementptr inbounds %struct.png_info_def, ptr %82, i32 0, i32 40
  %84 = load ptr, ptr %83, align 8
  %85 = load i32, ptr %6, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, ptr %84, i64 %86
  store i8 %81, ptr %87, align 1
  br label %88

88:                                               ; preds = %71
  %89 = load i32, ptr %6, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, ptr %6, align 4
  br label %67, !llvm.loop !7

91:                                               ; preds = %67
  br label %92

92:                                               ; preds = %91, %52, %46
  %93 = load ptr, ptr %3, align 8
  %94 = load ptr, ptr %4, align 8
  %95 = getelementptr inbounds %struct.png_info_def, ptr %94, i32 0, i32 40
  %96 = load ptr, ptr %95, align 8
  %97 = load ptr, ptr %4, align 8
  %98 = getelementptr inbounds %struct.png_info_def, ptr %97, i32 0, i32 41
  %99 = load ptr, ptr %4, align 8
  %100 = getelementptr inbounds %struct.png_info_def, ptr %99, i32 0, i32 6
  %101 = load i16, ptr %100, align 2
  %102 = zext i16 %101 to i32
  %103 = load ptr, ptr %4, align 8
  %104 = getelementptr inbounds %struct.png_info_def, ptr %103, i32 0, i32 8
  %105 = load i8, ptr %104, align 1
  %106 = zext i8 %105 to i32
  call void @png_write_tRNS(ptr noundef %93, ptr noundef %96, ptr noundef %98, i32 noundef %102, i32 noundef %106)
  br label %107

107:                                              ; preds = %92, %40
  %108 = load ptr, ptr %4, align 8
  %109 = getelementptr inbounds %struct.png_info_def, ptr %108, i32 0, i32 2
  %110 = load i32, ptr %109, align 8
  %111 = and i32 %110, 32
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %113, label %121

113:                                              ; preds = %107
  %114 = load ptr, ptr %3, align 8
  %115 = load ptr, ptr %4, align 8
  %116 = getelementptr inbounds %struct.png_info_def, ptr %115, i32 0, i32 42
  %117 = load ptr, ptr %4, align 8
  %118 = getelementptr inbounds %struct.png_info_def, ptr %117, i32 0, i32 8
  %119 = load i8, ptr %118, align 1
  %120 = zext i8 %119 to i32
  call void @png_write_bKGD(ptr noundef %114, ptr noundef %116, i32 noundef %120)
  br label %121

121:                                              ; preds = %113, %107
  %122 = load ptr, ptr %4, align 8
  %123 = getelementptr inbounds %struct.png_info_def, ptr %122, i32 0, i32 2
  %124 = load i32, ptr %123, align 8
  %125 = and i32 %124, 65536
  %126 = icmp ne i32 %125, 0
  br i1 %126, label %127, label %139

127:                                              ; preds = %121
  %128 = load ptr, ptr %3, align 8
  %129 = load ptr, ptr %4, align 8
  %130 = getelementptr inbounds %struct.png_info_def, ptr %129, i32 0, i32 50
  %131 = load ptr, ptr %130, align 8
  %132 = load ptr, ptr %4, align 8
  %133 = getelementptr inbounds %struct.png_info_def, ptr %132, i32 0, i32 49
  %134 = load i32, ptr %133, align 4
  call void @png_write_eXIf(ptr noundef %128, ptr noundef %131, i32 noundef %134)
  %135 = load ptr, ptr %3, align 8
  %136 = getelementptr inbounds %struct.png_struct_def, ptr %135, i32 0, i32 15
  %137 = load i32, ptr %136, align 4
  %138 = or i32 %137, 16384
  store i32 %138, ptr %136, align 4
  br label %139

139:                                              ; preds = %127, %121
  %140 = load ptr, ptr %4, align 8
  %141 = getelementptr inbounds %struct.png_info_def, ptr %140, i32 0, i32 2
  %142 = load i32, ptr %141, align 8
  %143 = and i32 %142, 64
  %144 = icmp ne i32 %143, 0
  br i1 %144, label %145, label %154

145:                                              ; preds = %139
  %146 = load ptr, ptr %3, align 8
  %147 = load ptr, ptr %4, align 8
  %148 = getelementptr inbounds %struct.png_info_def, ptr %147, i32 0, i32 51
  %149 = load ptr, ptr %148, align 8
  %150 = load ptr, ptr %4, align 8
  %151 = getelementptr inbounds %struct.png_info_def, ptr %150, i32 0, i32 5
  %152 = load i16, ptr %151, align 8
  %153 = zext i16 %152 to i32
  call void @png_write_hIST(ptr noundef %146, ptr noundef %149, i32 noundef %153)
  br label %154

154:                                              ; preds = %145, %139
  %155 = load ptr, ptr %4, align 8
  %156 = getelementptr inbounds %struct.png_info_def, ptr %155, i32 0, i32 2
  %157 = load i32, ptr %156, align 8
  %158 = and i32 %157, 256
  %159 = icmp ne i32 %158, 0
  br i1 %159, label %160, label %172

160:                                              ; preds = %154
  %161 = load ptr, ptr %3, align 8
  %162 = load ptr, ptr %4, align 8
  %163 = getelementptr inbounds %struct.png_info_def, ptr %162, i32 0, i32 43
  %164 = load i32, ptr %163, align 4
  %165 = load ptr, ptr %4, align 8
  %166 = getelementptr inbounds %struct.png_info_def, ptr %165, i32 0, i32 44
  %167 = load i32, ptr %166, align 8
  %168 = load ptr, ptr %4, align 8
  %169 = getelementptr inbounds %struct.png_info_def, ptr %168, i32 0, i32 45
  %170 = load i8, ptr %169, align 4
  %171 = zext i8 %170 to i32
  call void @png_write_oFFs(ptr noundef %161, i32 noundef %164, i32 noundef %167, i32 noundef %171)
  br label %172

172:                                              ; preds = %160, %154
  %173 = load ptr, ptr %4, align 8
  %174 = getelementptr inbounds %struct.png_info_def, ptr %173, i32 0, i32 2
  %175 = load i32, ptr %174, align 8
  %176 = and i32 %175, 1024
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %178, label %203

178:                                              ; preds = %172
  %179 = load ptr, ptr %3, align 8
  %180 = load ptr, ptr %4, align 8
  %181 = getelementptr inbounds %struct.png_info_def, ptr %180, i32 0, i32 52
  %182 = load ptr, ptr %181, align 8
  %183 = load ptr, ptr %4, align 8
  %184 = getelementptr inbounds %struct.png_info_def, ptr %183, i32 0, i32 53
  %185 = load i32, ptr %184, align 8
  %186 = load ptr, ptr %4, align 8
  %187 = getelementptr inbounds %struct.png_info_def, ptr %186, i32 0, i32 54
  %188 = load i32, ptr %187, align 4
  %189 = load ptr, ptr %4, align 8
  %190 = getelementptr inbounds %struct.png_info_def, ptr %189, i32 0, i32 57
  %191 = load i8, ptr %190, align 8
  %192 = zext i8 %191 to i32
  %193 = load ptr, ptr %4, align 8
  %194 = getelementptr inbounds %struct.png_info_def, ptr %193, i32 0, i32 58
  %195 = load i8, ptr %194, align 1
  %196 = zext i8 %195 to i32
  %197 = load ptr, ptr %4, align 8
  %198 = getelementptr inbounds %struct.png_info_def, ptr %197, i32 0, i32 55
  %199 = load ptr, ptr %198, align 8
  %200 = load ptr, ptr %4, align 8
  %201 = getelementptr inbounds %struct.png_info_def, ptr %200, i32 0, i32 56
  %202 = load ptr, ptr %201, align 8
  call void @png_write_pCAL(ptr noundef %179, ptr noundef %182, i32 noundef %185, i32 noundef %188, i32 noundef %192, i32 noundef %196, ptr noundef %199, ptr noundef %202)
  br label %203

203:                                              ; preds = %178, %172
  %204 = load ptr, ptr %4, align 8
  %205 = getelementptr inbounds %struct.png_info_def, ptr %204, i32 0, i32 2
  %206 = load i32, ptr %205, align 8
  %207 = and i32 %206, 16384
  %208 = icmp ne i32 %207, 0
  br i1 %208, label %209, label %221

209:                                              ; preds = %203
  %210 = load ptr, ptr %3, align 8
  %211 = load ptr, ptr %4, align 8
  %212 = getelementptr inbounds %struct.png_info_def, ptr %211, i32 0, i32 64
  %213 = load i8, ptr %212, align 4
  %214 = zext i8 %213 to i32
  %215 = load ptr, ptr %4, align 8
  %216 = getelementptr inbounds %struct.png_info_def, ptr %215, i32 0, i32 65
  %217 = load ptr, ptr %216, align 8
  %218 = load ptr, ptr %4, align 8
  %219 = getelementptr inbounds %struct.png_info_def, ptr %218, i32 0, i32 66
  %220 = load ptr, ptr %219, align 8
  call void @png_write_sCAL_s(ptr noundef %210, i32 noundef %214, ptr noundef %217, ptr noundef %220)
  br label %221

221:                                              ; preds = %209, %203
  %222 = load ptr, ptr %4, align 8
  %223 = getelementptr inbounds %struct.png_info_def, ptr %222, i32 0, i32 2
  %224 = load i32, ptr %223, align 8
  %225 = and i32 %224, 128
  %226 = icmp ne i32 %225, 0
  br i1 %226, label %227, label %239

227:                                              ; preds = %221
  %228 = load ptr, ptr %3, align 8
  %229 = load ptr, ptr %4, align 8
  %230 = getelementptr inbounds %struct.png_info_def, ptr %229, i32 0, i32 46
  %231 = load i32, ptr %230, align 8
  %232 = load ptr, ptr %4, align 8
  %233 = getelementptr inbounds %struct.png_info_def, ptr %232, i32 0, i32 47
  %234 = load i32, ptr %233, align 4
  %235 = load ptr, ptr %4, align 8
  %236 = getelementptr inbounds %struct.png_info_def, ptr %235, i32 0, i32 48
  %237 = load i8, ptr %236, align 8
  %238 = zext i8 %237 to i32
  call void @png_write_pHYs(ptr noundef %228, i32 noundef %231, i32 noundef %234, i32 noundef %238)
  br label %239

239:                                              ; preds = %227, %221
  %240 = load ptr, ptr %4, align 8
  %241 = getelementptr inbounds %struct.png_info_def, ptr %240, i32 0, i32 2
  %242 = load i32, ptr %241, align 8
  %243 = and i32 %242, 512
  %244 = icmp ne i32 %243, 0
  br i1 %244, label %245, label %253

245:                                              ; preds = %239
  %246 = load ptr, ptr %3, align 8
  %247 = load ptr, ptr %4, align 8
  %248 = getelementptr inbounds %struct.png_info_def, ptr %247, i32 0, i32 38
  call void @png_write_tIME(ptr noundef %246, ptr noundef %248)
  %249 = load ptr, ptr %3, align 8
  %250 = getelementptr inbounds %struct.png_struct_def, ptr %249, i32 0, i32 15
  %251 = load i32, ptr %250, align 4
  %252 = or i32 %251, 512
  store i32 %252, ptr %250, align 4
  br label %253

253:                                              ; preds = %245, %239
  %254 = load ptr, ptr %4, align 8
  %255 = getelementptr inbounds %struct.png_info_def, ptr %254, i32 0, i32 2
  %256 = load i32, ptr %255, align 8
  %257 = and i32 %256, 8192
  %258 = icmp ne i32 %257, 0
  br i1 %258, label %259, label %278

259:                                              ; preds = %253
  store i32 0, ptr %5, align 4
  br label %260

260:                                              ; preds = %274, %259
  %261 = load i32, ptr %5, align 4
  %262 = load ptr, ptr %4, align 8
  %263 = getelementptr inbounds %struct.png_info_def, ptr %262, i32 0, i32 63
  %264 = load i32, ptr %263, align 8
  %265 = icmp slt i32 %261, %264
  br i1 %265, label %266, label %277

266:                                              ; preds = %260
  %267 = load ptr, ptr %3, align 8
  %268 = load ptr, ptr %4, align 8
  %269 = getelementptr inbounds %struct.png_info_def, ptr %268, i32 0, i32 62
  %270 = load ptr, ptr %269, align 8
  %271 = load i32, ptr %5, align 4
  %272 = sext i32 %271 to i64
  %273 = getelementptr inbounds %struct.png_sPLT_struct, ptr %270, i64 %272
  call void @png_write_sPLT(ptr noundef %267, ptr noundef %273)
  br label %274

274:                                              ; preds = %266
  %275 = load i32, ptr %5, align 4
  %276 = add nsw i32 %275, 1
  store i32 %276, ptr %5, align 4
  br label %260, !llvm.loop !8

277:                                              ; preds = %260
  br label %278

278:                                              ; preds = %277, %253
  store i32 0, ptr %5, align 4
  br label %279

279:                                              ; preds = %444, %278
  %280 = load i32, ptr %5, align 4
  %281 = load ptr, ptr %4, align 8
  %282 = getelementptr inbounds %struct.png_info_def, ptr %281, i32 0, i32 35
  %283 = load i32, ptr %282, align 4
  %284 = icmp slt i32 %280, %283
  br i1 %284, label %285, label %447

285:                                              ; preds = %279
  %286 = load ptr, ptr %4, align 8
  %287 = getelementptr inbounds %struct.png_info_def, ptr %286, i32 0, i32 37
  %288 = load ptr, ptr %287, align 8
  %289 = load i32, ptr %5, align 4
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds %struct.png_text_struct, ptr %288, i64 %290
  %292 = getelementptr inbounds %struct.png_text_struct, ptr %291, i32 0, i32 0
  %293 = load i32, ptr %292, align 8
  %294 = icmp sgt i32 %293, 0
  br i1 %294, label %295, label %363

295:                                              ; preds = %285
  %296 = load ptr, ptr %3, align 8
  %297 = load ptr, ptr %4, align 8
  %298 = getelementptr inbounds %struct.png_info_def, ptr %297, i32 0, i32 37
  %299 = load ptr, ptr %298, align 8
  %300 = load i32, ptr %5, align 4
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds %struct.png_text_struct, ptr %299, i64 %301
  %303 = getelementptr inbounds %struct.png_text_struct, ptr %302, i32 0, i32 0
  %304 = load i32, ptr %303, align 8
  %305 = load ptr, ptr %4, align 8
  %306 = getelementptr inbounds %struct.png_info_def, ptr %305, i32 0, i32 37
  %307 = load ptr, ptr %306, align 8
  %308 = load i32, ptr %5, align 4
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds %struct.png_text_struct, ptr %307, i64 %309
  %311 = getelementptr inbounds %struct.png_text_struct, ptr %310, i32 0, i32 1
  %312 = load ptr, ptr %311, align 8
  %313 = load ptr, ptr %4, align 8
  %314 = getelementptr inbounds %struct.png_info_def, ptr %313, i32 0, i32 37
  %315 = load ptr, ptr %314, align 8
  %316 = load i32, ptr %5, align 4
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds %struct.png_text_struct, ptr %315, i64 %317
  %319 = getelementptr inbounds %struct.png_text_struct, ptr %318, i32 0, i32 5
  %320 = load ptr, ptr %319, align 8
  %321 = load ptr, ptr %4, align 8
  %322 = getelementptr inbounds %struct.png_info_def, ptr %321, i32 0, i32 37
  %323 = load ptr, ptr %322, align 8
  %324 = load i32, ptr %5, align 4
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds %struct.png_text_struct, ptr %323, i64 %325
  %327 = getelementptr inbounds %struct.png_text_struct, ptr %326, i32 0, i32 6
  %328 = load ptr, ptr %327, align 8
  %329 = load ptr, ptr %4, align 8
  %330 = getelementptr inbounds %struct.png_info_def, ptr %329, i32 0, i32 37
  %331 = load ptr, ptr %330, align 8
  %332 = load i32, ptr %5, align 4
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds %struct.png_text_struct, ptr %331, i64 %333
  %335 = getelementptr inbounds %struct.png_text_struct, ptr %334, i32 0, i32 2
  %336 = load ptr, ptr %335, align 8
  call void @png_write_iTXt(ptr noundef %296, i32 noundef %304, ptr noundef %312, ptr noundef %320, ptr noundef %328, ptr noundef %336)
  %337 = load ptr, ptr %4, align 8
  %338 = getelementptr inbounds %struct.png_info_def, ptr %337, i32 0, i32 37
  %339 = load ptr, ptr %338, align 8
  %340 = load i32, ptr %5, align 4
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds %struct.png_text_struct, ptr %339, i64 %341
  %343 = getelementptr inbounds %struct.png_text_struct, ptr %342, i32 0, i32 0
  %344 = load i32, ptr %343, align 8
  %345 = icmp eq i32 %344, -1
  br i1 %345, label %346, label %354

346:                                              ; preds = %295
  %347 = load ptr, ptr %4, align 8
  %348 = getelementptr inbounds %struct.png_info_def, ptr %347, i32 0, i32 37
  %349 = load ptr, ptr %348, align 8
  %350 = load i32, ptr %5, align 4
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds %struct.png_text_struct, ptr %349, i64 %351
  %353 = getelementptr inbounds %struct.png_text_struct, ptr %352, i32 0, i32 0
  store i32 -3, ptr %353, align 8
  br label %362

354:                                              ; preds = %295
  %355 = load ptr, ptr %4, align 8
  %356 = getelementptr inbounds %struct.png_info_def, ptr %355, i32 0, i32 37
  %357 = load ptr, ptr %356, align 8
  %358 = load i32, ptr %5, align 4
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds %struct.png_text_struct, ptr %357, i64 %359
  %361 = getelementptr inbounds %struct.png_text_struct, ptr %360, i32 0, i32 0
  store i32 -2, ptr %361, align 8
  br label %362

362:                                              ; preds = %354, %346
  br label %443

363:                                              ; preds = %285
  %364 = load ptr, ptr %4, align 8
  %365 = getelementptr inbounds %struct.png_info_def, ptr %364, i32 0, i32 37
  %366 = load ptr, ptr %365, align 8
  %367 = load i32, ptr %5, align 4
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds %struct.png_text_struct, ptr %366, i64 %368
  %370 = getelementptr inbounds %struct.png_text_struct, ptr %369, i32 0, i32 0
  %371 = load i32, ptr %370, align 8
  %372 = icmp eq i32 %371, 0
  br i1 %372, label %373, label %406

373:                                              ; preds = %363
  %374 = load ptr, ptr %3, align 8
  %375 = load ptr, ptr %4, align 8
  %376 = getelementptr inbounds %struct.png_info_def, ptr %375, i32 0, i32 37
  %377 = load ptr, ptr %376, align 8
  %378 = load i32, ptr %5, align 4
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds %struct.png_text_struct, ptr %377, i64 %379
  %381 = getelementptr inbounds %struct.png_text_struct, ptr %380, i32 0, i32 1
  %382 = load ptr, ptr %381, align 8
  %383 = load ptr, ptr %4, align 8
  %384 = getelementptr inbounds %struct.png_info_def, ptr %383, i32 0, i32 37
  %385 = load ptr, ptr %384, align 8
  %386 = load i32, ptr %5, align 4
  %387 = sext i32 %386 to i64
  %388 = getelementptr inbounds %struct.png_text_struct, ptr %385, i64 %387
  %389 = getelementptr inbounds %struct.png_text_struct, ptr %388, i32 0, i32 2
  %390 = load ptr, ptr %389, align 8
  %391 = load ptr, ptr %4, align 8
  %392 = getelementptr inbounds %struct.png_info_def, ptr %391, i32 0, i32 37
  %393 = load ptr, ptr %392, align 8
  %394 = load i32, ptr %5, align 4
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds %struct.png_text_struct, ptr %393, i64 %395
  %397 = getelementptr inbounds %struct.png_text_struct, ptr %396, i32 0, i32 0
  %398 = load i32, ptr %397, align 8
  call void @png_write_zTXt(ptr noundef %374, ptr noundef %382, ptr noundef %390, i32 noundef %398)
  %399 = load ptr, ptr %4, align 8
  %400 = getelementptr inbounds %struct.png_info_def, ptr %399, i32 0, i32 37
  %401 = load ptr, ptr %400, align 8
  %402 = load i32, ptr %5, align 4
  %403 = sext i32 %402 to i64
  %404 = getelementptr inbounds %struct.png_text_struct, ptr %401, i64 %403
  %405 = getelementptr inbounds %struct.png_text_struct, ptr %404, i32 0, i32 0
  store i32 -2, ptr %405, align 8
  br label %442

406:                                              ; preds = %363
  %407 = load ptr, ptr %4, align 8
  %408 = getelementptr inbounds %struct.png_info_def, ptr %407, i32 0, i32 37
  %409 = load ptr, ptr %408, align 8
  %410 = load i32, ptr %5, align 4
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds %struct.png_text_struct, ptr %409, i64 %411
  %413 = getelementptr inbounds %struct.png_text_struct, ptr %412, i32 0, i32 0
  %414 = load i32, ptr %413, align 8
  %415 = icmp eq i32 %414, -1
  br i1 %415, label %416, label %441

416:                                              ; preds = %406
  %417 = load ptr, ptr %3, align 8
  %418 = load ptr, ptr %4, align 8
  %419 = getelementptr inbounds %struct.png_info_def, ptr %418, i32 0, i32 37
  %420 = load ptr, ptr %419, align 8
  %421 = load i32, ptr %5, align 4
  %422 = sext i32 %421 to i64
  %423 = getelementptr inbounds %struct.png_text_struct, ptr %420, i64 %422
  %424 = getelementptr inbounds %struct.png_text_struct, ptr %423, i32 0, i32 1
  %425 = load ptr, ptr %424, align 8
  %426 = load ptr, ptr %4, align 8
  %427 = getelementptr inbounds %struct.png_info_def, ptr %426, i32 0, i32 37
  %428 = load ptr, ptr %427, align 8
  %429 = load i32, ptr %5, align 4
  %430 = sext i32 %429 to i64
  %431 = getelementptr inbounds %struct.png_text_struct, ptr %428, i64 %430
  %432 = getelementptr inbounds %struct.png_text_struct, ptr %431, i32 0, i32 2
  %433 = load ptr, ptr %432, align 8
  call void @png_write_tEXt(ptr noundef %417, ptr noundef %425, ptr noundef %433, i64 noundef 0)
  %434 = load ptr, ptr %4, align 8
  %435 = getelementptr inbounds %struct.png_info_def, ptr %434, i32 0, i32 37
  %436 = load ptr, ptr %435, align 8
  %437 = load i32, ptr %5, align 4
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds %struct.png_text_struct, ptr %436, i64 %438
  %440 = getelementptr inbounds %struct.png_text_struct, ptr %439, i32 0, i32 0
  store i32 -3, ptr %440, align 8
  br label %441

441:                                              ; preds = %416, %406
  br label %442

442:                                              ; preds = %441, %373
  br label %443

443:                                              ; preds = %442, %362
  br label %444

444:                                              ; preds = %443
  %445 = load i32, ptr %5, align 4
  %446 = add nsw i32 %445, 1
  store i32 %446, ptr %5, align 4
  br label %279, !llvm.loop !9

447:                                              ; preds = %279
  %448 = load ptr, ptr %3, align 8
  %449 = load ptr, ptr %4, align 8
  call void @write_unknown_chunks(ptr noundef %448, ptr noundef %449, i32 noundef 2)
  br label %450

450:                                              ; preds = %447, %13
  ret void
}

declare void @png_write_PLTE(ptr noundef, ptr noundef, i32 noundef) #1

; Function Attrs: noreturn
declare void @png_error(ptr noundef, ptr noundef) #2

declare void @png_write_tRNS(ptr noundef, ptr noundef, ptr noundef, i32 noundef, i32 noundef) #1

declare void @png_write_bKGD(ptr noundef, ptr noundef, i32 noundef) #1

declare void @png_write_eXIf(ptr noundef, ptr noundef, i32 noundef) #1

declare void @png_write_hIST(ptr noundef, ptr noundef, i32 noundef) #1

declare void @png_write_oFFs(ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

declare void @png_write_pCAL(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) #1

declare void @png_write_sCAL_s(ptr noundef, i32 noundef, ptr noundef, ptr noundef) #1

declare void @png_write_pHYs(ptr noundef, i32 noundef, i32 noundef, i32 noundef) #1

declare void @png_write_tIME(ptr noundef, ptr noundef) #1

declare void @png_write_sPLT(ptr noundef, ptr noundef) #1

declare void @png_write_iTXt(ptr noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare void @png_write_zTXt(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare void @png_write_tEXt(ptr noundef, ptr noundef, ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_write_end(ptr noalias noundef %0, ptr noalias noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  br label %251

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 15
  %12 = load i32, ptr %11, align 4
  %13 = and i32 %12, 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %9
  %16 = load ptr, ptr %3, align 8
  call void @png_error(ptr noundef %16, ptr noundef @.str.2) #7
  unreachable

17:                                               ; preds = %9
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
  call void @png_benign_error(ptr noundef %33, ptr noundef @.str.3)
  br label %34

34:                                               ; preds = %32, %23, %17
  %35 = load ptr, ptr %4, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %245

37:                                               ; preds = %34
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds %struct.png_info_def, ptr %38, i32 0, i32 2
  %40 = load i32, ptr %39, align 8
  %41 = and i32 %40, 512
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %53

43:                                               ; preds = %37
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds %struct.png_struct_def, ptr %44, i32 0, i32 15
  %46 = load i32, ptr %45, align 4
  %47 = and i32 %46, 512
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %53

49:                                               ; preds = %43
  %50 = load ptr, ptr %3, align 8
  %51 = load ptr, ptr %4, align 8
  %52 = getelementptr inbounds %struct.png_info_def, ptr %51, i32 0, i32 38
  call void @png_write_tIME(ptr noundef %50, ptr noundef %52)
  br label %53

53:                                               ; preds = %49, %43, %37
  store i32 0, ptr %5, align 4
  br label %54

54:                                               ; preds = %219, %53
  %55 = load i32, ptr %5, align 4
  %56 = load ptr, ptr %4, align 8
  %57 = getelementptr inbounds %struct.png_info_def, ptr %56, i32 0, i32 35
  %58 = load i32, ptr %57, align 4
  %59 = icmp slt i32 %55, %58
  br i1 %59, label %60, label %222

60:                                               ; preds = %54
  %61 = load ptr, ptr %4, align 8
  %62 = getelementptr inbounds %struct.png_info_def, ptr %61, i32 0, i32 37
  %63 = load ptr, ptr %62, align 8
  %64 = load i32, ptr %5, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds %struct.png_text_struct, ptr %63, i64 %65
  %67 = getelementptr inbounds %struct.png_text_struct, ptr %66, i32 0, i32 0
  %68 = load i32, ptr %67, align 8
  %69 = icmp sgt i32 %68, 0
  br i1 %69, label %70, label %138

70:                                               ; preds = %60
  %71 = load ptr, ptr %3, align 8
  %72 = load ptr, ptr %4, align 8
  %73 = getelementptr inbounds %struct.png_info_def, ptr %72, i32 0, i32 37
  %74 = load ptr, ptr %73, align 8
  %75 = load i32, ptr %5, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds %struct.png_text_struct, ptr %74, i64 %76
  %78 = getelementptr inbounds %struct.png_text_struct, ptr %77, i32 0, i32 0
  %79 = load i32, ptr %78, align 8
  %80 = load ptr, ptr %4, align 8
  %81 = getelementptr inbounds %struct.png_info_def, ptr %80, i32 0, i32 37
  %82 = load ptr, ptr %81, align 8
  %83 = load i32, ptr %5, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds %struct.png_text_struct, ptr %82, i64 %84
  %86 = getelementptr inbounds %struct.png_text_struct, ptr %85, i32 0, i32 1
  %87 = load ptr, ptr %86, align 8
  %88 = load ptr, ptr %4, align 8
  %89 = getelementptr inbounds %struct.png_info_def, ptr %88, i32 0, i32 37
  %90 = load ptr, ptr %89, align 8
  %91 = load i32, ptr %5, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds %struct.png_text_struct, ptr %90, i64 %92
  %94 = getelementptr inbounds %struct.png_text_struct, ptr %93, i32 0, i32 5
  %95 = load ptr, ptr %94, align 8
  %96 = load ptr, ptr %4, align 8
  %97 = getelementptr inbounds %struct.png_info_def, ptr %96, i32 0, i32 37
  %98 = load ptr, ptr %97, align 8
  %99 = load i32, ptr %5, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds %struct.png_text_struct, ptr %98, i64 %100
  %102 = getelementptr inbounds %struct.png_text_struct, ptr %101, i32 0, i32 6
  %103 = load ptr, ptr %102, align 8
  %104 = load ptr, ptr %4, align 8
  %105 = getelementptr inbounds %struct.png_info_def, ptr %104, i32 0, i32 37
  %106 = load ptr, ptr %105, align 8
  %107 = load i32, ptr %5, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds %struct.png_text_struct, ptr %106, i64 %108
  %110 = getelementptr inbounds %struct.png_text_struct, ptr %109, i32 0, i32 2
  %111 = load ptr, ptr %110, align 8
  call void @png_write_iTXt(ptr noundef %71, i32 noundef %79, ptr noundef %87, ptr noundef %95, ptr noundef %103, ptr noundef %111)
  %112 = load ptr, ptr %4, align 8
  %113 = getelementptr inbounds %struct.png_info_def, ptr %112, i32 0, i32 37
  %114 = load ptr, ptr %113, align 8
  %115 = load i32, ptr %5, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds %struct.png_text_struct, ptr %114, i64 %116
  %118 = getelementptr inbounds %struct.png_text_struct, ptr %117, i32 0, i32 0
  %119 = load i32, ptr %118, align 8
  %120 = icmp eq i32 %119, -1
  br i1 %120, label %121, label %129

121:                                              ; preds = %70
  %122 = load ptr, ptr %4, align 8
  %123 = getelementptr inbounds %struct.png_info_def, ptr %122, i32 0, i32 37
  %124 = load ptr, ptr %123, align 8
  %125 = load i32, ptr %5, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds %struct.png_text_struct, ptr %124, i64 %126
  %128 = getelementptr inbounds %struct.png_text_struct, ptr %127, i32 0, i32 0
  store i32 -3, ptr %128, align 8
  br label %137

129:                                              ; preds = %70
  %130 = load ptr, ptr %4, align 8
  %131 = getelementptr inbounds %struct.png_info_def, ptr %130, i32 0, i32 37
  %132 = load ptr, ptr %131, align 8
  %133 = load i32, ptr %5, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds %struct.png_text_struct, ptr %132, i64 %134
  %136 = getelementptr inbounds %struct.png_text_struct, ptr %135, i32 0, i32 0
  store i32 -2, ptr %136, align 8
  br label %137

137:                                              ; preds = %129, %121
  br label %218

138:                                              ; preds = %60
  %139 = load ptr, ptr %4, align 8
  %140 = getelementptr inbounds %struct.png_info_def, ptr %139, i32 0, i32 37
  %141 = load ptr, ptr %140, align 8
  %142 = load i32, ptr %5, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds %struct.png_text_struct, ptr %141, i64 %143
  %145 = getelementptr inbounds %struct.png_text_struct, ptr %144, i32 0, i32 0
  %146 = load i32, ptr %145, align 8
  %147 = icmp sge i32 %146, 0
  br i1 %147, label %148, label %181

148:                                              ; preds = %138
  %149 = load ptr, ptr %3, align 8
  %150 = load ptr, ptr %4, align 8
  %151 = getelementptr inbounds %struct.png_info_def, ptr %150, i32 0, i32 37
  %152 = load ptr, ptr %151, align 8
  %153 = load i32, ptr %5, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds %struct.png_text_struct, ptr %152, i64 %154
  %156 = getelementptr inbounds %struct.png_text_struct, ptr %155, i32 0, i32 1
  %157 = load ptr, ptr %156, align 8
  %158 = load ptr, ptr %4, align 8
  %159 = getelementptr inbounds %struct.png_info_def, ptr %158, i32 0, i32 37
  %160 = load ptr, ptr %159, align 8
  %161 = load i32, ptr %5, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds %struct.png_text_struct, ptr %160, i64 %162
  %164 = getelementptr inbounds %struct.png_text_struct, ptr %163, i32 0, i32 2
  %165 = load ptr, ptr %164, align 8
  %166 = load ptr, ptr %4, align 8
  %167 = getelementptr inbounds %struct.png_info_def, ptr %166, i32 0, i32 37
  %168 = load ptr, ptr %167, align 8
  %169 = load i32, ptr %5, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds %struct.png_text_struct, ptr %168, i64 %170
  %172 = getelementptr inbounds %struct.png_text_struct, ptr %171, i32 0, i32 0
  %173 = load i32, ptr %172, align 8
  call void @png_write_zTXt(ptr noundef %149, ptr noundef %157, ptr noundef %165, i32 noundef %173)
  %174 = load ptr, ptr %4, align 8
  %175 = getelementptr inbounds %struct.png_info_def, ptr %174, i32 0, i32 37
  %176 = load ptr, ptr %175, align 8
  %177 = load i32, ptr %5, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds %struct.png_text_struct, ptr %176, i64 %178
  %180 = getelementptr inbounds %struct.png_text_struct, ptr %179, i32 0, i32 0
  store i32 -2, ptr %180, align 8
  br label %217

181:                                              ; preds = %138
  %182 = load ptr, ptr %4, align 8
  %183 = getelementptr inbounds %struct.png_info_def, ptr %182, i32 0, i32 37
  %184 = load ptr, ptr %183, align 8
  %185 = load i32, ptr %5, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds %struct.png_text_struct, ptr %184, i64 %186
  %188 = getelementptr inbounds %struct.png_text_struct, ptr %187, i32 0, i32 0
  %189 = load i32, ptr %188, align 8
  %190 = icmp eq i32 %189, -1
  br i1 %190, label %191, label %216

191:                                              ; preds = %181
  %192 = load ptr, ptr %3, align 8
  %193 = load ptr, ptr %4, align 8
  %194 = getelementptr inbounds %struct.png_info_def, ptr %193, i32 0, i32 37
  %195 = load ptr, ptr %194, align 8
  %196 = load i32, ptr %5, align 4
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds %struct.png_text_struct, ptr %195, i64 %197
  %199 = getelementptr inbounds %struct.png_text_struct, ptr %198, i32 0, i32 1
  %200 = load ptr, ptr %199, align 8
  %201 = load ptr, ptr %4, align 8
  %202 = getelementptr inbounds %struct.png_info_def, ptr %201, i32 0, i32 37
  %203 = load ptr, ptr %202, align 8
  %204 = load i32, ptr %5, align 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds %struct.png_text_struct, ptr %203, i64 %205
  %207 = getelementptr inbounds %struct.png_text_struct, ptr %206, i32 0, i32 2
  %208 = load ptr, ptr %207, align 8
  call void @png_write_tEXt(ptr noundef %192, ptr noundef %200, ptr noundef %208, i64 noundef 0)
  %209 = load ptr, ptr %4, align 8
  %210 = getelementptr inbounds %struct.png_info_def, ptr %209, i32 0, i32 37
  %211 = load ptr, ptr %210, align 8
  %212 = load i32, ptr %5, align 4
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds %struct.png_text_struct, ptr %211, i64 %213
  %215 = getelementptr inbounds %struct.png_text_struct, ptr %214, i32 0, i32 0
  store i32 -3, ptr %215, align 8
  br label %216

216:                                              ; preds = %191, %181
  br label %217

217:                                              ; preds = %216, %148
  br label %218

218:                                              ; preds = %217, %137
  br label %219

219:                                              ; preds = %218
  %220 = load i32, ptr %5, align 4
  %221 = add nsw i32 %220, 1
  store i32 %221, ptr %5, align 4
  br label %54, !llvm.loop !10

222:                                              ; preds = %54
  %223 = load ptr, ptr %4, align 8
  %224 = getelementptr inbounds %struct.png_info_def, ptr %223, i32 0, i32 2
  %225 = load i32, ptr %224, align 8
  %226 = and i32 %225, 65536
  %227 = icmp ne i32 %226, 0
  br i1 %227, label %228, label %242

228:                                              ; preds = %222
  %229 = load ptr, ptr %3, align 8
  %230 = getelementptr inbounds %struct.png_struct_def, ptr %229, i32 0, i32 15
  %231 = load i32, ptr %230, align 4
  %232 = and i32 %231, 16384
  %233 = icmp eq i32 %232, 0
  br i1 %233, label %234, label %242

234:                                              ; preds = %228
  %235 = load ptr, ptr %3, align 8
  %236 = load ptr, ptr %4, align 8
  %237 = getelementptr inbounds %struct.png_info_def, ptr %236, i32 0, i32 50
  %238 = load ptr, ptr %237, align 8
  %239 = load ptr, ptr %4, align 8
  %240 = getelementptr inbounds %struct.png_info_def, ptr %239, i32 0, i32 49
  %241 = load i32, ptr %240, align 4
  call void @png_write_eXIf(ptr noundef %235, ptr noundef %238, i32 noundef %241)
  br label %242

242:                                              ; preds = %234, %228, %222
  %243 = load ptr, ptr %3, align 8
  %244 = load ptr, ptr %4, align 8
  call void @write_unknown_chunks(ptr noundef %243, ptr noundef %244, i32 noundef 8)
  br label %245

245:                                              ; preds = %242, %34
  %246 = load ptr, ptr %3, align 8
  %247 = getelementptr inbounds %struct.png_struct_def, ptr %246, i32 0, i32 15
  %248 = load i32, ptr %247, align 4
  %249 = or i32 %248, 8
  store i32 %249, ptr %247, align 4
  %250 = load ptr, ptr %3, align 8
  call void @png_write_IEND(ptr noundef %250)
  br label %251

251:                                              ; preds = %245, %8
  ret void
}

declare void @png_benign_error(ptr noundef, ptr noundef) #1

declare void @png_write_IEND(ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_convert_from_struct_tm(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds %struct.tm, ptr %5, i32 0, i32 5
  %7 = load i32, ptr %6, align 4
  %8 = add nsw i32 1900, %7
  %9 = trunc i32 %8 to i16
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.png_time_struct, ptr %10, i32 0, i32 0
  store i16 %9, ptr %11, align 2
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds %struct.tm, ptr %12, i32 0, i32 4
  %14 = load i32, ptr %13, align 8
  %15 = add nsw i32 %14, 1
  %16 = trunc i32 %15 to i8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.png_time_struct, ptr %17, i32 0, i32 1
  store i8 %16, ptr %18, align 2
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds %struct.tm, ptr %19, i32 0, i32 3
  %21 = load i32, ptr %20, align 4
  %22 = trunc i32 %21 to i8
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.png_time_struct, ptr %23, i32 0, i32 2
  store i8 %22, ptr %24, align 1
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.tm, ptr %25, i32 0, i32 2
  %27 = load i32, ptr %26, align 8
  %28 = trunc i32 %27 to i8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds %struct.png_time_struct, ptr %29, i32 0, i32 3
  store i8 %28, ptr %30, align 2
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.tm, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %32, align 4
  %34 = trunc i32 %33 to i8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds %struct.png_time_struct, ptr %35, i32 0, i32 4
  store i8 %34, ptr %36, align 1
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.tm, ptr %37, i32 0, i32 0
  %39 = load i32, ptr %38, align 8
  %40 = trunc i32 %39 to i8
  %41 = load ptr, ptr %3, align 8
  %42 = getelementptr inbounds %struct.png_time_struct, ptr %41, i32 0, i32 5
  store i8 %40, ptr %42, align 2
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_convert_from_time_t(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = call ptr @gmtime(ptr noundef %4) #8
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %11

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  call void @llvm.memset.p0.i64(ptr align 2 %10, i8 0, i64 8, i1 false)
  br label %14

11:                                               ; preds = %2
  %12 = load ptr, ptr %3, align 8
  %13 = load ptr, ptr %5, align 8
  call void @png_convert_from_struct_tm(ptr noundef %12, ptr noundef %13)
  br label %14

14:                                               ; preds = %11, %9
  ret void
}

; Function Attrs: nounwind
declare ptr @gmtime(ptr noundef) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: noinline nounwind sspstrong uwtable
define noalias ptr @png_create_write_struct(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
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
  %13 = call noalias ptr @png_create_write_struct_2(ptr noundef %9, ptr noundef %10, ptr noundef %11, ptr noundef %12, ptr noundef null, ptr noundef null, ptr noundef null)
  ret ptr %13
}

; Function Attrs: noinline nounwind sspstrong uwtable
define noalias ptr @png_create_write_struct_2(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) #0 {
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
  br i1 %25, label %26, label %50

26:                                               ; preds = %7
  %27 = load ptr, ptr %15, align 8
  %28 = getelementptr inbounds %struct.png_struct_def, ptr %27, i32 0, i32 21
  store i32 8192, ptr %28, align 8
  %29 = load ptr, ptr %15, align 8
  %30 = getelementptr inbounds %struct.png_struct_def, ptr %29, i32 0, i32 26
  store i32 1, ptr %30, align 4
  %31 = load ptr, ptr %15, align 8
  %32 = getelementptr inbounds %struct.png_struct_def, ptr %31, i32 0, i32 22
  store i32 -1, ptr %32, align 4
  %33 = load ptr, ptr %15, align 8
  %34 = getelementptr inbounds %struct.png_struct_def, ptr %33, i32 0, i32 25
  store i32 8, ptr %34, align 8
  %35 = load ptr, ptr %15, align 8
  %36 = getelementptr inbounds %struct.png_struct_def, ptr %35, i32 0, i32 24
  store i32 15, ptr %36, align 4
  %37 = load ptr, ptr %15, align 8
  %38 = getelementptr inbounds %struct.png_struct_def, ptr %37, i32 0, i32 23
  store i32 8, ptr %38, align 8
  %39 = load ptr, ptr %15, align 8
  %40 = getelementptr inbounds %struct.png_struct_def, ptr %39, i32 0, i32 31
  store i32 0, ptr %40, align 8
  %41 = load ptr, ptr %15, align 8
  %42 = getelementptr inbounds %struct.png_struct_def, ptr %41, i32 0, i32 27
  store i32 -1, ptr %42, align 8
  %43 = load ptr, ptr %15, align 8
  %44 = getelementptr inbounds %struct.png_struct_def, ptr %43, i32 0, i32 30
  store i32 8, ptr %44, align 4
  %45 = load ptr, ptr %15, align 8
  %46 = getelementptr inbounds %struct.png_struct_def, ptr %45, i32 0, i32 29
  store i32 15, ptr %46, align 8
  %47 = load ptr, ptr %15, align 8
  %48 = getelementptr inbounds %struct.png_struct_def, ptr %47, i32 0, i32 28
  store i32 8, ptr %48, align 4
  %49 = load ptr, ptr %15, align 8
  call void @png_set_write_fn(ptr noundef %49, ptr noundef null, ptr noundef null, ptr noundef null)
  br label %50

50:                                               ; preds = %26, %7
  %51 = load ptr, ptr %15, align 8
  ret ptr %51
}

declare noalias ptr @png_create_png_struct(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

declare void @png_set_write_fn(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_write_rows(ptr noalias noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %3
  br label %27

12:                                               ; preds = %3
  store i32 0, ptr %7, align 4
  %13 = load ptr, ptr %5, align 8
  store ptr %13, ptr %8, align 8
  br label %14

14:                                               ; preds = %22, %12
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %6, align 4
  %17 = icmp ult i32 %15, %16
  br i1 %17, label %18, label %27

18:                                               ; preds = %14
  %19 = load ptr, ptr %4, align 8
  %20 = load ptr, ptr %8, align 8
  %21 = load ptr, ptr %20, align 8
  call void @png_write_row(ptr noundef %19, ptr noundef %21)
  br label %22

22:                                               ; preds = %18
  %23 = load i32, ptr %7, align 4
  %24 = add i32 %23, 1
  store i32 %24, ptr %7, align 4
  %25 = load ptr, ptr %8, align 8
  %26 = getelementptr inbounds ptr, ptr %25, i32 1
  store ptr %26, ptr %8, align 8
  br label %14, !llvm.loop !11

27:                                               ; preds = %11, %14
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_write_row(ptr noalias noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.png_row_info_struct, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  br label %292

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 44
  %12 = load i32, ptr %11, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %30

14:                                               ; preds = %9
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.png_struct_def, ptr %15, i32 0, i32 60
  %17 = load i8, ptr %16, align 1
  %18 = zext i8 %17 to i32
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %30

20:                                               ; preds = %14
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.png_struct_def, ptr %21, i32 0, i32 15
  %23 = load i32, ptr %22, align 4
  %24 = and i32 %23, 1024
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %28

26:                                               ; preds = %20
  %27 = load ptr, ptr %3, align 8
  call void @png_error(ptr noundef %27, ptr noundef @.str.4) #7
  unreachable

28:                                               ; preds = %20
  %29 = load ptr, ptr %3, align 8
  call void @png_write_start_row(ptr noundef %29)
  br label %30

30:                                               ; preds = %28, %14, %9
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds %struct.png_struct_def, ptr %31, i32 0, i32 59
  %33 = load i8, ptr %32, align 4
  %34 = zext i8 %33 to i32
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %127

36:                                               ; preds = %30
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds %struct.png_struct_def, ptr %37, i32 0, i32 17
  %39 = load i32, ptr %38, align 4
  %40 = and i32 %39, 2
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %127

42:                                               ; preds = %36
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds %struct.png_struct_def, ptr %43, i32 0, i32 60
  %45 = load i8, ptr %44, align 1
  %46 = zext i8 %45 to i32
  switch i32 %46, label %125 [
    i32 0, label %47
    i32 1, label %56
    i32 2, label %70
    i32 3, label %79
    i32 4, label %93
    i32 5, label %102
    i32 6, label %116
  ]

47:                                               ; preds = %42
  %48 = load ptr, ptr %3, align 8
  %49 = getelementptr inbounds %struct.png_struct_def, ptr %48, i32 0, i32 44
  %50 = load i32, ptr %49, align 4
  %51 = and i32 %50, 7
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %55

53:                                               ; preds = %47
  %54 = load ptr, ptr %3, align 8
  call void @png_write_finish_row(ptr noundef %54)
  br label %292

55:                                               ; preds = %47
  br label %126

56:                                               ; preds = %42
  %57 = load ptr, ptr %3, align 8
  %58 = getelementptr inbounds %struct.png_struct_def, ptr %57, i32 0, i32 44
  %59 = load i32, ptr %58, align 4
  %60 = and i32 %59, 7
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %67, label %62

62:                                               ; preds = %56
  %63 = load ptr, ptr %3, align 8
  %64 = getelementptr inbounds %struct.png_struct_def, ptr %63, i32 0, i32 38
  %65 = load i32, ptr %64, align 4
  %66 = icmp ult i32 %65, 5
  br i1 %66, label %67, label %69

67:                                               ; preds = %62, %56
  %68 = load ptr, ptr %3, align 8
  call void @png_write_finish_row(ptr noundef %68)
  br label %292

69:                                               ; preds = %62
  br label %126

70:                                               ; preds = %42
  %71 = load ptr, ptr %3, align 8
  %72 = getelementptr inbounds %struct.png_struct_def, ptr %71, i32 0, i32 44
  %73 = load i32, ptr %72, align 4
  %74 = and i32 %73, 7
  %75 = icmp ne i32 %74, 4
  br i1 %75, label %76, label %78

76:                                               ; preds = %70
  %77 = load ptr, ptr %3, align 8
  call void @png_write_finish_row(ptr noundef %77)
  br label %292

78:                                               ; preds = %70
  br label %126

79:                                               ; preds = %42
  %80 = load ptr, ptr %3, align 8
  %81 = getelementptr inbounds %struct.png_struct_def, ptr %80, i32 0, i32 44
  %82 = load i32, ptr %81, align 4
  %83 = and i32 %82, 3
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %90, label %85

85:                                               ; preds = %79
  %86 = load ptr, ptr %3, align 8
  %87 = getelementptr inbounds %struct.png_struct_def, ptr %86, i32 0, i32 38
  %88 = load i32, ptr %87, align 4
  %89 = icmp ult i32 %88, 3
  br i1 %89, label %90, label %92

90:                                               ; preds = %85, %79
  %91 = load ptr, ptr %3, align 8
  call void @png_write_finish_row(ptr noundef %91)
  br label %292

92:                                               ; preds = %85
  br label %126

93:                                               ; preds = %42
  %94 = load ptr, ptr %3, align 8
  %95 = getelementptr inbounds %struct.png_struct_def, ptr %94, i32 0, i32 44
  %96 = load i32, ptr %95, align 4
  %97 = and i32 %96, 3
  %98 = icmp ne i32 %97, 2
  br i1 %98, label %99, label %101

99:                                               ; preds = %93
  %100 = load ptr, ptr %3, align 8
  call void @png_write_finish_row(ptr noundef %100)
  br label %292

101:                                              ; preds = %93
  br label %126

102:                                              ; preds = %42
  %103 = load ptr, ptr %3, align 8
  %104 = getelementptr inbounds %struct.png_struct_def, ptr %103, i32 0, i32 44
  %105 = load i32, ptr %104, align 4
  %106 = and i32 %105, 1
  %107 = icmp ne i32 %106, 0
  br i1 %107, label %113, label %108

108:                                              ; preds = %102
  %109 = load ptr, ptr %3, align 8
  %110 = getelementptr inbounds %struct.png_struct_def, ptr %109, i32 0, i32 38
  %111 = load i32, ptr %110, align 4
  %112 = icmp ult i32 %111, 2
  br i1 %112, label %113, label %115

113:                                              ; preds = %108, %102
  %114 = load ptr, ptr %3, align 8
  call void @png_write_finish_row(ptr noundef %114)
  br label %292

115:                                              ; preds = %108
  br label %126

116:                                              ; preds = %42
  %117 = load ptr, ptr %3, align 8
  %118 = getelementptr inbounds %struct.png_struct_def, ptr %117, i32 0, i32 44
  %119 = load i32, ptr %118, align 4
  %120 = and i32 %119, 1
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %122, label %124

122:                                              ; preds = %116
  %123 = load ptr, ptr %3, align 8
  call void @png_write_finish_row(ptr noundef %123)
  br label %292

124:                                              ; preds = %116
  br label %126

125:                                              ; preds = %42
  br label %126

126:                                              ; preds = %125, %124, %115, %101, %92, %78, %69, %55
  br label %127

127:                                              ; preds = %126, %36, %30
  %128 = load ptr, ptr %3, align 8
  %129 = getelementptr inbounds %struct.png_struct_def, ptr %128, i32 0, i32 62
  %130 = load i8, ptr %129, align 1
  %131 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 2
  store i8 %130, ptr %131, align 8
  %132 = load ptr, ptr %3, align 8
  %133 = getelementptr inbounds %struct.png_struct_def, ptr %132, i32 0, i32 41
  %134 = load i32, ptr %133, align 8
  %135 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 0
  store i32 %134, ptr %135, align 8
  %136 = load ptr, ptr %3, align 8
  %137 = getelementptr inbounds %struct.png_struct_def, ptr %136, i32 0, i32 67
  %138 = load i8, ptr %137, align 4
  %139 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 4
  store i8 %138, ptr %139, align 2
  %140 = load ptr, ptr %3, align 8
  %141 = getelementptr inbounds %struct.png_struct_def, ptr %140, i32 0, i32 64
  %142 = load i8, ptr %141, align 1
  %143 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 3
  store i8 %142, ptr %143, align 1
  %144 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 3
  %145 = load i8, ptr %144, align 1
  %146 = zext i8 %145 to i32
  %147 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 4
  %148 = load i8, ptr %147, align 2
  %149 = zext i8 %148 to i32
  %150 = mul nsw i32 %146, %149
  %151 = trunc i32 %150 to i8
  %152 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 5
  store i8 %151, ptr %152, align 1
  %153 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 5
  %154 = load i8, ptr %153, align 1
  %155 = zext i8 %154 to i32
  %156 = icmp sge i32 %155, 8
  br i1 %156, label %157, label %166

157:                                              ; preds = %127
  %158 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 0
  %159 = load i32, ptr %158, align 8
  %160 = zext i32 %159 to i64
  %161 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 5
  %162 = load i8, ptr %161, align 1
  %163 = zext i8 %162 to i64
  %164 = lshr i64 %163, 3
  %165 = mul i64 %160, %164
  br label %176

166:                                              ; preds = %127
  %167 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 0
  %168 = load i32, ptr %167, align 8
  %169 = zext i32 %168 to i64
  %170 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 5
  %171 = load i8, ptr %170, align 1
  %172 = zext i8 %171 to i64
  %173 = mul i64 %169, %172
  %174 = add i64 %173, 7
  %175 = lshr i64 %174, 3
  br label %176

176:                                              ; preds = %166, %157
  %177 = phi i64 [ %165, %157 ], [ %175, %166 ]
  %178 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 1
  store i64 %177, ptr %178, align 8
  %179 = load ptr, ptr %3, align 8
  %180 = getelementptr inbounds %struct.png_struct_def, ptr %179, i32 0, i32 47
  %181 = load ptr, ptr %180, align 8
  %182 = getelementptr inbounds i8, ptr %181, i64 1
  %183 = load ptr, ptr %4, align 8
  %184 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 1
  %185 = load i64, ptr %184, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %182, ptr align 1 %183, i64 %185, i1 false)
  %186 = load ptr, ptr %3, align 8
  %187 = getelementptr inbounds %struct.png_struct_def, ptr %186, i32 0, i32 59
  %188 = load i8, ptr %187, align 4
  %189 = zext i8 %188 to i32
  %190 = icmp ne i32 %189, 0
  br i1 %190, label %191, label %218

191:                                              ; preds = %176
  %192 = load ptr, ptr %3, align 8
  %193 = getelementptr inbounds %struct.png_struct_def, ptr %192, i32 0, i32 60
  %194 = load i8, ptr %193, align 1
  %195 = zext i8 %194 to i32
  %196 = icmp slt i32 %195, 6
  br i1 %196, label %197, label %218

197:                                              ; preds = %191
  %198 = load ptr, ptr %3, align 8
  %199 = getelementptr inbounds %struct.png_struct_def, ptr %198, i32 0, i32 17
  %200 = load i32, ptr %199, align 4
  %201 = and i32 %200, 2
  %202 = icmp ne i32 %201, 0
  br i1 %202, label %203, label %218

203:                                              ; preds = %197
  %204 = load ptr, ptr %3, align 8
  %205 = getelementptr inbounds %struct.png_struct_def, ptr %204, i32 0, i32 47
  %206 = load ptr, ptr %205, align 8
  %207 = getelementptr inbounds i8, ptr %206, i64 1
  %208 = load ptr, ptr %3, align 8
  %209 = getelementptr inbounds %struct.png_struct_def, ptr %208, i32 0, i32 60
  %210 = load i8, ptr %209, align 1
  %211 = zext i8 %210 to i32
  call void @png_do_write_interlace(ptr noundef %5, ptr noundef %207, i32 noundef %211)
  %212 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 0
  %213 = load i32, ptr %212, align 8
  %214 = icmp eq i32 %213, 0
  br i1 %214, label %215, label %217

215:                                              ; preds = %203
  %216 = load ptr, ptr %3, align 8
  call void @png_write_finish_row(ptr noundef %216)
  br label %292

217:                                              ; preds = %203
  br label %218

218:                                              ; preds = %217, %197, %191, %176
  %219 = load ptr, ptr %3, align 8
  %220 = getelementptr inbounds %struct.png_struct_def, ptr %219, i32 0, i32 17
  %221 = load i32, ptr %220, align 4
  %222 = icmp ne i32 %221, 0
  br i1 %222, label %223, label %225

223:                                              ; preds = %218
  %224 = load ptr, ptr %3, align 8
  call void @png_do_write_transformations(ptr noundef %224, ptr noundef %5)
  br label %225

225:                                              ; preds = %223, %218
  %226 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 5
  %227 = load i8, ptr %226, align 1
  %228 = zext i8 %227 to i32
  %229 = load ptr, ptr %3, align 8
  %230 = getelementptr inbounds %struct.png_struct_def, ptr %229, i32 0, i32 65
  %231 = load i8, ptr %230, align 2
  %232 = zext i8 %231 to i32
  %233 = icmp ne i32 %228, %232
  br i1 %233, label %243, label %234

234:                                              ; preds = %225
  %235 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 5
  %236 = load i8, ptr %235, align 1
  %237 = zext i8 %236 to i32
  %238 = load ptr, ptr %3, align 8
  %239 = getelementptr inbounds %struct.png_struct_def, ptr %238, i32 0, i32 70
  %240 = load i8, ptr %239, align 1
  %241 = zext i8 %240 to i32
  %242 = icmp ne i32 %237, %241
  br i1 %242, label %243, label %245

243:                                              ; preds = %234, %225
  %244 = load ptr, ptr %3, align 8
  call void @png_error(ptr noundef %244, ptr noundef @.str.5) #7
  unreachable

245:                                              ; preds = %234
  %246 = load ptr, ptr %3, align 8
  %247 = getelementptr inbounds %struct.png_struct_def, ptr %246, i32 0, i32 128
  %248 = load i32, ptr %247, align 8
  %249 = and i32 %248, 4
  %250 = icmp ne i32 %249, 0
  br i1 %250, label %251, label %262

251:                                              ; preds = %245
  %252 = load ptr, ptr %3, align 8
  %253 = getelementptr inbounds %struct.png_struct_def, ptr %252, i32 0, i32 129
  %254 = load i8, ptr %253, align 4
  %255 = zext i8 %254 to i32
  %256 = icmp eq i32 %255, 64
  br i1 %256, label %257, label %262

257:                                              ; preds = %251
  %258 = load ptr, ptr %3, align 8
  %259 = getelementptr inbounds %struct.png_struct_def, ptr %258, i32 0, i32 47
  %260 = load ptr, ptr %259, align 8
  %261 = getelementptr inbounds i8, ptr %260, i64 1
  call void @png_do_write_intrapixel(ptr noundef %5, ptr noundef %261)
  br label %262

262:                                              ; preds = %257, %251, %245
  %263 = getelementptr inbounds %struct.png_row_info_struct, ptr %5, i32 0, i32 2
  %264 = load i8, ptr %263, align 8
  %265 = zext i8 %264 to i32
  %266 = icmp eq i32 %265, 3
  br i1 %266, label %267, label %274

267:                                              ; preds = %262
  %268 = load ptr, ptr %3, align 8
  %269 = getelementptr inbounds %struct.png_struct_def, ptr %268, i32 0, i32 55
  %270 = load i32, ptr %269, align 4
  %271 = icmp sge i32 %270, 0
  br i1 %271, label %272, label %274

272:                                              ; preds = %267
  %273 = load ptr, ptr %3, align 8
  call void @png_do_check_palette_indexes(ptr noundef %273, ptr noundef %5)
  br label %274

274:                                              ; preds = %272, %267, %262
  %275 = load ptr, ptr %3, align 8
  call void @png_write_find_filter(ptr noundef %275, ptr noundef %5)
  %276 = load ptr, ptr %3, align 8
  %277 = getelementptr inbounds %struct.png_struct_def, ptr %276, i32 0, i32 97
  %278 = load ptr, ptr %277, align 8
  %279 = icmp ne ptr %278, null
  br i1 %279, label %280, label %292

280:                                              ; preds = %274
  %281 = load ptr, ptr %3, align 8
  %282 = getelementptr inbounds %struct.png_struct_def, ptr %281, i32 0, i32 97
  %283 = load ptr, ptr %282, align 8
  %284 = load ptr, ptr %3, align 8
  %285 = load ptr, ptr %3, align 8
  %286 = getelementptr inbounds %struct.png_struct_def, ptr %285, i32 0, i32 44
  %287 = load i32, ptr %286, align 4
  %288 = load ptr, ptr %3, align 8
  %289 = getelementptr inbounds %struct.png_struct_def, ptr %288, i32 0, i32 60
  %290 = load i8, ptr %289, align 1
  %291 = zext i8 %290 to i32
  call void %283(ptr noundef %284, i32 noundef %287, i32 noundef %291)
  br label %292

292:                                              ; preds = %8, %53, %67, %76, %90, %99, %113, %122, %215, %280, %274
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_write_image(ptr noalias noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %2
  br label %40

12:                                               ; preds = %2
  %13 = load ptr, ptr %3, align 8
  %14 = call i32 @png_set_interlace_handling(ptr noundef %13)
  store i32 %14, ptr %7, align 4
  store i32 0, ptr %6, align 4
  br label %15

15:                                               ; preds = %37, %12
  %16 = load i32, ptr %6, align 4
  %17 = load i32, ptr %7, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %40

19:                                               ; preds = %15
  store i32 0, ptr %5, align 4
  %20 = load ptr, ptr %4, align 8
  store ptr %20, ptr %8, align 8
  br label %21

21:                                               ; preds = %31, %19
  %22 = load i32, ptr %5, align 4
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.png_struct_def, ptr %23, i32 0, i32 39
  %25 = load i32, ptr %24, align 8
  %26 = icmp ult i32 %22, %25
  br i1 %26, label %27, label %36

27:                                               ; preds = %21
  %28 = load ptr, ptr %3, align 8
  %29 = load ptr, ptr %8, align 8
  %30 = load ptr, ptr %29, align 8
  call void @png_write_row(ptr noundef %28, ptr noundef %30)
  br label %31

31:                                               ; preds = %27
  %32 = load i32, ptr %5, align 4
  %33 = add i32 %32, 1
  store i32 %33, ptr %5, align 4
  %34 = load ptr, ptr %8, align 8
  %35 = getelementptr inbounds ptr, ptr %34, i32 1
  store ptr %35, ptr %8, align 8
  br label %21, !llvm.loop !12

36:                                               ; preds = %21
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %6, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %6, align 4
  br label %15, !llvm.loop !13

40:                                               ; preds = %11, %15
  ret void
}

declare i32 @png_set_interlace_handling(ptr noundef) #1

declare void @png_write_start_row(ptr noundef) #1

declare void @png_write_finish_row(ptr noundef) #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

declare void @png_do_write_interlace(ptr noundef, ptr noundef, i32 noundef) #1

declare void @png_do_write_transformations(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_do_write_intrapixel(ptr noundef %0, ptr noundef %1) #0 {
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
  br i1 %21, label %22, label %181

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
  br i1 %30, label %31, label %84

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
  br label %181

46:                                               ; preds = %44
  br label %47

47:                                               ; preds = %46, %37
  store i32 0, ptr %8, align 4
  %48 = load ptr, ptr %4, align 8
  store ptr %48, ptr %7, align 8
  br label %49

49:                                               ; preds = %76, %47
  %50 = load i32, ptr %8, align 4
  %51 = load i32, ptr %6, align 4
  %52 = icmp ult i32 %50, %51
  br i1 %52, label %53, label %83

53:                                               ; preds = %49
  %54 = load ptr, ptr %7, align 8
  %55 = load i8, ptr %54, align 1
  %56 = zext i8 %55 to i32
  %57 = load ptr, ptr %7, align 8
  %58 = getelementptr inbounds i8, ptr %57, i64 1
  %59 = load i8, ptr %58, align 1
  %60 = zext i8 %59 to i32
  %61 = sub nsw i32 %56, %60
  %62 = trunc i32 %61 to i8
  %63 = load ptr, ptr %7, align 8
  store i8 %62, ptr %63, align 1
  %64 = load ptr, ptr %7, align 8
  %65 = getelementptr inbounds i8, ptr %64, i64 2
  %66 = load i8, ptr %65, align 1
  %67 = zext i8 %66 to i32
  %68 = load ptr, ptr %7, align 8
  %69 = getelementptr inbounds i8, ptr %68, i64 1
  %70 = load i8, ptr %69, align 1
  %71 = zext i8 %70 to i32
  %72 = sub nsw i32 %67, %71
  %73 = trunc i32 %72 to i8
  %74 = load ptr, ptr %7, align 8
  %75 = getelementptr inbounds i8, ptr %74, i64 2
  store i8 %73, ptr %75, align 1
  br label %76

76:                                               ; preds = %53
  %77 = load i32, ptr %8, align 4
  %78 = add i32 %77, 1
  store i32 %78, ptr %8, align 4
  %79 = load i32, ptr %5, align 4
  %80 = load ptr, ptr %7, align 8
  %81 = sext i32 %79 to i64
  %82 = getelementptr inbounds i8, ptr %80, i64 %81
  store ptr %82, ptr %7, align 8
  br label %49, !llvm.loop !14

83:                                               ; preds = %49
  br label %180

84:                                               ; preds = %22
  %85 = load ptr, ptr %3, align 8
  %86 = getelementptr inbounds %struct.png_row_info_struct, ptr %85, i32 0, i32 3
  %87 = load i8, ptr %86, align 1
  %88 = zext i8 %87 to i32
  %89 = icmp eq i32 %88, 16
  br i1 %89, label %90, label %179

90:                                               ; preds = %84
  %91 = load ptr, ptr %3, align 8
  %92 = getelementptr inbounds %struct.png_row_info_struct, ptr %91, i32 0, i32 2
  %93 = load i8, ptr %92, align 8
  %94 = zext i8 %93 to i32
  %95 = icmp eq i32 %94, 2
  br i1 %95, label %96, label %97

96:                                               ; preds = %90
  store i32 6, ptr %5, align 4
  br label %106

97:                                               ; preds = %90
  %98 = load ptr, ptr %3, align 8
  %99 = getelementptr inbounds %struct.png_row_info_struct, ptr %98, i32 0, i32 2
  %100 = load i8, ptr %99, align 8
  %101 = zext i8 %100 to i32
  %102 = icmp eq i32 %101, 6
  br i1 %102, label %103, label %104

103:                                              ; preds = %97
  store i32 8, ptr %5, align 4
  br label %105

104:                                              ; preds = %97
  br label %181

105:                                              ; preds = %103
  br label %106

106:                                              ; preds = %105, %96
  store i32 0, ptr %10, align 4
  %107 = load ptr, ptr %4, align 8
  store ptr %107, ptr %9, align 8
  br label %108

108:                                              ; preds = %171, %106
  %109 = load i32, ptr %10, align 4
  %110 = load i32, ptr %6, align 4
  %111 = icmp ult i32 %109, %110
  br i1 %111, label %112, label %178

112:                                              ; preds = %108
  %113 = load ptr, ptr %9, align 8
  %114 = load i8, ptr %113, align 1
  %115 = zext i8 %114 to i32
  %116 = shl i32 %115, 8
  %117 = load ptr, ptr %9, align 8
  %118 = getelementptr inbounds i8, ptr %117, i64 1
  %119 = load i8, ptr %118, align 1
  %120 = zext i8 %119 to i32
  %121 = or i32 %116, %120
  store i32 %121, ptr %11, align 4
  %122 = load ptr, ptr %9, align 8
  %123 = getelementptr inbounds i8, ptr %122, i64 2
  %124 = load i8, ptr %123, align 1
  %125 = zext i8 %124 to i32
  %126 = shl i32 %125, 8
  %127 = load ptr, ptr %9, align 8
  %128 = getelementptr inbounds i8, ptr %127, i64 3
  %129 = load i8, ptr %128, align 1
  %130 = zext i8 %129 to i32
  %131 = or i32 %126, %130
  store i32 %131, ptr %12, align 4
  %132 = load ptr, ptr %9, align 8
  %133 = getelementptr inbounds i8, ptr %132, i64 4
  %134 = load i8, ptr %133, align 1
  %135 = zext i8 %134 to i32
  %136 = shl i32 %135, 8
  %137 = load ptr, ptr %9, align 8
  %138 = getelementptr inbounds i8, ptr %137, i64 5
  %139 = load i8, ptr %138, align 1
  %140 = zext i8 %139 to i32
  %141 = or i32 %136, %140
  store i32 %141, ptr %13, align 4
  %142 = load i32, ptr %11, align 4
  %143 = load i32, ptr %12, align 4
  %144 = sub i32 %142, %143
  %145 = zext i32 %144 to i64
  %146 = and i64 %145, 65535
  %147 = trunc i64 %146 to i32
  store i32 %147, ptr %14, align 4
  %148 = load i32, ptr %13, align 4
  %149 = load i32, ptr %12, align 4
  %150 = sub i32 %148, %149
  %151 = zext i32 %150 to i64
  %152 = and i64 %151, 65535
  %153 = trunc i64 %152 to i32
  store i32 %153, ptr %15, align 4
  %154 = load i32, ptr %14, align 4
  %155 = lshr i32 %154, 8
  %156 = trunc i32 %155 to i8
  %157 = load ptr, ptr %9, align 8
  store i8 %156, ptr %157, align 1
  %158 = load i32, ptr %14, align 4
  %159 = trunc i32 %158 to i8
  %160 = load ptr, ptr %9, align 8
  %161 = getelementptr inbounds i8, ptr %160, i64 1
  store i8 %159, ptr %161, align 1
  %162 = load i32, ptr %15, align 4
  %163 = lshr i32 %162, 8
  %164 = trunc i32 %163 to i8
  %165 = load ptr, ptr %9, align 8
  %166 = getelementptr inbounds i8, ptr %165, i64 4
  store i8 %164, ptr %166, align 1
  %167 = load i32, ptr %15, align 4
  %168 = trunc i32 %167 to i8
  %169 = load ptr, ptr %9, align 8
  %170 = getelementptr inbounds i8, ptr %169, i64 5
  store i8 %168, ptr %170, align 1
  br label %171

171:                                              ; preds = %112
  %172 = load i32, ptr %10, align 4
  %173 = add i32 %172, 1
  store i32 %173, ptr %10, align 4
  %174 = load i32, ptr %5, align 4
  %175 = load ptr, ptr %9, align 8
  %176 = sext i32 %174 to i64
  %177 = getelementptr inbounds i8, ptr %175, i64 %176
  store ptr %177, ptr %9, align 8
  br label %108, !llvm.loop !15

178:                                              ; preds = %108
  br label %179

179:                                              ; preds = %178, %84
  br label %180

180:                                              ; preds = %179, %83
  br label %181

181:                                              ; preds = %45, %104, %180, %2
  ret void
}

declare void @png_do_check_palette_indexes(ptr noundef, ptr noundef) #1

declare void @png_write_find_filter(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_flush(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %18

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  br label %14

12:                                               ; preds = %8
  %13 = load i32, ptr %4, align 4
  br label %14

14:                                               ; preds = %12, %11
  %15 = phi i32 [ 0, %11 ], [ %13, %12 ]
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 78
  store i32 %15, ptr %17, align 8
  br label %18

18:                                               ; preds = %14, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_write_flush(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp eq ptr %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  br label %20

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds %struct.png_struct_def, ptr %7, i32 0, i32 44
  %9 = load i32, ptr %8, align 4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 40
  %12 = load i32, ptr %11, align 4
  %13 = icmp uge i32 %9, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %6
  br label %20

15:                                               ; preds = %6
  %16 = load ptr, ptr %2, align 8
  call void @png_compress_IDAT(ptr noundef %16, ptr noundef null, i64 noundef 0, i32 noundef 2)
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.png_struct_def, ptr %17, i32 0, i32 79
  store i32 0, ptr %18, align 4
  %19 = load ptr, ptr %2, align 8
  call void @png_flush(ptr noundef %19)
  br label %20

20:                                               ; preds = %15, %14, %5
  ret void
}

declare void @png_compress_IDAT(ptr noundef, ptr noundef, i64 noundef, i32 noundef) #1

declare void @png_flush(ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_destroy_write_struct(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %20

8:                                                ; preds = %2
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %5, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %19

13:                                               ; preds = %8
  %14 = load ptr, ptr %5, align 8
  %15 = load ptr, ptr %4, align 8
  call void @png_destroy_info_struct(ptr noundef %14, ptr noundef %15)
  %16 = load ptr, ptr %3, align 8
  store ptr null, ptr %16, align 8
  %17 = load ptr, ptr %5, align 8
  call void @png_write_destroy(ptr noundef %17)
  %18 = load ptr, ptr %5, align 8
  call void @png_destroy_png_struct(ptr noundef %18)
  br label %19

19:                                               ; preds = %13, %8
  br label %20

20:                                               ; preds = %19, %2
  ret void
}

declare void @png_destroy_info_struct(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_write_destroy(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.png_struct_def, ptr %3, i32 0, i32 16
  %5 = load i32, ptr %4, align 8
  %6 = and i32 %5, 2
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.png_struct_def, ptr %9, i32 0, i32 19
  %11 = call i32 @deflateEnd(ptr noundef %10)
  br label %12

12:                                               ; preds = %8, %1
  %13 = load ptr, ptr %2, align 8
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds %struct.png_struct_def, ptr %14, i32 0, i32 20
  call void @png_free_buffer_list(ptr noundef %13, ptr noundef %15)
  %16 = load ptr, ptr %2, align 8
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds %struct.png_struct_def, ptr %17, i32 0, i32 47
  %19 = load ptr, ptr %18, align 8
  call void @png_free(ptr noundef %16, ptr noundef %19)
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.png_struct_def, ptr %20, i32 0, i32 47
  store ptr null, ptr %21, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds %struct.png_struct_def, ptr %23, i32 0, i32 46
  %25 = load ptr, ptr %24, align 8
  call void @png_free(ptr noundef %22, ptr noundef %25)
  %26 = load ptr, ptr %2, align 8
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds %struct.png_struct_def, ptr %27, i32 0, i32 48
  %29 = load ptr, ptr %28, align 8
  call void @png_free(ptr noundef %26, ptr noundef %29)
  %30 = load ptr, ptr %2, align 8
  %31 = load ptr, ptr %2, align 8
  %32 = getelementptr inbounds %struct.png_struct_def, ptr %31, i32 0, i32 49
  %33 = load ptr, ptr %32, align 8
  call void @png_free(ptr noundef %30, ptr noundef %33)
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds %struct.png_struct_def, ptr %34, i32 0, i32 46
  store ptr null, ptr %35, align 8
  %36 = load ptr, ptr %2, align 8
  %37 = getelementptr inbounds %struct.png_struct_def, ptr %36, i32 0, i32 48
  store ptr null, ptr %37, align 8
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr inbounds %struct.png_struct_def, ptr %38, i32 0, i32 49
  store ptr null, ptr %39, align 8
  %40 = load ptr, ptr %2, align 8
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds %struct.png_struct_def, ptr %41, i32 0, i32 122
  %43 = load ptr, ptr %42, align 8
  call void @png_free(ptr noundef %40, ptr noundef %43)
  %44 = load ptr, ptr %2, align 8
  %45 = getelementptr inbounds %struct.png_struct_def, ptr %44, i32 0, i32 122
  store ptr null, ptr %45, align 8
  ret void
}

declare void @png_destroy_png_struct(ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_filter(ptr noalias noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %3
  br label %194

12:                                               ; preds = %3
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds %struct.png_struct_def, ptr %13, i32 0, i32 128
  %15 = load i32, ptr %14, align 8
  %16 = and i32 %15, 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %22

18:                                               ; preds = %12
  %19 = load i32, ptr %5, align 4
  %20 = icmp eq i32 %19, 64
  br i1 %20, label %21, label %22

21:                                               ; preds = %18
  store i32 0, ptr %5, align 4
  br label %22

22:                                               ; preds = %21, %18, %12
  %23 = load i32, ptr %5, align 4
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %192

25:                                               ; preds = %22
  %26 = load i32, ptr %6, align 4
  %27 = and i32 %26, 255
  switch i32 %27, label %45 [
    i32 5, label %28
    i32 6, label %28
    i32 7, label %28
    i32 0, label %30
    i32 1, label %33
    i32 2, label %36
    i32 3, label %39
    i32 4, label %42
  ]

28:                                               ; preds = %25, %25, %25
  %29 = load ptr, ptr %4, align 8
  call void @png_app_error(ptr noundef %29, ptr noundef @.str.6)
  br label %30

30:                                               ; preds = %25, %28
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds %struct.png_struct_def, ptr %31, i32 0, i32 61
  store i8 8, ptr %32, align 2
  br label %50

33:                                               ; preds = %25
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds %struct.png_struct_def, ptr %34, i32 0, i32 61
  store i8 16, ptr %35, align 2
  br label %50

36:                                               ; preds = %25
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.png_struct_def, ptr %37, i32 0, i32 61
  store i8 32, ptr %38, align 2
  br label %50

39:                                               ; preds = %25
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.png_struct_def, ptr %40, i32 0, i32 61
  store i8 64, ptr %41, align 2
  br label %50

42:                                               ; preds = %25
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds %struct.png_struct_def, ptr %43, i32 0, i32 61
  store i8 -128, ptr %44, align 2
  br label %50

45:                                               ; preds = %25
  %46 = load i32, ptr %6, align 4
  %47 = trunc i32 %46 to i8
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds %struct.png_struct_def, ptr %48, i32 0, i32 61
  store i8 %47, ptr %49, align 2
  br label %50

50:                                               ; preds = %45, %42, %39, %36, %33, %30
  %51 = load ptr, ptr %4, align 8
  %52 = getelementptr inbounds %struct.png_struct_def, ptr %51, i32 0, i32 47
  %53 = load ptr, ptr %52, align 8
  %54 = icmp ne ptr %53, null
  br i1 %54, label %55, label %187

55:                                               ; preds = %50
  %56 = load ptr, ptr %4, align 8
  %57 = getelementptr inbounds %struct.png_struct_def, ptr %56, i32 0, i32 39
  %58 = load i32, ptr %57, align 8
  %59 = icmp eq i32 %58, 1
  br i1 %59, label %60, label %63

60:                                               ; preds = %55
  %61 = load i32, ptr %6, align 4
  %62 = and i32 %61, -225
  store i32 %62, ptr %6, align 4
  br label %63

63:                                               ; preds = %60, %55
  %64 = load ptr, ptr %4, align 8
  %65 = getelementptr inbounds %struct.png_struct_def, ptr %64, i32 0, i32 38
  %66 = load i32, ptr %65, align 4
  %67 = icmp eq i32 %66, 1
  br i1 %67, label %68, label %71

68:                                               ; preds = %63
  %69 = load i32, ptr %6, align 4
  %70 = and i32 %69, -209
  store i32 %70, ptr %6, align 4
  br label %71

71:                                               ; preds = %68, %63
  %72 = load i32, ptr %6, align 4
  %73 = and i32 %72, 224
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %84

75:                                               ; preds = %71
  %76 = load ptr, ptr %4, align 8
  %77 = getelementptr inbounds %struct.png_struct_def, ptr %76, i32 0, i32 46
  %78 = load ptr, ptr %77, align 8
  %79 = icmp eq ptr %78, null
  br i1 %79, label %80, label %84

80:                                               ; preds = %75
  %81 = load ptr, ptr %4, align 8
  call void @png_app_warning(ptr noundef %81, ptr noundef @.str.7)
  %82 = load i32, ptr %6, align 4
  %83 = and i32 %82, -225
  store i32 %83, ptr %6, align 4
  br label %84

84:                                               ; preds = %80, %75, %71
  store i32 0, ptr %7, align 4
  %85 = load i32, ptr %6, align 4
  %86 = and i32 %85, 16
  %87 = icmp ne i32 %86, 0
  br i1 %87, label %88, label %91

88:                                               ; preds = %84
  %89 = load i32, ptr %7, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, ptr %7, align 4
  br label %91

91:                                               ; preds = %88, %84
  %92 = load i32, ptr %6, align 4
  %93 = and i32 %92, 32
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %98

95:                                               ; preds = %91
  %96 = load i32, ptr %7, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, ptr %7, align 4
  br label %98

98:                                               ; preds = %95, %91
  %99 = load i32, ptr %6, align 4
  %100 = and i32 %99, 64
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %102, label %105

102:                                              ; preds = %98
  %103 = load i32, ptr %7, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, ptr %7, align 4
  br label %105

105:                                              ; preds = %102, %98
  %106 = load i32, ptr %6, align 4
  %107 = and i32 %106, 128
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %112

109:                                              ; preds = %105
  %110 = load i32, ptr %7, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, ptr %7, align 4
  br label %112

112:                                              ; preds = %109, %105
  %113 = load ptr, ptr %4, align 8
  %114 = getelementptr inbounds %struct.png_struct_def, ptr %113, i32 0, i32 67
  %115 = load i8, ptr %114, align 4
  %116 = zext i8 %115 to i32
  %117 = load ptr, ptr %4, align 8
  %118 = getelementptr inbounds %struct.png_struct_def, ptr %117, i32 0, i32 64
  %119 = load i8, ptr %118, align 1
  %120 = zext i8 %119 to i32
  %121 = mul nsw i32 %116, %120
  %122 = icmp sge i32 %121, 8
  br i1 %122, label %123, label %140

123:                                              ; preds = %112
  %124 = load ptr, ptr %4, align 8
  %125 = getelementptr inbounds %struct.png_struct_def, ptr %124, i32 0, i32 38
  %126 = load i32, ptr %125, align 4
  %127 = zext i32 %126 to i64
  %128 = load ptr, ptr %4, align 8
  %129 = getelementptr inbounds %struct.png_struct_def, ptr %128, i32 0, i32 67
  %130 = load i8, ptr %129, align 4
  %131 = zext i8 %130 to i32
  %132 = load ptr, ptr %4, align 8
  %133 = getelementptr inbounds %struct.png_struct_def, ptr %132, i32 0, i32 64
  %134 = load i8, ptr %133, align 1
  %135 = zext i8 %134 to i32
  %136 = mul nsw i32 %131, %135
  %137 = sext i32 %136 to i64
  %138 = lshr i64 %137, 3
  %139 = mul i64 %127, %138
  br label %158

140:                                              ; preds = %112
  %141 = load ptr, ptr %4, align 8
  %142 = getelementptr inbounds %struct.png_struct_def, ptr %141, i32 0, i32 38
  %143 = load i32, ptr %142, align 4
  %144 = zext i32 %143 to i64
  %145 = load ptr, ptr %4, align 8
  %146 = getelementptr inbounds %struct.png_struct_def, ptr %145, i32 0, i32 67
  %147 = load i8, ptr %146, align 4
  %148 = zext i8 %147 to i32
  %149 = load ptr, ptr %4, align 8
  %150 = getelementptr inbounds %struct.png_struct_def, ptr %149, i32 0, i32 64
  %151 = load i8, ptr %150, align 1
  %152 = zext i8 %151 to i32
  %153 = mul nsw i32 %148, %152
  %154 = sext i32 %153 to i64
  %155 = mul i64 %144, %154
  %156 = add i64 %155, 7
  %157 = lshr i64 %156, 3
  br label %158

158:                                              ; preds = %140, %123
  %159 = phi i64 [ %139, %123 ], [ %157, %140 ]
  %160 = add i64 %159, 1
  store i64 %160, ptr %8, align 8
  %161 = load ptr, ptr %4, align 8
  %162 = getelementptr inbounds %struct.png_struct_def, ptr %161, i32 0, i32 48
  %163 = load ptr, ptr %162, align 8
  %164 = icmp eq ptr %163, null
  br i1 %164, label %165, label %171

165:                                              ; preds = %158
  %166 = load ptr, ptr %4, align 8
  %167 = load i64, ptr %8, align 8
  %168 = call noalias ptr @png_malloc(ptr noundef %166, i64 noundef %167)
  %169 = load ptr, ptr %4, align 8
  %170 = getelementptr inbounds %struct.png_struct_def, ptr %169, i32 0, i32 48
  store ptr %168, ptr %170, align 8
  br label %171

171:                                              ; preds = %165, %158
  %172 = load i32, ptr %7, align 4
  %173 = icmp sgt i32 %172, 1
  br i1 %173, label %174, label %186

174:                                              ; preds = %171
  %175 = load ptr, ptr %4, align 8
  %176 = getelementptr inbounds %struct.png_struct_def, ptr %175, i32 0, i32 49
  %177 = load ptr, ptr %176, align 8
  %178 = icmp eq ptr %177, null
  br i1 %178, label %179, label %185

179:                                              ; preds = %174
  %180 = load ptr, ptr %4, align 8
  %181 = load i64, ptr %8, align 8
  %182 = call noalias ptr @png_malloc(ptr noundef %180, i64 noundef %181)
  %183 = load ptr, ptr %4, align 8
  %184 = getelementptr inbounds %struct.png_struct_def, ptr %183, i32 0, i32 49
  store ptr %182, ptr %184, align 8
  br label %185

185:                                              ; preds = %179, %174
  br label %186

186:                                              ; preds = %185, %171
  br label %187

187:                                              ; preds = %186, %50
  %188 = load i32, ptr %6, align 4
  %189 = trunc i32 %188 to i8
  %190 = load ptr, ptr %4, align 8
  %191 = getelementptr inbounds %struct.png_struct_def, ptr %190, i32 0, i32 61
  store i8 %189, ptr %191, align 2
  br label %194

192:                                              ; preds = %22
  %193 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %193, ptr noundef @.str.8) #7
  unreachable

194:                                              ; preds = %11, %187
  ret void
}

declare void @png_app_error(ptr noundef, ptr noundef) #1

declare void @png_app_warning(ptr noundef, ptr noundef) #1

declare noalias ptr @png_malloc(ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_filter_heuristics(ptr noalias noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = load i32, ptr %7, align 4
  %13 = load i32, ptr %8, align 4
  %14 = load ptr, ptr %9, align 8
  %15 = load ptr, ptr %10, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_filter_heuristics_fixed(ptr noalias noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %11 = load ptr, ptr %6, align 8
  %12 = load i32, ptr %7, align 4
  %13 = load i32, ptr %8, align 4
  %14 = load ptr, ptr %9, align 8
  %15 = load ptr, ptr %10, align 8
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_compression_level(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %12

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 22
  store i32 %9, ptr %11, align 4
  br label %12

12:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_compression_mem_level(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %12

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 25
  store i32 %9, ptr %11, align 8
  br label %12

12:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_compression_strategy(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %16

8:                                                ; preds = %2
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.png_struct_def, ptr %9, i32 0, i32 16
  %11 = load i32, ptr %10, align 8
  %12 = or i32 %11, 1
  store i32 %12, ptr %10, align 8
  %13 = load i32, ptr %4, align 4
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.png_struct_def, ptr %14, i32 0, i32 26
  store i32 %13, ptr %15, align 4
  br label %16

16:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_compression_window_bits(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %23

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 15
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = load ptr, ptr %3, align 8
  call void @png_warning(ptr noundef %12, ptr noundef @.str.9)
  store i32 15, ptr %4, align 4
  br label %19

13:                                               ; preds = %8
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %14, 8
  br i1 %15, label %16, label %18

16:                                               ; preds = %13
  %17 = load ptr, ptr %3, align 8
  call void @png_warning(ptr noundef %17, ptr noundef @.str.10)
  store i32 8, ptr %4, align 4
  br label %18

18:                                               ; preds = %16, %13
  br label %19

19:                                               ; preds = %18, %11
  %20 = load i32, ptr %4, align 4
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.png_struct_def, ptr %21, i32 0, i32 24
  store i32 %20, ptr %22, align 4
  br label %23

23:                                               ; preds = %19, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_compression_method(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %17

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = icmp ne i32 %9, 8
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = load ptr, ptr %3, align 8
  call void @png_warning(ptr noundef %12, ptr noundef @.str.11)
  br label %13

13:                                               ; preds = %11, %8
  %14 = load i32, ptr %4, align 4
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.png_struct_def, ptr %15, i32 0, i32 23
  store i32 %14, ptr %16, align 8
  br label %17

17:                                               ; preds = %13, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_text_compression_level(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %12

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 27
  store i32 %9, ptr %11, align 8
  br label %12

12:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_text_compression_mem_level(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %12

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 30
  store i32 %9, ptr %11, align 4
  br label %12

12:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_text_compression_strategy(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %12

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 31
  store i32 %9, ptr %11, align 8
  br label %12

12:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_text_compression_window_bits(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %23

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = icmp sgt i32 %9, 15
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = load ptr, ptr %3, align 8
  call void @png_warning(ptr noundef %12, ptr noundef @.str.9)
  store i32 15, ptr %4, align 4
  br label %19

13:                                               ; preds = %8
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %14, 8
  br i1 %15, label %16, label %18

16:                                               ; preds = %13
  %17 = load ptr, ptr %3, align 8
  call void @png_warning(ptr noundef %17, ptr noundef @.str.10)
  store i32 8, ptr %4, align 4
  br label %18

18:                                               ; preds = %16, %13
  br label %19

19:                                               ; preds = %18, %11
  %20 = load i32, ptr %4, align 4
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds %struct.png_struct_def, ptr %21, i32 0, i32 29
  store i32 %20, ptr %22, align 8
  br label %23

23:                                               ; preds = %19, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_text_compression_method(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %17

8:                                                ; preds = %2
  %9 = load i32, ptr %4, align 4
  %10 = icmp ne i32 %9, 8
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = load ptr, ptr %3, align 8
  call void @png_warning(ptr noundef %12, ptr noundef @.str.11)
  br label %13

13:                                               ; preds = %11, %8
  %14 = load i32, ptr %4, align 4
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds %struct.png_struct_def, ptr %15, i32 0, i32 28
  store i32 %14, ptr %16, align 4
  br label %17

17:                                               ; preds = %13, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_write_status_fn(ptr noalias noundef %0, ptr noundef %1) #0 {
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
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 97
  store ptr %9, ptr %11, align 8
  br label %12

12:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_write_user_transform_fn(ptr noalias noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  br label %16

8:                                                ; preds = %2
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.png_struct_def, ptr %9, i32 0, i32 17
  %11 = load i32, ptr %10, align 4
  %12 = or i32 %11, 1048576
  store i32 %12, ptr %10, align 4
  %13 = load ptr, ptr %4, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.png_struct_def, ptr %14, i32 0, i32 11
  store ptr %13, ptr %15, align 8
  br label %16

16:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_write_png(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %14, label %11

11:                                               ; preds = %4
  %12 = load ptr, ptr %6, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %11, %4
  br label %114

15:                                               ; preds = %11
  %16 = load ptr, ptr %6, align 8
  %17 = getelementptr inbounds %struct.png_info_def, ptr %16, i32 0, i32 2
  %18 = load i32, ptr %17, align 8
  %19 = and i32 %18, 32768
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %23

21:                                               ; preds = %15
  %22 = load ptr, ptr %5, align 8
  call void @png_app_error(ptr noundef %22, ptr noundef @.str.12)
  br label %114

23:                                               ; preds = %15
  %24 = load ptr, ptr %5, align 8
  %25 = load ptr, ptr %6, align 8
  call void @png_write_info(ptr noundef %24, ptr noundef %25)
  %26 = load i32, ptr %7, align 4
  %27 = and i32 %26, 32
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %23
  %30 = load ptr, ptr %5, align 8
  call void @png_set_invert_mono(ptr noundef %30)
  br label %31

31:                                               ; preds = %29, %23
  %32 = load i32, ptr %7, align 4
  %33 = and i32 %32, 64
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %46

35:                                               ; preds = %31
  %36 = load ptr, ptr %6, align 8
  %37 = getelementptr inbounds %struct.png_info_def, ptr %36, i32 0, i32 2
  %38 = load i32, ptr %37, align 8
  %39 = and i32 %38, 2
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %45

41:                                               ; preds = %35
  %42 = load ptr, ptr %5, align 8
  %43 = load ptr, ptr %6, align 8
  %44 = getelementptr inbounds %struct.png_info_def, ptr %43, i32 0, i32 39
  call void @png_set_shift(ptr noundef %42, ptr noundef %44)
  br label %45

45:                                               ; preds = %41, %35
  br label %46

46:                                               ; preds = %45, %31
  %47 = load i32, ptr %7, align 4
  %48 = and i32 %47, 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %52

50:                                               ; preds = %46
  %51 = load ptr, ptr %5, align 8
  call void @png_set_packing(ptr noundef %51)
  br label %52

52:                                               ; preds = %50, %46
  %53 = load i32, ptr %7, align 4
  %54 = and i32 %53, 256
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %58

56:                                               ; preds = %52
  %57 = load ptr, ptr %5, align 8
  call void @png_set_swap_alpha(ptr noundef %57)
  br label %58

58:                                               ; preds = %56, %52
  %59 = load i32, ptr %7, align 4
  %60 = and i32 %59, 6144
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %82

62:                                               ; preds = %58
  %63 = load i32, ptr %7, align 4
  %64 = and i32 %63, 4096
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %74

66:                                               ; preds = %62
  %67 = load i32, ptr %7, align 4
  %68 = and i32 %67, 2048
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %72

70:                                               ; preds = %66
  %71 = load ptr, ptr %5, align 8
  call void @png_app_error(ptr noundef %71, ptr noundef @.str.13)
  br label %72

72:                                               ; preds = %70, %66
  %73 = load ptr, ptr %5, align 8
  call void @png_set_filler(ptr noundef %73, i32 noundef 0, i32 noundef 1)
  br label %81

74:                                               ; preds = %62
  %75 = load i32, ptr %7, align 4
  %76 = and i32 %75, 2048
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %80

78:                                               ; preds = %74
  %79 = load ptr, ptr %5, align 8
  call void @png_set_filler(ptr noundef %79, i32 noundef 0, i32 noundef 0)
  br label %80

80:                                               ; preds = %78, %74
  br label %81

81:                                               ; preds = %80, %72
  br label %82

82:                                               ; preds = %81, %58
  %83 = load i32, ptr %7, align 4
  %84 = and i32 %83, 128
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %86, label %88

86:                                               ; preds = %82
  %87 = load ptr, ptr %5, align 8
  call void @png_set_bgr(ptr noundef %87)
  br label %88

88:                                               ; preds = %86, %82
  %89 = load i32, ptr %7, align 4
  %90 = and i32 %89, 512
  %91 = icmp ne i32 %90, 0
  br i1 %91, label %92, label %94

92:                                               ; preds = %88
  %93 = load ptr, ptr %5, align 8
  call void @png_set_swap(ptr noundef %93)
  br label %94

94:                                               ; preds = %92, %88
  %95 = load i32, ptr %7, align 4
  %96 = and i32 %95, 8
  %97 = icmp ne i32 %96, 0
  br i1 %97, label %98, label %100

98:                                               ; preds = %94
  %99 = load ptr, ptr %5, align 8
  call void @png_set_packswap(ptr noundef %99)
  br label %100

100:                                              ; preds = %98, %94
  %101 = load i32, ptr %7, align 4
  %102 = and i32 %101, 1024
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %106

104:                                              ; preds = %100
  %105 = load ptr, ptr %5, align 8
  call void @png_set_invert_alpha(ptr noundef %105)
  br label %106

106:                                              ; preds = %104, %100
  %107 = load ptr, ptr %5, align 8
  %108 = load ptr, ptr %6, align 8
  %109 = getelementptr inbounds %struct.png_info_def, ptr %108, i32 0, i32 67
  %110 = load ptr, ptr %109, align 8
  call void @png_write_image(ptr noundef %107, ptr noundef %110)
  %111 = load ptr, ptr %5, align 8
  %112 = load ptr, ptr %6, align 8
  call void @png_write_end(ptr noundef %111, ptr noundef %112)
  %113 = load ptr, ptr %8, align 8
  br label %114

114:                                              ; preds = %106, %21, %14
  ret void
}

declare void @png_set_invert_mono(ptr noundef) #1

declare void @png_set_shift(ptr noundef, ptr noundef) #1

declare void @png_set_packing(ptr noundef) #1

declare void @png_set_swap_alpha(ptr noundef) #1

declare void @png_set_filler(ptr noundef, i32 noundef, i32 noundef) #1

declare void @png_set_bgr(ptr noundef) #1

declare void @png_set_swap(ptr noundef) #1

declare void @png_set_packswap(ptr noundef) #1

declare void @png_set_invert_alpha(ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_image_write_to_memory(ptr noundef %0, ptr noundef %1, ptr noalias noundef %2, i32 noundef %3, ptr noundef %4, i32 noundef %5, ptr noundef %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca %struct.png_image_write_control, align 8
  %17 = alloca i32, align 4
  store ptr %0, ptr %9, align 8
  store ptr %1, ptr %10, align 8
  store ptr %2, ptr %11, align 8
  store i32 %3, ptr %12, align 4
  store ptr %4, ptr %13, align 8
  store i32 %5, ptr %14, align 4
  store ptr %6, ptr %15, align 8
  %18 = load ptr, ptr %9, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %82

20:                                               ; preds = %7
  %21 = load ptr, ptr %9, align 8
  %22 = getelementptr inbounds %struct.png_image, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 8
  %24 = icmp eq i32 %23, 1
  br i1 %24, label %25, label %82

25:                                               ; preds = %20
  %26 = load ptr, ptr %11, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %79

28:                                               ; preds = %25
  %29 = load ptr, ptr %13, align 8
  %30 = icmp ne ptr %29, null
  br i1 %30, label %31, label %79

31:                                               ; preds = %28
  %32 = load ptr, ptr %10, align 8
  %33 = icmp eq ptr %32, null
  br i1 %33, label %34, label %36

34:                                               ; preds = %31
  %35 = load ptr, ptr %11, align 8
  store i64 0, ptr %35, align 8
  br label %36

36:                                               ; preds = %34, %31
  %37 = load ptr, ptr %9, align 8
  %38 = call i32 @png_image_write_init(ptr noundef %37)
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %78

40:                                               ; preds = %36
  call void @llvm.memset.p0.i64(ptr align 8 %16, i8 0, i64 88, i1 false)
  %41 = load ptr, ptr %9, align 8
  %42 = getelementptr inbounds %struct.png_image_write_control, ptr %16, i32 0, i32 0
  store ptr %41, ptr %42, align 8
  %43 = load ptr, ptr %13, align 8
  %44 = getelementptr inbounds %struct.png_image_write_control, ptr %16, i32 0, i32 1
  store ptr %43, ptr %44, align 8
  %45 = load i32, ptr %14, align 4
  %46 = getelementptr inbounds %struct.png_image_write_control, ptr %16, i32 0, i32 2
  store i32 %45, ptr %46, align 8
  %47 = load ptr, ptr %15, align 8
  %48 = getelementptr inbounds %struct.png_image_write_control, ptr %16, i32 0, i32 3
  store ptr %47, ptr %48, align 8
  %49 = load i32, ptr %12, align 4
  %50 = getelementptr inbounds %struct.png_image_write_control, ptr %16, i32 0, i32 4
  store i32 %49, ptr %50, align 8
  %51 = load ptr, ptr %10, align 8
  %52 = getelementptr inbounds %struct.png_image_write_control, ptr %16, i32 0, i32 8
  store ptr %51, ptr %52, align 8
  %53 = load ptr, ptr %11, align 8
  %54 = load i64, ptr %53, align 8
  %55 = getelementptr inbounds %struct.png_image_write_control, ptr %16, i32 0, i32 9
  store i64 %54, ptr %55, align 8
  %56 = getelementptr inbounds %struct.png_image_write_control, ptr %16, i32 0, i32 10
  store i64 0, ptr %56, align 8
  %57 = load ptr, ptr %9, align 8
  %58 = call i32 @png_safe_execute(ptr noundef %57, ptr noundef @png_image_write_memory, ptr noundef %16)
  store i32 %58, ptr %17, align 4
  %59 = load ptr, ptr %9, align 8
  call void @png_image_free(ptr noundef %59)
  %60 = load i32, ptr %17, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %76

62:                                               ; preds = %40
  %63 = load ptr, ptr %10, align 8
  %64 = icmp ne ptr %63, null
  br i1 %64, label %65, label %72

65:                                               ; preds = %62
  %66 = getelementptr inbounds %struct.png_image_write_control, ptr %16, i32 0, i32 10
  %67 = load i64, ptr %66, align 8
  %68 = load ptr, ptr %11, align 8
  %69 = load i64, ptr %68, align 8
  %70 = icmp ugt i64 %67, %69
  br i1 %70, label %71, label %72

71:                                               ; preds = %65
  store i32 0, ptr %17, align 4
  br label %72

72:                                               ; preds = %71, %65, %62
  %73 = getelementptr inbounds %struct.png_image_write_control, ptr %16, i32 0, i32 10
  %74 = load i64, ptr %73, align 8
  %75 = load ptr, ptr %11, align 8
  store i64 %74, ptr %75, align 8
  br label %76

76:                                               ; preds = %72, %40
  %77 = load i32, ptr %17, align 4
  store i32 %77, ptr %8, align 4
  br label %89

78:                                               ; preds = %36
  store i32 0, ptr %8, align 4
  br label %89

79:                                               ; preds = %28, %25
  %80 = load ptr, ptr %9, align 8
  %81 = call i32 @png_image_error(ptr noundef %80, ptr noundef @.str.14)
  store i32 %81, ptr %8, align 4
  br label %89

82:                                               ; preds = %20, %7
  %83 = load ptr, ptr %9, align 8
  %84 = icmp ne ptr %83, null
  br i1 %84, label %85, label %88

85:                                               ; preds = %82
  %86 = load ptr, ptr %9, align 8
  %87 = call i32 @png_image_error(ptr noundef %86, ptr noundef @.str.15)
  store i32 %87, ptr %8, align 4
  br label %89

88:                                               ; preds = %82
  store i32 0, ptr %8, align 4
  br label %89

89:                                               ; preds = %88, %85, %79, %78, %76
  %90 = load i32, ptr %8, align 4
  ret i32 %90
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_write_init(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = call noalias ptr @png_create_write_struct(ptr noundef @.str.22, ptr noundef %7, ptr noundef @png_safe_error, ptr noundef @png_safe_warning)
  store ptr %8, ptr %4, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %40

11:                                               ; preds = %1
  %12 = load ptr, ptr %4, align 8
  %13 = call noalias ptr @png_create_info_struct(ptr noundef %12)
  store ptr %13, ptr %5, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %39

16:                                               ; preds = %11
  %17 = load ptr, ptr %4, align 8
  %18 = call noalias ptr @png_malloc_warn(ptr noundef %17, i64 noundef 48)
  store ptr %18, ptr %6, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %37

21:                                               ; preds = %16
  %22 = load ptr, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %22, i8 0, i64 48, i1 false)
  %23 = load ptr, ptr %4, align 8
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds %struct.png_control, ptr %24, i32 0, i32 0
  store ptr %23, ptr %25, align 8
  %26 = load ptr, ptr %5, align 8
  %27 = load ptr, ptr %6, align 8
  %28 = getelementptr inbounds %struct.png_control, ptr %27, i32 0, i32 1
  store ptr %26, ptr %28, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr inbounds %struct.png_control, ptr %29, i32 0, i32 5
  %31 = load i8, ptr %30, align 8
  %32 = and i8 %31, -2
  %33 = or i8 %32, 1
  store i8 %33, ptr %30, align 8
  %34 = load ptr, ptr %6, align 8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds %struct.png_image, ptr %35, i32 0, i32 0
  store ptr %34, ptr %36, align 8
  store i32 1, ptr %2, align 4
  br label %43

37:                                               ; preds = %16
  %38 = load ptr, ptr %4, align 8
  call void @png_destroy_info_struct(ptr noundef %38, ptr noundef %5)
  br label %39

39:                                               ; preds = %37, %11
  call void @png_destroy_write_struct(ptr noundef %4, ptr noundef null)
  br label %40

40:                                               ; preds = %39, %1
  %41 = load ptr, ptr %3, align 8
  %42 = call i32 @png_image_error(ptr noundef %41, ptr noundef @.str.23)
  store i32 %42, ptr %2, align 4
  br label %43

43:                                               ; preds = %40, %21
  %44 = load i32, ptr %2, align 4
  ret i32 %44
}

declare i32 @png_safe_execute(ptr noundef, ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_write_memory(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.png_image_write_control, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr inbounds %struct.png_image, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = getelementptr inbounds %struct.png_control, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = load ptr, ptr %3, align 8
  call void @png_set_write_fn(ptr noundef %11, ptr noundef %12, ptr noundef @image_memory_write, ptr noundef @image_memory_flush)
  %13 = load ptr, ptr %3, align 8
  %14 = call i32 @png_image_write_main(ptr noundef %13)
  ret i32 %14
}

declare void @png_image_free(ptr noundef) #1

declare i32 @png_image_error(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_image_write_to_stdio(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3, i32 noundef %4, ptr noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca %struct.png_image_write_control, align 8
  %15 = alloca i32, align 4
  store ptr %0, ptr %8, align 8
  store ptr %1, ptr %9, align 8
  store i32 %2, ptr %10, align 4
  store ptr %3, ptr %11, align 8
  store i32 %4, ptr %12, align 4
  store ptr %5, ptr %13, align 8
  %16 = load ptr, ptr %8, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %59

18:                                               ; preds = %6
  %19 = load ptr, ptr %8, align 8
  %20 = getelementptr inbounds %struct.png_image, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 8
  %22 = icmp eq i32 %21, 1
  br i1 %22, label %23, label %59

23:                                               ; preds = %18
  %24 = load ptr, ptr %9, align 8
  %25 = icmp ne ptr %24, null
  br i1 %25, label %26, label %56

26:                                               ; preds = %23
  %27 = load ptr, ptr %11, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %29, label %56

29:                                               ; preds = %26
  %30 = load ptr, ptr %8, align 8
  %31 = call i32 @png_image_write_init(ptr noundef %30)
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %55

33:                                               ; preds = %29
  %34 = load ptr, ptr %9, align 8
  %35 = load ptr, ptr %8, align 8
  %36 = getelementptr inbounds %struct.png_image, ptr %35, i32 0, i32 0
  %37 = load ptr, ptr %36, align 8
  %38 = getelementptr inbounds %struct.png_control, ptr %37, i32 0, i32 0
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds %struct.png_struct_def, ptr %39, i32 0, i32 9
  store ptr %34, ptr %40, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %14, i8 0, i64 88, i1 false)
  %41 = load ptr, ptr %8, align 8
  %42 = getelementptr inbounds %struct.png_image_write_control, ptr %14, i32 0, i32 0
  store ptr %41, ptr %42, align 8
  %43 = load ptr, ptr %11, align 8
  %44 = getelementptr inbounds %struct.png_image_write_control, ptr %14, i32 0, i32 1
  store ptr %43, ptr %44, align 8
  %45 = load i32, ptr %12, align 4
  %46 = getelementptr inbounds %struct.png_image_write_control, ptr %14, i32 0, i32 2
  store i32 %45, ptr %46, align 8
  %47 = load ptr, ptr %13, align 8
  %48 = getelementptr inbounds %struct.png_image_write_control, ptr %14, i32 0, i32 3
  store ptr %47, ptr %48, align 8
  %49 = load i32, ptr %10, align 4
  %50 = getelementptr inbounds %struct.png_image_write_control, ptr %14, i32 0, i32 4
  store i32 %49, ptr %50, align 8
  %51 = load ptr, ptr %8, align 8
  %52 = call i32 @png_safe_execute(ptr noundef %51, ptr noundef @png_image_write_main, ptr noundef %14)
  store i32 %52, ptr %15, align 4
  %53 = load ptr, ptr %8, align 8
  call void @png_image_free(ptr noundef %53)
  %54 = load i32, ptr %15, align 4
  store i32 %54, ptr %7, align 4
  br label %66

55:                                               ; preds = %29
  store i32 0, ptr %7, align 4
  br label %66

56:                                               ; preds = %26, %23
  %57 = load ptr, ptr %8, align 8
  %58 = call i32 @png_image_error(ptr noundef %57, ptr noundef @.str.16)
  store i32 %58, ptr %7, align 4
  br label %66

59:                                               ; preds = %18, %6
  %60 = load ptr, ptr %8, align 8
  %61 = icmp ne ptr %60, null
  br i1 %61, label %62, label %65

62:                                               ; preds = %59
  %63 = load ptr, ptr %8, align 8
  %64 = call i32 @png_image_error(ptr noundef %63, ptr noundef @.str.17)
  store i32 %64, ptr %7, align 4
  br label %66

65:                                               ; preds = %59
  store i32 0, ptr %7, align 4
  br label %66

66:                                               ; preds = %65, %62, %56, %55, %33
  %67 = load i32, ptr %7, align 4
  ret i32 %67
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_write_main(ptr noundef %0) #0 {
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
  %17 = alloca i16, align 2
  %18 = alloca ptr, align 8
  %19 = alloca i64, align 8
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca i64, align 8
  %24 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %25 = load ptr, ptr %3, align 8
  store ptr %25, ptr %4, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.png_image_write_control, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %5, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds %struct.png_image, ptr %29, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds %struct.png_control, ptr %31, i32 0, i32 0
  %33 = load ptr, ptr %32, align 8
  store ptr %33, ptr %6, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds %struct.png_image, ptr %34, i32 0, i32 0
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds %struct.png_control, ptr %36, i32 0, i32 1
  %38 = load ptr, ptr %37, align 8
  store ptr %38, ptr %7, align 8
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds %struct.png_image, ptr %39, i32 0, i32 4
  %41 = load i32, ptr %40, align 4
  store i32 %41, ptr %8, align 4
  %42 = load i32, ptr %8, align 4
  %43 = and i32 %42, 8
  store i32 %43, ptr %9, align 4
  %44 = load i32, ptr %9, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %50, label %46

46:                                               ; preds = %1
  %47 = load i32, ptr %8, align 4
  %48 = and i32 %47, 4
  %49 = icmp ne i32 %48, 0
  br label %50

50:                                               ; preds = %46, %1
  %51 = phi i1 [ false, %1 ], [ %49, %46 ]
  %52 = zext i1 %51 to i32
  store i32 %52, ptr %10, align 4
  %53 = load i32, ptr %9, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %59, label %55

55:                                               ; preds = %50
  %56 = load i32, ptr %8, align 4
  %57 = and i32 %56, 1
  %58 = icmp ne i32 %57, 0
  br label %59

59:                                               ; preds = %55, %50
  %60 = phi i1 [ false, %50 ], [ %58, %55 ]
  %61 = zext i1 %60 to i32
  store i32 %61, ptr %11, align 4
  %62 = load i32, ptr %10, align 4
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %69

64:                                               ; preds = %59
  %65 = load ptr, ptr %4, align 8
  %66 = getelementptr inbounds %struct.png_image_write_control, ptr %65, i32 0, i32 4
  %67 = load i32, ptr %66, align 8
  %68 = icmp eq i32 %67, 0
  br label %69

69:                                               ; preds = %64, %59
  %70 = phi i1 [ false, %59 ], [ %68, %64 ]
  %71 = zext i1 %70 to i32
  store i32 %71, ptr %12, align 4
  %72 = load ptr, ptr %6, align 8
  call void @png_set_benign_errors(ptr noundef %72, i32 noundef 0)
  %73 = load ptr, ptr %5, align 8
  %74 = getelementptr inbounds %struct.png_image, ptr %73, i32 0, i32 4
  %75 = load i32, ptr %74, align 4
  %76 = and i32 %75, 8
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %79

78:                                               ; preds = %69
  br label %85

79:                                               ; preds = %69
  %80 = load ptr, ptr %5, align 8
  %81 = getelementptr inbounds %struct.png_image, ptr %80, i32 0, i32 4
  %82 = load i32, ptr %81, align 4
  %83 = and i32 %82, 3
  %84 = add i32 %83, 1
  br label %85

85:                                               ; preds = %79, %78
  %86 = phi i32 [ 1, %78 ], [ %84, %79 ]
  store i32 %86, ptr %13, align 4
  %87 = load ptr, ptr %5, align 8
  %88 = getelementptr inbounds %struct.png_image, ptr %87, i32 0, i32 2
  %89 = load i32, ptr %88, align 4
  %90 = load i32, ptr %13, align 4
  %91 = udiv i32 2147483647, %90
  %92 = icmp ule i32 %89, %91
  br i1 %92, label %93, label %146

93:                                               ; preds = %85
  %94 = load ptr, ptr %5, align 8
  %95 = getelementptr inbounds %struct.png_image, ptr %94, i32 0, i32 2
  %96 = load i32, ptr %95, align 4
  %97 = load i32, ptr %13, align 4
  %98 = mul i32 %96, %97
  store i32 %98, ptr %15, align 4
  %99 = load ptr, ptr %4, align 8
  %100 = getelementptr inbounds %struct.png_image_write_control, ptr %99, i32 0, i32 2
  %101 = load i32, ptr %100, align 8
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %103, label %107

103:                                              ; preds = %93
  %104 = load i32, ptr %15, align 4
  %105 = load ptr, ptr %4, align 8
  %106 = getelementptr inbounds %struct.png_image_write_control, ptr %105, i32 0, i32 2
  store i32 %104, ptr %106, align 8
  br label %107

107:                                              ; preds = %103, %93
  %108 = load ptr, ptr %4, align 8
  %109 = getelementptr inbounds %struct.png_image_write_control, ptr %108, i32 0, i32 2
  %110 = load i32, ptr %109, align 8
  %111 = icmp slt i32 %110, 0
  br i1 %111, label %112, label %117

112:                                              ; preds = %107
  %113 = load ptr, ptr %4, align 8
  %114 = getelementptr inbounds %struct.png_image_write_control, ptr %113, i32 0, i32 2
  %115 = load i32, ptr %114, align 8
  %116 = sub nsw i32 0, %115
  store i32 %116, ptr %14, align 4
  br label %121

117:                                              ; preds = %107
  %118 = load ptr, ptr %4, align 8
  %119 = getelementptr inbounds %struct.png_image_write_control, ptr %118, i32 0, i32 2
  %120 = load i32, ptr %119, align 8
  store i32 %120, ptr %14, align 4
  br label %121

121:                                              ; preds = %117, %112
  %122 = load i32, ptr %14, align 4
  %123 = load i32, ptr %15, align 4
  %124 = icmp uge i32 %122, %123
  br i1 %124, label %125, label %139

125:                                              ; preds = %121
  %126 = load ptr, ptr %5, align 8
  %127 = getelementptr inbounds %struct.png_image, ptr %126, i32 0, i32 3
  %128 = load i32, ptr %127, align 8
  %129 = load i32, ptr %15, align 4
  %130 = udiv i32 -1, %129
  %131 = icmp ugt i32 %128, %130
  br i1 %131, label %132, label %138

132:                                              ; preds = %125
  %133 = load ptr, ptr %5, align 8
  %134 = getelementptr inbounds %struct.png_image, ptr %133, i32 0, i32 0
  %135 = load ptr, ptr %134, align 8
  %136 = getelementptr inbounds %struct.png_control, ptr %135, i32 0, i32 0
  %137 = load ptr, ptr %136, align 8
  call void @png_error(ptr noundef %137, ptr noundef @.str.25) #7
  unreachable

138:                                              ; preds = %125
  br label %145

139:                                              ; preds = %121
  %140 = load ptr, ptr %5, align 8
  %141 = getelementptr inbounds %struct.png_image, ptr %140, i32 0, i32 0
  %142 = load ptr, ptr %141, align 8
  %143 = getelementptr inbounds %struct.png_control, ptr %142, i32 0, i32 0
  %144 = load ptr, ptr %143, align 8
  call void @png_error(ptr noundef %144, ptr noundef @.str.26) #7
  unreachable

145:                                              ; preds = %138
  br label %152

146:                                              ; preds = %85
  %147 = load ptr, ptr %5, align 8
  %148 = getelementptr inbounds %struct.png_image, ptr %147, i32 0, i32 0
  %149 = load ptr, ptr %148, align 8
  %150 = getelementptr inbounds %struct.png_control, ptr %149, i32 0, i32 0
  %151 = load ptr, ptr %150, align 8
  call void @png_error(ptr noundef %151, ptr noundef @.str.27) #7
  unreachable

152:                                              ; preds = %145
  %153 = load i32, ptr %8, align 4
  %154 = and i32 %153, 8
  %155 = icmp ne i32 %154, 0
  br i1 %155, label %156, label %202

156:                                              ; preds = %152
  %157 = load ptr, ptr %4, align 8
  %158 = getelementptr inbounds %struct.png_image_write_control, ptr %157, i32 0, i32 3
  %159 = load ptr, ptr %158, align 8
  %160 = icmp ne ptr %159, null
  br i1 %160, label %161, label %195

161:                                              ; preds = %156
  %162 = load ptr, ptr %5, align 8
  %163 = getelementptr inbounds %struct.png_image, ptr %162, i32 0, i32 6
  %164 = load i32, ptr %163, align 4
  %165 = icmp ugt i32 %164, 0
  br i1 %165, label %166, label %195

166:                                              ; preds = %161
  %167 = load ptr, ptr %5, align 8
  %168 = getelementptr inbounds %struct.png_image, ptr %167, i32 0, i32 6
  %169 = load i32, ptr %168, align 4
  store i32 %169, ptr %16, align 4
  %170 = load ptr, ptr %6, align 8
  %171 = load ptr, ptr %7, align 8
  %172 = load ptr, ptr %5, align 8
  %173 = getelementptr inbounds %struct.png_image, ptr %172, i32 0, i32 2
  %174 = load i32, ptr %173, align 4
  %175 = load ptr, ptr %5, align 8
  %176 = getelementptr inbounds %struct.png_image, ptr %175, i32 0, i32 3
  %177 = load i32, ptr %176, align 8
  %178 = load i32, ptr %16, align 4
  %179 = icmp ugt i32 %178, 16
  br i1 %179, label %180, label %181

180:                                              ; preds = %166
  br label %192

181:                                              ; preds = %166
  %182 = load i32, ptr %16, align 4
  %183 = icmp ugt i32 %182, 4
  br i1 %183, label %184, label %185

184:                                              ; preds = %181
  br label %190

185:                                              ; preds = %181
  %186 = load i32, ptr %16, align 4
  %187 = icmp ugt i32 %186, 2
  %188 = zext i1 %187 to i64
  %189 = select i1 %187, i32 2, i32 1
  br label %190

190:                                              ; preds = %185, %184
  %191 = phi i32 [ 4, %184 ], [ %189, %185 ]
  br label %192

192:                                              ; preds = %190, %180
  %193 = phi i32 [ 8, %180 ], [ %191, %190 ]
  call void @png_set_IHDR(ptr noundef %170, ptr noundef %171, i32 noundef %174, i32 noundef %177, i32 noundef %193, i32 noundef 3, i32 noundef 0, i32 noundef 0, i32 noundef 0)
  %194 = load ptr, ptr %4, align 8
  call void @png_image_set_PLTE(ptr noundef %194)
  br label %201

195:                                              ; preds = %161, %156
  %196 = load ptr, ptr %5, align 8
  %197 = getelementptr inbounds %struct.png_image, ptr %196, i32 0, i32 0
  %198 = load ptr, ptr %197, align 8
  %199 = getelementptr inbounds %struct.png_control, ptr %198, i32 0, i32 0
  %200 = load ptr, ptr %199, align 8
  call void @png_error(ptr noundef %200, ptr noundef @.str.28) #7
  unreachable

201:                                              ; preds = %192
  br label %226

202:                                              ; preds = %152
  %203 = load ptr, ptr %6, align 8
  %204 = load ptr, ptr %7, align 8
  %205 = load ptr, ptr %5, align 8
  %206 = getelementptr inbounds %struct.png_image, ptr %205, i32 0, i32 2
  %207 = load i32, ptr %206, align 4
  %208 = load ptr, ptr %5, align 8
  %209 = getelementptr inbounds %struct.png_image, ptr %208, i32 0, i32 3
  %210 = load i32, ptr %209, align 8
  %211 = load i32, ptr %12, align 4
  %212 = icmp ne i32 %211, 0
  %213 = zext i1 %212 to i64
  %214 = select i1 %212, i32 16, i32 8
  %215 = load i32, ptr %8, align 4
  %216 = and i32 %215, 2
  %217 = icmp ne i32 %216, 0
  %218 = zext i1 %217 to i64
  %219 = select i1 %217, i32 2, i32 0
  %220 = load i32, ptr %8, align 4
  %221 = and i32 %220, 1
  %222 = icmp ne i32 %221, 0
  %223 = zext i1 %222 to i64
  %224 = select i1 %222, i32 4, i32 0
  %225 = add nsw i32 %219, %224
  call void @png_set_IHDR(ptr noundef %203, ptr noundef %204, i32 noundef %207, i32 noundef %210, i32 noundef %214, i32 noundef %225, i32 noundef 0, i32 noundef 0, i32 noundef 0)
  br label %226

226:                                              ; preds = %202, %201
  %227 = load i32, ptr %12, align 4
  %228 = icmp ne i32 %227, 0
  br i1 %228, label %229, label %241

229:                                              ; preds = %226
  %230 = load ptr, ptr %6, align 8
  %231 = load ptr, ptr %7, align 8
  call void @png_set_gAMA_fixed(ptr noundef %230, ptr noundef %231, i32 noundef 100000)
  %232 = load ptr, ptr %5, align 8
  %233 = getelementptr inbounds %struct.png_image, ptr %232, i32 0, i32 5
  %234 = load i32, ptr %233, align 8
  %235 = and i32 %234, 1
  %236 = icmp eq i32 %235, 0
  br i1 %236, label %237, label %240

237:                                              ; preds = %229
  %238 = load ptr, ptr %6, align 8
  %239 = load ptr, ptr %7, align 8
  call void @png_set_cHRM_fixed(ptr noundef %238, ptr noundef %239, i32 noundef 31270, i32 noundef 32900, i32 noundef 64000, i32 noundef 33000, i32 noundef 30000, i32 noundef 60000, i32 noundef 15000, i32 noundef 6000)
  br label %240

240:                                              ; preds = %237, %229
  br label %254

241:                                              ; preds = %226
  %242 = load ptr, ptr %5, align 8
  %243 = getelementptr inbounds %struct.png_image, ptr %242, i32 0, i32 5
  %244 = load i32, ptr %243, align 8
  %245 = and i32 %244, 1
  %246 = icmp eq i32 %245, 0
  br i1 %246, label %247, label %250

247:                                              ; preds = %241
  %248 = load ptr, ptr %6, align 8
  %249 = load ptr, ptr %7, align 8
  call void @png_set_sRGB(ptr noundef %248, ptr noundef %249, i32 noundef 0)
  br label %253

250:                                              ; preds = %241
  %251 = load ptr, ptr %6, align 8
  %252 = load ptr, ptr %7, align 8
  call void @png_set_gAMA_fixed(ptr noundef %251, ptr noundef %252, i32 noundef 45455)
  br label %253

253:                                              ; preds = %250, %247
  br label %254

254:                                              ; preds = %253, %240
  %255 = load ptr, ptr %6, align 8
  %256 = load ptr, ptr %7, align 8
  call void @png_write_info(ptr noundef %255, ptr noundef %256)
  %257 = load i32, ptr %12, align 4
  %258 = icmp ne i32 %257, 0
  br i1 %258, label %259, label %266

259:                                              ; preds = %254
  store i16 1, ptr %17, align 2
  %260 = load i8, ptr %17, align 2
  %261 = zext i8 %260 to i32
  %262 = icmp ne i32 %261, 0
  br i1 %262, label %263, label %265

263:                                              ; preds = %259
  %264 = load ptr, ptr %6, align 8
  call void @png_set_swap(ptr noundef %264)
  br label %265

265:                                              ; preds = %263, %259
  br label %266

266:                                              ; preds = %265, %254
  %267 = load i32, ptr %8, align 4
  %268 = and i32 %267, 16
  %269 = icmp ne i32 %268, 0
  br i1 %269, label %270, label %282

270:                                              ; preds = %266
  %271 = load i32, ptr %9, align 4
  %272 = icmp eq i32 %271, 0
  br i1 %272, label %273, label %279

273:                                              ; preds = %270
  %274 = load i32, ptr %8, align 4
  %275 = and i32 %274, 2
  %276 = icmp ne i32 %275, 0
  br i1 %276, label %277, label %279

277:                                              ; preds = %273
  %278 = load ptr, ptr %6, align 8
  call void @png_set_bgr(ptr noundef %278)
  br label %279

279:                                              ; preds = %277, %273, %270
  %280 = load i32, ptr %8, align 4
  %281 = and i32 %280, -17
  store i32 %281, ptr %8, align 4
  br label %282

282:                                              ; preds = %279, %266
  %283 = load i32, ptr %8, align 4
  %284 = and i32 %283, 32
  %285 = icmp ne i32 %284, 0
  br i1 %285, label %286, label %298

286:                                              ; preds = %282
  %287 = load i32, ptr %9, align 4
  %288 = icmp eq i32 %287, 0
  br i1 %288, label %289, label %295

289:                                              ; preds = %286
  %290 = load i32, ptr %8, align 4
  %291 = and i32 %290, 1
  %292 = icmp ne i32 %291, 0
  br i1 %292, label %293, label %295

293:                                              ; preds = %289
  %294 = load ptr, ptr %6, align 8
  call void @png_set_swap_alpha(ptr noundef %294)
  br label %295

295:                                              ; preds = %293, %289, %286
  %296 = load i32, ptr %8, align 4
  %297 = and i32 %296, -33
  store i32 %297, ptr %8, align 4
  br label %298

298:                                              ; preds = %295, %282
  %299 = load i32, ptr %9, align 4
  %300 = icmp ne i32 %299, 0
  br i1 %300, label %301, label %308

301:                                              ; preds = %298
  %302 = load ptr, ptr %5, align 8
  %303 = getelementptr inbounds %struct.png_image, ptr %302, i32 0, i32 6
  %304 = load i32, ptr %303, align 4
  %305 = icmp ule i32 %304, 16
  br i1 %305, label %306, label %308

306:                                              ; preds = %301
  %307 = load ptr, ptr %6, align 8
  call void @png_set_packing(ptr noundef %307)
  br label %308

308:                                              ; preds = %306, %301, %298
  %309 = load i32, ptr %8, align 4
  %310 = and i32 %309, -16
  %311 = icmp ne i32 %310, 0
  br i1 %311, label %312, label %314

312:                                              ; preds = %308
  %313 = load ptr, ptr %6, align 8
  call void @png_error(ptr noundef %313, ptr noundef @.str.29) #7
  unreachable

314:                                              ; preds = %308
  %315 = load ptr, ptr %4, align 8
  %316 = getelementptr inbounds %struct.png_image_write_control, ptr %315, i32 0, i32 1
  %317 = load ptr, ptr %316, align 8
  store ptr %317, ptr %18, align 8
  %318 = load ptr, ptr %4, align 8
  %319 = getelementptr inbounds %struct.png_image_write_control, ptr %318, i32 0, i32 2
  %320 = load i32, ptr %319, align 8
  %321 = sext i32 %320 to i64
  store i64 %321, ptr %19, align 8
  %322 = load i32, ptr %10, align 4
  %323 = icmp ne i32 %322, 0
  br i1 %323, label %324, label %327

324:                                              ; preds = %314
  %325 = load i64, ptr %19, align 8
  %326 = mul i64 %325, 2
  store i64 %326, ptr %19, align 8
  br label %327

327:                                              ; preds = %324, %314
  %328 = load i64, ptr %19, align 8
  %329 = icmp slt i64 %328, 0
  br i1 %329, label %330, label %341

330:                                              ; preds = %327
  %331 = load ptr, ptr %5, align 8
  %332 = getelementptr inbounds %struct.png_image, ptr %331, i32 0, i32 3
  %333 = load i32, ptr %332, align 8
  %334 = sub i32 %333, 1
  %335 = zext i32 %334 to i64
  %336 = load i64, ptr %19, align 8
  %337 = sub nsw i64 0, %336
  %338 = mul nsw i64 %335, %337
  %339 = load ptr, ptr %18, align 8
  %340 = getelementptr inbounds i8, ptr %339, i64 %338
  store ptr %340, ptr %18, align 8
  br label %341

341:                                              ; preds = %330, %327
  %342 = load ptr, ptr %18, align 8
  %343 = load ptr, ptr %4, align 8
  %344 = getelementptr inbounds %struct.png_image_write_control, ptr %343, i32 0, i32 5
  store ptr %342, ptr %344, align 8
  %345 = load i64, ptr %19, align 8
  %346 = load ptr, ptr %4, align 8
  %347 = getelementptr inbounds %struct.png_image_write_control, ptr %346, i32 0, i32 6
  store i64 %345, ptr %347, align 8
  %348 = load ptr, ptr %5, align 8
  %349 = getelementptr inbounds %struct.png_image, ptr %348, i32 0, i32 5
  %350 = load i32, ptr %349, align 8
  %351 = and i32 %350, 2
  %352 = icmp ne i32 %351, 0
  br i1 %352, label %353, label %356

353:                                              ; preds = %341
  %354 = load ptr, ptr %6, align 8
  call void @png_set_filter(ptr noundef %354, i32 noundef 0, i32 noundef 0)
  %355 = load ptr, ptr %6, align 8
  call void @png_set_compression_level(ptr noundef %355, i32 noundef 3)
  br label %356

356:                                              ; preds = %353, %341
  %357 = load i32, ptr %10, align 4
  %358 = icmp ne i32 %357, 0
  br i1 %358, label %359, label %362

359:                                              ; preds = %356
  %360 = load i32, ptr %11, align 4
  %361 = icmp ne i32 %360, 0
  br i1 %361, label %370, label %362

362:                                              ; preds = %359, %356
  %363 = load i32, ptr %9, align 4
  %364 = icmp eq i32 %363, 0
  br i1 %364, label %365, label %398

365:                                              ; preds = %362
  %366 = load ptr, ptr %4, align 8
  %367 = getelementptr inbounds %struct.png_image_write_control, ptr %366, i32 0, i32 4
  %368 = load i32, ptr %367, align 8
  %369 = icmp ne i32 %368, 0
  br i1 %369, label %370, label %398

370:                                              ; preds = %365, %359
  %371 = load ptr, ptr %6, align 8
  %372 = load ptr, ptr %6, align 8
  %373 = load ptr, ptr %7, align 8
  %374 = call i64 @png_get_rowbytes(ptr noundef %372, ptr noundef %373)
  %375 = call noalias ptr @png_malloc(ptr noundef %371, i64 noundef %374)
  store ptr %375, ptr %20, align 8
  %376 = load ptr, ptr %20, align 8
  %377 = load ptr, ptr %4, align 8
  %378 = getelementptr inbounds %struct.png_image_write_control, ptr %377, i32 0, i32 7
  store ptr %376, ptr %378, align 8
  %379 = load i32, ptr %12, align 4
  %380 = icmp ne i32 %379, 0
  br i1 %380, label %381, label %385

381:                                              ; preds = %370
  %382 = load ptr, ptr %5, align 8
  %383 = load ptr, ptr %4, align 8
  %384 = call i32 @png_safe_execute(ptr noundef %382, ptr noundef @png_write_image_16bit, ptr noundef %383)
  store i32 %384, ptr %21, align 4
  br label %389

385:                                              ; preds = %370
  %386 = load ptr, ptr %5, align 8
  %387 = load ptr, ptr %4, align 8
  %388 = call i32 @png_safe_execute(ptr noundef %386, ptr noundef @png_write_image_8bit, ptr noundef %387)
  store i32 %388, ptr %21, align 4
  br label %389

389:                                              ; preds = %385, %381
  %390 = load ptr, ptr %4, align 8
  %391 = getelementptr inbounds %struct.png_image_write_control, ptr %390, i32 0, i32 7
  store ptr null, ptr %391, align 8
  %392 = load ptr, ptr %6, align 8
  %393 = load ptr, ptr %20, align 8
  call void @png_free(ptr noundef %392, ptr noundef %393)
  %394 = load i32, ptr %21, align 4
  %395 = icmp eq i32 %394, 0
  br i1 %395, label %396, label %397

396:                                              ; preds = %389
  store i32 0, ptr %2, align 4
  br label %424

397:                                              ; preds = %389
  br label %421

398:                                              ; preds = %365, %362
  %399 = load ptr, ptr %4, align 8
  %400 = getelementptr inbounds %struct.png_image_write_control, ptr %399, i32 0, i32 5
  %401 = load ptr, ptr %400, align 8
  store ptr %401, ptr %22, align 8
  %402 = load ptr, ptr %4, align 8
  %403 = getelementptr inbounds %struct.png_image_write_control, ptr %402, i32 0, i32 6
  %404 = load i64, ptr %403, align 8
  store i64 %404, ptr %23, align 8
  %405 = load ptr, ptr %5, align 8
  %406 = getelementptr inbounds %struct.png_image, ptr %405, i32 0, i32 3
  %407 = load i32, ptr %406, align 8
  store i32 %407, ptr %24, align 4
  br label %408

408:                                              ; preds = %417, %398
  %409 = load i32, ptr %24, align 4
  %410 = icmp ugt i32 %409, 0
  br i1 %410, label %411, label %420

411:                                              ; preds = %408
  %412 = load ptr, ptr %6, align 8
  %413 = load ptr, ptr %22, align 8
  call void @png_write_row(ptr noundef %412, ptr noundef %413)
  %414 = load i64, ptr %23, align 8
  %415 = load ptr, ptr %22, align 8
  %416 = getelementptr inbounds i8, ptr %415, i64 %414
  store ptr %416, ptr %22, align 8
  br label %417

417:                                              ; preds = %411
  %418 = load i32, ptr %24, align 4
  %419 = add i32 %418, -1
  store i32 %419, ptr %24, align 4
  br label %408, !llvm.loop !16

420:                                              ; preds = %408
  br label %421

421:                                              ; preds = %420, %397
  %422 = load ptr, ptr %6, align 8
  %423 = load ptr, ptr %7, align 8
  call void @png_write_end(ptr noundef %422, ptr noundef %423)
  store i32 1, ptr %2, align 4
  br label %424

424:                                              ; preds = %421, %396
  %425 = load i32, ptr %2, align 4
  ret i32 %425
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_image_write_to_file(ptr noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3, i32 noundef %4, ptr noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  store ptr %0, ptr %8, align 8
  store ptr %1, ptr %9, align 8
  store i32 %2, ptr %10, align 4
  store ptr %3, ptr %11, align 8
  store i32 %4, ptr %12, align 4
  store ptr %5, ptr %13, align 8
  %16 = load ptr, ptr %8, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %85

18:                                               ; preds = %6
  %19 = load ptr, ptr %8, align 8
  %20 = getelementptr inbounds %struct.png_image, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 8
  %22 = icmp eq i32 %21, 1
  br i1 %22, label %23, label %85

23:                                               ; preds = %18
  %24 = load ptr, ptr %9, align 8
  %25 = icmp ne ptr %24, null
  br i1 %25, label %26, label %82

26:                                               ; preds = %23
  %27 = load ptr, ptr %11, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %29, label %82

29:                                               ; preds = %26
  %30 = load ptr, ptr %9, align 8
  %31 = call noalias ptr @fopen(ptr noundef %30, ptr noundef @.str.18)
  store ptr %31, ptr %14, align 8
  %32 = load ptr, ptr %14, align 8
  %33 = icmp ne ptr %32, null
  br i1 %33, label %34, label %76

34:                                               ; preds = %29
  %35 = load ptr, ptr %8, align 8
  %36 = load ptr, ptr %14, align 8
  %37 = load i32, ptr %10, align 4
  %38 = load ptr, ptr %11, align 8
  %39 = load i32, ptr %12, align 4
  %40 = load ptr, ptr %13, align 8
  %41 = call i32 @png_image_write_to_stdio(ptr noundef %35, ptr noundef %36, i32 noundef %37, ptr noundef %38, i32 noundef %39, ptr noundef %40)
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %71

43:                                               ; preds = %34
  %44 = load ptr, ptr %14, align 8
  %45 = call i32 @fflush(ptr noundef %44)
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %59

47:                                               ; preds = %43
  %48 = load ptr, ptr %14, align 8
  %49 = call i32 @ferror(ptr noundef %48) #8
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %59

51:                                               ; preds = %47
  %52 = load ptr, ptr %14, align 8
  %53 = call i32 @fclose(ptr noundef %52)
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %55, label %56

55:                                               ; preds = %51
  store i32 1, ptr %7, align 4
  br label %92

56:                                               ; preds = %51
  %57 = call ptr @__errno_location() #9
  %58 = load i32, ptr %57, align 4
  store i32 %58, ptr %15, align 4
  br label %64

59:                                               ; preds = %47, %43
  %60 = call ptr @__errno_location() #9
  %61 = load i32, ptr %60, align 4
  store i32 %61, ptr %15, align 4
  %62 = load ptr, ptr %14, align 8
  %63 = call i32 @fclose(ptr noundef %62)
  br label %64

64:                                               ; preds = %59, %56
  %65 = load ptr, ptr %9, align 8
  %66 = call i32 @remove(ptr noundef %65) #8
  %67 = load ptr, ptr %8, align 8
  %68 = load i32, ptr %15, align 4
  %69 = call ptr @strerror(i32 noundef %68) #8
  %70 = call i32 @png_image_error(ptr noundef %67, ptr noundef %69)
  store i32 %70, ptr %7, align 4
  br label %92

71:                                               ; preds = %34
  %72 = load ptr, ptr %14, align 8
  %73 = call i32 @fclose(ptr noundef %72)
  %74 = load ptr, ptr %9, align 8
  %75 = call i32 @remove(ptr noundef %74) #8
  store i32 0, ptr %7, align 4
  br label %92

76:                                               ; preds = %29
  %77 = load ptr, ptr %8, align 8
  %78 = call ptr @__errno_location() #9
  %79 = load i32, ptr %78, align 4
  %80 = call ptr @strerror(i32 noundef %79) #8
  %81 = call i32 @png_image_error(ptr noundef %77, ptr noundef %80)
  store i32 %81, ptr %7, align 4
  br label %92

82:                                               ; preds = %26, %23
  %83 = load ptr, ptr %8, align 8
  %84 = call i32 @png_image_error(ptr noundef %83, ptr noundef @.str.19)
  store i32 %84, ptr %7, align 4
  br label %92

85:                                               ; preds = %18, %6
  %86 = load ptr, ptr %8, align 8
  %87 = icmp ne ptr %86, null
  br i1 %87, label %88, label %91

88:                                               ; preds = %85
  %89 = load ptr, ptr %8, align 8
  %90 = call i32 @png_image_error(ptr noundef %89, ptr noundef @.str.20)
  store i32 %90, ptr %7, align 4
  br label %92

91:                                               ; preds = %85
  store i32 0, ptr %7, align 4
  br label %92

92:                                               ; preds = %91, %88, %82, %76, %71, %64, %55
  %93 = load i32, ptr %7, align 4
  ret i32 %93
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @fflush(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @ferror(ptr noundef) #3

declare i32 @fclose(ptr noundef) #1

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__errno_location() #6

; Function Attrs: nounwind
declare i32 @remove(ptr noundef) #3

; Function Attrs: nounwind
declare ptr @strerror(i32 noundef) #3

declare i32 @png_handle_as_unknown(ptr noundef, ptr noundef) #1

declare void @png_write_chunk(ptr noundef, ptr noundef, ptr noundef, i64 noundef) #1

declare i32 @deflateEnd(ptr noundef) #1

declare void @png_free_buffer_list(ptr noundef, ptr noundef) #1

declare void @png_free(ptr noundef, ptr noundef) #1

; Function Attrs: noreturn
declare void @png_safe_error(ptr noundef, ptr noundef) #2

declare void @png_safe_warning(ptr noundef, ptr noundef) #1

declare noalias ptr @png_create_info_struct(ptr noundef) #1

declare noalias ptr @png_malloc_warn(ptr noundef, i64 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @image_memory_write(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.png_struct_def, ptr %9, i32 0, i32 9
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %7, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = getelementptr inbounds %struct.png_image_write_control, ptr %12, i32 0, i32 10
  %14 = load i64, ptr %13, align 8
  store i64 %14, ptr %8, align 8
  %15 = load i64, ptr %6, align 8
  %16 = load i64, ptr %8, align 8
  %17 = sub i64 -1, %16
  %18 = icmp ule i64 %15, %17
  br i1 %18, label %19, label %45

19:                                               ; preds = %3
  %20 = load i64, ptr %6, align 8
  %21 = icmp ugt i64 %20, 0
  br i1 %21, label %22, label %44

22:                                               ; preds = %19
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds %struct.png_image_write_control, ptr %23, i32 0, i32 9
  %25 = load i64, ptr %24, align 8
  %26 = load i64, ptr %8, align 8
  %27 = load i64, ptr %6, align 8
  %28 = add i64 %26, %27
  %29 = icmp uge i64 %25, %28
  br i1 %29, label %30, label %38

30:                                               ; preds = %22
  %31 = load ptr, ptr %7, align 8
  %32 = getelementptr inbounds %struct.png_image_write_control, ptr %31, i32 0, i32 8
  %33 = load ptr, ptr %32, align 8
  %34 = load i64, ptr %8, align 8
  %35 = getelementptr inbounds i8, ptr %33, i64 %34
  %36 = load ptr, ptr %5, align 8
  %37 = load i64, ptr %6, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %35, ptr align 1 %36, i64 %37, i1 false)
  br label %38

38:                                               ; preds = %30, %22
  %39 = load i64, ptr %8, align 8
  %40 = load i64, ptr %6, align 8
  %41 = add i64 %39, %40
  %42 = load ptr, ptr %7, align 8
  %43 = getelementptr inbounds %struct.png_image_write_control, ptr %42, i32 0, i32 10
  store i64 %41, ptr %43, align 8
  br label %44

44:                                               ; preds = %38, %19
  br label %47

45:                                               ; preds = %3
  %46 = load ptr, ptr %4, align 8
  call void @png_error(ptr noundef %46, ptr noundef @.str.24) #7
  unreachable

47:                                               ; preds = %44
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @image_memory_flush(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

declare void @png_set_benign_errors(ptr noundef, i32 noundef) #1

declare void @png_set_IHDR(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_image_set_PLTE(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [256 x %struct.png_color_struct], align 16
  %13 = alloca [256 x i8], align 16
  %14 = alloca ptr, align 8
  %15 = alloca i16, align 2
  %16 = alloca i8, align 1
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.png_image_write_control, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  store ptr %21, ptr %3, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds %struct.png_image_write_control, ptr %22, i32 0, i32 3
  %24 = load ptr, ptr %23, align 8
  store ptr %24, ptr %4, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.png_image, ptr %25, i32 0, i32 6
  %27 = load i32, ptr %26, align 4
  %28 = icmp ugt i32 %27, 256
  br i1 %28, label %29, label %30

29:                                               ; preds = %1
  br label %34

30:                                               ; preds = %1
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds %struct.png_image, ptr %31, i32 0, i32 6
  %33 = load i32, ptr %32, align 4
  br label %34

34:                                               ; preds = %30, %29
  %35 = phi i32 [ 256, %29 ], [ %33, %30 ]
  store i32 %35, ptr %5, align 4
  %36 = load ptr, ptr %3, align 8
  %37 = getelementptr inbounds %struct.png_image, ptr %36, i32 0, i32 4
  %38 = load i32, ptr %37, align 4
  store i32 %38, ptr %6, align 4
  %39 = load i32, ptr %6, align 4
  %40 = and i32 %39, 3
  %41 = add i32 %40, 1
  store i32 %41, ptr %7, align 4
  %42 = load i32, ptr %6, align 4
  %43 = and i32 %42, 32
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %49

45:                                               ; preds = %34
  %46 = load i32, ptr %6, align 4
  %47 = and i32 %46, 1
  %48 = icmp ne i32 %47, 0
  br label %49

49:                                               ; preds = %45, %34
  %50 = phi i1 [ false, %34 ], [ %48, %45 ]
  %51 = zext i1 %50 to i32
  store i32 %51, ptr %8, align 4
  %52 = load i32, ptr %6, align 4
  %53 = and i32 %52, 16
  %54 = icmp ne i32 %53, 0
  %55 = zext i1 %54 to i64
  %56 = select i1 %54, i32 2, i32 0
  store i32 %56, ptr %9, align 4
  %57 = getelementptr inbounds [256 x i8], ptr %13, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %57, i8 -1, i64 256, i1 false)
  %58 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %58, i8 0, i64 768, i1 false)
  store i32 0, ptr %11, align 4
  store i32 0, ptr %10, align 4
  br label %59

59:                                               ; preds = %476, %49
  %60 = load i32, ptr %10, align 4
  %61 = load i32, ptr %5, align 4
  %62 = icmp slt i32 %60, %61
  br i1 %62, label %63, label %479

63:                                               ; preds = %59
  %64 = load i32, ptr %6, align 4
  %65 = and i32 %64, 4
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %370

67:                                               ; preds = %63
  %68 = load ptr, ptr %4, align 8
  store ptr %68, ptr %14, align 8
  %69 = load i32, ptr %10, align 4
  %70 = load i32, ptr %7, align 4
  %71 = mul i32 %69, %70
  %72 = load ptr, ptr %14, align 8
  %73 = zext i32 %71 to i64
  %74 = getelementptr inbounds i16, ptr %72, i64 %73
  store ptr %74, ptr %14, align 8
  %75 = load i32, ptr %7, align 4
  %76 = and i32 %75, 1
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %248

78:                                               ; preds = %67
  %79 = load i32, ptr %7, align 4
  %80 = icmp uge i32 %79, 3
  br i1 %80, label %81, label %205

81:                                               ; preds = %78
  %82 = load ptr, ptr %14, align 8
  %83 = load i32, ptr %9, align 4
  %84 = xor i32 2, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i16, ptr %82, i64 %85
  %87 = load i16, ptr %86, align 2
  %88 = zext i16 %87 to i32
  %89 = mul nsw i32 255, %88
  %90 = ashr i32 %89, 15
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %91
  %93 = load i16, ptr %92, align 2
  %94 = zext i16 %93 to i32
  %95 = load ptr, ptr %14, align 8
  %96 = load i32, ptr %9, align 4
  %97 = xor i32 2, %96
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i16, ptr %95, i64 %98
  %100 = load i16, ptr %99, align 2
  %101 = zext i16 %100 to i32
  %102 = mul nsw i32 255, %101
  %103 = and i32 %102, 32767
  %104 = load ptr, ptr %14, align 8
  %105 = load i32, ptr %9, align 4
  %106 = xor i32 2, %105
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i16, ptr %104, i64 %107
  %109 = load i16, ptr %108, align 2
  %110 = zext i16 %109 to i32
  %111 = mul nsw i32 255, %110
  %112 = ashr i32 %111, 15
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %113
  %115 = load i8, ptr %114, align 1
  %116 = zext i8 %115 to i32
  %117 = mul nsw i32 %103, %116
  %118 = ashr i32 %117, 12
  %119 = add nsw i32 %94, %118
  %120 = ashr i32 %119, 8
  %121 = and i32 255, %120
  %122 = trunc i32 %121 to i8
  %123 = load i32, ptr %10, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %124
  %126 = getelementptr inbounds %struct.png_color_struct, ptr %125, i32 0, i32 2
  store i8 %122, ptr %126, align 1
  %127 = load ptr, ptr %14, align 8
  %128 = getelementptr inbounds i16, ptr %127, i64 1
  %129 = load i16, ptr %128, align 2
  %130 = zext i16 %129 to i32
  %131 = mul nsw i32 255, %130
  %132 = ashr i32 %131, 15
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %133
  %135 = load i16, ptr %134, align 2
  %136 = zext i16 %135 to i32
  %137 = load ptr, ptr %14, align 8
  %138 = getelementptr inbounds i16, ptr %137, i64 1
  %139 = load i16, ptr %138, align 2
  %140 = zext i16 %139 to i32
  %141 = mul nsw i32 255, %140
  %142 = and i32 %141, 32767
  %143 = load ptr, ptr %14, align 8
  %144 = getelementptr inbounds i16, ptr %143, i64 1
  %145 = load i16, ptr %144, align 2
  %146 = zext i16 %145 to i32
  %147 = mul nsw i32 255, %146
  %148 = ashr i32 %147, 15
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %149
  %151 = load i8, ptr %150, align 1
  %152 = zext i8 %151 to i32
  %153 = mul nsw i32 %142, %152
  %154 = ashr i32 %153, 12
  %155 = add nsw i32 %136, %154
  %156 = ashr i32 %155, 8
  %157 = and i32 255, %156
  %158 = trunc i32 %157 to i8
  %159 = load i32, ptr %10, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %160
  %162 = getelementptr inbounds %struct.png_color_struct, ptr %161, i32 0, i32 1
  store i8 %158, ptr %162, align 1
  %163 = load ptr, ptr %14, align 8
  %164 = load i32, ptr %9, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds i16, ptr %163, i64 %165
  %167 = load i16, ptr %166, align 2
  %168 = zext i16 %167 to i32
  %169 = mul nsw i32 255, %168
  %170 = ashr i32 %169, 15
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %171
  %173 = load i16, ptr %172, align 2
  %174 = zext i16 %173 to i32
  %175 = load ptr, ptr %14, align 8
  %176 = load i32, ptr %9, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i16, ptr %175, i64 %177
  %179 = load i16, ptr %178, align 2
  %180 = zext i16 %179 to i32
  %181 = mul nsw i32 255, %180
  %182 = and i32 %181, 32767
  %183 = load ptr, ptr %14, align 8
  %184 = load i32, ptr %9, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i16, ptr %183, i64 %185
  %187 = load i16, ptr %186, align 2
  %188 = zext i16 %187 to i32
  %189 = mul nsw i32 255, %188
  %190 = ashr i32 %189, 15
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %191
  %193 = load i8, ptr %192, align 1
  %194 = zext i8 %193 to i32
  %195 = mul nsw i32 %182, %194
  %196 = ashr i32 %195, 12
  %197 = add nsw i32 %174, %196
  %198 = ashr i32 %197, 8
  %199 = and i32 255, %198
  %200 = trunc i32 %199 to i8
  %201 = load i32, ptr %10, align 4
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %202
  %204 = getelementptr inbounds %struct.png_color_struct, ptr %203, i32 0, i32 0
  store i8 %200, ptr %204, align 1
  br label %247

205:                                              ; preds = %78
  %206 = load ptr, ptr %14, align 8
  %207 = load i16, ptr %206, align 2
  %208 = zext i16 %207 to i32
  %209 = mul nsw i32 255, %208
  %210 = ashr i32 %209, 15
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %211
  %213 = load i16, ptr %212, align 2
  %214 = zext i16 %213 to i32
  %215 = load ptr, ptr %14, align 8
  %216 = load i16, ptr %215, align 2
  %217 = zext i16 %216 to i32
  %218 = mul nsw i32 255, %217
  %219 = and i32 %218, 32767
  %220 = load ptr, ptr %14, align 8
  %221 = load i16, ptr %220, align 2
  %222 = zext i16 %221 to i32
  %223 = mul nsw i32 255, %222
  %224 = ashr i32 %223, 15
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %225
  %227 = load i8, ptr %226, align 1
  %228 = zext i8 %227 to i32
  %229 = mul nsw i32 %219, %228
  %230 = ashr i32 %229, 12
  %231 = add nsw i32 %214, %230
  %232 = ashr i32 %231, 8
  %233 = and i32 255, %232
  %234 = trunc i32 %233 to i8
  %235 = load i32, ptr %10, align 4
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %236
  %238 = getelementptr inbounds %struct.png_color_struct, ptr %237, i32 0, i32 1
  store i8 %234, ptr %238, align 1
  %239 = load i32, ptr %10, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %240
  %242 = getelementptr inbounds %struct.png_color_struct, ptr %241, i32 0, i32 0
  store i8 %234, ptr %242, align 1
  %243 = load i32, ptr %10, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %244
  %246 = getelementptr inbounds %struct.png_color_struct, ptr %245, i32 0, i32 2
  store i8 %234, ptr %246, align 1
  br label %247

247:                                              ; preds = %205, %81
  br label %369

248:                                              ; preds = %67
  %249 = load ptr, ptr %14, align 8
  %250 = load i32, ptr %8, align 4
  %251 = icmp ne i32 %250, 0
  br i1 %251, label %252, label %253

252:                                              ; preds = %248
  br label %256

253:                                              ; preds = %248
  %254 = load i32, ptr %7, align 4
  %255 = sub i32 %254, 1
  br label %256

256:                                              ; preds = %253, %252
  %257 = phi i32 [ 0, %252 ], [ %255, %253 ]
  %258 = zext i32 %257 to i64
  %259 = getelementptr inbounds i16, ptr %249, i64 %258
  %260 = load i16, ptr %259, align 2
  store i16 %260, ptr %15, align 2
  %261 = load i16, ptr %15, align 2
  %262 = zext i16 %261 to i32
  %263 = mul i32 %262, 255
  %264 = add i32 %263, 32895
  %265 = lshr i32 %264, 16
  %266 = trunc i32 %265 to i8
  store i8 %266, ptr %16, align 1
  store i32 0, ptr %17, align 4
  %267 = load i8, ptr %16, align 1
  %268 = zext i8 %267 to i32
  %269 = icmp sgt i32 %268, 0
  br i1 %269, label %270, label %282

270:                                              ; preds = %256
  %271 = load i8, ptr %16, align 1
  %272 = zext i8 %271 to i32
  %273 = icmp slt i32 %272, 255
  br i1 %273, label %274, label %282

274:                                              ; preds = %270
  %275 = load i16, ptr %15, align 2
  %276 = zext i16 %275 to i32
  %277 = ashr i32 %276, 1
  %278 = add nsw i32 2139062400, %277
  %279 = load i16, ptr %15, align 2
  %280 = zext i16 %279 to i32
  %281 = sdiv i32 %278, %280
  store i32 %281, ptr %17, align 4
  br label %282

282:                                              ; preds = %274, %270, %256
  %283 = load i8, ptr %16, align 1
  %284 = load i32, ptr %10, align 4
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds [256 x i8], ptr %13, i64 0, i64 %285
  store i8 %283, ptr %286, align 1
  %287 = load i8, ptr %16, align 1
  %288 = zext i8 %287 to i32
  %289 = icmp slt i32 %288, 255
  br i1 %289, label %290, label %293

290:                                              ; preds = %282
  %291 = load i32, ptr %10, align 4
  %292 = add nsw i32 %291, 1
  store i32 %292, ptr %11, align 4
  br label %293

293:                                              ; preds = %290, %282
  %294 = load i32, ptr %7, align 4
  %295 = icmp uge i32 %294, 3
  br i1 %295, label %296, label %345

296:                                              ; preds = %293
  %297 = load ptr, ptr %14, align 8
  %298 = load i32, ptr %8, align 4
  %299 = load i32, ptr %9, align 4
  %300 = xor i32 2, %299
  %301 = add nsw i32 %298, %300
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds i16, ptr %297, i64 %302
  %304 = load i16, ptr %303, align 2
  %305 = zext i16 %304 to i32
  %306 = load i16, ptr %15, align 2
  %307 = zext i16 %306 to i32
  %308 = load i32, ptr %17, align 4
  %309 = call zeroext i8 @png_unpremultiply(i32 noundef %305, i32 noundef %307, i32 noundef %308)
  %310 = load i32, ptr %10, align 4
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %311
  %313 = getelementptr inbounds %struct.png_color_struct, ptr %312, i32 0, i32 2
  store i8 %309, ptr %313, align 1
  %314 = load ptr, ptr %14, align 8
  %315 = load i32, ptr %8, align 4
  %316 = add nsw i32 %315, 1
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds i16, ptr %314, i64 %317
  %319 = load i16, ptr %318, align 2
  %320 = zext i16 %319 to i32
  %321 = load i16, ptr %15, align 2
  %322 = zext i16 %321 to i32
  %323 = load i32, ptr %17, align 4
  %324 = call zeroext i8 @png_unpremultiply(i32 noundef %320, i32 noundef %322, i32 noundef %323)
  %325 = load i32, ptr %10, align 4
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %326
  %328 = getelementptr inbounds %struct.png_color_struct, ptr %327, i32 0, i32 1
  store i8 %324, ptr %328, align 1
  %329 = load ptr, ptr %14, align 8
  %330 = load i32, ptr %8, align 4
  %331 = load i32, ptr %9, align 4
  %332 = add nsw i32 %330, %331
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds i16, ptr %329, i64 %333
  %335 = load i16, ptr %334, align 2
  %336 = zext i16 %335 to i32
  %337 = load i16, ptr %15, align 2
  %338 = zext i16 %337 to i32
  %339 = load i32, ptr %17, align 4
  %340 = call zeroext i8 @png_unpremultiply(i32 noundef %336, i32 noundef %338, i32 noundef %339)
  %341 = load i32, ptr %10, align 4
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %342
  %344 = getelementptr inbounds %struct.png_color_struct, ptr %343, i32 0, i32 0
  store i8 %340, ptr %344, align 1
  br label %368

345:                                              ; preds = %293
  %346 = load ptr, ptr %14, align 8
  %347 = load i32, ptr %8, align 4
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds i16, ptr %346, i64 %348
  %350 = load i16, ptr %349, align 2
  %351 = zext i16 %350 to i32
  %352 = load i16, ptr %15, align 2
  %353 = zext i16 %352 to i32
  %354 = load i32, ptr %17, align 4
  %355 = call zeroext i8 @png_unpremultiply(i32 noundef %351, i32 noundef %353, i32 noundef %354)
  %356 = load i32, ptr %10, align 4
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %357
  %359 = getelementptr inbounds %struct.png_color_struct, ptr %358, i32 0, i32 1
  store i8 %355, ptr %359, align 1
  %360 = load i32, ptr %10, align 4
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %361
  %363 = getelementptr inbounds %struct.png_color_struct, ptr %362, i32 0, i32 0
  store i8 %355, ptr %363, align 1
  %364 = load i32, ptr %10, align 4
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %365
  %367 = getelementptr inbounds %struct.png_color_struct, ptr %366, i32 0, i32 2
  store i8 %355, ptr %367, align 1
  br label %368

368:                                              ; preds = %345, %296
  br label %369

369:                                              ; preds = %368, %247
  br label %475

370:                                              ; preds = %63
  %371 = load ptr, ptr %4, align 8
  store ptr %371, ptr %18, align 8
  %372 = load i32, ptr %10, align 4
  %373 = load i32, ptr %7, align 4
  %374 = mul i32 %372, %373
  %375 = load ptr, ptr %18, align 8
  %376 = zext i32 %374 to i64
  %377 = getelementptr inbounds i8, ptr %375, i64 %376
  store ptr %377, ptr %18, align 8
  %378 = load i32, ptr %7, align 4
  switch i32 %378, label %473 [
    i32 4, label %379
    i32 3, label %401
    i32 2, label %435
    i32 1, label %455
  ]

379:                                              ; preds = %370
  %380 = load ptr, ptr %18, align 8
  %381 = load i32, ptr %8, align 4
  %382 = icmp ne i32 %381, 0
  %383 = zext i1 %382 to i64
  %384 = select i1 %382, i32 0, i32 3
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds i8, ptr %380, i64 %385
  %387 = load i8, ptr %386, align 1
  %388 = load i32, ptr %10, align 4
  %389 = sext i32 %388 to i64
  %390 = getelementptr inbounds [256 x i8], ptr %13, i64 0, i64 %389
  store i8 %387, ptr %390, align 1
  %391 = load i32, ptr %10, align 4
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds [256 x i8], ptr %13, i64 0, i64 %392
  %394 = load i8, ptr %393, align 1
  %395 = zext i8 %394 to i32
  %396 = icmp slt i32 %395, 255
  br i1 %396, label %397, label %400

397:                                              ; preds = %379
  %398 = load i32, ptr %10, align 4
  %399 = add nsw i32 %398, 1
  store i32 %399, ptr %11, align 4
  br label %400

400:                                              ; preds = %397, %379
  br label %401

401:                                              ; preds = %370, %400
  %402 = load ptr, ptr %18, align 8
  %403 = load i32, ptr %8, align 4
  %404 = load i32, ptr %9, align 4
  %405 = xor i32 2, %404
  %406 = add nsw i32 %403, %405
  %407 = sext i32 %406 to i64
  %408 = getelementptr inbounds i8, ptr %402, i64 %407
  %409 = load i8, ptr %408, align 1
  %410 = load i32, ptr %10, align 4
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %411
  %413 = getelementptr inbounds %struct.png_color_struct, ptr %412, i32 0, i32 2
  store i8 %409, ptr %413, align 1
  %414 = load ptr, ptr %18, align 8
  %415 = load i32, ptr %8, align 4
  %416 = add nsw i32 %415, 1
  %417 = sext i32 %416 to i64
  %418 = getelementptr inbounds i8, ptr %414, i64 %417
  %419 = load i8, ptr %418, align 1
  %420 = load i32, ptr %10, align 4
  %421 = sext i32 %420 to i64
  %422 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %421
  %423 = getelementptr inbounds %struct.png_color_struct, ptr %422, i32 0, i32 1
  store i8 %419, ptr %423, align 1
  %424 = load ptr, ptr %18, align 8
  %425 = load i32, ptr %8, align 4
  %426 = load i32, ptr %9, align 4
  %427 = add nsw i32 %425, %426
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds i8, ptr %424, i64 %428
  %430 = load i8, ptr %429, align 1
  %431 = load i32, ptr %10, align 4
  %432 = sext i32 %431 to i64
  %433 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %432
  %434 = getelementptr inbounds %struct.png_color_struct, ptr %433, i32 0, i32 0
  store i8 %430, ptr %434, align 1
  br label %474

435:                                              ; preds = %370
  %436 = load ptr, ptr %18, align 8
  %437 = load i32, ptr %8, align 4
  %438 = xor i32 1, %437
  %439 = sext i32 %438 to i64
  %440 = getelementptr inbounds i8, ptr %436, i64 %439
  %441 = load i8, ptr %440, align 1
  %442 = load i32, ptr %10, align 4
  %443 = sext i32 %442 to i64
  %444 = getelementptr inbounds [256 x i8], ptr %13, i64 0, i64 %443
  store i8 %441, ptr %444, align 1
  %445 = load i32, ptr %10, align 4
  %446 = sext i32 %445 to i64
  %447 = getelementptr inbounds [256 x i8], ptr %13, i64 0, i64 %446
  %448 = load i8, ptr %447, align 1
  %449 = zext i8 %448 to i32
  %450 = icmp slt i32 %449, 255
  br i1 %450, label %451, label %454

451:                                              ; preds = %435
  %452 = load i32, ptr %10, align 4
  %453 = add nsw i32 %452, 1
  store i32 %453, ptr %11, align 4
  br label %454

454:                                              ; preds = %451, %435
  br label %455

455:                                              ; preds = %370, %454
  %456 = load ptr, ptr %18, align 8
  %457 = load i32, ptr %8, align 4
  %458 = sext i32 %457 to i64
  %459 = getelementptr inbounds i8, ptr %456, i64 %458
  %460 = load i8, ptr %459, align 1
  %461 = load i32, ptr %10, align 4
  %462 = sext i32 %461 to i64
  %463 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %462
  %464 = getelementptr inbounds %struct.png_color_struct, ptr %463, i32 0, i32 1
  store i8 %460, ptr %464, align 1
  %465 = load i32, ptr %10, align 4
  %466 = sext i32 %465 to i64
  %467 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %466
  %468 = getelementptr inbounds %struct.png_color_struct, ptr %467, i32 0, i32 0
  store i8 %460, ptr %468, align 1
  %469 = load i32, ptr %10, align 4
  %470 = sext i32 %469 to i64
  %471 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 %470
  %472 = getelementptr inbounds %struct.png_color_struct, ptr %471, i32 0, i32 2
  store i8 %460, ptr %472, align 1
  br label %474

473:                                              ; preds = %370
  br label %474

474:                                              ; preds = %473, %455, %401
  br label %475

475:                                              ; preds = %474, %369
  br label %476

476:                                              ; preds = %475
  %477 = load i32, ptr %10, align 4
  %478 = add nsw i32 %477, 1
  store i32 %478, ptr %10, align 4
  br label %59, !llvm.loop !17

479:                                              ; preds = %59
  %480 = load ptr, ptr %3, align 8
  %481 = getelementptr inbounds %struct.png_image, ptr %480, i32 0, i32 0
  %482 = load ptr, ptr %481, align 8
  %483 = getelementptr inbounds %struct.png_control, ptr %482, i32 0, i32 0
  %484 = load ptr, ptr %483, align 8
  %485 = load ptr, ptr %3, align 8
  %486 = getelementptr inbounds %struct.png_image, ptr %485, i32 0, i32 0
  %487 = load ptr, ptr %486, align 8
  %488 = getelementptr inbounds %struct.png_control, ptr %487, i32 0, i32 1
  %489 = load ptr, ptr %488, align 8
  %490 = getelementptr inbounds [256 x %struct.png_color_struct], ptr %12, i64 0, i64 0
  %491 = load i32, ptr %5, align 4
  call void @png_set_PLTE(ptr noundef %484, ptr noundef %489, ptr noundef %490, i32 noundef %491)
  %492 = load i32, ptr %11, align 4
  %493 = icmp sgt i32 %492, 0
  br i1 %493, label %494, label %507

494:                                              ; preds = %479
  %495 = load ptr, ptr %3, align 8
  %496 = getelementptr inbounds %struct.png_image, ptr %495, i32 0, i32 0
  %497 = load ptr, ptr %496, align 8
  %498 = getelementptr inbounds %struct.png_control, ptr %497, i32 0, i32 0
  %499 = load ptr, ptr %498, align 8
  %500 = load ptr, ptr %3, align 8
  %501 = getelementptr inbounds %struct.png_image, ptr %500, i32 0, i32 0
  %502 = load ptr, ptr %501, align 8
  %503 = getelementptr inbounds %struct.png_control, ptr %502, i32 0, i32 1
  %504 = load ptr, ptr %503, align 8
  %505 = getelementptr inbounds [256 x i8], ptr %13, i64 0, i64 0
  %506 = load i32, ptr %11, align 4
  call void @png_set_tRNS(ptr noundef %499, ptr noundef %504, ptr noundef %505, i32 noundef %506, ptr noundef null)
  br label %507

507:                                              ; preds = %494, %479
  %508 = load i32, ptr %5, align 4
  %509 = load ptr, ptr %3, align 8
  %510 = getelementptr inbounds %struct.png_image, ptr %509, i32 0, i32 6
  store i32 %508, ptr %510, align 4
  ret void
}

declare void @png_set_gAMA_fixed(ptr noundef, ptr noundef, i32 noundef) #1

declare void @png_set_cHRM_fixed(ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #1

declare void @png_set_sRGB(ptr noundef, ptr noundef, i32 noundef) #1

declare i64 @png_get_rowbytes(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_write_image_16bit(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i16, align 2
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i16, align 2
  %18 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %19 = load ptr, ptr %2, align 8
  store ptr %19, ptr %3, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds %struct.png_image_write_control, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %4, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds %struct.png_image, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = getelementptr inbounds %struct.png_control, ptr %25, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  store ptr %27, ptr %5, align 8
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds %struct.png_image_write_control, ptr %28, i32 0, i32 5
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %6, align 8
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds %struct.png_image_write_control, ptr %31, i32 0, i32 7
  %33 = load ptr, ptr %32, align 8
  store ptr %33, ptr %7, align 8
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds %struct.png_image, ptr %34, i32 0, i32 4
  %36 = load i32, ptr %35, align 4
  %37 = and i32 %36, 2
  %38 = icmp ne i32 %37, 0
  %39 = zext i1 %38 to i64
  %40 = select i1 %38, i32 3, i32 1
  store i32 %40, ptr %9, align 4
  store i32 0, ptr %10, align 4
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds %struct.png_image, ptr %41, i32 0, i32 3
  %43 = load i32, ptr %42, align 8
  store i32 %43, ptr %11, align 4
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds %struct.png_image, ptr %44, i32 0, i32 4
  %46 = load i32, ptr %45, align 4
  %47 = and i32 %46, 1
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %63

49:                                               ; preds = %1
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds %struct.png_image, ptr %50, i32 0, i32 4
  %52 = load i32, ptr %51, align 4
  %53 = and i32 %52, 32
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %60

55:                                               ; preds = %49
  store i32 -1, ptr %10, align 4
  %56 = load ptr, ptr %6, align 8
  %57 = getelementptr inbounds i16, ptr %56, i32 1
  store ptr %57, ptr %6, align 8
  %58 = load ptr, ptr %7, align 8
  %59 = getelementptr inbounds i16, ptr %58, i32 1
  store ptr %59, ptr %7, align 8
  br label %62

60:                                               ; preds = %49
  %61 = load i32, ptr %9, align 4
  store i32 %61, ptr %10, align 4
  br label %62

62:                                               ; preds = %60, %55
  br label %65

63:                                               ; preds = %1
  %64 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %64, ptr noundef @.str.30) #7
  unreachable

65:                                               ; preds = %62
  %66 = load ptr, ptr %7, align 8
  %67 = load ptr, ptr %4, align 8
  %68 = getelementptr inbounds %struct.png_image, ptr %67, i32 0, i32 2
  %69 = load i32, ptr %68, align 4
  %70 = load i32, ptr %9, align 4
  %71 = add i32 %70, 1
  %72 = mul i32 %69, %71
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i16, ptr %66, i64 %73
  store ptr %74, ptr %8, align 8
  br label %75

75:                                               ; preds = %168, %65
  %76 = load i32, ptr %11, align 4
  %77 = icmp ugt i32 %76, 0
  br i1 %77, label %78, label %171

78:                                               ; preds = %75
  %79 = load ptr, ptr %6, align 8
  store ptr %79, ptr %12, align 8
  %80 = load ptr, ptr %7, align 8
  store ptr %80, ptr %13, align 8
  br label %81

81:                                               ; preds = %150, %78
  %82 = load ptr, ptr %13, align 8
  %83 = load ptr, ptr %8, align 8
  %84 = icmp ult ptr %82, %83
  br i1 %84, label %85, label %155

85:                                               ; preds = %81
  %86 = load ptr, ptr %12, align 8
  %87 = load i32, ptr %10, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i16, ptr %86, i64 %88
  %90 = load i16, ptr %89, align 2
  store i16 %90, ptr %14, align 2
  store i32 0, ptr %15, align 4
  %91 = load i16, ptr %14, align 2
  %92 = load ptr, ptr %13, align 8
  %93 = load i32, ptr %10, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds i16, ptr %92, i64 %94
  store i16 %91, ptr %95, align 2
  %96 = load i16, ptr %14, align 2
  %97 = zext i16 %96 to i32
  %98 = icmp sgt i32 %97, 0
  br i1 %98, label %99, label %111

99:                                               ; preds = %85
  %100 = load i16, ptr %14, align 2
  %101 = zext i16 %100 to i32
  %102 = icmp slt i32 %101, 65535
  br i1 %102, label %103, label %111

103:                                              ; preds = %99
  %104 = load i16, ptr %14, align 2
  %105 = zext i16 %104 to i32
  %106 = ashr i32 %105, 1
  %107 = add nsw i32 2147450880, %106
  %108 = load i16, ptr %14, align 2
  %109 = zext i16 %108 to i32
  %110 = sdiv i32 %107, %109
  store i32 %110, ptr %15, align 4
  br label %111

111:                                              ; preds = %103, %99, %85
  %112 = load i32, ptr %9, align 4
  store i32 %112, ptr %16, align 4
  br label %113

113:                                              ; preds = %146, %111
  %114 = load ptr, ptr %12, align 8
  %115 = getelementptr inbounds i16, ptr %114, i32 1
  store ptr %115, ptr %12, align 8
  %116 = load i16, ptr %114, align 2
  store i16 %116, ptr %17, align 2
  %117 = load i16, ptr %17, align 2
  %118 = zext i16 %117 to i32
  %119 = load i16, ptr %14, align 2
  %120 = zext i16 %119 to i32
  %121 = icmp sge i32 %118, %120
  br i1 %121, label %122, label %123

122:                                              ; preds = %113
  store i16 -1, ptr %17, align 2
  br label %142

123:                                              ; preds = %113
  %124 = load i16, ptr %17, align 2
  %125 = zext i16 %124 to i32
  %126 = icmp sgt i32 %125, 0
  br i1 %126, label %127, label %141

127:                                              ; preds = %123
  %128 = load i16, ptr %14, align 2
  %129 = zext i16 %128 to i32
  %130 = icmp slt i32 %129, 65535
  br i1 %130, label %131, label %141

131:                                              ; preds = %127
  %132 = load i16, ptr %17, align 2
  %133 = zext i16 %132 to i32
  %134 = load i32, ptr %15, align 4
  %135 = mul i32 %133, %134
  store i32 %135, ptr %18, align 4
  %136 = load i32, ptr %18, align 4
  %137 = add i32 %136, 16384
  store i32 %137, ptr %18, align 4
  %138 = load i32, ptr %18, align 4
  %139 = lshr i32 %138, 15
  %140 = trunc i32 %139 to i16
  store i16 %140, ptr %17, align 2
  br label %141

141:                                              ; preds = %131, %127, %123
  br label %142

142:                                              ; preds = %141, %122
  %143 = load i16, ptr %17, align 2
  %144 = load ptr, ptr %13, align 8
  %145 = getelementptr inbounds i16, ptr %144, i32 1
  store ptr %145, ptr %13, align 8
  store i16 %143, ptr %144, align 2
  br label %146

146:                                              ; preds = %142
  %147 = load i32, ptr %16, align 4
  %148 = add nsw i32 %147, -1
  store i32 %148, ptr %16, align 4
  %149 = icmp sgt i32 %148, 0
  br i1 %149, label %113, label %150, !llvm.loop !18

150:                                              ; preds = %146
  %151 = load ptr, ptr %12, align 8
  %152 = getelementptr inbounds i16, ptr %151, i32 1
  store ptr %152, ptr %12, align 8
  %153 = load ptr, ptr %13, align 8
  %154 = getelementptr inbounds i16, ptr %153, i32 1
  store ptr %154, ptr %13, align 8
  br label %81, !llvm.loop !19

155:                                              ; preds = %81
  %156 = load ptr, ptr %5, align 8
  %157 = load ptr, ptr %3, align 8
  %158 = getelementptr inbounds %struct.png_image_write_control, ptr %157, i32 0, i32 7
  %159 = load ptr, ptr %158, align 8
  call void @png_write_row(ptr noundef %156, ptr noundef %159)
  %160 = load ptr, ptr %3, align 8
  %161 = getelementptr inbounds %struct.png_image_write_control, ptr %160, i32 0, i32 6
  %162 = load i64, ptr %161, align 8
  %163 = trunc i64 %162 to i16
  %164 = zext i16 %163 to i64
  %165 = udiv i64 %164, 2
  %166 = load ptr, ptr %6, align 8
  %167 = getelementptr inbounds i16, ptr %166, i64 %165
  store ptr %167, ptr %6, align 8
  br label %168

168:                                              ; preds = %155
  %169 = load i32, ptr %11, align 4
  %170 = add i32 %169, -1
  store i32 %170, ptr %11, align 4
  br label %75, !llvm.loop !20

171:                                              ; preds = %75
  ret i32 1
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_write_image_8bit(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i16, align 2
  %15 = alloca i8, align 1
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %22 = load ptr, ptr %2, align 8
  store ptr %22, ptr %3, align 8
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds %struct.png_image_write_control, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  store ptr %25, ptr %4, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds %struct.png_image, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds %struct.png_control, ptr %28, i32 0, i32 0
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %5, align 8
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds %struct.png_image_write_control, ptr %31, i32 0, i32 5
  %33 = load ptr, ptr %32, align 8
  store ptr %33, ptr %6, align 8
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds %struct.png_image_write_control, ptr %34, i32 0, i32 7
  %36 = load ptr, ptr %35, align 8
  store ptr %36, ptr %7, align 8
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.png_image, ptr %37, i32 0, i32 3
  %39 = load i32, ptr %38, align 8
  store i32 %39, ptr %8, align 4
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds %struct.png_image, ptr %40, i32 0, i32 4
  %42 = load i32, ptr %41, align 4
  %43 = and i32 %42, 2
  %44 = icmp ne i32 %43, 0
  %45 = zext i1 %44 to i64
  %46 = select i1 %44, i32 3, i32 1
  store i32 %46, ptr %9, align 4
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds %struct.png_image, ptr %47, i32 0, i32 4
  %49 = load i32, ptr %48, align 4
  %50 = and i32 %49, 1
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %156

52:                                               ; preds = %1
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds %struct.png_image, ptr %53, i32 0, i32 4
  %55 = load i32, ptr %54, align 4
  %56 = and i32 %55, 32
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %63

58:                                               ; preds = %52
  store i32 -1, ptr %11, align 4
  %59 = load ptr, ptr %6, align 8
  %60 = getelementptr inbounds i16, ptr %59, i32 1
  store ptr %60, ptr %6, align 8
  %61 = load ptr, ptr %7, align 8
  %62 = getelementptr inbounds i8, ptr %61, i32 1
  store ptr %62, ptr %7, align 8
  br label %65

63:                                               ; preds = %52
  %64 = load i32, ptr %9, align 4
  store i32 %64, ptr %11, align 4
  br label %65

65:                                               ; preds = %63, %58
  %66 = load ptr, ptr %7, align 8
  %67 = load ptr, ptr %4, align 8
  %68 = getelementptr inbounds %struct.png_image, ptr %67, i32 0, i32 2
  %69 = load i32, ptr %68, align 4
  %70 = load i32, ptr %9, align 4
  %71 = add i32 %70, 1
  %72 = mul i32 %69, %71
  %73 = zext i32 %72 to i64
  %74 = getelementptr inbounds i8, ptr %66, i64 %73
  store ptr %74, ptr %10, align 8
  br label %75

75:                                               ; preds = %152, %65
  %76 = load i32, ptr %8, align 4
  %77 = icmp ugt i32 %76, 0
  br i1 %77, label %78, label %155

78:                                               ; preds = %75
  %79 = load ptr, ptr %6, align 8
  store ptr %79, ptr %12, align 8
  %80 = load ptr, ptr %7, align 8
  store ptr %80, ptr %13, align 8
  br label %81

81:                                               ; preds = %134, %78
  %82 = load ptr, ptr %13, align 8
  %83 = load ptr, ptr %10, align 8
  %84 = icmp ult ptr %82, %83
  br i1 %84, label %85, label %139

85:                                               ; preds = %81
  %86 = load ptr, ptr %12, align 8
  %87 = load i32, ptr %11, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i16, ptr %86, i64 %88
  %90 = load i16, ptr %89, align 2
  store i16 %90, ptr %14, align 2
  %91 = load i16, ptr %14, align 2
  %92 = zext i16 %91 to i32
  %93 = mul i32 %92, 255
  %94 = add i32 %93, 32895
  %95 = lshr i32 %94, 16
  %96 = trunc i32 %95 to i8
  store i8 %96, ptr %15, align 1
  store i32 0, ptr %16, align 4
  %97 = load i8, ptr %15, align 1
  %98 = load ptr, ptr %13, align 8
  %99 = load i32, ptr %11, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i8, ptr %98, i64 %100
  store i8 %97, ptr %101, align 1
  %102 = load i8, ptr %15, align 1
  %103 = zext i8 %102 to i32
  %104 = icmp sgt i32 %103, 0
  br i1 %104, label %105, label %117

105:                                              ; preds = %85
  %106 = load i8, ptr %15, align 1
  %107 = zext i8 %106 to i32
  %108 = icmp slt i32 %107, 255
  br i1 %108, label %109, label %117

109:                                              ; preds = %105
  %110 = load i16, ptr %14, align 2
  %111 = zext i16 %110 to i32
  %112 = ashr i32 %111, 1
  %113 = add nsw i32 2139062400, %112
  %114 = load i16, ptr %14, align 2
  %115 = zext i16 %114 to i32
  %116 = sdiv i32 %113, %115
  store i32 %116, ptr %16, align 4
  br label %117

117:                                              ; preds = %109, %105, %85
  %118 = load i32, ptr %9, align 4
  store i32 %118, ptr %17, align 4
  br label %119

119:                                              ; preds = %130, %117
  %120 = load ptr, ptr %12, align 8
  %121 = getelementptr inbounds i16, ptr %120, i32 1
  store ptr %121, ptr %12, align 8
  %122 = load i16, ptr %120, align 2
  %123 = zext i16 %122 to i32
  %124 = load i16, ptr %14, align 2
  %125 = zext i16 %124 to i32
  %126 = load i32, ptr %16, align 4
  %127 = call zeroext i8 @png_unpremultiply(i32 noundef %123, i32 noundef %125, i32 noundef %126)
  %128 = load ptr, ptr %13, align 8
  %129 = getelementptr inbounds i8, ptr %128, i32 1
  store ptr %129, ptr %13, align 8
  store i8 %127, ptr %128, align 1
  br label %130

130:                                              ; preds = %119
  %131 = load i32, ptr %17, align 4
  %132 = add nsw i32 %131, -1
  store i32 %132, ptr %17, align 4
  %133 = icmp sgt i32 %132, 0
  br i1 %133, label %119, label %134, !llvm.loop !21

134:                                              ; preds = %130
  %135 = load ptr, ptr %12, align 8
  %136 = getelementptr inbounds i16, ptr %135, i32 1
  store ptr %136, ptr %12, align 8
  %137 = load ptr, ptr %13, align 8
  %138 = getelementptr inbounds i8, ptr %137, i32 1
  store ptr %138, ptr %13, align 8
  br label %81, !llvm.loop !22

139:                                              ; preds = %81
  %140 = load ptr, ptr %5, align 8
  %141 = load ptr, ptr %3, align 8
  %142 = getelementptr inbounds %struct.png_image_write_control, ptr %141, i32 0, i32 7
  %143 = load ptr, ptr %142, align 8
  call void @png_write_row(ptr noundef %140, ptr noundef %143)
  %144 = load ptr, ptr %3, align 8
  %145 = getelementptr inbounds %struct.png_image_write_control, ptr %144, i32 0, i32 6
  %146 = load i64, ptr %145, align 8
  %147 = trunc i64 %146 to i16
  %148 = zext i16 %147 to i64
  %149 = udiv i64 %148, 2
  %150 = load ptr, ptr %6, align 8
  %151 = getelementptr inbounds i16, ptr %150, i64 %149
  store ptr %151, ptr %6, align 8
  br label %152

152:                                              ; preds = %139
  %153 = load i32, ptr %8, align 4
  %154 = add i32 %153, -1
  store i32 %154, ptr %8, align 4
  br label %75, !llvm.loop !23

155:                                              ; preds = %75
  br label %219

156:                                              ; preds = %1
  %157 = load ptr, ptr %7, align 8
  %158 = load ptr, ptr %4, align 8
  %159 = getelementptr inbounds %struct.png_image, ptr %158, i32 0, i32 2
  %160 = load i32, ptr %159, align 4
  %161 = load i32, ptr %9, align 4
  %162 = mul i32 %160, %161
  %163 = zext i32 %162 to i64
  %164 = getelementptr inbounds i8, ptr %157, i64 %163
  store ptr %164, ptr %18, align 8
  br label %165

165:                                              ; preds = %215, %156
  %166 = load i32, ptr %8, align 4
  %167 = icmp ugt i32 %166, 0
  br i1 %167, label %168, label %218

168:                                              ; preds = %165
  %169 = load ptr, ptr %6, align 8
  store ptr %169, ptr %19, align 8
  %170 = load ptr, ptr %7, align 8
  store ptr %170, ptr %20, align 8
  br label %171

171:                                              ; preds = %175, %168
  %172 = load ptr, ptr %20, align 8
  %173 = load ptr, ptr %18, align 8
  %174 = icmp ult ptr %172, %173
  br i1 %174, label %175, label %204

175:                                              ; preds = %171
  %176 = load ptr, ptr %19, align 8
  %177 = getelementptr inbounds i16, ptr %176, i32 1
  store ptr %177, ptr %19, align 8
  %178 = load i16, ptr %176, align 2
  %179 = zext i16 %178 to i32
  store i32 %179, ptr %21, align 4
  %180 = load i32, ptr %21, align 4
  %181 = mul i32 %180, 255
  store i32 %181, ptr %21, align 4
  %182 = load i32, ptr %21, align 4
  %183 = lshr i32 %182, 15
  %184 = zext i32 %183 to i64
  %185 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %184
  %186 = load i16, ptr %185, align 2
  %187 = zext i16 %186 to i32
  %188 = load i32, ptr %21, align 4
  %189 = and i32 %188, 32767
  %190 = load i32, ptr %21, align 4
  %191 = lshr i32 %190, 15
  %192 = zext i32 %191 to i64
  %193 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %192
  %194 = load i8, ptr %193, align 1
  %195 = zext i8 %194 to i32
  %196 = mul i32 %189, %195
  %197 = lshr i32 %196, 12
  %198 = add i32 %187, %197
  %199 = lshr i32 %198, 8
  %200 = and i32 255, %199
  %201 = trunc i32 %200 to i8
  %202 = load ptr, ptr %20, align 8
  %203 = getelementptr inbounds i8, ptr %202, i32 1
  store ptr %203, ptr %20, align 8
  store i8 %201, ptr %202, align 1
  br label %171, !llvm.loop !24

204:                                              ; preds = %171
  %205 = load ptr, ptr %5, align 8
  %206 = load ptr, ptr %7, align 8
  call void @png_write_row(ptr noundef %205, ptr noundef %206)
  %207 = load ptr, ptr %3, align 8
  %208 = getelementptr inbounds %struct.png_image_write_control, ptr %207, i32 0, i32 6
  %209 = load i64, ptr %208, align 8
  %210 = trunc i64 %209 to i16
  %211 = zext i16 %210 to i64
  %212 = udiv i64 %211, 2
  %213 = load ptr, ptr %6, align 8
  %214 = getelementptr inbounds i16, ptr %213, i64 %212
  store ptr %214, ptr %6, align 8
  br label %215

215:                                              ; preds = %204
  %216 = load i32, ptr %8, align 4
  %217 = add i32 %216, -1
  store i32 %217, ptr %8, align 4
  br label %165, !llvm.loop !25

218:                                              ; preds = %165
  br label %219

219:                                              ; preds = %218, %155
  ret i32 1
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal zeroext i8 @png_unpremultiply(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %5, align 4
  %9 = load i32, ptr %6, align 4
  %10 = icmp uge i32 %8, %9
  br i1 %10, label %14, label %11

11:                                               ; preds = %3
  %12 = load i32, ptr %6, align 4
  %13 = icmp ult i32 %12, 128
  br i1 %13, label %14, label %15

14:                                               ; preds = %11, %3
  store i8 -1, ptr %4, align 1
  br label %54

15:                                               ; preds = %11
  %16 = load i32, ptr %5, align 4
  %17 = icmp ugt i32 %16, 0
  br i1 %17, label %18, label %53

18:                                               ; preds = %15
  %19 = load i32, ptr %6, align 4
  %20 = icmp ult i32 %19, 65407
  br i1 %20, label %21, label %29

21:                                               ; preds = %18
  %22 = load i32, ptr %7, align 4
  %23 = load i32, ptr %5, align 4
  %24 = mul i32 %23, %22
  store i32 %24, ptr %5, align 4
  %25 = load i32, ptr %5, align 4
  %26 = add i32 %25, 64
  store i32 %26, ptr %5, align 4
  %27 = load i32, ptr %5, align 4
  %28 = lshr i32 %27, 7
  store i32 %28, ptr %5, align 4
  br label %32

29:                                               ; preds = %18
  %30 = load i32, ptr %5, align 4
  %31 = mul i32 %30, 255
  store i32 %31, ptr %5, align 4
  br label %32

32:                                               ; preds = %29, %21
  %33 = load i32, ptr %5, align 4
  %34 = lshr i32 %33, 15
  %35 = zext i32 %34 to i64
  %36 = getelementptr inbounds [512 x i16], ptr @png_sRGB_base, i64 0, i64 %35
  %37 = load i16, ptr %36, align 2
  %38 = zext i16 %37 to i32
  %39 = load i32, ptr %5, align 4
  %40 = and i32 %39, 32767
  %41 = load i32, ptr %5, align 4
  %42 = lshr i32 %41, 15
  %43 = zext i32 %42 to i64
  %44 = getelementptr inbounds [512 x i8], ptr @png_sRGB_delta, i64 0, i64 %43
  %45 = load i8, ptr %44, align 1
  %46 = zext i8 %45 to i32
  %47 = mul i32 %40, %46
  %48 = lshr i32 %47, 12
  %49 = add i32 %38, %48
  %50 = lshr i32 %49, 8
  %51 = and i32 255, %50
  %52 = trunc i32 %51 to i8
  store i8 %52, ptr %4, align 1
  br label %54

53:                                               ; preds = %15
  store i8 0, ptr %4, align 1
  br label %54

54:                                               ; preds = %53, %32, %14
  %55 = load i8, ptr %4, align 1
  ret i8 %55
}

declare void @png_set_PLTE(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #1

declare void @png_set_tRNS(ptr noundef, ptr noundef, ptr noundef, i32 noundef, ptr noundef) #1

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn }
attributes #8 = { nounwind }
attributes #9 = { nounwind willreturn memory(none) }

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
