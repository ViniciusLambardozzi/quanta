package com.wordpress.tan90cg.quanta.memoryfile;

import com.wordpress.tan90cg.quanta.exception.InvalidAddressSizeException;
import com.wordpress.tan90cg.quanta.exception.InvalidDataSizeException;
import com.wordpress.tan90cg.quanta.lib.LibInstruction;
import com.wordpress.tan90cg.quanta.lib.LibMemoryFile;
import com.wordpress.tan90cg.quanta.util.NumericUtil;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * File created @[5/5/2017]
 */
public class MemoryFile
{
    private MemoryFileAddressRadix addressRadix;
    private MemoryFileDataRadix dataRadix;

    private int wordCount;
    private int startAddress;

    private List<String> data;

    public MemoryFile(MemoryFileAddressRadix addressRadix, MemoryFileDataRadix dataRadix, int wordCount, int startAddress, List<String> data)
    {
        this.addressRadix = addressRadix;
        this.dataRadix = dataRadix;
        this.wordCount = wordCount;
        this.startAddress = startAddress;
        this.data = data;
    }

    public MemoryFile(MemoryFileAddressRadix addressRadix, MemoryFileDataRadix dataRadix, int wordCount, int startAddress)
    {
        this(addressRadix, dataRadix, wordCount, startAddress, new ArrayList<>());
    }

    public void addData(String data)
    {
        this.data.add(data);
    }

    public void addData(List<String> data)
    {
        this.data.addAll(data);
    }

    public MemoryFileAddressRadix getAddressRadix()
    {
        return addressRadix;
    }

    public MemoryFileDataRadix getDataRadix()
    {
        return dataRadix;
    }

    public void writeToFile(String filePath)
    {
        File file = new File(filePath);
        try
        {
            BufferedWriter writer = new BufferedWriter(new FileWriter(file));

            writer.write(getMemoryFileString(MemoryFileAddressRadix.BIN, MemoryFileDataRadix.BIN));

            writer.close();
        } catch (IOException e)
        {
            e.printStackTrace();
        }
    }

    private String getMemoryFileString(MemoryFileAddressRadix addressRadix, MemoryFileDataRadix dataRadix)
    {
        StringBuilder fileString = new StringBuilder();

        // Write copyright definitions
        // Altera
        String[] alteraCopyright = LibMemoryFile.ALTERA_MIF_COPYRIGHT_HEADER.split(System.lineSeparator());
        for(String line : alteraCopyright)
        {
            fileString.append("--");
            fileString.append(line);
            fileString.append(System.lineSeparator());
        }

        fileString.append(System.lineSeparator());

        // Quanta
        String[] quantaCopyright = LibMemoryFile.QUANTA_MIF_COPYRIGHT_HEADER.split(System.lineSeparator());
        for(String line : quantaCopyright)
        {
            fileString.append("--");
            fileString.append(line);
            fileString.append(System.lineSeparator());
        }

        fileString.append(System.lineSeparator());

        // Write data size properties
        fileString.append(LibMemoryFile.DATA_WIDTH_KEY);
        fileString.append("=");
        fileString.append(LibInstruction.INSTRUCTION_SIZE);
        fileString.append(System.lineSeparator());

        fileString.append(LibMemoryFile.DATA_DEPTH_KEY);
        fileString.append("=");
        fileString.append(wordCount);
        fileString.append(System.lineSeparator());

        fileString.append(System.lineSeparator());

        // Write radix definitions
        fileString.append(LibMemoryFile.DATA_RADIX_KEY);
        fileString.append("=");
        fileString.append(dataRadix.toString());
        fileString.append(System.lineSeparator());

        fileString.append(LibMemoryFile.ADDRESS_RADIX_KEY);
        fileString.append("=");
        fileString.append(addressRadix.toString());
        fileString.append(System.lineSeparator());

        fileString.append(System.lineSeparator());

        // Write data words
        fileString.append(LibMemoryFile.CONTENT_BEGIN_KEY);
        fileString.append(System.lineSeparator());
        fileString.append(System.lineSeparator());

        int currentAddress = startAddress;
        int addressWidth = NumericUtil.getMemoryFileAddressSize(wordCount, addressRadix);
        for(String line : data)
        {
            fileString.append("    ");
            if(line.startsWith("--"))
            {
                fileString.append(line);
                fileString.append(System.lineSeparator());
            }else
            {
                try
                {
                    fileString.append(NumericUtil.getMemoryFileAddressString(currentAddress, addressWidth, addressRadix));
                } catch (InvalidAddressSizeException e)
                {
                    e.printStackTrace();
                    return "Invalid address supplied to memory file.\n";
                }

                fileString.append(" : ");

                fileString.append(line);
                fileString.append(";");
                fileString.append(System.lineSeparator());
                currentAddress++;
            }
        }

        // Default missing addresses to 0
        fileString.append("    ");
        fileString.append("[");
        try
        {
            fileString.append(NumericUtil.getMemoryFileAddressString(currentAddress, addressWidth, addressRadix));
        } catch (InvalidAddressSizeException e)
        {
            e.printStackTrace();
            return "Invalid address supplied to memory file.\n";
        }

        fileString.append(" .. ");

        try
        {
            fileString.append(NumericUtil.getMemoryFileAddressString(wordCount, addressWidth, addressRadix));
        } catch (InvalidAddressSizeException e)
        {
            e.printStackTrace();
            return "Invalid address supplied to memory file.\n";
        }
        fileString.append("] : ");
        try
        {
            fileString.append(NumericUtil.getMemoryFileDataString(0, LibInstruction.INSTRUCTION_SIZE, dataRadix));
        } catch (InvalidDataSizeException e)
        {
            e.printStackTrace();
            return "Invalid address supplied to memory file.\n";
        }

        fileString.append(";");

        // Finish writing data
        fileString.append(System.lineSeparator());
        fileString.append(LibMemoryFile.CONTENT_END_KEY);
        fileString.append(System.lineSeparator());

        return fileString.toString();
    }

    @Override
    public String toString()
    {
        return data.toString();
    }
}
