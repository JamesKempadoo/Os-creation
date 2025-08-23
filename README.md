# Os-creation


org - Tells the assembler where we expect our code to be loaded. the assembler uses this information to calculate label addresses


Directive
    - Gives  a clue to the assembler that will affect how the program gets compiled. Not translate to machine code.
    - Assembler specific - different assemblers might have different directives

Instruction
    - Translated to a machine code instruction that the CPU will execute



x86 CPU registers

    General purpose registers - any use 
        - index registers [[[[BPL]BP]EBP]RBP]    (keeping indices and pointers)

    Program counter is a special register, which keeps track of which memory location the current instruction begins
        - [[[IP]EIP]RIP]  (Status registers) 
        - flags register contains special flags trigger by special instructions

    Segement registers keep track of the current memory segments

Memory segmentation

0x1234:0x5678
segment:offset

Each segment contains 64kb of memory where each byte of memory can be found using the offset value
Each segment overlaps every 16 bytes

you can convert a segment offset address to an absolute segment by:
    real_address = segment * 16 + offset

This means there are multiple ways of address locations in memory 
    segment:offset   ->  real address
    0x0000:07C00            0x7C00

Memory segmentation 
CS - currently running code segment
DS - data segment 
SS - stack segment
ES, FS, GS - Extra (data) segment


How to reference a memory location

segment: [base + index * scale + displacement]
segment: CS, DS, ES, FS, GS, SS (DS if unspecified) 
base: 
    - (16 bits) BP/BX
    - (32/64 bits) any general purpose register
index: 
    - (16 bits) SI/DI
    - (32/64 bits) any general purpose register
scale: (32/64 bits) 1, 2, 4 or 8 
displacement: a (signed) constant value

Note : db byte, 8 bits, dw word 16 bits, dd double word 32 bits

example 

var: dw 100 <- index ds will be used
    mov ax, var        ;copy offset to ax
    mov ax, [var]      ;copy memory contents [base register]

example 2

array: dw 100, 200, 300
    mov bx, array       ; copy offset to ax
    mov si, 2 * 2       ; array[2], words are 2 bytes wide
    mov ax, [bx + si]   ; copy memory contents   [base register + index register]

Note: AX (Accumulator register): Primarily used in arithmetic, logic, and data transfer operations. 
It is favored by instructions that perform multiplication 
and division, and by string load and store operations. BX (Base register): Base pointer for memory access.

------------------------------------------------------------------------------------------------------------------------

Interupts
A signal which makes the processor stop what its doing, in order to handle that signal
Can be triggered by:
    1. An exception (e.g diving by 0)
    2. Hardware (e.g keyboard key pressed)
    3. Software., through the INT instruction

Examples of BIOS Interruptions
INT 10h -- Videos
    AH = 0Eh -- Write Character in TTY mode
INT 11h -- Equipment Check
INT 12h -- memory size
INT 13h -- Disk I/O
INT 14h -- Serial communications
INT 15h -- Cassette
INT 16h -- Keyboard I/O


BIOS INT 10h, AH = 0Eh

AH = 0E
AL = ASCII character to write
BH = page number (text modes)
BL = foreground pixel color (graphics mode)

returns nothing 

- cursor advances after write 
- character BEL (7), BS (8), LF( (A), and CR (D) are treated as control codes