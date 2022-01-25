.model tiny
.code
  org 100h
start:
;==================================================================
;Очистка экрана
 mov ax,0600h
 mov bh,15
 mov cx,00h
 mov dx,184fh
 int 10h
;===========================
;Установка позиции курсора на начало экрана
 mov dx,0000h
 mov bh,00h
 mov ah,02h
 int 10h
;===========================
;Вывод начального сообщения
 mov dx, offset input1
 mov ah,09h
 int 21h
 mov dx, offset input
 mov ah,09h
 int 21h
;===========================
;Ввод двоичного числа
   mov si,2
   mov di,0
@aa:
   mov ah,01h
   int 21h
   cmp al,13
   jz a1

   sub al,'0'
   xor ah,ah
   mov cx,ax
   mov ax,di
   mul si
   add ax,cx
   mov di,ax
   jmp @aa
a1:
   mov num,0
   mov num,di  
CALL setV
;==================================================================
;Отрисовка таблицы
;Вывод основного прямоугольника для таблицы
square:
 mov cx, x1
 mov dx, y1
 CALL horLineDraw
 CALL vertLineDraw
 mov cx, x1
 mov dx, y1
 CALL vertLineDraw
 CALL horLineDraw
;=============================
;Вывод горизонтальных линий таблицы
horLines: 
 mov cx, 10 
 mov dx, 60
 CALL horLineDraw
 mov cx, 10 
 mov dx, 110
 CALL horLineDraw
 mov cx, 10 
 mov dx, 160
 CALL horLineDraw
 mov cx, 10 
 mov dx, 210
 CALL horLineDraw
 mov cx, 10 
 mov dx, 260
 CALL horLineDraw
;==================
;Вывод вертикальных линий таблицы
vertLines: 
 mov cx, 90
 mov dx, 10
 mov x2, 90
 mov y2, 60
 CALL vertLineDraw
 mov cx, 170
 mov dx, 10
 mov x2, 170
 mov y2, 60
 CALL vertLineDraw
 mov cx, 270
 mov dx, 10
 mov x2, 270
 mov y2, 60
 CALL vertLineDraw
 mov cx, 370
 mov dx, 10
 mov x2, 370
 mov y2, 60
 CALL vertLineDraw
 mov cx, 490
 mov dx, 10
 mov x2, 490
 mov y2, 60
 CALL vertLineDraw
 mov cx, 140
 mov dx, 160
 mov x2, 140
 mov y2, 310
 CALL vertLineDraw
 mov cx, 290
 mov dx, 160
 mov x2, 290
 mov y2, 310
 CALL vertLineDraw
 mov cx, 470
 mov dx, 160
 mov x2, 470
 mov y2, 310
 CALL vertLineDraw
 mov x2,630
 mov y2,310
;==================================================================
;Вывод текста в таблицу
 MOV AH,13h
 MOV CX,6
 MOV DH,2
 MOV DL,3
 LEA BP,Word11
 CALL PrintWord 
;========= 
 MOV CX,4
 MOV DH,2
 MOV DL,14
 LEA BP,Word12
 CALL PrintWord 
;========= 
 MOV CX,7
 MOV DH,2
 MOV DL,24
 LEA BP,Word13
 CALL PrintWord 
;========= 
 MOV CX,9
 MOV DH,2
 MOV DL,36
 LEA BP,Word14
 CALL PrintWord 
;========= 
 MOV CX,12
 MOV DH,2
 MOV DL,48
 LEA BP,Word15
 CALL PrintWord 
;=========
 MOV CX,13
 MOV DH,2
 MOV DL,64
 LEA BP,Word16
 CALL PrintWord 
;=========
 MOV CX,31
 MOV DH,5
 MOV DL,25
 LEA BP,Word2
 CALL PrintWord 
;========= 
 MOV CX,70
 MOV DH,8
 MOV DL,5
 LEA BP,Word3
 CALL PrintWord 
;========= 
 MOV CX,14
 MOV DH,11
 MOV DL,2
 LEA BP,Word41
 CALL PrintWord 
;=========  
 MOV CX,11
 MOV DH,14
 MOV DL,3
 LEA BP,Word51
 CALL PrintWord 
;========= 
 MOV CX,11
 MOV DH,17
 MOV DL,3
 LEA BP,Word61
 CALL PrintWord 
;========= 
 MOV CX,19
 MOV DH,11
 MOV DL,38
 LEA BP,Word42
 CALL PrintWord  
;========= 
 MOV CX,19
 MOV DH,14
 MOV DL,38
 LEA BP,Word52
 CALL PrintWord  
;=========
 MOV CX,19
 MOV DH,17
 MOV DL,38
 LEA BP,Word62
 CALL PrintWord  
;=========
 MOV CX,1
 MOV DH,11
 MOV DL,68
 LEA BP,a_1
 CALL PrintWord  
