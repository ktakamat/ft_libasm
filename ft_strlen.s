			section .txt
			global _ft_strlen


_ft_strlen:
		mov		rax, 0			;-> size_t i = 0
		jmp		compare
increment:
		inc		rax				; i = 0
compare:
		cmp		BYTE[rdi + rax], 0 ; if (str[i] == 0)
		jne 	increment
done:
		ret						; return i



;size_t ft_strlen(const char *str) {
    size_t i = 0;
    while (str[i] != '\0') {
        i++;
    }
    return i;
}