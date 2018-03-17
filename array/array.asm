segment .data
mul: dw "The String is:",0
fmt: dq "%s %s ",10,0
fmt_in: dq "%d", 0

section .bss
str: resb 20
db a

segment .text
global main
extern printf
extern scanf

main:
push RBP
mov RAX, 0
mov RDI, fmt_in
mov RSI, b
call scanf
mov rbx, [b]
mov rdx,0
loop:
	cmp rdx,rbx
	jz init
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, str+rdx
	call scanf
	inc rdx
	jmp loop
init:
	mov rdx , 0
print:
	cmp rdx,rbx
	jz init
	mov RAX , 0
	mov RDI, fmt_in
	mov RSI, [str+rdx]
	call printf
	inc rdx
	jmp print

mov RAX, 0
pop RBP
ret

