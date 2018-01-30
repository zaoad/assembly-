segment .data
;a : dq 0
;b : dq 0
fmt : db "%d %d %d %d",0
fmt2 : db "%d %d %d %d",10,0
segment .bss
a : resq 1
b : resq 1
c : resq 1
d : resq 1
segment .text 
global main
extern printf
extern scanf
main:
push RBP 
mov RDI ,fmt
mov rsi, a
mov rdx ,b
mov rcx ,c
mov r8, d
mov rax,0
call scanf
mov rdi ,fmt2
mov rsi ,[a]
mov rdx ,[b]
mov rcx, [c]
mov r8 ,[d]
mov rax,0
call printf
mov rax,0
pop rbp
ret

