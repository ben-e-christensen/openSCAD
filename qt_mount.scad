$fn=100;
r3=1.3;
shift=2.6;
qt_w=18;
module bracket() {
difference(){
    cube([20,25,3],center=true);
    translate([0,0,-5])
    cylinder(100,2.6,2.6);
}
}
module qt(){
difference(){
    cube([20,6,3],center=true);
    
    translate([qt_w/2-shift,3-shift,-2])
    cylinder(10,1.3,1.3);
    translate([-qt_w/2+shift,3-shift,-2])
    cylinder(10,1.3,1.3);
}}


bracket();
translate([0,11,4])
rotate([90,0,0])
qt();