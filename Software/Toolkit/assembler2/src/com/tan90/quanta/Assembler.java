package com.tan90.quanta;

import com.sun.deploy.util.StringUtils;
import com.sun.xml.internal.bind.v2.runtime.reflect.opt.Const;
import com.tan90.quanta.util.FileUtil;
import org.omg.CORBA.Current;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

public class Assembler
{
    private CircuitConstants ConstantsFile;

    private boolean DisablePipelineOverlap = false;

    public Assembler(CircuitConstants ConstantsFile)
    {
        this.ConstantsFile = ConstantsFile;
    }

    public String[] Assemble(String[] Program)
    {
        ArrayList<String> Binary = new ArrayList<>();

        for(int i = 0; i < Program.length; i++)
        {
            String Line = Program[i];
            Line = RemoveIndent(Line);

            if(Line.contains(";"))
            {
                // Remove comments
                Line = Line.substring(0, Line.indexOf(";"));
            }

            if(Line.equals(""))
            {
                // Removed comment

            }else if(Line.startsWith("."))
            {
                // Label

            } else
            {
                // Instruction
                for(Opcode CurrentOpcode : ConstantsFile.GetOpcodes())
                {
                    if(Line.startsWith(CurrentOpcode.AssemblerAlias))
                    {
                        Main.Log(Line);
                        Instruction InstructionLine = new Instruction();
                        InstructionLine.Opcode = CurrentOpcode.Value;

                        int AliasIndex = Line.indexOf(CurrentOpcode.AssemblerAlias) + CurrentOpcode.AssemblerAlias.length();
                        Line = Line.substring(AliasIndex);
                        Line = Line.replace(" ", "");

                        int RegisterCount = 0;
                        for(int j = 0; j < Line.length(); j++)
                        {
                            if(Line.charAt(j) == '$')
                            {
                                RegisterCount++;
                            }
                        }

                        if(RegisterCount > 0)
                        {
                            if(CurrentOpcode.AssemblerAlias.equals("j"))
                            {
                                InstructionLine.C = GetRegister(Line);
                            } else
                            {
                                InstructionLine.A = GetRegister(Line);
                            }

                            Line = TrimRegister(Line);
                            RegisterCount--;
                        }

                        if(RegisterCount > 0)
                        {
                            InstructionLine.B = GetRegister(Line);
                            Line = TrimRegister(Line);
                            RegisterCount--;
                        }

                        if(RegisterCount > 0)
                        {
                            InstructionLine.C = GetRegister(Line);
                            Line = TrimRegister(Line);
                        }

                        if(IsNumeric(Line))
                        {
                            // Immediate
                            InstructionLine.Immediate = Integer.parseInt(Line);
                            InstructionLine.UseImmediate = true;
                            Line = "";
                        } else
                        {
                            // Label
                        }

                        Main.Log(InstructionLine.toString());
                        Binary.add(InstructionLine.GetBinaryInstruction());
                        if(DisablePipelineOverlap)
                        {
                            for(int n = 0; n < 5; n++)
                            {
                                Binary.add(new Instruction().GetBinaryInstruction());
                            }
                        }
                    }
                }
            }
        }

        return Binary.toArray(new String[0]);
    }

    private String RemoveIndent(String Line)
    {
        while(Line.startsWith(" ") || Line.startsWith("\t"))
        {
            Line = Line.substring(1);
        }

        return Line;
    }

    private int GetRegister(String Line)
    {
        int LastIndex = !Line.contains(",") ? Line.length() : Line.indexOf(",");
        String Register = Line.substring(Line.indexOf("$") + 1, LastIndex);

        return Integer.parseInt(Register);
    }

    private String TrimRegister(String Line)
    {
        if(Line.contains(","))
        {
            return Line.substring(Line.indexOf(",") + 1);
        } else
        {
            return "";
        }
    }

    private boolean IsNumeric(String Value)
    {
        return Value.matches("\\d+");
    }
}
