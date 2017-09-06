package com.wordpress.tan90cg.quanta.localization;

import com.wordpress.tan90cg.quanta.exception.InvalidLocaleException;
import com.wordpress.tan90cg.quanta.util.FileUtil;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * File created @[5/5/2017]
 */
public class Locale
{
    private String id;
    private Map<String, String> locale;

    public Locale(String FilePath) throws IOException, InvalidLocaleException
    {
        String[] lines;
        lines = FileUtil.readFile(FilePath).split(System.lineSeparator());

        parseLocalizationFile(lines);
        debugPrint();
    }

    private void debugPrint()
    {
        for(Map.Entry<String, String> entry : locale.entrySet())
        {
            System.out.println(entry.getKey() + ": " + entry.getValue());
        }
    }

    private void parseLocalizationFile(String[] lines) throws InvalidLocaleException
    {
        locale = new HashMap<>(lines.length);

        for(String line : lines)
        {
            if(line.startsWith("#") || line.isEmpty())
            {
                continue;
            }

            String[] keyValuePair = line.split("=");
            if(keyValuePair[0].startsWith("id"))
            {
                id = keyValuePair[1];
            }
            else if (keyValuePair[0].startsWith("instruction."))
            {
                locale.put(keyValuePair[0], keyValuePair[1]);
            }else
            {
                throw new InvalidLocaleException();
            }
        }
    }

    public String getLocalizedName(String unlocalizedName)
    {
        return locale.get(unlocalizedName);
    }

    public String getLocalizationKey(String localizedName)
    {
        for(Map.Entry<String, String> entry : locale.entrySet())
        {
            if(entry.getValue().equals(localizedName))
            {
                return entry.getKey();
            }
        }
        return null;
    }
}
