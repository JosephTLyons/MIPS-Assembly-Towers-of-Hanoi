# Title: Programming Project Part 3		#Filename: TowersOfHanoi.asm
# Author: Joseph Lyons				#Date: February 22th, 2017
# Description: Displays the moves needed to solve the puzzle of the towers of Hanoi
# Input: Number of rings
# Output: Steps for solving the problem
################# Data segment #####################
.data

requestInput: .asciiz "Enter number of disks: "
moveDisk:     .asciiz "Move disk "
fromPeg:      .asciiz " from peg "
toPeg:        .asciiz " to peg "
newline:      .asciiz "\n"
################# Code segment #####################
.text
.globl main

# Variable Key:
# $a0 = n
# $a1 = start  (1)
# $a2 = finish (2)
# $a3 = extra  (3)

main:
       li   $v0, 4            # Load number for system call for printing string
       la   $a0, requestInput # Load string
       syscall
    
       li   $v0, 5            # Load number for system call for reading number in
       syscall
    
       addi $a0, $v0,   0     # Put user number in $a0
       addi $a1, $zero, 1     # Put 1 in $a1
       addi $a2, $zero, 2     # Put 2 in $a2
       addi $a3, $zero, 3     # Put 3 in $a3
    
       jal  hanoi
       j    Leave

hanoi: addi $sp, $sp,  -20    # Make room in stack
       sw   $ra, 16($sp)      # Store returning address
       sw   $a0, 12($sp)      # Store n
       sw   $a1, 8($sp)
       sw   $a2, 4($sp)
       sw   $a3, 0($sp)

       slti $t0, $a0,   1     # Test base case
       beq  $t0, $zero, Skip
       addi $sp, $sp,   20
       jr   $ra  

Skip:  addi $a0, $a0, -1      # Decrement n

       add  $t0, $a2, $zero   # Temp holder for $a1 for swapping proceedure next
       add  $a2, $a3, $zero   # Put 3 in $a2
       add  $a3, $t0, $zero   # Put 2 in $a3
       jal  hanoi
       
       lw   $a3, 0($sp)    
       lw   $a2, 4($sp)                  
       lw   $a1, 8($sp)                  
       lw   $a0, 12($sp)       # Load n
       lw   $ra, 16($sp)       # Load returning address
       addi $sp, $sp, 20      # Adjust stack pointer
       
       
       ########
       #Code for printing and dispaying numbers
       
       add  $t0, $a0, $zero   # Back up n temporarily
       
       li   $v0, 4            # Load number for system call for printing string
       la   $a0, moveDisk     # Load string
       syscall
    
       li   $v0, 1            # Load number for system call for print number
       add  $a0, $t0, $zero   # Move $a0 for printing
       syscall
       
       li   $v0, 4            # Load number for system call for printing string
       la   $a0, fromPeg      # Load string
       syscall
    
       li   $v0, 1            # Load number for system call for print number
       add  $a0, $zero, $a1   # Move $a1 for printing
       syscall
       
       li   $v0, 4            # Load number for system call for printing string
       la   $a0, toPeg        # Load string
       syscall
    
       li   $v0, 1            # Load number for system call for print number
       add  $a0, $zero, $a2   # Move $a2 for printing
       syscall
       
       li   $v0, 4            # Load number for system call for printing string
       la   $a0, newline      # Load string
       syscall
       
       #########
       
       add  $a0, $t0, $zero   # recover n
       
       
       addi $a0, $a0, -1      # Decrement n
       
       add  $t0, $a1, $zero   # Temp holder for $a1 for swapping proceedure next
       add  $a1, $a3, $zero   # Put 3 in $a1
       add  $a2, $a2, $zero   # Put 2 in $a2
       add  $a3, $t0, $zero   # Put 1 in $a3
       j    hanoi
       
       jr   $ra


Leave:

      ### Double check that I'm using good register conventions
      ### Clean up commments and whitespace, remove ###s
      ### Fix output bug
      
