segment .data
	scfmt : dq "%lld" ,0
	stringfmt: dq "%s" ,0
	newline : dq "" ,10, 0
	prfmt: dq "%lld" ,10, 0
	printpal: dq "%s is pallindrome", 10, 0
	printnotpal: dq "%s is not pallindrome" ,10 ,0
segment .bss
	s: resq 100
	l: resq 1
segment .text
	global main
	extern scanf
	extern printf,gets
main:
	push rbp
	mov rbp ,rsp
	mov rax ,0
	;mov rdi , stringfmt
	mov rdi ,s
	call gets
	mov rbx ,0
	mov rcx ,0
loop: 
	mov rax ,[s+rcx]
	cmp rax , 0
	je length
	inc rcx
	jmp loop
 length:
	dec rcx
	mov [l] ,rcx
	mov rax ,0
	push rax 
	mov rax , [l]
	push rax
	call pallindrome
	cmp rax ,0
	je printnotpallin
	cmp rax ,1
	je printpallin
	leave 
	ret
pallindrome:
	push rbp 
	mov rbp ,rsp 
	mov rax, [rbp+24]
	mov rbx ,[rbp+16]
	cmp rax ,rbx 
	jge pallind
	mov dl ,[s+rax]
	mov dh,[s+rbx]
	inc rax 
	dec rbx
	push rax 
	push rbx
	cmp dl ,dh
	je callfunc
	jne notpallind
callfunc:	
	call pallindrome
	leave 
	ret
pallind:
	mov rax ,1
	leave
	ret
notpallind:
	mov rax ,0
	leave 
	ret
printpallin:
	mov rax ,0
	mov rdi ,printpal
	mov rsi ,s
	call printf
	mov rax ,0
	mov rdi ,newline
	call printf
	leave 
	ret
printnotpallin:
	mov rax , 0
	mov rdi ,printnotpal
	mov rsi ,s
	call printf
	mov rax ,0
	mov rdi ,newline
	call printf 
	leave
	ret

