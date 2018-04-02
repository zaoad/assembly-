
segment .data
	scfmt: dq "%s",0
	palin: dq "the string is a Palindrome",10 , 0
	nonPalin: dq "the string is not a pallindrome" , 10, 0
	prr: dq "",10,0
	fmt: dq "%lld" , 10 ,0
	l: dq 0
	r: dq 0
	strlen: dq 0
	cnt: dq 0
segment .bss
	str: resb 100
	proccon: resq 1
	parameter: resq 1
	print_con: resq 1

segment .text
global main
extern scanf
extern printf

main:
	push RBP
	xor rax ,rax
	mov rdi , scfmt
	mov rsi , str
	call scanf
	xor rcx , rcx

mainloop:
	mov [strlen] , rcx
	mov al , [str+rcx]
	cmp al , 0
	je palincheck
	cmp al , 96
	jg lastpartloop
	xor al , 20H
	mov [str+rcx] , al

lastpartloop:
	mov rcx , [strlen]
	inc rcx
	jmp mainloop

palincheck:
	xor rax , rax
	mov [l] , rax
	mov rax , [strlen]
	dec rax
	mov [r] , rax
pallindrome:
	mov rcx , [l]
	mov rdx , [r]
	mov al , [str+rcx]
	mov bl , [str+rdx]
	cmp al , bl
	jne printexit
	mov rcx , [l]
	mov rdx , [r]
	inc rcx
	dec rdx
	mov [l] , rcx
	mov [r] , rdx
	cmp rdx , rcx
	jge pallindrome
	
	xor rax ,rax
	mov rdi , palin
	call printf

	mov rdi , prr
	call printf
	pop RBP
	ret
printexit:
	xor rax ,rax
	mov rdi , nonPalin
	call printf

	mov rdi, prr
	call printf
	pop RBP
	ret
