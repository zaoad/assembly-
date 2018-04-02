segment .data
a: dq 2
b: dq 0
cnt: dq 0
last: dq 0
flag: dq 0
fmt: dq "%lld ",10,0
fmt_in: dq "%lld", 0
fmt_out: dq "THE SUM IS: %lld", 10, 0
nofirst: dq " there is no first odd" ,10, 0
nosecond: dq " there is no last odd" ,10 ,0
segment .bss
array resq 21

segment .text
global main
extern printf
extern scanf

main:
push RBP


mov RAX, 1
mov RCX, 0
mov RBX, 0
mov [flag] ,rax
mov rax,0
INPUT: 
	cmp RCX, 10
	jz init
	push RCX
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, a
	call scanf
	mov RAX, [a]
	pop rcx
	mov [array+RCX*8], RAX	
	inc RCX	
	jmp INPUT
init:
	mov RAX, 0
	mov RCX, 0
	mov RBX, 0	

checkfirstodd:
	cmp RCX, 10
	jz printnofirstodd
	mov RAX, [array+RCX*8]
	mov [b] ,rax
	inc RCX	
	mov [cnt] ,rcx
	mov rdx ,0
	mov rbx ,2
	div rbx  	
	cmp rdx ,1
	jz printfirstodd
	mov RCX, [cnt]
	jmp checkfirstodd
printfirstodd:
	mov rsi,[b]
	mov rdi ,fmt
	call printf
	mov RCX, [cnt]	
checksecondodd:
	cmp RCX, 10
	jz printsecondodd
	mov RAX, [array+RCX*8]
	mov [b] ,rax
	inc RCX	
	mov [cnt] ,rcx
	mov rdx ,0
	mov rbx ,2
	div rbx  	
	cmp rdx ,1
	jz pushsecondodd
	mov RCX, [cnt]
	jmp checksecondodd
pushsecondodd:
	mov rax,0
	mov [flag] ,rax
	mov rax, [b]
	mov [last] ,rax
	mov rcx,[cnt]
	jmp checksecondodd
printsecondodd:
	mov rax ,[flag]
	cmp rax ,1
	jz printnosecondodd;
	mov rdi, fmt
	mov rsi, [last]
	call printf
	jmp END
printnofirstodd:
	mov rdi, nofirst
	call printf
printnosecondodd:
	mov rdi, nosecond
	call printf
END:
	mov RAX, 0
	pop RBP
ret
