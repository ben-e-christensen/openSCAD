use <box_house.scad>;
use <pins_module.scad>;
use <cable_slot.scad>;
use <battery_house.scad>;

$fn=300;
rotate([0,0,45])
condos();
segment=23;
l=segment*8;

w=75;
h=3;

difference(){
    

translate([0,0,h/2])
cube([l,w,h],center=true);

translate([0,0,-h])
cylinder(h*5,22,22);
    
translate([segment*1.5,0,-2])
pins();
}

rotate([0,0,180])
translate([-segment*3-5,4,0])
battery_house();

rotate([0,0,90])
translate([10,segment*2.75,0])
battery_house();

rotate([0,0,90])
translate([-10,segment*2.75,0])
battery_house();





