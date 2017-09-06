package com.wordpress.tan90cg.quanta.util;

import java.io.*;

/**
 * File created @[5/5/2017]
 */
public class FileUtil
{
    public static String readFile(String Path) throws IOException
    {
        StringBuilder result = new StringBuilder();

        BufferedReader reader = new BufferedReader(new FileReader(Path));
        String line;
        line = reader.readLine();
        while(line != null)
        {
            result.append(line);
            result.append(System.lineSeparator());

            line = reader.readLine();
        }
        reader.close();

        return result.toString();
    }
}
