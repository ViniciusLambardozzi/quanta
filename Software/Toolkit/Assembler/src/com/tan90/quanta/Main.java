package com.tan90.quanta;

import com.tan90.quanta.util.FileUtil;

import java.io.IOException;

public class Main
{
    public static void main(String[] args) throws IOException
    {
        Assembler Parser = new Assembler();
        String Input = FileUtil.ReadFile("src/Source.qtf");

        System.out.println(MifParser.MifFileString(Parser.Assemble(Input)));
    }
}
