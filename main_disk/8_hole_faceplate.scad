// 180


$fn=300;

radius = 203/2;

bh=5;

center_of_bh_from_edge = 10;



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
}