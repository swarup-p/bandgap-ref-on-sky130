##Initiaze pointer##
set x 0
set y 0
box position $x $y

##Enable Circuit layout##
#All related variables start with 'en'#
#Create poly-strips#
set en_poly_width 500
set en_poly_height 1302
set en_number_of_poly 3
set en_poly_spacing 286
set en_box_position_x [expr $x+768]
set en_box_position_y [expr $y+4126]
for {set i 1} {$i <= $en_number_of_poly} {incr i} {
	box position $en_box_position_x $en_box_position_y
	box size $en_poly_width $en_poly_height
	paint poly
	set en_box_position_x [expr $en_box_position_x+$en_poly_spacing+$en_poly_width]
} 

#Create mvndiffusion area#
set en_mvndiff_width 570
set en_mvndiff_height 1200
set en_number_of_mvndiff 3
set en_mvndiff_spacing 216
set en_box_position_x [expr $x+733]
set en_box_position_y [expr $y+4177]
for {set i 1} {$i <= $en_number_of_mvndiff} {incr i} {
	box position $en_box_position_x $en_box_position_y
	box size $en_mvndiff_width $en_mvndiff_height
	paint mvndiffusion
	set en_box_position_x [expr $en_box_position_x+$en_mvndiff_spacing+$en_mvndiff_width]
} 

#Create local interconnect layer#
#For source and drain terminals#
set en_li_width 17
set en_li_height 1200
set en_number_of_li 2
set en_number_of_mos 3
set en_box_position_x [expr $x+742]
set en_box_position_y [expr $y+4177]
set en_li_spacing_x 535
set en_mos_spacing 234
for {set j 1} {$j <= $en_number_of_mos} {incr j} { 
	for {set i 1} {$i <= $en_number_of_li} {incr i} {
		box position $en_box_position_x $en_box_position_y
		box size $en_li_width $en_li_height
		paint li
		set en_box_position_x [expr $en_box_position_x+$en_li_spacing_x]
	} 
	set en_box_position_x [expr $x+742+[expr $j*[expr $en_li_width+$en_mos_spacing+$en_li_spacing_x]]]
} 

#Create local interconnect layer for nmos gate contacts#
set en_li_width 500 
set en_li_height 17
set en_number_of_mos 3
set en_box_position_x [expr $x+768]
set en_box_position_y [expr $y+5402]
set en_mos_spacing 286 
for {set i 1} {$i <= $en_number_of_mos} {incr i} {
	box position $en_box_position_x $en_box_position_y
	box size $en_li_width $en_li_height
	paint li
	set en_box_position_x [expr $en_box_position_x+$en_mos_spacing+$en_li_width]
} 

#Create ndiffusioncontact area#
#Contacts for source and drain#
set en_mvndc_width 17
set en_mvndc_height 85
set en_mos_terminals 2
set en_number_of_mos 3
set en_num_of_mvndc 6
set en_box_position_x [expr $x+742]
set en_box_position_y [expr $y+4272]
set en_mos_term_space_x 535
set en_mos_spacing 234
set en_mvndc_space_y 100
for {set k 1} {$k <= $en_number_of_mos} {incr k} {
	for {set j 1} {$j <= $en_mos_terminals} {incr j} { 
		for {set i 1} {$i <= $en_num_of_mvndc} {incr i} {
			box position $en_box_position_x $en_box_position_y
			box size $en_mvndc_width $en_mvndc_height
			paint mvndcontact
			set en_box_position_y [expr $en_box_position_y+$en_mvndc_space_y+$en_mvndc_height]
		} 
		set en_box_position_x [expr $en_box_position_x+$en_mos_term_space_x]
		set en_box_position_y [expr $y+4272]
	}
	set en_box_position_x [expr $x+742+[expr $k*[expr $en_mvndc_width+$en_mos_spacing+$en_mos_term_space_x]]]
	set en_box_position_y [expr $y+4272]
} 

#Create poly contact for nmos gate terminals#
#Polycontact starts here#
set en_pc_width 60
set en_pc_height 17
set en_number_of_mos 3
set en_num_of_pc 3
set en_box_position_x [expr $x+828]
set en_box_position_y [expr $y+5402]
set en_mos_spacing 406
set en_pc_space_x 100
for {set j 1} {$j <= $en_number_of_mos} {incr j} { 
	for {set i 1} {$i <= $en_num_of_pc} {incr i} {
		box position $en_box_position_x $en_box_position_y
		box size $en_pc_width $en_pc_height
		paint pcontact
		set en_box_position_x [expr $en_box_position_x+$en_pc_width+$en_pc_space_x]
		} 
		set en_box_position_x [expr $en_box_position_x-$en_pc_space_x+$en_mos_spacing]
} 
