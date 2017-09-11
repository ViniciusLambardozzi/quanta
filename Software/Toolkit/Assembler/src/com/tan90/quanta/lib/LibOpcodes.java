package com.tan90.quanta.lib;

public class LibOpcodes
{
    public static final int LOAD_IMMEDIATE           = 0b00000001;
    public static final int LOAD_DIRECT              = 0b00000010;
    public static final int STORE_DIRECT             = 0b00000011;
    public static final int ADD                      = 0b00000100;
    public static final int MOVE                     = 0b00000101;
    public static final int SUB                      = 0b00000110;
    public static final int AND                      = 0b00000111;
    public static final int OR                       = 0b00001000;
    public static final int XOR                      = 0b00001001;
    public static final int XNOR                     = 0b00001010;
    public static final int JUMP                     = 0b00001011;
    public static final int JUMP_EQUALS              = 0b00001100;
    public static final int JUMP_NOT_EQUALS          = 0b00001101;
    public static final int JUMP_LESSER_THEN         = 0b00001110;
    public static final int JUMP_GREATER_THEN        = 0b00001111;
    public static final int JUMP_AND_LINK            = 0b00010000;
    public static final int LOGICAL_SHIFT_LEFT       = 0b00010001;
    public static final int LOGICAL_SHIFT_RIGHT      = 0b00010010;
    public static final int ARITHMETICAL_SHIFT_LEFT  = 0b00010011;
    public static final int ARITHMETICAL_SHIFT_RIGHT = 0b00010100;
    public static final int ROTATE_LEFT              = 0b00010101;
    public static final int ROTATE_RIGHT             = 0b00010110;
    public static final int LOAD_INDIRECT            = 0b00010111;
    public static final int STORE_INDIRECT           = 0b00011000;
}
