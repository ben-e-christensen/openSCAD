use <top_plate_mock_up.scad>
use <base_plate_mock_up.scad>
use <motor_horn_v3.scad>
in = 25.4;
$fn=64;
// distance from top of base plate to bottom of top plate = 7 inches
module end_joint(){
    sphere(d=12.5);
    rotate([0,90,0])
    cylinder(20,2.4,2.4);
    
}

base_plate_mock_up();

for (i=[0:2]){
    rotate([0,0,120 * i]){
translate([102,31,21 + 1/4*in])
rotate([0,-90,0]){
    translate([25,0,-10])
    rotate([10,70,25])
    cylinder(140,2.5,2.5);
    translate([20,0,-10])
    rotate([0,-90,0])
end_joint();
motor_horn();
}
    translate([102,-31,21 + 1/4*in])
rotate([0,-90,0]){
    translate([25,0,-10])
    rotate([-10,70,-25])
    cylinder(140,2.5,2.5);
    translate([20,0,-10])
    rotate([0,-90,0])
end_joint();
motor_horn();
}}
    
}

translate([0,0,7*in])
rotate([0,0,60])
top_plate_mock_up();
