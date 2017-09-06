package com.wordpress.tan90cg.quanta.assembler;

import com.wordpress.tan90cg.quanta.exception.InvalidDataSizeException;
import com.wordpress.tan90cg.quanta.memoryfile.MemoryFile;
import com.wordpress.tan90cg.quanta.memoryfile.MemoryFileAddressRadix;
import com.wordpress.tan90cg.quanta.memoryfile.MemoryFileDataRadix;
import com.wordpress.tan90cg.quanta.util.NumericUtil;
import jdk.net.SocketFlow;

import java.util.ArrayList;
import java.util.List;

/**
 * File created @[5/8/2017]
 */

public class Program
{
    private int startAddress;
    private List<Instruction> instructions;

    public Program(int startAddress, List<Instruction> instructions)
    {
        this.startAddress = startAddress;
        this.instructions = instructions;
    }

    public Program(int startAddress)
    {
        this(startAddress, new ArrayList<>());
    }

    public void addInstruction(Instruction instruction)
    {
        instructions.add(instruction);
    }

    public MemoryFile getMemoryFile(MemoryFileAddressRadix addressRadix, MemoryFileDataRadix dataRadix)
    {
        MemoryFile file = new MemoryFile(addressRadix, dataRadix, 1024, startAddress);

        for(Instruction currentInstruction : instructions)
        {
            try
            {
                file.addData(currentInstruction.getInstructionCode(dataRadix));
            } catch (InvalidDataSizeException e)
            {
                e.printStackTrace();
                System.exit(-1);
            }
        }

        return file;
    }
}
