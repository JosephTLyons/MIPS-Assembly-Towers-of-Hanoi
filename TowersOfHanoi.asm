# Title: Programming Project Part 3		#Filename: TowersOfHanoi.asm
# Author: Joseph Lyons				#Date: February 22th, 2017
# Description: Displays the moves needed to solve the puzzle of the towers of Hanoi
# Input: Number of rings
# Output: Steps for solving the problem
################# Data segment #####################
.data

requestInput:  .asciiz "Enter number of disks: "
moveDisk:      .asciiz "Move disk "
fromPeg:       .asciiz "From peg "
toPeg:         .asciiz "To peg "
newline:       .asciiz "\n"
################# Code segment #####################
.text
.globl main

# Variable Key:
# $a0 = n
# $a1 = start
# $a2 = finish
# $a3 = extra

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
    
       jal hanoi

hanoi: beq  $a0, $zero, Leave

       addi $sp, $sp, -16     # Make room for 4 arguments and return address
       sw   $a0, 0($sp)       # Store n
       sw   $a1, 4($sp)       # Store start
       sw   $a2, 8($sp)       # Store finish
       sw   $a3, 12($sp)      # Store extra
       sw   $ra, 16($sp)      # Store returning address

       addi $a0, $a0, -1      # Decrement n
       j hanoi              







Leave:

      ### Double check that I'm using good register conventions
