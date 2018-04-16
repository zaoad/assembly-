segment .data
	scfmt : dq "%lld" ,0
	stringfmt: dq "%s" ,0
	newline : dq "" ,10, 0
	prfmt: dq "%lld" ,10, 0
	printbalanced: dq "balanced", 10, 0
	printnotbalanced:  dq "notbalanced" ,10 ,0
segment .bss
	s: resq 100
	l: resq 1
segment .text
	global main
	extern scanf
	extern printf
main:
	push rbp
	mov rbp ,rsp
	mov rax ,0
	mov rdi , stringfmt
	mov rsi ,s
	call scanf
	mov rax, 0
	push rax
	mov rax ,0
	push rax 
	mov rax ,0 
	push rax 
	mov rax ,0
	push rax
	mov rax ,0
	push rax 
	call stringrecur
	cmp rdx ,0
	je printnotbal
	cmp rdx ,1
	je printbal
	leave
	ret
;R=82 G=71 B=66 Y=89
stringrecur:
	push rbp
	mov rbp ,rsp
	mov rbx ,[rbp+48]
	mov r8 , [rbp+40]
	mov r9 , [rbp+32]
	mov r10 ,[rbp+24]
	mov r11 ,[rbp+16]
	mov al ,[s+rbx]
	cmp al, 0
	je checkcondition
compareR:
	cmp al ,82
	je incr
compareG:
	cmp al ,71
	je incg
compareB:
	cmp al ,66
	je incb
compareY:
	cmp al, 89
	je incy
lastpartloop:
	mov rbx ,[rbp+48]
	inc rbx
	push rbx
	push r8
	push r9
	push r10
	push r11
	call stringrecur
	leave 
	ret
incr:
	inc r8
	jmp compareG
incg:
	inc r9
	jmp compareB
incb:
	inc r10
	jmp compareY
incy:
	inc r11
	jmp lastpartloop
checkcondition:
	mov rax , r8
	mov rbx , r9
	mov rcx , r10
	mov rdx , r11
	cmp rax , rbx
	je secondcheck
	cmp rax ,rbx 
	jne return0
secondcheck:
	mov rax ,r10
	mov rbx ,r11
	cmp rax ,rbx
	je return1
	cmp rax ,rbx
	jne return0
return1:
	mov rdx ,1
	leave
	ret
return0:
	mov rdx ,0
	leave
	ret
printbal:
	mov rax ,0
	mov rdi ,printbalanced	
	call printf
	leave
	ret
printnotbal:
	mov rax, 0
	mov rdi ,printnotbalanced
	call printf
	mov rax ,0
	mov rdi ,newline
	call printf
	leave 
	ret


