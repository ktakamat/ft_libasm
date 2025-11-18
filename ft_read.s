section	.text
global	ft_read

ft_read:					;fd = rdi, buffer = rsi, bytes = rdx
			mov		rax, 0
			syscall
			ret