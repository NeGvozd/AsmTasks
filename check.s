	.file	"check.c"
	.text
	.type	is_balance, @function
is_balance:
.LFB33:
	.cfi_startproc
	movl	$0, %eax
	jmp	.L2
.L3:
	subl	$97, %edx
	cmpb	$25, %dl
	ja	.L4
	subl	$1, %eax
.L4:
	addq	$1, %rdi
.L2:
	movzbl	(%rdi), %edx
	testb	%dl, %dl
	je	.L6
	leal	-65(%rdx), %ecx
	cmpb	$25, %cl
	ja	.L3
	addl	$1, %eax
	jmp	.L4
.L6:
	rep ret
	.cfi_endproc
.LFE33:
	.size	is_balance, .-is_balance
	.globl	str_len
	.type	str_len, @function
str_len:
.LFB30:
	.cfi_startproc
	movl	$0, %eax
	jmp	.L8
.L9:
	addl	$1, %eax
	addq	$1, %rdi
.L8:
	cmpb	$0, (%rdi)
	jne	.L9
	rep ret
	.cfi_endproc
.LFE30:
	.size	str_len, .-str_len
	.globl	delNew
	.type	delNew, @function
delNew:
.LFB31:
	.cfi_startproc
	leaq	1(%rdi), %rdx
	movq	%rdx, %rax
	jmp	.L11
.L12:
	addq	$1, %rax
.L11:
	cmpb	$0, -1(%rdx)
	je	.L14
	cmpq	%rdi, %rax
	je	.L12
	movzbl	(%rax), %ecx
	movb	%cl, (%rdx)
	leaq	1(%rdx), %rdx
	jmp	.L12
.L14:
	rep ret
	.cfi_endproc
.LFE31:
	.size	delNew, .-delNew
	.globl	delete_char
	.type	delete_char, @function
delete_char:
.LFB32:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbp
	movl	%esi, %ebx
	jmp	.L16
.L17:
	movslq	%ebx, %rax
	movzbl	1(%rbp,%rax), %edx
	movb	%dl, 0(%rbp,%rax)
	addl	$1, %ebx
.L16:
	movq	%rbp, %rdi
	call	str_len
	cmpl	%ebx, %eax
	jg	.L17
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE32:
	.size	delete_char, .-delete_char
	.globl	line_changing
	.type	line_changing, @function
line_changing:
.LFB34:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	str_len
	movl	$0, %ecx
	jmp	.L20
.L21:
	addl	$1, %ecx
.L20:
	cmpl	%eax, %ecx
	jge	.L24
	movslq	%ecx, %rdx
	addq	%rbx, %rdx
	movzbl	(%rdx), %esi
	leal	-90(%rsi), %edi
	cmpb	$32, %dil
	ja	.L21
	subl	$32, %esi
	movb	%sil, (%rdx)
	jmp	.L21
.L24:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE34:
	.size	line_changing, .-line_changing
	.globl	check_property
	.type	check_property, @function
check_property:
.LFB35:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	call	is_balance
	testl	%eax, %eax
	je	.L28
.L26:
	movzbl	(%rbx), %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L28:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	line_changing
	jmp	.L26
	.cfi_endproc
.LFE35:
	.size	check_property, .-check_property
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
