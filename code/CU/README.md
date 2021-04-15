# CU

Code to implement the CU

The CU generates signals:
- `writeEnable` to enable register writes for the instructions `addi` and `li`
- `pcVal` sign extended (to 8 bit) value of the jump offset
- `pcOverride` to add a the value of `pcVal` to current value of pc for the instruction `j` 