segment .data
fmt: dq "%lld %lld",10,0
stringfmt: dq "%s ",0
printpallin: dq "the string is a pallindrome", 10,0
notpallin: dq "the shtring is not a pallindrome" ,10, 0
len: dq 0
cnt: dq 0
a: dq 0
b: dq 0
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
mov [len] , rcx
loop:
	mov [cnt] , rcx
	mov bl , [s+rcx]
	cmp bl , 0
	jz init
	mov bl , [s+rcx]
	mov al , 92
	cmp al ,bl
	jge changecharacter
	
lastpartloop:
	mov rax , [len]
	add rax , 1
	mov [len] , rax
	mov rcx , [cnt]
	INC rcx
	jmp loop

changecharacter:
	mov rcx ,[cnt]
	mov bl ,[s+rcx]
	xor bl , 32
	mov [s+rcx] ,bl
	jmp lastpartloop

init:
	mov rax,0
	mov rcx,0
	mov rbx ,[len]
	dec rbx
	mov [len] ,rbx
pallindromecheck:
	cmp rcx ,rbx
	jge printpallindrome
	mov bl ,[s+rcx]
	mov al ,[s+rbx]
	mov [a] ,rcx
	mov [b] ,rbx
	cmp bl ,al
	jne notpallindrome
	mov rcx ,[a]
	mov rbx ,[b]
	inc rcx
	dec rbx
	jmp pallindromecheck
printpallindrome:
	mov rdi ,stringfmt
	mov rsi, s
	call printf
	mov rax ,0
	mov rdi ,printpallin
	call printf
	jmp end

notpallindrome:
	mov rdi ,stringfmt
	mov rsi, s
	call printf
	mov rax ,0
	mov rdi ,notpallin
	call printf
	jmp end
end:
	pop RBP
ret
