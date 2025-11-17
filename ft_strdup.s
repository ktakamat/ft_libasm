			section	.txt
			global	_ft_strdup
			extern	_malloc

_ft_strdup:							; rdi = src
			cmp		rdi, 0
			jz		error
len_start:
			xor		rcx, rcx
			jmp		len_compare
len_increment:
			inc		rcx
len_compare:
			cmp		BYTE [rdi + rcx], 0
			jne		len_incremet
malloc_start:
			inc		rcx								; length++
			push	rdi								; save src
			mov		rdi, rcx
			call	_malloc							; rax = _malloc(lngth)
			pop		rdi								; restore malloc
			cmp		rax, 0
			jz		error
copy_start:
			xor		rcx, rcx
			xor		rdx, rdx
			jmp		copy_copy
copy_increment:
			inc		rcx
copy_copy:
			mov		