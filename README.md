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
      <a href="#schematic">Schematics</a>
	</li>
	<li>
      <a href="#pre-layout simulations">Pre-Layout Simulations</a>	
	  	<ul>
        <li><a href="#voltage variation check">Voltage Variation Check</a></li>
        <li><a href="#temperature variation check">Temperature Variation Check</a></li>
		<li><a href="#voltage coefficient check">Voltage Coefficient Check</a></li>
		<li><a href="#temperature coefficient check">Temperature Coefficient Check</a></li>
		<li><a href="#start-up circuit check">Start-up Circuit Check</a></li>
		<li><a href="#enable logic check">Enable Logic Check</a></li>
      </ul>
    </li>
	<li>
      <a href="#layout">Layout</a>
    </li>
	<li>
      <a href="#post-layout">Post-Layout Simulations</a>
	  	<ul>
        <li><a href="#voltage variation check">Voltage Variation Check</a></li>
        <li><a href="#temperature variation check">Temperature Variation Check</a></li>
		<li><a href="#voltage coefficient check">Voltage Coefficient Check</a></li>
		<li><a href="#temperature coefficient check">Temperature Coefficient Check</a></li>
		<li><a href="#start-up circuit check">Start-up Circuit Check</a></li>
		<li><a href="#enable logic check">Enable Logic Check</a></li>
      </ul>	  
    </li>
  </ol>
</details>

<!-- Introduction -->
## Introduction

An example of a bandgap reference circuit implementation on Skywater’s open-source process design kit(pdk) is proposed here. A simple reference voltage source topology will be evaluated with a set of simulations and then implemented in open-source EDA tools. In the design, a current mirror without operational amplifier is used to keep the topology simple. Please check [here] (/report/Stage_1_Introduction_to_BGR.pdf) for more information.

<!-- Requirements -->
## Requirements

Design specifications and requirements are listed [here] (/requirements/bandgap_circuit_requirements.pdf) .

<!-- Tools -->
## Tools

Open-source tools are used to design and simulate bandgap reference circuit.

### XSCHEM

XSCHEM is a schematic capture and netlisting EDA tool. In addition to Xschem, a version named Xschem_sky130 which is optimised to work with Skywater's 130nm pdk is used. For more information, please check this [link] (https://xschem.sourceforge.io/stefan/index.html) .

Although XSCHEM is not required to run simulation files in this repository, it can be installed with built-in ngspice tool and support for sky130 pdk. Please follow set up steps mentioned in [this] (https://xschem.sourceforge.io/stefan/xschem_man/video_tutorials/install_xschem_sky130_and_ngspice.mp4) video.

### ngspice

ngspice offers a spice simulator to model active, passive, analog and digital elements of a device according to parameters provided by semiconductor manufacturer. For more information, please check this [link] (http://ngspice.sourceforge.net/) .

  Installation on Ubuntu
  
	sudo apt-get install -y ngspice

### Magic

Magic is a opensource VLSI layout tool. Please check [link] (http://opencircuitdesign.com/magic/), for more information on this tool.

  Installation on Ubuntu
  
	sudo wget "http://opencircuitdesign.com/magic/archive/magic-8.3.122.tgz"
	tar -xvzf magic-8.3.122.tgz
	cd magic-8.3.122
	sudo ./configure
	sudo make
	sudo make install
	

<!-- Schematic -->
## Schematic

A simple current mirror without operational amplifiers is incorporated in the design to achieve stable reference voltage output.

![](/schematic/avsdbgp_3V3.PNG)

<!-- Pre-Layout Simulations -->
## Pre-Layout Simulations

Here are the steps to run simulation files,

	git clone https://github.com/swarup-p/bandgap-ref-on-sky130.git
	cd bandgap-ref-on-sky130/pre-layout/spice-deck/
	ngspice

Run below commands in ngspice terminal to get the simulation results.

<!-- Voltage Variation Check -->
### Voltage Variation Check

Reference voltage (vbgp) vs variations in supply voltage Vdd (2V to 4V)

	source pre_vv_check.spice

![](/pre-layout/snapshots/pre_vv_check.PNG)

<!-- Temperature Variation Check-->
### Temperature Variation Check

Reference voltage (vbgp) vs variations in temperature (-40 to 140) degree

	source pre_tv_check.spice

![](/pre-layout/snapshots/pre_tv_check.PNG)

<!-- Voltage Coefficient Check-->
### Voltage Coefficient Check

	source pre_vc_check.spice

![](/pre-layout/snapshots/pre_vc_check.PNG)

<!-- Temperature Coefficient Check-->
### Temperature Coefficient Check

	source pre_tc_check.spice

![](/pre-layout/snapshots/pre_tc_check.PNG)

<!-- Start-up Circuit Check -->
### Start-up Circuit Check

	source pre_startup_check.spice

![](/pre-layout/snapshots/pre_startup_check.PNG)

<!-- Enable Logic Check -->
### Enable Logic Check

	source pre_enable_check.spice

![](/pre-layout/snapshots/pre_enable_V_check.PNG)
![](/pre-layout/snapshots/pre_enable_I_check.PNG)

<!-- Layout -->
## Layout

![](/layout/avsdbgp_3V3.PNG)

Check the layout file in magic,

	cd bandgap-ref-on-sky130/layout/
	
	magic -T ../lib/sky130A.tech avsdbgp_3V3.mag &

![](/layout/avsdbgp_3V3_snap1.PNG)

<!-- Post-Layout Simulations -->
## Post-Layout Simulations

Here are the steps to run simulation files,

	git clone https://github.com/swarup-p/bandgap-ref-on-sky130.git
	cd bandgap-ref-on-sky130/post-layout/spice-deck/
	ngspice
	
Run below commands in ngspice terminal to get the simulation results.

<!-- Voltage Variation -->
### Voltage Variation

Reference voltage (vbgp) vs variations in supply voltage Vdd (2V to 4V)

	source post_vv_check.spice

![](/post-layout/snapshots/post_vv_check.PNG)

<!-- Temperature Variation -->
### Temperature Variation

Reference voltage (vbgp) vs variations in temperature (-40 to 140) degree

	source post_tv_check.spice

![](/post-layout/snapshots/post_tv_check.PNG)

<!-- Voltage Coefficient Check-->
### Voltage Coefficient Check

	source post_vc_check.spice

![](/post-layout/snapshots/post_vc_check.PNG)

<!-- Temperature Coefficient Check-->
### Temperature Coefficient Check

	source post_tc_check.spice

![](/post-layout/snapshots/post_tc_check.PNG)

<!-- Start-up Circuit Check -->
### Start-up Circuit Check

	source post_startup_check.PNG
	
![](/post-layout/snapshots/post_startup_check.PNG)	

<!-- Enable Logic Check -->
### Enable Logic Check

Check the current values when enable terminal is at logic 1 and when enable terminal is at logic 0.

	source post_enable_check.spice

![](/post-layout/snapshots/post_enable_V_check.PNG)
![](/post-layout/snapshots/post_enable_I_check.PNG)
