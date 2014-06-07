transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/RegisterOEN.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/DecoderN.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/RegisterFile.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/ramlpm.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/PCAdder.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/controller.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/imemlpm.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/instruction_register.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/PC.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/Datapath.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/cunit.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/Hex7seg.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/Processor.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/LabB.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/ALU.v}
vlog -vlog01compat -work work +incdir+/home/thetic/Documents/tces330/LabB {/home/thetic/Documents/tces330/LabB/muxlpm.v}