;=========
 MOV CX,2
 MOV DH,14
 MOV DL,68
 LEA BP,b_1
 CALL PrintWord  
;=========
 MOV CX,2
 MOV DH,17
 MOV DL,68
 LEA BP,c_1
 CALL PrintWord  
;=========
 MOV AH,2
 MOV BH,0
 MOV DH,11
 MOV DL,23
 INT 10H 
 mov si,2
 mov ax,num
 mov cx,0	
 test al,1 
 jnz odd
 mov bl,09h
 jmp a 
odd:
 mov bl,0Ch 
a:
 mov dx,0
 div si
 add dx,'0'
 push dx
 inc cx
 cmp ax,0
 jnz a
aa:
 pop dx
 push cx
 mov ah,0Eh
 mov al,dl 
 mov bh,0         
 int 10h 
 pop cx
 loop aa
;=========
 MOV AH,2
 MOV BH,0
 MOV DH,14
 MOV DL,25
 INT 10H 
 mov si,10
 mov ax,num
 mov cx,0
a_:
 mov dx,0
 div si
 add dx,'0'
 push dx
 inc cx
 cmp ax,0
 jnz a_
aa_:
 pop dx
 push cx
 mov ah,0Eh
 mov al,dl 
 mov bh,0         
 int 10h 
 pop cx
 loop aa_
;=========
 MOV AH,2
 MOV BH,0
 MOV DH,17
 MOV DL,25
 INT 10H 
 mov si,16
 mov ax,num

 mov  cx, 4
a__: 
 rol ax,4
 mov dl,al
 and dl,0Fh
 cmp dl, 9
 jbe short aa__
 add dl,'A'-('9'+1)
aa__: 
 add dl,'0'
 push ax
 push cx
 mov ah,0Eh
 mov al,dl 
 mov bh,0         
 int 10h 
 pop cx
 pop ax
 loop a__
;===============================
;Возврат стандартного видеорежима
 CALL next
 mov ax,03h
 int 10h
;==================================================================
;Запись таблицы в файл
;Открыть/Создать файл
mov ah,3Ch
mov dx,offset filename
mov cx,0
int 21h
mov Handel,ax
;=======================================
;Запись в файл
lea dx,tabl1
CALL PrintFile
lea dx,tabl2
CALL PrintFile
lea dx,tabl3
CALL PrintFile
lea dx,tabl4
CALL PrintFile
lea dx,tabl5
CALL PrintFile
lea dx,tabl6
CALL PrintFile
lea dx,tabl7
CALL PrintFile
lea dx,tabl8
CALL PrintFile
lea dx,tabl9
CALL PrintFile
lea dx,tabl10
CALL PrintFile
lea dx,tabl11
CALL PrintFile
lea dx,tabl12
CALL PrintFile
lea dx,tabl13
CALL PrintFile
;======================================
;Вывод шестнадцатеричного числа в файл
;Перемещение курсора
 mov ax,4201h
 mov dx,-131
 mov cx,-1
 int 21h

 mov ax,num
 push ax
 mov si,0
 mov bx,ax
 xchg ah,al
 call print_al_hex
 pop ax
 call print_al_hex
 mov ax,bx
 call print_al_dec

;Запись в файл
 mov ah,40h
 mov bx,Handel
 mov cx,4
 lea dx,buf2out
 int 21h
;===================
;Вывод десятичного числа
;Перемещение курсора
 mov ax,4201h
 mov dx,-160
 mov cx,-1
 int 21h

;Запись в файл
 mov ah,40h
 mov bx,Handel
 mov cx,3
 lea dx,[buf2out+4]
 int 21h
;===================
;Вывод двоичного числа
;Перемещение курсора
 mov ax,4201h
 mov dx,-162
 mov cx,-1
 int 21h
 mov ax,num
 mov si,0
 mov temp1,''
 mov ax, num
 push cx
 push dx
 push di
 push ax
 mov cx,10
 lea SI,temp1
FillBuff:
 mov byte ptr [si],' '
 inc si
 LOOP FillBuff
 mov byte ptr [si+1],'$'
 mov di,2
bb:
 xor dx,dx
 div di
 add dx,'0'
 dec si
 mov byte ptr [si],dl
 inc cx
 or ax,ax
 jnz bb
 pop ax
bb_:
 pop di
 pop dx
 pop cx
;Запись в файл
 mov ah,40h
 mov bx,Handel
 mov cx,10
 lea dx,temp1
 int 21h	
;==========================
;Закрыть файл
mov ah,3Eh
mov bx,Handel
int 21h
;==========================
;Окончание работы программы
 mov ah, 01h
 int 21h
 ret

; ОПИСАНИЕ ПРОЦЕДУР
;==================================================================
;Вывод пикселя
draw PROC
 mov ah,0Ch
 mov bh,0
 mov al,12
 int 10h
 ret
