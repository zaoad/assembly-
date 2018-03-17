segment .data
mul: dq "The String is:",0
fmt: dq "%s %s ",10,0
fmt_in: dq "%lld", 0

section .bss
str: resq 20
a: resq 1
b: resq 1
cnt: resq 1
segment .text
global main
extern printf
extern scanf

main:
push RBP
mov rbx, [b]
mov rdx,0
loop:
	push rdx
	cmp rdx,5
	jge init
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, a
	call scanf
	pop rdx
	add rdx , 1
	mov rcx,[a]
	mov [str+rdx*8],rcx
	jmp loop
init:
	mov rdx , 0
	mov rbx, [b]
	mov rax ,0 
	mov rcx,0
print:
	mov [cnt] , rcx
	cmp rcx,5
	jge Last
	mov rbx, [str+rdx*8]
	mov RAX , 0
	mov RDI, fmt_in
	mov RSI, rbx
	call printf
	mov rcx, [cnt]
	add rdx, 1
	jmp print

Last:
mov RAX, 0
pop RBP
ret

