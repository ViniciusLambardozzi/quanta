# quanta

## ISA

#### Load Immediate

-   31..24: OPCODE
-   23..19: Destination
-   15..0: Immediate

#### Move

-   31..24: OPCODE
-   23..19: Destination
-   18..14: Source

#### Load

-   31..24: OPCODE
-   23..19: Destination
-   18..14: Source address

#### Store

-   31..24: OPCODE
-   23..19: Source
-   18..14: Destination address


#### Add

- 31..24: OPCODE
- 23..19: Destination
- 18..14: Source

#### Subtract

- 31..24: OPCODE
- 23..19: Destination
- 18..14: Source

#### AND

- 31..24: OPCODE
- 23..19: Destination
- 18..14: Source

#### OR

- 31..24: OPCODE
- 23..19: Destination
- 18..14: Source

#### XOR

- 31..24: OPCODE
- 23..19: Destination
- 18..14: Source

#### XNOR

- 31..24: OPCODE
- 23..19: Destination
- 18..14: Source

#### Shift Left

- 31..24: OPCODE
- 23..19: Destination

#### Shift Right

- 31..24: OPCODE
- 23..19: Destination

#### Shift Arithmetic Left

- 31..24: OPCODE
- 23..19: Destination

#### Shift Arithmetic  Right

- 31..24: OPCODE
- 23..19: Destination

#### Rotate Left

- 31..24: OPCODE
- 23..19: Destination

#### Rotate Left

- 31..24: OPCODE
- 23..19: Destination

#### Jump

- 31..24: OPCODE
- 23..14: Padding
- 13..9: Address

#### Jump Equals

- 31..24: OPCODE
- 23..19: A
- 18..14: B
- 13..9: Address

#### Jump Not Equals

- 31..24: OPCODE
- 23..19: A
- 18..14: B
- 13..9: Address

#### Jump Lesser Then 

- 31..24: OPCODE
- 23..19: A
- 18..14: B
- 13..9: Address

#### Jump Greater Then 

- 31..24: OPCODE
- 23..19: A
- 18..14: B
- 13..9: Address