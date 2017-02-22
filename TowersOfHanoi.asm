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
# $s0 = n

main: # main program entry

    addi $v0, $zero, 4     # Load number for system call for printing string
    la   $a0, requestInput # Load string
    syscall
    
    addi $v0, $zero, 5     # Load number for system call for reading number in
    syscall
     
      ### Double check that I'm using good register conventions
