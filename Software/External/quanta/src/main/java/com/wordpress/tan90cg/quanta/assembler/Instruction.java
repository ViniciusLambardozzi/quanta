package com.wordpress.tan90cg.quanta.assembler;

import com.wordpress.tan90cg.quanta.exception.InvalidDataSizeException;
import com.wordpress.tan90cg.quanta.memoryfile.MemoryFileDataRadix;
import com.wordpress.tan90cg.quanta.util.NumericUtil;
import org.jetbrains.annotations.Contract;

import java.util.ArrayList;
import java.util.List;

/**
 * File created @[5/5/2017]
 */
public class Instruction
{
    private int size;
    private List<InstructionData> data;

    public Instruction(int size)
    {
        this.size = size;
        data = new ArrayList<>();
    }

    public Instruction(int size, List<InstructionData> data)
    {
        this(size);
        this.data.addAll(data);
    }

    public void addInstructionData(InstructionData data)
    {
        this.data.add(data);
    }

    public String getInstructionCode(MemoryFileDataRadix radix) throws InvalidDataSizeException
    {
        String code = "";

        for(InstructionData instructionData : data)
        {
            code += NumericUtil.getMemoryFileDataString(instructionData.getData(), instructionData.getType().getSize(), radix);
        }

        int codeLength = code.length();
        if(codeLength < size)
        {
            for(int i = 0; i < size - codeLength; i++)
            {
                code = code + '0';
            }
        }

        return code;
    }

    private boolean validate()
    {
        return true;
    }
}
