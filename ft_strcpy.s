section	.text
global	ft_strcpy

ft_strcpy:
	xor		rcx, rcx		; i = 0
	xor		rdx, rdx		; tmp = 0
	cmp		rsi, 0			; !rsi
	jz		return
	jmp		copy
increment:
	inc		rcx				; i++
copy:
	mov		dl, BYTE[rsi + rcx]
	mov		BYTE[rdi + rcx], dl
	cmp		dl, 0
	jnz		increment
return:
	mov		rax, rdi
	ret
