segment .data
	fmt_out : dq "sum is %lld" ,10, 0
	fmt_in: dq "%lld" ,0
	newline: dq "",10,0

segment .bss
	a: dq 1
	b: dq 1

segment .text
	global main
	extern scanf
	extern printf
main:
	push rbp
	mov rbp ,rsp
	mov rax ,0
	mov rbx ,0 
	mov rcx ,0
	mov rdi , fmt_in
	mov rsi ,a
	call scanf
	mov rax ,0
	mov rbx,0 
	mov rcx ,0
	mov rdi ,fmt_in
	mov rsi , b
	call scanf
	mov rax ,[a]
	push rax
	mov rax, [b]
	push rax
	call sum
	pop rax
	pop rax
	mov rax, 0
	pop rbp 
	ret

sum:
	push rbp
	mov rbp, rsp
	mov rax ,[rbp+16]
	mov rbx ,[rbp+24]
	add rax , rbx
	mov rdi , fmt_out
	mov rsi ,rax
	call printf
	pop rbp
	ret

	

