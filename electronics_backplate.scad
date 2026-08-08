use <altoid_electro.scad>

$fn=100;

radius = 203/2;

probe=1.8*25.4;

bh=5;

center_of_bh_from_edge = 10;

probe_hole = 9;
d=7.5;
rim_width = 22;
// dimensions for altoid box
a_l = 94;
a_w = 61;

adc_w = 24.384;
adc_l = 41.91;
r_b = 1.55;

difference(){
    circle(r = radius);
        
    // mounting holes
    for(i=[0:7]){
        rotate([0,0,i*45])
        translate([radius - center_of_bh_from_edge,0,0])
        circle(d=5.2);
    }
    
    // hub cutout
    circle(rim_width);

    // hole for rods
    translate([probe,0]) circle(probe_hole);
    translate([-probe,0]) circle(probe_hole);
    
    // standoffs for altoid tins
    translate([-a_w+5,-4,0])
    altoids(true,true);
    translate([a_w-5,-4,0])
    altoids(false,true);
    translate([0,65,0])
    power_board(true);
   
}






