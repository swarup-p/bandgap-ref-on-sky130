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
      <a href="#schematics-and-simulations">Schematics and Simulations</a>
	  	<ul>
        <li><a href="#schematics">Schematics</a></li>
        <li><a href="#pre-layout simulations">Pre-layout Simulations</a></li>
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

<!-- Schematics and Simulations -->
## Schematics and Simulations

### Schematics


A simple current mirror without operational amplifiers is incorporated in the design to achieve stable reference voltage output.

![](/pre-layout/snapshots/bandgap_ref_cir.jpg.JPG)

### Pre-layout Simulations

Reference Voltage (vbgp) vs variations in supply voltage Vdd (2.7V to 3.6V)

![](/pre-layout/snapshots/pre_sim_vv.jpg)

Reference Voltage (vbgp) vs variations in temperature (-40 to 120) degree

![](/pre-layout/snapshots/pre_sim_tv.jpg)

Temperature coefficient

![](/pre-layout/snapshots/pre_sim_tc.jpg)

Voltage coefficient

![](/pre-layout/snapshots/pre_sim_vc.jpg)

Start-up circuit

![](/pre-layout/snapshots/pre_sim_startup.jpg)




