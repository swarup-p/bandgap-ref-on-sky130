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

##Create local interconnect layer for ground strip##
set li_ground_strip_width 28904
set li_ground_strip_height 280
box position [expr $x+100] [expr $y+110]
box size $li_ground_strip_width $li_ground_strip_height
paint li

##Create psubstrate diffusion layer for ground strip##
set mvpsubdiff_ground_strip_width 28704
set mvpsubdiff_ground_strip_height 280
box position [expr $x+200] [expr $y+110]
box size $mvpsubdiff_ground_strip_width $mvpsubdiff_ground_strip_height
paint mvpsubdiff

##Create pubstratecontact area in ground strip##
set mvpsc_width 100
set mvpsc_height 100
set mvpsc_spacing 300
set number_of_mvpsc [expr $mvpsubdiff_ground_strip_width/300]
set box_position_x [expr $x+320]
set box_position_y [expr $y+200]
for {set i 1} {$i <= $number_of_mvpsc} {incr i} {
	box position $box_position_x $box_position_y
	box size $mvpsc_width $mvpsc_height
	paint mvpsc
	set box_position_x [expr $box_position_x+$mvpsc_spacing]
} 

##Create power strip##
set power_strip_width 29104
set power_strip_height 300
box position $x [expr $x+9650] 
box size $power_strip_width $power_strip_height
paint metal1

##Create n-well for power strip##
set nw_power_strip_width 29104
set nw_power_strip_height 400
box position $x [expr $x+9600]
box size $nw_power_strip_width $nw_power_strip_height
paint nwell

##Create local interconnect layer for power strip##
set li_power_strip_width 28904
set li_power_strip_height 280
box position [expr $x+100] [expr $y+9660]
box size $li_power_strip_width $li_power_strip_height
paint li

##Create nsubstrate diffusion layer for power strip##
set mvnsubdiff_power_strip_width 28704
set mvnsubdiff_power_strip_height 280
box position [expr $x+200] [expr $y+9660]
box size $mvnsubdiff_power_strip_width $mvnsubdiff_power_strip_height
paint mvnsubdiff

##Create nsubstratecontact area in power strip##
set mvnsc_width 100
set mvnsc_height 100
set mvnsc_spacing 300
set number_of_mvnsc [expr $mvnsubdiff_power_strip_width/300]
set box_position_x [expr $x+320]
set box_position_y [expr $y+9750]
for {set i 1} {$i <= $number_of_mvnsc} {incr i} {
	box position $box_position_x $box_position_y
	box size $mvnsc_width $mvnsc_height
	paint mvnsc
	set box_position_x [expr $box_position_x+$mvpsc_spacing]
} 
