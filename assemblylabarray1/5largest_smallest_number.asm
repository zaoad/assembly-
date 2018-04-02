segment .data
a: dq 0
b: dq 0
c: dq 0
cnt: dq 0
fmt: dq "Largest number %lld was found at location %lld ",10,0
fmt1: dq " smallest number %lld was found at location %lld " ,10, 0
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
	mov RAX, -1000000
	mov RCX, 0
	mov rdx, 0
	mov [a] ,rax
largestnum:
	cmp RCX, 5
	jz print
	mov RAX, [array+RCX*8]
	mov rbx ,[a]
	cmp rax ,rbx
	jge firststep
lastpart:
	inc RCX	
	jmp largestnum
firststep:
	mov [a] , rax
	mov [b] , rcx
	jmp lastpart	
print:
	mov rax , [a]
	mov rdi ,fmt
	mov rsi ,rax
	mov rdx ,[b]
	call printf
secondinit:
	mov RAX, 1000000
	mov RCX, 0
	mov rdx, 0
	mov [a] ,rax
smallestnum:
	cmp RCX, 5
	jz secondprint
	mov RAX, [array+RCX*8]
	mov rbx ,[a]
	cmp rbx, rax
	jge secondstep
finalpart:
	inc RCX	
	jmp smallestnum
secondstep:
	mov [a] , rax
	mov [b] , rcx
	jmp finalpart	
secondprint:
	mov rax , [a]
	mov rdi ,fmt1
	mov rsi ,rax
	mov rdx ,[b]
	call printf
END:
	mov RAX, 0
	pop RBP
ret
