##Initiaze pointer##
set x 0
set y 0
box position $x $y

##Enable Circuit layout##
#Create poly-strips#
set cm_poly_width 500
set cm_poly_height 1602
set cm_number_of_poly 3
set cm_poly_spacing 286
set cm_box_position_x [expr $x+768]
set cm_box_position_y [expr $y+3826]
for {set i 1} {$i <= $cm_number_of_poly} {incr i} {
	box position $cm_box_position_x $cm_box_position_y
	box size $cm_poly_width $cm_poly_height
	paint poly
	set cm_box_position_x [expr $cm_box_position_x+$cm_poly_spacing+$cm_poly_width]
} 

#Create mvndiffusion area#
set cm_mvndiff_width 570
set cm_mvndiff_height 1500
set cm_number_of_mvndiff 3
set cm_mvndiff_spacing 216
set cm_box_position_x [expr $x+733]
set cm_box_position_y [expr $y+3877]
for {set i 1} {$i <= $cm_number_of_mvndiff} {incr i} {
	box position $cm_box_position_x $cm_box_position_y
	box size $cm_mvndiff_width $cm_mvndiff_height
	paint mvndiffusion
	set cm_box_position_x [expr $cm_box_position_x+$cm_mvndiff_spacing+$cm_mvndiff_width]
} 

#Create local interconnect layer#
#For source and drain terminals#
set cm_li_width 17
set cm_li_height 1500
set cm_number_of_li 2
set cm_number_of_mos 3
set cm_box_position_x [expr $x+742]
set cm_box_position_y [expr $y+3877]
set cm_li_spacing_x 535
set cm_mos_spacing 234
for {set j 1} {$j <= $cm_number_of_mos} {incr j} { 
	for {set i 1} {$i <= $cm_number_of_li} {incr i} {
		box position $cm_box_position_x $cm_box_position_y
		box size $cm_li_width $cm_li_height
		paint li
		set cm_box_position_x [expr $cm_box_position_x+$cm_li_spacing_x]
	} 
	set cm_box_position_x [expr $x+742+[expr $j*[expr $cm_li_width+$cm_mos_spacing+$cm_li_spacing_x]]]
} 

#Create local interconnect layer for nmos gate contacts#
set cm_li_width 500 
set cm_li_height 17
set cm_number_of_mos 3
set cm_box_position_x [expr $x+768]
set cm_box_position_y [expr $y+3835]
set cm_mos_spacing 286 
for {set i 1} {$i <= $cm_number_of_mos} {incr i} {
	box position $cm_box_position_x $cm_box_position_y
	box size $cm_li_width $cm_li_height
	paint li
	set cm_box_position_x [expr $cm_box_position_x+$cm_mos_spacing+$cm_li_width]
} 

#Create ndiffusioncontact area#
#Contacts for source and drain#
set cm_mvndc_width 17
set cm_mvndc_height 85
set cm_mos_terminals 2
set cm_number_of_mos 3
set cm_num_of_mvndc 8
set cm_box_position_x [expr $x+742]
set cm_box_position_y [expr $y+3940]
set cm_mos_term_space_x 535
set cm_mos_spacing 234
set cm_mvndc_space_y 100
for {set k 1} {$k <= $cm_number_of_mos} {incr k} {
	for {set j 1} {$j <= $cm_mos_terminals} {incr j} { 
		for {set i 1} {$i <= $cm_num_of_mvndc} {incr i} {
			box position $cm_box_position_x $cm_box_position_y
			box size $cm_mvndc_width $cm_mvndc_height
			paint mvndcontact
			set cm_box_position_y [expr $cm_box_position_y+$cm_mvndc_space_y+$cm_mvndc_height]
		} 
		set cm_box_position_x [expr $cm_box_position_x+$cm_mos_term_space_x]
		set cm_box_position_y [expr $y+3940]
	}
	set cm_box_position_x [expr $x+742+[expr $k*[expr $cm_mvndc_width+$cm_mos_spacing+$cm_mos_term_space_x]]]
	set cm_box_position_y [expr $y+3940]
} 

#Create poly contact for nmos gate terminals#
#Polycontact starts here#
set cm_pc_width 60
set cm_pc_height 17
set cm_number_of_mos 3
set cm_num_of_pc 3
set cm_box_position_x [expr $x+828]
set cm_box_position_y [expr $y+3835]
set cm_mos_spacing 406
set cm_pc_space_x 100
for {set j 1} {$j <= $cm_number_of_mos} {incr j} { 
	for {set i 1} {$i <= $cm_num_of_pc} {incr i} {
		box position $cm_box_position_x $cm_box_position_y
		box size $cm_pc_width $cm_pc_height
		paint pcontact
		set cm_box_position_x [expr $cm_box_position_x+$cm_pc_width+$cm_pc_space_x]
		} 
		set cm_box_position_x [expr $cm_box_position_x-$cm_pc_space_x+$cm_mos_spacing]
} 
