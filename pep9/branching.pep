         DECI num1, d
         BREQ zero
         BRLT less
         BRGT more

zero:    STRO eqmsg, d
         STOP
less:    STRO ltmsg, d
         STOP
more:    STRO gtmsg, d

num1: .BLOCK 2
eqmsg: .ASCII "Equal to zero\x00"
ltmsg: .ASCII "less than zero\x00"
gtmsg: .ASCII "greater than zero\x00"
.END