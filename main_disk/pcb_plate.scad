

$fn=300;

radius = 203/2;

bh=5;

center_of_bh_from_edge = 10;

hole = 26/4;
d=7.5;
rim_width = 22;
// dimensions for altoid box
a_l = 90;
a_w = 60;

adc_pcb_x = 10;
adc_pcb_y = 35;
adc_w = 24.384;
adc_l = 41.91;
r_b = 1.55;


module altoids_box_2d() {
    circle(r_b);
    translate([2/3*a_w,0]) circle(r_b);
    translate([0,2/3*a_l]) circle(r_b);
    translate([2/3*a_w,2/3*a_l]) circle(r_b);

    translate([1/3*a_w,1/3*a_l]) circle(hole);
}

difference(){
    circle(r = radius);
    
    translate([radius - center_of_bh_from_edge,0,0])
    circle(d=5);
    
    rotate([0,0,45])
    translate([radius - center_of_bh_from_edge,0,0])
    circle(d=5);
    
    rotate([0,0,90])
    translate([radius - center_of_bh_from_edge,0,0])
    circle(d=5);
    
    rotate([0,0,135])
    translate([radius - center_of_bh_from_edge,0,0])
    circle(d=5);
    
    rotate([0,0,180])
    translate([radius - center_of_bh_from_edge,0,0])
    circle(d=5);
    
    rotate([0,0,225])
    translate([radius - center_of_bh_from_edge,0,0])
    circle(d=5);
    
    rotate([0,0,270])
    translate([radius - center_of_bh_from_edge,0,0])
    circle(d=5);
    
    rotate([0,0,315])
    translate([radius - center_of_bh_from_edge,0,0])
    circle(d=5);
    
    rotate([0,0,360])
    translate([radius - center_of_bh_from_edge,0,0])
    circle(d=5);
    
        circle(rim_width);

    translate([a_w/1.5,-1/3*a_l]) altoids_box_2d();
    translate([-a_w*1.33,-1/3*a_l]) altoids_box_2d();
    
    translate([adc_pcb_x, adc_pcb_y])
    circle(r_b);
        translate([adc_pcb_x - adc_w, adc_pcb_y + adc_l])
    circle(r_b);
}