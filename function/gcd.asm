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
	mov rax ,0
	mov rdi ,scfmt
	mov rsi , b
	call scanf
	mov rax ,[a]
	push rax
	mov rax, [b]
	push rax
	call gcd
	leave
	ret

gcd:
	push rbp
	mov rbp, rsp
	mov rax ,[rbp+16]
	mov rbx ,[rbp+24]
	cmp rbx ,0
	je returngcd
	mov rdx ,0
	div rbx
	push rdx
	push rbx
	call gcd
	leave
	ret
returngcd:
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
		

	

