package com.tan90.quanta.util;

import com.tan90.quanta.Opcode;

import java.util.Comparator;

public class LengthComparator implements Comparator<Opcode>
{
    @Override public int compare(Opcode o1, Opcode o2)
    {
        return o2.AssemblerAlias.length() - o1.AssemblerAlias.length();
    }
}
