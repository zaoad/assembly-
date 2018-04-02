segment .data
a: dq 2
b: dq 1
cnt: dq 0
fmt: dq "%lld ",10,0
fmt_in: dq "%lld", 0
fmt_out: dq "THE SUM IS: %lld", 10, 0

segment .bss
array resq 21

segment .text
global main
extern printf
extern scanf

main:
push RBP


mov RAX, 0
mov RCX, 0
mov RBX, 0

INPUT: 
	cmp RCX, 10
	jz init
	push RCX
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, a
	call scanf
	mov RAX, [a]
	pop rcx
	mov [array+RCX*8], RAX
	inc RCX	
	jmp INPUT
init:
	mov RAX ,0
	mov rdi, fmt_in
	mov rsi ,a
	call scanf
	mov rbx, [a]
	mov rax, [array+rbx*8]
	mov rdi, fmt_in
	mov rsi , rax
	call printf 
END:
	mov RAX, 0
	pop RBP
ret
