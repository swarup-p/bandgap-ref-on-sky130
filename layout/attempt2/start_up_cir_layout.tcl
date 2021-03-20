##Initiaze pointer##
set x 0
set y 0
box position $x $y

##Startup circuit layout##
##all related variables start with 'sc'##
##pmos layout starts here##
#Create poly-strips#
set sc_poly_width 150
set sc_poly_height 8000
box position [expr $x+200] [expr $y+1532]
box size $sc_poly_width $sc_poly_height
paint poly

#Create mvpdiff area#
set sc_mvpdiff_width 50
set sc_mvpdiff_height 8070
box position [expr $x+250] [expr $y+1497]
box size $sc_mvpdiff_width $sc_mvpdiff_height
paint mvpdiffusion

#Create local interconnect layer#
#Local interconnect layer starts here#
#For source and drain terminals#
set sc_li_width 50
set sc_li_height 17
set sc_number_of_li 2
set sc_box_position_x [expr $x+250]
set sc_box_position_y [expr $y+1506]
set sc_box_spacing 8035
for {set i 1} {$i <= $sc_number_of_li} {incr i} {
	box position $sc_box_position_x $sc_box_position_y 
	box size $sc_li_width $sc_li_height
	paint li
	set sc_box_position_y [expr $sc_box_position_y+$sc_box_spacing]
} 

#For gate and drain connection#
set sc_li_width 17
set sc_li_height 8026
set sc_box_position_x [expr $x+325]
set sc_box_position_y [expr $y+1506]
box position $sc_box_position_x $sc_box_position_y 
box size $sc_li_width $sc_li_height
paint li

#Local interconnect layer ends here#

#Create pdiffusioncontact area#
#Pdiffusioncontact starts here#
#Contacts for sorce and drain#
set sc_mvpdc_width 34
set sc_mvpdc_height 17
set sc_mos_terminals 2
set sc_terminals_spacing 8035
set sc_box_position_x [expr $x+258]
set sc_box_position_y [expr $y+1506]
for {set j 1} {$j <= $sc_mos_terminals} {incr j} {
	box position $sc_box_position_x $sc_box_position_y
	box size $sc_mvpdc_width $sc_mvpdc_height
	paint mvpdcontact
	set sc_box_position_y [expr $sc_box_position_y+$sc_terminals_spacing]
} 

#Pdiffusioncontact ends here#

#Create poly contact#
#Polycontact starts here#
#Contact for gate-drain connection#
set sc_pc_width 17
set sc_pc_height 100
set sc_number_of_pc 40
set sc_pc_spacing_y 100
set sc_box_position_x [expr $x+325]
set sc_box_position_y [expr $y+1582]
for {set i 1} {$i <= $sc_number_of_pc} {incr i} { 
	box position $sc_box_position_x $sc_box_position_y
	box size $sc_pc_width $sc_pc_height
	paint pcontact
	set sc_box_position_y [expr $sc_box_position_y+$sc_pc_height+$sc_pc_spacing_y]
} 


#Polycontacts ends here#

#Create n-well area#
set sc_nw_width 150
set sc_nw_height 8136
box position [expr $x+200] [expr $y+1464]
box size $sc_nw_width $sc_nw_height
paint nwell

##Pmos layout ends here##

##Nmos layout starts here##
#Create poly-strips#
set sc_poly_width 100
set sc_poly_height 402
set sc_number_of_poly 2
set sc_box_position_x [expr $x+225]
set sc_box_position_y [expr $y+550]
set sc_poly_spacing 25
for {set i 1} {$i <= $sc_number_of_poly} {incr i} {
	box position $sc_box_position_x $sc_box_position_y
	box size $sc_poly_width $sc_poly_height
	paint poly
	set sc_box_position_y [expr $sc_box_position_y+$sc_poly_height+$sc_poly_spacing]
} 

#Create mvndiffusion area#
set sc_mvndiff_width 170
set sc_mvndiff_height 300
set sc_number_of_mvndiff 2
set sc_mvndiff_spacing 127
set sc_box_position_x [expr $x+190]
set sc_box_position_y [expr $y+601]
for {set i 1} {$i <= $sc_number_of_mvndiff} {incr i} {
	box position $sc_box_position_x $sc_box_position_y 
	box size $sc_mvndiff_width $sc_mvndiff_height
	paint mvndiff
	set sc_box_position_y [expr $sc_box_position_y+$sc_mvndiff_spacing+$sc_mvndiff_height]
} 

#Create local interconnect layer#
#For source and drain terminals#
set sc_li_width 17 
set sc_li_height 300
set sc_mos_terminals 2
set sc_box_position_x [expr $x+199]
set sc_box_position_y [expr $y+601]
set sc_li_spacing_x 135
set sc_li_spacing_y 127
for {set j 1} {$j <= $sc_mos_terminals} {incr j} {
	for {set i 1} {$i <= $sc_mos_terminals} {incr i} {
		box position $sc_box_position_x $sc_box_position_y
		box size $sc_li_width $sc_li_height
		paint li
		set sc_box_position_y [expr $sc_box_position_y+$sc_li_spacing_y+$sc_li_height]
	} 
	set sc_box_position_x [expr $sc_box_position_x+$sc_li_spacing_x]
	set sc_box_position_y [expr $y+601]
}

#Create ndiffusioncontact area#
set sc_mvndc_width 17 
set sc_mvndc_height 91
set sc_mos_terminals 2
set sc_mos_spacing 127
set sc_box_position_x [expr $x+199]
set sc_box_position_y [expr $y+610]
set sc_mvndc_spacing_x 135
set sc_mvndc_spacing_y 100
for {set k 1} {$k <= $sc_mos_terminals} {incr k} {
	for {set j 1} {$j <= $sc_mos_terminals} {incr j} {
		for {set i 1} {$i <= $sc_mos_terminals} {incr i} {
			box position $sc_box_position_x $sc_box_position_y
			box size $sc_mvndc_width $sc_mvndc_height
			paint mvndcontact
			set sc_box_position_y [expr $sc_box_position_y+$sc_mvndc_spacing_y+$sc_mvndc_height]
			}
		set sc_box_position_y [expr $y+610+300+$sc_mos_spacing]
		} 
	set sc_box_position_x [expr $sc_box_position_x+$sc_mvndc_spacing_x]
	set sc_box_position_y [expr $y+610]
} 

