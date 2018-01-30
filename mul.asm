segment .data
a: dq 200
b: dq 100
sum: dw "product",10,0
fmt: dq "%s %lld ",10,0

segment .text
global main
extern printf

main:
push RBP

mov RAX , 0
MOV RBX , 0
mov RDX, 0
mov RAX , [a]
MOV RDX , [b]
mul Rdx
mov RDI, fmt
mov RSI, sum
mov RDX, RAX
mov RAX , 0
call printf

mov RAX, 0
pop RBP
ret
