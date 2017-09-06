package com.wordpress.tan90cg.quanta;

import com.wordpress.tan90cg.quanta.assembler.Instruction;
import com.wordpress.tan90cg.quanta.assembler.InstructionData;
import com.wordpress.tan90cg.quanta.assembler.InstructionDataType;
import com.wordpress.tan90cg.quanta.assembler.Program;
import com.wordpress.tan90cg.quanta.localization.Locale;
import com.wordpress.tan90cg.quanta.memoryfile.MemoryFile;
import com.wordpress.tan90cg.quanta.memoryfile.MemoryFileAddressRadix;
import com.wordpress.tan90cg.quanta.memoryfile.MemoryFileDataRadix;
import com.wordpress.tan90cg.quanta.util.NumericUtil;

import java.io.IOException;

/**
 * File created @[5/5/2017]
 */
public class Quanta
{
    public static void main(String[] args) throws Exception
    {
        Instruction instruction = new Instruction(32);
        instruction.addInstructionData(new InstructionData(InstructionDataType.OPCODE, 1));
        instruction.addInstructionData(new InstructionData(InstructionDataType.ADDRESS, 0));
        instruction.addInstructionData(new InstructionData(InstructionDataType.ADDRESS, 1));

        Program program = new Program(0);
        program.addInstruction(instruction);
        program.addInstruction(instruction);
        program.addInstruction(instruction);
        program.addInstruction(instruction);
        program.addInstruction(instruction);

        MemoryFile file = program.getMemoryFile(MemoryFileAddressRadix.BIN, MemoryFileDataRadix.BIN);
        file.writeToFile("mem.mif");


        System.out.println(file);

        //System.out.println(instruction.getInstructionCode(MemoryFileDataRadix.BIN));
    }
}
