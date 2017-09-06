package com.wordpress.tan90cg.quanta.assembler;

import com.wordpress.tan90cg.quanta.localization.Locale;

import java.util.ArrayList;
import java.util.List;

/**
 * File created @[5/12/2017]
 */
public class Parser
{
    private Locale parserLocale;

    public Parser(Locale parserLocale)
    {
        this.parserLocale = parserLocale;
    }

    Program parseFile(String path)
    {
        return null;
    }

    private List<Instruction> parseLabelSection(String[] Section)
    {
        List<Instruction> instructions = new ArrayList<>(Section.length);



        return instructions;
    }

    private Instruction parseInstructionLine(String line)
    {
        Instruction instruction = new Instruction(32);

        String[] splitLine = line.split(" ");

        return instruction;
    }
}
