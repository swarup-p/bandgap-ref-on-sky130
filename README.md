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
	<li>
      <a href="#layout">Layout</a>
    </li>
	<li>
      <a href="#post-layout">Post-Layout Simulations</a>
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

Although XSCHEM is not required to run simulation files in this repository, it can be installed with built-in ngspice tool and support for sky130 pdk. Please follow set up steps mentioned in this video,
https://xschem.sourceforge.io/stefan/xschem_man/video_tutorials/install_xschem_sky130_and_ngspice.mp4

### ngspice

ngspice offers a spice simulator to model active, passive, analog and digital elements of a device according to parameters provided by semiconductor manufacturer. Please check this link for more information, http://ngspice.sourceforge.net/


<!-- Pre-Layout Schematics and Simulations -->
## Pre-Layout Schematics and Simulations

### Schematics

A simple current mirror without operational amplifiers is incorporated in the design to achieve stable reference voltage output.

![](/schematic/avsdbgp_3V3.ps)

### Simulations

Here are the steps to run simulation files,

	git clone https://github.com/swarup-p/bandgap-ref-on-sky130.git
	cd bandgap-ref-on-sky130/pre-layout/spice-deck/
	ngspice

Run below commands in ngspice terminal to get the simulation results.

  Reference voltage (vbgp) vs variations in supply voltage Vdd (2V to 4V)

	source pre_vv_check.spice

![](/pre-layout/snapshots/pre_vv_check.PNG)

  Reference voltage (vbgp) vs variations in temperature (-40 to 140) degree

	source pre_tv_check.spice

![](/pre-layout/snapshots/pre_tv_check.PNG)

  Voltage coefficient

	source pre_vc_check.spice

![](/pre-layout/snapshots/pre_vc_check.PNG)

  Temperature coefficient

	source pre_tc_check.spice

![](/pre-layout/snapshots/pre_tc_check.PNG)

  Start-up circuit

	source pre_startup_check.spice

![](/pre-layout/snapshots/pre_startup_check.PNG)

  Enable logic check

	source pre_enable_check.spice

![](/pre-layout/snapshots/pre_enable_V_check.PNG)
![](/pre-layout/snapshots/pre_enable_I_check.PNG)

<!-- Layout -->
## Layout

![](/layout/avsdbgp_3V3.PNG)
![](/layout/avsdbgp_3V3_snap1.PNG)

<!-- Post-Layout Simulations -->
## Post-Layout Simulations

Here are the steps to run simulation files,

	git clone https://github.com/swarup-p/bandgap-ref-on-sky130.git
	cd bandgap-ref-on-sky130/post-layout/spice-deck/
	ngspice
	
Run below commands in ngspice terminal to get the simulation results.

  Reference voltage (vbgp) vs variations in supply voltage Vdd (2V to 4V)

	source post_vv_check.spice

![](/post-layout/snapshots/post_vv_check.PNG)

  Reference voltage (vbgp) vs variations in temperature (-40 to 140) degree

	source post_tv_check.spice

![](/post-layout/snapshots/post_tv_check.PNG)

  Voltage coefficient

	source post_vc_check.spice

![](/post-layout/snapshots/post_vc_check.PNG)

  Temperature coefficient

	source post_tc_check.spice

![](/post-layout/snapshots/post_tc_check.PNG)
