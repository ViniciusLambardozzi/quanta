package com.tan90.quanta;

public class Opcode
{
    public String ConstantKey;
    public int Value;
    public String AssemblerAlias;

    public Opcode(String ConstantKey, int Value, String AssemblerAlias)
    {
        this.ConstantKey = ConstantKey;
        this.Value = Value;
        this.AssemblerAlias = AssemblerAlias;
    }

    @Override public String toString()
    {
        return "" + ConstantKey + "-" + Value + "[" + AssemblerAlias + "]";
    }

    @Override
    public boolean equals(Object o)
    {
        return  o != null &&
                o instanceof Opcode &&
                (this.AssemblerAlias.equals(((Opcode)o).AssemblerAlias)||
                this.ConstantKey.equals(((Opcode)o).ConstantKey) ||
                this.Value == ((Opcode)o).Value);
    }
}
