segment .data 
fmt: db "%d",0
fmt2: dq "%d is prime",10,0
fmt3: dq "%d is not prime",10,0

segment .bss
a: resq 1
b: resq 1

segment .text
global main
extern printf
extern scanf

main:
push RBP 
mov rdi, fmt
mov rsi, a
mov rax ,0
call scanf
mov rax,0
mov rbx,0
mov rcx,0
mov rdx,0
mov rcx,[a]
cmp rcx,2
jz printprime
cmp rcx,1
jz printprime
mov rbx,2

While:
	mov rdx,0
	mov rax,rcx
	div rbx
	cmp rdx,0
	jz printnotprime
	inc rbx
	cmp rbx,rcx
	jz printprime
	jmp While
	

printprime:
	mov rdi,fmt2
	mov rsi,[a]
	mov rax,0
	call printf
	jmp Last
printnotprime:
	mov rdi,fmt3
	mov rsi,[a]
	mov rax, 0
	call printf
Last:
	mov rax,0
	pop rbp
	ret
