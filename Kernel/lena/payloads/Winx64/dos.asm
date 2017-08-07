

 seg000          segment byte public 'CODE' use16
                 assume cs:seg000
                 assume es:nothing, ss:seg000, ds:nothing, fs:nothing, gs:nothing

 

                 public start
 start           proc near
                 push    cs
                 pop     ds
                 assume ds:seg000
                 mov     dx, 0Eh
                 mov     ah, 9
                 int     21h             ; DOS - PRINT STRING
                                         ; DS:DX -> string terminated by "$"
                 mov     ax, 4C01h
                 int     21h             ; DOS - 2+ - QUIT WITH EXIT CODE (EXIT)
 start           endp                    ; AL = exit code


		 db 0Dh,0Dh,0Ah
                 db '$',0
                 align 8
                 db 0A1h, 5Eh, 55h, 59h, 0E5h, 3Fh, 3Bh, 0Ah, 0E5h, 3Fh
                 db 3Bh, 0Ah, 0E5h, 3Fh, 3Bh, 0Ah, 0C7h, 5Fh, 38h, 0Bh
                 db 0E1h, 3Fh, 3Bh, 0Ah, 0C7h, 5Fh, 3Fh, 0Bh, 0EFh, 3Fh
                 db 3Bh, 0Ah, 0C7h, 5Fh, 3Eh, 0Bh, 99h, 3Fh, 3Bh, 0Ah, 0C7h
                 db 5Fh, 3Ah, 0Bh, 0E6h, 3Fh, 3Bh, 0Ah, 0E5h, 3Fh, 3Ah
                 db 0Ah, 0B6h, 3Fh, 3Bh, 0Ah, 76h, 5Fh, 38h, 0Bh, 0E2h
                 db 3Fh, 3Bh, 0Ah, 76h, 5Fh, 3Eh, 0Bh, 0F9h, 3Fh, 3Bh, 0Ah
                 db 76h, 5Fh, 3Fh, 0Bh, 0F7h, 3Fh, 3Bh, 0Ah, 2 dup(5Eh)
                 db 3Fh, 0Bh, 0E4h, 3Fh, 3Bh, 0Ah, 2 dup(5Eh), 39h, 0Bh
                 db 0E4h, 3Fh, 3Bh, 0Ah, 52h, 69h, 63h, 68h, 0E5h, 3Fh
                 db 3Bh, 0Ah, 10h dup(0), 50h, 45h, 2 dup(0), 64h, 86h
                 db 5, 0, 0FFh, 0E3h, 43h, 59h, 8 dup(0), 0F0h, 0, 22h
                 db 0, 0Bh, 2, 0Eh, 0Ah, 0, 0AEh, 3 dup(0), 0BAh, 6 dup(0)
                 db 0B0h, 12h, 3 dup(0), 10h, 5 dup(0), 40h, 1, 4 dup(0)
                 db 10h, 3 dup(0), 2, 2 dup(0), 6, 7 dup(0), 6, 8 dup(0)
                 db 90h, 1, 2 dup(0), 4, 6 dup(0), 3, 0, 60h, 0C1h, 2 dup(0)
                 db 10h, 6 dup(0), 10h, 8 dup(0), 10h, 6 dup(0), 10h, 0Ah dup(0)
                 db 10h, 0Bh dup(0), 34h, 40h, 1, 0, 28h, 0Ch dup(0), 70h
                 db 1, 0, 0C0h, 0Ch, 0Bh dup(0), 80h, 1, 0, 4, 6, 3 dup(0)
                 db 32h, 1, 0, 1Ch, 1Bh dup(0), 20h, 32h, 1, 0, 0A0h, 0Ch dup(0)
                 db 0C0h, 2 dup(0), 20h, 2, 1Ah dup(0), 2Eh, 74h, 65h, 78h
                 db 74h, 3 dup(0), 0A0h, 0ADh, 3 dup(0), 10h, 3 dup(0)
                 db 0AEh, 3 dup(0), 4, 0Eh dup(0), 20h, 2 dup(0), 60h, 2Eh
                 db 72h, 64h, 61h, 74h, 61h, 2 dup(0), 76h, 87h, 3 dup(0)
                 db 0C0h, 3 dup(0), 88h, 3 dup(0), 0B2h, 0Eh dup(0), 40h
                 db 2 dup(0), 40h, 2Eh, 64h, 61h, 74h, 61h, 3 dup(0), 0A0h
                 db 1Ah, 3 dup(0), 50h, 1, 2 dup(0), 0Ah, 3 dup(0), 3Ah
                 db 1, 0Dh dup(0), 40h, 2 dup(0), 0C0h, 2Eh, 70h, 64h, 61h
                 db 74h, 61h, 2 dup(0), 0C0h, 0Ch, 3 dup(0), 70h, 1, 2 dup(0)
                 db 0Eh, 3 dup(0), 44h, 1, 0Dh dup(0), 40h, 2 dup(0), 40h
                 db 2Eh, 72h, 65h, 6Ch, 6Fh, 63h, 2 dup(0), 4, 6, 3 dup(0)
                 db 80h, 1, 2 dup(0), 8, 3 dup(0), 52h, 1, 0Dh dup(0), 40h
                 db 2 dup(0), 42h, 138h dup(0), 48h, 83h, 0ECh, 48h, 0C7h
                 db 44h, 24h, 28h, 4 dup(0), 0C7h, 44h, 2 dup(24h), 1, 3 dup(0)
                 db 0C7h, 44h, 24h, 20h, 0, 3Ch, 2 dup(0), 48h, 63h, 44h
                 db 24h, 20h, 48h, 8Bh, 0C8h, 0E8h, 0B3h, 14h, 2 dup(0)
                 db 48h, 89h, 44h, 24h, 30h, 83h, 7Ch, 2 dup(24h), 1, 74h
                 db 0E7h, 33h, 0C0h, 48h, 83h, 0C4h, 48h, 0C3h, 4 dup(0CCh)
                 db 40h, 53h, 48h, 83h, 0ECh, 20h, 0B9h, 1, 3 dup(0), 0E8h
                 db 28h, 16h, 2 dup(0), 0E8h, 0DFh, 5, 2 dup(0), 8Bh, 0C8h
                 db 0E8h, 84h, 21h, 2 dup(0), 0E8h, 4Fh, 23h, 2 dup(0)
                 db 48h, 8Bh, 0D8h, 0E8h, 0D7h, 5, 2 dup(0), 0B9h, 1, 3 dup(0)
                 db 89h, 3, 0E8h, 0D7h, 2, 2 dup(0), 84h, 0C0h, 74h, 6Ch
                 db 0E8h, 0Ah, 8, 2 dup(0), 48h, 8Dh, 0Dh, 5Bh, 8, 2 dup(0)
                 db 0E8h, 0DEh, 4, 2 dup(0), 0E8h, 9Dh, 5, 2 dup(0), 8Bh
  seg000        ends


                 end start
