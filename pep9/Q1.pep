         BR main
num1: .BLOCK 2
msg: .ASCII "Enter a decimal number: \x00"

main:    STRO msg, d         ;format
         DECI num1, d        ;input for number
         DECO num1, d        ;outputs number
         STRO line, d
         BRLT negLoop        ;loops depending on input
         BRGT posLoop

negLoop: LDWA num1, d
         BREQ done
         ADDA 0x0001, i      ;adds 1 until num1 is 0
         STWA num1, d
         DECO num1, d        ;output num1
         STRO line, d
         BR negLoop

posLoop: LDWA num1, d
         BREQ done
         SUBA 0x0001, i      ;subs 1 until 0
         STWA num1, d
         DECO num1, d        ;output num1
         STRO line, d
         BR posLoop

done:    STOP
        

line:    .ASCII "\n"
         


.END