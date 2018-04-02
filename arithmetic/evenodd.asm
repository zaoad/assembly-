segment .data 
fmt: db "%d",0
fmt2: db "even",10,0
fmt3: db "odd",10,0
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
mov rax ,0
call scanf
mov rdx, 0
mov rax, [a]
mov rbx, 0
mov rbx, 2
div rbx
add rdx, 0
jz printfirst
jmp printsecond
printfirst: 
mov rdi, fmt2
jmp last
printsecond:
mov rdi, fmt3
last:
call printf
mov rax,0
pop rbp
ret
