section .text
global	ft_strlen


ft_strlen:
			xor		rax, rax	;-> size_t i = 0    mov		rax, 0
			jmp		compare
increment:
			inc		rax				; i = 0
compare:
			cmp		BYTE[rdi + rax], 0 ; if (str[i] == 0)
			jne 	increment
done:
			ret						; return i
