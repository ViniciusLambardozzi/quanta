package com.tan90.quanta;

import com.tan90.quanta.util.FileUtil;
import com.tan90.quanta.util.LengthComparator;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class CircuitConstants
{
    private String[] CircuitConstantsFile;
    private ArrayList<Opcode> Opcodes;
    private int AddressWidth;

    public CircuitConstants(String CircuitConstantsFile)
    {
        this.CircuitConstantsFile = CircuitConstantsFile.split(Constants.LINE_SEPARATOR);

        ParseFile();
    }

    public void ParseInstructions()
    {
        boolean Tagged = false;
        String ConstantKey;
        int Value;
        String AssemblerAlias;

        for(String Line : CircuitConstantsFile)
        {
            Line = FileUtil.RemoveIndentation(Line);
            if(Line.startsWith(Constants.ASSEMBLER_TAG))
            {
                Tagged = true;
                Line = Line.substring((Constants.ASSEMBLER_TAG + ".").length());

                String Command = Line.substring(0, Line.indexOf("("));
                Line = Line.substring(Line.indexOf("(") + 1);

                if(Command.equals(Constants.COMMAND_ALIAS))
                {
                    AssemblerAlias = Line.substring(0, Line.indexOf(")"));
                    Line = Line.substring(Line.indexOf(")"));
                } else if(Command.equals(Constants.COMMAND_FORMAT))
                {
                    ArrayList<String> Formats = new ArrayList<>();
                    while(Line.startsWith("["))
                    {
                        Line = Line.substring(1);
                        Formats.add(Line.substring(0, Line.indexOf("]")));
                        Line = Line.substring(Line.indexOf("]") + 2);
                    }
                }
            }else if(Tagged)
            {
                Line = Line.substring(Constants.OPCODE_LINE_PREFIX.length(), Line.length());

                int NameSeparatorIndex = Line.indexOf(':') - 1;
                ConstantKey = Line.substring(0, NameSeparatorIndex);
                Tagged = false;
            }
        }
    }

    private void ParseFile()
    {
        this.Opcodes = new ArrayList<Opcode>();

        for(String Line : CircuitConstantsFile)
        {
            Line = FileUtil.RemoveIndentation(Line);
            if(Line.startsWith(Constants.OPCODE_LINE_PREFIX))
            {
                System.out.println(Line);

                Line = Line.substring(Constants.OPCODE_LINE_PREFIX.length(), Line.length());

                int NameSeparatorIndex = Line.indexOf(':') - 1;
                String ConstantKey = Line.substring(0, NameSeparatorIndex);

                String Value = GetConstantValue(Line);
                String ValuePrefix = "16#";
                String ValueSuffix = "#";
                int ValuePrefixIndex = Value.indexOf(ValuePrefix) + ValuePrefix.length();
                int ValueSuffixIndex = Value.indexOf(ValueSuffix, ValuePrefixIndex);
                Value = Value.substring(ValuePrefixIndex, ValueSuffixIndex);

                int AliasPrefixIndex = Line.indexOf(Constants.OPCODE_ALIAS_PREFIX) + Constants.OPCODE_ALIAS_PREFIX.length();
                int AliasSuffixIndex = Line.indexOf(");", AliasPrefixIndex);
                String Alias = Line.substring(AliasPrefixIndex, AliasSuffixIndex);

                Opcode LineOpcode = new Opcode(ConstantKey, Integer.parseInt(Value, 16), Alias);
                if(Opcodes.contains(LineOpcode))
                {
                    System.out.println("Duplicate opcode " + LineOpcode);
                } else
                {
                    Opcodes.add(LineOpcode);
                }
            }else if(Line.startsWith(Constants.ADDRESS_WIDTH_KEY))
            {
                String Value = GetConstantValue(Line);

                AddressWidth = Integer.parseInt(Value);
            }

            Collections.sort(Opcodes, new LengthComparator());
        }
    }

    private String GetConstantValue(String Line)
    {
        String ValueSeparator = ":=";
        int ValueSeparatorIndex = Line.indexOf(ValueSeparator) + ValueSeparator.length() + 1;

        return Line.substring(ValueSeparatorIndex, Line.length() - 1);
    }

    public ArrayList<Opcode> GetOpcodes()
    {
        return Opcodes;
    }

    public int GetAddressWidth()
    {
        return AddressWidth;
    }
}
