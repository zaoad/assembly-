segment .data
a: dq 0
b: dq 0
first: dq 0
last: dq 0
sum1: dq 0
sum2: dq 0
flag: dq 0
cnt: dq 0
cnt1:dq 0
newline: dq " ",10,0
fmt: dq "%lld ",10,0
fmt_in: dq "%lld", 10,0
fmtshow: dq " %lld %lld " ,10,0
fmt_out: dq "differece : %lld", 10, 0

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
mov [flag],rax
INPUT: 
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, first
	call scanf
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, last
	call scanf
init:
	mov rcx , [first]
loop:
	mov rbx ,[last]
	cmp rcx,rbx
	jg print
	mov [cnt] ,rcx
	mov rbx ,2
checkprime:
	mov [cnt1] ,rbx
	mov rcx,[cnt]
	cmp rcx ,2
	jz prime
	cmp rcx ,1
	jz out
	mov rbx ,[cnt1]
	cmp rbx,rcx
	jge prime
	mov rdx ,0
	mov rax ,[cnt]
	div rbx
	cmp rdx ,0
	jz out
	mov rbx ,[cnt1]
	inc rbx
	jmp checkprime
out:
	mov rcx ,[cnt]
	inc rcx
	jmp loop
prime:
	mov rdi ,fmt
	mov rsi,[cnt]
	call printf
	mov rax	, [flag]
	cmp rax ,0
	jz sumoddprime
sumevenprime:
	mov rcx , [cnt]
	add [sum2] ,rcx
	mov rax ,0 
	mov [flag] ,rax
	jmp out
sumoddprime: 
	mov rcx ,[cnt]
	add [sum1] ,rcx
	mov rax ,1
	mov [flag] ,rax
	jmp out	
print:
	mov rsi ,newline
	call printf
	mov rax ,[sum1]
	mov rbx ,[sum2]
	sub rbx ,rax
	mov rdi ,fmt_out
	mov rsi , rbx
	call printf
END:
	mov RAX, 0
	pop RBP
ret
