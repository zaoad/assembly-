segment .data
;hello : dq 0
;h2 : dq 0
fmt : db "%d %d %s",0
fmt2 : db "%d %d %s",10,0
segment .bss
hello : resq 1
h2 : resq 1
st : resb 20
segment .text 
global main
extern printf
extern scanf
main:
push RBP 
mov RDI ,fmt
mov rsi, hello
mov rdx ,h2
mov rcx ,st
mov rax,0
call scanf
mov rdi ,fmt2
mov rsi ,[hello]
mov rdx ,[h2]
mov rcx, st
mov rax,0
call printf
mov rax,0
pop rbp
ret

