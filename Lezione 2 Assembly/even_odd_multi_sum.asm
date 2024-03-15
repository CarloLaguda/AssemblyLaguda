section .data
sum_msg db "Il risultato della somma è: "
len_sum equ $ - sum_msg

mul_msg db "Il risultato della moltiplicazione è: "
len_mul equ $ - mul_msg

even_msg db "Il numero è pari"
len_even_msg equ $ - even_msg

odd_msg db "Il numero è dispari"
len_odd_msg equ $ - odd_msg

and_msg db "Il risultato dell'operazione AND è: "
len_and_msg equ $ - and_msg

new_line db 0xA
len_nl equ $ - new_line

section .bss
sum resb 1
multi resb 1
and_result resb 1

section .text
global _start

_start:
; Addizione
mov eax, 7  
mov ebx, 1
add eax, ebx
add eax, '0'
mov [sum], eax
    
; Moltiplicazione
mov eax, 7 
mov ebx, 1
mul ebx
add eax, '0'
mov [multi], eax

; Eseguo l'operazione AND tra la somma e un bit 1
mov eax, [sum]
and eax, 1
add eax, '0'
mov [and_result], eax

; Stampo messaggio somma
mov eax, 4
mov ebx, 1
mov ecx, sum_msg
mov edx, len_sum
int 80h

; Stampo la somma
mov eax, 4
mov ebx, 1
mov ecx, sum
mov edx, 1
int 80h

; Nuova linea
mov eax, 4
mov ebx, 1
mov ecx, new_line
mov edx, len_nl
int 80h

; Stampo il messaggio del risultato della AND
mov eax, 4
mov ebx, 1
mov ecx, and_msg
mov edx, len_and_msg
int 80h

; Stampo la AND
mov eax, 4
mov ebx, 1
mov ecx, and_result
mov edx, 1
int 80h

;Nuova linea
mov eax, 4
mov ebx, 1
mov ecx, new_line
mov edx, len_nl
int 80h

; Stampo messaggio moltiplicazione
mov eax, 4
mov ebx, 1
mov ecx, mul_msg
mov edx, len_mul
int 80h

; Stampo la moltiplicazione
mov eax, 4
mov ebx, 1
mov ecx, multi
mov edx, 1
int 80h

; Nuova linea
mov eax, 4
mov ebx, 1
mov ecx, new_line
mov edx, len_nl
int 80h
  
; Con una and capisco se il risultato della moltiplicazione è pari o dispari
mov eax, [multi]
sub eax, 0	
and eax, 1
jz even 
jnz odd
	  
even:  ;stampa messaggio pari
mov eax, 4
mov ebx, 1
mov ecx, even_msg
mov edx, len_even_msg
int 80h
jmp fine
	 
odd:  ;stampa messaggio dispari
mov eax, 4
mov ebx, 1
mov ecx, odd_msg
mov edx, len_odd_msg
int 80h
jmp fine
    
fine:  ;fine programma
mov eax, 1
mov ebx, 0
int 80h
    