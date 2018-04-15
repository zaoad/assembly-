segment .data
	scfmt : dq "%lld" ,0
	newline : dq "" ,10, 0
	prfmt: dq "%lld" ,10, 0

segment .bss
	a: resq 1
	b: resq 1

segment .text
	global main
	extern scanf
	extern printf

segment .text
	global main
	extern scanf
	extern printf

main:
	push rbp
	mov rbp ,rsp
	mov rax ,0
	mov rdi , scfmt
	mov rsi ,a
	call scanf
	mov rax ,[a]
	cmp rax , 1
	je printz
	cmp rax ,2
	je printone
	sub rax , 2
	push rax
	mov rax, 0
	push rax
	mov rax ,1
	push rax

	call fib

	leave
	ret

printz:
	mov rax ,0
	mov rdi ,prfmt
	mov rsi, 0
	call printf
	mov rax ,0
	mov rdi, newline
	call printf
	ret

printone:
	mov rax , 0
	mov rdi ,prfmt
	mov rsi, 1
	call printf
	mov rax ,0
	mov rdi, newline
	call printf
	ret

	
fib:
	push rbp
	mov rbp, rsp
	mov rcx, [rbp+32]
	mov rax ,[rbp+24]
	mov rbx ,[rbp+16]
	cmp rcx ,0
	je returnfib
	dec rcx 
	push rcx
	add rax ,rbx
	push rbx
	push rax
	call fib
	leave 
	ret
	
returnfib:
	mov rbx ,[rbp+16]
	mov rax ,0
	mov rdi ,prfmt
	mov rsi ,rbx
	call printf

	mov rax ,0
	mov rdi, newline
	call printf
	
	leave
	ret
		
	

