segment .data
a: dq 2
b: dq 0
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
	cmp RCX, 5
	jz init
	push RCX
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, a
	call scanf
	mov RAX, [a]
	pop rcx
	mov [array+RCX*8], RAX
	add RBX, [a]	
	inc RCX	
	jmp INPUT
init:
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, a
	call scanf
	mov RAX, 0
	mov RCX, 0
	mov RDI, fmt_out
	mov RSI, RBX
	call printf
	mov RAX, 0
	mov RCX, 0
	mov RBX, 0	
	mov rcx, [a]
	mov RAX, [array+RCX*8]
	mov [cnt], RCX
	mov RDI, fmt
	mov RSI, RAX
	call printf

END:
	mov RAX, 0
	pop RBP
ret
