package com.wordpress.tan90cg.quanta.exception;

import com.wordpress.tan90cg.quanta.memoryfile.MemoryFileDataRadix;

import java.lang.reflect.Executable;

/**
 * File created @[5/5/2017]
 */
public class InvalidDataSizeException extends Exception
{
    private int data;
    private int size;
    private MemoryFileDataRadix radix;

    public InvalidDataSizeException(int data, int size, MemoryFileDataRadix radix)
    {
        super("Invalid data size.");

        this.data = data;
        this.size = size;
        this.radix = radix;
    }

    public int getData()
    {
        return data;
    }

    public int getSize()
    {
        return size;
    }

    public MemoryFileDataRadix getRadix()
    {
        return radix;
    }
}
