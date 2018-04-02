segment .data
fmt: dq "Vowels: %lld Consonents: %lld ",10,0
stringfmt: dq "%s",0
b: dq 0
len: dq 0
cnt: dq 0
segment .bss
s: resb 100


segment .text
global main
extern scanf
extern printf

main:

push RBP
mov rax, 0
mov rdi , stringfmt
mov rsi ,s
call scanf
mov rcx , 0
mov [cnt] ,rcx
mov [len] , rcx

loop:
	mov [b] , rcx
	mov bl , [s+rcx]
	cmp bl , 0
	je _exit
	mov bl , [s+rcx]
	mov al , 65
	cmp bl , al
	je count
	mov al , 69
	cmp bl , al
	je count
	mov al , 73
	cmp bl , al
	je count
	mov al , 79
	cmp bl , al
	je count
	mov al , 85
	cmp bl , al
	je count
	mov bl , [s+rcx]
	mov al , 97
	cmp bl , al
	je count
	mov al , 101
	cmp bl , al
	je count
	mov al , 105
	cmp bl , al
	je count
	mov al , 111
	cmp bl , al
	je count
	mov al , 117
	cmp bl , al
	je count
lastpartloop:
	mov rax , [len]
	add rax , 1
	mov [len] , rax
	mov rcx , [b]
	INC rcx
	jmp loop
count:
	mov rax , [cnt]
	add rax , 1
	mov [cnt] , rax
	jmp lastpartloop

_exit:
	mov rbx ,[cnt]
	mov rax , [len]
	sub rax , rbx
	mov rcx , rax
	xor rax , rax
	mov rdi, fmt
	mov rsi, rbx
	mov rdx , rcx
	call printf
	pop RBP
ret
