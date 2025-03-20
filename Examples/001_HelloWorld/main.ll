source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [44 x i8] c"The sum of the squares of %d and %d is %d.\0A\00", align 1

define dso_local i32 @multiply(i32 %0, i32 %1) #0
{
    %3 = alloca i32, align 4
    %4 = alloca i32, align 4
    store i32 %0, i32* %3, align 4
    store i32 %1, i32* %4, align 4
    %5 = load i32, i32* %3, align 4
    %6 = load i32, i32* %4, align 4
    %7 = mul nsw i32 %5, %6
    ret i32 %7
}

define dso_local i32 @add(i32 %0, i32 %1) #0
{
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = add nsw i32 %5, %6
  ret i32 %7
}

define dso_local i32 @square(i32 noundef %0) #0
{
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr %2, align 4
  %4 = load i32, ptr %2, align 4
  %5 = call i32 @multiply(i32 noundef %3, i32 noundef %4) #0
  ret i32 %5
}

define dso_local i32 @pythagorean(i32 noundef %0, i32 noundef %1) #0
{
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = call i32 @square(i32 noundef %5)
  %7 = load i32, ptr %4, align 4
  %8 = call i32 @square(i32 noundef %7)
  %9 = call i32 @add(i32 noundef %6, i32 noundef %8)
  ret i32 %9
}

define dso_local i32 @main() #0 
{
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4

  store i32 0, ptr %1, align 4
  %5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2)
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %3)
  
  %7 = load i32, ptr %2, align 4
  %8 = load i32, ptr %3, align 4
  %9 = call i32 @pythagorean(i32 noundef %7, i32 noundef %8)
  store i32 %9, ptr %4, align 4
  
  %10 = load i32, ptr %2, align 4
  %11 = load i32, ptr %3, align 4
  %12 = load i32, ptr %4, align 4
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, i32 noundef %10, i32 noundef %11, i32 noundef %12)

  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1
declare i32 @printf(ptr noundef, ...) #1

; attributes #0 = { noinline nounwind optnone sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #0 = { noinline nounwind optnone }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 19.1.7"}
