        NAME    main
        
        PUBLIC  __iar_program_start
        
        SECTION .intvec : CODE (2)
        THUMB
        
__iar_program_start
        B       main

        
        SECTION .text : CODE (2)
        THUMB
     
main
        NOP
        
        MOV r1, #5
        BL factorial
        
        MOV r0, r1
        B end

factorial
        PUSH {LR}
        PUSH {r2}
        
        MOV r2, r1
     
        CMP r1, #0
        BNE notZero
        MOV r1, #1
        B factorialEnd
        
notZero
        SUB r1, r1, #1
        BL factorial
        
        MUL r1, r1, r2
 
factorialEnd
        POP {r2}
        POP {LR}
        BX LR

end
        NOP
        END