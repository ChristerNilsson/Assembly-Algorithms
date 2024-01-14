// https://cpulator.01xz.net/?sys=arm-de1soc
// https://github.com/LaurieWired/Assembly-Algorithms/blob/main/Fibonacci/fib.s

.global _start
//.section .data
//.section .text

fibonacci:
    push {lr} 

    // Base case: if n <= 1, return n
    cmp r0, #1
    ble end_fib

    // Recursive case: return fib(n - 1) + fib(n - 2); 
    push {r0}              // Save the current value of n
    sub r0, r0, #1
    bl fibonacci           // Recursive call fibonacci(n - 1)

    pop {r1}               // Restore the original n
    push {r0}              // Save fibonacci(n - 1)
    sub r1, r1, #2
    mov r0, r1
    bl fibonacci           // Recursive call fibonacci(n - 2)
    pop {r1}               // Get fibonacci(n - 1)

    add r0, r0, r1         // Add fibonacci(n - 1) + fibonacci(n - 2)
	
end_fib:
    pop {pc}

_start:
    push {r4-r7, lr}

	mov r0, #20 @ n
    mov r4, r0
    
    mov r0, r4             // Calculate the nth Fibonacci number
    bl fibonacci

exit:
    mov r0, #0
    pop {r4-r7, pc}


.section .note.GNU-stack
