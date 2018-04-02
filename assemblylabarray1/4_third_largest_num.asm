segment .data
a: dq 0
b: dq 0
c: dq 0
cnt: dq 0
fmt: dq "third lasgest number is %lld ",10,0
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
	mov rdx, 0
	mov [a] ,rax
	mov [b] ,rax	
	mov [c] ,rax
thirdmax:
	cmp RCX, 5
	jz print
	mov RAX, [array+RCX*8]
	inc RCX	
	mov [cnt], RCX
	mov rbx ,[a]
	cmp rax ,rbx
	jge firststep
	mov rbx , [b]
	cmp rax ,rbx
	jge secondstep
	mov rbx , [c]
	cmp rax ,rbx
	jge thirdstep
lastpart:
	mov RCX, [cnt]
	jmp thirdmax
firststep:
	mov rbx ,[b]
	mov [c] ,rbx;
	mov rbx ,[a]
	mov [b] ,rbx 
	mov [a] ,rax
	jmp lastpart
secondstep:
	mov rbx ,[b]
	mov [c] ,rbx
	mov [b] ,rax
	jmp lastpart
thirdstep:
	mov [c] ,rax 
	jmp lastpart	
print:
	mov rax , [c]
	mov rdi ,fmt
	mov rsi ,rax
	call printf
END:
	mov RAX, 0
	pop RBP
ret
