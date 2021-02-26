# bandgap-ref-on-sky130
Implementation of bandgap reference circuit on Skywater's 130nm pdk.

<br />
<p align="center">
  <h3 align="center">Bandgap Reference Design</h3>
</p>
<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#introduction">Introduction</a>
    </li>
    <li>
      <a href="#requirements">Requirements</a>
    </li>
	<li>
      <a href="#tools">Tools</a>
	  <ul>
        <li><a href="#xschem">XSCHEM</a></li>
        <li><a href="#ngspice">ngspice</a></li>
      </ul>
    </li>
	<li>
      <a href="#pre-layout-schematics-and-simulations">Pre-Layout Schematics and Simulations</a>
	  	<ul>
        <li><a href="#schematics">Schematics</a></li>
        <li><a href="#simulations">Simulations</a></li>
      </ul>
    </li>
  </ol>
</details>

<!-- Introduction -->
## Introduction

An  example  of  a  CMOS  bandgap  reference  circuit  implementation  on  Skywater’s  open-source  process design kit (pdk) is proposed here.Please check 'Stage_1_Introduction_to_BGR.pdf' file in reports folder for more information.

<!-- Requirements -->
## Requirements

Design specifications and requirements are listed in 'bandgap_circuit_requirements.pdf'.

<!-- Tools -->
## Tools

Open-source tools are used to design and simulate bandgap reference circuit.

### XSCHEM

XSCHEM is a schematic capture and netlisting EDA tool. In addition to Xschem, a version Xschem_sky130 which is optimised to work with Skywater's 130nm pdk is used. Please check this link for more information, 
https://xschem.sourceforge.io/stefan/index.html

### ngspice

ngspice offers a spice simulator to model active, passive, analog and digital elements of a device according to parameters provided by semiconductor manufacturer. Please check this link for more information, http://ngspice.sourceforge.net/

<!-- Pre-Layout Schematics and Simulations -->
## Pre-Layout Schematics and Simulations

Install XSCHEM to run schematics and simulation files in this repo. XSCHEM has a version that supports Sky130 pdk, please follow set up steps mentioned in this video,
https://xschem.sourceforge.io/stefan/xschem_man/video_tutorials/install_xschem_sky130_and_ngspice.mp4

After installation, navigate to XSCHEM work directory, for example,
	
	cd /home/swarup/.xschem

Clone this repository using command

	git clone https://github.com/swarup-p/bandgap-ref-on-sky130
	
Navigate to a schematic file, for example

	cd /bandgap-ref-on-sky130/pre-layout/spice-deck
	
Run schematic file,
  
	xschem bandgap_schematic.sch
	
Go to commands sections in schematic file uncomment required part in 'user architecture code' and run spice deck with built-in ngspice tool.


### Schematics

A simple current mirror without operational amplifiers is incorporated in the design to achieve stable reference voltage output.

![](/pre-layout/snapshots/bandgap_schematic.jpg)

### Simulations

Reference Voltage (vbgp) vs variations in supply voltage Vdd (2V to 4V)

	*** plot vbgp with variation in supply voltage
	Vdd VDD GND 3.3
	V_en en GND 3.3
	.dc Vdd 2 4 0.1
	.control
	run
	print Vbgp
	plot V(Vbgp)
	.endc

![](/pre-layout/snapshots/pre_vv_check.jpg)

Reference Voltage (vbgp) vs variations in temperature (-40 to 140) degree

	*** plot vbgp with variation in temperature @3.3V
	Vdd VDD GND 3.3
	V_en en GND 3.3
	.dc temp -40 140 1
	.control
	run
	print V(Vbgp)
	plot V(Vbgp)
	.endc

![](/pre-layout/snapshots/pre_tv_check.jpg)

Voltage coefficient

	*** plot voltage coefficient
	Vdd VDD GND 3.3
	V_en en GND 3.3
	.dc Vdd 2 4 0.1
	.control
	run
	plot deriv(V(Vbgp))
	.endc

![](/pre-layout/snapshots/pre_vc_check.jpg)

Temperature coefficient

	*** plot temperature coefficient
	Vdd VDD GND 3.3
	V_en en GND 3.3
	.dc temp -40 140 1
	.control
	run
	plot deriv(V(Vbgp))/1.202344
	.endc

![](/pre-layout/snapshots/pre_tc_check.jpg)

Start-up circuit

	*** check start up circuit
	V_en en GND 3.3
	Vdd VDD GND PULSE(0 3.3 50us 40us 0us 200us 400us 0)
	.tran 1us 200us
	.control
	run
	plot V(Vdd) V(Vbgp)
	.endc

![](/pre-layout/snapshots/pre_startup_check.jpg)

Enable logic check

	*** enable pin
	Vdd VDD GND 3.3
	V_en en GND PULSE(0 3.3 50us 0 0 10us 20us 0)
	.tran 1u 150us
	.control
	run
	plot V(en) V(Vbgp)
	.endc

![](/pre-layout/snapshots/enable_function_check.jpg)


