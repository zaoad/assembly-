segment .data
	scfmt: dq "%s",0
	equalfmt: dq "strings are equal",10 , 0
	notequalfmt: dq "strings are not equal" , 10, 0
	fmt: dq "%lld" , 10 ,0
	prr: dq "",10,0
	len1: dq 0
	len2: dq 0
	cnt: dq 0
segment .bss
	str1: resb 100
	str2: resb 100
	

segment .text
	global main
	extern scanf
	extern printf

main:
	push RBP

	mov rax ,0
	mov rdi , scfmt
	mov rsi , str1
	call scanf
	
	mov rax ,0
	mov rdi , scfmt
	mov rsi , str2
	call scanf

	mov rcx , 0
	mov rbx , 0
	mov [cnt] ,rcx
string_checking:
	mov rcx , [cnt]
	mov al , [str1+rcx]
	mov bl , [str2+rcx]
	cmp al , bl
	jne printnotequal
	mov rcx, [cnt]
	inc rcx
	mov [cnt] , rcx
	cmp al ,0
	jz printequal
	jmp string_checking
printequal:
	xor rax, rax
	mov rdi , equalfmt
	call printf

	xor rax , rax
	mov rdi , prr
	call printf
	
	pop RBP
	ret
printnotequal:
	xor rax, rax
	mov rdi , notequalfmt
	call printf

	xor rax , rax
	mov rdi , prr
	call printf

	pop RBP
	ret
