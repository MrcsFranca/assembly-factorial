.data
	quebraLinha: .asciiz "\n"

.text
	j main
	
	fatorial:
		li $s1, 1
		li $s2, 0
		for:
		beq $s2, $s0, continua
			mul $s3, $s1, $s2
			add $s1, $s1, $s3
			addi $s2, $s2, 1
		j for
		continua:
			jr $ra
		
	
	ordenacao:
		move $t3, $t0
		move $t4, $t1
		move $t5, $t2
	
		li $s1, 0
	
		bubbleSort:
			bgt $t5, $t3, ord1
			j keepGoing
	
			ord1:
				move $t6, $t5 #t6 eh o aux
				move $t5, $t3 
				move $t3, $t6 
			keepGoing:
	
			bgt $t5, $t4, ord2
			j keepGoing2
	
			ord2:
				move $t6, $t5 #t6 eh o aux
				move $t5, $t4 
				move $t4, $t6 
			keepGoing2:
			
			bgt $t4, $t3, ord3
			j keepGoing3
			
			ord3:
				move $t6, $t4
				move $t4, $t3
				move $t3, $t6
			keepGoing3:
			
	
		addi $s1, $s1, 1
		beq $s1, 2, bubbleSort
		jr $ra
		
		
	
	main:
		#leitura de num
		while1:
			li $v0, 5
			syscall
			move $t0, $v0
		bltz $t0, while1
		move $s0, $t0
		jal fatorial
		move $t0, $s1
		
	
		while2:
			li $v0, 5
			syscall
			move $t1, $v0
		blt $t1, 0, while2
		move $s0, $t1
		jal fatorial
		move $t1, $s1
	
	
		while3:
			li $v0, 5
			syscall
			move $t2, $v0
		blt $t2, 0, while3
		move $s0, $t2
		jal fatorial
		move $t2, $s1
	
		
		jal ordenacao
		
		li $v0, 1
		move $a0, $t3
		syscall
		
		li $v0, 4
		la $a0, quebraLinha
		syscall
		
		li $v0, 1
		move $a0, $t4
		syscall
		
		li $v0, 4
		la $a0, quebraLinha
		syscall
		
		li $v0, 1
		move $a0, $t5
		syscall