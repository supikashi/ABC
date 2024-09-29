.data	
	input_dividend: .asciz "Enter the dividend: "
	input_divisor: .asciz "Enter the divisor:  "
	division_by_zero_string: .asciz "Error: division by zero"
	output_quotient: .asciz "Quotient: "
	output_remainder: .asciz "Remainder: "
.text
main:
	la 	a0, input_dividend
    	li 	a7, 4 
    	ecall
	li 	a7, 5
	ecall
	mv   	t0, a0
	la 	a0, input_divisor
    	li 	a7, 4 
    	ecall
	li 	a7, 5
	ecall
	mv   	t1, a0
	beqz 	t1, division_by_zero
	li 	t2, 1	# Хранит знак результат (частного)
	li 	t3, 1	# Хранит знак остатка
if_1:
	bgez 	t0, if_1_end
	neg 	t3, t3
	neg 	t2, t2
	neg 	t0, t0
if_1_end:
if_2:
	bgtz 	t1, if_2_end
	neg 	t2, t2
	neg 	t1, t1
if_2_end:
	li 	t4, 0
	li 	t5, 1
while:
	blt 	t0, t1, end_while
	neg 	t1, t1
	add 	t0, t0, t1
	neg 	t1, t1
	add 	t4, t4, t5
	j 	while
end_while:
if_3:	
	bgtz 	t2, if_3_end
	neg 	t4, t4
if_3_end:	
if_4:
	bgtz 	t3, if_4_end
	neg 	t0, t0
if_4_end:
	la 	a0, output_quotient
    	li 	a7, 4 
    	ecall
	li 	a7, 1
	mv 	a0, t4
	ecall
	li 	a7, 11
	li 	a0, 10
	ecall
	la 	a0, output_remainder
    	li 	a7, 4 
    	ecall
	li 	a7, 1
	mv 	a0, t0
	ecall
	j 	end
	
	
division_by_zero:
	la 	a0, division_by_zero_string
    	li 	a7, 4
    	ecall
    	j 	end
end:
	li      a7 10
        ecall
