use <backyard.scad>;

$fn=64;

l=60;
l2=40;
w=22;
h=3;
r = 4 * 25.4-20-w;
lip = 1;



// wire holes = 1.1 diameter
// 13mm to first hole from screw hole
// 2.8mm apart

//rotate([90,0,0])


module house(){
module box() {
difference(){
cube([l,w,l2], center=true);

translate([0,h,0])
cube([l-h,w,l2-h], center=true);

    
    rotate([90,0,0])
    translate([-29/2,0,-100])
cylinder(1000,1.45,1.45);
    
    rotate([90,0,0])
        translate([-(29/2-10),0,-100])
    cylinder(100,25.4/4,25.4/4);
    
    rotate([90,0,0])
translate([20.35/2,0,-100])
cylinder(1000,25.4/4,25.4/4);
    
    rotate([0,180,0])
    translate([5,0,0])
    cylinder(100,3,3);
}}

translate([0,0,w/2])
rotate([90,0,0])
box();

}

rotate([0,0,45])
translate([r-2,0,0])
house();

rotate([0,0,45])
translate([-(r-2),0,0])
house();

backyard();

