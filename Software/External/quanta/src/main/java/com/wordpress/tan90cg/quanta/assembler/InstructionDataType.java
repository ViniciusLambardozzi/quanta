package com.wordpress.tan90cg.quanta.assembler;

import com.wordpress.tan90cg.quanta.lib.LibInstruction;

/**
 * File created @[5/5/2017]
 */
public enum InstructionDataType
{
    OPCODE(LibInstruction.OPCODE_SIZE),
    ADDRESS(LibInstruction.ADDRESS_SIZE),
    DATA(LibInstruction.DATA_SIZE);

    private int size;

    InstructionDataType(int size)
    {
        this.size = size;
    }

    public int getSize()
    {
        return size;
    }
}
