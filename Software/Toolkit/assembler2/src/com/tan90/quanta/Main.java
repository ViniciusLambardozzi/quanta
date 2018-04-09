package com.tan90.quanta;

import com.tan90.quanta.util.FileUtil;

import java.io.IOException;

public class Main
{
    private static boolean Verbose = true;

    public static void main(String[] args)
    {
        CircuitConstants ConstantFile;

        ConstantFile = new CircuitConstants(FileUtil.ReadFile(Constants.CIRCUIT_CONSTANTS_FILE));
//        ConstantFile.ParseInstructions();
//        System.exit(0);

        System.out.println(ConstantFile.GetOpcodes());
        Assembler Assembler = new Assembler(ConstantFile);

        String[] Program;
        String[] Binary;

        Program = FileUtil.ReadFile("C:\\Vinicius\\quanta\\Software\\Toolkit\\Assembler\\out\\artifacts\\Assembler_jar\\Label.qtf").split(Constants.LINE_SEPARATOR);
        for(String line : Program)
        {
            System.out.println(line);
        }
        Binary = Assembler.Assemble(Program);

        System.out.println("Assembled program:");
        System.out.println(FileUtil.ArrayToMif(Binary));

    }

    public static void Log(String Value)
    {
        if (Verbose)
        {
            System.out.println(Value);
        }
    }

    public static boolean IsVerbose()
    {
        return Verbose;
    }
}
