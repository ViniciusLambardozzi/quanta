package com.tan90.quanta;

import com.tan90.quanta.lib.LibKeywords;
import com.tan90.quanta.lib.LibOpcodes;
import com.tan90.quanta.lib.LibSymbols;

public class Assembler
{
    public String Assemble(String Input)
    {
        String[] Lines = Input.split("\n");

        String Result = "";

        for(String Line : Lines)
        {
            if(Line.startsWith("#") || Line.equals(""))
            {
                continue;
            }

            Result += ParseLine(Line);
            Result += "\n";
        }

        return Result;
    }

    private String ParseLine(String Line)
    {
        String[] LineComponents = Line.split(" ");

        System.out.println(Line);

        String Opcode = "";

        switch(LineComponents[0])
        {
            case LibKeywords.Default.LOAD_IMMEDIATE:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.LOAD_IMMEDIATE), 8);

                LineComponents[1] = GetRegisterAddress(LineComponents[1]);
                Opcode += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[1])), 5);

                Opcode += "000";

                LineComponents[2] = LineComponents[2].replace(";", "");
                Opcode += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[2])) ,16);
                break;
            case LibKeywords.Default.LOAD_DIRECT:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.LOAD_DIRECT), 8);

                LineComponents[1] = GetRegisterAddress(LineComponents[1]);
                Opcode += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[1])), 5);

                Opcode += "000";

                LineComponents[2] = LineComponents[2].replace(";", "");
                Opcode += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[2])) ,16);
                break;
            case LibKeywords.Default.STORE_DIRECT:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.STORE_DIRECT), 8);

                LineComponents[1] = GetRegisterAddress(LineComponents[1]);
                Opcode += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[1])), 5);

                Opcode += "000";

                LineComponents[2] = LineComponents[2].replace(";", "");
                Opcode += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[2])) ,16);
                break;
            case LibKeywords.Default.ADD:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.ADD), 8);
                Opcode += GetDoubleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.MOVE:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.MOVE), 8);
                Opcode += GetDoubleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.SUB:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.SUB), 8);
                Opcode += GetDoubleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.AND:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.AND), 8);
                Opcode += GetDoubleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.OR:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.OR), 8);
                Opcode += GetDoubleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.XOR:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.XOR), 8);
                Opcode += GetDoubleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.XNOR:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.XNOR), 8);
                Opcode += GetDoubleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.JUMP:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.JUMP), 8);
                Opcode += GetSingleRegisterArgs(LineComponents);
                break;
            case LibKeywords.Default.JUMP_EQUALS:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.JUMP_EQUALS), 8);
                Opcode += GetTripleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.JUMP_NOT_EQUALS:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.JUMP_NOT_EQUALS), 8);
                Opcode += GetTripleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.JUMP_LESSER_THEN:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.JUMP_LESSER_THEN), 8);
                Opcode += GetTripleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.JUMP_GREATER_THEN:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.JUMP_GREATER_THEN), 8);
                Opcode += GetTripleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.JUMP_AND_LINK:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.JUMP_AND_LINK), 8);
                GetSingleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.LOGICAL_SHIFT_LEFT:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.LOGICAL_SHIFT_LEFT), 8);
                Opcode += GetSingleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.LOGICAL_SHIFT_RIGHT:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.LOGICAL_SHIFT_RIGHT), 8);
                Opcode += GetSingleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.ARITHMETICAL_SHIFT_LEFT:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.ARITHMETICAL_SHIFT_LEFT), 8);
                Opcode += GetSingleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.ARITHMETICAL_SHIFT_RIGHT:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.ARITHMETICAL_SHIFT_RIGHT), 8);
                Opcode += GetSingleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.ROTATE_LEFT:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.ROTATE_LEFT), 8);
                Opcode += GetSingleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.ROTATE_RIGHT:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.ROTATE_RIGHT), 8);
                Opcode += GetSingleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.LOAD_INDIRECT:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.LOAD_INDIRECT), 8);
                Opcode += GetDoubleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.STORE_INDIRECT:
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.STORE_INDIRECT), 8);
                Opcode += GetDoubleRegisterArgs(LineComponents);

                break;
        }

        System.out.println(Opcode);
        System.out.println();

        return Opcode;
    }

    public static String FillBinaryString(String Binary, int Size)
    {
        return FillBinaryString(Binary, Size, true);
    }
    public static String FillBinaryString(String Binary, int Size, boolean Top)
    {
        int Length = Binary.length();
        if(Binary.length() < Size)
        {
            for(int i = 0; i < Size - Length; i++)
            {
                Binary = (Top ? "0" : "") + Binary + (Top ? "" : "0");
            }
        }

        return Binary;
    }

    private String GetRegisterAddress(String Address)
    {
        Address = Address.replace(LibSymbols.REGISTER_PREFIX, "");
        Address = Address.replace(",", "");
        Address = Address.replace(";", "");

        return Address;
    }

    private String GetSingleRegisterArgs(String[] LineComponents)
    {
        String Args = "";

        LineComponents[1] = GetRegisterAddress(LineComponents[1]);
        Args += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[1])), 5);

        Args = FillBinaryString(Args, 32 - 8, false);

        return Args;

    }

    private String GetDoubleRegisterArgs(String[] LineComponents)
    {
        String Args = "";

        LineComponents[1] = GetRegisterAddress(LineComponents[1]);
        Args += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[1])), 5);

        LineComponents[2] = GetRegisterAddress(LineComponents[2]);
        Args += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[2])), 5);

        Args = FillBinaryString(Args, 32 - 8, false);

        return Args;
    }

    private String GetTripleRegisterArgs(String[] LineComponents)
    {
        String Args = "";

        LineComponents[1] = GetRegisterAddress(LineComponents[1]);
        Args += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[1])), 5);

        LineComponents[2] = GetRegisterAddress(LineComponents[2]);
        Args += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[2])), 5);

        LineComponents[3] = GetRegisterAddress(LineComponents[3]);
        Args += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[3])), 5);

        Args = FillBinaryString(Args, 32 - 8, false);

        return Args;
    }
}
