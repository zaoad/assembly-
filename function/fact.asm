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
main:
	push rbp
	mov rbp ,rsp
	xor rax ,rax
	mov rdi , scfmt
	mov rsi ,a
	call scanf 
	mov rbx ,[a]
	cmp rbx ,1
	je print1
	cmp rbx ,0
	je print1
	push rbx
	call fact
	pop rbx
	mov rax ,0
	mov rdi, prfmt
	mov rsi , rbx
	call printf
	mov rax ,0
	mov rdi, newline
	call printf
	leave 
	ret
print1:
	mov rax ,0
	mov rdi, prfmt
	mov rsi , 1
	call printf
	mov rax ,0
	mov rdi, newline
	call printf
	ret	
fact:
	push rbp
	mov rbp, rsp
	mov rbx ,[rbp+16]
	cmp rbx ,1 
	je _exit
	dec rbx
	push rbx
	call fact
	pop rbx
	mov rax ,[rbp+16]
	mul rbx
	mov [rbp+16] ,rax
	leave 
	ret
_exit:
	
	leave 
	ret
	
