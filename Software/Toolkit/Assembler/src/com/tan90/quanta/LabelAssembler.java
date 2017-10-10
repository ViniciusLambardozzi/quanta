package com.tan90.quanta;

import com.sun.jndi.cosnaming.IiopUrl;
import com.tan90.quanta.exception.InvalidKeywordException;
import com.tan90.quanta.lib.LibKeywords;
import com.tan90.quanta.lib.LibOpcodes;
import com.tan90.quanta.lib.LibSymbols;
import com.tan90.quanta.util.FileUtil;
import org.omg.CORBA.Current;
import sun.reflect.annotation.ExceptionProxy;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class LabelAssembler
{
    public static String Assemble(String Input) throws Exception
    {
        String Result   = "";
        int CurrentLine = 1;
        Input = Input.replace("\t", "");
        String[] Program = Input.split("\n");

        Map<String, Integer> LabelAddresses;
        LabelAddresses = ParseLabelAddresses(Program);

        for(String Line : Program)
        {
            while (Line.startsWith(" "))
            {
                Line = Line.substring(1);
            }

            System.out.println(Line);

            if(!(Line.startsWith(LibSymbols.COMMENT_PREFIX) || Line.equals("") || Line.startsWith(LibSymbols.LABEL_PREFIX)))
            {
                String ParsedLine = ParseLine(Line, CurrentLine, LabelAddresses);
                Result += ParsedLine;

                System.out.println(ParsedLine);
                Result += "\n";
            }

            CurrentLine++;
        }

        return Result;
    }

    private static Map<String, Integer> ParseLabelAddresses(String[] Program)
    {
        Map<String, Integer> Addresses = new HashMap<>();

        int CurrentInstruction = 0;

        for(String Line : Program)
        {
            while (Line.startsWith(" "))
            {
                Line = Line.substring(1);
            }

            if(Line.startsWith(LibSymbols.COMMENT_PREFIX) || Line.equals(""))
            {
                // NOOP comment or empty line
            }else if(Line.startsWith(LibSymbols.LABEL_PREFIX))
            {
                String Label = Line.replace(LibSymbols.LABEL_PREFIX, "").replace(LibSymbols.LABEL_SUFFIX, "");

                Addresses.put(Label, CurrentInstruction);
            }else
            {
                if((Line.startsWith(LibKeywords.Default.JUMP              + " ") && (!Line.startsWith(LibKeywords.Default.JUMP + " " + LibSymbols.REGISTER_PREFIX            ))) ||
                   (Line.startsWith(LibKeywords.Default.JUMP_EQUALS       + " ") && ((Line.length() - Line.replace(LibSymbols.REGISTER_PREFIX, "").length() != 3 ))) ||
                   (Line.startsWith(LibKeywords.Default.JUMP_GREATER_THEN + " ") && ((Line.length() - Line.replace(LibSymbols.REGISTER_PREFIX, "").length() != 3 ))) ||
                   (Line.startsWith(LibKeywords.Default.JUMP_LESSER_THEN  + " ") && ((Line.length() - Line.replace(LibSymbols.REGISTER_PREFIX, "").length() != 3 ))) ||
                   (Line.startsWith(LibKeywords.Default.JUMP_NOT_EQUALS   + " ") && ((Line.length() - Line.replace(LibSymbols.REGISTER_PREFIX, "").length() != 3 ))) ||
                   (Line.startsWith(LibKeywords.Default.JUMP_AND_LINK     + " ")  ) )
                {
                    System.out.println("Double instruction line found: " + Line);
                    CurrentInstruction++;
                }
                CurrentInstruction++;
            }
        }

        return Addresses;
    }

    private static String ParseLine(String Line, int LineNumber, Map<String, Integer> LabelAddresses) throws Exception
    {
        String[] LineComponents = Line.split(" ");
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
                if(!LineComponents[1].startsWith(LibSymbols.REGISTER_PREFIX))
                {
                    // Label jump
                    // Write label address to register 31
                    // Jump to register 31

                    Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.LOAD_IMMEDIATE), 8);
                    Opcode += FillBinaryString(Integer.toBinaryString(Integer.parseInt(GetRegisterAddress("$31"))), 5);
                    Opcode += "000";
                    Opcode += FillBinaryString(Integer.toBinaryString(LabelAddresses.get(LineComponents[1])) ,16);
                    Opcode += "\n";
                    LineComponents[1] = "$31";
                }
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.JUMP), 8);
                Opcode += GetSingleRegisterArgs(LineComponents);
                break;

            case LibKeywords.Default.JUMP_AND_LINK:
                if(!LineComponents[1].startsWith(LibSymbols.REGISTER_PREFIX))
                {
                    // Label jump
                    // Write label address to register 31
                    // Jump to register 31

                    Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.LOAD_IMMEDIATE), 8);
                    Opcode += FillBinaryString(Integer.toBinaryString(Integer.parseInt(GetRegisterAddress("$31"))), 5);
                    Opcode += "000";
                    Opcode += FillBinaryString(Integer.toBinaryString(LabelAddresses.get(LineComponents[1])) ,16);
                    Opcode += "\n";
                    LineComponents[1] = "$31";
                }
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.JUMP_AND_LINK), 8);
                Opcode += GetSingleRegisterArgs(LineComponents);
                break;
            case LibKeywords.Default.JUMP_EQUALS:
                if(!LineComponents[3].startsWith(LibSymbols.REGISTER_PREFIX))
                {
                    // Label jump
                    // Write label address to register 31
                    // Jump to register 31

                    Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.LOAD_IMMEDIATE), 8);
                    Opcode += FillBinaryString(Integer.toBinaryString(Integer.parseInt(GetRegisterAddress("$31"))), 5);
                    Opcode += "000";
                    Opcode += FillBinaryString(Integer.toBinaryString(LabelAddresses.get(LineComponents[3])) ,16);
                    Opcode += "\n";
                    LineComponents[3] = "$31";
                }
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.JUMP_EQUALS), 8);
                Opcode += GetTripleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.JUMP_NOT_EQUALS:
                if(!LineComponents[3].startsWith(LibSymbols.REGISTER_PREFIX))
                {
                    // Label jump
                    // Write label address to register 31
                    // Jump to register 31

                    Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.LOAD_IMMEDIATE), 8);
                    Opcode += FillBinaryString(Integer.toBinaryString(Integer.parseInt(GetRegisterAddress("$31"))), 5);
                    Opcode += "000";
                    Opcode += FillBinaryString(Integer.toBinaryString(LabelAddresses.get(LineComponents[3])) ,16);
                    Opcode += "\n";
                    LineComponents[3] = "$31";
                }
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.JUMP_NOT_EQUALS), 8);
                Opcode += GetTripleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.JUMP_LESSER_THEN:
                if(!LineComponents[3].startsWith(LibSymbols.REGISTER_PREFIX))
                {
                    // Label jump
                    // Write label address to register 31
                    // Jump to register 31

                    Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.LOAD_IMMEDIATE), 8);
                    Opcode += FillBinaryString(Integer.toBinaryString(Integer.parseInt(GetRegisterAddress("$31"))), 5);
                    Opcode += "000";
                    Opcode += FillBinaryString(Integer.toBinaryString(LabelAddresses.get(LineComponents[3])) ,16);
                    Opcode += "\n";
                    LineComponents[3] = "$31";
                }
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.JUMP_LESSER_THEN), 8);
                Opcode += GetTripleRegisterArgs(LineComponents);

                break;
            case LibKeywords.Default.JUMP_GREATER_THEN:
                if(!LineComponents[3].startsWith(LibSymbols.REGISTER_PREFIX))
                {
                    // Label jump
                    // Write label address to register 31
                    // Jump to register 31

                    Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.LOAD_IMMEDIATE), 8);
                    Opcode += FillBinaryString(Integer.toBinaryString(Integer.parseInt(GetRegisterAddress("$31"))), 5);
                    Opcode += "000";
                    Opcode += FillBinaryString(Integer.toBinaryString(LabelAddresses.get(LineComponents[3])) ,16);
                    Opcode += "\n";
                    LineComponents[3] = "$31";
                }
                Opcode += FillBinaryString(Integer.toBinaryString(LibOpcodes.JUMP_GREATER_THEN), 8);
                Opcode += GetTripleRegisterArgs(LineComponents);

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

            default:
                throw new Exception("Invalid keyword at line: " + LineNumber);
        }

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

    private static String GetRegisterAddress(String Address)
    {
        Address = Address.replace(LibSymbols.REGISTER_PREFIX, "");
        Address = Address.replace(",", "");
        Address = Address.replace(";", "");

        return Address;
    }

    private static String GetSingleRegisterArgs(String[] LineComponents)
    {
        String Args = "";

        LineComponents[1] = GetRegisterAddress(LineComponents[1]);
        Args += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[1])), 5);

        Args = FillBinaryString(Args, 32 - 8, false);

        return Args;

    }

    private static String GetDoubleRegisterArgs(String[] LineComponents)
    {
        String Args = "";

        LineComponents[1] = GetRegisterAddress(LineComponents[1]);
        Args += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[1])), 5);

        LineComponents[2] = GetRegisterAddress(LineComponents[2]);
        Args += FillBinaryString(Integer.toBinaryString(Integer.parseInt(LineComponents[2])), 5);

        Args = FillBinaryString(Args, 32 - 8, false);

        return Args;
    }

    private static String GetTripleRegisterArgs(String[] LineComponents)
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

    public static void main(String[] args) throws Exception
    {
        String Input = FileUtil.ReadFile(args[0].substring(1) + ".qtf");
        String Program = LabelAssembler.Assemble(Input);
        FileUtil.WriteFile(args[1].substring(1) + ".mif", MifParser.MifFileString(Program, false));
    }
}
