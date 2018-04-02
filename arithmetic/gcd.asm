segment .data
div: dw "Quotient:",0
fmt: dq "%lld",10,0
scn: dq "%d %d"
segment .bss
a: resq 1
b: resq 1

segment .text
global main
extern printf
extern scanf

main:
push RBP
mov rdi, scn
mov rsi, a
mov rdx,b
mov rax ,0
call scanf
mov RAX , 0
mov RBX , 0
mov RDX, 0
mov RAX , [a]
mov RBX , [b]
jmp while

while:
	mov rdx,0
	div RBX
	add rdx ,0 
	jz print
	mov rax,rbx
	mov rbx, rdx
	jmp while
print:
	mov RDI, fmt
	mov RSI, rbx
	mov RAX , 0
	call printf

mov RAX, 0
pop RBP
ret

;nasm -f elf64 division.asm && gcc division.o -o division && ./division
