package com.tan90.quanta;

import sun.security.jca.GetInstance;

public class Instruction
{
    public int Opcode;
    public int A;
    public int B;
    public int C;

    public int Immediate;
    public boolean UseImmediate;

    public String GetBinaryInstruction()
    {
        String BinaryOpcode = GetFixedLengthBinaryString(Opcode, 8);

        String BinaryA = GetFixedLengthBinaryString(A, 5);
        String BinaryB = GetFixedLengthBinaryString(B, 5);
        String BinaryC = GetFixedLengthBinaryString(C, 5);

        String BinaryImmediate = GetFixedLengthBinaryString(Immediate, 16);

        String Instruction = "";

        Instruction += BinaryOpcode;
        Instruction += BinaryA;
        if(!UseImmediate)
        {
            Instruction += BinaryB;
            Instruction += BinaryC;
        }else
        {
            while(Instruction.length() < 16)
            {
                Instruction = Instruction.concat("0");
            }
            Instruction += BinaryImmediate;
        }

        while(Instruction.length() < 32)
        {
            Instruction = Instruction.concat("0");
        }

        return Instruction;
    }

    public static String GetFixedLengthBinaryString(int Value, int Length)
    {
        String BinaryValue = Integer.toBinaryString(Value);
        while(BinaryValue.length() < Length)
        {
            BinaryValue = "0".concat(BinaryValue);
        }

        return BinaryValue;
    }

    @Override public String toString()
    {
        String Label = "";
        if(Main.IsVerbose())
        {
            if(UseImmediate)
            {
                Label = "\nooooooooxxxxxxxxiiiiiiiiiiiiiiii\n";
            } else
            {
                Label = "\nooooooooaaaaabbbbbcccccxxxxxxxxx\n";
            }

            Label += GetBinaryInstruction();
            Label += "\n";
        }
        return ("OP:" + Opcode + ",A:" + A + ",B:" + B + ",C/I:" + (UseImmediate ? Immediate : C)) + Label;
    }
}
