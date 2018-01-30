segment .data
a: dq 201
b: dq 100
sum: dw "remainder",10,0
fmt: dq "%s %lld quotient %lld",10,0
rem: dw "remainder",10,0
segment .text
global main
extern printf

main:
push RBP
mov RAX , 0
MOV RBX , 0
mov RDX, 0
mov RAX , [a]
MOV RBX , [b]
div RBX
mov RDI, fmt
mov RSI, sum
mov RCX, RAX
mov RAX , 0
call printf
pop RBP
ret
