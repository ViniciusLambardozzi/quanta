package com.tan90.quanta.util;

import java.io.*;

public class FileUtil
{
    public static String ReadFile(String file) throws IOException
    {
        BufferedReader reader = new BufferedReader(new FileReader(file));
        String         line = null;
        StringBuilder  stringBuilder = new StringBuilder();
        String         ls = "\n";

        try {
            while((line = reader.readLine()) != null) {
                stringBuilder.append(line);
                stringBuilder.append(ls);
            }

            return stringBuilder.toString();
        } finally {
            reader.close();
        }
    }

    public static void WriteFile(String file, String data) throws IOException
    {
        BufferedWriter writer = new BufferedWriter(new FileWriter(file));

        try {
            writer.write(data);
        } finally {
            writer.close();
        }
    }
}
