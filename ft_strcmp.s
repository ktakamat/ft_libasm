section .text
global  ft_strcmp

ft_strcmp:
			xor		rcx, rcx
			xor		rdx, rdx
			cmp		rdi, 0
			jz		check_null
			cmp		rsi, 0
			jz		check_null
			jmp		check
check_null:
			cmp		rdi, rsi
			jz		equal
			jg		s1_greater
			jmp		s1_less
cmopare:
			mov		dl, BYTE [rsi + rcx]
			cmp		BYTE [rdi + rcx], dl
			jne		last_char
increment:
			inc		rcx
check:
			cmp		BYTE [rdi + rcx], 0
			je		last_char
			cmp		BYTE [rsi + rcx], 0
			je		last_char
			jmp		cmopare
last_char:
			mov		dl, BYTE [rdi + rcx]
			sub		dl, BYTE [rsi + rcx]
			cmp		dl, 0
			jz		equal
			jl		s1_less
s1_greater:
			mov		rax, 1
			ret
s1_less:
			mov		rax, -1
			ret
equal:
			mov		rax, 0
			ret
