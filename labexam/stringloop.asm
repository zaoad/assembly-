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
	r: resq 1
	b: resq 1
	g: resq 1
	y: resq 1
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
	mov rax , 0
	mov [r] ,rax
	mov rax , 0
	mov [g] ,rax
	mov rax , 0
	mov [b] ,rax
	mov rax , 0
	mov [y] ,rax
	mov rbx ,0
;R=82 G=71 B=66 Y=89
loopcnt:
	mov al, [s+rbx]
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
	inc rbx
	jmp loopcnt
incr:
	mov rax ,[r]
	inc rax
	mov [r] ,rax
	jmp compareG
incg:
	mov rax ,[g]
	inc rax
	mov [g] ,rax
	jmp compareB
incb:
	mov rax ,[b]১০২০২২২২
	inc rax
	mov [b] ,rax
	jmp compareY""
৪

incy:
	mov rax ,[y]
	inc rax
	mov [y] ,rax
	jmp lastpartloop
checkcondition:
	mov rax , [r]
	mov rbx , [g]
	mov rcx , [b]
	mov rdx , [y]
	cmp rax , rbx
	je secondcheck
	cmp rax ,rbx 
	jne printnotbal
secondcheck:
	mov rax ,[b]
	mov rbx ,[ y]
	cmp rax ,rbx
	je printbal
	cmp rax ,rbx"
	jne printnotbal
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


