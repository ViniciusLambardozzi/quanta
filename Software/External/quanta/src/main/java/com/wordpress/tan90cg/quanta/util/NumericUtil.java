package com.wordpress.tan90cg.quanta.util;

import com.wordpress.tan90cg.quanta.exception.InvalidAddressSizeException;
import com.wordpress.tan90cg.quanta.exception.InvalidDataSizeException;
import com.wordpress.tan90cg.quanta.memoryfile.MemoryFileAddressRadix;
import com.wordpress.tan90cg.quanta.memoryfile.MemoryFileDataRadix;

import static com.wordpress.tan90cg.quanta.memoryfile.MemoryFileDataRadix.BIN;

/**
 * File created @[5/5/2017]
 */
public class NumericUtil
{
    public static String getMemoryFileDataString(int data, int size, MemoryFileDataRadix radix) throws InvalidDataSizeException
    {
        String result = null;
        switch (radix)
        {
            case BIN:
                result = Integer.toBinaryString(data);
                break;
            case HEX:
                result = Integer.toHexString(data);
                break;
            case OCT:
                result = Integer.toOctalString(data);
                break;
        }



        int stringLength = result.length();

        if (stringLength > size)
        {
            throw new InvalidDataSizeException(data, size, radix);
        }
        else if (stringLength < size)
        {
            for (int i = 0; i < size - stringLength; i++)
            {
                result = "0" + result;
            }
        }

        return result;
    }

    public static String getMemoryFileAddressString(int address, int size, MemoryFileAddressRadix radix) throws InvalidAddressSizeException
    {
        String result = null;
        switch (radix)
        {

            case BIN:
                result = Integer.toBinaryString(address);
                break;
            case HEX:
                result = Integer.toHexString(address);
                break;
            case OCT:
                result = Integer.toOctalString(address);
                break;
            case DEC:
                result = String.valueOf(address);
                break;
        }



        int stringLength = result.length();

        if (stringLength > size)
        {
            throw new InvalidAddressSizeException(address, size, radix);
        }
        else if (stringLength < size)
        {
            for (int i = 0; i < size - stringLength; i++)
            {
                result = "0" + result;
            }
        }

        return result;
    }

    public static int getMemoryFileAddressSize(int addressCount, MemoryFileAddressRadix addressRadix)
    {
        switch (addressRadix)
        {
            case BIN:
                return (int) Math.ceil(Math.log(addressCount) / Math.log(2)) + 1;
            case HEX:
                return (int) Math.ceil(Math.log(addressCount) / Math.log(16)) + 1;
            case OCT:
                return (int) Math.ceil(Math.log(addressCount) / Math.log(8)) + 1;
            case DEC:
                return (int) Math.ceil(Math.log(addressCount) / Math.log(10)) + 1;
        }
        return 0;
    }
}
