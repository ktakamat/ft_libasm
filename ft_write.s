			section	.txt
			global	_ft_write

_ft_write:
			mov		rax, 1
			syscall
			ret


;ssize_t ft_write(int fd, const void *buf, size_t count)
	return write(fd, buf, count);