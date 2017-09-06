package com.wordpress.tan90cg.quanta.lib;

import com.wordpress.tan90cg.quanta.assembler.InstructionName;
import com.wordpress.tan90cg.quanta.assembler.InstructionType;

/**
 * File created @[5/8/2017]
 */
public class LibInstruction
{
    public static final int INSTRUCTION_SIZE = 32;
    public static final int OPCODE_SIZE = 8;
    public static final int ADDRESS_SIZE = 5;
    public static final int DATA_SIZE = 16;
    public static final int ZERO_REGISTER_DATA_GAP = 8;
    public static final int SINGLE_REGISTER_DATA_GAP = 3;

    static class UnlocalizedNames
    {
        private static final String INSTRUCTION_PREFIX = "instruction";

        private static final String LOAD_IMMEDIATE = "loadimmediate";
        private static final String LOAD_DIRECT = "loaddirect";
        private static final String STORE_DIRECT = "storedirect";
        private static final String ADD = "add";
        private static final String MOVE = "move";
        private static final String SUBTRACT = "subtract";
        private static final String AND = "and";
        private static final String OR = "or";
        private static final String XOR = "xor";
        private static final String XNOR = "xnor";
        private static final String JUMP = "jump";
        private static final String JUMP_EQUALS = "jumpequals";
        private static final String JUMP_NOT_EQUALS = "jumpnotequals";
        private static final String JUMP_LESSER_THEN = "jumplesserthen";
        private static final String JUMP_GREATER_THEN = "jumpgreaterthen";
        private static final String JUMP_AND_LINK = "jumplink";
        private static final String LOGICAL_SHIFT_LEFT = "logicalshiftleft";
        private static final String LOGICAL_SHIFT_RIGHT = "logicalshiftright";
        private static final String ARITHMETICAL_SHIFT_LEFT = "arithmeticalshiftleft";
        private static final String ARITHMETICAL_SHIFT_RIGHT = "arithmeticalshiftright";
        private static final String ROTATE_LEFT = "rotateleft";
        private static final String ROTATE_RIGHT = "rotateright";

        public static String getUnlocalizedName(InstructionName instruction)
        {
            return INSTRUCTION_PREFIX + "." + getLocalizationKey(instruction);
        }

        private static String getLocalizationKey(InstructionName instruction)
        {
            switch (instruction)
            {

                case LOAD_IMMEDIATE:
                    return LOAD_IMMEDIATE;
                case LOAD_DIRECT:
                    return LOAD_DIRECT;
                case STORE_DIRECT:
                    return STORE_DIRECT;
                case ADD:
                    return ADD;
                case MOVE:
                    return MOVE;
                case SUBTRACT:
                    return SUBTRACT;
                case AND:
                    return ADD;
                case OR:
                    return OR;
                case XOR:
                    return XOR;
                case XNOR:
                    return XNOR;
                case JUMP:
                    return JUMP;
                case JUMP_EQUALS:
                    return JUMP_EQUALS;
                case JUMP_NOT_EQUALS:
                    return JUMP_NOT_EQUALS;
                case JUMP_LESSER_THEN:
                    return JUMP_LESSER_THEN;
                case JUMP_GREATER_THEN:
                    return JUMP_GREATER_THEN;
                case JUMP_AND_LINK:
                    return JUMP_AND_LINK;
                case LOGICAL_SHIFT_LEFT:
                    return LOGICAL_SHIFT_LEFT;
                case LOGICAL_SHIFT_RIGHT:
                    return LOGICAL_SHIFT_RIGHT;
                case ARITHMETICAL_SHIFT_LEFT:
                    return ARITHMETICAL_SHIFT_LEFT;
                case ARITHMETICAL_SHIFT_RIGHT:
                    return ARITHMETICAL_SHIFT_RIGHT;
                case ROTATE_LEFT:
                    return ROTATE_LEFT;
                case ROTATE_RIGHT:
                    return ROTATE_RIGHT;
            }
            return "";
        }
    }

    public static InstructionType getInstructionType(InstructionName instruction)
    {
        if(
                instruction == InstructionName.LOAD_IMMEDIATE ||
                instruction == InstructionName.LOAD_DIRECT ||
                instruction == InstructionName.STORE_DIRECT
                )
        {
            return InstructionType.SINGLE_REGISTER_DATA;
        }else if(
                instruction == InstructionName.ADD ||
                instruction == InstructionName.MOVE ||
                instruction == InstructionName.SUBTRACT ||
                instruction == InstructionName.AND ||
                instruction == InstructionName.OR ||
                instruction == InstructionName.XOR ||
                instruction == InstructionName.XNOR
                )
        {
            return InstructionType.DOUBLE_REGISTER;
        }else if(
                instruction == InstructionName.JUMP ||
                instruction == InstructionName.JUMP_AND_LINK ||
                instruction == InstructionName.LOGICAL_SHIFT_LEFT ||
                instruction == InstructionName.LOGICAL_SHIFT_RIGHT ||
                instruction == InstructionName.ARITHMETICAL_SHIFT_LEFT ||
                instruction == InstructionName.ARITHMETICAL_SHIFT_RIGHT ||
                instruction == InstructionName.ROTATE_LEFT ||
                instruction == InstructionName.ROTATE_RIGHT
                )
        {
            return InstructionType.SINGLE_REGISTER;
        }else if (
                instruction == InstructionName.JUMP_EQUALS ||
                instruction == InstructionName.JUMP_NOT_EQUALS ||
                instruction == InstructionName.JUMP_LESSER_THEN ||
                instruction == InstructionName.JUMP_GREATER_THEN
                )
        {
            return InstructionType.TRIPLE_REGISTER;
        }
        return InstructionType.UNKNOW;
    }
}
