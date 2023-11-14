         BR main
result: .WORD 0x0000
num1: .BLOCK 2
num2: .BLOCK 2
num3: .BLOCK 2

main:    DECI num1, d
         LDWA num1, d 
         DECI num2, d
         ADDA num2, d
         DECI num3, d
         SUBA num3, d
         
         STWA result, d
         DECO result, d
         STOP
.END