package com.wordpress.tan90cg.quanta.exception;

import com.wordpress.tan90cg.quanta.memoryfile.MemoryFileAddressRadix;
import com.wordpress.tan90cg.quanta.memoryfile.MemoryFileDataRadix;

/**
 * File created @[5/8/2017]
 */
public class InvalidAddressSizeException extends Exception
{
    private int data;
    private int size;
    private MemoryFileAddressRadix radix;

    public InvalidAddressSizeException(int data, int size, MemoryFileAddressRadix radix)
    {
        super("Invalid address size.");

        this.data = data;
        this.size = size;
        this.radix = radix;
    }

    public int getData()
    {
        return data;
    }
}
