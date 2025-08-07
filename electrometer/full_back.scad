use <box_house.scad>;
use <pins_module.scad>;

condos();

l=23*8;

w=75;
h=3;



rotate([0,0,-45])
difference(){
    

translate([0,0,h/2])
cube([l,w,h],center=true);

translate([0,0,-h])
cylinder(h*5,22,22);
    
translate([23*1.5,0,-2])
pins();
}


