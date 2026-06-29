$fn=64;
use <backplate.scad>

// --- Sensor & Box Parameters ---
large_d=32;
large_h=70;
small_h=35;
small_h_actual=25;
small_w=58.5;
small_l=14.5;
small_sensor_distance=6.5;
small_wire_hole_radius=6;
small_bolt_hole_radius=2;
small_bolt_hole_distance_from_edge=2;
bh=small_bolt_hole_radius+small_bolt_hole_distance_from_edge;

// --- Carriage & Case Parameters ---
carriage_width=51.5;
case_w=40;
case_l=51.5;
case_h=30;
h=4;
heatsink_bh_from_edge=5;
w=43.5;

h_x = 68;


// --- Modules ---
module m3_insert_thru(total_depth=10, insert_depth=4.5, height=25) {
    // Top: heat insert pocket
    cylinder(d=4.6, h=insert_depth);
    // Bottom: clearance hole for bolt to pass through
    cylinder(d=3.2, h=height);
}

module sensors(){
    // Large cylindrical sensor
    cylinder(large_h, d=large_d);  
}

// --- Main Assembly ---
difference(){
    // Main Case Body
    cube([case_w, case_l, case_h], center=true);
    
    // Hollow out for sensors
    translate([0, 0, -case_h/2 - 1])
        sensors();
    
    // m3_insert_thru();
    translate([0,-case_l/2-.1,0])
rotate([-90,0,0])
m3_insert_thru();
        

}

rotate([0,0,90])
translate([0,-case_w/2-h/2,h_x/2+1])
backplate();

