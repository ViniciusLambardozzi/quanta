package com.tan90.quanta.util;

import com.tan90.quanta.Constants;
import com.tan90.quanta.Instruction;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class FileUtil
{
    public static String ReadFile(String Path)
    {
        String line = null;
        StringBuilder stringBuilder = new StringBuilder();

        try (BufferedReader reader = new BufferedReader(new FileReader(Path)))
        {
            while ((line = reader.readLine()) != null)
            {
                stringBuilder.append(line);
                stringBuilder.append(Constants.LINE_SEPARATOR);
            }

            return stringBuilder.toString();
        } catch (IOException e)
        {
            e.printStackTrace();
            return "";
        }
    }

    public static String ArrayToMif(String[] Binary)
    {
        String Mif = "WIDTH=32;\n" + "DEPTH=256;\n" + "\n" + "ADDRESS_RADIX=BIN;\n" + "DATA_RADIX=BIN;\n" + "\n" + "CONTENT BEGIN" + "\n";

        for(int i = 0; i < Binary.length; i++)
        {
            String Line = "    ";
            Line += Instruction.GetFixedLengthBinaryString(i, 8);
            Line += " : ";
            Line += Binary[i];
            Line += ";\n";

            Mif += Line;
        }

        Mif += "END;";

        return Mif;
    }

    public static String RemoveIndentation(String Input)
    {
        while(Input.startsWith(" ") || Input.startsWith("\t"))
        {
            Input = Input.substring(1);
        }

        return Input;
    }

}