draw ENDP
;==============================
;Горизонтальная линия
horLineDraw PROC
hLine:
 CALL draw
 inc cx
 cmp cx, x2
 jne hLine
 ret
horLineDraw ENDP
;==============================
;Вертикальная линия
vertLineDraw PROC
vLine:
 CALL draw
 inc dx
 cmp dx, y2
 jne vLine
 ret
vertLineDraw ENDP
;==============================
next PROC
 mov ah,01h
 int 21h
next ENDP
;==============================
;Процедура установки видеорежима
setV PROC
 mov ax,4F02h
 mov bx,012h
 int 10h
 ret
setv ENDP
;==============================
;Процедура вывода строки
PrintWord PROC
 MOV AH,13h
 MOV AL,0
 MOV BL,7
 INT 10H 
 ret
PrintWord ENDP 
;==============================
;Процедура записи строки в файл
PrintFile PROC
 mov ah,40h
 mov bx,Handel
 mov cx,78
 int 21h
 ret
PrintFile ENDP 
;==============================
;Процедура вывода шестнадцатеричного числа
print_al_hex PROC
 mov di,0
 mov si,16
 mov ax,num
 mov  cx, 4
a___: 
 rol ax,4
 mov dl,al
 and dl,0Fh
 cmp dl, 9
 jbe short aa___
 add dl,'A'-('9'+1)
aa___: 
 add dl,'0'
 mov buf2out[di],dl
 inc di
 loop a___
 ret
print_al_hex ENDP
;==============================
;Процедура вывода десятичного числа
print_al_dec PROC
 mov cx,10
 xor bx,bx
m1:
 cmp ax,10
 jb m2
 xor dx,dx
 div cx
 or dl,'0'
 push dx
 inc bx
 jmp m1
m2:
 or al,'0'
 push ax
 inc bx
 mov cx,bx
lop:
 pop dx
 mov buf2out[di],dl
 inc di
 loop lop
 ret
print_al_dec ENDP
;===========================================================
 x1 dw 10
 y1 dw 10
 x2 dw 630
 y2 dw 310
 num dw 0
 a_1 db "2" ,0
 b_1 db "10",0
 c_1 db "16",0
 sist_s dw 0
 Handel dw ?
 temp1 DB 16 DUP(?)
 buf2out db 20 dup (?),'$'
 filename db 'file.txt',0
 Word11 db "СПБГУТ",0
 Word12 db "ИСиТ",0
 Word13 db "ИСТ-913",0
 Word14 db "18.12.20",0
 Word15 db "Хотамов С.А.",0
 Word16 db "Волынкин П.А.",0
 Word2  db "Вычислительные машины и системы",0
 Word3  db "Написание программы на языке ассемблера. Работа с системами счисления",0
 Word41 db "Исходное число",0
 Word42 db "Система счисления a",0
 Word51 db "Результат 1",0
 Word52 db "Система счисления b",0
 Word61 db "Результат 2",0
 Word62 db "Система счисления c",0
 input  db "Введите двоичное число: ",'$'
 input1 db "Программа для перевода чисел в другие системы счисления: ",0Ah,0dh,0Ah,0dh,'$';
 tabl1 db '╔══════════╦════════╦═══════════╦════════════╦══════════════╦═══════════════╗', 0dh, 0ah,'$'
 tabl2 db '║  СПБГУТ  ║  ИСиТ  ║  ИСТ-913  ║  18.12.20  ║ Хотамов С.А. ║ Волынкин П.А. ║', 0dh, 0ah,'$'
 tabl3 db '╠══════════╩════════╩═══════════╩════════════╩══════════════╩═══════════════╣', 0dh, 0ah,'$'
 tabl4 db '║                      Вычислительные машины и системы                      ║', 0dh, 0ah,'$'
 tabl5 db '╠═══════════════════════════════════════════════════════════════════════════╣', 0dh, 0ah,'$'
 tabl6 db '║   Написание программы на языке ассемблера. Работа с системами счисления   ║', 0dh, 0ah,'$'
 tabl7 db '╠══════════════════╦═══════════════╦═════════════════════╦══════════════════╣', 0dh, 0ah,'$'
 tabl8 db '║  Исходное число  ║               ║ Система счисления a ║        2         ║', 0dh, 0ah,'$'
 tabl9 db '╠══════════════════╬═══════════════╬═════════════════════╬══════════════════╣', 0dh, 0ah,'$'
tabl10 db '║   Результат 1    ║               ║ Система счисления b ║        10        ║', 0dh, 0ah,'$'
tabl11 db '╠══════════════════╬═══════════════╬═════════════════════╬══════════════════╣', 0dh, 0ah,'$' 
tabl12 db '║   Результат 2    ║               ║ Система счисления c ║        16        ║', 0dh, 0ah,'$' 
tabl13 db '╚══════════════════╩═══════════════╩═════════════════════╩══════════════════╝', 0dh, 0ah,'$'
end start