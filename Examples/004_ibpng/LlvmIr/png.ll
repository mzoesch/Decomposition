ü; ModuleID = '/mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/004_ibpng/png.c'
source_filename = "/mnt/sdb1/ba/LlvmPlugin/Plugin/Examples/004_ibpng/png.c"
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
%struct.png_text_struct = type { i32, ptr, ptr, i64, i64, ptr, ptr }
%struct.png_sPLT_struct = type { ptr, i8, ptr, i32 }
%struct.png_color_struct = type { i8, i8, i8 }
%struct.png_XYZ = type { i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.png_image = type { ptr, i32, i32, i32, i32, i32, i32, i32, [64 x i8] }
%struct.png_control = type { ptr, ptr, ptr, ptr, i64, i8 }

@.str = private unnamed_addr constant [33 x i8] c"Too many bytes for PNG signature\00", align 1
@png_sig_cmp.png_signature = internal constant [8 x i8] c"\89PNG\0D\0A\1A\0A", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"Potential overflow in png_zalloc()\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"1.6.48.git\00", align 1
@.str.3 = private unnamed_addr constant [31 x i8] c"Application built with libpng-\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c" but running with \00", align 1
@.str.5 = private unnamed_addr constant [42 x i8] c"Unknown freer parameter in png_data_freer\00", align 1
@png_convert_to_rfc1123_buffer.short_months = internal constant [12 x [4 x i8]] [[4 x i8] c"Jan\00", [4 x i8] c"Feb\00", [4 x i8] c"Mar\00", [4 x i8] c"Apr\00", [4 x i8] c"May\00", [4 x i8] c"Jun\00", [4 x i8] c"Jul\00", [4 x i8] c"Aug\00", [4 x i8] c"Sep\00", [4 x i8] c"Oct\00", [4 x i8] c"Nov\00", [4 x i8] c"Dec\00"], align 16
@.str.6 = private unnamed_addr constant [7 x i8] c" +0000\00", align 1
@.str.7 = private unnamed_addr constant [28 x i8] c"Ignoring invalid time value\00", align 1
@.str.8 = private unnamed_addr constant [223 x i8] c"\0Alibpng version 1.6.48.git\0ACopyright (c) 2018-2025 Cosmin Truta\0ACopyright (c) 1998-2002,2004,2006-2018 Glenn Randers-Pehrson\0ACopyright (c) 1996-1997 Andreas Dilger\0ACopyright (c) 1995-1996 Guy Eric Schalnat, Group 42, Inc.\0A\00", align 1
@.str.9 = private unnamed_addr constant [29 x i8] c" libpng version 1.6.48.git\0A\0A\00", align 1
@.str.10 = private unnamed_addr constant [28 x i8] c"unexpected zlib return code\00", align 1
@.str.11 = private unnamed_addr constant [28 x i8] c"unexpected end of LZ stream\00", align 1
@.str.12 = private unnamed_addr constant [22 x i8] c"missing LZ dictionary\00", align 1
@.str.13 = private unnamed_addr constant [14 x i8] c"zlib IO error\00", align 1
@.str.14 = private unnamed_addr constant [23 x i8] c"bad parameters to zlib\00", align 1
@.str.15 = private unnamed_addr constant [18 x i8] c"damaged LZ stream\00", align 1
@.str.16 = private unnamed_addr constant [20 x i8] c"insufficient memory\00", align 1
@.str.17 = private unnamed_addr constant [10 x i8] c"truncated\00", align 1
@.str.18 = private unnamed_addr constant [25 x i8] c"unsupported zlib version\00", align 1
@.str.19 = private unnamed_addr constant [23 x i8] c"unexpected zlib return\00", align 1
@.str.20 = private unnamed_addr constant [17 x i8] c"profile too long\00", align 1
@.str.21 = private unnamed_addr constant [30 x i8] c"length does not match profile\00", align 1
@.str.22 = private unnamed_addr constant [15 x i8] c"invalid length\00", align 1
@.str.23 = private unnamed_addr constant [20 x i8] c"tag count too large\00", align 1
@.str.24 = private unnamed_addr constant [25 x i8] c"invalid rendering intent\00", align 1
@.str.25 = private unnamed_addr constant [29 x i8] c"intent outside defined range\00", align 1
@.str.26 = private unnamed_addr constant [18 x i8] c"invalid signature\00", align 1
@D50_nCIEXYZ = internal constant [12 x i8] c"\00\00\F6\D6\00\01\00\00\00\00\D3-", align 1
@.str.27 = private unnamed_addr constant [26 x i8] c"PCS illuminant is not D50\00", align 1
@.str.28 = private unnamed_addr constant [47 x i8] c"RGB color space not permitted on grayscale PNG\00", align 1
@.str.29 = private unnamed_addr constant [42 x i8] c"Gray color space not permitted on RGB PNG\00", align 1
@.str.30 = private unnamed_addr constant [32 x i8] c"invalid ICC profile color space\00", align 1
@.str.31 = private unnamed_addr constant [38 x i8] c"invalid embedded Abstract ICC profile\00", align 1
@.str.32 = private unnamed_addr constant [40 x i8] c"unexpected DeviceLink ICC profile class\00", align 1
@.str.33 = private unnamed_addr constant [40 x i8] c"unexpected NamedColor ICC profile class\00", align 1
@.str.34 = private unnamed_addr constant [31 x i8] c"unrecognized ICC profile class\00", align 1
@.str.35 = private unnamed_addr constant [28 x i8] c"unexpected ICC PCS encoding\00", align 1
@.str.36 = private unnamed_addr constant [32 x i8] c"ICC profile tag outside profile\00", align 1
@.str.37 = private unnamed_addr constant [42 x i8] c"ICC profile tag start not a multiple of 4\00", align 1
@.str.38 = private unnamed_addr constant [42 x i8] c"internal error handling cHRM coefficients\00", align 1
@.str.39 = private unnamed_addr constant [28 x i8] c"Image width is zero in IHDR\00", align 1
@.str.40 = private unnamed_addr constant [28 x i8] c"Invalid image width in IHDR\00", align 1
@.str.41 = private unnamed_addr constant [47 x i8] c"Image width is too large for this architecture\00", align 1
@.str.42 = private unnamed_addr constant [39 x i8] c"Image width exceeds user limit in IHDR\00", align 1
@.str.43 = private unnamed_addr constant [29 x i8] c"Image height is zero in IHDR\00", align 1
@.str.44 = private unnamed_addr constant [29 x i8] c"Invalid image height in IHDR\00", align 1
@.str.45 = private unnamed_addr constant [40 x i8] c"Image height exceeds user limit in IHDR\00", align 1
@.str.46 = private unnamed_addr constant [26 x i8] c"Invalid bit depth in IHDR\00", align 1
@.str.47 = private unnamed_addr constant [27 x i8] c"Invalid color type in IHDR\00", align 1
@.str.48 = private unnamed_addr constant [49 x i8] c"Invalid color type/bit depth combination in IHDR\00", align 1
@.str.49 = private unnamed_addr constant [33 x i8] c"Unknown interlace method in IHDR\00", align 1
@.str.50 = private unnamed_addr constant [35 x i8] c"Unknown compression method in IHDR\00", align 1
@.str.51 = private unnamed_addr constant [49 x i8] c"MNG features are not allowed in a PNG datastream\00", align 1
@.str.52 = private unnamed_addr constant [30 x i8] c"Unknown filter method in IHDR\00", align 1
@.str.53 = private unnamed_addr constant [30 x i8] c"Invalid filter method in IHDR\00", align 1
@.str.54 = private unnamed_addr constant [18 x i8] c"Invalid IHDR data\00", align 1
@.str.55 = private unnamed_addr constant [34 x i8] c"ASCII conversion buffer too small\00", align 1
@.str.56 = private unnamed_addr constant [26 x i8] c"gamma table being rebuilt\00", align 1
@png_sRGB_table = constant [256 x i16] [i16 0, i16 20, i16 40, i16 60, i16 80, i16 99, i16 119, i16 139, i16 159, i16 179, i16 199, i16 219, i16 241, i16 264, i16 288, i16 313, i16 340, i16 367, i16 396, i16 427, i16 458, i16 491, i16 526, i16 562, i16 599, i16 637, i16 677, i16 718, i16 761, i16 805, i16 851, i16 898, i16 947, i16 997, i16 1048, i16 1101, i16 1156, i16 1212, i16 1270, i16 1330, i16 1391, i16 1453, i16 1517, i16 1583, i16 1651, i16 1720, i16 1790, i16 1863, i16 1937, i16 2013, i16 2090, i16 2170, i16 2250, i16 2333, i16 2418, i16 2504, i16 2592, i16 2681, i16 2773, i16 2866, i16 2961, i16 3058, i16 3157, i16 3258, i16 3360, i16 3464, i16 3570, i16 3678, i16 3788, i16 3900, i16 4014, i16 4129, i16 4247, i16 4366, i16 4488, i16 4611, i16 4736, i16 4864, i16 4993, i16 5124, i16 5257, i16 5392, i16 5530, i16 5669, i16 5810, i16 5953, i16 6099, i16 6246, i16 6395, i16 6547, i16 6700, i16 6856, i16 7014, i16 7174, i16 7335, i16 7500, i16 7666, i16 7834, i16 8004, i16 8177, i16 8352, i16 8528, i16 8708, i16 8889, i16 9072, i16 9258, i16 9445, i16 9635, i16 9828, i16 10022, i16 10219, i16 10417, i16 10619, i16 10822, i16 11028, i16 11235, i16 11446, i16 11658, i16 11873, i16 12090, i16 12309, i16 12530, i16 12754, i16 12980, i16 13209, i16 13440, i16 13673, i16 13909, i16 14146, i16 14387, i16 14629, i16 14874, i16 15122, i16 15371, i16 15623, i16 15878, i16 16135, i16 16394, i16 16656, i16 16920, i16 17187, i16 17456, i16 17727, i16 18001, i16 18277, i16 18556, i16 18837, i16 19121, i16 19407, i16 19696, i16 19987, i16 20281, i16 20577, i16 20876, i16 21177, i16 21481, i16 21787, i16 22096, i16 22407, i16 22721, i16 23038, i16 23357, i16 23678, i16 24002, i16 24329, i16 24658, i16 24990, i16 25325, i16 25662, i16 26001, i16 26344, i16 26688, i16 27036, i16 27386, i16 27739, i16 28094, i16 28452, i16 28813, i16 29176, i16 29542, i16 29911, i16 30282, i16 30656, i16 31033, i16 31412, i16 31794, i16 32179, i16 32567, i16 -32579, i16 -32186, i16 -31791, i16 -31393, i16 -30992, i16 -30588, i16 -30181, i16 -29772, i16 -29360, i16 -28945, i16 -28528, i16 -28107, i16 -27684, i16 -27258, i16 -26830, i16 -26398, i16 -25964, i16 -25527, i16 -25087, i16 -24645, i16 -24199, i16 -23751, i16 -23300, i16 -22846, i16 -22389, i16 -21930, i16 -21467, i16 -21002, i16 -20534, i16 -20063, i16 -19589, i16 -19113, i16 -18633, i16 -18151, i16 -17665, i16 -17177, i16 -16686, i16 -16192, i16 -15695, i16 -15195, i16 -14692, i16 -14187, i16 -13678, i16 -13167, i16 -12652, i16 -12135, i16 -11615, i16 -11091, i16 -10565, i16 -10036, i16 -9504, i16 -8969, i16 -8431, i16 -7890, i16 -7346, i16 -6799, i16 -6249, i16 -5696, i16 -5140, i16 -4581, i16 -4019, i16 -3454, i16 -2886, i16 -2315, i16 -1741, i16 -1164, i16 -584, i16 -1], align 16
@png_sRGB_base = constant [512 x i16] [i16 128, i16 1782, i16 3383, i16 4644, i16 5675, i16 6564, i16 7357, i16 8074, i16 8732, i16 9346, i16 9921, i16 10463, i16 10977, i16 11466, i16 11935, i16 12384, i16 12816, i16 13233, i16 13634, i16 14024, i16 14402, i16 14769, i16 15125, i16 15473, i16 15812, i16 16142, i16 16466, i16 16781, i16 17090, i16 17393, i16 17690, i16 17981, i16 18266, i16 18546, i16 18822, i16 19093, i16 19359, i16 19621, i16 19879, i16 20133, i16 20383, i16 20630, i16 20873, i16 21113, i16 21349, i16 21583, i16 21813, i16 22041, i16 22265, i16 22487, i16 22707, i16 22923, i16 23138, i16 23350, i16 23559, i16 23767, i16 23972, i16 24175, i16 24376, i16 24575, i16 24772, i16 24967, i16 25160, i16 25352, i16 25542, i16 25730, i16 25916, i16 26101, i16 26284, i16 26465, i16 26645, i16 26823, i16 27000, i16 27176, i16 27350, i16 27523, i16 27695, i16 27865, i16 28034, i16 28201, i16 28368, i16 28533, i16 28697, i16 28860, i16 29021, i16 29182, i16 29341, i16 29500, i16 29657, i16 29813, i16 29969, i16 30123, i16 30276, i16 30429, i16 30580, i16 30730, i16 30880, i16 31028, i16 31176, i16 31323, i16 31469, i16 31614, i16 31758, i16 31902, i16 32045, i16 32186, i16 32327, i16 32468, i16 32607, i16 32746, i16 -32652, i16 -32515, i16 -32378, i16 -32242, i16 -32107, i16 -31972, i16 -31839, i16 -31705, i16 -31573, i16 -31441, i16 -31310, i16 -31179, i16 -31050, i16 -30920, i16 -30792, i16 -30663, i16 -30536, i16 -30409, i16 -30283, i16 -30157, i16 -30032, i16 -29907, i16 -29783, i16 -29660, i16 -29537, i16 -29414, i16 -29292, i16 -29171, i16 -29050, i16 -28930, i16 -28810, i16 -28691, i16 -28572, i16 -28453, i16 -28335, i16 -28218, i16 -28101, i16 -27985, i16 -27868, i16 -27753, i16 -27638, i16 -27523, i16 -27409, i16 -27295, i16 -27182, i16 -27069, i16 -26956, i16 -26844, i16 -26733, i16 -26621, i16 -26510, i16 -26400, i16 -26290, i16 -26180, i16 -26071, i16 -25962, i16 -25854, i16 -25746, i16 -25638, i16 -25531, i16 -25424, i16 -25317, i16 -25211, i16 -25105, i16 -24999, i16 -24894, i16 -24789, i16 -24685, i16 -24581, i16 -24477, i16 -24373, i16 -24270, i16 -24167, i16 -24065, i16 -23963, i16 -23861, i16 -23759, i16 -23658, i16 -23557, i16 -23457, i16 -23357, i16 -23257, i16 -23157, i16 -23058, i16 -22959, i16 -22860, i16 -22761, i16 -22663, i16 -22565, i16 -22468, i16 -22371, i16 -22274, i16 -22177, i16 -22080, i16 -21984, i16 -21888, i16 -21793, i16 -21697, i16 -21602, i16 -21508, i16 -21413, i16 -21319, i16 -21225, i16 -21131, i16 -21037, i16 -20944, i16 -20851, i16 -20758, i16 -20666, i16 -20574, i16 -20482, i16 -20390, i16 -20298, i16 -20207, i16 -20116, i16 -20025, i16 -19935, i16 -19844, i16 -19754, i16 -19664, i16 -19575, i16 -19485, i16 -19396, i16 -19307, i16 -19218, i16 -19130, i16 -19042, i16 -18953, i16 -18866, i16 -18778, i16 -18690, i16 -18603, i16 -18516, i16 -18429, i16 -18343, i16 -18256, i16 -18170, i16 -18084, i16 -17998, i16 -17913, i16 -17827, i16 -17742, i16 -17657, i16 -17572, i16 -17488, i16 -17403, i16 -17319, i16 -17235, i16 -17151, i16 -17068, i16 -16984, i16 -16901, i16 -16818, i16 -16735, i16 -16652, i16 -16570, i16 -16488, i16 -16405, i16 -16323, i16 -16242, i16 -16160, i16 -16078, i16 -15997, i16 -15916, i16 -15835, i16 -15754, i16 -15674, i16 -15593, i16 -15513, i16 -15433, i16 -15353, i16 -15273, i16 -15194, i16 -15114, i16 -15035, i16 -14956, i16 -14877, i16 -14798, i16 -14720, i16 -14641, i16 -14563, i16 -14485, i16 -14407, i16 -14329, i16 -14251, i16 -14174, i16 -14097, i16 -14019, i16 -13942, i16 -13865, i16 -13789, i16 -13712, i16 -13636, i16 -13559, i16 -13483, i16 -13407, i16 -13331, i16 -13256, i16 -13180, i16 -13104, i16 -13029, i16 -12954, i16 -12879, i16 -12804, i16 -12729, i16 -12655, i16 -12580, i16 -12506, i16 -12432, i16 -12358, i16 -12284, i16 -12210, i16 -12136, i16 -12063, i16 -11990, i16 -11916, i16 -11843, i16 -11770, i16 -11697, i16 -11625, i16 -11552, i16 -11480, i16 -11407, i16 -11335, i16 -11263, i16 -11191, i16 -11119, i16 -11047, i16 -10976, i16 -10904, i16 -10833, i16 -10762, i16 -10691, i16 -10620, i16 -10549, i16 -10478, i16 -10407, i16 -10337, i16 -10267, i16 -10196, i16 -10126, i16 -10056, i16 -9986, i16 -9916, i16 -9847, i16 -9777, i16 -9708, i16 -9638, i16 -9569, i16 -9500, i16 -9431, i16 -9362, i16 -9293, i16 -9225, i16 -9156, i16 -9088, i16 -9019, i16 -8951, i16 -8883, i16 -8815, i16 -8747, i16 -8679, i16 -8612, i16 -8544, i16 -8477, i16 -8409, i16 -8342, i16 -8275, i16 -8208, i16 -8141, i16 -8074, i16 -8007, i16 -7941, i16 -7874, i16 -7808, i16 -7741, i16 -7675, i16 -7609, i16 -7543, i16 -7477, i16 -7411, i16 -7345, i16 -7280, i16 -7214, i16 -7149, i16 -7083, i16 -7018, i16 -6953, i16 -6888, i16 -6823, i16 -6758, i16 -6693, i16 -6628, i16 -6564, i16 -6499, i16 -6435, i16 -6371, i16 -6306, i16 -6242, i16 -6178, i16 -6114, i16 -6050, i16 -5987, i16 -5923, i16 -5859, i16 -5796, i16 -5732, i16 -5669, i16 -5606, i16 -5543, i16 -5480, i16 -5417, i16 -5354, i16 -5291, i16 -5228, i16 -5166, i16 -5103, i16 -5041, i16 -4978, i16 -4916, i16 -4854, i16 -4792, i16 -4730, i16 -4668, i16 -4606, i16 -4544, i16 -4482, i16 -4421, i16 -4359, i16 -4298, i16 -4236, i16 -4175, i16 -4114, i16 -4053, i16 -3992, i16 -3931, i16 -3870, i16 -3809, i16 -3748, i16 -3688, i16 -3627, i16 -3567, i16 -3506, i16 -3446, i16 -3386, i16 -3325, i16 -3265, i16 -3205, i16 -3145, i16 -3086, i16 -3026, i16 -2966, i16 -2906, i16 -2847, i16 -2787, i16 -2728, i16 -2669, i16 -2609, i16 -2550, i16 -2491, i16 -2432, i16 -2373, i16 -2314, i16 -2255, i16 -2196, i16 -2138, i16 -2079, i16 -2021, i16 -1962, i16 -1904, i16 -1845, i16 -1787, i16 -1729, i16 -1671, i16 -1613, i16 -1555, i16 -1497, i16 -1439, i16 -1381, i16 -1324, i16 -1266, i16 -1208, i16 -1151, i16 -1093, i16 -1036, i16 -979, i16 -922, i16 -864, i16 -807, i16 -750, i16 -693, i16 -636, i16 -580, i16 -523, i16 -466, i16 -410, i16 -353, i16 -297, i16 -240, i16 -184, i16 -127, i16 -71], align 16
@png_sRGB_delta = constant [512 x i8] c"\CF\C9\9E\81qdZRMHD@=;86421/.-+*)(''&%$$#\22\22!!  \1F\1F\1E\1E\1E\1D\1D\1C\1C\1C\1B\1B\1B\1B\1A\1A\1A\19\19\19\19\18\18\18\18\17\17\17\17\17\16\16\16\16\16\16\15\15\15\15\15\15\14\14\14\14\14\14\14\14\13\13\13\13\13\13\13\13\12\12\12\12\12\12\12\12\12\12\11\11\11\11\11\11\11\11\11\11\11\10\10\10\10\10\10\10\10\10\10\10\10\10\10\0F\0F\0F\0F\0F\0F\0F\0F\0F\0F\0F\0F\0F\0F\0F\0F\0E\0E\0E\0E\0E\0E\0E\0E\0E\0E\0E\0E\0E\0E\0E\0E\0E\0E\0E\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0D\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0C\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0B\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\0A\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\09\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07", align 16
@.str.57 = private unnamed_addr constant [10 x i8] c"too short\00", align 1
@.str.58 = private unnamed_addr constant [10 x i8] c"profile '\00", align 1
@.str.59 = private unnamed_addr constant [4 x i8] c"': \00", align 1
@.str.60 = private unnamed_addr constant [4 x i8] c"h: \00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_sig_bytes(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %4, align 4
  store i32 %6, ptr %5, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = icmp eq ptr %7, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  br label %24

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %10
  store i32 0, ptr %5, align 4
  br label %14

14:                                               ; preds = %13, %10
  %15 = load i32, ptr %5, align 4
  %16 = icmp ugt i32 %15, 8
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = load ptr, ptr %3, align 8
  call void @png_error(ptr noundef %18, ptr noundef @.str) #10
  unreachable

19:                                               ; preds = %14
  %20 = load i32, ptr %5, align 4
  %21 = trunc i32 %20 to i8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.png_struct_def, ptr %22, i32 0, i32 68
  store i8 %21, ptr %23, align 1
  br label %24

24:                                               ; preds = %19, %9
  ret void
}

