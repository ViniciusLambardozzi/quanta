transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Vinicius/quanta/Hardware/quanta/src/vhdl/component/Alu.vhd}
vcom -93 -work work {C:/Vinicius/quanta/Hardware/quanta/src/vhdl/component/Shifter.vhd}
vcom -93 -work work {C:/Vinicius/quanta/Hardware/quanta/src/vhdl/lib/ControllerConstants.vhd}
vcom -93 -work work {C:/Vinicius/quanta/Hardware/quanta/src/vhdl/lib/Types.vhd}
vcom -93 -work work {C:/Vinicius/quanta/Hardware/quanta/src/vhdl/memory/Register.vhd}
vcom -93 -work work {C:/Vinicius/quanta/Hardware/quanta/src/vhdl/util/Adder.vhd}
vcom -93 -work work {C:/Vinicius/quanta/Hardware/quanta/src/vhdl/util/HexDisplay.vhd}
vcom -93 -work work {C:/Vinicius/quanta/Hardware/quanta/src/vhdl/controllers/io/BusController.vhd}
vcom -93 -work work {C:/Vinicius/quanta/Hardware/quanta/src/vhdl/controllers/io/IoBusController.vhd}
vcom -93 -work work {C:/Vinicius/quanta/Hardware/quanta/src/vhdl/Processor.vhd}
vcom -93 -work work {C:/Vinicius/quanta/Hardware/quanta/src/vhdl/component/Controller.vhd}
vcom -93 -work work {C:/Vinicius/quanta/Hardware/quanta/src/vhdl/component/Multiplexer.vhd}
vcom -93 -work work {C:/Vinicius/quanta/Hardware/quanta/src/vhdl/memory/Ram.vhd}

