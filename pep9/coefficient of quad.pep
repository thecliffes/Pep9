         BR main
a: .BLOCK 2
b: .BLOCK 2
c: .BLOCK 2
nn: .BLOCK 2
TotalI: .BLOCK 2
TotalII: .Block 2
total: .BLOCK 2
TotalLOL: .BLOCK 2
n: .BLOCK 2
n2: .BLOCK 2
nCons: .BLOCK 2
counter: .BLOCK 2
msga: .ASCII "Enter a decimal value for a: \x00"  ;messages to be used for formatting output
msgb: .ASCII "Enter a decimal value for b: \x00"
msgc: .ASCII "Enter a decimal value for c: \x00"
msgn: .ASCII "Enter a decimal value for n: \x00"
msgterm: .ASCII "Term \x00"
msgcolon: .ASCII ": \x00"


main:    STRO msga,d         ;Gives input message 
         DECI a,d            ;accepts input from user
         STRO msgb,d
         DECI b,d
         STRO msgc,d
         DECI c,d
         STRO msgn,d
         DECI nn,d
         STRO line,d         ;creates new line for output
         LDWA counter,d      ;sets up counter for 4 terms
         ADDA 0x0005,i
         STWA counter,d

loop:    LDWA n,d            ;starts with terms 1 to 4
         ADDA 0x0001,i
         STWA n,d
         SUBA counter,d
         BREQ done
         BR axn2             ;branches to a x n^2
         BR bxn              ;branches to b x n
         BR loop

bxn:     LDWA n,d
         STWA nCons,d        ;sets up a variable to be decremented 
         LDWA TotalII,d      ;clears total variable from last loop
         SUBA TotalII,d
         STWA TotalII,d
bb:      LDWA TotalII,d      ;sets up total variable to be added to
         ADDA b,d            ;adds b variable to total
         STWA TotalII,d
         LDWA nCons,d        ;checks if branch has looped enough
         SUBA 0x0001,i
         STWA nCons,d
         BREQ out            ;branches to output if loop is done
         BR bb               ;loops back  

axn2:    LDWA n,d            ;starts process for a x n^2
         STWA nCons,d        ;sets n value to be decremented
         BR nSqred           ;sqaures n value to be used
bg:      LDWA TotalI,d
         SUBA TotalI,d
         STWA TotalI,d
nback:   LDWA TotalI,d
         ADDA a,d            ;adds a to total
         STWA TotalI,d
         LDWA n2,d           ;checks if loop can finish
         SUBA 0x0001,i
         STWA n2,d
         BREQ bxn            ;branches to bxn
         BR nback

out:     LDWA TotalI,d       ;loads one of totals
         ADDA TotalII,d      ;adds total onto other total
         STWA total,d
         LDWA total,d
         ADDA c,d            ;adds c onto both other totals
         STWA total,d
         STRO msgterm,d      ;formatting
         DECO n,d
         STRO msgcolon,d
         DECO total,d        ;outputs total value for current term
         STRO line,d
         BR loop


nSqred:  LDWA n2,d           ;squares n value
         ADDA n,d
         STWA n2,d
         LDWA nCons,d
         SUBA 0x0001,i
         BREQ bg             ;checks if final squared valeu is reached
         STWA nCons,d
         BR nSqred 

nSqred2: LDWA n2,d           ;sqaures n value for final term
         ADDA nn,d
         STWA n2,d
         LDWA nCons,d
         SUBA 0x0001,i
         BREQ gb
         STWA nCons,d
         BR nSqred2 

finale:  LDWA nn,d           ;final term
         STWA nCons,d        ;sets n value to be decremented
         BR nSqred2          ;sqaures n 
gb:      LDWA TotalI,d       ;resets total
         SUBA TotalI,d
         STWA TotalI,d
backn:   LDWA TotalI,d
         ADDA a,d            ;adds a to total
         STWA TotalI,d
         LDWA n2,d
         SUBA 0x0001,i
         STWA n2,d
         BREQ nxb            ;if loop is finished branch to nxb
         BR backn
nxb:     LDWA nn,d           
         STWA nCons,d        ;sets n value to be decremented
         LDWA TotalII,d      ;resets total
         SUBA TotalII,d
         STWA TotalII,d
hurb:    LDWA TotalII,d 
         ADDA b,d            ;adds b to total
         STWA TotalII,d
         LDWA nCons,d
         SUBA 0x0001,i
         STWA nCons,d
         BREQ tuo            ;if loop is finished loop to tuo
         BR hurb

done:    BR finale
tuo:     STRO line,d         ;formatting for output
         STRO msgterm,d
         DECO nn,d
         STRO msgcolon,d
         LDWA TotalI,d       ;adds up totals from program
         ADDA TotalII,d
         STWA TotalLOL,d
         LDWA TotalLOL,d
         ADDA c,d 
         STWA TotalLOL,d
         DECO TotalLOL,d     ;outputs total for final term
         STOP

line: .ASCII "\n"            ;creates a new line

.END
