package com.tan90.quanta;

import sun.awt.SunHints;

public class MifParser
{
    private static final String MifHeader = "WIDTH=32;\n" + "DEPTH=1024;\n" + "\n" + "ADDRESS_RADIX=BIN;\n" + "DATA_RADIX=BIN;\n" + "\n" + "CONTENT BEGIN\n";
    private static final String MifFooter = "\nEND;\n";

    public static String MifFileString(String Input)
    {
        return MifFileString(Input, true);
    }

    public static String MifFileString(String Input, boolean EvenLines)
    {
        String Result = "";
        Result += MifHeader;
        int Index = 0;
        if(EvenLines)
        {
            Result += "\t0000000000 : 00000000000000000000000000000000;\n";
            Index++;
        }

        String[] Values = Input.split("\n");


        for(String Line : Values)
        {
            String BinaryIndex = Assembler.FillBinaryString(Integer.toBinaryString(Index), 10);

            Result += "\t" + BinaryIndex + " : ";
            Result += Line;
            Result += ";\n";
            ++Index;
        }

        Result += MifFooter;

        return Result;
    }
}
