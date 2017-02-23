# Title: Programming Project Part 3		#Filename: TowersOfHanoi.asm
# Author: Joseph Lyons				#Date: February 22th, 2017
# Description: Displays the moves needed to solve the puzzle of the towers of Hanoi
# Input: Number of rings
# Output: Steps for solving the problem
################# Data segment #####################
.data

requestInput:  .asciiz "Enter number of disks: "
moveDisk:      .asciiz "Move disk "
fromPeg:       .asciiz " from peg "
toPeg:         .asciiz " to peg "
newline:       .asciiz "\n"
################# Code segment #####################
.text
.globl main

# Variable Key:
# $a0 = n
# $a1 = start
# $a2 = finish
# $a3 = extra
# $t0 = 0 or 1 in slti instruction in Hanoi function

main: # main program entry

       addi $v0, $zero, 4     # Load number for system call for printing string
       la   $a0, requestInput # Load string
       syscall
    
       addi $v0, $zero, 5     # Load number for system call for reading number in
       syscall
    
       addi $a0, $v0,   0     # Put user number in $a0
       addi $a1, $zero, 1
       addi $a2, $zero, 2
       addi $a3, $zero, 3
    
       j hanoi

hanoi: addi $sp, $sp, -8     # Make room in stack
       sw   $a0, 0($sp)       # Store n
       sw   $ra, 4($sp)      # Store returning address

       slti $t0, $a0, 1       # Test base case
       beq  $t0, $zero, Skip
       addi $sp, $sp, 8
       jr $ra  

Skip:  addi $a0, $a0, -1      # Decrement n
       jal hanoi              
       lw   $ra, 4($sp)      # Load returning address
       lw   $a0, 0($sp)       # Load n
       addi $sp, $sp, 8      # Make room in stack
       
       
       ########
       #Code for printing and dispaying numbers
       
       addi $v0, $zero, 4     # Load number for system call for printing string
       la   $a0, moveDisk     # Load string
       syscall
    
       addi $v0, $zero, 1     # Load number for system call for print number
       add  $a0, $zero, $a1   # Move $a0 for printing
       syscall
       
       addi $v0, $zero, 4     # Load number for system call for printing string
       la   $a0, fromPeg      # Load string
       syscall
    
       addi $v0, $zero, 1     # Load number for system call for print number
       add  $a0, $zero, $a2   # Move $a1 for printing
       syscall
       
       addi $v0, $zero, 4     # Load number for system call for printing string
       la   $a0, toPeg        # Load string
       syscall
    
       addi $v0, $zero, 1     # Load number for system call for print number
       add  $a0, $zero, $a3   # Move $a2 for printing
       syscall
       
       addi $v0, $zero, 4     # Load number for system call for printing string
       la   $a0, newline        # Load string
       syscall
       
       #########
       
       
       jr $ra


Leave:

      ### Double check that I'm using good register conventions
