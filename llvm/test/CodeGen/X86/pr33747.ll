; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-linux-gnu | FileCheck %s

define void @PR33747(i32* nocapture) {
; CHECK-LABEL: PR33747:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl 24(%rdi), %eax
; CHECK-NEXT:    leal 1(%rax), %ecx
; CHECK-NEXT:    cmpl $3, %ecx
; CHECK-NEXT:    setb %cl
; CHECK-NEXT:    testl %eax, %eax
; CHECK-NEXT:    setne %al
; CHECK-NEXT:    testb %cl, %al
; CHECK-NEXT:    je .LBB0_2
; CHECK-NEXT:    .p2align 4, 0x90
; CHECK-NEXT:  .LBB0_1: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    jmp .LBB0_1
; CHECK-NEXT:    .p2align 4, 0x90
; CHECK-NEXT:  .LBB0_2: # =>This Inner Loop Header: Depth=1
; CHECK-NEXT:    jmp .LBB0_2
  %2 = getelementptr inbounds i32, ptr %0, i64 6
  %3 = load i32, ptr %2, align 4
  %4 = add i32 %3, 1
  %5 = icmp ult i32 %4, 3
  %6 = icmp ne i32 %3, 0
  %7 = and i1 %6, %5
  br i1 %7, label %8, label %9
  br label %8
  br label %9
}
