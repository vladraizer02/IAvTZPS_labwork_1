global _start

section .text
_start: ; точка входа в программу – всегда _start

mov rax, 1 ; номер функции, 1 - write
mov rdi, 1 ; номер файла, 1 - stdout
mov rsi, msg ; адрес строки для вывода
mov rdx, len ; длина выводимой строки
syscall ; системный вызов

mov rax, 0 ; номер функции, 0 - read
mov rdi, 0 ; номер файла, 0 - stdin
mov rsi, buffer ; адрес вводимой строки
mov rdx, 64 ; размер вводимой строки
syscall 

mov rax, 1 
mov rdi, 1 
mov rsi, msg2 
mov rdx, len2 
syscall 

mov rax, 1 
mov rdi, 1 
mov rsi, buffer 
mov rdx, 64 
syscall 

mov rax, 60 ; номер функции, 60 - exit
mov rdi, 0 ; код завершения программы
syscall ; системный вызов

section .data ; инициализированные данные

msg: ; метка -> адрес данных -> имя данных
DB "Hello, input string:", 0xa ; байтовый массив, может содержать строки
len EQU $ - msg ; именованная константа len равна длине строки

msg2: 
DB "You, input string:", 0xa 
len2 EQU $ - msg2 

section .bss ; не инициализированные данные

buffer:   resb 64 ; резервирование 64 байт 
