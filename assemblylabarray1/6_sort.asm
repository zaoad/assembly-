segment .data
a: dq 2
b: dq 0
cnt: dq 0
cnt1: dq 0
fmt: dq "%lld ",10,0
newline: dq " " ,10,0
fmt_in: dq "%lld", 0
fmt_out: dq "THE SUM IS: %lld", 10, 0

segment .bss
array resq 21

segment .text
global main
extern printf
extern scanf

main:
push RBP


mov RAX, 0
mov RCX, 0
mov RBX, 0

INPUT: 
	cmp RCX, 5
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
	mov rdx, 0	
outerloop:
	cmp rcx ,5
	jz finalinit
	mov [cnt] ,rcx
	mov rbx ,0
innerloop:
	cmp rbx ,5
	jz lastoutpart
	mov [cnt1] , rbx
	mov rcx, [cnt]
	mov rdx, [array+rcx*8]
	mov rax ,[array+rbx*8]
	cmp rax ,rdx
	jge swap
innerlastpart:
	mov rbx ,[cnt1]
	inc rbx
	jmp innerloop
swap:
	mov rcx ,[cnt]
	mov rbx ,[cnt1]
	mov rdx, [array+rcx*8]
	mov rax ,[array+rbx*8]
	mov [array+rcx*8] ,rax
	mov [array+rbx*8] ,rdx
	jmp innerlastpart
	
lastoutpart:
	mov rcx , [cnt]
	inc rcx
	jmp outerloop
finalinit:
	MOV rax,0
	mov rcx ,0
	mov rbx ,0
print:
	cmp rcx ,5
	jz END
	mov [cnt] ,rcx
	mov rdi ,fmt
	mov rsi ,[array+rcx*8]
	call printf
	mov rcx ,[cnt]
	inc rcx
	jmp print
END:
	xor rax,rax
	mov rdi ,newline
	call printf	
	mov RAX, 0
	pop RBP
ret
