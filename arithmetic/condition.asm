segment .data 
fmt: db "%d %d",0
fmt2: db "%d",10,0
segment .bss
a: resq 1
b: resq 1
segment .text
global main
extern printf
extern scanf
main:
push RBP 
mov rdi, fmt
mov rsi, a
mov rdx, b
mov rax ,0
call scanf
mov rax, [a]
mov rbx,[b]
sub rax, rbx
jg printfirst
jmp printsecond
printfirst: 
mov rdi, fmt2
mov rsi, [a]
jmp last
printsecond:
mov rdi, fmt2
mov rsi, [b]
last:
mov rax ,0
call printf
mov rax,0
pop rbp
ret
