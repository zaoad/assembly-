segment .data 
fmt: db "%d",0
fmt2: dq "%d ",10,0
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
mov r8,0
mov r9,0
mov rcx,[a]
mov rbx,10

while:
	mov rdx,0
	mov rax,rcx
	div rbx
	mov r9,rdx;
	mov rdx,0
	mov rax,r8
	mul rbx
	add rax,r9
	mov r8 ,rax 
	mov rdx ,0
	mov ,rax,rcx
	div rbx
	cmp rax,0
	jz printnotprime
	mov rcx,rax
	jmp While
pallindrome
	
		
	
Last:
	mov rax,0
	pop rbp
	ret
