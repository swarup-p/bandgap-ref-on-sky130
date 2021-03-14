##Initiaze pointer##
set x 0
set y 0
box position $x $y

##Startup circuit layout##
##all related variables start with 'sc'##
##pmos layout starts here##
#Create poly-strips#
set sc_poly_width 50
set sc_poly_height 8100
box position [expr $x+500] [expr $y+1500]
box size $sc_poly_width $sc_poly_height
paint poly

#Create mvpdiff area#
set sc_mvpdiff_width 120
set sc_mvpdiff_height 8000
box position [expr $x+465] [expr $y+1575]
box size $sc_mvpdiff_width $sc_mvpdiff_height
paint mvpdiffusion

#Create local interconnect layer#
set sc_li_width 17
set sc_li_height 8085
set sc_number_of_li 2
set sc_box_position_x [expr $x+474]
set sc_box_spacing 85
for {set i 1} {$i <= $sc_number_of_li} {incr i} {
	box position $sc_box_position_x [expr $y+1575] 
	box size $sc_li_width $sc_li_height
	paint li
	set sc_box_position_x [expr $sc_box_position_x+$sc_box_spacing]
	set sc_li_height 8000
} 
set sc_li_height 8085

#Create pdiffusioncontact area#
set sc_mvpdc_width 17
set sc_mvpdc_height 100
set sc_mos_terminals 2
set sc_terminals_spacing 85
set sc_mvpdc_spacing 400
set sc_number_of_mvpdc [expr $sc_li_height/500]
set sc_box_position_x [expr $x+474]
set sc_box_position_y [expr $y+1575+125]
for {set j 1} {$j <= $sc_mos_terminals} {incr j} {
	for {set i 1} {$i <= $sc_number_of_mvpdc} {incr i} {
		box position $sc_box_position_x $sc_box_position_y
		box size $sc_mvpdc_width $sc_mvpdc_height
		paint mvpdcontact
		set sc_box_position_y [expr $sc_box_position_y+$sc_mvpdc_spacing+100]
		} 
	set sc_box_position_x [expr $sc_box_position_x+$sc_terminals_spacing]
	set sc_box_position_y [expr $y+1575+125]
} 

#Create n-well area#
set sc_nw_width 186
set sc_nw_height 8150
box position [expr $x+432] [expr $y+1500]
box size $sc_nw_width $sc_nw_height
paint nwell

##Pmos layout ends here##


