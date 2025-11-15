			section		.txt
			global		_ft_read

_ft_read:					;fd = rdi, buffer = rsi, bytes = rdx
			mov		rax, 0
			syscall
			ret