segment .data
a: dq 0
b: dq 0
cnt: dq 0
cnt1: dq 0
temp: dq 0
fmt: dq "%lld ",10,0
fmt_in: dq "%lld", 0
fmt_out: dq " the number is exist already : %lld more unique number required ",10,0 
fmt_add: dq " add to array : %lld more unique number required " ,10, 0
newline: dq " " ,10,0
segment .bss
array resq 100
unique resq 20
segment .text
global main
extern printf
extern scanf

main:
push RBP


mov RAX, 0
mov RCX, 0
mov RBX, 0
mov [temp] ,rcx
INPUT: 
	mov rcx , [temp]
	cmp RCX, 10
	jge init
	mov [temp] ,rcx
	mov RAX, 0
	mov RDI, fmt_in
	mov RSI, a
	call scanf
	jmp check_exist
	
check_exist:
	mov rbx , 0
	mov [cnt1] ,rbx

check_loop:
	mov rdx ,[temp]
	cmp rbx,rdx
	jge addtoarray
	mov rax ,[a]
	mov r8 , [array+rbx*8]
	cmp rax,r8
	je alertduplicate
last_check_loop:
	mov rbx,[cnt1]
	inc rbx 
	mov [cnt1], rbx
	jmp check_loop
	
alertduplicate:
	mov rax , [temp]
	mov rdx ,10
	sub rdx ,rax
	mov rax ,0
	mov rdi, fmt_out
	mov rsi ,rdx
	call printf
	mov rax ,0
	mov rdi, newline
	call printf
	jmp INPUT
addtoarray:
	mov rax , [a]
	mov rbx ,[temp]
	mov [array+rbx*8] ,rax
	inc rbx
	mov [temp] ,rbx
	mov rax , [temp]
	mov rdx ,10
	sub rdx ,rax
	mov rax ,0
	mov rdi ,fmt_add
	mov rsi ,rdx
	call printf
	mov rax ,0
	mov rdi , newline
	call printf
	jmp INPUT
init:
	mov RAX, 0
	mov RCX, 0
	mov RBX, 0	

PRINT:
	cmp RCX, 10
	jz END
	mov RAX, [array+RCX*8]
	inc RCX	
	mov [cnt], RCX
	mov RDI, fmt
	mov RSI, RAX
	call printf
	mov RCX, [cnt]
	jmp PRINT

END:
	mov RAX, 0
	pop RBP
ret
