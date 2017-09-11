package com.tan90.quanta.exception;

public class InvalidKeywordException extends Exception
{
    private String Keyword;
    private int    Line;

    public InvalidKeywordException(String Keyword, int Line)
    {
        super("Invalid keyword \"" + Keyword + "\" at: " + Line + ".");

        this.Keyword = Keyword;
        this.Line = Line;
    }
}
