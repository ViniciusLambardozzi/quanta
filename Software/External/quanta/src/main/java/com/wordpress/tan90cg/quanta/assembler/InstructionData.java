package com.wordpress.tan90cg.quanta.assembler;

/**
 * File created @[5/5/2017]
 */
public class InstructionData
{
    private InstructionDataType type;
    private int data;

    public InstructionData(InstructionDataType type, int data)
    {
        this.type = type;
        this.data = data;
    }

    public InstructionData(InstructionDataType type)
    {
        this(type, 0);
    }

    public int getData()
    {
        return data;
    }

    public InstructionDataType getType()
    {
        return type;
    }
}
