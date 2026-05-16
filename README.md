 Door Lock System (EMU 8086)

Project Description:
This project is a simple money locker door lock system developed in EMU 8086 assembly language. It works like a security system that allows access only when the correct 4-digit password is entered.

Features:
- 4-digit password authentication
- 3 login attempts only
- System lock after failed attempts
- Simple loop and condition-based logic
- Beginner-friendly assembly program

How It Works:
1. User enters a 4-digit password
2. System compares it with stored password 
3. If correct, lock opens and access is granted
4. If wrong, attempts decrease
5. After 3 wrong attempts, system alarm is activated

Concepts Used:
- Loops for input handling
- Conditional statements (CMP, JE, JNE)
- Interrupts for input/output
- Basic memory handling

Tools Used:
- EMU 8086 Microprocessor Emulator
- Assembly Language (8086)

Output:
- LOCK OPENED and WELCOME OWNER on correct password
- WRONG PASSWORD message on incorrect entry
- SECURITY ALARM after 3 failed attempts

Conclusion:
This project demonstrates a basic security system using assembly language. It helps in understanding low-level programming concepts like loops, conditions, and interrupts in a simple and practical way.
