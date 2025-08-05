use <backyard.scad>;

$fn=64;

l=45;
l2=30;
w=22;
h=3;
r = 4 * 25.4-20-w;
lip = 1;

jt_screw= 2.8;

module jt_module() {
        rotate([0,0,90])
    translate([28.35/2 - 13,0,-100])
cylinder(200,0.6,0.6);
    
        rotate([0,0,90])
    translate([28.35/2 - 13 - jt_screw,0,-100])
cylinder(200,0.6,0.6);
    
        rotate([0,0,90])
    translate([28.35/2 - 13 - (jt_screw * 2),0,-100])
    //rotate([90,0,0])
cylinder(200,0.6,0.6);

    rotate([0,0,90])
    translate([28.35/2 - 13 - (jt_screw * 3),0,-100])
cylinder(200,0.6,0.6);
}

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
translate([28.35/2,0,-100])
cylinder(200,1.35,1.35);
    
    rotate([90,0,0])
    translate([-28.35/2,0,-100])
cylinder(1000,1.35,1.35);
    
    rotate([0,0,-90])
    translate([0,0,-100])
    jt_module();
    

}}

module lid() {
difference() {

cube([l2-2,l+lip,h-1], center=true);
    
translate([0,l/2-lip-h,-2])
cylinder(10,1.4,1.4); 
}
}

translate([0,0,w/2])
difference(){
rotate([90,0,0])
box();

rotate([0,0,90])
translate([0,1,(w-h)/2-1])
lid();
}
}

rotate([0,0,45])
translate([r+6,0,0])
house();

backyard();