; Function Attrs: noreturn
declare void @png_error(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_sig_cmp(ptr noundef %0, i64 noundef %1, i64 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %8 = load i64, ptr %7, align 8
  %9 = icmp ugt i64 %8, 8
  br i1 %9, label %10, label %11

10:                                               ; preds = %3
  store i64 8, ptr %7, align 8
  br label %16

11:                                               ; preds = %3
  %12 = load i64, ptr %7, align 8
  %13 = icmp ult i64 %12, 1
  br i1 %13, label %14, label %15

14:                                               ; preds = %11
  store i32 -1, ptr %4, align 4
  br label %36

15:                                               ; preds = %11
  br label %16

16:                                               ; preds = %15, %10
  %17 = load i64, ptr %6, align 8
  %18 = icmp ugt i64 %17, 7
  br i1 %18, label %19, label %20

19:                                               ; preds = %16
  store i32 -1, ptr %4, align 4
  br label %36

20:                                               ; preds = %16
  %21 = load i64, ptr %6, align 8
  %22 = load i64, ptr %7, align 8
  %23 = add i64 %21, %22
  %24 = icmp ugt i64 %23, 8
  br i1 %24, label %25, label %28

25:                                               ; preds = %20
  %26 = load i64, ptr %6, align 8
  %27 = sub i64 8, %26
  store i64 %27, ptr %7, align 8
  br label %28

28:                                               ; preds = %25, %20
  %29 = load ptr, ptr %5, align 8
  %30 = load i64, ptr %6, align 8
  %31 = getelementptr inbounds i8, ptr %29, i64 %30
  %32 = load i64, ptr %6, align 8
  %33 = getelementptr inbounds [8 x i8], ptr @png_sig_cmp.png_signature, i64 0, i64 %32
  %34 = load i64, ptr %7, align 8
  %35 = call i32 @memcmp(ptr noundef %31, ptr noundef %33, i64 noundef %34) #11
  store i32 %35, ptr %4, align 4
  br label %36

36:                                               ; preds = %28, %19, %14
  %37 = load i32, ptr %4, align 4
  ret i32 %37
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define noalias ptr @png_zalloc(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %9 = load i32, ptr %7, align 4
  %10 = zext i32 %9 to i64
  store i64 %10, ptr %8, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %3
  store ptr null, ptr %4, align 8
  br label %31

14:                                               ; preds = %3
  %15 = load i32, ptr %6, align 4
  %16 = zext i32 %15 to i64
  %17 = load i32, ptr %7, align 4
  %18 = zext i32 %17 to i64
  %19 = udiv i64 -1, %18
  %20 = icmp uge i64 %16, %19
  br i1 %20, label %21, label %23

21:                                               ; preds = %14
  %22 = load ptr, ptr %5, align 8
  call void @png_warning(ptr noundef %22, ptr noundef @.str.1)
  store ptr null, ptr %4, align 8
  br label %31

23:                                               ; preds = %14
  %24 = load i32, ptr %6, align 4
  %25 = zext i32 %24 to i64
  %26 = load i64, ptr %8, align 8
  %27 = mul i64 %26, %25
  store i64 %27, ptr %8, align 8
  %28 = load ptr, ptr %5, align 8
  %29 = load i64, ptr %8, align 8
  %30 = call noalias ptr @png_malloc_warn(ptr noundef %28, i64 noundef %29)
  store ptr %30, ptr %4, align 8
  br label %31

31:                                               ; preds = %23, %21, %13
  %32 = load ptr, ptr %4, align 8
  ret ptr %32
}

declare void @png_warning(ptr noundef, ptr noundef) #3

declare noalias ptr @png_malloc_warn(ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_zfree(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8
  call void @png_free(ptr noundef %5, ptr noundef %6)
  ret void
}

declare void @png_free(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_reset_crc(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = call i64 @crc32(i64 noundef 0, ptr noundef null, i32 noundef 0)
  %4 = trunc i64 %3 to i32
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds %struct.png_struct_def, ptr %5, i32 0, i32 52
  store i32 %4, ptr %6, align 4
  ret void
}

declare i64 @crc32(i64 noundef, ptr noundef, i32 noundef) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_calculate_crc(ptr noalias noundef %0, ptr noundef %1, i64 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  store i32 1, ptr %7, align 4
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 45
  %12 = load i32, ptr %11, align 8
  %13 = lshr i32 %12, 29
  %14 = and i32 1, %13
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %24

16:                                               ; preds = %3
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds %struct.png_struct_def, ptr %17, i32 0, i32 16
  %19 = load i32, ptr %18, align 8
  %20 = and i32 %19, 768
  %21 = icmp eq i32 %20, 768
  br i1 %21, label %22, label %23

22:                                               ; preds = %16
  store i32 0, ptr %7, align 4
  br label %23

23:                                               ; preds = %22, %16
  br label %32

24:                                               ; preds = %3
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds %struct.png_struct_def, ptr %25, i32 0, i32 16
  %27 = load i32, ptr %26, align 8
  %28 = and i32 %27, 2048
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %24
  store i32 0, ptr %7, align 4
  br label %31

31:                                               ; preds = %30, %24
  br label %32

32:                                               ; preds = %31, %23
  %33 = load i32, ptr %7, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %70

35:                                               ; preds = %32
  %36 = load i64, ptr %6, align 8
  %37 = icmp ugt i64 %36, 0
  br i1 %37, label %38, label %70

38:                                               ; preds = %35
  %39 = load ptr, ptr %4, align 8
  %40 = getelementptr inbounds %struct.png_struct_def, ptr %39, i32 0, i32 52
  %41 = load i32, ptr %40, align 4
  %42 = zext i32 %41 to i64
  store i64 %42, ptr %8, align 8
  br label %43

43:                                               ; preds = %62, %38
  %44 = load i64, ptr %6, align 8
  %45 = trunc i64 %44 to i32
  store i32 %45, ptr %9, align 4
  %46 = load i32, ptr %9, align 4
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %49

48:                                               ; preds = %43
  store i32 -1, ptr %9, align 4
  br label %49

49:                                               ; preds = %48, %43
  %50 = load i64, ptr %8, align 8
  %51 = load ptr, ptr %5, align 8
  %52 = load i32, ptr %9, align 4
  %53 = call i64 @crc32(i64 noundef %50, ptr noundef %51, i32 noundef %52)
  store i64 %53, ptr %8, align 8
  %54 = load i32, ptr %9, align 4
  %55 = load ptr, ptr %5, align 8
  %56 = zext i32 %54 to i64
  %57 = getelementptr inbounds i8, ptr %55, i64 %56
  store ptr %57, ptr %5, align 8
  %58 = load i32, ptr %9, align 4
  %59 = zext i32 %58 to i64
  %60 = load i64, ptr %6, align 8
  %61 = sub i64 %60, %59
  store i64 %61, ptr %6, align 8
  br label %62

62:                                               ; preds = %49
  %63 = load i64, ptr %6, align 8
  %64 = icmp ugt i64 %63, 0
  br i1 %64, label %43, label %65, !llvm.loop !5

65:                                               ; preds = %62
  %66 = load i64, ptr %8, align 8
  %67 = trunc i64 %66 to i32
  %68 = load ptr, ptr %4, align 8
  %69 = getelementptr inbounds %struct.png_struct_def, ptr %68, i32 0, i32 52
  store i32 %67, ptr %69, align 4
  br label %70

70:                                               ; preds = %65, %35, %32
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_user_version_check(ptr noalias noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca [128 x i8], align 16
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %66

12:                                               ; preds = %2
  store i32 -1, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %13

13:                                               ; preds = %63, %12
  %14 = load i32, ptr %6, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %6, align 4
  %16 = load ptr, ptr %5, align 8
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8, ptr %16, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i32
  %22 = load i32, ptr %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [11 x i8], ptr @.str.2, i64 0, i64 %23
  %25 = load i8, ptr %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %21, %26
  br i1 %27, label %28, label %33

28:                                               ; preds = %13
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds %struct.png_struct_def, ptr %29, i32 0, i32 16
  %31 = load i32, ptr %30, align 8
  %32 = or i32 %31, 131072
  store i32 %32, ptr %30, align 8
  br label %33

33:                                               ; preds = %28, %13
  %34 = load ptr, ptr %5, align 8
  %35 = load i32, ptr %6, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, ptr %34, i64 %36
  %38 = load i8, ptr %37, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp eq i32 %39, 46
  br i1 %40, label %41, label %44

41:                                               ; preds = %33
  %42 = load i32, ptr %7, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %7, align 4
  br label %44

44:                                               ; preds = %41, %33
  br label %45

45:                                               ; preds = %44
  %46 = load i32, ptr %7, align 4
  %47 = icmp slt i32 %46, 2
  br i1 %47, label %48, label %63

48:                                               ; preds = %45
  %49 = load ptr, ptr %5, align 8
  %50 = load i32, ptr %6, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, ptr %49, i64 %51
  %53 = load i8, ptr %52, align 1
  %54 = sext i8 %53 to i32
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %63

56:                                               ; preds = %48
  %57 = load i32, ptr %6, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [11 x i8], ptr @.str.2, i64 0, i64 %58
  %60 = load i8, ptr %59, align 1
  %61 = sext i8 %60 to i32
  %62 = icmp ne i32 %61, 0
  br label %63

63:                                               ; preds = %56, %48, %45
  %64 = phi i1 [ false, %48 ], [ false, %45 ], [ %62, %56 ]
  br i1 %64, label %13, label %65, !llvm.loop !7

65:                                               ; preds = %63
  br label %71

66:                                               ; preds = %2
  %67 = load ptr, ptr %4, align 8
  %68 = getelementptr inbounds %struct.png_struct_def, ptr %67, i32 0, i32 16
  %69 = load i32, ptr %68, align 8
  %70 = or i32 %69, 131072
  store i32 %70, ptr %68, align 8
  br label %71

71:                                               ; preds = %66, %65
  %72 = load ptr, ptr %4, align 8
  %73 = getelementptr inbounds %struct.png_struct_def, ptr %72, i32 0, i32 16
  %74 = load i32, ptr %73, align 8
  %75 = and i32 %74, 131072
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %77, label %94

77:                                               ; preds = %71
  store i64 0, ptr %8, align 8
  %78 = getelementptr inbounds [128 x i8], ptr %9, i64 0, i64 0
  %79 = load i64, ptr %8, align 8
  %80 = call i64 @png_safecat(ptr noundef %78, i64 noundef 128, i64 noundef %79, ptr noundef @.str.3)
  store i64 %80, ptr %8, align 8
  %81 = getelementptr inbounds [128 x i8], ptr %9, i64 0, i64 0
  %82 = load i64, ptr %8, align 8
  %83 = load ptr, ptr %5, align 8
  %84 = call i64 @png_safecat(ptr noundef %81, i64 noundef 128, i64 noundef %82, ptr noundef %83)
  store i64 %84, ptr %8, align 8
  %85 = getelementptr inbounds [128 x i8], ptr %9, i64 0, i64 0
  %86 = load i64, ptr %8, align 8
  %87 = call i64 @png_safecat(ptr noundef %85, i64 noundef 128, i64 noundef %86, ptr noundef @.str.4)
  store i64 %87, ptr %8, align 8
  %88 = getelementptr inbounds [128 x i8], ptr %9, i64 0, i64 0
  %89 = load i64, ptr %8, align 8
  %90 = call i64 @png_safecat(ptr noundef %88, i64 noundef 128, i64 noundef %89, ptr noundef @.str.2)
  store i64 %90, ptr %8, align 8
  %91 = load i64, ptr %8, align 8
  %92 = load ptr, ptr %4, align 8
  %93 = getelementptr inbounds [128 x i8], ptr %9, i64 0, i64 0
  call void @png_warning(ptr noundef %92, ptr noundef %93)
  store i32 0, ptr %3, align 4
  br label %95

94:                                               ; preds = %71
  store i32 1, ptr %3, align 4
  br label %95

95:                                               ; preds = %94, %77
  %96 = load i32, ptr %3, align 4
  ret i32 %96
}

declare i64 @png_safecat(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define noalias ptr @png_create_png_struct(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5, ptr noundef %6) #0 {
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca %struct.png_struct_def, align 8
  %17 = alloca [1 x %struct.__jmp_buf_tag], align 16
  %18 = alloca ptr, align 8
  store ptr %0, ptr %9, align 8
  store ptr %1, ptr %10, align 8
  store ptr %2, ptr %11, align 8
  store ptr %3, ptr %12, align 8
  store ptr %4, ptr %13, align 8
  store ptr %5, ptr %14, align 8
  store ptr %6, ptr %15, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %16, i8 0, i64 1240, i1 false)
  %19 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 138
  store i32 1000000, ptr %19, align 4
  %20 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 139
  store i32 1000000, ptr %20, align 8
  %21 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 140
  store i32 1000, ptr %21, align 4
  %22 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 141
  store i64 8000000, ptr %22, align 8
  %23 = load ptr, ptr %13, align 8
  %24 = load ptr, ptr %14, align 8
  %25 = load ptr, ptr %15, align 8
  call void @png_set_mem_fn(ptr noundef %16, ptr noundef %23, ptr noundef %24, ptr noundef %25)
  %26 = load ptr, ptr %10, align 8
  %27 = load ptr, ptr %11, align 8
  %28 = load ptr, ptr %12, align 8
  call void @png_set_error_fn(ptr noundef %16, ptr noundef %26, ptr noundef %27, ptr noundef %28)
  %29 = getelementptr inbounds [1 x %struct.__jmp_buf_tag], ptr %17, i64 0, i64 0
  %30 = call i32 @_setjmp(ptr noundef %29) #12
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %58, label %32

32:                                               ; preds = %7
  %33 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 2
  store ptr %17, ptr %33, align 8
  %34 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 3
  store i64 0, ptr %34, align 8
  %35 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 1
  store ptr @longjmp, ptr %35, align 8
  %36 = load ptr, ptr %9, align 8
  %37 = call i32 @png_user_version_check(ptr noundef %16, ptr noundef %36)
  %38 = icmp ne i32 %37, 0
  br i1 %38, label %39, label %57

39:                                               ; preds = %32
  %40 = call noalias ptr @png_malloc_warn(ptr noundef %16, i64 noundef 1240)
  store ptr %40, ptr %18, align 8
  %41 = load ptr, ptr %18, align 8
  %42 = icmp ne ptr %41, null
  br i1 %42, label %43, label %56

43:                                               ; preds = %39
  %44 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 19
  %45 = getelementptr inbounds %struct.z_stream_s, ptr %44, i32 0, i32 8
  store ptr @png_zalloc, ptr %45, align 8
  %46 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 19
  %47 = getelementptr inbounds %struct.z_stream_s, ptr %46, i32 0, i32 9
  store ptr @png_zfree, ptr %47, align 8
  %48 = load ptr, ptr %18, align 8
  %49 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 19
  %50 = getelementptr inbounds %struct.z_stream_s, ptr %49, i32 0, i32 10
  store ptr %48, ptr %50, align 8
  %51 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 2
  store ptr null, ptr %51, align 8
  %52 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 3
  store i64 0, ptr %52, align 8
  %53 = getelementptr inbounds %struct.png_struct_def, ptr %16, i32 0, i32 1
  store ptr null, ptr %53, align 8
  %54 = load ptr, ptr %18, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %54, ptr align 8 %16, i64 1240, i1 false)
  %55 = load ptr, ptr %18, align 8
  store ptr %55, ptr %8, align 8
  br label %59

56:                                               ; preds = %39
  br label %57

57:                                               ; preds = %56, %32
  br label %58

58:                                               ; preds = %57, %7
  store ptr null, ptr %8, align 8
  br label %59

59:                                               ; preds = %58, %43
  %60 = load ptr, ptr %8, align 8
  ret ptr %60
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

declare void @png_set_mem_fn(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #3

declare void @png_set_error_fn(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #3

; Function Attrs: nounwind returns_twice
declare i32 @_setjmp(ptr noundef) #5

; Function Attrs: noreturn nounwind
declare void @longjmp(ptr noundef, i32 noundef) #6

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #7

; Function Attrs: noinline nounwind sspstrong uwtable
define noalias ptr @png_create_info_struct(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp eq ptr %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %1
  store ptr null, ptr %2, align 8
  br label %17

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = call noalias ptr @png_malloc_base(ptr noundef %9, i64 noundef 352)
  store ptr %10, ptr %4, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %15

13:                                               ; preds = %8
  %14 = load ptr, ptr %4, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %14, i8 0, i64 352, i1 false)
  br label %15

15:                                               ; preds = %13, %8
  %16 = load ptr, ptr %4, align 8
  store ptr %16, ptr %2, align 8
  br label %17

17:                                               ; preds = %15, %7
  %18 = load ptr, ptr %2, align 8
  ret ptr %18
}

declare noalias ptr @png_malloc_base(ptr noundef, i64 noundef) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_destroy_info_struct(ptr noalias noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store ptr null, ptr %5, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  br label %25

9:                                                ; preds = %2
  %10 = load ptr, ptr %4, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %15

12:                                               ; preds = %9
  %13 = load ptr, ptr %4, align 8
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %5, align 8
  br label %15

15:                                               ; preds = %12, %9
  %16 = load ptr, ptr %5, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %18, label %25

18:                                               ; preds = %15
  %19 = load ptr, ptr %4, align 8
  store ptr null, ptr %19, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = load ptr, ptr %5, align 8
  call void @png_free_data(ptr noundef %20, ptr noundef %21, i32 noundef 65535, i32 noundef -1)
  %22 = load ptr, ptr %5, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %22, i8 0, i64 352, i1 false)
  %23 = load ptr, ptr %3, align 8
  %24 = load ptr, ptr %5, align 8
  call void @png_free(ptr noundef %23, ptr noundef %24)
  br label %25

25:                                               ; preds = %8, %18, %15
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_free_data(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %14 = load ptr, ptr %5, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %19, label %16

16:                                               ; preds = %4
  %17 = load ptr, ptr %6, align 8
  %18 = icmp eq ptr %17, null
  br i1 %18, label %19, label %20

19:                                               ; preds = %16, %4
  br label %490

20:                                               ; preds = %16
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds %struct.png_info_def, ptr %21, i32 0, i32 37
  %23 = load ptr, ptr %22, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %85

25:                                               ; preds = %20
  %26 = load i32, ptr %7, align 4
  %27 = and i32 %26, 16384
  %28 = load ptr, ptr %6, align 8
  %29 = getelementptr inbounds %struct.png_info_def, ptr %28, i32 0, i32 59
  %30 = load i32, ptr %29, align 4
  %31 = and i32 %27, %30
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %85

33:                                               ; preds = %25
  %34 = load i32, ptr %8, align 4
  %35 = icmp ne i32 %34, -1
  br i1 %35, label %36, label %53

36:                                               ; preds = %33
  %37 = load ptr, ptr %5, align 8
  %38 = load ptr, ptr %6, align 8
  %39 = getelementptr inbounds %struct.png_info_def, ptr %38, i32 0, i32 37
  %40 = load ptr, ptr %39, align 8
  %41 = load i32, ptr %8, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds %struct.png_text_struct, ptr %40, i64 %42
  %44 = getelementptr inbounds %struct.png_text_struct, ptr %43, i32 0, i32 1
  %45 = load ptr, ptr %44, align 8
  call void @png_free(ptr noundef %37, ptr noundef %45)
  %46 = load ptr, ptr %6, align 8
  %47 = getelementptr inbounds %struct.png_info_def, ptr %46, i32 0, i32 37
  %48 = load ptr, ptr %47, align 8
  %49 = load i32, ptr %8, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds %struct.png_text_struct, ptr %48, i64 %50
  %52 = getelementptr inbounds %struct.png_text_struct, ptr %51, i32 0, i32 1
  store ptr null, ptr %52, align 8
  br label %84

53:                                               ; preds = %33
  store i32 0, ptr %9, align 4
  br label %54

54:                                               ; preds = %70, %53
  %55 = load i32, ptr %9, align 4
  %56 = load ptr, ptr %6, align 8
  %57 = getelementptr inbounds %struct.png_info_def, ptr %56, i32 0, i32 35
  %58 = load i32, ptr %57, align 4
  %59 = icmp slt i32 %55, %58
  br i1 %59, label %60, label %73

60:                                               ; preds = %54
  %61 = load ptr, ptr %5, align 8
  %62 = load ptr, ptr %6, align 8
  %63 = getelementptr inbounds %struct.png_info_def, ptr %62, i32 0, i32 37
  %64 = load ptr, ptr %63, align 8
  %65 = load i32, ptr %9, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds %struct.png_text_struct, ptr %64, i64 %66
  %68 = getelementptr inbounds %struct.png_text_struct, ptr %67, i32 0, i32 1
  %69 = load ptr, ptr %68, align 8
  call void @png_free(ptr noundef %61, ptr noundef %69)
  br label %70

70:                                               ; preds = %60
  %71 = load i32, ptr %9, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %9, align 4
  br label %54, !llvm.loop !8

73:                                               ; preds = %54
  %74 = load ptr, ptr %5, align 8
  %75 = load ptr, ptr %6, align 8
  %76 = getelementptr inbounds %struct.png_info_def, ptr %75, i32 0, i32 37
  %77 = load ptr, ptr %76, align 8
  call void @png_free(ptr noundef %74, ptr noundef %77)
  %78 = load ptr, ptr %6, align 8
  %79 = getelementptr inbounds %struct.png_info_def, ptr %78, i32 0, i32 37
  store ptr null, ptr %79, align 8
  %80 = load ptr, ptr %6, align 8
  %81 = getelementptr inbounds %struct.png_info_def, ptr %80, i32 0, i32 35
  store i32 0, ptr %81, align 4
  %82 = load ptr, ptr %6, align 8
  %83 = getelementptr inbounds %struct.png_info_def, ptr %82, i32 0, i32 36
  store i32 0, ptr %83, align 8
  br label %84

84:                                               ; preds = %73, %36
  br label %85

85:                                               ; preds = %84, %25, %20
  %86 = load i32, ptr %7, align 4
  %87 = and i32 %86, 8192
  %88 = load ptr, ptr %6, align 8
  %89 = getelementptr inbounds %struct.png_info_def, ptr %88, i32 0, i32 59
  %90 = load i32, ptr %89, align 4
  %91 = and i32 %87, %90
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %93, label %106

93:                                               ; preds = %85
  %94 = load ptr, ptr %6, align 8
  %95 = getelementptr inbounds %struct.png_info_def, ptr %94, i32 0, i32 2
  %96 = load i32, ptr %95, align 8
  %97 = and i32 %96, -17
  store i32 %97, ptr %95, align 8
  %98 = load ptr, ptr %5, align 8
  %99 = load ptr, ptr %6, align 8
  %100 = getelementptr inbounds %struct.png_info_def, ptr %99, i32 0, i32 40
  %101 = load ptr, ptr %100, align 8
  call void @png_free(ptr noundef %98, ptr noundef %101)
  %102 = load ptr, ptr %6, align 8
  %103 = getelementptr inbounds %struct.png_info_def, ptr %102, i32 0, i32 40
  store ptr null, ptr %103, align 8
  %104 = load ptr, ptr %6, align 8
  %105 = getelementptr inbounds %struct.png_info_def, ptr %104, i32 0, i32 6
  store i16 0, ptr %105, align 2
  br label %106

106:                                              ; preds = %93, %85
  %107 = load i32, ptr %7, align 4
  %108 = and i32 %107, 256
  %109 = load ptr, ptr %6, align 8
  %110 = getelementptr inbounds %struct.png_info_def, ptr %109, i32 0, i32 59
  %111 = load i32, ptr %110, align 4
  %112 = and i32 %108, %111
  %113 = icmp ne i32 %112, 0
  br i1 %113, label %114, label %131

114:                                              ; preds = %106
  %115 = load ptr, ptr %5, align 8
  %116 = load ptr, ptr %6, align 8
  %117 = getelementptr inbounds %struct.png_info_def, ptr %116, i32 0, i32 65
  %118 = load ptr, ptr %117, align 8
  call void @png_free(ptr noundef %115, ptr noundef %118)
  %119 = load ptr, ptr %5, align 8
  %120 = load ptr, ptr %6, align 8
  %121 = getelementptr inbounds %struct.png_info_def, ptr %120, i32 0, i32 66
  %122 = load ptr, ptr %121, align 8
  call void @png_free(ptr noundef %119, ptr noundef %122)
  %123 = load ptr, ptr %6, align 8
  %124 = getelementptr inbounds %struct.png_info_def, ptr %123, i32 0, i32 65
  store ptr null, ptr %124, align 8
  %125 = load ptr, ptr %6, align 8
  %126 = getelementptr inbounds %struct.png_info_def, ptr %125, i32 0, i32 66
  store ptr null, ptr %126, align 8
  %127 = load ptr, ptr %6, align 8
  %128 = getelementptr inbounds %struct.png_info_def, ptr %127, i32 0, i32 2
  %129 = load i32, ptr %128, align 8
  %130 = and i32 %129, -16385
  store i32 %130, ptr %128, align 8
  br label %131

131:                                              ; preds = %114, %106
  %132 = load i32, ptr %7, align 4
  %133 = and i32 %132, 128
  %134 = load ptr, ptr %6, align 8
  %135 = getelementptr inbounds %struct.png_info_def, ptr %134, i32 0, i32 59
  %136 = load i32, ptr %135, align 4
  %137 = and i32 %133, %136
  %138 = icmp ne i32 %137, 0
  br i1 %138, label %139, label %188

139:                                              ; preds = %131
  %140 = load ptr, ptr %5, align 8
  %141 = load ptr, ptr %6, align 8
  %142 = getelementptr inbounds %struct.png_info_def, ptr %141, i32 0, i32 52
  %143 = load ptr, ptr %142, align 8
  call void @png_free(ptr noundef %140, ptr noundef %143)
  %144 = load ptr, ptr %5, align 8
  %145 = load ptr, ptr %6, align 8
  %146 = getelementptr inbounds %struct.png_info_def, ptr %145, i32 0, i32 55
  %147 = load ptr, ptr %146, align 8
  call void @png_free(ptr noundef %144, ptr noundef %147)
  %148 = load ptr, ptr %6, align 8
  %149 = getelementptr inbounds %struct.png_info_def, ptr %148, i32 0, i32 52
  store ptr null, ptr %149, align 8
  %150 = load ptr, ptr %6, align 8
  %151 = getelementptr inbounds %struct.png_info_def, ptr %150, i32 0, i32 55
  store ptr null, ptr %151, align 8
  %152 = load ptr, ptr %6, align 8
  %153 = getelementptr inbounds %struct.png_info_def, ptr %152, i32 0, i32 56
  %154 = load ptr, ptr %153, align 8
  %155 = icmp ne ptr %154, null
  br i1 %155, label %156, label %183

156:                                              ; preds = %139
  store i32 0, ptr %10, align 4
  br label %157

157:                                              ; preds = %173, %156
  %158 = load i32, ptr %10, align 4
  %159 = load ptr, ptr %6, align 8
  %160 = getelementptr inbounds %struct.png_info_def, ptr %159, i32 0, i32 58
  %161 = load i8, ptr %160, align 1
  %162 = zext i8 %161 to i32
  %163 = icmp slt i32 %158, %162
  br i1 %163, label %164, label %176

164:                                              ; preds = %157
  %165 = load ptr, ptr %5, align 8
  %166 = load ptr, ptr %6, align 8
  %167 = getelementptr inbounds %struct.png_info_def, ptr %166, i32 0, i32 56
  %168 = load ptr, ptr %167, align 8
  %169 = load i32, ptr %10, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds ptr, ptr %168, i64 %170
  %172 = load ptr, ptr %171, align 8
  call void @png_free(ptr noundef %165, ptr noundef %172)
  br label %173

173:                                              ; preds = %164
  %174 = load i32, ptr %10, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, ptr %10, align 4
  br label %157, !llvm.loop !9

176:                                              ; preds = %157
  %177 = load ptr, ptr %5, align 8
  %178 = load ptr, ptr %6, align 8
  %179 = getelementptr inbounds %struct.png_info_def, ptr %178, i32 0, i32 56
  %180 = load ptr, ptr %179, align 8
  call void @png_free(ptr noundef %177, ptr noundef %180)
  %181 = load ptr, ptr %6, align 8
  %182 = getelementptr inbounds %struct.png_info_def, ptr %181, i32 0, i32 56
  store ptr null, ptr %182, align 8
  br label %183

183:                                              ; preds = %176, %139
  %184 = load ptr, ptr %6, align 8
  %185 = getelementptr inbounds %struct.png_info_def, ptr %184, i32 0, i32 2
  %186 = load i32, ptr %185, align 8
  %187 = and i32 %186, -1025
  store i32 %187, ptr %185, align 8
  br label %188

188:                                              ; preds = %183, %131
  %189 = load i32, ptr %7, align 4
  %190 = and i32 %189, 16
  %191 = load ptr, ptr %6, align 8
  %192 = getelementptr inbounds %struct.png_info_def, ptr %191, i32 0, i32 59
  %193 = load i32, ptr %192, align 4
  %194 = and i32 %190, %193
  %195 = icmp ne i32 %194, 0
  br i1 %195, label %196, label %213

196:                                              ; preds = %188
  %197 = load ptr, ptr %5, align 8
  %198 = load ptr, ptr %6, align 8
  %199 = getelementptr inbounds %struct.png_info_def, ptr %198, i32 0, i32 20
  %200 = load ptr, ptr %199, align 8
  call void @png_free(ptr noundef %197, ptr noundef %200)
  %201 = load ptr, ptr %5, align 8
  %202 = load ptr, ptr %6, align 8
  %203 = getelementptr inbounds %struct.png_info_def, ptr %202, i32 0, i32 21
  %204 = load ptr, ptr %203, align 8
  call void @png_free(ptr noundef %201, ptr noundef %204)
  %205 = load ptr, ptr %6, align 8
  %206 = getelementptr inbounds %struct.png_info_def, ptr %205, i32 0, i32 20
  store ptr null, ptr %206, align 8
  %207 = load ptr, ptr %6, align 8
  %208 = getelementptr inbounds %struct.png_info_def, ptr %207, i32 0, i32 21
  store ptr null, ptr %208, align 8
  %209 = load ptr, ptr %6, align 8
  %210 = getelementptr inbounds %struct.png_info_def, ptr %209, i32 0, i32 2
  %211 = load i32, ptr %210, align 8
  %212 = and i32 %211, -4097
  store i32 %212, ptr %210, align 8
  br label %213

213:                                              ; preds = %196, %188
  %214 = load ptr, ptr %6, align 8
  %215 = getelementptr inbounds %struct.png_info_def, ptr %214, i32 0, i32 62
  %216 = load ptr, ptr %215, align 8
  %217 = icmp ne ptr %216, null
  br i1 %217, label %218, label %305

218:                                              ; preds = %213
  %219 = load i32, ptr %7, align 4
  %220 = and i32 %219, 32
  %221 = load ptr, ptr %6, align 8
  %222 = getelementptr inbounds %struct.png_info_def, ptr %221, i32 0, i32 59
  %223 = load i32, ptr %222, align 4
  %224 = and i32 %220, %223
  %225 = icmp ne i32 %224, 0
  br i1 %225, label %226, label %305

226:                                              ; preds = %218
  %227 = load i32, ptr %8, align 4
  %228 = icmp ne i32 %227, -1
  br i1 %228, label %229, label %262

229:                                              ; preds = %226
  %230 = load ptr, ptr %5, align 8
  %231 = load ptr, ptr %6, align 8
  %232 = getelementptr inbounds %struct.png_info_def, ptr %231, i32 0, i32 62
  %233 = load ptr, ptr %232, align 8
  %234 = load i32, ptr %8, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds %struct.png_sPLT_struct, ptr %233, i64 %235
  %237 = getelementptr inbounds %struct.png_sPLT_struct, ptr %236, i32 0, i32 0
  %238 = load ptr, ptr %237, align 8
  call void @png_free(ptr noundef %230, ptr noundef %238)
  %239 = load ptr, ptr %5, align 8
  %240 = load ptr, ptr %6, align 8
  %241 = getelementptr inbounds %struct.png_info_def, ptr %240, i32 0, i32 62
  %242 = load ptr, ptr %241, align 8
  %243 = load i32, ptr %8, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds %struct.png_sPLT_struct, ptr %242, i64 %244
  %246 = getelementptr inbounds %struct.png_sPLT_struct, ptr %245, i32 0, i32 2
  %247 = load ptr, ptr %246, align 8
  call void @png_free(ptr noundef %239, ptr noundef %247)
  %248 = load ptr, ptr %6, align 8
  %249 = getelementptr inbounds %struct.png_info_def, ptr %248, i32 0, i32 62
  %250 = load ptr, ptr %249, align 8
  %251 = load i32, ptr %8, align 4
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds %struct.png_sPLT_struct, ptr %250, i64 %252
  %254 = getelementptr inbounds %struct.png_sPLT_struct, ptr %253, i32 0, i32 0
  store ptr null, ptr %254, align 8
  %255 = load ptr, ptr %6, align 8
  %256 = getelementptr inbounds %struct.png_info_def, ptr %255, i32 0, i32 62
  %257 = load ptr, ptr %256, align 8
  %258 = load i32, ptr %8, align 4
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds %struct.png_sPLT_struct, ptr %257, i64 %259
  %261 = getelementptr inbounds %struct.png_sPLT_struct, ptr %260, i32 0, i32 2
  store ptr null, ptr %261, align 8
  br label %304

262:                                              ; preds = %226
  store i32 0, ptr %11, align 4
  br label %263

263:                                              ; preds = %288, %262
  %264 = load i32, ptr %11, align 4
  %265 = load ptr, ptr %6, align 8
  %266 = getelementptr inbounds %struct.png_info_def, ptr %265, i32 0, i32 63
  %267 = load i32, ptr %266, align 8
  %268 = icmp slt i32 %264, %267
  br i1 %268, label %269, label %291

269:                                              ; preds = %263
  %270 = load ptr, ptr %5, align 8
  %271 = load ptr, ptr %6, align 8
  %272 = getelementptr inbounds %struct.png_info_def, ptr %271, i32 0, i32 62
  %273 = load ptr, ptr %272, align 8
  %274 = load i32, ptr %11, align 4
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds %struct.png_sPLT_struct, ptr %273, i64 %275
  %277 = getelementptr inbounds %struct.png_sPLT_struct, ptr %276, i32 0, i32 0
  %278 = load ptr, ptr %277, align 8
  call void @png_free(ptr noundef %270, ptr noundef %278)
  %279 = load ptr, ptr %5, align 8
  %280 = load ptr, ptr %6, align 8
  %281 = getelementptr inbounds %struct.png_info_def, ptr %280, i32 0, i32 62
  %282 = load ptr, ptr %281, align 8
  %283 = load i32, ptr %11, align 4
  %284 = sext i32 %283 to i64
  %285 = getelementptr inbounds %struct.png_sPLT_struct, ptr %282, i64 %284
  %286 = getelementptr inbounds %struct.png_sPLT_struct, ptr %285, i32 0, i32 2
  %287 = load ptr, ptr %286, align 8
  call void @png_free(ptr noundef %279, ptr noundef %287)
  br label %288

288:                                              ; preds = %269
  %289 = load i32, ptr %11, align 4
  %290 = add nsw i32 %289, 1
  store i32 %290, ptr %11, align 4
  br label %263, !llvm.loop !10

291:                                              ; preds = %263
  %292 = load ptr, ptr %5, align 8
  %293 = load ptr, ptr %6, align 8
  %294 = getelementptr inbounds %struct.png_info_def, ptr %293, i32 0, i32 62
  %295 = load ptr, ptr %294, align 8
  call void @png_free(ptr noundef %292, ptr noundef %295)
  %296 = load ptr, ptr %6, align 8
  %297 = getelementptr inbounds %struct.png_info_def, ptr %296, i32 0, i32 62
  store ptr null, ptr %297, align 8
  %298 = load ptr, ptr %6, align 8
  %299 = getelementptr inbounds %struct.png_info_def, ptr %298, i32 0, i32 63
  store i32 0, ptr %299, align 8
  %300 = load ptr, ptr %6, align 8
  %301 = getelementptr inbounds %struct.png_info_def, ptr %300, i32 0, i32 2
  %302 = load i32, ptr %301, align 8
  %303 = and i32 %302, -8193
  store i32 %303, ptr %301, align 8
  br label %304

304:                                              ; preds = %291, %229
  br label %305

305:                                              ; preds = %304, %218, %213
  %306 = load ptr, ptr %6, align 8
  %307 = getelementptr inbounds %struct.png_info_def, ptr %306, i32 0, i32 60
  %308 = load ptr, ptr %307, align 8
  %309 = icmp ne ptr %308, null
  br i1 %309, label %310, label %368

310:                                              ; preds = %305
  %311 = load i32, ptr %7, align 4
  %312 = and i32 %311, 512
  %313 = load ptr, ptr %6, align 8
  %314 = getelementptr inbounds %struct.png_info_def, ptr %313, i32 0, i32 59
  %315 = load i32, ptr %314, align 4
  %316 = and i32 %312, %315
  %317 = icmp ne i32 %316, 0
  br i1 %317, label %318, label %368

318:                                              ; preds = %310
  %319 = load i32, ptr %8, align 4
  %320 = icmp ne i32 %319, -1
  br i1 %320, label %321, label %338

321:                                              ; preds = %318
  %322 = load ptr, ptr %5, align 8
  %323 = load ptr, ptr %6, align 8
  %324 = getelementptr inbounds %struct.png_info_def, ptr %323, i32 0, i32 60
  %325 = load ptr, ptr %324, align 8
  %326 = load i32, ptr %8, align 4
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %325, i64 %327
  %329 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %328, i32 0, i32 1
  %330 = load ptr, ptr %329, align 8
  call void @png_free(ptr noundef %322, ptr noundef %330)
  %331 = load ptr, ptr %6, align 8
  %332 = getelementptr inbounds %struct.png_info_def, ptr %331, i32 0, i32 60
  %333 = load ptr, ptr %332, align 8
  %334 = load i32, ptr %8, align 4
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %333, i64 %335
  %337 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %336, i32 0, i32 1
  store ptr null, ptr %337, align 8
  br label %367

338:                                              ; preds = %318
  store i32 0, ptr %12, align 4
  br label %339

339:                                              ; preds = %355, %338
  %340 = load i32, ptr %12, align 4
  %341 = load ptr, ptr %6, align 8
  %342 = getelementptr inbounds %struct.png_info_def, ptr %341, i32 0, i32 61
  %343 = load i32, ptr %342, align 8
  %344 = icmp slt i32 %340, %343
  br i1 %344, label %345, label %358

345:                                              ; preds = %339
  %346 = load ptr, ptr %5, align 8
  %347 = load ptr, ptr %6, align 8
  %348 = getelementptr inbounds %struct.png_info_def, ptr %347, i32 0, i32 60
  %349 = load ptr, ptr %348, align 8
  %350 = load i32, ptr %12, align 4
  %351 = sext i32 %350 to i64
  %352 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %349, i64 %351
  %353 = getelementptr inbounds %struct.png_unknown_chunk_t, ptr %352, i32 0, i32 1
  %354 = load ptr, ptr %353, align 8
  call void @png_free(ptr noundef %346, ptr noundef %354)
  br label %355

355:                                              ; preds = %345
  %356 = load i32, ptr %12, align 4
  %357 = add nsw i32 %356, 1
  store i32 %357, ptr %12, align 4
  br label %339, !llvm.loop !11

358:                                              ; preds = %339
  %359 = load ptr, ptr %5, align 8
  %360 = load ptr, ptr %6, align 8
  %361 = getelementptr inbounds %struct.png_info_def, ptr %360, i32 0, i32 60
  %362 = load ptr, ptr %361, align 8
  call void @png_free(ptr noundef %359, ptr noundef %362)
  %363 = load ptr, ptr %6, align 8
  %364 = getelementptr inbounds %struct.png_info_def, ptr %363, i32 0, i32 60
  store ptr null, ptr %364, align 8
  %365 = load ptr, ptr %6, align 8
  %366 = getelementptr inbounds %struct.png_info_def, ptr %365, i32 0, i32 61
  store i32 0, ptr %366, align 8
  br label %367

367:                                              ; preds = %358, %321
  br label %368

368:                                              ; preds = %367, %310, %305
  %369 = load i32, ptr %7, align 4
  %370 = and i32 %369, 32768
  %371 = load ptr, ptr %6, align 8
  %372 = getelementptr inbounds %struct.png_info_def, ptr %371, i32 0, i32 59
  %373 = load i32, ptr %372, align 4
  %374 = and i32 %370, %373
  %375 = icmp ne i32 %374, 0
  br i1 %375, label %376, label %393

376:                                              ; preds = %368
  %377 = load ptr, ptr %6, align 8
  %378 = getelementptr inbounds %struct.png_info_def, ptr %377, i32 0, i32 50
  %379 = load ptr, ptr %378, align 8
  %380 = icmp ne ptr %379, null
  br i1 %380, label %381, label %388

381:                                              ; preds = %376
  %382 = load ptr, ptr %5, align 8
  %383 = load ptr, ptr %6, align 8
  %384 = getelementptr inbounds %struct.png_info_def, ptr %383, i32 0, i32 50
  %385 = load ptr, ptr %384, align 8
  call void @png_free(ptr noundef %382, ptr noundef %385)
  %386 = load ptr, ptr %6, align 8
  %387 = getelementptr inbounds %struct.png_info_def, ptr %386, i32 0, i32 50
  store ptr null, ptr %387, align 8
  br label %388

388:                                              ; preds = %381, %376
  %389 = load ptr, ptr %6, align 8
  %390 = getelementptr inbounds %struct.png_info_def, ptr %389, i32 0, i32 2
  %391 = load i32, ptr %390, align 8
  %392 = and i32 %391, -65537
  store i32 %392, ptr %390, align 8
  br label %393

393:                                              ; preds = %388, %368
  %394 = load i32, ptr %7, align 4
  %395 = and i32 %394, 8
  %396 = load ptr, ptr %6, align 8
  %397 = getelementptr inbounds %struct.png_info_def, ptr %396, i32 0, i32 59
  %398 = load i32, ptr %397, align 4
  %399 = and i32 %395, %398
  %400 = icmp ne i32 %399, 0
  br i1 %400, label %401, label %412

401:                                              ; preds = %393
  %402 = load ptr, ptr %5, align 8
  %403 = load ptr, ptr %6, align 8
  %404 = getelementptr inbounds %struct.png_info_def, ptr %403, i32 0, i32 51
  %405 = load ptr, ptr %404, align 8
  call void @png_free(ptr noundef %402, ptr noundef %405)
  %406 = load ptr, ptr %6, align 8
  %407 = getelementptr inbounds %struct.png_info_def, ptr %406, i32 0, i32 51
  store ptr null, ptr %407, align 8
  %408 = load ptr, ptr %6, align 8
  %409 = getelementptr inbounds %struct.png_info_def, ptr %408, i32 0, i32 2
  %410 = load i32, ptr %409, align 8
  %411 = and i32 %410, -65
  store i32 %411, ptr %409, align 8
  br label %412

412:                                              ; preds = %401, %393
  %413 = load i32, ptr %7, align 4
  %414 = and i32 %413, 4096
  %415 = load ptr, ptr %6, align 8
  %416 = getelementptr inbounds %struct.png_info_def, ptr %415, i32 0, i32 59
  %417 = load i32, ptr %416, align 4
  %418 = and i32 %414, %417
  %419 = icmp ne i32 %418, 0
  br i1 %419, label %420, label %433

420:                                              ; preds = %412
  %421 = load ptr, ptr %5, align 8
  %422 = load ptr, ptr %6, align 8
  %423 = getelementptr inbounds %struct.png_info_def, ptr %422, i32 0, i32 4
  %424 = load ptr, ptr %423, align 8
  call void @png_free(ptr noundef %421, ptr noundef %424)
  %425 = load ptr, ptr %6, align 8
  %426 = getelementptr inbounds %struct.png_info_def, ptr %425, i32 0, i32 4
  store ptr null, ptr %426, align 8
  %427 = load ptr, ptr %6, align 8
  %428 = getelementptr inbounds %struct.png_info_def, ptr %427, i32 0, i32 2
  %429 = load i32, ptr %428, align 8
  %430 = and i32 %429, -9
  store i32 %430, ptr %428, align 8
  %431 = load ptr, ptr %6, align 8
  %432 = getelementptr inbounds %struct.png_info_def, ptr %431, i32 0, i32 5
  store i16 0, ptr %432, align 8
  br label %433

433:                                              ; preds = %420, %412
  %434 = load i32, ptr %7, align 4
  %435 = and i32 %434, 64
  %436 = load ptr, ptr %6, align 8
  %437 = getelementptr inbounds %struct.png_info_def, ptr %436, i32 0, i32 59
  %438 = load i32, ptr %437, align 4
  %439 = and i32 %435, %438
  %440 = icmp ne i32 %439, 0
  br i1 %440, label %441, label %477

441:                                              ; preds = %433
  %442 = load ptr, ptr %6, align 8
  %443 = getelementptr inbounds %struct.png_info_def, ptr %442, i32 0, i32 67
  %444 = load ptr, ptr %443, align 8
  %445 = icmp ne ptr %444, null
  br i1 %445, label %446, label %472

446:                                              ; preds = %441
  store i32 0, ptr %13, align 4
  br label %447

447:                                              ; preds = %462, %446
  %448 = load i32, ptr %13, align 4
  %449 = load ptr, ptr %6, align 8
  %450 = getelementptr inbounds %struct.png_info_def, ptr %449, i32 0, i32 1
  %451 = load i32, ptr %450, align 4
  %452 = icmp ult i32 %448, %451
  br i1 %452, label %453, label %465

453:                                              ; preds = %447
  %454 = load ptr, ptr %5, align 8
  %455 = load ptr, ptr %6, align 8
  %456 = getelementptr inbounds %struct.png_info_def, ptr %455, i32 0, i32 67
  %457 = load ptr, ptr %456, align 8
  %458 = load i32, ptr %13, align 4
  %459 = zext i32 %458 to i64
  %460 = getelementptr inbounds ptr, ptr %457, i64 %459
  %461 = load ptr, ptr %460, align 8
  call void @png_free(ptr noundef %454, ptr noundef %461)
  br label %462

462:                                              ; preds = %453
  %463 = load i32, ptr %13, align 4
  %464 = add i32 %463, 1
  store i32 %464, ptr %13, align 4
  br label %447, !llvm.loop !12

465:                                              ; preds = %447
  %466 = load ptr, ptr %5, align 8
  %467 = load ptr, ptr %6, align 8
  %468 = getelementptr inbounds %struct.png_info_def, ptr %467, i32 0, i32 67
  %469 = load ptr, ptr %468, align 8
  call void @png_free(ptr noundef %466, ptr noundef %469)
  %470 = load ptr, ptr %6, align 8
  %471 = getelementptr inbounds %struct.png_info_def, ptr %470, i32 0, i32 67
  store ptr null, ptr %471, align 8
  br label %472

472:                                              ; preds = %465, %441
  %473 = load ptr, ptr %6, align 8
  %474 = getelementptr inbounds %struct.png_info_def, ptr %473, i32 0, i32 2
  %475 = load i32, ptr %474, align 8
  %476 = and i32 %475, -32769
  store i32 %476, ptr %474, align 8
  br label %477

477:                                              ; preds = %472, %433
  %478 = load i32, ptr %8, align 4
  %479 = icmp ne i32 %478, -1
  br i1 %479, label %480, label %483

480:                                              ; preds = %477
  %481 = load i32, ptr %7, align 4
  %482 = and i32 %481, -16929
  store i32 %482, ptr %7, align 4
  br label %483

483:                                              ; preds = %480, %477
  %484 = load i32, ptr %7, align 4
  %485 = xor i32 %484, -1
  %486 = load ptr, ptr %6, align 8
  %487 = getelementptr inbounds %struct.png_info_def, ptr %486, i32 0, i32 59
  %488 = load i32, ptr %487, align 4
  %489 = and i32 %488, %485
  store i32 %489, ptr %487, align 4
  br label %490

490:                                              ; preds = %483, %19
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_info_init_3(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  br label %26

11:                                               ; preds = %2
  %12 = load i64, ptr %4, align 8
  %13 = icmp ugt i64 352, %12
  br i1 %13, label %14, label %24

14:                                               ; preds = %11
  %15 = load ptr, ptr %3, align 8
  store ptr null, ptr %15, align 8
  %16 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %16) #13
  %17 = call noalias ptr @png_malloc_base(ptr noundef null, i64 noundef 352)
  store ptr %17, ptr %5, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = icmp eq ptr %18, null
  br i1 %19, label %20, label %21

20:                                               ; preds = %14
  br label %26

21:                                               ; preds = %14
  %22 = load ptr, ptr %5, align 8
  %23 = load ptr, ptr %3, align 8
  store ptr %22, ptr %23, align 8
  br label %24

24:                                               ; preds = %21, %11
  %25 = load ptr, ptr %5, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %25, i8 0, i64 352, i1 false)
  br label %26

26:                                               ; preds = %24, %20, %10
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #8

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_data_freer(ptr noalias noundef %0, ptr noalias noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %14, label %11

11:                                               ; preds = %4
  %12 = load ptr, ptr %6, align 8
  %13 = icmp eq ptr %12, null
  br i1 %13, label %14, label %15

14:                                               ; preds = %11, %4
  br label %37

15:                                               ; preds = %11
  %16 = load i32, ptr %7, align 4
  %17 = icmp eq i32 %16, 1
  br i1 %17, label %18, label %24

18:                                               ; preds = %15
  %19 = load i32, ptr %8, align 4
  %20 = load ptr, ptr %6, align 8
  %21 = getelementptr inbounds %struct.png_info_def, ptr %20, i32 0, i32 59
  %22 = load i32, ptr %21, align 4
  %23 = or i32 %22, %19
  store i32 %23, ptr %21, align 4
  br label %37

24:                                               ; preds = %15
  %25 = load i32, ptr %7, align 4
  %26 = icmp eq i32 %25, 2
  br i1 %26, label %27, label %34

27:                                               ; preds = %24
  %28 = load i32, ptr %8, align 4
  %29 = xor i32 %28, -1
  %30 = load ptr, ptr %6, align 8
  %31 = getelementptr inbounds %struct.png_info_def, ptr %30, i32 0, i32 59
  %32 = load i32, ptr %31, align 4
  %33 = and i32 %32, %29
  store i32 %33, ptr %31, align 4
  br label %36

34:                                               ; preds = %24
  %35 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %35, ptr noundef @.str.5) #10
  unreachable

36:                                               ; preds = %27
  br label %37

37:                                               ; preds = %14, %36, %18
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define ptr @png_get_io_ptr(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store ptr null, ptr %2, align 8
  br label %11

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.png_struct_def, ptr %8, i32 0, i32 9
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %2, align 8
  br label %11

11:                                               ; preds = %7, %6
  %12 = load ptr, ptr %2, align 8
  ret ptr %12
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_init_io(ptr noalias noundef %0, ptr noundef %1) #0 {
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
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 9
  store ptr %9, ptr %11, align 8
  br label %12

12:                                               ; preds = %8, %7
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_save_int_32(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = load i32, ptr %4, align 4
  call void @png_save_uint_32(ptr noundef %5, i32 noundef %6)
  ret void
}

declare void @png_save_uint_32(ptr noundef, i32 noundef) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_convert_to_rfc1123_buffer(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca [5 x i8], align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  store i32 0, ptr %3, align 4
  br label %175

11:                                               ; preds = %2
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.png_time_struct, ptr %12, i32 0, i32 0
  %14 = load i16, ptr %13, align 2
  %15 = zext i16 %14 to i32
  %16 = icmp sgt i32 %15, 9999
  br i1 %16, label %59, label %17

17:                                               ; preds = %11
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.png_time_struct, ptr %18, i32 0, i32 1
  %20 = load i8, ptr %19, align 2
  %21 = zext i8 %20 to i32
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %59, label %23

23:                                               ; preds = %17
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds %struct.png_time_struct, ptr %24, i32 0, i32 1
  %26 = load i8, ptr %25, align 2
  %27 = zext i8 %26 to i32
  %28 = icmp sgt i32 %27, 12
  br i1 %28, label %59, label %29

29:                                               ; preds = %23
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.png_time_struct, ptr %30, i32 0, i32 2
  %32 = load i8, ptr %31, align 1
  %33 = zext i8 %32 to i32
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %59, label %35

35:                                               ; preds = %29
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds %struct.png_time_struct, ptr %36, i32 0, i32 2
  %38 = load i8, ptr %37, align 1
  %39 = zext i8 %38 to i32
  %40 = icmp sgt i32 %39, 31
  br i1 %40, label %59, label %41

41:                                               ; preds = %35
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds %struct.png_time_struct, ptr %42, i32 0, i32 3
  %44 = load i8, ptr %43, align 2
  %45 = zext i8 %44 to i32
  %46 = icmp sgt i32 %45, 23
  br i1 %46, label %59, label %47

47:                                               ; preds = %41
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds %struct.png_time_struct, ptr %48, i32 0, i32 4
  %50 = load i8, ptr %49, align 1
  %51 = zext i8 %50 to i32
  %52 = icmp sgt i32 %51, 59
  br i1 %52, label %59, label %53

53:                                               ; preds = %47
  %54 = load ptr, ptr %5, align 8
  %55 = getelementptr inbounds %struct.png_time_struct, ptr %54, i32 0, i32 5
  %56 = load i8, ptr %55, align 2
  %57 = zext i8 %56 to i32
  %58 = icmp sgt i32 %57, 60
  br i1 %58, label %59, label %60

59:                                               ; preds = %53, %47, %41, %35, %29, %23, %17, %11
  store i32 0, ptr %3, align 4
  br label %175

60:                                               ; preds = %53
  store i64 0, ptr %6, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %7, i8 0, i64 5, i1 false)
  %61 = load ptr, ptr %4, align 8
  %62 = load i64, ptr %6, align 8
  %63 = getelementptr inbounds [5 x i8], ptr %7, i64 0, i64 0
  %64 = getelementptr inbounds [5 x i8], ptr %7, i64 0, i64 0
  %65 = getelementptr inbounds i8, ptr %64, i64 5
  %66 = load ptr, ptr %5, align 8
  %67 = getelementptr inbounds %struct.png_time_struct, ptr %66, i32 0, i32 2
  %68 = load i8, ptr %67, align 1
  %69 = zext i8 %68 to i32
  %70 = zext i32 %69 to i64
  %71 = call ptr @png_format_number(ptr noundef %63, ptr noundef %65, i32 noundef 1, i64 noundef %70)
  %72 = call i64 @png_safecat(ptr noundef %61, i64 noundef 29, i64 noundef %62, ptr noundef %71)
  store i64 %72, ptr %6, align 8
  %73 = load i64, ptr %6, align 8
  %74 = icmp ult i64 %73, 28
  br i1 %74, label %75, label %80

75:                                               ; preds = %60
  %76 = load ptr, ptr %4, align 8
  %77 = load i64, ptr %6, align 8
  %78 = add i64 %77, 1
  store i64 %78, ptr %6, align 8
  %79 = getelementptr inbounds i8, ptr %76, i64 %77
  store i8 32, ptr %79, align 1
  br label %80

80:                                               ; preds = %75, %60
  %81 = load ptr, ptr %4, align 8
  %82 = load i64, ptr %6, align 8
  %83 = load ptr, ptr %5, align 8
  %84 = getelementptr inbounds %struct.png_time_struct, ptr %83, i32 0, i32 1
  %85 = load i8, ptr %84, align 2
  %86 = zext i8 %85 to i32
  %87 = sub nsw i32 %86, 1
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [12 x [4 x i8]], ptr @png_convert_to_rfc1123_buffer.short_months, i64 0, i64 %88
  %90 = getelementptr inbounds [4 x i8], ptr %89, i64 0, i64 0
  %91 = call i64 @png_safecat(ptr noundef %81, i64 noundef 29, i64 noundef %82, ptr noundef %90)
  store i64 %91, ptr %6, align 8
  %92 = load i64, ptr %6, align 8
  %93 = icmp ult i64 %92, 28
  br i1 %93, label %94, label %99

94:                                               ; preds = %80
  %95 = load ptr, ptr %4, align 8
  %96 = load i64, ptr %6, align 8
  %97 = add i64 %96, 1
  store i64 %97, ptr %6, align 8
  %98 = getelementptr inbounds i8, ptr %95, i64 %96
  store i8 32, ptr %98, align 1
  br label %99

99:                                               ; preds = %94, %80
  %100 = load ptr, ptr %4, align 8
  %101 = load i64, ptr %6, align 8
  %102 = getelementptr inbounds [5 x i8], ptr %7, i64 0, i64 0
  %103 = getelementptr inbounds [5 x i8], ptr %7, i64 0, i64 0
  %104 = getelementptr inbounds i8, ptr %103, i64 5
  %105 = load ptr, ptr %5, align 8
  %106 = getelementptr inbounds %struct.png_time_struct, ptr %105, i32 0, i32 0
  %107 = load i16, ptr %106, align 2
  %108 = zext i16 %107 to i64
  %109 = call ptr @png_format_number(ptr noundef %102, ptr noundef %104, i32 noundef 1, i64 noundef %108)
  %110 = call i64 @png_safecat(ptr noundef %100, i64 noundef 29, i64 noundef %101, ptr noundef %109)
  store i64 %110, ptr %6, align 8
  %111 = load i64, ptr %6, align 8
  %112 = icmp ult i64 %111, 28
  br i1 %112, label %113, label %118

113:                                              ; preds = %99
  %114 = load ptr, ptr %4, align 8
  %115 = load i64, ptr %6, align 8
  %116 = add i64 %115, 1
  store i64 %116, ptr %6, align 8
  %117 = getelementptr inbounds i8, ptr %114, i64 %115
  store i8 32, ptr %117, align 1
  br label %118

118:                                              ; preds = %113, %99
  %119 = load ptr, ptr %4, align 8
  %120 = load i64, ptr %6, align 8
  %121 = getelementptr inbounds [5 x i8], ptr %7, i64 0, i64 0
  %122 = getelementptr inbounds [5 x i8], ptr %7, i64 0, i64 0
  %123 = getelementptr inbounds i8, ptr %122, i64 5
  %124 = load ptr, ptr %5, align 8
  %125 = getelementptr inbounds %struct.png_time_struct, ptr %124, i32 0, i32 3
  %126 = load i8, ptr %125, align 2
  %127 = zext i8 %126 to i32
  %128 = zext i32 %127 to i64
  %129 = call ptr @png_format_number(ptr noundef %121, ptr noundef %123, i32 noundef 2, i64 noundef %128)
  %130 = call i64 @png_safecat(ptr noundef %119, i64 noundef 29, i64 noundef %120, ptr noundef %129)
  store i64 %130, ptr %6, align 8
  %131 = load i64, ptr %6, align 8
  %132 = icmp ult i64 %131, 28
  br i1 %132, label %133, label %138

133:                                              ; preds = %118
  %134 = load ptr, ptr %4, align 8
  %135 = load i64, ptr %6, align 8
  %136 = add i64 %135, 1
  store i64 %136, ptr %6, align 8
  %137 = getelementptr inbounds i8, ptr %134, i64 %135
  store i8 58, ptr %137, align 1
  br label %138

138:                                              ; preds = %133, %118
  %139 = load ptr, ptr %4, align 8
  %140 = load i64, ptr %6, align 8
  %141 = getelementptr inbounds [5 x i8], ptr %7, i64 0, i64 0
  %142 = getelementptr inbounds [5 x i8], ptr %7, i64 0, i64 0
  %143 = getelementptr inbounds i8, ptr %142, i64 5
  %144 = load ptr, ptr %5, align 8
  %145 = getelementptr inbounds %struct.png_time_struct, ptr %144, i32 0, i32 4
  %146 = load i8, ptr %145, align 1
  %147 = zext i8 %146 to i32
  %148 = zext i32 %147 to i64
  %149 = call ptr @png_format_number(ptr noundef %141, ptr noundef %143, i32 noundef 2, i64 noundef %148)
  %150 = call i64 @png_safecat(ptr noundef %139, i64 noundef 29, i64 noundef %140, ptr noundef %149)
  store i64 %150, ptr %6, align 8
  %151 = load i64, ptr %6, align 8
  %152 = icmp ult i64 %151, 28
  br i1 %152, label %153, label %158

153:                                              ; preds = %138
  %154 = load ptr, ptr %4, align 8
  %155 = load i64, ptr %6, align 8
  %156 = add i64 %155, 1
  store i64 %156, ptr %6, align 8
  %157 = getelementptr inbounds i8, ptr %154, i64 %155
  store i8 58, ptr %157, align 1
  br label %158

158:                                              ; preds = %153, %138
  %159 = load ptr, ptr %4, align 8
  %160 = load i64, ptr %6, align 8
  %161 = getelementptr inbounds [5 x i8], ptr %7, i64 0, i64 0
  %162 = getelementptr inbounds [5 x i8], ptr %7, i64 0, i64 0
  %163 = getelementptr inbounds i8, ptr %162, i64 5
  %164 = load ptr, ptr %5, align 8
  %165 = getelementptr inbounds %struct.png_time_struct, ptr %164, i32 0, i32 5
  %166 = load i8, ptr %165, align 2
  %167 = zext i8 %166 to i32
  %168 = zext i32 %167 to i64
  %169 = call ptr @png_format_number(ptr noundef %161, ptr noundef %163, i32 noundef 2, i64 noundef %168)
  %170 = call i64 @png_safecat(ptr noundef %159, i64 noundef 29, i64 noundef %160, ptr noundef %169)
  store i64 %170, ptr %6, align 8
  %171 = load ptr, ptr %4, align 8
  %172 = load i64, ptr %6, align 8
  %173 = call i64 @png_safecat(ptr noundef %171, i64 noundef 29, i64 noundef %172, ptr noundef @.str.6)
  store i64 %173, ptr %6, align 8
  %174 = load i64, ptr %6, align 8
  store i32 1, ptr %3, align 4
  br label %175

175:                                              ; preds = %158, %59, %10
  %176 = load i32, ptr %3, align 4
  ret i32 %176
}

declare ptr @png_format_number(ptr noundef, ptr noundef, i32 noundef, i64 noundef) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define ptr @png_convert_to_rfc1123(ptr noalias noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %22

8:                                                ; preds = %2
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.png_struct_def, ptr %9, i32 0, i32 116
  %11 = getelementptr inbounds [29 x i8], ptr %10, i64 0, i64 0
  %12 = load ptr, ptr %5, align 8
  %13 = call i32 @png_convert_to_rfc1123_buffer(ptr noundef %11, ptr noundef %12)
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %8
  %16 = load ptr, ptr %4, align 8
  call void @png_warning(ptr noundef %16, ptr noundef @.str.7)
  br label %21

17:                                               ; preds = %8
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds %struct.png_struct_def, ptr %18, i32 0, i32 116
  %20 = getelementptr inbounds [29 x i8], ptr %19, i64 0, i64 0
  store ptr %20, ptr %3, align 8
  br label %23

21:                                               ; preds = %15
  br label %22

22:                                               ; preds = %21, %2
  store ptr null, ptr %3, align 8
  br label %23

23:                                               ; preds = %22, %17
  %24 = load ptr, ptr %3, align 8
  ret ptr %24
}

; Function Attrs: noinline nounwind sspstrong uwtable
define ptr @png_get_copyright(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr @.str.8
}

; Function Attrs: noinline nounwind sspstrong uwtable
define ptr @png_get_libpng_ver(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @png_get_header_ver(ptr noundef %3)
  ret ptr %4
}

; Function Attrs: noinline nounwind sspstrong uwtable
define ptr @png_get_header_ver(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr @.str.2
}

; Function Attrs: noinline nounwind sspstrong uwtable
define ptr @png_get_header_version(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret ptr @.str.9
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_build_grayscale_palette(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store ptr %1, ptr %4, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = icmp eq ptr %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %2
  br label %55

12:                                               ; preds = %2
  %13 = load i32, ptr %3, align 4
  switch i32 %13, label %18 [
    i32 1, label %14
    i32 2, label %15
    i32 4, label %16
    i32 8, label %17
  ]

14:                                               ; preds = %12
  store i32 2, ptr %5, align 4
  store i32 255, ptr %6, align 4
  br label %19

15:                                               ; preds = %12
  store i32 4, ptr %5, align 4
  store i32 85, ptr %6, align 4
  br label %19

16:                                               ; preds = %12
  store i32 16, ptr %5, align 4
  store i32 17, ptr %6, align 4
  br label %19

17:                                               ; preds = %12
  store i32 256, ptr %5, align 4
  store i32 1, ptr %6, align 4
  br label %19

18:                                               ; preds = %12
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %19

19:                                               ; preds = %18, %17, %16, %15, %14
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %20

20:                                               ; preds = %49, %19
  %21 = load i32, ptr %7, align 4
  %22 = load i32, ptr %5, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %55

24:                                               ; preds = %20
  %25 = load i32, ptr %8, align 4
  %26 = and i32 %25, 255
  %27 = trunc i32 %26 to i8
  %28 = load ptr, ptr %4, align 8
  %29 = load i32, ptr %7, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.png_color_struct, ptr %28, i64 %30
  %32 = getelementptr inbounds %struct.png_color_struct, ptr %31, i32 0, i32 0
  store i8 %27, ptr %32, align 1
  %33 = load i32, ptr %8, align 4
  %34 = and i32 %33, 255
  %35 = trunc i32 %34 to i8
  %36 = load ptr, ptr %4, align 8
  %37 = load i32, ptr %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds %struct.png_color_struct, ptr %36, i64 %38
  %40 = getelementptr inbounds %struct.png_color_struct, ptr %39, i32 0, i32 1
  store i8 %35, ptr %40, align 1
  %41 = load i32, ptr %8, align 4
  %42 = and i32 %41, 255
  %43 = trunc i32 %42 to i8
  %44 = load ptr, ptr %4, align 8
  %45 = load i32, ptr %7, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds %struct.png_color_struct, ptr %44, i64 %46
  %48 = getelementptr inbounds %struct.png_color_struct, ptr %47, i32 0, i32 2
  store i8 %43, ptr %48, align 1
  br label %49

49:                                               ; preds = %24
  %50 = load i32, ptr %7, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %7, align 4
  %52 = load i32, ptr %6, align 4
  %53 = load i32, ptr %8, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, ptr %8, align 4
  br label %20, !llvm.loop !13

55:                                               ; preds = %11, %20
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_handle_as_unknown(ptr noalias noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %18, label %10

10:                                               ; preds = %2
  %11 = load ptr, ptr %5, align 8
  %12 = icmp eq ptr %11, null
  br i1 %12, label %18, label %13

13:                                               ; preds = %10
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds %struct.png_struct_def, ptr %14, i32 0, i32 121
  %16 = load i32, ptr %15, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %13, %10, %2
  store i32 0, ptr %3, align 4
  br label %48

19:                                               ; preds = %13
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds %struct.png_struct_def, ptr %20, i32 0, i32 122
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %7, align 8
  %23 = load ptr, ptr %7, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds %struct.png_struct_def, ptr %24, i32 0, i32 121
  %26 = load i32, ptr %25, align 4
  %27 = mul i32 %26, 5
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds i8, ptr %23, i64 %28
  store ptr %29, ptr %6, align 8
  br label %30

30:                                               ; preds = %43, %19
  %31 = load ptr, ptr %6, align 8
  %32 = getelementptr inbounds i8, ptr %31, i64 -5
  store ptr %32, ptr %6, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = load ptr, ptr %6, align 8
  %35 = call i32 @memcmp(ptr noundef %33, ptr noundef %34, i64 noundef 4) #11
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %42

37:                                               ; preds = %30
  %38 = load ptr, ptr %6, align 8
  %39 = getelementptr inbounds i8, ptr %38, i64 4
  %40 = load i8, ptr %39, align 1
  %41 = zext i8 %40 to i32
  store i32 %41, ptr %3, align 4
  br label %48

42:                                               ; preds = %30
  br label %43

43:                                               ; preds = %42
  %44 = load ptr, ptr %6, align 8
  %45 = load ptr, ptr %7, align 8
  %46 = icmp ugt ptr %44, %45
  br i1 %46, label %30, label %47, !llvm.loop !14

47:                                               ; preds = %43
  store i32 0, ptr %3, align 4
  br label %48

48:                                               ; preds = %47, %37, %18
  %49 = load i32, ptr %3, align 4
  ret i32 %49
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_chunk_unknown_handling(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca [5 x i8], align 1
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %4, align 4
  %7 = lshr i32 %6, 24
  %8 = and i32 %7, 255
  %9 = trunc i32 %8 to i8
  %10 = getelementptr inbounds [5 x i8], ptr %5, i64 0, i64 0
  %11 = getelementptr inbounds i8, ptr %10, i64 0
  store i8 %9, ptr %11, align 1
  %12 = load i32, ptr %4, align 4
  %13 = lshr i32 %12, 16
  %14 = and i32 %13, 255
  %15 = trunc i32 %14 to i8
  %16 = getelementptr inbounds [5 x i8], ptr %5, i64 0, i64 0
  %17 = getelementptr inbounds i8, ptr %16, i64 1
  store i8 %15, ptr %17, align 1
  %18 = load i32, ptr %4, align 4
  %19 = lshr i32 %18, 8
  %20 = and i32 %19, 255
  %21 = trunc i32 %20 to i8
  %22 = getelementptr inbounds [5 x i8], ptr %5, i64 0, i64 0
  %23 = getelementptr inbounds i8, ptr %22, i64 2
  store i8 %21, ptr %23, align 1
  %24 = load i32, ptr %4, align 4
  %25 = and i32 %24, 255
  %26 = trunc i32 %25 to i8
  %27 = getelementptr inbounds [5 x i8], ptr %5, i64 0, i64 0
  %28 = getelementptr inbounds i8, ptr %27, i64 3
  store i8 %26, ptr %28, align 1
  %29 = getelementptr inbounds [5 x i8], ptr %5, i64 0, i64 0
  %30 = getelementptr inbounds i8, ptr %29, i64 4
  store i8 0, ptr %30, align 1
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds [5 x i8], ptr %5, i64 0, i64 0
  %33 = call i32 @png_handle_as_unknown(ptr noundef %31, ptr noundef %32)
  ret i32 %33
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_reset_zstream(ptr noalias noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = icmp eq ptr %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 -2, ptr %2, align 4
  br label %11

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.png_struct_def, ptr %8, i32 0, i32 19
  %10 = call i32 @inflateReset(ptr noundef %9)
  store i32 %10, ptr %2, align 4
  br label %11

11:                                               ; preds = %7, %6
  %12 = load i32, ptr %2, align 4
  ret i32 %12
}

declare i32 @inflateReset(ptr noundef) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_access_version_number() #0 {
  ret i32 10648
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_zstream_error(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.png_struct_def, ptr %5, i32 0, i32 19
  %7 = getelementptr inbounds %struct.z_stream_s, ptr %6, i32 0, i32 6
  %8 = load ptr, ptr %7, align 8
  %9 = icmp eq ptr %8, null
  br i1 %9, label %10, label %54

10:                                               ; preds = %2
  %11 = load i32, ptr %4, align 4
  switch i32 %11, label %12 [
    i32 0, label %13
    i32 1, label %17
    i32 2, label %21
    i32 -1, label %25
    i32 -2, label %29
    i32 -3, label %33
    i32 -4, label %37
    i32 -5, label %41
    i32 -6, label %45
    i32 -7, label %49
  ]

12:                                               ; preds = %10
  br label %13

13:                                               ; preds = %10, %12
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds %struct.png_struct_def, ptr %14, i32 0, i32 19
  %16 = getelementptr inbounds %struct.z_stream_s, ptr %15, i32 0, i32 6
  store ptr @.str.10, ptr %16, align 8
  br label %53

17:                                               ; preds = %10
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.png_struct_def, ptr %18, i32 0, i32 19
  %20 = getelementptr inbounds %struct.z_stream_s, ptr %19, i32 0, i32 6
  store ptr @.str.11, ptr %20, align 8
  br label %53

21:                                               ; preds = %10
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds %struct.png_struct_def, ptr %22, i32 0, i32 19
  %24 = getelementptr inbounds %struct.z_stream_s, ptr %23, i32 0, i32 6
  store ptr @.str.12, ptr %24, align 8
  br label %53

25:                                               ; preds = %10
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds %struct.png_struct_def, ptr %26, i32 0, i32 19
  %28 = getelementptr inbounds %struct.z_stream_s, ptr %27, i32 0, i32 6
  store ptr @.str.13, ptr %28, align 8
  br label %53

29:                                               ; preds = %10
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds %struct.png_struct_def, ptr %30, i32 0, i32 19
  %32 = getelementptr inbounds %struct.z_stream_s, ptr %31, i32 0, i32 6
  store ptr @.str.14, ptr %32, align 8
  br label %53

33:                                               ; preds = %10
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds %struct.png_struct_def, ptr %34, i32 0, i32 19
  %36 = getelementptr inbounds %struct.z_stream_s, ptr %35, i32 0, i32 6
  store ptr @.str.15, ptr %36, align 8
  br label %53

37:                                               ; preds = %10
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds %struct.png_struct_def, ptr %38, i32 0, i32 19
  %40 = getelementptr inbounds %struct.z_stream_s, ptr %39, i32 0, i32 6
  store ptr @.str.16, ptr %40, align 8
  br label %53

41:                                               ; preds = %10
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds %struct.png_struct_def, ptr %42, i32 0, i32 19
  %44 = getelementptr inbounds %struct.z_stream_s, ptr %43, i32 0, i32 6
  store ptr @.str.17, ptr %44, align 8
  br label %53

45:                                               ; preds = %10
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds %struct.png_struct_def, ptr %46, i32 0, i32 19
  %48 = getelementptr inbounds %struct.z_stream_s, ptr %47, i32 0, i32 6
  store ptr @.str.18, ptr %48, align 8
  br label %53

49:                                               ; preds = %10
  %50 = load ptr, ptr %3, align 8
  %51 = getelementptr inbounds %struct.png_struct_def, ptr %50, i32 0, i32 19
  %52 = getelementptr inbounds %struct.z_stream_s, ptr %51, i32 0, i32 6
  store ptr @.str.19, ptr %52, align 8
  br label %53

53:                                               ; preds = %49, %45, %41, %37, %33, %29, %25, %21, %17, %13
  br label %54

54:                                               ; preds = %53, %2
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_xy_from_XYZ(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds %struct.png_XYZ, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 4
  store i32 %15, ptr %6, align 4
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds %struct.png_XYZ, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 4
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.png_XYZ, ptr %19, i32 0, i32 2
  %21 = load i32, ptr %20, align 4
  %22 = call i32 @png_safe_add(ptr noundef %6, i32 noundef %18, i32 noundef %21)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

24:                                               ; preds = %2
  store i32 1, ptr %3, align 4
  br label %167

25:                                               ; preds = %2
  %26 = load i32, ptr %6, align 4
  store i32 %26, ptr %7, align 4
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds %struct.png_xy, ptr %27, i32 0, i32 0
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds %struct.png_XYZ, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %30, align 4
  %32 = load i32, ptr %7, align 4
  %33 = call i32 @png_muldiv(ptr noundef %28, i32 noundef %31, i32 noundef 100000, i32 noundef %32)
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %25
  store i32 1, ptr %3, align 4
  br label %167

36:                                               ; preds = %25
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds %struct.png_xy, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds %struct.png_XYZ, ptr %39, i32 0, i32 1
  %41 = load i32, ptr %40, align 4
  %42 = load i32, ptr %7, align 4
  %43 = call i32 @png_muldiv(ptr noundef %38, i32 noundef %41, i32 noundef 100000, i32 noundef %42)
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %46

45:                                               ; preds = %36
  store i32 1, ptr %3, align 4
  br label %167

46:                                               ; preds = %36
  %47 = load ptr, ptr %5, align 8
  %48 = getelementptr inbounds %struct.png_XYZ, ptr %47, i32 0, i32 3
  %49 = load i32, ptr %48, align 4
  store i32 %49, ptr %6, align 4
  %50 = load ptr, ptr %5, align 8
  %51 = getelementptr inbounds %struct.png_XYZ, ptr %50, i32 0, i32 4
  %52 = load i32, ptr %51, align 4
  %53 = load ptr, ptr %5, align 8
  %54 = getelementptr inbounds %struct.png_XYZ, ptr %53, i32 0, i32 5
  %55 = load i32, ptr %54, align 4
  %56 = call i32 @png_safe_add(ptr noundef %6, i32 noundef %52, i32 noundef %55)
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %59

58:                                               ; preds = %46
  store i32 1, ptr %3, align 4
  br label %167

59:                                               ; preds = %46
  %60 = load i32, ptr %6, align 4
  store i32 %60, ptr %8, align 4
  %61 = load ptr, ptr %4, align 8
  %62 = getelementptr inbounds %struct.png_xy, ptr %61, i32 0, i32 2
  %63 = load ptr, ptr %5, align 8
  %64 = getelementptr inbounds %struct.png_XYZ, ptr %63, i32 0, i32 3
  %65 = load i32, ptr %64, align 4
  %66 = load i32, ptr %8, align 4
  %67 = call i32 @png_muldiv(ptr noundef %62, i32 noundef %65, i32 noundef 100000, i32 noundef %66)
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %69, label %70

69:                                               ; preds = %59
  store i32 1, ptr %3, align 4
  br label %167

70:                                               ; preds = %59
  %71 = load ptr, ptr %4, align 8
  %72 = getelementptr inbounds %struct.png_xy, ptr %71, i32 0, i32 3
  %73 = load ptr, ptr %5, align 8
  %74 = getelementptr inbounds %struct.png_XYZ, ptr %73, i32 0, i32 4
  %75 = load i32, ptr %74, align 4
  %76 = load i32, ptr %8, align 4
  %77 = call i32 @png_muldiv(ptr noundef %72, i32 noundef %75, i32 noundef 100000, i32 noundef %76)
  %78 = icmp eq i32 %77, 0
  br i1 %78, label %79, label %80

79:                                               ; preds = %70
  store i32 1, ptr %3, align 4
  br label %167

80:                                               ; preds = %70
  %81 = load ptr, ptr %5, align 8
  %82 = getelementptr inbounds %struct.png_XYZ, ptr %81, i32 0, i32 6
  %83 = load i32, ptr %82, align 4
  store i32 %83, ptr %6, align 4
  %84 = load ptr, ptr %5, align 8
  %85 = getelementptr inbounds %struct.png_XYZ, ptr %84, i32 0, i32 7
  %86 = load i32, ptr %85, align 4
  %87 = load ptr, ptr %5, align 8
  %88 = getelementptr inbounds %struct.png_XYZ, ptr %87, i32 0, i32 8
  %89 = load i32, ptr %88, align 4
  %90 = call i32 @png_safe_add(ptr noundef %6, i32 noundef %86, i32 noundef %89)
  %91 = icmp ne i32 %90, 0
  br i1 %91, label %92, label %93

92:                                               ; preds = %80
  store i32 1, ptr %3, align 4
  br label %167

93:                                               ; preds = %80
  %94 = load i32, ptr %6, align 4
  store i32 %94, ptr %9, align 4
  %95 = load ptr, ptr %4, align 8
  %96 = getelementptr inbounds %struct.png_xy, ptr %95, i32 0, i32 4
  %97 = load ptr, ptr %5, align 8
  %98 = getelementptr inbounds %struct.png_XYZ, ptr %97, i32 0, i32 6
  %99 = load i32, ptr %98, align 4
  %100 = load i32, ptr %9, align 4
  %101 = call i32 @png_muldiv(ptr noundef %96, i32 noundef %99, i32 noundef 100000, i32 noundef %100)
  %102 = icmp eq i32 %101, 0
  br i1 %102, label %103, label %104

103:                                              ; preds = %93
  store i32 1, ptr %3, align 4
  br label %167

104:                                              ; preds = %93
  %105 = load ptr, ptr %4, align 8
  %106 = getelementptr inbounds %struct.png_xy, ptr %105, i32 0, i32 5
  %107 = load ptr, ptr %5, align 8
  %108 = getelementptr inbounds %struct.png_XYZ, ptr %107, i32 0, i32 7
  %109 = load i32, ptr %108, align 4
  %110 = load i32, ptr %9, align 4
  %111 = call i32 @png_muldiv(ptr noundef %106, i32 noundef %109, i32 noundef 100000, i32 noundef %110)
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %113, label %114

113:                                              ; preds = %104
  store i32 1, ptr %3, align 4
  br label %167

114:                                              ; preds = %104
  %115 = load i32, ptr %9, align 4
  store i32 %115, ptr %6, align 4
  %116 = load i32, ptr %7, align 4
  %117 = load i32, ptr %8, align 4
  %118 = call i32 @png_safe_add(ptr noundef %6, i32 noundef %116, i32 noundef %117)
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %120, label %121

120:                                              ; preds = %114
  store i32 1, ptr %3, align 4
  br label %167

121:                                              ; preds = %114
  %122 = load i32, ptr %6, align 4
  store i32 %122, ptr %10, align 4
  %123 = load ptr, ptr %5, align 8
  %124 = getelementptr inbounds %struct.png_XYZ, ptr %123, i32 0, i32 0
  %125 = load i32, ptr %124, align 4
  store i32 %125, ptr %6, align 4
  %126 = load ptr, ptr %5, align 8
  %127 = getelementptr inbounds %struct.png_XYZ, ptr %126, i32 0, i32 3
  %128 = load i32, ptr %127, align 4
  %129 = load ptr, ptr %5, align 8
  %130 = getelementptr inbounds %struct.png_XYZ, ptr %129, i32 0, i32 6
  %131 = load i32, ptr %130, align 4
  %132 = call i32 @png_safe_add(ptr noundef %6, i32 noundef %128, i32 noundef %131)
  %133 = icmp ne i32 %132, 0
  br i1 %133, label %134, label %135

134:                                              ; preds = %121
  store i32 1, ptr %3, align 4
  br label %167

135:                                              ; preds = %121
  %136 = load i32, ptr %6, align 4
  store i32 %136, ptr %11, align 4
  %137 = load ptr, ptr %5, align 8
  %138 = getelementptr inbounds %struct.png_XYZ, ptr %137, i32 0, i32 1
  %139 = load i32, ptr %138, align 4
  store i32 %139, ptr %6, align 4
  %140 = load ptr, ptr %5, align 8
  %141 = getelementptr inbounds %struct.png_XYZ, ptr %140, i32 0, i32 4
  %142 = load i32, ptr %141, align 4
  %143 = load ptr, ptr %5, align 8
  %144 = getelementptr inbounds %struct.png_XYZ, ptr %143, i32 0, i32 7
  %145 = load i32, ptr %144, align 4
  %146 = call i32 @png_safe_add(ptr noundef %6, i32 noundef %142, i32 noundef %145)
  %147 = icmp ne i32 %146, 0
  br i1 %147, label %148, label %149

148:                                              ; preds = %135
  store i32 1, ptr %3, align 4
  br label %167

149:                                              ; preds = %135
  %150 = load i32, ptr %6, align 4
  store i32 %150, ptr %12, align 4
  %151 = load ptr, ptr %4, align 8
  %152 = getelementptr inbounds %struct.png_xy, ptr %151, i32 0, i32 6
  %153 = load i32, ptr %11, align 4
  %154 = load i32, ptr %10, align 4
  %155 = call i32 @png_muldiv(ptr noundef %152, i32 noundef %153, i32 noundef 100000, i32 noundef %154)
  %156 = icmp eq i32 %155, 0
  br i1 %156, label %157, label %158

157:                                              ; preds = %149
  store i32 1, ptr %3, align 4
  br label %167

158:                                              ; preds = %149
  %159 = load ptr, ptr %4, align 8
  %160 = getelementptr inbounds %struct.png_xy, ptr %159, i32 0, i32 7
  %161 = load i32, ptr %12, align 4
  %162 = load i32, ptr %10, align 4
  %163 = call i32 @png_muldiv(ptr noundef %160, i32 noundef %161, i32 noundef 100000, i32 noundef %162)
  %164 = icmp eq i32 %163, 0
  br i1 %164, label %165, label %166

165:                                              ; preds = %158
  store i32 1, ptr %3, align 4
  br label %167

166:                                              ; preds = %158
  store i32 0, ptr %3, align 4
  br label %167

167:                                              ; preds = %166, %165, %157, %148, %134, %120, %113, %103, %92, %79, %69, %58, %45, %35, %24
  %168 = load i32, ptr %3, align 4
  ret i32 %168
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_safe_add(ptr noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = load i32, ptr %9, align 4
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %6, align 4
  %13 = call i32 @png_fp_add(i32 noundef %11, i32 noundef %12, ptr noundef %7)
  %14 = call i32 @png_fp_add(i32 noundef %10, i32 noundef %13, ptr noundef %7)
  store i32 %14, ptr %8, align 4
  %15 = load i32, ptr %7, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %20, label %17

17:                                               ; preds = %3
  %18 = load i32, ptr %8, align 4
  %19 = load ptr, ptr %4, align 8
  store i32 %18, ptr %19, align 4
  br label %20

20:                                               ; preds = %17, %3
  %21 = load i32, ptr %7, align 4
  ret i32 %21
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_muldiv(ptr noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  store ptr %0, ptr %6, align 8
  store i32 %1, ptr %7, align 4
  store i32 %2, ptr %8, align 4
  store i32 %3, ptr %9, align 4
  %11 = load i32, ptr %9, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %46

13:                                               ; preds = %4
  %14 = load i32, ptr %7, align 4
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %19, label %16

16:                                               ; preds = %13
  %17 = load i32, ptr %8, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %16, %13
  %20 = load ptr, ptr %6, align 8
  store i32 0, ptr %20, align 4
  store i32 1, ptr %5, align 4
  br label %47

21:                                               ; preds = %16
  %22 = load i32, ptr %7, align 4
  %23 = sitofp i32 %22 to double
  store double %23, ptr %10, align 8
  %24 = load i32, ptr %8, align 4
  %25 = sitofp i32 %24 to double
  %26 = load double, ptr %10, align 8
  %27 = fmul double %26, %25
  store double %27, ptr %10, align 8
  %28 = load i32, ptr %9, align 4
  %29 = sitofp i32 %28 to double
  %30 = load double, ptr %10, align 8
  %31 = fdiv double %30, %29
  store double %31, ptr %10, align 8
  %32 = load double, ptr %10, align 8
  %33 = fadd double %32, 5.000000e-01
  %34 = call double @llvm.floor.f64(double %33)
  store double %34, ptr %10, align 8
  %35 = load double, ptr %10, align 8
  %36 = fcmp ole double %35, 0x41DFFFFFFFC00000
  br i1 %36, label %37, label %44

37:                                               ; preds = %21
  %38 = load double, ptr %10, align 8
  %39 = fcmp oge double %38, 0xC1E0000000000000
  br i1 %39, label %40, label %44

40:                                               ; preds = %37
  %41 = load double, ptr %10, align 8
  %42 = fptosi double %41 to i32
  %43 = load ptr, ptr %6, align 8
  store i32 %42, ptr %43, align 4
  store i32 1, ptr %5, align 4
  br label %47

44:                                               ; preds = %37, %21
  br label %45

45:                                               ; preds = %44
  br label %46

46:                                               ; preds = %45, %4
  store i32 0, ptr %5, align 4
  br label %47

47:                                               ; preds = %46, %40, %19
  %48 = load i32, ptr %5, align 4
  ret i32 %48
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_XYZ_from_xy(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
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
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 110000, ptr %12, align 4
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds %struct.png_xy, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 4
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %23, label %18

18:                                               ; preds = %2
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds %struct.png_xy, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 4
  %22 = icmp sgt i32 %21, 110000
  br i1 %22, label %23, label %24

23:                                               ; preds = %18, %2
  store i32 1, ptr %3, align 4
  br label %395

24:                                               ; preds = %18
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds %struct.png_xy, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 4
  %28 = icmp slt i32 %27, 0
  br i1 %28, label %38, label %29

29:                                               ; preds = %24
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds %struct.png_xy, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 4
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds %struct.png_xy, ptr %33, i32 0, i32 0
  %35 = load i32, ptr %34, align 4
  %36 = sub nsw i32 110000, %35
  %37 = icmp sgt i32 %32, %36
  br i1 %37, label %38, label %39

38:                                               ; preds = %29, %24
  store i32 1, ptr %3, align 4
  br label %395

39:                                               ; preds = %29
  %40 = load ptr, ptr %5, align 8
  %41 = getelementptr inbounds %struct.png_xy, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %41, align 4
  %43 = icmp slt i32 %42, 0
  br i1 %43, label %49, label %44

44:                                               ; preds = %39
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds %struct.png_xy, ptr %45, i32 0, i32 2
  %47 = load i32, ptr %46, align 4
  %48 = icmp sgt i32 %47, 110000
  br i1 %48, label %49, label %50

49:                                               ; preds = %44, %39
  store i32 1, ptr %3, align 4
  br label %395

50:                                               ; preds = %44
  %51 = load ptr, ptr %5, align 8
  %52 = getelementptr inbounds %struct.png_xy, ptr %51, i32 0, i32 3
  %53 = load i32, ptr %52, align 4
  %54 = icmp slt i32 %53, 0
  br i1 %54, label %64, label %55

55:                                               ; preds = %50
  %56 = load ptr, ptr %5, align 8
  %57 = getelementptr inbounds %struct.png_xy, ptr %56, i32 0, i32 3
  %58 = load i32, ptr %57, align 4
  %59 = load ptr, ptr %5, align 8
  %60 = getelementptr inbounds %struct.png_xy, ptr %59, i32 0, i32 2
  %61 = load i32, ptr %60, align 4
  %62 = sub nsw i32 110000, %61
  %63 = icmp sgt i32 %58, %62
  br i1 %63, label %64, label %65

64:                                               ; preds = %55, %50
  store i32 1, ptr %3, align 4
  br label %395

65:                                               ; preds = %55
  %66 = load ptr, ptr %5, align 8
  %67 = getelementptr inbounds %struct.png_xy, ptr %66, i32 0, i32 4
  %68 = load i32, ptr %67, align 4
  %69 = icmp slt i32 %68, 0
  br i1 %69, label %75, label %70

70:                                               ; preds = %65
  %71 = load ptr, ptr %5, align 8
  %72 = getelementptr inbounds %struct.png_xy, ptr %71, i32 0, i32 4
  %73 = load i32, ptr %72, align 4
  %74 = icmp sgt i32 %73, 110000
  br i1 %74, label %75, label %76

75:                                               ; preds = %70, %65
  store i32 1, ptr %3, align 4
  br label %395

76:                                               ; preds = %70
  %77 = load ptr, ptr %5, align 8
  %78 = getelementptr inbounds %struct.png_xy, ptr %77, i32 0, i32 5
  %79 = load i32, ptr %78, align 4
  %80 = icmp slt i32 %79, 0
  br i1 %80, label %90, label %81

81:                                               ; preds = %76
  %82 = load ptr, ptr %5, align 8
  %83 = getelementptr inbounds %struct.png_xy, ptr %82, i32 0, i32 5
  %84 = load i32, ptr %83, align 4
  %85 = load ptr, ptr %5, align 8
  %86 = getelementptr inbounds %struct.png_xy, ptr %85, i32 0, i32 4
  %87 = load i32, ptr %86, align 4
  %88 = sub nsw i32 110000, %87
  %89 = icmp sgt i32 %84, %88
  br i1 %89, label %90, label %91

90:                                               ; preds = %81, %76
  store i32 1, ptr %3, align 4
  br label %395

91:                                               ; preds = %81
  %92 = load ptr, ptr %5, align 8
  %93 = getelementptr inbounds %struct.png_xy, ptr %92, i32 0, i32 6
  %94 = load i32, ptr %93, align 4
  %95 = icmp slt i32 %94, 0
  br i1 %95, label %101, label %96

96:                                               ; preds = %91
  %97 = load ptr, ptr %5, align 8
  %98 = getelementptr inbounds %struct.png_xy, ptr %97, i32 0, i32 6
  %99 = load i32, ptr %98, align 4
  %100 = icmp sgt i32 %99, 110000
  br i1 %100, label %101, label %102

101:                                              ; preds = %96, %91
  store i32 1, ptr %3, align 4
  br label %395

102:                                              ; preds = %96
  %103 = load ptr, ptr %5, align 8
  %104 = getelementptr inbounds %struct.png_xy, ptr %103, i32 0, i32 7
  %105 = load i32, ptr %104, align 4
  %106 = icmp slt i32 %105, 5
  br i1 %106, label %116, label %107

107:                                              ; preds = %102
  %108 = load ptr, ptr %5, align 8
  %109 = getelementptr inbounds %struct.png_xy, ptr %108, i32 0, i32 7
  %110 = load i32, ptr %109, align 4
  %111 = load ptr, ptr %5, align 8
  %112 = getelementptr inbounds %struct.png_xy, ptr %111, i32 0, i32 6
  %113 = load i32, ptr %112, align 4
  %114 = sub nsw i32 110000, %113
  %115 = icmp sgt i32 %110, %114
  br i1 %115, label %116, label %117

116:                                              ; preds = %107, %102
  store i32 1, ptr %3, align 4
  br label %395

117:                                              ; preds = %107
  store i32 0, ptr %13, align 4
  %118 = load ptr, ptr %5, align 8
  %119 = getelementptr inbounds %struct.png_xy, ptr %118, i32 0, i32 2
  %120 = load i32, ptr %119, align 4
  %121 = load ptr, ptr %5, align 8
  %122 = getelementptr inbounds %struct.png_xy, ptr %121, i32 0, i32 4
  %123 = load i32, ptr %122, align 4
  %124 = sub nsw i32 %120, %123
  %125 = load ptr, ptr %5, align 8
  %126 = getelementptr inbounds %struct.png_xy, ptr %125, i32 0, i32 1
  %127 = load i32, ptr %126, align 4
  %128 = load ptr, ptr %5, align 8
  %129 = getelementptr inbounds %struct.png_xy, ptr %128, i32 0, i32 5
  %130 = load i32, ptr %129, align 4
  %131 = sub nsw i32 %127, %130
  %132 = call i32 @png_muldiv(ptr noundef %9, i32 noundef %124, i32 noundef %131, i32 noundef 8)
  %133 = icmp eq i32 %132, 0
  br i1 %133, label %134, label %135

134:                                              ; preds = %117
  store i32 1, ptr %3, align 4
  br label %395

135:                                              ; preds = %117
  %136 = load ptr, ptr %5, align 8
  %137 = getelementptr inbounds %struct.png_xy, ptr %136, i32 0, i32 3
  %138 = load i32, ptr %137, align 4
  %139 = load ptr, ptr %5, align 8
  %140 = getelementptr inbounds %struct.png_xy, ptr %139, i32 0, i32 5
  %141 = load i32, ptr %140, align 4
  %142 = sub nsw i32 %138, %141
  %143 = load ptr, ptr %5, align 8
  %144 = getelementptr inbounds %struct.png_xy, ptr %143, i32 0, i32 0
  %145 = load i32, ptr %144, align 4
  %146 = load ptr, ptr %5, align 8
  %147 = getelementptr inbounds %struct.png_xy, ptr %146, i32 0, i32 4
  %148 = load i32, ptr %147, align 4
  %149 = sub nsw i32 %145, %148
  %150 = call i32 @png_muldiv(ptr noundef %10, i32 noundef %142, i32 noundef %149, i32 noundef 8)
  %151 = icmp eq i32 %150, 0
  br i1 %151, label %152, label %153

152:                                              ; preds = %135
  store i32 1, ptr %3, align 4
  br label %395

153:                                              ; preds = %135
  %154 = load i32, ptr %9, align 4
  %155 = load i32, ptr %10, align 4
  %156 = call i32 @png_fp_sub(i32 noundef %154, i32 noundef %155, ptr noundef %13)
  store i32 %156, ptr %11, align 4
  %157 = load i32, ptr %13, align 4
  %158 = icmp ne i32 %157, 0
  br i1 %158, label %159, label %160

159:                                              ; preds = %153
  store i32 1, ptr %3, align 4
  br label %395

160:                                              ; preds = %153
  %161 = load ptr, ptr %5, align 8
  %162 = getelementptr inbounds %struct.png_xy, ptr %161, i32 0, i32 2
  %163 = load i32, ptr %162, align 4
  %164 = load ptr, ptr %5, align 8
  %165 = getelementptr inbounds %struct.png_xy, ptr %164, i32 0, i32 4
  %166 = load i32, ptr %165, align 4
  %167 = sub nsw i32 %163, %166
  %168 = load ptr, ptr %5, align 8
  %169 = getelementptr inbounds %struct.png_xy, ptr %168, i32 0, i32 7
  %170 = load i32, ptr %169, align 4
  %171 = load ptr, ptr %5, align 8
  %172 = getelementptr inbounds %struct.png_xy, ptr %171, i32 0, i32 5
  %173 = load i32, ptr %172, align 4
  %174 = sub nsw i32 %170, %173
  %175 = call i32 @png_muldiv(ptr noundef %9, i32 noundef %167, i32 noundef %174, i32 noundef 8)
  %176 = icmp eq i32 %175, 0
  br i1 %176, label %177, label %178

177:                                              ; preds = %160
  store i32 1, ptr %3, align 4
  br label %395

178:                                              ; preds = %160
  %179 = load ptr, ptr %5, align 8
  %180 = getelementptr inbounds %struct.png_xy, ptr %179, i32 0, i32 3
  %181 = load i32, ptr %180, align 4
  %182 = load ptr, ptr %5, align 8
  %183 = getelementptr inbounds %struct.png_xy, ptr %182, i32 0, i32 5
  %184 = load i32, ptr %183, align 4
  %185 = sub nsw i32 %181, %184
  %186 = load ptr, ptr %5, align 8
  %187 = getelementptr inbounds %struct.png_xy, ptr %186, i32 0, i32 6
  %188 = load i32, ptr %187, align 4
  %189 = load ptr, ptr %5, align 8
  %190 = getelementptr inbounds %struct.png_xy, ptr %189, i32 0, i32 4
  %191 = load i32, ptr %190, align 4
  %192 = sub nsw i32 %188, %191
  %193 = call i32 @png_muldiv(ptr noundef %10, i32 noundef %185, i32 noundef %192, i32 noundef 8)
  %194 = icmp eq i32 %193, 0
  br i1 %194, label %195, label %196

195:                                              ; preds = %178
  store i32 1, ptr %3, align 4
  br label %395

196:                                              ; preds = %178
  %197 = load ptr, ptr %5, align 8
  %198 = getelementptr inbounds %struct.png_xy, ptr %197, i32 0, i32 7
  %199 = load i32, ptr %198, align 4
  %200 = load i32, ptr %11, align 4
  %201 = load i32, ptr %9, align 4
  %202 = load i32, ptr %10, align 4
  %203 = call i32 @png_fp_sub(i32 noundef %201, i32 noundef %202, ptr noundef %13)
  %204 = call i32 @png_muldiv(ptr noundef %6, i32 noundef %199, i32 noundef %200, i32 noundef %203)
  %205 = icmp eq i32 %204, 0
  br i1 %205, label %215, label %206

206:                                              ; preds = %196
  %207 = load i32, ptr %13, align 4
  %208 = icmp ne i32 %207, 0
  br i1 %208, label %215, label %209

209:                                              ; preds = %206
  %210 = load i32, ptr %6, align 4
  %211 = load ptr, ptr %5, align 8
  %212 = getelementptr inbounds %struct.png_xy, ptr %211, i32 0, i32 7
  %213 = load i32, ptr %212, align 4
  %214 = icmp sle i32 %210, %213
  br i1 %214, label %215, label %216

215:                                              ; preds = %209, %206, %196
  store i32 1, ptr %3, align 4
  br label %395

216:                                              ; preds = %209
  %217 = load ptr, ptr %5, align 8
  %218 = getelementptr inbounds %struct.png_xy, ptr %217, i32 0, i32 1
  %219 = load i32, ptr %218, align 4
  %220 = load ptr, ptr %5, align 8
  %221 = getelementptr inbounds %struct.png_xy, ptr %220, i32 0, i32 5
  %222 = load i32, ptr %221, align 4
  %223 = sub nsw i32 %219, %222
  %224 = load ptr, ptr %5, align 8
  %225 = getelementptr inbounds %struct.png_xy, ptr %224, i32 0, i32 6
  %226 = load i32, ptr %225, align 4
  %227 = load ptr, ptr %5, align 8
  %228 = getelementptr inbounds %struct.png_xy, ptr %227, i32 0, i32 4
  %229 = load i32, ptr %228, align 4
  %230 = sub nsw i32 %226, %229
  %231 = call i32 @png_muldiv(ptr noundef %9, i32 noundef %223, i32 noundef %230, i32 noundef 8)
  %232 = icmp eq i32 %231, 0
  br i1 %232, label %233, label %234

233:                                              ; preds = %216
  store i32 1, ptr %3, align 4
  br label %395

234:                                              ; preds = %216
  %235 = load ptr, ptr %5, align 8
  %236 = getelementptr inbounds %struct.png_xy, ptr %235, i32 0, i32 0
  %237 = load i32, ptr %236, align 4
  %238 = load ptr, ptr %5, align 8
  %239 = getelementptr inbounds %struct.png_xy, ptr %238, i32 0, i32 4
  %240 = load i32, ptr %239, align 4
  %241 = sub nsw i32 %237, %240
  %242 = load ptr, ptr %5, align 8
  %243 = getelementptr inbounds %struct.png_xy, ptr %242, i32 0, i32 7
  %244 = load i32, ptr %243, align 4
  %245 = load ptr, ptr %5, align 8
  %246 = getelementptr inbounds %struct.png_xy, ptr %245, i32 0, i32 5
  %247 = load i32, ptr %246, align 4
  %248 = sub nsw i32 %244, %247
  %249 = call i32 @png_muldiv(ptr noundef %10, i32 noundef %241, i32 noundef %248, i32 noundef 8)
  %250 = icmp eq i32 %249, 0
  br i1 %250, label %251, label %252

251:                                              ; preds = %234
  store i32 1, ptr %3, align 4
  br label %395

252:                                              ; preds = %234
  %253 = load ptr, ptr %5, align 8
  %254 = getelementptr inbounds %struct.png_xy, ptr %253, i32 0, i32 7
  %255 = load i32, ptr %254, align 4
  %256 = load i32, ptr %11, align 4
  %257 = load i32, ptr %9, align 4
  %258 = load i32, ptr %10, align 4
  %259 = call i32 @png_fp_sub(i32 noundef %257, i32 noundef %258, ptr noundef %13)
  %260 = call i32 @png_muldiv(ptr noundef %7, i32 noundef %255, i32 noundef %256, i32 noundef %259)
  %261 = icmp eq i32 %260, 0
  br i1 %261, label %271, label %262

262:                                              ; preds = %252
  %263 = load i32, ptr %13, align 4
  %264 = icmp ne i32 %263, 0
  br i1 %264, label %271, label %265

265:                                              ; preds = %262
  %266 = load i32, ptr %7, align 4
  %267 = load ptr, ptr %5, align 8
  %268 = getelementptr inbounds %struct.png_xy, ptr %267, i32 0, i32 7
  %269 = load i32, ptr %268, align 4
  %270 = icmp sle i32 %266, %269
  br i1 %270, label %271, label %272

271:                                              ; preds = %265, %262, %252
  store i32 1, ptr %3, align 4
  br label %395

272:                                              ; preds = %265
  %273 = load ptr, ptr %5, align 8
  %274 = getelementptr inbounds %struct.png_xy, ptr %273, i32 0, i32 7
  %275 = load i32, ptr %274, align 4
  %276 = call i32 @png_reciprocal(i32 noundef %275)
  %277 = load i32, ptr %6, align 4
  %278 = call i32 @png_reciprocal(i32 noundef %277)
  %279 = call i32 @png_fp_sub(i32 noundef %276, i32 noundef %278, ptr noundef %13)
  %280 = load i32, ptr %7, align 4
  %281 = call i32 @png_reciprocal(i32 noundef %280)
  %282 = call i32 @png_fp_sub(i32 noundef %279, i32 noundef %281, ptr noundef %13)
  store i32 %282, ptr %8, align 4
  %283 = load i32, ptr %13, align 4
  %284 = icmp ne i32 %283, 0
  br i1 %284, label %288, label %285

285:                                              ; preds = %272
  %286 = load i32, ptr %8, align 4
  %287 = icmp sle i32 %286, 0
  br i1 %287, label %288, label %289

288:                                              ; preds = %285, %272
  store i32 1, ptr %3, align 4
  br label %395

289:                                              ; preds = %285
  %290 = load ptr, ptr %4, align 8
  %291 = getelementptr inbounds %struct.png_XYZ, ptr %290, i32 0, i32 0
  %292 = load ptr, ptr %5, align 8
  %293 = getelementptr inbounds %struct.png_xy, ptr %292, i32 0, i32 0
  %294 = load i32, ptr %293, align 4
  %295 = load i32, ptr %6, align 4
  %296 = call i32 @png_muldiv(ptr noundef %291, i32 noundef %294, i32 noundef 100000, i32 noundef %295)
  %297 = icmp eq i32 %296, 0
  br i1 %297, label %298, label %299

298:                                              ; preds = %289
  store i32 1, ptr %3, align 4
  br label %395

299:                                              ; preds = %289
  %300 = load ptr, ptr %4, align 8
  %301 = getelementptr inbounds %struct.png_XYZ, ptr %300, i32 0, i32 1
  %302 = load ptr, ptr %5, align 8
  %303 = getelementptr inbounds %struct.png_xy, ptr %302, i32 0, i32 1
  %304 = load i32, ptr %303, align 4
  %305 = load i32, ptr %6, align 4
  %306 = call i32 @png_muldiv(ptr noundef %301, i32 noundef %304, i32 noundef 100000, i32 noundef %305)
  %307 = icmp eq i32 %306, 0
  br i1 %307, label %308, label %309

308:                                              ; preds = %299
  store i32 1, ptr %3, align 4
  br label %395

309:                                              ; preds = %299
  %310 = load ptr, ptr %4, align 8
  %311 = getelementptr inbounds %struct.png_XYZ, ptr %310, i32 0, i32 2
  %312 = load ptr, ptr %5, align 8
  %313 = getelementptr inbounds %struct.png_xy, ptr %312, i32 0, i32 0
  %314 = load i32, ptr %313, align 4
  %315 = sub nsw i32 100000, %314
  %316 = load ptr, ptr %5, align 8
  %317 = getelementptr inbounds %struct.png_xy, ptr %316, i32 0, i32 1
  %318 = load i32, ptr %317, align 4
  %319 = sub nsw i32 %315, %318
  %320 = load i32, ptr %6, align 4
  %321 = call i32 @png_muldiv(ptr noundef %311, i32 noundef %319, i32 noundef 100000, i32 noundef %320)
  %322 = icmp eq i32 %321, 0
  br i1 %322, label %323, label %324

323:                                              ; preds = %309
  store i32 1, ptr %3, align 4
  br label %395

324:                                              ; preds = %309
  %325 = load ptr, ptr %4, align 8
  %326 = getelementptr inbounds %struct.png_XYZ, ptr %325, i32 0, i32 3
  %327 = load ptr, ptr %5, align 8
  %328 = getelementptr inbounds %struct.png_xy, ptr %327, i32 0, i32 2
  %329 = load i32, ptr %328, align 4
  %330 = load i32, ptr %7, align 4
  %331 = call i32 @png_muldiv(ptr noundef %326, i32 noundef %329, i32 noundef 100000, i32 noundef %330)
  %332 = icmp eq i32 %331, 0
  br i1 %332, label %333, label %334

333:                                              ; preds = %324
  store i32 1, ptr %3, align 4
  br label %395

334:                                              ; preds = %324
  %335 = load ptr, ptr %4, align 8
  %336 = getelementptr inbounds %struct.png_XYZ, ptr %335, i32 0, i32 4
  %337 = load ptr, ptr %5, align 8
  %338 = getelementptr inbounds %struct.png_xy, ptr %337, i32 0, i32 3
  %339 = load i32, ptr %338, align 4
  %340 = load i32, ptr %7, align 4
  %341 = call i32 @png_muldiv(ptr noundef %336, i32 noundef %339, i32 noundef 100000, i32 noundef %340)
  %342 = icmp eq i32 %341, 0
  br i1 %342, label %343, label %344

343:                                              ; preds = %334
  store i32 1, ptr %3, align 4
  br label %395

344:                                              ; preds = %334
  %345 = load ptr, ptr %4, align 8
  %346 = getelementptr inbounds %struct.png_XYZ, ptr %345, i32 0, i32 5
  %347 = load ptr, ptr %5, align 8
  %348 = getelementptr inbounds %struct.png_xy, ptr %347, i32 0, i32 2
  %349 = load i32, ptr %348, align 4
  %350 = sub nsw i32 100000, %349
  %351 = load ptr, ptr %5, align 8
  %352 = getelementptr inbounds %struct.png_xy, ptr %351, i32 0, i32 3
  %353 = load i32, ptr %352, align 4
  %354 = sub nsw i32 %350, %353
  %355 = load i32, ptr %7, align 4
  %356 = call i32 @png_muldiv(ptr noundef %346, i32 noundef %354, i32 noundef 100000, i32 noundef %355)
  %357 = icmp eq i32 %356, 0
  br i1 %357, label %358, label %359

358:                                              ; preds = %344
  store i32 1, ptr %3, align 4
  br label %395

359:                                              ; preds = %344
  %360 = load ptr, ptr %4, align 8
  %361 = getelementptr inbounds %struct.png_XYZ, ptr %360, i32 0, i32 6
  %362 = load ptr, ptr %5, align 8
  %363 = getelementptr inbounds %struct.png_xy, ptr %362, i32 0, i32 4
  %364 = load i32, ptr %363, align 4
  %365 = load i32, ptr %8, align 4
  %366 = call i32 @png_muldiv(ptr noundef %361, i32 noundef %364, i32 noundef %365, i32 noundef 100000)
  %367 = icmp eq i32 %366, 0
  br i1 %367, label %368, label %369

368:                                              ; preds = %359
  store i32 1, ptr %3, align 4
  br label %395

369:                                              ; preds = %359
  %370 = load ptr, ptr %4, align 8
  %371 = getelementptr inbounds %struct.png_XYZ, ptr %370, i32 0, i32 7
  %372 = load ptr, ptr %5, align 8
  %373 = getelementptr inbounds %struct.png_xy, ptr %372, i32 0, i32 5
  %374 = load i32, ptr %373, align 4
  %375 = load i32, ptr %8, align 4
  %376 = call i32 @png_muldiv(ptr noundef %371, i32 noundef %374, i32 noundef %375, i32 noundef 100000)
  %377 = icmp eq i32 %376, 0
  br i1 %377, label %378, label %379

378:                                              ; preds = %369
  store i32 1, ptr %3, align 4
  br label %395

379:                                              ; preds = %369
  %380 = load ptr, ptr %4, align 8
  %381 = getelementptr inbounds %struct.png_XYZ, ptr %380, i32 0, i32 8
  %382 = load ptr, ptr %5, align 8
  %383 = getelementptr inbounds %struct.png_xy, ptr %382, i32 0, i32 4
  %384 = load i32, ptr %383, align 4
  %385 = sub nsw i32 100000, %384
  %386 = load ptr, ptr %5, align 8
  %387 = getelementptr inbounds %struct.png_xy, ptr %386, i32 0, i32 5
  %388 = load i32, ptr %387, align 4
  %389 = sub nsw i32 %385, %388
  %390 = load i32, ptr %8, align 4
  %391 = call i32 @png_muldiv(ptr noundef %381, i32 noundef %389, i32 noundef %390, i32 noundef 100000)
  %392 = icmp eq i32 %391, 0
  br i1 %392, label %393, label %394

393:                                              ; preds = %379
  store i32 1, ptr %3, align 4
  br label %395

394:                                              ; preds = %379
  store i32 0, ptr %3, align 4
  br label %395

395:                                              ; preds = %394, %393, %378, %368, %358, %343, %333, %323, %308, %298, %288, %271, %251, %233, %215, %195, %177, %159, %152, %134, %116, %101, %90, %75, %64, %49, %38, %23
  %396 = load i32, ptr %3, align 4
  ret i32 %396
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_fp_sub(i32 noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  %8 = load i32, ptr %6, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %20

10:                                               ; preds = %3
  %11 = load i32, ptr %6, align 4
  %12 = add nsw i32 -2147483647, %11
  %13 = load i32, ptr %5, align 4
  %14 = icmp sle i32 %12, %13
  br i1 %14, label %15, label %19

15:                                               ; preds = %10
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %6, align 4
  %18 = sub nsw i32 %16, %17
  store i32 %18, ptr %4, align 4
  br label %38

19:                                               ; preds = %10
  br label %36

20:                                               ; preds = %3
  %21 = load i32, ptr %6, align 4
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %23, label %33

23:                                               ; preds = %20
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 2147483647, %24
  %26 = load i32, ptr %5, align 4
  %27 = icmp sge i32 %25, %26
  br i1 %27, label %28, label %32

28:                                               ; preds = %23
  %29 = load i32, ptr %5, align 4
  %30 = load i32, ptr %6, align 4
  %31 = sub nsw i32 %29, %30
  store i32 %31, ptr %4, align 4
  br label %38

32:                                               ; preds = %23
  br label %35

33:                                               ; preds = %20
  %34 = load i32, ptr %5, align 4
  store i32 %34, ptr %4, align 4
  br label %38

35:                                               ; preds = %32
  br label %36

36:                                               ; preds = %35, %19
  %37 = load ptr, ptr %7, align 8
  store i32 1, ptr %37, align 4
  store i32 50000, ptr %4, align 4
  br label %38

38:                                               ; preds = %36, %33, %28, %15
  %39 = load i32, ptr %4, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_reciprocal(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  store i32 %0, ptr %3, align 4
  %5 = load i32, ptr %3, align 4
  %6 = sitofp i32 %5 to double
  %7 = fdiv double 1.000000e+10, %6
  %8 = fadd double %7, 5.000000e-01
  %9 = call double @llvm.floor.f64(double %8)
  store double %9, ptr %4, align 8
  %10 = load double, ptr %4, align 8
  %11 = fcmp ole double %10, 0x41DFFFFFFFC00000
  br i1 %11, label %12, label %18

12:                                               ; preds = %1
  %13 = load double, ptr %4, align 8
  %14 = fcmp oge double %13, 0xC1E0000000000000
  br i1 %14, label %15, label %18

15:                                               ; preds = %12
  %16 = load double, ptr %4, align 8
  %17 = fptosi double %16 to i32
  store i32 %17, ptr %2, align 4
  br label %19

18:                                               ; preds = %12, %1
  store i32 0, ptr %2, align 4
  br label %19

19:                                               ; preds = %18, %15
  %20 = load i32, ptr %2, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_icc_check_length(ptr noalias noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = load i32, ptr %7, align 4
  %11 = call i32 @icc_check_length(ptr noundef %8, ptr noundef %9, i32 noundef %10)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %14, label %13

13:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %28

14:                                               ; preds = %3
  %15 = load i32, ptr %7, align 4
  %16 = zext i32 %15 to i64
  %17 = load ptr, ptr %5, align 8
  %18 = getelementptr inbounds %struct.png_struct_def, ptr %17, i32 0, i32 141
  %19 = load i64, ptr %18, align 8
  %20 = icmp ugt i64 %16, %19
  br i1 %20, label %21, label %27

21:                                               ; preds = %14
  %22 = load ptr, ptr %5, align 8
  %23 = load ptr, ptr %6, align 8
  %24 = load i32, ptr %7, align 4
  %25 = zext i32 %24 to i64
  %26 = call i32 @png_icc_profile_error(ptr noundef %22, ptr noundef %23, i64 noundef %25, ptr noundef @.str.20)
  store i32 %26, ptr %4, align 4
  br label %28

27:                                               ; preds = %14
  store i32 1, ptr %4, align 4
  br label %28

28:                                               ; preds = %27, %21, %13
  %29 = load i32, ptr %4, align 4
  ret i32 %29
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @icc_check_length(ptr noalias noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  %8 = load i32, ptr %7, align 4
  %9 = icmp ult i32 %8, 132
  br i1 %9, label %10, label %16

10:                                               ; preds = %3
  %11 = load ptr, ptr %5, align 8
  %12 = load ptr, ptr %6, align 8
  %13 = load i32, ptr %7, align 4
  %14 = zext i32 %13 to i64
  %15 = call i32 @png_icc_profile_error(ptr noundef %11, ptr noundef %12, i64 noundef %14, ptr noundef @.str.57)
  store i32 %15, ptr %4, align 4
  br label %17

16:                                               ; preds = %3
  store i32 1, ptr %4, align 4
  br label %17

17:                                               ; preds = %16, %10
  %18 = load i32, ptr %4, align 4
  ret i32 %18
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_icc_profile_error(ptr noalias noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca [196 x i8], align 16
  %11 = alloca [24 x i8], align 16
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %12 = getelementptr inbounds [196 x i8], ptr %10, i64 0, i64 0
  %13 = call i64 @png_safecat(ptr noundef %12, i64 noundef 196, i64 noundef 0, ptr noundef @.str.58)
  store i64 %13, ptr %9, align 8
  %14 = getelementptr inbounds [196 x i8], ptr %10, i64 0, i64 0
  %15 = load i64, ptr %9, align 8
  %16 = add i64 %15, 79
  %17 = load i64, ptr %9, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = call i64 @png_safecat(ptr noundef %14, i64 noundef %16, i64 noundef %17, ptr noundef %18)
  store i64 %19, ptr %9, align 8
  %20 = getelementptr inbounds [196 x i8], ptr %10, i64 0, i64 0
  %21 = load i64, ptr %9, align 8
  %22 = call i64 @png_safecat(ptr noundef %20, i64 noundef 196, i64 noundef %21, ptr noundef @.str.59)
  store i64 %22, ptr %9, align 8
  %23 = load i64, ptr %7, align 8
  %24 = call i32 @is_ICC_signature(i64 noundef %23)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %40

26:                                               ; preds = %4
  %27 = getelementptr inbounds [196 x i8], ptr %10, i64 0, i64 0
  %28 = load i64, ptr %9, align 8
  %29 = getelementptr inbounds i8, ptr %27, i64 %28
  %30 = load i64, ptr %7, align 8
  %31 = trunc i64 %30 to i32
  call void @png_icc_tag_name(ptr noundef %29, i32 noundef %31)
  %32 = load i64, ptr %9, align 8
  %33 = add i64 %32, 6
  store i64 %33, ptr %9, align 8
  %34 = load i64, ptr %9, align 8
  %35 = add i64 %34, 1
  store i64 %35, ptr %9, align 8
  %36 = getelementptr inbounds [196 x i8], ptr %10, i64 0, i64 %34
  store i8 58, ptr %36, align 1
  %37 = load i64, ptr %9, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr %9, align 8
  %39 = getelementptr inbounds [196 x i8], ptr %10, i64 0, i64 %37
  store i8 32, ptr %39, align 1
  br label %52

40:                                               ; preds = %4
  %41 = getelementptr inbounds [196 x i8], ptr %10, i64 0, i64 0
  %42 = load i64, ptr %9, align 8
  %43 = getelementptr inbounds [24 x i8], ptr %11, i64 0, i64 0
  %44 = getelementptr inbounds [24 x i8], ptr %11, i64 0, i64 0
  %45 = getelementptr inbounds i8, ptr %44, i64 24
  %46 = load i64, ptr %7, align 8
  %47 = call ptr @png_format_number(ptr noundef %43, ptr noundef %45, i32 noundef 3, i64 noundef %46)
  %48 = call i64 @png_safecat(ptr noundef %41, i64 noundef 196, i64 noundef %42, ptr noundef %47)
  store i64 %48, ptr %9, align 8
  %49 = getelementptr inbounds [196 x i8], ptr %10, i64 0, i64 0
  %50 = load i64, ptr %9, align 8
  %51 = call i64 @png_safecat(ptr noundef %49, i64 noundef 196, i64 noundef %50, ptr noundef @.str.60)
  store i64 %51, ptr %9, align 8
  br label %52

52:                                               ; preds = %40, %26
  %53 = getelementptr inbounds [196 x i8], ptr %10, i64 0, i64 0
  %54 = load i64, ptr %9, align 8
  %55 = load ptr, ptr %8, align 8
  %56 = call i64 @png_safecat(ptr noundef %53, i64 noundef 196, i64 noundef %54, ptr noundef %55)
  store i64 %56, ptr %9, align 8
  %57 = load i64, ptr %9, align 8
  %58 = load ptr, ptr %5, align 8
  %59 = getelementptr inbounds [196 x i8], ptr %10, i64 0, i64 0
  call void @png_chunk_benign_error(ptr noundef %58, ptr noundef %59)
  ret i32 0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_icc_check_header(ptr noalias noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3, i32 noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store i32 %2, ptr %9, align 4
  store ptr %3, ptr %10, align 8
  store i32 %4, ptr %11, align 4
  %13 = load ptr, ptr %10, align 8
  %14 = load i8, ptr %13, align 1
  %15 = zext i8 %14 to i32
  %16 = shl i32 %15, 24
  %17 = load ptr, ptr %10, align 8
  %18 = getelementptr inbounds i8, ptr %17, i64 1
  %19 = load i8, ptr %18, align 1
  %20 = zext i8 %19 to i32
  %21 = shl i32 %20, 16
  %22 = add i32 %16, %21
  %23 = load ptr, ptr %10, align 8
  %24 = getelementptr inbounds i8, ptr %23, i64 2
  %25 = load i8, ptr %24, align 1
  %26 = zext i8 %25 to i32
  %27 = shl i32 %26, 8
  %28 = add i32 %22, %27
  %29 = load ptr, ptr %10, align 8
  %30 = getelementptr inbounds i8, ptr %29, i64 3
  %31 = load i8, ptr %30, align 1
  %32 = zext i8 %31 to i32
  %33 = add i32 %28, %32
  store i32 %33, ptr %12, align 4
  %34 = load i32, ptr %12, align 4
  %35 = load i32, ptr %9, align 4
  %36 = icmp ne i32 %34, %35
  br i1 %36, label %37, label %43

37:                                               ; preds = %5
  %38 = load ptr, ptr %7, align 8
  %39 = load ptr, ptr %8, align 8
  %40 = load i32, ptr %12, align 4
  %41 = zext i32 %40 to i64
  %42 = call i32 @png_icc_profile_error(ptr noundef %38, ptr noundef %39, i64 noundef %41, ptr noundef @.str.21)
  store i32 %42, ptr %6, align 4
  br label %328

43:                                               ; preds = %5
  %44 = load ptr, ptr %10, align 8
  %45 = getelementptr inbounds i8, ptr %44, i64 8
  %46 = load i8, ptr %45, align 1
  %47 = zext i8 %46 to i32
  store i32 %47, ptr %12, align 4
  %48 = load i32, ptr %12, align 4
  %49 = icmp ugt i32 %48, 3
  br i1 %49, label %50, label %60

50:                                               ; preds = %43
  %51 = load i32, ptr %9, align 4
  %52 = and i32 %51, 3
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %60

54:                                               ; preds = %50
  %55 = load ptr, ptr %7, align 8
  %56 = load ptr, ptr %8, align 8
  %57 = load i32, ptr %9, align 4
  %58 = zext i32 %57 to i64
  %59 = call i32 @png_icc_profile_error(ptr noundef %55, ptr noundef %56, i64 noundef %58, ptr noundef @.str.22)
  store i32 %59, ptr %6, align 4
  br label %328

60:                                               ; preds = %50, %43
  %61 = load ptr, ptr %10, align 8
  %62 = getelementptr inbounds i8, ptr %61, i64 128
  %63 = load i8, ptr %62, align 1
  %64 = zext i8 %63 to i32
  %65 = shl i32 %64, 24
  %66 = load ptr, ptr %10, align 8
  %67 = getelementptr inbounds i8, ptr %66, i64 128
  %68 = getelementptr inbounds i8, ptr %67, i64 1
  %69 = load i8, ptr %68, align 1
  %70 = zext i8 %69 to i32
  %71 = shl i32 %70, 16
  %72 = add i32 %65, %71
  %73 = load ptr, ptr %10, align 8
  %74 = getelementptr inbounds i8, ptr %73, i64 128
  %75 = getelementptr inbounds i8, ptr %74, i64 2
  %76 = load i8, ptr %75, align 1
  %77 = zext i8 %76 to i32
  %78 = shl i32 %77, 8
  %79 = add i32 %72, %78
  %80 = load ptr, ptr %10, align 8
  %81 = getelementptr inbounds i8, ptr %80, i64 128
  %82 = getelementptr inbounds i8, ptr %81, i64 3
  %83 = load i8, ptr %82, align 1
  %84 = zext i8 %83 to i32
  %85 = add i32 %79, %84
  store i32 %85, ptr %12, align 4
  %86 = load i32, ptr %12, align 4
  %87 = icmp ugt i32 %86, 357913930
  br i1 %87, label %94, label %88

88:                                               ; preds = %60
  %89 = load i32, ptr %9, align 4
  %90 = load i32, ptr %12, align 4
  %91 = mul i32 12, %90
  %92 = add i32 132, %91
  %93 = icmp ult i32 %89, %92
  br i1 %93, label %94, label %100

94:                                               ; preds = %88, %60
  %95 = load ptr, ptr %7, align 8
  %96 = load ptr, ptr %8, align 8
  %97 = load i32, ptr %12, align 4
  %98 = zext i32 %97 to i64
  %99 = call i32 @png_icc_profile_error(ptr noundef %95, ptr noundef %96, i64 noundef %98, ptr noundef @.str.23)
  store i32 %99, ptr %6, align 4
  br label %328

100:                                              ; preds = %88
  %101 = load ptr, ptr %10, align 8
  %102 = getelementptr inbounds i8, ptr %101, i64 64
  %103 = load i8, ptr %102, align 1
  %104 = zext i8 %103 to i32
  %105 = shl i32 %104, 24
  %106 = load ptr, ptr %10, align 8
  %107 = getelementptr inbounds i8, ptr %106, i64 64
  %108 = getelementptr inbounds i8, ptr %107, i64 1
  %109 = load i8, ptr %108, align 1
  %110 = zext i8 %109 to i32
  %111 = shl i32 %110, 16
  %112 = add i32 %105, %111
  %113 = load ptr, ptr %10, align 8
  %114 = getelementptr inbounds i8, ptr %113, i64 64
  %115 = getelementptr inbounds i8, ptr %114, i64 2
  %116 = load i8, ptr %115, align 1
  %117 = zext i8 %116 to i32
  %118 = shl i32 %117, 8
  %119 = add i32 %112, %118
  %120 = load ptr, ptr %10, align 8
  %121 = getelementptr inbounds i8, ptr %120, i64 64
  %122 = getelementptr inbounds i8, ptr %121, i64 3
  %123 = load i8, ptr %122, align 1
  %124 = zext i8 %123 to i32
  %125 = add i32 %119, %124
  store i32 %125, ptr %12, align 4
  %126 = load i32, ptr %12, align 4
  %127 = icmp uge i32 %126, 65535
  br i1 %127, label %128, label %134

128:                                              ; preds = %100
  %129 = load ptr, ptr %7, align 8
  %130 = load ptr, ptr %8, align 8
  %131 = load i32, ptr %12, align 4
  %132 = zext i32 %131 to i64
  %133 = call i32 @png_icc_profile_error(ptr noundef %129, ptr noundef %130, i64 noundef %132, ptr noundef @.str.24)
  store i32 %133, ptr %6, align 4
  br label %328

134:                                              ; preds = %100
  %135 = load i32, ptr %12, align 4
  %136 = icmp uge i32 %135, 4
  br i1 %136, label %137, label %143

137:                                              ; preds = %134
  %138 = load ptr, ptr %7, align 8
  %139 = load ptr, ptr %8, align 8
  %140 = load i32, ptr %12, align 4
  %141 = zext i32 %140 to i64
  %142 = call i32 @png_icc_profile_error(ptr noundef %138, ptr noundef %139, i64 noundef %141, ptr noundef @.str.25)
  br label %143

143:                                              ; preds = %137, %134
  %144 = load ptr, ptr %10, align 8
  %145 = getelementptr inbounds i8, ptr %144, i64 36
  %146 = load i8, ptr %145, align 1
  %147 = zext i8 %146 to i32
  %148 = shl i32 %147, 24
  %149 = load ptr, ptr %10, align 8
  %150 = getelementptr inbounds i8, ptr %149, i64 36
  %151 = getelementptr inbounds i8, ptr %150, i64 1
  %152 = load i8, ptr %151, align 1
  %153 = zext i8 %152 to i32
  %154 = shl i32 %153, 16
  %155 = add i32 %148, %154
  %156 = load ptr, ptr %10, align 8
  %157 = getelementptr inbounds i8, ptr %156, i64 36
  %158 = getelementptr inbounds i8, ptr %157, i64 2
  %159 = load i8, ptr %158, align 1
  %160 = zext i8 %159 to i32
  %161 = shl i32 %160, 8
  %162 = add i32 %155, %161
  %163 = load ptr, ptr %10, align 8
  %164 = getelementptr inbounds i8, ptr %163, i64 36
  %165 = getelementptr inbounds i8, ptr %164, i64 3
  %166 = load i8, ptr %165, align 1
  %167 = zext i8 %166 to i32
  %168 = add i32 %162, %167
  store i32 %168, ptr %12, align 4
  %169 = load i32, ptr %12, align 4
  %170 = icmp ne i32 %169, 1633907568
  br i1 %170, label %171, label %177

171:                                              ; preds = %143
  %172 = load ptr, ptr %7, align 8
  %173 = load ptr, ptr %8, align 8
  %174 = load i32, ptr %12, align 4
  %175 = zext i32 %174 to i64
  %176 = call i32 @png_icc_profile_error(ptr noundef %172, ptr noundef %173, i64 noundef %175, ptr noundef @.str.26)
  store i32 %176, ptr %6, align 4
  br label %328

177:                                              ; preds = %143
  %178 = load ptr, ptr %10, align 8
  %179 = getelementptr inbounds i8, ptr %178, i64 68
  %180 = call i32 @memcmp(ptr noundef %179, ptr noundef @D50_nCIEXYZ, i64 noundef 12) #11
  %181 = icmp ne i32 %180, 0
  br i1 %181, label %182, label %186

182:                                              ; preds = %177
  %183 = load ptr, ptr %7, align 8
  %184 = load ptr, ptr %8, align 8
  %185 = call i32 @png_icc_profile_error(ptr noundef %183, ptr noundef %184, i64 noundef 0, ptr noundef @.str.27)
  br label %186

186:                                              ; preds = %182, %177
  %187 = load ptr, ptr %10, align 8
  %188 = getelementptr inbounds i8, ptr %187, i64 16
  %189 = load i8, ptr %188, align 1
  %190 = zext i8 %189 to i32
  %191 = shl i32 %190, 24
  %192 = load ptr, ptr %10, align 8
  %193 = getelementptr inbounds i8, ptr %192, i64 16
  %194 = getelementptr inbounds i8, ptr %193, i64 1
  %195 = load i8, ptr %194, align 1
  %196 = zext i8 %195 to i32
  %197 = shl i32 %196, 16
  %198 = add i32 %191, %197
  %199 = load ptr, ptr %10, align 8
  %200 = getelementptr inbounds i8, ptr %199, i64 16
  %201 = getelementptr inbounds i8, ptr %200, i64 2
  %202 = load i8, ptr %201, align 1
  %203 = zext i8 %202 to i32
  %204 = shl i32 %203, 8
  %205 = add i32 %198, %204
  %206 = load ptr, ptr %10, align 8
  %207 = getelementptr inbounds i8, ptr %206, i64 16
  %208 = getelementptr inbounds i8, ptr %207, i64 3
  %209 = load i8, ptr %208, align 1
  %210 = zext i8 %209 to i32
  %211 = add i32 %205, %210
  store i32 %211, ptr %12, align 4
  %212 = load i32, ptr %12, align 4
  switch i32 %212, label %235 [
    i32 1380401696, label %213
    i32 1196573017, label %224
  ]

213:                                              ; preds = %186
  %214 = load i32, ptr %11, align 4
  %215 = and i32 %214, 2
  %216 = icmp eq i32 %215, 0
  br i1 %216, label %217, label %223

217:                                              ; preds = %213
  %218 = load ptr, ptr %7, align 8
  %219 = load ptr, ptr %8, align 8
  %220 = load i32, ptr %12, align 4
  %221 = zext i32 %220 to i64
  %222 = call i32 @png_icc_profile_error(ptr noundef %218, ptr noundef %219, i64 noundef %221, ptr noundef @.str.28)
  store i32 %222, ptr %6, align 4
  br label %328

223:                                              ; preds = %213
  br label %241

224:                                              ; preds = %186
  %225 = load i32, ptr %11, align 4
  %226 = and i32 %225, 2
  %227 = icmp ne i32 %226, 0
  br i1 %227, label %228, label %234

228:                                              ; preds = %224
  %229 = load ptr, ptr %7, align 8
  %230 = load ptr, ptr %8, align 8
  %231 = load i32, ptr %12, align 4
  %232 = zext i32 %231 to i64
  %233 = call i32 @png_icc_profile_error(ptr noundef %229, ptr noundef %230, i64 noundef %232, ptr noundef @.str.29)
  store i32 %233, ptr %6, align 4
  br label %328

234:                                              ; preds = %224
  br label %241

235:                                              ; preds = %186
  %236 = load ptr, ptr %7, align 8
  %237 = load ptr, ptr %8, align 8
  %238 = load i32, ptr %12, align 4
  %239 = zext i32 %238 to i64
  %240 = call i32 @png_icc_profile_error(ptr noundef %236, ptr noundef %237, i64 noundef %239, ptr noundef @.str.30)
  store i32 %240, ptr %6, align 4
  br label %328

241:                                              ; preds = %234, %223
  %242 = load ptr, ptr %10, align 8
  %243 = getelementptr inbounds i8, ptr %242, i64 12
  %244 = load i8, ptr %243, align 1
  %245 = zext i8 %244 to i32
  %246 = shl i32 %245, 24
  %247 = load ptr, ptr %10, align 8
  %248 = getelementptr inbounds i8, ptr %247, i64 12
  %249 = getelementptr inbounds i8, ptr %248, i64 1
  %250 = load i8, ptr %249, align 1
  %251 = zext i8 %250 to i32
  %252 = shl i32 %251, 16
  %253 = add i32 %246, %252
  %254 = load ptr, ptr %10, align 8
  %255 = getelementptr inbounds i8, ptr %254, i64 12
  %256 = getelementptr inbounds i8, ptr %255, i64 2
  %257 = load i8, ptr %256, align 1
  %258 = zext i8 %257 to i32
  %259 = shl i32 %258, 8
  %260 = add i32 %253, %259
  %261 = load ptr, ptr %10, align 8
  %262 = getelementptr inbounds i8, ptr %261, i64 12
  %263 = getelementptr inbounds i8, ptr %262, i64 3
  %264 = load i8, ptr %263, align 1
  %265 = zext i8 %264 to i32
  %266 = add i32 %260, %265
  store i32 %266, ptr %12, align 4
  %267 = load i32, ptr %12, align 4
  switch i32 %267, label %287 [
    i32 1935896178, label %268
    i32 1835955314, label %268
    i32 1886549106, label %268
    i32 1936744803, label %268
    i32 1633842036, label %269
    i32 1818848875, label %275
    i32 1852662636, label %281
  ]

268:                                              ; preds = %241, %241, %241, %241
  br label %293

269:                                              ; preds = %241
  %270 = load ptr, ptr %7, align 8
  %271 = load ptr, ptr %8, align 8
  %272 = load i32, ptr %12, align 4
  %273 = zext i32 %272 to i64
  %274 = call i32 @png_icc_profile_error(ptr noundef %270, ptr noundef %271, i64 noundef %273, ptr noundef @.str.31)
  store i32 %274, ptr %6, align 4
  br label %328

275:                                              ; preds = %241
  %276 = load ptr, ptr %7, align 8
  %277 = load ptr, ptr %8, align 8
  %278 = load i32, ptr %12, align 4
  %279 = zext i32 %278 to i64
  %280 = call i32 @png_icc_profile_error(ptr noundef %276, ptr noundef %277, i64 noundef %279, ptr noundef @.str.32)
  store i32 %280, ptr %6, align 4
  br label %328

281:                                              ; preds = %241
  %282 = load ptr, ptr %7, align 8
  %283 = load ptr, ptr %8, align 8
  %284 = load i32, ptr %12, align 4
  %285 = zext i32 %284 to i64
  %286 = call i32 @png_icc_profile_error(ptr noundef %282, ptr noundef %283, i64 noundef %285, ptr noundef @.str.33)
  br label %293

287:                                              ; preds = %241
  %288 = load ptr, ptr %7, align 8
  %289 = load ptr, ptr %8, align 8
  %290 = load i32, ptr %12, align 4
  %291 = zext i32 %290 to i64
  %292 = call i32 @png_icc_profile_error(ptr noundef %288, ptr noundef %289, i64 noundef %291, ptr noundef @.str.34)
  br label %293

293:                                              ; preds = %287, %281, %268
  %294 = load ptr, ptr %10, align 8
  %295 = getelementptr inbounds i8, ptr %294, i64 20
  %296 = load i8, ptr %295, align 1
  %297 = zext i8 %296 to i32
  %298 = shl i32 %297, 24
  %299 = load ptr, ptr %10, align 8
  %300 = getelementptr inbounds i8, ptr %299, i64 20
  %301 = getelementptr inbounds i8, ptr %300, i64 1
  %302 = load i8, ptr %301, align 1
  %303 = zext i8 %302 to i32
  %304 = shl i32 %303, 16
  %305 = add i32 %298, %304
  %306 = load ptr, ptr %10, align 8
  %307 = getelementptr inbounds i8, ptr %306, i64 20
  %308 = getelementptr inbounds i8, ptr %307, i64 2
  %309 = load i8, ptr %308, align 1
  %310 = zext i8 %309 to i32
  %311 = shl i32 %310, 8
  %312 = add i32 %305, %311
  %313 = load ptr, ptr %10, align 8
  %314 = getelementptr inbounds i8, ptr %313, i64 20
  %315 = getelementptr inbounds i8, ptr %314, i64 3
  %316 = load i8, ptr %315, align 1
  %317 = zext i8 %316 to i32
  %318 = add i32 %312, %317
  store i32 %318, ptr %12, align 4
  %319 = load i32, ptr %12, align 4
  switch i32 %319, label %321 [
    i32 1482250784, label %320
    i32 1281450528, label %320
  ]

320:                                              ; preds = %293, %293
  br label %327

321:                                              ; preds = %293
  %322 = load ptr, ptr %7, align 8
  %323 = load ptr, ptr %8, align 8
  %324 = load i32, ptr %12, align 4
  %325 = zext i32 %324 to i64
  %326 = call i32 @png_icc_profile_error(ptr noundef %322, ptr noundef %323, i64 noundef %325, ptr noundef @.str.35)
  store i32 %326, ptr %6, align 4
  br label %328

327:                                              ; preds = %320
  store i32 1, ptr %6, align 4
  br label %328

328:                                              ; preds = %327, %321, %275, %269, %235, %228, %217, %171, %128, %94, %54, %37
  %329 = load i32, ptr %6, align 4
  ret i32 %329
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_icc_check_tag_table(ptr noalias noundef %0, ptr noundef %1, i32 noundef %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i32 %2, ptr %8, align 4
  store ptr %3, ptr %9, align 8
  %16 = load ptr, ptr %9, align 8
  %17 = getelementptr inbounds i8, ptr %16, i64 128
  %18 = load i8, ptr %17, align 1
  %19 = zext i8 %18 to i32
  %20 = shl i32 %19, 24
  %21 = load ptr, ptr %9, align 8
  %22 = getelementptr inbounds i8, ptr %21, i64 128
  %23 = getelementptr inbounds i8, ptr %22, i64 1
  %24 = load i8, ptr %23, align 1
  %25 = zext i8 %24 to i32
  %26 = shl i32 %25, 16
  %27 = add i32 %20, %26
  %28 = load ptr, ptr %9, align 8
  %29 = getelementptr inbounds i8, ptr %28, i64 128
  %30 = getelementptr inbounds i8, ptr %29, i64 2
  %31 = load i8, ptr %30, align 1
  %32 = zext i8 %31 to i32
  %33 = shl i32 %32, 8
  %34 = add i32 %27, %33
  %35 = load ptr, ptr %9, align 8
  %36 = getelementptr inbounds i8, ptr %35, i64 128
  %37 = getelementptr inbounds i8, ptr %36, i64 3
  %38 = load i8, ptr %37, align 1
  %39 = zext i8 %38 to i32
  %40 = add i32 %34, %39
  store i32 %40, ptr %10, align 4
  %41 = load ptr, ptr %9, align 8
  %42 = getelementptr inbounds i8, ptr %41, i64 132
  store ptr %42, ptr %12, align 8
  store i32 0, ptr %11, align 4
  br label %43

43:                                               ; preds = %149, %4
  %44 = load i32, ptr %11, align 4
  %45 = load i32, ptr %10, align 4
  %46 = icmp ult i32 %44, %45
  br i1 %46, label %47, label %154

47:                                               ; preds = %43
  %48 = load ptr, ptr %12, align 8
  %49 = getelementptr inbounds i8, ptr %48, i64 0
  %50 = load i8, ptr %49, align 1
  %51 = zext i8 %50 to i32
  %52 = shl i32 %51, 24
  %53 = load ptr, ptr %12, align 8
  %54 = getelementptr inbounds i8, ptr %53, i64 0
  %55 = getelementptr inbounds i8, ptr %54, i64 1
  %56 = load i8, ptr %55, align 1
  %57 = zext i8 %56 to i32
  %58 = shl i32 %57, 16
  %59 = add i32 %52, %58
  %60 = load ptr, ptr %12, align 8
  %61 = getelementptr inbounds i8, ptr %60, i64 0
  %62 = getelementptr inbounds i8, ptr %61, i64 2
  %63 = load i8, ptr %62, align 1
  %64 = zext i8 %63 to i32
  %65 = shl i32 %64, 8
  %66 = add i32 %59, %65
  %67 = load ptr, ptr %12, align 8
  %68 = getelementptr inbounds i8, ptr %67, i64 0
  %69 = getelementptr inbounds i8, ptr %68, i64 3
  %70 = load i8, ptr %69, align 1
  %71 = zext i8 %70 to i32
  %72 = add i32 %66, %71
  store i32 %72, ptr %13, align 4
  %73 = load ptr, ptr %12, align 8
  %74 = getelementptr inbounds i8, ptr %73, i64 4
  %75 = load i8, ptr %74, align 1
  %76 = zext i8 %75 to i32
  %77 = shl i32 %76, 24
  %78 = load ptr, ptr %12, align 8
  %79 = getelementptr inbounds i8, ptr %78, i64 4
  %80 = getelementptr inbounds i8, ptr %79, i64 1
  %81 = load i8, ptr %80, align 1
  %82 = zext i8 %81 to i32
  %83 = shl i32 %82, 16
  %84 = add i32 %77, %83
  %85 = load ptr, ptr %12, align 8
  %86 = getelementptr inbounds i8, ptr %85, i64 4
  %87 = getelementptr inbounds i8, ptr %86, i64 2
  %88 = load i8, ptr %87, align 1
  %89 = zext i8 %88 to i32
  %90 = shl i32 %89, 8
  %91 = add i32 %84, %90
  %92 = load ptr, ptr %12, align 8
  %93 = getelementptr inbounds i8, ptr %92, i64 4
  %94 = getelementptr inbounds i8, ptr %93, i64 3
  %95 = load i8, ptr %94, align 1
  %96 = zext i8 %95 to i32
  %97 = add i32 %91, %96
  store i32 %97, ptr %14, align 4
  %98 = load ptr, ptr %12, align 8
  %99 = getelementptr inbounds i8, ptr %98, i64 8
  %100 = load i8, ptr %99, align 1
  %101 = zext i8 %100 to i32
  %102 = shl i32 %101, 24
  %103 = load ptr, ptr %12, align 8
  %104 = getelementptr inbounds i8, ptr %103, i64 8
  %105 = getelementptr inbounds i8, ptr %104, i64 1
  %106 = load i8, ptr %105, align 1
  %107 = zext i8 %106 to i32
  %108 = shl i32 %107, 16
  %109 = add i32 %102, %108
  %110 = load ptr, ptr %12, align 8
  %111 = getelementptr inbounds i8, ptr %110, i64 8
  %112 = getelementptr inbounds i8, ptr %111, i64 2
  %113 = load i8, ptr %112, align 1
  %114 = zext i8 %113 to i32
  %115 = shl i32 %114, 8
  %116 = add i32 %109, %115
  %117 = load ptr, ptr %12, align 8
  %118 = getelementptr inbounds i8, ptr %117, i64 8
  %119 = getelementptr inbounds i8, ptr %118, i64 3
  %120 = load i8, ptr %119, align 1
  %121 = zext i8 %120 to i32
  %122 = add i32 %116, %121
  store i32 %122, ptr %15, align 4
  %123 = load i32, ptr %14, align 4
  %124 = load i32, ptr %8, align 4
  %125 = icmp ugt i32 %123, %124
  br i1 %125, label %132, label %126

126:                                              ; preds = %47
  %127 = load i32, ptr %15, align 4
  %128 = load i32, ptr %8, align 4
  %129 = load i32, ptr %14, align 4
  %130 = sub i32 %128, %129
  %131 = icmp ugt i32 %127, %130
  br i1 %131, label %132, label %138

132:                                              ; preds = %126, %47
  %133 = load ptr, ptr %6, align 8
  %134 = load ptr, ptr %7, align 8
  %135 = load i32, ptr %13, align 4
  %136 = zext i32 %135 to i64
  %137 = call i32 @png_icc_profile_error(ptr noundef %133, ptr noundef %134, i64 noundef %136, ptr noundef @.str.36)
  store i32 %137, ptr %5, align 4
  br label %155

138:                                              ; preds = %126
  %139 = load i32, ptr %14, align 4
  %140 = and i32 %139, 3
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %148

142:                                              ; preds = %138
  %143 = load ptr, ptr %6, align 8
  %144 = load ptr, ptr %7, align 8
  %145 = load i32, ptr %13, align 4
  %146 = zext i32 %145 to i64
  %147 = call i32 @png_icc_profile_error(ptr noundef %143, ptr noundef %144, i64 noundef %146, ptr noundef @.str.37)
  br label %148

148:                                              ; preds = %142, %138
  br label %149

149:                                              ; preds = %148
  %150 = load i32, ptr %11, align 4
  %151 = add i32 %150, 1
  store i32 %151, ptr %11, align 4
  %152 = load ptr, ptr %12, align 8
  %153 = getelementptr inbounds i8, ptr %152, i64 12
  store ptr %153, ptr %12, align 8
  br label %43, !llvm.loop !15

154:                                              ; preds = %43
  store i32 1, ptr %5, align 4
  br label %155

155:                                              ; preds = %154, %132
  %156 = load i32, ptr %5, align 4
  ret i32 %156
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_set_rgb_coefficients(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.png_XYZ, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.png_struct_def, ptr %9, i32 0, i32 124
  %11 = load i8, ptr %10, align 1
  %12 = zext i8 %11 to i32
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %162

14:                                               ; preds = %1
  %15 = load ptr, ptr %2, align 8
  %16 = call i32 @have_chromaticities(ptr noundef %15)
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %156

18:                                               ; preds = %14
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds %struct.png_struct_def, ptr %19, i32 0, i32 80
  %21 = call i32 @png_XYZ_from_xy(ptr noundef %3, ptr noundef %20)
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %156

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct.png_XYZ, ptr %3, i32 0, i32 1
  %25 = load i32, ptr %24, align 4
  store i32 %25, ptr %4, align 4
  %26 = getelementptr inbounds %struct.png_XYZ, ptr %3, i32 0, i32 4
  %27 = load i32, ptr %26, align 4
  store i32 %27, ptr %5, align 4
  %28 = getelementptr inbounds %struct.png_XYZ, ptr %3, i32 0, i32 7
  %29 = load i32, ptr %28, align 4
  store i32 %29, ptr %6, align 4
  %30 = load i32, ptr %4, align 4
  %31 = load i32, ptr %5, align 4
  %32 = add nsw i32 %30, %31
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %32, %33
  store i32 %34, ptr %7, align 4
  %35 = load i32, ptr %7, align 4
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %37, label %155

37:                                               ; preds = %23
  %38 = load i32, ptr %4, align 4
  %39 = icmp sge i32 %38, 0
  br i1 %39, label %40, label %155

40:                                               ; preds = %37
  %41 = load i32, ptr %4, align 4
  %42 = load i32, ptr %7, align 4
  %43 = call i32 @png_muldiv(ptr noundef %4, i32 noundef %41, i32 noundef 32768, i32 noundef %42)
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %155

45:                                               ; preds = %40
  %46 = load i32, ptr %4, align 4
  %47 = icmp sge i32 %46, 0
  br i1 %47, label %48, label %155

48:                                               ; preds = %45
  %49 = load i32, ptr %4, align 4
  %50 = icmp sle i32 %49, 32768
  br i1 %50, label %51, label %155

51:                                               ; preds = %48
  %52 = load i32, ptr %5, align 4
  %53 = icmp sge i32 %52, 0
  br i1 %53, label %54, label %155

54:                                               ; preds = %51
  %55 = load i32, ptr %5, align 4
  %56 = load i32, ptr %7, align 4
  %57 = call i32 @png_muldiv(ptr noundef %5, i32 noundef %55, i32 noundef 32768, i32 noundef %56)
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %155

59:                                               ; preds = %54
  %60 = load i32, ptr %5, align 4
  %61 = icmp sge i32 %60, 0
  br i1 %61, label %62, label %155

62:                                               ; preds = %59
  %63 = load i32, ptr %5, align 4
  %64 = icmp sle i32 %63, 32768
  br i1 %64, label %65, label %155

65:                                               ; preds = %62
  %66 = load i32, ptr %6, align 4
  %67 = icmp sge i32 %66, 0
  br i1 %67, label %68, label %155

68:                                               ; preds = %65
  %69 = load i32, ptr %6, align 4
  %70 = load i32, ptr %7, align 4
  %71 = call i32 @png_muldiv(ptr noundef %6, i32 noundef %69, i32 noundef 32768, i32 noundef %70)
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %155

73:                                               ; preds = %68
  %74 = load i32, ptr %6, align 4
  %75 = icmp sge i32 %74, 0
  br i1 %75, label %76, label %155

76:                                               ; preds = %73
  %77 = load i32, ptr %6, align 4
  %78 = icmp sle i32 %77, 32768
  br i1 %78, label %79, label %155

79:                                               ; preds = %76
  %80 = load i32, ptr %4, align 4
  %81 = load i32, ptr %5, align 4
  %82 = add nsw i32 %80, %81
  %83 = load i32, ptr %6, align 4
  %84 = add nsw i32 %82, %83
  %85 = icmp sle i32 %84, 32769
  br i1 %85, label %86, label %155

86:                                               ; preds = %79
  store i32 0, ptr %8, align 4
  %87 = load i32, ptr %4, align 4
  %88 = load i32, ptr %5, align 4
  %89 = add nsw i32 %87, %88
  %90 = load i32, ptr %6, align 4
  %91 = add nsw i32 %89, %90
  %92 = icmp sgt i32 %91, 32768
  br i1 %92, label %93, label %94

93:                                               ; preds = %86
  store i32 -1, ptr %8, align 4
  br label %103

94:                                               ; preds = %86
  %95 = load i32, ptr %4, align 4
  %96 = load i32, ptr %5, align 4
  %97 = add nsw i32 %95, %96
  %98 = load i32, ptr %6, align 4
  %99 = add nsw i32 %97, %98
  %100 = icmp slt i32 %99, 32768
  br i1 %100, label %101, label %102

101:                                              ; preds = %94
  store i32 1, ptr %8, align 4
  br label %102

102:                                              ; preds = %101, %94
  br label %103

103:                                              ; preds = %102, %93
  %104 = load i32, ptr %8, align 4
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %106, label %136

106:                                              ; preds = %103
  %107 = load i32, ptr %5, align 4
  %108 = load i32, ptr %4, align 4
  %109 = icmp sge i32 %107, %108
  br i1 %109, label %110, label %118

110:                                              ; preds = %106
  %111 = load i32, ptr %5, align 4
  %112 = load i32, ptr %6, align 4
  %113 = icmp sge i32 %111, %112
  br i1 %113, label %114, label %118

114:                                              ; preds = %110
  %115 = load i32, ptr %8, align 4
  %116 = load i32, ptr %5, align 4
  %117 = add nsw i32 %116, %115
  store i32 %117, ptr %5, align 4
  br label %135

118:                                              ; preds = %110, %106
  %119 = load i32, ptr %4, align 4
  %120 = load i32, ptr %5, align 4
  %121 = icmp sge i32 %119, %120
  br i1 %121, label %122, label %130

122:                                              ; preds = %118
  %123 = load i32, ptr %4, align 4
  %124 = load i32, ptr %6, align 4
  %125 = icmp sge i32 %123, %124
  br i1 %125, label %126, label %130

126:                                              ; preds = %122
  %127 = load i32, ptr %8, align 4
  %128 = load i32, ptr %4, align 4
  %129 = add nsw i32 %128, %127
  store i32 %129, ptr %4, align 4
  br label %134

130:                                              ; preds = %122, %118
  %131 = load i32, ptr %8, align 4
  %132 = load i32, ptr %6, align 4
  %133 = add nsw i32 %132, %131
  store i32 %133, ptr %6, align 4
  br label %134

134:                                              ; preds = %130, %126
  br label %135

135:                                              ; preds = %134, %114
  br label %136

136:                                              ; preds = %135, %103
  %137 = load i32, ptr %4, align 4
  %138 = load i32, ptr %5, align 4
  %139 = add nsw i32 %137, %138
  %140 = load i32, ptr %6, align 4
  %141 = add nsw i32 %139, %140
  %142 = icmp ne i32 %141, 32768
  br i1 %142, label %143, label %145

143:                                              ; preds = %136
  %144 = load ptr, ptr %2, align 8
  call void @png_error(ptr noundef %144, ptr noundef @.str.38) #10
  unreachable

145:                                              ; preds = %136
  %146 = load i32, ptr %4, align 4
  %147 = trunc i32 %146 to i16
  %148 = load ptr, ptr %2, align 8
  %149 = getelementptr inbounds %struct.png_struct_def, ptr %148, i32 0, i32 125
  store i16 %147, ptr %149, align 2
  %150 = load i32, ptr %5, align 4
  %151 = trunc i32 %150 to i16
  %152 = load ptr, ptr %2, align 8
  %153 = getelementptr inbounds %struct.png_struct_def, ptr %152, i32 0, i32 126
  store i16 %151, ptr %153, align 4
  br label %154

154:                                              ; preds = %145
  br label %155

155:                                              ; preds = %154, %79, %76, %73, %68, %65, %62, %59, %54, %51, %48, %45, %40, %37, %23
  br label %161

156:                                              ; preds = %18, %14
  %157 = load ptr, ptr %2, align 8
  %158 = getelementptr inbounds %struct.png_struct_def, ptr %157, i32 0, i32 125
  store i16 6968, ptr %158, align 2
  %159 = load ptr, ptr %2, align 8
  %160 = getelementptr inbounds %struct.png_struct_def, ptr %159, i32 0, i32 126
  store i16 23434, ptr %160, align 4
  br label %161

161:                                              ; preds = %156, %155
  br label %162

162:                                              ; preds = %161, %1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @have_chromaticities(ptr noalias noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %struct.png_struct_def, ptr %4, i32 0, i32 37
  %6 = load i32, ptr %5, align 8
  %7 = and i32 %6, 65536
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %1
  store i32 1, ptr %2, align 4
  br label %25

10:                                               ; preds = %1
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds %struct.png_struct_def, ptr %11, i32 0, i32 37
  %13 = load i32, ptr %12, align 8
  %14 = and i32 %13, 8388608
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %10
  store i32 0, ptr %2, align 4
  br label %25

17:                                               ; preds = %10
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds %struct.png_struct_def, ptr %18, i32 0, i32 37
  %20 = load i32, ptr %19, align 8
  %21 = and i32 %20, 64
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %24

23:                                               ; preds = %17
  store i32 1, ptr %2, align 4
  br label %25

24:                                               ; preds = %17
  store i32 0, ptr %2, align 4
  br label %25

25:                                               ; preds = %24, %23, %16, %9
  %26 = load i32, ptr %2, align 4
  ret i32 %26
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_check_IHDR(ptr noalias noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7) #0 {
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store ptr %0, ptr %9, align 8
  store i32 %1, ptr %10, align 4
  store i32 %2, ptr %11, align 4
  store i32 %3, ptr %12, align 4
  store i32 %4, ptr %13, align 4
  store i32 %5, ptr %14, align 4
  store i32 %6, ptr %15, align 4
  store i32 %7, ptr %16, align 4
  store i32 0, ptr %17, align 4
  %18 = load i32, ptr %10, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %8
  %21 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %21, ptr noundef @.str.39)
  store i32 1, ptr %17, align 4
  br label %22

22:                                               ; preds = %20, %8
  %23 = load i32, ptr %10, align 4
  %24 = icmp ugt i32 %23, 2147483647
  br i1 %24, label %25, label %27

25:                                               ; preds = %22
  %26 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %26, ptr noundef @.str.40)
  store i32 1, ptr %17, align 4
  br label %27

27:                                               ; preds = %25, %22
  %28 = load i32, ptr %10, align 4
  %29 = add i32 %28, 7
  %30 = zext i32 %29 to i64
  %31 = and i64 %30, -8
  %32 = icmp ugt i64 %31, 2305843009213693944
  br i1 %32, label %33, label %35

33:                                               ; preds = %27
  %34 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %34, ptr noundef @.str.41)
  store i32 1, ptr %17, align 4
  br label %35

35:                                               ; preds = %33, %27
  %36 = load i32, ptr %10, align 4
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr inbounds %struct.png_struct_def, ptr %37, i32 0, i32 138
  %39 = load i32, ptr %38, align 4
  %40 = icmp ugt i32 %36, %39
  br i1 %40, label %41, label %43

41:                                               ; preds = %35
  %42 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %42, ptr noundef @.str.42)
  store i32 1, ptr %17, align 4
  br label %43

43:                                               ; preds = %41, %35
  %44 = load i32, ptr %11, align 4
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %48

46:                                               ; preds = %43
  %47 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %47, ptr noundef @.str.43)
  store i32 1, ptr %17, align 4
  br label %48

48:                                               ; preds = %46, %43
  %49 = load i32, ptr %11, align 4
  %50 = icmp ugt i32 %49, 2147483647
  br i1 %50, label %51, label %53

51:                                               ; preds = %48
  %52 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %52, ptr noundef @.str.44)
  store i32 1, ptr %17, align 4
  br label %53

53:                                               ; preds = %51, %48
  %54 = load i32, ptr %11, align 4
  %55 = load ptr, ptr %9, align 8
  %56 = getelementptr inbounds %struct.png_struct_def, ptr %55, i32 0, i32 139
  %57 = load i32, ptr %56, align 8
  %58 = icmp ugt i32 %54, %57
  br i1 %58, label %59, label %61

59:                                               ; preds = %53
  %60 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %60, ptr noundef @.str.45)
  store i32 1, ptr %17, align 4
  br label %61

61:                                               ; preds = %59, %53
  %62 = load i32, ptr %12, align 4
  %63 = icmp ne i32 %62, 1
  br i1 %63, label %64, label %78

64:                                               ; preds = %61
  %65 = load i32, ptr %12, align 4
  %66 = icmp ne i32 %65, 2
  br i1 %66, label %67, label %78

67:                                               ; preds = %64
  %68 = load i32, ptr %12, align 4
  %69 = icmp ne i32 %68, 4
  br i1 %69, label %70, label %78

70:                                               ; preds = %67
  %71 = load i32, ptr %12, align 4
  %72 = icmp ne i32 %71, 8
  br i1 %72, label %73, label %78

73:                                               ; preds = %70
  %74 = load i32, ptr %12, align 4
  %75 = icmp ne i32 %74, 16
  br i1 %75, label %76, label %78

76:                                               ; preds = %73
  %77 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %77, ptr noundef @.str.46)
  store i32 1, ptr %17, align 4
  br label %78

78:                                               ; preds = %76, %73, %70, %67, %64, %61
  %79 = load i32, ptr %13, align 4
  %80 = icmp slt i32 %79, 0
  br i1 %80, label %90, label %81

81:                                               ; preds = %78
  %82 = load i32, ptr %13, align 4
  %83 = icmp eq i32 %82, 1
  br i1 %83, label %90, label %84

84:                                               ; preds = %81
  %85 = load i32, ptr %13, align 4
  %86 = icmp eq i32 %85, 5
  br i1 %86, label %90, label %87

87:                                               ; preds = %84
  %88 = load i32, ptr %13, align 4
  %89 = icmp sgt i32 %88, 6
  br i1 %89, label %90, label %92

90:                                               ; preds = %87, %84, %81, %78
  %91 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %91, ptr noundef @.str.47)
  store i32 1, ptr %17, align 4
  br label %92

92:                                               ; preds = %90, %87
  %93 = load i32, ptr %13, align 4
  %94 = icmp eq i32 %93, 3
  br i1 %94, label %95, label %98

95:                                               ; preds = %92
  %96 = load i32, ptr %12, align 4
  %97 = icmp sgt i32 %96, 8
  br i1 %97, label %110, label %98

98:                                               ; preds = %95, %92
  %99 = load i32, ptr %13, align 4
  %100 = icmp eq i32 %99, 2
  br i1 %100, label %107, label %101

101:                                              ; preds = %98
  %102 = load i32, ptr %13, align 4
  %103 = icmp eq i32 %102, 4
  br i1 %103, label %107, label %104

104:                                              ; preds = %101
  %105 = load i32, ptr %13, align 4
  %106 = icmp eq i32 %105, 6
  br i1 %106, label %107, label %112

107:                                              ; preds = %104, %101, %98
  %108 = load i32, ptr %12, align 4
  %109 = icmp slt i32 %108, 8
  br i1 %109, label %110, label %112

110:                                              ; preds = %107, %95
  %111 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %111, ptr noundef @.str.48)
  store i32 1, ptr %17, align 4
  br label %112

112:                                              ; preds = %110, %107, %104
  %113 = load i32, ptr %14, align 4
  %114 = icmp sge i32 %113, 2
  br i1 %114, label %115, label %117

115:                                              ; preds = %112
  %116 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %116, ptr noundef @.str.49)
  store i32 1, ptr %17, align 4
  br label %117

117:                                              ; preds = %115, %112
  %118 = load i32, ptr %15, align 4
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %120, label %122

120:                                              ; preds = %117
  %121 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %121, ptr noundef @.str.50)
  store i32 1, ptr %17, align 4
  br label %122

122:                                              ; preds = %120, %117
  %123 = load ptr, ptr %9, align 8
  %124 = getelementptr inbounds %struct.png_struct_def, ptr %123, i32 0, i32 15
  %125 = load i32, ptr %124, align 4
  %126 = and i32 %125, 4096
  %127 = icmp ne i32 %126, 0
  br i1 %127, label %128, label %135

128:                                              ; preds = %122
  %129 = load ptr, ptr %9, align 8
  %130 = getelementptr inbounds %struct.png_struct_def, ptr %129, i32 0, i32 128
  %131 = load i32, ptr %130, align 8
  %132 = icmp ne i32 %131, 0
  br i1 %132, label %133, label %135

133:                                              ; preds = %128
  %134 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %134, ptr noundef @.str.51)
  br label %135

135:                                              ; preds = %133, %128, %122
  %136 = load i32, ptr %16, align 4
  %137 = icmp ne i32 %136, 0
  br i1 %137, label %138, label %170

138:                                              ; preds = %135
  %139 = load ptr, ptr %9, align 8
  %140 = getelementptr inbounds %struct.png_struct_def, ptr %139, i32 0, i32 128
  %141 = load i32, ptr %140, align 8
  %142 = and i32 %141, 4
  %143 = icmp ne i32 %142, 0
  br i1 %143, label %144, label %159

144:                                              ; preds = %138
  %145 = load i32, ptr %16, align 4
  %146 = icmp eq i32 %145, 64
  br i1 %146, label %147, label %159

147:                                              ; preds = %144
  %148 = load ptr, ptr %9, align 8
  %149 = getelementptr inbounds %struct.png_struct_def, ptr %148, i32 0, i32 15
  %150 = load i32, ptr %149, align 4
  %151 = and i32 %150, 4096
  %152 = icmp eq i32 %151, 0
  br i1 %152, label %153, label %159

153:                                              ; preds = %147
  %154 = load i32, ptr %13, align 4
  %155 = icmp eq i32 %154, 2
  br i1 %155, label %161, label %156

156:                                              ; preds = %153
  %157 = load i32, ptr %13, align 4
  %158 = icmp eq i32 %157, 6
  br i1 %158, label %161, label %159

159:                                              ; preds = %156, %147, %144, %138
  %160 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %160, ptr noundef @.str.52)
  store i32 1, ptr %17, align 4
  br label %161

161:                                              ; preds = %159, %156, %153
  %162 = load ptr, ptr %9, align 8
  %163 = getelementptr inbounds %struct.png_struct_def, ptr %162, i32 0, i32 15
  %164 = load i32, ptr %163, align 4
  %165 = and i32 %164, 4096
  %166 = icmp ne i32 %165, 0
  br i1 %166, label %167, label %169

167:                                              ; preds = %161
  %168 = load ptr, ptr %9, align 8
  call void @png_warning(ptr noundef %168, ptr noundef @.str.53)
  store i32 1, ptr %17, align 4
  br label %169

169:                                              ; preds = %167, %161
  br label %170

170:                                              ; preds = %169, %135
  %171 = load i32, ptr %17, align 4
  %172 = icmp eq i32 %171, 1
  br i1 %172, label %173, label %175

173:                                              ; preds = %170
  %174 = load ptr, ptr %9, align 8
  call void @png_error(ptr noundef %174, ptr noundef @.str.54) #10
  unreachable

175:                                              ; preds = %170
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_check_fp_number(ptr noundef %0, i64 noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %12 = load ptr, ptr %7, align 8
  %13 = load i32, ptr %12, align 4
  store i32 %13, ptr %9, align 4
  %14 = load ptr, ptr %8, align 8
  %15 = load i64, ptr %14, align 8
  store i64 %15, ptr %10, align 8
  br label %16

16:                                               ; preds = %117, %4
  %17 = load i64, ptr %10, align 8
  %18 = load i64, ptr %6, align 8
  %19 = icmp ult i64 %17, %18
  br i1 %19, label %20, label %120

20:                                               ; preds = %16
  %21 = load ptr, ptr %5, align 8
  %22 = load i64, ptr %10, align 8
  %23 = getelementptr inbounds i8, ptr %21, i64 %22
  %24 = load i8, ptr %23, align 1
  %25 = sext i8 %24 to i32
  switch i32 %25, label %32 [
    i32 43, label %26
    i32 45, label %27
    i32 46, label %28
    i32 48, label %29
    i32 49, label %30
    i32 50, label %30
    i32 51, label %30
    i32 52, label %30
    i32 53, label %30
    i32 54, label %30
    i32 55, label %30
    i32 56, label %30
    i32 57, label %30
    i32 69, label %31
    i32 101, label %31
  ]

26:                                               ; preds = %20
  store i32 4, ptr %11, align 4
  br label %33

27:                                               ; preds = %20
  store i32 132, ptr %11, align 4
  br label %33

28:                                               ; preds = %20
  store i32 16, ptr %11, align 4
  br label %33

29:                                               ; preds = %20
  store i32 8, ptr %11, align 4
  br label %33

30:                                               ; preds = %20, %20, %20, %20, %20, %20, %20, %20, %20
  store i32 264, ptr %11, align 4
  br label %33

31:                                               ; preds = %20, %20
  store i32 32, ptr %11, align 4
  br label %33

32:                                               ; preds = %20
  br label %121

33:                                               ; preds = %31, %30, %29, %28, %27, %26
  %34 = load i32, ptr %9, align 4
  %35 = and i32 %34, 3
  %36 = load i32, ptr %11, align 4
  %37 = and i32 %36, 60
  %38 = add nsw i32 %35, %37
  switch i32 %38, label %116 [
    i32 4, label %39
    i32 16, label %48
    i32 8, label %69
    i32 32, label %82
    i32 9, label %91
    i32 33, label %96
    i32 6, label %105
    i32 10, label %113
  ]

39:                                               ; preds = %33
  %40 = load i32, ptr %9, align 4
  %41 = and i32 %40, 60
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %44

43:                                               ; preds = %39
  br label %121

44:                                               ; preds = %39
  %45 = load i32, ptr %11, align 4
  %46 = load i32, ptr %9, align 4
  %47 = or i32 %46, %45
  store i32 %47, ptr %9, align 4
  br label %117

48:                                               ; preds = %33
  %49 = load i32, ptr %9, align 4
  %50 = and i32 %49, 16
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %53

52:                                               ; preds = %48
  br label %121

53:                                               ; preds = %48
  %54 = load i32, ptr %9, align 4
  %55 = and i32 %54, 8
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %61

57:                                               ; preds = %53
  %58 = load i32, ptr %11, align 4
  %59 = load i32, ptr %9, align 4
  %60 = or i32 %59, %58
  store i32 %60, ptr %9, align 4
  br label %67

61:                                               ; preds = %53
  %62 = load i32, ptr %11, align 4
  %63 = or i32 1, %62
  %64 = load i32, ptr %9, align 4
  %65 = and i32 %64, 448
  %66 = or i32 %63, %65
  store i32 %66, ptr %9, align 4
  br label %67

67:                                               ; preds = %61, %57
  br label %68

68:                                               ; preds = %67
  br label %117

69:                                               ; preds = %33
  %70 = load i32, ptr %9, align 4
  %71 = and i32 %70, 16
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %77

73:                                               ; preds = %69
  %74 = load i32, ptr %9, align 4
  %75 = and i32 %74, 448
  %76 = or i32 17, %75
  store i32 %76, ptr %9, align 4
  br label %77

77:                                               ; preds = %73, %69
  %78 = load i32, ptr %11, align 4
  %79 = or i32 %78, 64
  %80 = load i32, ptr %9, align 4
  %81 = or i32 %80, %79
  store i32 %81, ptr %9, align 4
  br label %117

82:                                               ; preds = %33
  %83 = load i32, ptr %9, align 4
  %84 = and i32 %83, 8
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %86, label %87

86:                                               ; preds = %82
  br label %121

87:                                               ; preds = %82
  %88 = load i32, ptr %9, align 4
  %89 = and i32 %88, 448
  %90 = or i32 2, %89
  store i32 %90, ptr %9, align 4
  br label %117

91:                                               ; preds = %33
  %92 = load i32, ptr %11, align 4
  %93 = or i32 %92, 64
  %94 = load i32, ptr %9, align 4
  %95 = or i32 %94, %93
  store i32 %95, ptr %9, align 4
  br label %117

96:                                               ; preds = %33
  %97 = load i32, ptr %9, align 4
  %98 = and i32 %97, 8
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %101

100:                                              ; preds = %96
  br label %121

101:                                              ; preds = %96
  %102 = load i32, ptr %9, align 4
  %103 = and i32 %102, 448
  %104 = or i32 2, %103
  store i32 %104, ptr %9, align 4
  br label %117

105:                                              ; preds = %33
  %106 = load i32, ptr %9, align 4
  %107 = and i32 %106, 60
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %110

109:                                              ; preds = %105
  br label %121

110:                                              ; preds = %105
  %111 = load i32, ptr %9, align 4
  %112 = or i32 %111, 4
  store i32 %112, ptr %9, align 4
  br label %117

113:                                              ; preds = %33
  %114 = load i32, ptr %9, align 4
  %115 = or i32 %114, 72
  store i32 %115, ptr %9, align 4
  br label %117

116:                                              ; preds = %33
  br label %121

117:                                              ; preds = %113, %110, %101, %91, %87, %77, %68, %44
  %118 = load i64, ptr %10, align 8
  %119 = add i64 %118, 1
  store i64 %119, ptr %10, align 8
  br label %16, !llvm.loop !16

120:                                              ; preds = %16
  br label %121

121:                                              ; preds = %120, %116, %109, %100, %86, %52, %43, %32
  %122 = load i32, ptr %9, align 4
  %123 = load ptr, ptr %7, align 8
  store i32 %122, ptr %123, align 4
  %124 = load i64, ptr %10, align 8
  %125 = load ptr, ptr %8, align 8
  store i64 %124, ptr %125, align 8
  %126 = load i32, ptr %9, align 4
  %127 = and i32 %126, 8
  %128 = icmp ne i32 %127, 0
  %129 = zext i1 %128 to i32
  ret i32 %129
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_check_fp_string(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i32 0, ptr %6, align 4
  store i64 0, ptr %7, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load i64, ptr %5, align 8
  %10 = call i32 @png_check_fp_number(ptr noundef %8, i64 noundef %9, ptr noundef %6, ptr noundef %7)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %25

12:                                               ; preds = %2
  %13 = load i64, ptr %7, align 8
  %14 = load i64, ptr %5, align 8
  %15 = icmp eq i64 %13, %14
  br i1 %15, label %23, label %16

16:                                               ; preds = %12
  %17 = load ptr, ptr %4, align 8
  %18 = load i64, ptr %7, align 8
  %19 = getelementptr inbounds i8, ptr %17, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

23:                                               ; preds = %16, %12
  %24 = load i32, ptr %6, align 4
  store i32 %24, ptr %3, align 4
  br label %26

25:                                               ; preds = %16, %2
  store i32 0, ptr %3, align 4
  br label %26

26:                                               ; preds = %25, %23
  %27 = load i32, ptr %3, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_ascii_from_fp(ptr noalias noundef %0, ptr noundef %1, i64 noundef %2, double noundef %3, i32 noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca double, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca [10 x i8], align 1
  %18 = alloca double, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i64 %2, ptr %8, align 8
  store double %3, ptr %9, align 8
  store i32 %4, ptr %10, align 4
  %22 = load i32, ptr %10, align 4
  %23 = icmp ult i32 %22, 1
  br i1 %23, label %24, label %25

24:                                               ; preds = %5
  store i32 15, ptr %10, align 4
  br label %25

25:                                               ; preds = %24, %5
  %26 = load i32, ptr %10, align 4
  %27 = icmp ugt i32 %26, 16
  br i1 %27, label %28, label %29

28:                                               ; preds = %25
  store i32 16, ptr %10, align 4
  br label %29

29:                                               ; preds = %28, %25
  %30 = load i64, ptr %8, align 8
  %31 = load i32, ptr %10, align 4
  %32 = add i32 %31, 5
  %33 = zext i32 %32 to i64
  %34 = icmp uge i64 %30, %33
  br i1 %34, label %35, label %361

35:                                               ; preds = %29
  %36 = load double, ptr %9, align 8
  %37 = fcmp olt double %36, 0.000000e+00
  br i1 %37, label %38, label %45

38:                                               ; preds = %35
  %39 = load double, ptr %9, align 8
  %40 = fneg double %39
  store double %40, ptr %9, align 8
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds i8, ptr %41, i32 1
  store ptr %42, ptr %7, align 8
  store i8 45, ptr %41, align 1
  %43 = load i64, ptr %8, align 8
  %44 = add i64 %43, -1
  store i64 %44, ptr %8, align 8
  br label %45

45:                                               ; preds = %38, %35
  %46 = load double, ptr %9, align 8
  %47 = fcmp oge double %46, 0x10000000000000
  br i1 %47, label %48, label %345

48:                                               ; preds = %45
  %49 = load double, ptr %9, align 8
  %50 = fcmp ole double %49, 0x7FEFFFFFFFFFFFFF
  br i1 %50, label %51, label %345

51:                                               ; preds = %48
  %52 = load double, ptr %9, align 8
  %53 = call double @frexp(double noundef %52, ptr noundef %11) #13
  %54 = load i32, ptr %11, align 4
  %55 = mul nsw i32 %54, 77
  %56 = ashr i32 %55, 8
  store i32 %56, ptr %11, align 4
  %57 = load i32, ptr %11, align 4
  %58 = call double @png_pow10(i32 noundef %57)
  store double %58, ptr %12, align 8
  br label %59

59:                                               ; preds = %79, %51
  %60 = load double, ptr %12, align 8
  %61 = fcmp olt double %60, 0x10000000000000
  br i1 %61, label %66, label %62

62:                                               ; preds = %59
  %63 = load double, ptr %12, align 8
  %64 = load double, ptr %9, align 8
  %65 = fcmp olt double %63, %64
  br label %66

66:                                               ; preds = %62, %59
  %67 = phi i1 [ true, %59 ], [ %65, %62 ]
  br i1 %67, label %68, label %80

68:                                               ; preds = %66
  %69 = load i32, ptr %11, align 4
  %70 = add nsw i32 %69, 1
  %71 = call double @png_pow10(i32 noundef %70)
  store double %71, ptr %13, align 8
  %72 = load double, ptr %13, align 8
  %73 = fcmp ole double %72, 0x7FEFFFFFFFFFFFFF
  br i1 %73, label %74, label %78

74:                                               ; preds = %68
  %75 = load i32, ptr %11, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %11, align 4
  %77 = load double, ptr %13, align 8
  store double %77, ptr %12, align 8
  br label %79

78:                                               ; preds = %68
  br label %80

79:                                               ; preds = %74
  br label %59, !llvm.loop !17

80:                                               ; preds = %78, %66
  %81 = load double, ptr %12, align 8
  %82 = load double, ptr %9, align 8
  %83 = fdiv double %82, %81
  store double %83, ptr %9, align 8
  br label %84

84:                                               ; preds = %87, %80
  %85 = load double, ptr %9, align 8
  %86 = fcmp oge double %85, 1.000000e+00
  br i1 %86, label %87, label %92

87:                                               ; preds = %84
  %88 = load double, ptr %9, align 8
  %89 = fdiv double %88, 1.000000e+01
  store double %89, ptr %9, align 8
  %90 = load i32, ptr %11, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %11, align 4
  br label %84, !llvm.loop !18

92:                                               ; preds = %84
  %93 = load i32, ptr %11, align 4
  %94 = icmp slt i32 %93, 0
  br i1 %94, label %95, label %101

95:                                               ; preds = %92
  %96 = load i32, ptr %11, align 4
  %97 = icmp sgt i32 %96, -3
  br i1 %97, label %98, label %101

98:                                               ; preds = %95
  %99 = load i32, ptr %11, align 4
  %100 = sub i32 0, %99
  store i32 %100, ptr %14, align 4
  store i32 0, ptr %11, align 4
  br label %102

101:                                              ; preds = %95, %92
  store i32 0, ptr %14, align 4
  br label %102

102:                                              ; preds = %101, %98
  %103 = load i32, ptr %14, align 4
  store i32 %103, ptr %15, align 4
  store i32 0, ptr %16, align 4
  br label %104

104:                                              ; preds = %271, %102
  %105 = load double, ptr %9, align 8
  %106 = fmul double %105, 1.000000e+01
  store double %106, ptr %9, align 8
  %107 = load i32, ptr %16, align 4
  %108 = load i32, ptr %14, align 4
  %109 = add i32 %107, %108
  %110 = add i32 %109, 1
  %111 = load i32, ptr %10, align 4
  %112 = load i32, ptr %15, align 4
  %113 = add i32 %111, %112
  %114 = icmp ult i32 %110, %113
  br i1 %114, label %115, label %118

115:                                              ; preds = %104
  %116 = load double, ptr %9, align 8
  %117 = call double @modf(double noundef %116, ptr noundef %18) #13
  store double %117, ptr %9, align 8
  br label %196

118:                                              ; preds = %104
  %119 = load double, ptr %9, align 8
  %120 = fadd double %119, 5.000000e-01
  %121 = call double @llvm.floor.f64(double %120)
  store double %121, ptr %18, align 8
  %122 = load double, ptr %18, align 8
  %123 = fcmp ogt double %122, 9.000000e+00
  br i1 %123, label %124, label %195

124:                                              ; preds = %118
  %125 = load i32, ptr %14, align 4
  %126 = icmp ugt i32 %125, 0
  br i1 %126, label %127, label %136

127:                                              ; preds = %124
  %128 = load i32, ptr %14, align 4
  %129 = add i32 %128, -1
  store i32 %129, ptr %14, align 4
  store double 1.000000e+00, ptr %18, align 8
  %130 = load i32, ptr %16, align 4
  %131 = icmp eq i32 %130, 0
  br i1 %131, label %132, label %135

132:                                              ; preds = %127
  %133 = load i32, ptr %15, align 4
  %134 = add i32 %133, -1
  store i32 %134, ptr %15, align 4
  br label %135

135:                                              ; preds = %132, %127
  br label %194

136:                                              ; preds = %124
  br label %137

137:                                              ; preds = %166, %136
  %138 = load i32, ptr %16, align 4
  %139 = icmp ugt i32 %138, 0
  br i1 %139, label %140, label %143

140:                                              ; preds = %137
  %141 = load double, ptr %18, align 8
  %142 = fcmp ogt double %141, 9.000000e+00
  br label %143

143:                                              ; preds = %140, %137
  %144 = phi i1 [ false, %137 ], [ %142, %140 ]
  br i1 %144, label %145, label %172

145:                                              ; preds = %143
  %146 = load ptr, ptr %7, align 8
  %147 = getelementptr inbounds i8, ptr %146, i32 -1
  store ptr %147, ptr %7, align 8
  %148 = load i8, ptr %147, align 1
  %149 = sext i8 %148 to i32
  store i32 %149, ptr %19, align 4
  %150 = load i32, ptr %11, align 4
  %151 = icmp ne i32 %150, -1
  br i1 %151, label %152, label %155

152:                                              ; preds = %145
  %153 = load i32, ptr %11, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, ptr %11, align 4
  br label %166

155:                                              ; preds = %145
  %156 = load i32, ptr %19, align 4
  %157 = icmp eq i32 %156, 46
  br i1 %157, label %158, label %165

158:                                              ; preds = %155
  %159 = load ptr, ptr %7, align 8
  %160 = getelementptr inbounds i8, ptr %159, i32 -1
  store ptr %160, ptr %7, align 8
  %161 = load i8, ptr %160, align 1
  %162 = sext i8 %161 to i32
  store i32 %162, ptr %19, align 4
  %163 = load i64, ptr %8, align 8
  %164 = add i64 %163, 1
  store i64 %164, ptr %8, align 8
  store i32 1, ptr %11, align 4
  br label %165

165:                                              ; preds = %158, %155
  br label %166

166:                                              ; preds = %165, %152
  %167 = load i32, ptr %16, align 4
  %168 = add i32 %167, -1
  store i32 %168, ptr %16, align 4
  %169 = load i32, ptr %19, align 4
  %170 = sub nsw i32 %169, 47
  %171 = sitofp i32 %170 to double
  store double %171, ptr %18, align 8
  br label %137, !llvm.loop !19

172:                                              ; preds = %143
  %173 = load double, ptr %18, align 8
  %174 = fcmp ogt double %173, 9.000000e+00
  br i1 %174, label %175, label %193

175:                                              ; preds = %172
  %176 = load i32, ptr %11, align 4
  %177 = icmp eq i32 %176, -1
  br i1 %177, label %178, label %189

178:                                              ; preds = %175
  %179 = load ptr, ptr %7, align 8
  %180 = getelementptr inbounds i8, ptr %179, i32 -1
  store ptr %180, ptr %7, align 8
  %181 = load i8, ptr %180, align 1
  %182 = sext i8 %181 to i32
  store i32 %182, ptr %20, align 4
  %183 = load i32, ptr %20, align 4
  %184 = icmp eq i32 %183, 46
  br i1 %184, label %185, label %188

185:                                              ; preds = %178
  %186 = load i64, ptr %8, align 8
  %187 = add i64 %186, 1
  store i64 %187, ptr %8, align 8
  store i32 1, ptr %11, align 4
  br label %188

188:                                              ; preds = %185, %178
  br label %192

189:                                              ; preds = %175
  %190 = load i32, ptr %11, align 4
  %191 = add nsw i32 %190, 1
  store i32 %191, ptr %11, align 4
  br label %192

192:                                              ; preds = %189, %188
  store double 1.000000e+00, ptr %18, align 8
  br label %193

193:                                              ; preds = %192, %172
  br label %194

194:                                              ; preds = %193, %135
  br label %195

195:                                              ; preds = %194, %118
  store double 0.000000e+00, ptr %9, align 8
  br label %196

196:                                              ; preds = %195, %115
  %197 = load double, ptr %18, align 8
  %198 = fcmp oeq double %197, 0.000000e+00
  br i1 %198, label %199, label %208

199:                                              ; preds = %196
  %200 = load i32, ptr %14, align 4
  %201 = add i32 %200, 1
  store i32 %201, ptr %14, align 4
  %202 = load i32, ptr %16, align 4
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %204, label %207

204:                                              ; preds = %199
  %205 = load i32, ptr %15, align 4
  %206 = add i32 %205, 1
  store i32 %206, ptr %15, align 4
  br label %207

207:                                              ; preds = %204, %199
  br label %259

208:                                              ; preds = %196
  %209 = load i32, ptr %14, align 4
  %210 = load i32, ptr %15, align 4
  %211 = sub i32 %209, %210
  %212 = load i32, ptr %16, align 4
  %213 = add i32 %212, %211
  store i32 %213, ptr %16, align 4
  store i32 0, ptr %15, align 4
  br label %214

214:                                              ; preds = %231, %208
  %215 = load i32, ptr %14, align 4
  %216 = icmp ugt i32 %215, 0
  br i1 %216, label %217, label %236

217:                                              ; preds = %214
  %218 = load i32, ptr %11, align 4
  %219 = icmp ne i32 %218, -1
  br i1 %219, label %220, label %231

220:                                              ; preds = %217
  %221 = load i32, ptr %11, align 4
  %222 = icmp eq i32 %221, 0
  br i1 %222, label %223, label %228

223:                                              ; preds = %220
  %224 = load ptr, ptr %7, align 8
  %225 = getelementptr inbounds i8, ptr %224, i32 1
  store ptr %225, ptr %7, align 8
  store i8 46, ptr %224, align 1
  %226 = load i64, ptr %8, align 8
  %227 = add i64 %226, -1
  store i64 %227, ptr %8, align 8
  br label %228

228:                                              ; preds = %223, %220
  %229 = load i32, ptr %11, align 4
  %230 = add nsw i32 %229, -1
  store i32 %230, ptr %11, align 4
  br label %231

231:                                              ; preds = %228, %217
  %232 = load ptr, ptr %7, align 8
  %233 = getelementptr inbounds i8, ptr %232, i32 1
  store ptr %233, ptr %7, align 8
  store i8 48, ptr %232, align 1
  %234 = load i32, ptr %14, align 4
  %235 = add i32 %234, -1
  store i32 %235, ptr %14, align 4
  br label %214, !llvm.loop !20

236:                                              ; preds = %214
  %237 = load i32, ptr %11, align 4
  %238 = icmp ne i32 %237, -1
  br i1 %238, label %239, label %250

239:                                              ; preds = %236
  %240 = load i32, ptr %11, align 4
  %241 = icmp eq i32 %240, 0
  br i1 %241, label %242, label %247

242:                                              ; preds = %239
  %243 = load ptr, ptr %7, align 8
  %244 = getelementptr inbounds i8, ptr %243, i32 1
  store ptr %244, ptr %7, align 8
  store i8 46, ptr %243, align 1
  %245 = load i64, ptr %8, align 8
  %246 = add i64 %245, -1
  store i64 %246, ptr %8, align 8
  br label %247

247:                                              ; preds = %242, %239
  %248 = load i32, ptr %11, align 4
  %249 = add nsw i32 %248, -1
  store i32 %249, ptr %11, align 4
  br label %250

250:                                              ; preds = %247, %236
  %251 = load double, ptr %18, align 8
  %252 = fptosi double %251 to i32
  %253 = add nsw i32 48, %252
  %254 = trunc i32 %253 to i8
  %255 = load ptr, ptr %7, align 8
  %256 = getelementptr inbounds i8, ptr %255, i32 1
  store ptr %256, ptr %7, align 8
  store i8 %254, ptr %255, align 1
  %257 = load i32, ptr %16, align 4
  %258 = add i32 %257, 1
  store i32 %258, ptr %16, align 4
  br label %259

259:                                              ; preds = %250, %207
  br label %260

260:                                              ; preds = %259
  %261 = load i32, ptr %16, align 4
  %262 = load i32, ptr %14, align 4
  %263 = add i32 %261, %262
  %264 = load i32, ptr %10, align 4
  %265 = load i32, ptr %15, align 4
  %266 = add i32 %264, %265
  %267 = icmp ult i32 %263, %266
  br i1 %267, label %268, label %271

268:                                              ; preds = %260
  %269 = load double, ptr %9, align 8
  %270 = fcmp ogt double %269, 0x10000000000000
  br label %271

271:                                              ; preds = %268, %260
  %272 = phi i1 [ false, %260 ], [ %270, %268 ]
  br i1 %272, label %104, label %273, !llvm.loop !21

273:                                              ; preds = %271
  %274 = load i32, ptr %11, align 4
  %275 = icmp sge i32 %274, -1
  br i1 %275, label %276, label %289

276:                                              ; preds = %273
  %277 = load i32, ptr %11, align 4
  %278 = icmp sle i32 %277, 2
  br i1 %278, label %279, label %289

279:                                              ; preds = %276
  br label %280

280:                                              ; preds = %284, %279
  %281 = load i32, ptr %11, align 4
  %282 = add nsw i32 %281, -1
  store i32 %282, ptr %11, align 4
  %283 = icmp sgt i32 %281, 0
  br i1 %283, label %284, label %287

284:                                              ; preds = %280
  %285 = load ptr, ptr %7, align 8
  %286 = getelementptr inbounds i8, ptr %285, i32 1
  store ptr %286, ptr %7, align 8
  store i8 48, ptr %285, align 1
  br label %280, !llvm.loop !22

287:                                              ; preds = %280
  %288 = load ptr, ptr %7, align 8
  store i8 0, ptr %288, align 1
  br label %363

289:                                              ; preds = %276, %273
  %290 = load i32, ptr %16, align 4
  %291 = zext i32 %290 to i64
  %292 = load i64, ptr %8, align 8
  %293 = sub i64 %292, %291
  store i64 %293, ptr %8, align 8
  %294 = load ptr, ptr %7, align 8
  %295 = getelementptr inbounds i8, ptr %294, i32 1
  store ptr %295, ptr %7, align 8
  store i8 69, ptr %294, align 1
  %296 = load i64, ptr %8, align 8
  %297 = add i64 %296, -1
  store i64 %297, ptr %8, align 8
  %298 = load i32, ptr %11, align 4
  %299 = icmp slt i32 %298, 0
  br i1 %299, label %300, label %307

300:                                              ; preds = %289
  %301 = load ptr, ptr %7, align 8
  %302 = getelementptr inbounds i8, ptr %301, i32 1
  store ptr %302, ptr %7, align 8
  store i8 45, ptr %301, align 1
  %303 = load i64, ptr %8, align 8
  %304 = add i64 %303, -1
  store i64 %304, ptr %8, align 8
  %305 = load i32, ptr %11, align 4
  %306 = sub i32 0, %305
  store i32 %306, ptr %21, align 4
  br label %310

307:                                              ; preds = %289
  %308 = load i32, ptr %11, align 4
  %309 = add i32 0, %308
  store i32 %309, ptr %21, align 4
  br label %310

310:                                              ; preds = %307, %300
  store i32 0, ptr %16, align 4
  br label %311

311:                                              ; preds = %314, %310
  %312 = load i32, ptr %21, align 4
  %313 = icmp ugt i32 %312, 0
  br i1 %313, label %314, label %325

314:                                              ; preds = %311
  %315 = load i32, ptr %21, align 4
  %316 = urem i32 %315, 10
  %317 = add i32 48, %316
  %318 = trunc i32 %317 to i8
  %319 = load i32, ptr %16, align 4
  %320 = add i32 %319, 1
  store i32 %320, ptr %16, align 4
  %321 = zext i32 %319 to i64
  %322 = getelementptr inbounds [10 x i8], ptr %17, i64 0, i64 %321
  store i8 %318, ptr %322, align 1
  %323 = load i32, ptr %21, align 4
  %324 = udiv i32 %323, 10
  store i32 %324, ptr %21, align 4
  br label %311, !llvm.loop !23

325:                                              ; preds = %311
  %326 = load i64, ptr %8, align 8
  %327 = load i32, ptr %16, align 4
  %328 = zext i32 %327 to i64
  %329 = icmp ugt i64 %326, %328
  br i1 %329, label %330, label %344

330:                                              ; preds = %325
  br label %331

331:                                              ; preds = %334, %330
  %332 = load i32, ptr %16, align 4
  %333 = icmp ugt i32 %332, 0
  br i1 %333, label %334, label %342

334:                                              ; preds = %331
  %335 = load i32, ptr %16, align 4
  %336 = add i32 %335, -1
  store i32 %336, ptr %16, align 4
  %337 = zext i32 %336 to i64
  %338 = getelementptr inbounds [10 x i8], ptr %17, i64 0, i64 %337
  %339 = load i8, ptr %338, align 1
  %340 = load ptr, ptr %7, align 8
  %341 = getelementptr inbounds i8, ptr %340, i32 1
  store ptr %341, ptr %7, align 8
  store i8 %339, ptr %340, align 1
  br label %331, !llvm.loop !24

342:                                              ; preds = %331
  %343 = load ptr, ptr %7, align 8
  store i8 0, ptr %343, align 1
  br label %363

344:                                              ; preds = %325
  br label %360

345:                                              ; preds = %48, %45
  %346 = load double, ptr %9, align 8
  %347 = fcmp oge double %346, 0x10000000000000
  br i1 %347, label %352, label %348

348:                                              ; preds = %345
  %349 = load ptr, ptr %7, align 8
  %350 = getelementptr inbounds i8, ptr %349, i32 1
  store ptr %350, ptr %7, align 8
  store i8 48, ptr %349, align 1
  %351 = load ptr, ptr %7, align 8
  store i8 0, ptr %351, align 1
  br label %363

352:                                              ; preds = %345
  %353 = load ptr, ptr %7, align 8
  %354 = getelementptr inbounds i8, ptr %353, i32 1
  store ptr %354, ptr %7, align 8
  store i8 105, ptr %353, align 1
  %355 = load ptr, ptr %7, align 8
  %356 = getelementptr inbounds i8, ptr %355, i32 1
  store ptr %356, ptr %7, align 8
  store i8 110, ptr %355, align 1
  %357 = load ptr, ptr %7, align 8
  %358 = getelementptr inbounds i8, ptr %357, i32 1
  store ptr %358, ptr %7, align 8
  store i8 102, ptr %357, align 1
  %359 = load ptr, ptr %7, align 8
  store i8 0, ptr %359, align 1
  br label %363

360:                                              ; preds = %344
  br label %361

361:                                              ; preds = %360, %29
  %362 = load ptr, ptr %6, align 8
  call void @png_error(ptr noundef %362, ptr noundef @.str.55) #10
  unreachable

363:                                              ; preds = %352, %348, %342, %287
  ret void
}

; Function Attrs: nounwind
declare double @frexp(double noundef, ptr noundef) #8

; Function Attrs: noinline nounwind sspstrong uwtable
define internal double @png_pow10(i32 noundef %0) #0 {
  %2 = alloca double, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  store i32 %0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  store double 1.000000e+00, ptr %5, align 8
  %7 = load i32, ptr %3, align 4
  %8 = icmp slt i32 %7, 0
  br i1 %8, label %9, label %16

9:                                                ; preds = %1
  %10 = load i32, ptr %3, align 4
  %11 = icmp slt i32 %10, -307
  br i1 %11, label %12, label %13

12:                                               ; preds = %9
  store double 0.000000e+00, ptr %2, align 8
  br label %46

13:                                               ; preds = %9
  store i32 1, ptr %4, align 4
  %14 = load i32, ptr %3, align 4
  %15 = sub nsw i32 0, %14
  store i32 %15, ptr %3, align 4
  br label %16

16:                                               ; preds = %13, %1
  %17 = load i32, ptr %3, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %44

19:                                               ; preds = %16
  store double 1.000000e+01, ptr %6, align 8
  br label %20

20:                                               ; preds = %34, %19
  %21 = load i32, ptr %3, align 4
  %22 = and i32 %21, 1
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %28

24:                                               ; preds = %20
  %25 = load double, ptr %6, align 8
  %26 = load double, ptr %5, align 8
  %27 = fmul double %26, %25
  store double %27, ptr %5, align 8
  br label %28

28:                                               ; preds = %24, %20
  %29 = load double, ptr %6, align 8
  %30 = load double, ptr %6, align 8
  %31 = fmul double %30, %29
  store double %31, ptr %6, align 8
  %32 = load i32, ptr %3, align 4
  %33 = ashr i32 %32, 1
  store i32 %33, ptr %3, align 4
  br label %34

34:                                               ; preds = %28
  %35 = load i32, ptr %3, align 4
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %20, label %37, !llvm.loop !25

37:                                               ; preds = %34
  %38 = load i32, ptr %4, align 4
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %43

40:                                               ; preds = %37
  %41 = load double, ptr %5, align 8
  %42 = fdiv double 1.000000e+00, %41
  store double %42, ptr %5, align 8
  br label %43

43:                                               ; preds = %40, %37
  br label %44

44:                                               ; preds = %43, %16
  %45 = load double, ptr %5, align 8
  store double %45, ptr %2, align 8
  br label %46

46:                                               ; preds = %44, %12
  %47 = load double, ptr %2, align 8
  ret double %47
}

; Function Attrs: nounwind
declare double @modf(double noundef, ptr noundef) #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.floor.f64(double) #9

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_ascii_from_fixed(ptr noalias noundef %0, ptr noundef %1, i64 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [10 x i8], align 1
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store i32 %3, ptr %8, align 4
  %15 = load i64, ptr %7, align 8
  %16 = icmp ugt i64 %15, 12
  br i1 %16, label %17, label %108

17:                                               ; preds = %4
  %18 = load i32, ptr %8, align 4
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %25

20:                                               ; preds = %17
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds i8, ptr %21, i32 1
  store ptr %22, ptr %6, align 8
  store i8 45, ptr %21, align 1
  %23 = load i32, ptr %8, align 4
  %24 = sub nsw i32 0, %23
  store i32 %24, ptr %9, align 4
  br label %27

25:                                               ; preds = %17
  %26 = load i32, ptr %8, align 4
  store i32 %26, ptr %9, align 4
  br label %27

27:                                               ; preds = %25, %20
  %28 = load i32, ptr %9, align 4
  %29 = icmp ule i32 %28, -2147483648
  br i1 %29, label %30, label %107

30:                                               ; preds = %27
  store i32 0, ptr %10, align 4
  store i32 16, ptr %11, align 4
  call void @llvm.memset.p0.i64(ptr align 1 %12, i8 0, i64 10, i1 false)
  br label %31

31:                                               ; preds = %55, %30
  %32 = load i32, ptr %9, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %57

34:                                               ; preds = %31
  %35 = load i32, ptr %9, align 4
  %36 = udiv i32 %35, 10
  store i32 %36, ptr %13, align 4
  %37 = load i32, ptr %13, align 4
  %38 = mul i32 %37, 10
  %39 = load i32, ptr %9, align 4
  %40 = sub i32 %39, %38
  store i32 %40, ptr %9, align 4
  %41 = load i32, ptr %9, align 4
  %42 = add i32 48, %41
  %43 = trunc i32 %42 to i8
  %44 = load i32, ptr %10, align 4
  %45 = add i32 %44, 1
  store i32 %45, ptr %10, align 4
  %46 = zext i32 %44 to i64
  %47 = getelementptr inbounds [10 x i8], ptr %12, i64 0, i64 %46
  store i8 %43, ptr %47, align 1
  %48 = load i32, ptr %11, align 4
  %49 = icmp eq i32 %48, 16
  br i1 %49, label %50, label %55

50:                                               ; preds = %34
  %51 = load i32, ptr %9, align 4
  %52 = icmp ugt i32 %51, 0
  br i1 %52, label %53, label %55

53:                                               ; preds = %50
  %54 = load i32, ptr %10, align 4
  store i32 %54, ptr %11, align 4
  br label %55

55:                                               ; preds = %53, %50, %34
  %56 = load i32, ptr %13, align 4
  store i32 %56, ptr %9, align 4
  br label %31, !llvm.loop !26

57:                                               ; preds = %31
  %58 = load i32, ptr %10, align 4
  %59 = icmp ugt i32 %58, 0
  br i1 %59, label %60, label %102

60:                                               ; preds = %57
  br label %61

61:                                               ; preds = %64, %60
  %62 = load i32, ptr %10, align 4
  %63 = icmp ugt i32 %62, 5
  br i1 %63, label %64, label %72

64:                                               ; preds = %61
  %65 = load i32, ptr %10, align 4
  %66 = add i32 %65, -1
  store i32 %66, ptr %10, align 4
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds [10 x i8], ptr %12, i64 0, i64 %67
  %69 = load i8, ptr %68, align 1
  %70 = load ptr, ptr %6, align 8
  %71 = getelementptr inbounds i8, ptr %70, i32 1
  store ptr %71, ptr %6, align 8
  store i8 %69, ptr %70, align 1
  br label %61, !llvm.loop !27

72:                                               ; preds = %61
  %73 = load i32, ptr %11, align 4
  %74 = icmp ule i32 %73, 5
  br i1 %74, label %75, label %101

75:                                               ; preds = %72
  %76 = load ptr, ptr %6, align 8
  %77 = getelementptr inbounds i8, ptr %76, i32 1
  store ptr %77, ptr %6, align 8
  store i8 46, ptr %76, align 1
  store i32 5, ptr %14, align 4
  br label %78

78:                                               ; preds = %82, %75
  %79 = load i32, ptr %10, align 4
  %80 = load i32, ptr %14, align 4
  %81 = icmp ult i32 %79, %80
  br i1 %81, label %82, label %87

82:                                               ; preds = %78
  %83 = load ptr, ptr %6, align 8
  %84 = getelementptr inbounds i8, ptr %83, i32 1
  store ptr %84, ptr %6, align 8
  store i8 48, ptr %83, align 1
  %85 = load i32, ptr %14, align 4
  %86 = add i32 %85, -1
  store i32 %86, ptr %14, align 4
  br label %78, !llvm.loop !28

87:                                               ; preds = %78
  br label %88

88:                                               ; preds = %92, %87
  %89 = load i32, ptr %10, align 4
  %90 = load i32, ptr %11, align 4
  %91 = icmp uge i32 %89, %90
  br i1 %91, label %92, label %100

92:                                               ; preds = %88
  %93 = load i32, ptr %10, align 4
  %94 = add i32 %93, -1
  store i32 %94, ptr %10, align 4
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds [10 x i8], ptr %12, i64 0, i64 %95
  %97 = load i8, ptr %96, align 1
  %98 = load ptr, ptr %6, align 8
  %99 = getelementptr inbounds i8, ptr %98, i32 1
  store ptr %99, ptr %6, align 8
  store i8 %97, ptr %98, align 1
  br label %88, !llvm.loop !29

100:                                              ; preds = %88
  br label %101

101:                                              ; preds = %100, %72
  br label %105

102:                                              ; preds = %57
  %103 = load ptr, ptr %6, align 8
  %104 = getelementptr inbounds i8, ptr %103, i32 1
  store ptr %104, ptr %6, align 8
  store i8 48, ptr %103, align 1
  br label %105

105:                                              ; preds = %102, %101
  %106 = load ptr, ptr %6, align 8
  store i8 0, ptr %106, align 1
  ret void

107:                                              ; preds = %27
  br label %108

108:                                              ; preds = %107, %4
  %109 = load ptr, ptr %5, align 8
  call void @png_error(ptr noundef %109, ptr noundef @.str.55) #10
  unreachable
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_fixed(ptr noalias noundef %0, double noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca ptr, align 8
  %7 = alloca double, align 8
  store ptr %0, ptr %4, align 8
  store double %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load double, ptr %5, align 8
  %9 = call double @llvm.fmuladd.f64(double 1.000000e+05, double %8, double 5.000000e-01)
  %10 = call double @llvm.floor.f64(double %9)
  store double %10, ptr %7, align 8
  %11 = load double, ptr %7, align 8
  %12 = fcmp ogt double %11, 0x41DFFFFFFFC00000
  br i1 %12, label %16, label %13

13:                                               ; preds = %3
  %14 = load double, ptr %7, align 8
  %15 = fcmp olt double %14, 0xC1E0000000000000
  br i1 %15, label %16, label %19

16:                                               ; preds = %13, %3
  %17 = load ptr, ptr %4, align 8
  %18 = load ptr, ptr %6, align 8
  call void @png_fixed_error(ptr noundef %17, ptr noundef %18) #10
  unreachable

19:                                               ; preds = %13
  %20 = load double, ptr %7, align 8
  %21 = fptosi double %20 to i32
  ret i32 %21
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #9

; Function Attrs: noreturn
declare void @png_fixed_error(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_fixed_ITU(ptr noalias noundef %0, double noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca double, align 8
  %6 = alloca ptr, align 8
  %7 = alloca double, align 8
  store ptr %0, ptr %4, align 8
  store double %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load double, ptr %5, align 8
  %9 = call double @llvm.fmuladd.f64(double 1.000000e+04, double %8, double 5.000000e-01)
  %10 = call double @llvm.floor.f64(double %9)
  store double %10, ptr %7, align 8
  %11 = load double, ptr %7, align 8
  %12 = fcmp ogt double %11, 0x41DFFFFFFFC00000
  br i1 %12, label %16, label %13

13:                                               ; preds = %3
  %14 = load double, ptr %7, align 8
  %15 = fcmp olt double %14, 0.000000e+00
  br i1 %15, label %16, label %19

16:                                               ; preds = %13, %3
  %17 = load ptr, ptr %4, align 8
  %18 = load ptr, ptr %6, align 8
  call void @png_fixed_error(ptr noundef %17, ptr noundef %18) #10
  unreachable

19:                                               ; preds = %13
  %20 = load double, ptr %7, align 8
  %21 = fptoui double %20 to i32
  ret i32 %21
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_gamma_significant(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = icmp slt i32 %3, 95000
  br i1 %4, label %8, label %5

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4
  %7 = icmp sgt i32 %6, 105000
  br label %8

8:                                                ; preds = %5, %1
  %9 = phi i1 [ true, %1 ], [ %7, %5 ]
  %10 = zext i1 %9 to i32
  ret i32 %10
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_reciprocal2(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %32

9:                                                ; preds = %2
  %10 = load i32, ptr %5, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %32

12:                                               ; preds = %9
  %13 = load i32, ptr %4, align 4
  %14 = sitofp i32 %13 to double
  %15 = fdiv double 1.000000e+15, %14
  store double %15, ptr %6, align 8
  %16 = load i32, ptr %5, align 4
  %17 = sitofp i32 %16 to double
  %18 = load double, ptr %6, align 8
  %19 = fdiv double %18, %17
  store double %19, ptr %6, align 8
  %20 = load double, ptr %6, align 8
  %21 = fadd double %20, 5.000000e-01
  %22 = call double @llvm.floor.f64(double %21)
  store double %22, ptr %6, align 8
  %23 = load double, ptr %6, align 8
  %24 = fcmp ole double %23, 0x41DFFFFFFFC00000
  br i1 %24, label %25, label %31

25:                                               ; preds = %12
  %26 = load double, ptr %6, align 8
  %27 = fcmp oge double %26, 0xC1E0000000000000
  br i1 %27, label %28, label %31

28:                                               ; preds = %25
  %29 = load double, ptr %6, align 8
  %30 = fptosi double %29 to i32
  store i32 %30, ptr %3, align 4
  br label %33

31:                                               ; preds = %25, %12
  br label %32

32:                                               ; preds = %31, %9, %2
  store i32 0, ptr %3, align 4
  br label %33

33:                                               ; preds = %32, %28
  %34 = load i32, ptr %3, align 4
  ret i32 %34
}

; Function Attrs: noinline nounwind sspstrong uwtable
define zeroext i8 @png_gamma_8bit_correct(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp ugt i32 %7, 0
  br i1 %8, label %9, label %24

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = icmp ult i32 %10, 255
  br i1 %11, label %12, label %24

12:                                               ; preds = %9
  %13 = load i32, ptr %4, align 4
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 2.550000e+02
  %16 = load i32, ptr %5, align 4
  %17 = sitofp i32 %16 to double
  %18 = fmul double %17, 1.000000e-05
  %19 = call double @pow(double noundef %15, double noundef %18) #13
  %20 = call double @llvm.fmuladd.f64(double 2.550000e+02, double %19, double 5.000000e-01)
  %21 = call double @llvm.floor.f64(double %20)
  store double %21, ptr %6, align 8
  %22 = load double, ptr %6, align 8
  %23 = fptoui double %22 to i8
  store i8 %23, ptr %3, align 1
  br label %28

24:                                               ; preds = %9, %2
  %25 = load i32, ptr %4, align 4
  %26 = and i32 %25, 255
  %27 = trunc i32 %26 to i8
  store i8 %27, ptr %3, align 1
  br label %28

28:                                               ; preds = %24, %12
  %29 = load i8, ptr %3, align 1
  ret i8 %29
}

; Function Attrs: nounwind
declare double @pow(double noundef, double noundef) #8

; Function Attrs: noinline nounwind sspstrong uwtable
define zeroext i16 @png_gamma_16bit_correct(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  %7 = load i32, ptr %4, align 4
  %8 = icmp ugt i32 %7, 0
  br i1 %8, label %9, label %24

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4
  %11 = icmp ult i32 %10, 65535
  br i1 %11, label %12, label %24

12:                                               ; preds = %9
  %13 = load i32, ptr %4, align 4
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 6.553500e+04
  %16 = load i32, ptr %5, align 4
  %17 = sitofp i32 %16 to double
  %18 = fmul double %17, 1.000000e-05
  %19 = call double @pow(double noundef %15, double noundef %18) #13
  %20 = call double @llvm.fmuladd.f64(double 6.553500e+04, double %19, double 5.000000e-01)
  %21 = call double @llvm.floor.f64(double %20)
  store double %21, ptr %6, align 8
  %22 = load double, ptr %6, align 8
  %23 = fptoui double %22 to i16
  store i16 %23, ptr %3, align 2
  br label %27

24:                                               ; preds = %9, %2
  %25 = load i32, ptr %4, align 4
  %26 = trunc i32 %25 to i16
  store i16 %26, ptr %3, align 2
  br label %27

27:                                               ; preds = %24, %12
  %28 = load i16, ptr %3, align 2
  ret i16 %28
}

; Function Attrs: noinline nounwind sspstrong uwtable
define zeroext i16 @png_gamma_correct(ptr noalias noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i16, align 2
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %8 = load ptr, ptr %5, align 8
  %9 = getelementptr inbounds %struct.png_struct_def, ptr %8, i32 0, i32 63
  %10 = load i8, ptr %9, align 8
  %11 = zext i8 %10 to i32
  %12 = icmp eq i32 %11, 8
  br i1 %12, label %13, label %18

13:                                               ; preds = %3
  %14 = load i32, ptr %6, align 4
  %15 = load i32, ptr %7, align 4
  %16 = call zeroext i8 @png_gamma_8bit_correct(i32 noundef %14, i32 noundef %15)
  %17 = zext i8 %16 to i16
  store i16 %17, ptr %4, align 2
  br label %22

18:                                               ; preds = %3
  %19 = load i32, ptr %6, align 4
  %20 = load i32, ptr %7, align 4
  %21 = call zeroext i16 @png_gamma_16bit_correct(i32 noundef %19, i32 noundef %20)
  store i16 %21, ptr %4, align 2
  br label %22

22:                                               ; preds = %18, %13
  %23 = load i16, ptr %4, align 2
  ret i16 %23
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_destroy_gamma_table(ptr noalias noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds %struct.png_struct_def, ptr %10, i32 0, i32 86
  %12 = load ptr, ptr %11, align 8
  call void @png_free(ptr noundef %9, ptr noundef %12)
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds %struct.png_struct_def, ptr %13, i32 0, i32 86
  store ptr null, ptr %14, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds %struct.png_struct_def, ptr %15, i32 0, i32 87
  %17 = load ptr, ptr %16, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %48

19:                                               ; preds = %1
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.png_struct_def, ptr %20, i32 0, i32 81
  %22 = load i32, ptr %21, align 8
  %23 = sub nsw i32 8, %22
  %24 = shl i32 1, %23
  store i32 %24, ptr %4, align 4
  store i32 0, ptr %3, align 4
  br label %25

25:                                               ; preds = %38, %19
  %26 = load i32, ptr %3, align 4
  %27 = load i32, ptr %4, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %41

29:                                               ; preds = %25
  %30 = load ptr, ptr %2, align 8
  %31 = load ptr, ptr %2, align 8
  %32 = getelementptr inbounds %struct.png_struct_def, ptr %31, i32 0, i32 87
  %33 = load ptr, ptr %32, align 8
  %34 = load i32, ptr %3, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds ptr, ptr %33, i64 %35
  %37 = load ptr, ptr %36, align 8
  call void @png_free(ptr noundef %30, ptr noundef %37)
  br label %38

38:                                               ; preds = %29
  %39 = load i32, ptr %3, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %3, align 4
  br label %25, !llvm.loop !30

41:                                               ; preds = %25
  %42 = load ptr, ptr %2, align 8
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds %struct.png_struct_def, ptr %43, i32 0, i32 87
  %45 = load ptr, ptr %44, align 8
  call void @png_free(ptr noundef %42, ptr noundef %45)
  %46 = load ptr, ptr %2, align 8
  %47 = getelementptr inbounds %struct.png_struct_def, ptr %46, i32 0, i32 87
  store ptr null, ptr %47, align 8
  br label %48

48:                                               ; preds = %41, %1
  %49 = load ptr, ptr %2, align 8
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds %struct.png_struct_def, ptr %50, i32 0, i32 88
  %52 = load ptr, ptr %51, align 8
  call void @png_free(ptr noundef %49, ptr noundef %52)
  %53 = load ptr, ptr %2, align 8
  %54 = getelementptr inbounds %struct.png_struct_def, ptr %53, i32 0, i32 88
  store ptr null, ptr %54, align 8
  %55 = load ptr, ptr %2, align 8
  %56 = load ptr, ptr %2, align 8
  %57 = getelementptr inbounds %struct.png_struct_def, ptr %56, i32 0, i32 89
  %58 = load ptr, ptr %57, align 8
  call void @png_free(ptr noundef %55, ptr noundef %58)
  %59 = load ptr, ptr %2, align 8
  %60 = getelementptr inbounds %struct.png_struct_def, ptr %59, i32 0, i32 89
  store ptr null, ptr %60, align 8
  %61 = load ptr, ptr %2, align 8
  %62 = getelementptr inbounds %struct.png_struct_def, ptr %61, i32 0, i32 90
  %63 = load ptr, ptr %62, align 8
  %64 = icmp ne ptr %63, null
  br i1 %64, label %65, label %94

65:                                               ; preds = %48
  %66 = load ptr, ptr %2, align 8
  %67 = getelementptr inbounds %struct.png_struct_def, ptr %66, i32 0, i32 81
  %68 = load i32, ptr %67, align 8
  %69 = sub nsw i32 8, %68
  %70 = shl i32 1, %69
  store i32 %70, ptr %6, align 4
  store i32 0, ptr %5, align 4
  br label %71

71:                                               ; preds = %84, %65
  %72 = load i32, ptr %5, align 4
  %73 = load i32, ptr %6, align 4
  %74 = icmp slt i32 %72, %73
  br i1 %74, label %75, label %87

75:                                               ; preds = %71
  %76 = load ptr, ptr %2, align 8
  %77 = load ptr, ptr %2, align 8
  %78 = getelementptr inbounds %struct.png_struct_def, ptr %77, i32 0, i32 90
  %79 = load ptr, ptr %78, align 8
  %80 = load i32, ptr %5, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds ptr, ptr %79, i64 %81
  %83 = load ptr, ptr %82, align 8
  call void @png_free(ptr noundef %76, ptr noundef %83)
  br label %84

84:                                               ; preds = %75
  %85 = load i32, ptr %5, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %5, align 4
  br label %71, !llvm.loop !31

87:                                               ; preds = %71
  %88 = load ptr, ptr %2, align 8
  %89 = load ptr, ptr %2, align 8
  %90 = getelementptr inbounds %struct.png_struct_def, ptr %89, i32 0, i32 90
  %91 = load ptr, ptr %90, align 8
  call void @png_free(ptr noundef %88, ptr noundef %91)
  %92 = load ptr, ptr %2, align 8
  %93 = getelementptr inbounds %struct.png_struct_def, ptr %92, i32 0, i32 90
  store ptr null, ptr %93, align 8
  br label %94

94:                                               ; preds = %87, %48
  %95 = load ptr, ptr %2, align 8
  %96 = getelementptr inbounds %struct.png_struct_def, ptr %95, i32 0, i32 91
  %97 = load ptr, ptr %96, align 8
  %98 = icmp ne ptr %97, null
  br i1 %98, label %99, label %128

99:                                               ; preds = %94
  %100 = load ptr, ptr %2, align 8
  %101 = getelementptr inbounds %struct.png_struct_def, ptr %100, i32 0, i32 81
  %102 = load i32, ptr %101, align 8
  %103 = sub nsw i32 8, %102
  %104 = shl i32 1, %103
  store i32 %104, ptr %8, align 4
  store i32 0, ptr %7, align 4
  br label %105

105:                                              ; preds = %118, %99
  %106 = load i32, ptr %7, align 4
  %107 = load i32, ptr %8, align 4
  %108 = icmp slt i32 %106, %107
  br i1 %108, label %109, label %121

109:                                              ; preds = %105
  %110 = load ptr, ptr %2, align 8
  %111 = load ptr, ptr %2, align 8
  %112 = getelementptr inbounds %struct.png_struct_def, ptr %111, i32 0, i32 91
  %113 = load ptr, ptr %112, align 8
  %114 = load i32, ptr %7, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds ptr, ptr %113, i64 %115
  %117 = load ptr, ptr %116, align 8
  call void @png_free(ptr noundef %110, ptr noundef %117)
  br label %118

118:                                              ; preds = %109
  %119 = load i32, ptr %7, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, ptr %7, align 4
  br label %105, !llvm.loop !32

121:                                              ; preds = %105
  %122 = load ptr, ptr %2, align 8
  %123 = load ptr, ptr %2, align 8
  %124 = getelementptr inbounds %struct.png_struct_def, ptr %123, i32 0, i32 91
  %125 = load ptr, ptr %124, align 8
  call void @png_free(ptr noundef %122, ptr noundef %125)
  %126 = load ptr, ptr %2, align 8
  %127 = getelementptr inbounds %struct.png_struct_def, ptr %126, i32 0, i32 91
  store ptr null, ptr %127, align 8
  br label %128

128:                                              ; preds = %121, %94
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_build_gamma_table(ptr noalias noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds %struct.png_struct_def, ptr %12, i32 0, i32 86
  %14 = load ptr, ptr %13, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %21, label %16

16:                                               ; preds = %2
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds %struct.png_struct_def, ptr %17, i32 0, i32 87
  %19 = load ptr, ptr %18, align 8
  %20 = icmp ne ptr %19, null
  br i1 %20, label %21, label %24

21:                                               ; preds = %16, %2
  %22 = load ptr, ptr %3, align 8
  call void @png_warning(ptr noundef %22, ptr noundef @.str.56)
  %23 = load ptr, ptr %3, align 8
  call void @png_destroy_gamma_table(ptr noundef %23)
  br label %24

24:                                               ; preds = %21, %16
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds %struct.png_struct_def, ptr %25, i32 0, i32 83
  %27 = load i32, ptr %26, align 8
  store i32 %27, ptr %5, align 4
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds %struct.png_struct_def, ptr %28, i32 0, i32 82
  %30 = load i32, ptr %29, align 4
  store i32 %30, ptr %6, align 4
  %31 = load i32, ptr %5, align 4
  %32 = call i32 @png_reciprocal(i32 noundef %31)
  store i32 %32, ptr %8, align 4
  %33 = load i32, ptr %6, align 4
  %34 = icmp sgt i32 %33, 0
  br i1 %34, label %35, label %41

35:                                               ; preds = %24
  %36 = load i32, ptr %6, align 4
  %37 = call i32 @png_reciprocal(i32 noundef %36)
  store i32 %37, ptr %9, align 4
  %38 = load i32, ptr %6, align 4
  %39 = load i32, ptr %5, align 4
  %40 = call i32 @png_reciprocal2(i32 noundef %38, i32 noundef %39)
  store i32 %40, ptr %7, align 4
  br label %43

41:                                               ; preds = %24
  %42 = load i32, ptr %5, align 4
  store i32 %42, ptr %9, align 4
  store i32 100000, ptr %7, align 4
  br label %43

43:                                               ; preds = %41, %35
  %44 = load i32, ptr %4, align 4
  %45 = icmp sle i32 %44, 8
  br i1 %45, label %46, label %66

46:                                               ; preds = %43
  %47 = load ptr, ptr %3, align 8
  %48 = load ptr, ptr %3, align 8
  %49 = getelementptr inbounds %struct.png_struct_def, ptr %48, i32 0, i32 86
  %50 = load i32, ptr %7, align 4
  call void @png_build_8bit_table(ptr noundef %47, ptr noundef %49, i32 noundef %50)
  %51 = load ptr, ptr %3, align 8
  %52 = getelementptr inbounds %struct.png_struct_def, ptr %51, i32 0, i32 17
  %53 = load i32, ptr %52, align 4
  %54 = and i32 %53, 6291584
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %65

56:                                               ; preds = %46
  %57 = load ptr, ptr %3, align 8
  %58 = load ptr, ptr %3, align 8
  %59 = getelementptr inbounds %struct.png_struct_def, ptr %58, i32 0, i32 89
  %60 = load i32, ptr %8, align 4
  call void @png_build_8bit_table(ptr noundef %57, ptr noundef %59, i32 noundef %60)
  %61 = load ptr, ptr %3, align 8
  %62 = load ptr, ptr %3, align 8
  %63 = getelementptr inbounds %struct.png_struct_def, ptr %62, i32 0, i32 88
  %64 = load i32, ptr %9, align 4
  call void @png_build_8bit_table(ptr noundef %61, ptr noundef %63, i32 noundef %64)
  br label %65

65:                                               ; preds = %56, %46
  br label %188

66:                                               ; preds = %43
  %67 = load ptr, ptr %3, align 8
  %68 = getelementptr inbounds %struct.png_struct_def, ptr %67, i32 0, i32 62
  %69 = load i8, ptr %68, align 1
  %70 = zext i8 %69 to i32
  %71 = and i32 %70, 2
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %106

73:                                               ; preds = %66
  %74 = load ptr, ptr %3, align 8
  %75 = getelementptr inbounds %struct.png_struct_def, ptr %74, i32 0, i32 92
  %76 = getelementptr inbounds %struct.png_color_8_struct, ptr %75, i32 0, i32 0
  %77 = load i8, ptr %76, align 8
  store i8 %77, ptr %11, align 1
  %78 = load ptr, ptr %3, align 8
  %79 = getelementptr inbounds %struct.png_struct_def, ptr %78, i32 0, i32 92
  %80 = getelementptr inbounds %struct.png_color_8_struct, ptr %79, i32 0, i32 1
  %81 = load i8, ptr %80, align 1
  %82 = zext i8 %81 to i32
  %83 = load i8, ptr %11, align 1
  %84 = zext i8 %83 to i32
  %85 = icmp sgt i32 %82, %84
  br i1 %85, label %86, label %91

86:                                               ; preds = %73
  %87 = load ptr, ptr %3, align 8
  %88 = getelementptr inbounds %struct.png_struct_def, ptr %87, i32 0, i32 92
  %89 = getelementptr inbounds %struct.png_color_8_struct, ptr %88, i32 0, i32 1
  %90 = load i8, ptr %89, align 1
  store i8 %90, ptr %11, align 1
  br label %91

91:                                               ; preds = %86, %73
  %92 = load ptr, ptr %3, align 8
  %93 = getelementptr inbounds %struct.png_struct_def, ptr %92, i32 0, i32 92
  %94 = getelementptr inbounds %struct.png_color_8_struct, ptr %93, i32 0, i32 2
  %95 = load i8, ptr %94, align 2
  %96 = zext i8 %95 to i32
  %97 = load i8, ptr %11, align 1
  %98 = zext i8 %97 to i32
  %99 = icmp sgt i32 %96, %98
  br i1 %99, label %100, label %105

100:                                              ; preds = %91
  %101 = load ptr, ptr %3, align 8
  %102 = getelementptr inbounds %struct.png_struct_def, ptr %101, i32 0, i32 92
  %103 = getelementptr inbounds %struct.png_color_8_struct, ptr %102, i32 0, i32 2
  %104 = load i8, ptr %103, align 2
  store i8 %104, ptr %11, align 1
  br label %105

105:                                              ; preds = %100, %91
  br label %111

106:                                              ; preds = %66
  %107 = load ptr, ptr %3, align 8
  %108 = getelementptr inbounds %struct.png_struct_def, ptr %107, i32 0, i32 92
  %109 = getelementptr inbounds %struct.png_color_8_struct, ptr %108, i32 0, i32 3
  %110 = load i8, ptr %109, align 1
  store i8 %110, ptr %11, align 1
  br label %111

111:                                              ; preds = %106, %105
  %112 = load i8, ptr %11, align 1
  %113 = zext i8 %112 to i32
  %114 = icmp sgt i32 %113, 0
  br i1 %114, label %115, label %125

115:                                              ; preds = %111
  %116 = load i8, ptr %11, align 1
  %117 = zext i8 %116 to i32
  %118 = icmp ult i32 %117, 16
  br i1 %118, label %119, label %125

119:                                              ; preds = %115
  %120 = load i8, ptr %11, align 1
  %121 = zext i8 %120 to i32
  %122 = sub i32 16, %121
  %123 = and i32 %122, 255
  %124 = trunc i32 %123 to i8
  store i8 %124, ptr %10, align 1
  br label %126

125:                                              ; preds = %115, %111
  store i8 0, ptr %10, align 1
  br label %126

126:                                              ; preds = %125, %119
  %127 = load ptr, ptr %3, align 8
  %128 = getelementptr inbounds %struct.png_struct_def, ptr %127, i32 0, i32 17
  %129 = load i32, ptr %128, align 4
  %130 = and i32 %129, 67109888
  %131 = icmp ne i32 %130, 0
  br i1 %131, label %132, label %138

132:                                              ; preds = %126
  %133 = load i8, ptr %10, align 1
  %134 = zext i8 %133 to i32
  %135 = icmp ult i32 %134, 5
  br i1 %135, label %136, label %137

136:                                              ; preds = %132
  store i8 5, ptr %10, align 1
  br label %137

137:                                              ; preds = %136, %132
  br label %138

138:                                              ; preds = %137, %126
  %139 = load i8, ptr %10, align 1
  %140 = zext i8 %139 to i32
  %141 = icmp ugt i32 %140, 8
  br i1 %141, label %142, label %143

142:                                              ; preds = %138
  store i8 8, ptr %10, align 1
  br label %143

143:                                              ; preds = %142, %138
  %144 = load i8, ptr %10, align 1
  %145 = zext i8 %144 to i32
  %146 = load ptr, ptr %3, align 8
  %147 = getelementptr inbounds %struct.png_struct_def, ptr %146, i32 0, i32 81
  store i32 %145, ptr %147, align 8
  %148 = load ptr, ptr %3, align 8
  %149 = getelementptr inbounds %struct.png_struct_def, ptr %148, i32 0, i32 17
  %150 = load i32, ptr %149, align 4
  %151 = and i32 %150, 67109888
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %153, label %161

153:                                              ; preds = %143
  %154 = load ptr, ptr %3, align 8
  %155 = load ptr, ptr %3, align 8
  %156 = getelementptr inbounds %struct.png_struct_def, ptr %155, i32 0, i32 87
  %157 = load i8, ptr %10, align 1
  %158 = zext i8 %157 to i32
  %159 = load i32, ptr %7, align 4
  %160 = call i32 @png_reciprocal(i32 noundef %159)
  call void @png_build_16to8_table(ptr noundef %154, ptr noundef %156, i32 noundef %158, i32 noundef %160)
  br label %168

161:                                              ; preds = %143
  %162 = load ptr, ptr %3, align 8
  %163 = load ptr, ptr %3, align 8
  %164 = getelementptr inbounds %struct.png_struct_def, ptr %163, i32 0, i32 87
  %165 = load i8, ptr %10, align 1
  %166 = zext i8 %165 to i32
  %167 = load i32, ptr %7, align 4
  call void @png_build_16bit_table(ptr noundef %162, ptr noundef %164, i32 noundef %166, i32 noundef %167)
  br label %168

168:                                              ; preds = %161, %153
  %169 = load ptr, ptr %3, align 8
  %170 = getelementptr inbounds %struct.png_struct_def, ptr %169, i32 0, i32 17
  %171 = load i32, ptr %170, align 4
  %172 = and i32 %171, 6291584
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %174, label %187

174:                                              ; preds = %168
  %175 = load ptr, ptr %3, align 8
  %176 = load ptr, ptr %3, align 8
  %177 = getelementptr inbounds %struct.png_struct_def, ptr %176, i32 0, i32 91
  %178 = load i8, ptr %10, align 1
  %179 = zext i8 %178 to i32
  %180 = load i32, ptr %8, align 4
  call void @png_build_16bit_table(ptr noundef %175, ptr noundef %177, i32 noundef %179, i32 noundef %180)
  %181 = load ptr, ptr %3, align 8
  %182 = load ptr, ptr %3, align 8
  %183 = getelementptr inbounds %struct.png_struct_def, ptr %182, i32 0, i32 90
  %184 = load i8, ptr %10, align 1
  %185 = zext i8 %184 to i32
  %186 = load i32, ptr %9, align 4
  call void @png_build_16bit_table(ptr noundef %181, ptr noundef %183, i32 noundef %185, i32 noundef %186)
  br label %187

187:                                              ; preds = %174, %168
  br label %188

188:                                              ; preds = %187, %65
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_build_8bit_table(ptr noalias noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = call noalias ptr @png_malloc(ptr noundef %9, i64 noundef 256)
  %11 = load ptr, ptr %5, align 8
  store ptr %10, ptr %11, align 8
  store ptr %10, ptr %8, align 8
  %12 = load i32, ptr %6, align 4
  %13 = call i32 @png_gamma_significant(i32 noundef %12)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %31

15:                                               ; preds = %3
  store i32 0, ptr %7, align 4
  br label %16

16:                                               ; preds = %27, %15
  %17 = load i32, ptr %7, align 4
  %18 = icmp ult i32 %17, 256
  br i1 %18, label %19, label %30

19:                                               ; preds = %16
  %20 = load i32, ptr %7, align 4
  %21 = load i32, ptr %6, align 4
  %22 = call zeroext i8 @png_gamma_8bit_correct(i32 noundef %20, i32 noundef %21)
  %23 = load ptr, ptr %8, align 8
  %24 = load i32, ptr %7, align 4
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds i8, ptr %23, i64 %25
  store i8 %22, ptr %26, align 1
  br label %27

27:                                               ; preds = %19
  %28 = load i32, ptr %7, align 4
  %29 = add i32 %28, 1
  store i32 %29, ptr %7, align 4
  br label %16, !llvm.loop !33

30:                                               ; preds = %16
  br label %47

31:                                               ; preds = %3
  store i32 0, ptr %7, align 4
  br label %32

32:                                               ; preds = %43, %31
  %33 = load i32, ptr %7, align 4
  %34 = icmp ult i32 %33, 256
  br i1 %34, label %35, label %46

35:                                               ; preds = %32
  %36 = load i32, ptr %7, align 4
  %37 = and i32 %36, 255
  %38 = trunc i32 %37 to i8
  %39 = load ptr, ptr %8, align 8
  %40 = load i32, ptr %7, align 4
  %41 = zext i32 %40 to i64
  %42 = getelementptr inbounds i8, ptr %39, i64 %41
  store i8 %38, ptr %42, align 1
  br label %43

43:                                               ; preds = %35
  %44 = load i32, ptr %7, align 4
  %45 = add i32 %44, 1
  store i32 %45, ptr %7, align 4
  br label %32, !llvm.loop !34

46:                                               ; preds = %32
  br label %47

47:                                               ; preds = %46, %30
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_build_16to8_table(ptr noalias noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i16, align 2
  %15 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %16 = load i32, ptr %7, align 4
  %17 = sub i32 8, %16
  %18 = shl i32 1, %17
  store i32 %18, ptr %9, align 4
  %19 = load i32, ptr %7, align 4
  %20 = sub i32 16, %19
  %21 = shl i32 1, %20
  %22 = sub i32 %21, 1
  store i32 %22, ptr %10, align 4
  %23 = load ptr, ptr %5, align 8
  %24 = load i32, ptr %9, align 4
  %25 = zext i32 %24 to i64
  %26 = mul i64 %25, 8
  %27 = call noalias ptr @png_calloc(ptr noundef %23, i64 noundef %26)
  %28 = load ptr, ptr %6, align 8
  store ptr %27, ptr %28, align 8
  store ptr %27, ptr %13, align 8
  store i32 0, ptr %11, align 4
  br label %29

29:                                               ; preds = %40, %4
  %30 = load i32, ptr %11, align 4
  %31 = load i32, ptr %9, align 4
  %32 = icmp ult i32 %30, %31
  br i1 %32, label %33, label %43

33:                                               ; preds = %29
  %34 = load ptr, ptr %5, align 8
  %35 = call noalias ptr @png_malloc(ptr noundef %34, i64 noundef 512)
  %36 = load ptr, ptr %13, align 8
  %37 = load i32, ptr %11, align 4
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds ptr, ptr %36, i64 %38
  store ptr %35, ptr %39, align 8
  br label %40

40:                                               ; preds = %33
  %41 = load i32, ptr %11, align 4
  %42 = add i32 %41, 1
  store i32 %42, ptr %11, align 4
  br label %29, !llvm.loop !35

43:                                               ; preds = %29
  store i32 0, ptr %12, align 4
  store i32 0, ptr %11, align 4
  br label %44

44:                                               ; preds = %86, %43
  %45 = load i32, ptr %11, align 4
  %46 = icmp ult i32 %45, 255
  br i1 %46, label %47, label %89

47:                                               ; preds = %44
  %48 = load i32, ptr %11, align 4
  %49 = mul i32 %48, 257
  %50 = trunc i32 %49 to i16
  store i16 %50, ptr %14, align 2
  %51 = load i16, ptr %14, align 2
  %52 = zext i16 %51 to i32
  %53 = add i32 %52, 128
  %54 = load i32, ptr %8, align 4
  %55 = call zeroext i16 @png_gamma_16bit_correct(i32 noundef %53, i32 noundef %54)
  %56 = zext i16 %55 to i32
  store i32 %56, ptr %15, align 4
  %57 = load i32, ptr %15, align 4
  %58 = load i32, ptr %10, align 4
  %59 = mul i32 %57, %58
  %60 = add i32 %59, 32768
  %61 = udiv i32 %60, 65535
  %62 = add i32 %61, 1
  store i32 %62, ptr %15, align 4
  br label %63

63:                                               ; preds = %67, %47
  %64 = load i32, ptr %12, align 4
  %65 = load i32, ptr %15, align 4
  %66 = icmp ult i32 %64, %65
  br i1 %66, label %67, label %85

67:                                               ; preds = %63
  %68 = load i16, ptr %14, align 2
  %69 = load ptr, ptr %13, align 8
  %70 = load i32, ptr %12, align 4
  %71 = load i32, ptr %7, align 4
  %72 = lshr i32 255, %71
  %73 = and i32 %70, %72
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds ptr, ptr %69, i64 %74
  %76 = load ptr, ptr %75, align 8
  %77 = load i32, ptr %12, align 4
  %78 = load i32, ptr %7, align 4
  %79 = sub i32 8, %78
  %80 = lshr i32 %77, %79
  %81 = zext i32 %80 to i64
  %82 = getelementptr inbounds i16, ptr %76, i64 %81
  store i16 %68, ptr %82, align 2
  %83 = load i32, ptr %12, align 4
  %84 = add i32 %83, 1
  store i32 %84, ptr %12, align 4
  br label %63, !llvm.loop !36

85:                                               ; preds = %63
  br label %86

86:                                               ; preds = %85
  %87 = load i32, ptr %11, align 4
  %88 = add i32 %87, 1
  store i32 %88, ptr %11, align 4
  br label %44, !llvm.loop !37

89:                                               ; preds = %44
  br label %90

90:                                               ; preds = %95, %89
  %91 = load i32, ptr %12, align 4
  %92 = load i32, ptr %9, align 4
  %93 = shl i32 %92, 8
  %94 = icmp ult i32 %91, %93
  br i1 %94, label %95, label %112

95:                                               ; preds = %90
  %96 = load ptr, ptr %13, align 8
  %97 = load i32, ptr %12, align 4
  %98 = load i32, ptr %7, align 4
  %99 = ashr i32 255, %98
  %100 = and i32 %97, %99
  %101 = zext i32 %100 to i64
  %102 = getelementptr inbounds ptr, ptr %96, i64 %101
  %103 = load ptr, ptr %102, align 8
  %104 = load i32, ptr %12, align 4
  %105 = load i32, ptr %7, align 4
  %106 = sub i32 8, %105
  %107 = lshr i32 %104, %106
  %108 = zext i32 %107 to i64
  %109 = getelementptr inbounds i16, ptr %103, i64 %108
  store i16 -1, ptr %109, align 2
  %110 = load i32, ptr %12, align 4
  %111 = add i32 %110, 1
  store i32 %111, ptr %12, align 4
  br label %90, !llvm.loop !38

112:                                              ; preds = %90
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_build_16bit_table(ptr noalias noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca double, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %21 = load i32, ptr %7, align 4
  %22 = sub i32 8, %21
  %23 = shl i32 1, %22
  store i32 %23, ptr %9, align 4
  %24 = load i32, ptr %7, align 4
  %25 = sub i32 16, %24
  %26 = shl i32 1, %25
  %27 = sub nsw i32 %26, 1
  %28 = sitofp i32 %27 to double
  %29 = fdiv double 1.000000e+00, %28
  store double %29, ptr %10, align 8
  %30 = load i32, ptr %7, align 4
  %31 = sub i32 16, %30
  %32 = shl i32 1, %31
  %33 = sub i32 %32, 1
  store i32 %33, ptr %11, align 4
  %34 = load i32, ptr %7, align 4
  %35 = sub i32 15, %34
  %36 = shl i32 1, %35
  store i32 %36, ptr %12, align 4
  %37 = load ptr, ptr %5, align 8
  %38 = load i32, ptr %9, align 4
  %39 = zext i32 %38 to i64
  %40 = mul i64 %39, 8
  %41 = call noalias ptr @png_calloc(ptr noundef %37, i64 noundef %40)
  %42 = load ptr, ptr %6, align 8
  store ptr %41, ptr %42, align 8
  store ptr %41, ptr %14, align 8
  store i32 0, ptr %13, align 4
  br label %43

43:                                               ; preds = %120, %4
  %44 = load i32, ptr %13, align 4
  %45 = load i32, ptr %9, align 4
  %46 = icmp ult i32 %44, %45
  br i1 %46, label %47, label %123

47:                                               ; preds = %43
  %48 = load ptr, ptr %5, align 8
  %49 = call noalias ptr @png_malloc(ptr noundef %48, i64 noundef 512)
  %50 = load ptr, ptr %14, align 8
  %51 = load i32, ptr %13, align 4
  %52 = zext i32 %51 to i64
  %53 = getelementptr inbounds ptr, ptr %50, i64 %52
  store ptr %49, ptr %53, align 8
  store ptr %49, ptr %15, align 8
  %54 = load i32, ptr %8, align 4
  %55 = call i32 @png_gamma_significant(i32 noundef %54)
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %88

57:                                               ; preds = %47
  store i32 0, ptr %16, align 4
  br label %58

58:                                               ; preds = %84, %57
  %59 = load i32, ptr %16, align 4
  %60 = icmp ult i32 %59, 256
  br i1 %60, label %61, label %87

61:                                               ; preds = %58
  %62 = load i32, ptr %16, align 4
  %63 = load i32, ptr %7, align 4
  %64 = sub i32 8, %63
  %65 = shl i32 %62, %64
  %66 = load i32, ptr %13, align 4
  %67 = add i32 %65, %66
  store i32 %67, ptr %17, align 4
  %68 = load i32, ptr %17, align 4
  %69 = uitofp i32 %68 to double
  %70 = load double, ptr %10, align 8
  %71 = fmul double %69, %70
  %72 = load i32, ptr %8, align 4
  %73 = sitofp i32 %72 to double
  %74 = fmul double %73, 1.000000e-05
  %75 = call double @pow(double noundef %71, double noundef %74) #13
  %76 = call double @llvm.fmuladd.f64(double 6.553500e+04, double %75, double 5.000000e-01)
  %77 = call double @llvm.floor.f64(double %76)
  store double %77, ptr %18, align 8
  %78 = load double, ptr %18, align 8
  %79 = fptoui double %78 to i16
  %80 = load ptr, ptr %15, align 8
  %81 = load i32, ptr %16, align 4
  %82 = zext i32 %81 to i64
  %83 = getelementptr inbounds i16, ptr %80, i64 %82
  store i16 %79, ptr %83, align 2
  br label %84

84:                                               ; preds = %61
  %85 = load i32, ptr %16, align 4
  %86 = add i32 %85, 1
  store i32 %86, ptr %16, align 4
  br label %58, !llvm.loop !39

87:                                               ; preds = %58
  br label %119

88:                                               ; preds = %47
  store i32 0, ptr %19, align 4
  br label %89

89:                                               ; preds = %115, %88
  %90 = load i32, ptr %19, align 4
  %91 = icmp ult i32 %90, 256
  br i1 %91, label %92, label %118

92:                                               ; preds = %89
  %93 = load i32, ptr %19, align 4
  %94 = load i32, ptr %7, align 4
  %95 = sub i32 8, %94
  %96 = shl i32 %93, %95
  %97 = load i32, ptr %13, align 4
  %98 = add i32 %96, %97
  store i32 %98, ptr %20, align 4
  %99 = load i32, ptr %7, align 4
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %101, label %108

101:                                              ; preds = %92
  %102 = load i32, ptr %20, align 4
  %103 = mul i32 %102, 65535
  %104 = load i32, ptr %12, align 4
  %105 = add i32 %103, %104
  %106 = load i32, ptr %11, align 4
  %107 = udiv i32 %105, %106
  store i32 %107, ptr %20, align 4
  br label %108

108:                                              ; preds = %101, %92
  %109 = load i32, ptr %20, align 4
  %110 = trunc i32 %109 to i16
  %111 = load ptr, ptr %15, align 8
  %112 = load i32, ptr %19, align 4
  %113 = zext i32 %112 to i64
  %114 = getelementptr inbounds i16, ptr %111, i64 %113
  store i16 %110, ptr %114, align 2
  br label %115

115:                                              ; preds = %108
  %116 = load i32, ptr %19, align 4
  %117 = add i32 %116, 1
  store i32 %117, ptr %19, align 4
  br label %89, !llvm.loop !40

118:                                              ; preds = %89
  br label %119

119:                                              ; preds = %118, %87
  br label %120

120:                                              ; preds = %119
  %121 = load i32, ptr %13, align 4
  %122 = add i32 %121, 1
  store i32 %122, ptr %13, align 4
  br label %43, !llvm.loop !41

123:                                              ; preds = %43
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_set_option(ptr noalias noundef %0, i32 noundef %1, i32 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %48

13:                                               ; preds = %3
  %14 = load i32, ptr %6, align 4
  %15 = icmp sge i32 %14, 0
  br i1 %15, label %16, label %48

16:                                               ; preds = %13
  %17 = load i32, ptr %6, align 4
  %18 = icmp slt i32 %17, 14
  br i1 %18, label %19, label %48

19:                                               ; preds = %16
  %20 = load i32, ptr %6, align 4
  %21 = and i32 %20, 1
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %48

23:                                               ; preds = %19
  %24 = load i32, ptr %6, align 4
  %25 = shl i32 3, %24
  store i32 %25, ptr %8, align 4
  %26 = load i32, ptr %7, align 4
  %27 = icmp ne i32 %26, 0
  %28 = zext i1 %27 to i32
  %29 = add i32 2, %28
  %30 = load i32, ptr %6, align 4
  %31 = shl i32 %29, %30
  store i32 %31, ptr %9, align 4
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds %struct.png_struct_def, ptr %32, i32 0, i32 115
  %34 = load i32, ptr %33, align 8
  store i32 %34, ptr %10, align 4
  %35 = load i32, ptr %10, align 4
  %36 = load i32, ptr %8, align 4
  %37 = xor i32 %36, -1
  %38 = and i32 %35, %37
  %39 = load i32, ptr %9, align 4
  %40 = or i32 %38, %39
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds %struct.png_struct_def, ptr %41, i32 0, i32 115
  store i32 %40, ptr %42, align 8
  %43 = load i32, ptr %10, align 4
  %44 = load i32, ptr %8, align 4
  %45 = and i32 %43, %44
  %46 = load i32, ptr %6, align 4
  %47 = ashr i32 %45, %46
  store i32 %47, ptr %4, align 4
  br label %49

48:                                               ; preds = %19, %16, %13, %3
  store i32 1, ptr %4, align 4
  br label %49

49:                                               ; preds = %48, %23
  %50 = load i32, ptr %4, align 4
  ret i32 %50
}

; Function Attrs: noinline nounwind sspstrong uwtable
define void @png_image_free(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %22

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds %struct.png_image, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %22

10:                                               ; preds = %5
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds %struct.png_image, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = getelementptr inbounds %struct.png_control, ptr %13, i32 0, i32 2
  %15 = load ptr, ptr %14, align 8
  %16 = icmp eq ptr %15, null
  br i1 %16, label %17, label %22

17:                                               ; preds = %10
  %18 = load ptr, ptr %2, align 8
  %19 = call i32 @png_image_free_function(ptr noundef %18)
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds %struct.png_image, ptr %20, i32 0, i32 0
  store ptr null, ptr %21, align 8
  br label %22

22:                                               ; preds = %17, %10, %5, %1
  ret void
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_image_free_function(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca %struct.png_control, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  store ptr %8, ptr %4, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %struct.png_image, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %5, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %struct.png_control, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = icmp eq ptr %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %1
  store i32 0, ptr %2, align 4
  br label %65

17:                                               ; preds = %1
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds %struct.png_control, ptr %18, i32 0, i32 5
  %20 = load i8, ptr %19, align 8
  %21 = lshr i8 %20, 1
  %22 = and i8 %21, 1
  %23 = zext i8 %22 to i32
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %46

25:                                               ; preds = %17
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds %struct.png_control, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = getelementptr inbounds %struct.png_struct_def, ptr %28, i32 0, i32 9
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %7, align 8
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds %struct.png_control, ptr %31, i32 0, i32 5
  %33 = load i8, ptr %32, align 8
  %34 = and i8 %33, -3
  %35 = or i8 %34, 0
  store i8 %35, ptr %32, align 8
  %36 = load ptr, ptr %7, align 8
  %37 = icmp ne ptr %36, null
  br i1 %37, label %38, label %45

38:                                               ; preds = %25
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds %struct.png_control, ptr %39, i32 0, i32 0
  %41 = load ptr, ptr %40, align 8
  %42 = getelementptr inbounds %struct.png_struct_def, ptr %41, i32 0, i32 9
  store ptr null, ptr %42, align 8
  %43 = load ptr, ptr %7, align 8
  %44 = call i32 @fclose(ptr noundef %43)
  br label %45

45:                                               ; preds = %38, %25
  br label %46

46:                                               ; preds = %45, %17
  %47 = load ptr, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %6, ptr align 8 %47, i64 48, i1 false)
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds %struct.png_image, ptr %48, i32 0, i32 0
  store ptr %6, ptr %49, align 8
  %50 = getelementptr inbounds %struct.png_control, ptr %6, i32 0, i32 0
  %51 = load ptr, ptr %50, align 8
  %52 = load ptr, ptr %5, align 8
  call void @png_free(ptr noundef %51, ptr noundef %52)
  %53 = getelementptr inbounds %struct.png_control, ptr %6, i32 0, i32 5
  %54 = load i8, ptr %53, align 8
  %55 = and i8 %54, 1
  %56 = zext i8 %55 to i32
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %61

58:                                               ; preds = %46
  %59 = getelementptr inbounds %struct.png_control, ptr %6, i32 0, i32 0
  %60 = getelementptr inbounds %struct.png_control, ptr %6, i32 0, i32 1
  call void @png_destroy_write_struct(ptr noundef %59, ptr noundef %60)
  br label %64

61:                                               ; preds = %46
  %62 = getelementptr inbounds %struct.png_control, ptr %6, i32 0, i32 0
  %63 = getelementptr inbounds %struct.png_control, ptr %6, i32 0, i32 1
  call void @png_destroy_read_struct(ptr noundef %62, ptr noundef %63, ptr noundef null)
  br label %64

64:                                               ; preds = %61, %58
  store i32 1, ptr %2, align 4
  br label %65

65:                                               ; preds = %64, %16
  %66 = load i32, ptr %2, align 4
  ret i32 %66
}

; Function Attrs: noinline nounwind sspstrong uwtable
define i32 @png_image_error(ptr noundef %0, ptr noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %struct.png_image, ptr %5, i32 0, i32 8
  %7 = getelementptr inbounds [64 x i8], ptr %6, i64 0, i64 0
  %8 = load ptr, ptr %4, align 8
  %9 = call i64 @png_safecat(ptr noundef %7, i64 noundef 64, i64 noundef 0, ptr noundef %8)
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds %struct.png_image, ptr %10, i32 0, i32 7
  %12 = load i32, ptr %11, align 8
  %13 = or i32 %12, 2
  store i32 %13, ptr %11, align 8
  %14 = load ptr, ptr %3, align 8
  call void @png_image_free(ptr noundef %14)
  ret i32 0
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @png_fp_add(i32 noundef %0, i32 noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store i32 %0, ptr %5, align 4
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  %8 = load i32, ptr %5, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %20

10:                                               ; preds = %3
  %11 = load i32, ptr %5, align 4
  %12 = sub nsw i32 2147483647, %11
  %13 = load i32, ptr %6, align 4
  %14 = icmp sge i32 %12, %13
  br i1 %14, label %15, label %19

15:                                               ; preds = %10
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %6, align 4
  %18 = add nsw i32 %16, %17
  store i32 %18, ptr %4, align 4
  br label %38

19:                                               ; preds = %10
  br label %36

20:                                               ; preds = %3
  %21 = load i32, ptr %5, align 4
  %22 = icmp slt i32 %21, 0
  br i1 %22, label %23, label %33

23:                                               ; preds = %20
  %24 = load i32, ptr %5, align 4
  %25 = sub nsw i32 -2147483647, %24
  %26 = load i32, ptr %6, align 4
  %27 = icmp sle i32 %25, %26
  br i1 %27, label %28, label %32

28:                                               ; preds = %23
  %29 = load i32, ptr %5, align 4
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %29, %30
  store i32 %31, ptr %4, align 4
  br label %38

32:                                               ; preds = %23
  br label %35

33:                                               ; preds = %20
  %34 = load i32, ptr %6, align 4
  store i32 %34, ptr %4, align 4
  br label %38

35:                                               ; preds = %32
  br label %36

36:                                               ; preds = %35, %19
  %37 = load ptr, ptr %7, align 8
  store i32 1, ptr %37, align 4
  store i32 50000, ptr %4, align 4
  br label %38

38:                                               ; preds = %36, %33, %28, %15
  %39 = load i32, ptr %4, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @is_ICC_signature(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
  %3 = load i64, ptr %2, align 8
  %4 = lshr i64 %3, 24
  %5 = call i32 @is_ICC_signature_char(i64 noundef %4)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %24

7:                                                ; preds = %1
  %8 = load i64, ptr %2, align 8
  %9 = lshr i64 %8, 16
  %10 = and i64 %9, 255
  %11 = call i32 @is_ICC_signature_char(i64 noundef %10)
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %24

13:                                               ; preds = %7
  %14 = load i64, ptr %2, align 8
  %15 = lshr i64 %14, 8
  %16 = and i64 %15, 255
  %17 = call i32 @is_ICC_signature_char(i64 noundef %16)
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %24

19:                                               ; preds = %13
  %20 = load i64, ptr %2, align 8
  %21 = and i64 %20, 255
  %22 = call i32 @is_ICC_signature_char(i64 noundef %21)
  %23 = icmp ne i32 %22, 0
  br label %24

24:                                               ; preds = %19, %13, %7, %1
  %25 = phi i1 [ false, %13 ], [ false, %7 ], [ false, %1 ], [ %23, %19 ]
  %26 = zext i1 %25 to i32
  ret i32 %26
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @png_icc_tag_name(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds i8, ptr %5, i64 0
  store i8 39, ptr %6, align 1
  %7 = load i32, ptr %4, align 4
  %8 = lshr i32 %7, 24
  %9 = call signext i8 @png_icc_tag_char(i32 noundef %8)
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds i8, ptr %10, i64 1
  store i8 %9, ptr %11, align 1
  %12 = load i32, ptr %4, align 4
  %13 = lshr i32 %12, 16
  %14 = call signext i8 @png_icc_tag_char(i32 noundef %13)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds i8, ptr %15, i64 2
  store i8 %14, ptr %16, align 1
  %17 = load i32, ptr %4, align 4
  %18 = lshr i32 %17, 8
  %19 = call signext i8 @png_icc_tag_char(i32 noundef %18)
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds i8, ptr %20, i64 3
  store i8 %19, ptr %21, align 1
  %22 = load i32, ptr %4, align 4
  %23 = call signext i8 @png_icc_tag_char(i32 noundef %22)
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds i8, ptr %24, i64 4
  store i8 %23, ptr %25, align 1
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds i8, ptr %26, i64 5
  store i8 39, ptr %27, align 1
  ret void
}

declare void @png_chunk_benign_error(ptr noundef, ptr noundef) #3

; Function Attrs: noinline nounwind sspstrong uwtable
define internal i32 @is_ICC_signature_char(i64 noundef %0) #0 {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
  %3 = load i64, ptr %2, align 8
  %4 = icmp eq i64 %3, 32
  br i1 %4, label %25, label %5

5:                                                ; preds = %1
  %6 = load i64, ptr %2, align 8
  %7 = icmp uge i64 %6, 48
  br i1 %7, label %8, label %11

8:                                                ; preds = %5
  %9 = load i64, ptr %2, align 8
  %10 = icmp ule i64 %9, 57
  br i1 %10, label %25, label %11

11:                                               ; preds = %8, %5
  %12 = load i64, ptr %2, align 8
  %13 = icmp uge i64 %12, 65
  br i1 %13, label %14, label %17

14:                                               ; preds = %11
  %15 = load i64, ptr %2, align 8
  %16 = icmp ule i64 %15, 90
  br i1 %16, label %25, label %17

17:                                               ; preds = %14, %11
  %18 = load i64, ptr %2, align 8
  %19 = icmp uge i64 %18, 97
  br i1 %19, label %20, label %23

20:                                               ; preds = %17
  %21 = load i64, ptr %2, align 8
  %22 = icmp ule i64 %21, 122
  br label %23

23:                                               ; preds = %20, %17
  %24 = phi i1 [ false, %17 ], [ %22, %20 ]
  br label %25

25:                                               ; preds = %23, %14, %8, %1
  %26 = phi i1 [ true, %14 ], [ true, %8 ], [ true, %1 ], [ %24, %23 ]
  %27 = zext i1 %26 to i32
  ret i32 %27
}

; Function Attrs: noinline nounwind sspstrong uwtable
define internal signext i8 @png_icc_tag_char(i32 noundef %0) #0 {
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  %4 = load i32, ptr %3, align 4
  %5 = and i32 %4, 255
  store i32 %5, ptr %3, align 4
  %6 = load i32, ptr %3, align 4
  %7 = icmp uge i32 %6, 32
  br i1 %7, label %8, label %14

8:                                                ; preds = %1
  %9 = load i32, ptr %3, align 4
  %10 = icmp ule i32 %9, 126
  br i1 %10, label %11, label %14

11:                                               ; preds = %8
  %12 = load i32, ptr %3, align 4
  %13 = trunc i32 %12 to i8
  store i8 %13, ptr %2, align 1
  br label %15

14:                                               ; preds = %8, %1
  store i8 63, ptr %2, align 1
  br label %15

15:                                               ; preds = %14, %11
  %16 = load i8, ptr %2, align 1
  ret i8 %16
}

declare noalias ptr @png_malloc(ptr noundef, i64 noundef) #3

declare noalias ptr @png_calloc(ptr noundef, i64 noundef) #3

declare i32 @fclose(ptr noundef) #3

declare void @png_destroy_write_struct(ptr noundef, ptr noundef) #3

declare void @png_destroy_read_struct(ptr noundef, ptr noundef, ptr noundef) #3

attributes #0 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind returns_twice "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #8 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { noreturn }
attributes #11 = { nounwind willreturn memory(read) }
attributes #12 = { nounwind returns_twice }
attributes #13 = { nounwind }

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
