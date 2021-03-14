##Initiaze pointer##
set x 0
set y 0
box position $x $y

##Create ground strip## 
set ground_strip_width 29104
set ground_strip_height 500
box position $x $y
box size $ground_strip_width $ground_strip_height
paint metal1

##Create power strip##
set power_strip_width 29104
set power_strip_height 300
box position $x [expr $x+9700] 
box size $power_strip_width $power_strip_height
paint metal1

##Startup circuit begins here##
##all related variables are starts with 'sc'##
#Create poly-strips#
set sc_poly_width 50
set sc_poly_height 8050
box position [expr $x+1000] [expr $y+1575]
box size $sc_poly_width $sc_poly_height
paint poly

#Create p-diff area#
set sc_p_diff_width 107
set sc_p_diff_height 8000
box position [expr $x+971.5] [expr $y+1600]
box size $sc_p_diff_width $sc_p_diff_height
paint pdiffusion

#Create n-well area#
set sc_nwell_width 147
set sc_nwell_height 8036
box position [expr $x+951.5] [expr $y+1582]
box size $sc_nwell_width $sc_nwell_height
paint nwell

#Create pdiffusioncontact area#
set sc_pdc_width 17
set sc_pdc_height 85
box position [expr $x+975.5] [expr $y+5557.5]
box size $sc_pdc_width $sc_pdc_height
paint pdcontact

