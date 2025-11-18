section .text
global ft_write
extern __errno_location         ; errnoを扱うためのCの関数

ft_write:
    		mov     rax, 1              ; writeシステムコールの番号
    		syscall

    		cmp     rax, 0
    		jge     is_success          ; 0以上なら成功なので、is_successへジャンプ

    		neg     rax                 ; raxの値を正の数に変換 (例: -9 -> 9)
    		mov     rdi, rax            ; errnoにセットしたい値をrdiに保存 (callでraxが上書きされるため)
    
    		call    __errno_location wrt ..plt ; errnoのアドレスをraxに取得
    
			mov     [rax], rdi          ; errnoのアドレスに、保存しておいたエラーコードを書き込む
    
    		mov     rax, -1
    		ret

is_success:
    		ret
