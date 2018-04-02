segment .data 
fmt: db "%d",10,0
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
xor rax,rax
mov rcx ,10
xor rbx,rbx
rp:
inc rax
push rax
push rcx
add rbx,rax
pop rcx
pop rax
loop rp
mov rdi, fmt
mov rsi, rbx
call printf
pop rbp
ret
