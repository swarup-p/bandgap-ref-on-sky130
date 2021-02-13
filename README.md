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
        <li><a href="#simulations">Simulations</a></li>
      </ul>
    </li>
	<li>
      <a href="#next-steps">Next Steps</a>
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

XSCHEM is a schematic capture and netlisting EDA tool. In addition to Xschem, a version Xschem_sky130 which is optimised to work with Skywater's 130nm pdk is used. Please check this link for more information, https://xschem.sourceforge.io/stefan/index.html

### ngspice

ngspice offers a spice simulator to model active, passive, analog and digital elements of a device according to parameters provided by semiconductor manufacturer. Please check this link for more information, http://ngspice.sourceforge.net/

<!-- Schematics and Simulations -->
## Schematics and Simulations

### Schematics

![](/snapshots/b1_bandgap_ref_circuit.JPG)

A simple current mirror without operational amplifiers is incorporated in the design to achieve stable reference voltage output. Different parts of the circuit such as start-up circuit, beta multiplier reference, CTAT ad PTAT are also marked.

### Simulations

![](/snapshots/b1_bgr_Vref.JPG)

A variation in reference voltage output at temperature of 27 degree celcius with respect to supply voltage sweep does not show stable results.

<!-- Next Steps -->
## Next Steps

  - Check the Vref reference voltage output with temperature sweep from -40 to 120.
  - Tune beta multiplier stage to get more stability
  - Add cascoding ampliefier to improve performance
