segment .data
	scfmt : dq "%lld" ,0
	newline : dq "" ,10, 0
	prfmt: dq "%lld" ,10, 0	
	printindex: dq "index is %lld" ,10, 0
	printnoelementexist: dq "%lld is not exist in index",10,0
segment .bss
	a: resq 1
	b: resq 1
	cnt: resq 1
	val: resq 1
	array resq 21

segment .text
	global main
	extern scanf
	extern printf
main:
	push rbp
	mov rbp ,rsp
	xor rax ,rax
	mov rdi , scfmt
	mov rsi ,cnt
	call scanf
	mov rax ,[cnt]
	inc rax
	mov [cnt] ,rax
	mov rcx ,1 
INPUT: 
	mov rbx,[cnt]
	cmp RCX, rbx
	jge init
	push RCX
	mov RAX, 0
	mov RDI, scfmt
	mov RSI, a
	call scanf
	mov RAX, [a]
	pop rcx
	mov [array+RCX*8], RAX
	inc RCX	
	jmp INPUT
init:
	mov rax ,0
	mov rdi ,scfmt
	mov rsi , val
	call scanf
	mov rax, 1
	push rax
	mov rax ,[cnt]
	dec rax
	push rax
	call binarysearch	
	leave
	ret

binarysearch:
	push rbp
	mov rbp, rsp
	mov rax ,[rbp+24]
	mov rbx ,[rbp+16]
	cmp rax,rbx
	jg printnosuchelement
	add rax,rbx
	mov rdx ,0
	mov rbx ,2
	div rbx

	mov rdx ,[array+rax*8]
	mov rbx,[val]

	cmp rbx,rdx
	je printexist

	cmp rbx,rdx
	jl binaryless

	cmp rbx ,rdx
	jg binarygreater

callfunc:
	call binarysearch
	leave 
	ret

binaryless:
	mov rbx ,[rbp+24]
	push rbx
	dec rax
	push rax
	jmp callfunc

binarygreater:
	inc rax
	push rax
	mov rbx,[rbp+16]
	push rbx
	jmp callfunc
	
printnosuchelement:
	mov rax,0
	mov rdi ,printnoelementexist
	mov rsi ,[val]
	call printf
	mov rax ,0
	mov rdi ,newline
	call printf
	leave
	ret	
printexist:
	mov rbx ,rax
	mov rax ,0
	mov rdi ,printindex
	mov rsi ,rbx
	call printf
	mov rax ,0
	mov rdi ,newline
	call printf
	leave 
	ret			
