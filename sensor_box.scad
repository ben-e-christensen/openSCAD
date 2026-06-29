$fn=64;

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
case_w=60;
case_l=75;
case_h=30;
h=4;
heatsink_bh_from_edge=5;
w=43.5;

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
    
    // Rectangular sensor
    translate([-large_d/2 - small_l/2 - 3, small_w/2 - 7, small_h/2])
        cube([small_l, small_w, small_h], center=true);
        
    // Wiring cutout
    translate([-large_d/2 - small_l/2 - 3, 0, small_h/2 + 5]){
        // Note: You may need to add [90, 0, 0] or similar to this rotate depending on wire routing direction
        rotate() 
            cylinder(150, small_wire_hole_radius, small_wire_hole_radius);
        
        translate([0, 75, -(small_h/2 + 5)/2])
            cube([small_wire_hole_radius*2, 150, small_h/2 + 5], center=true);
    }    
}

// --- Main Assembly ---
difference(){
    // Main Case Body
    cube([case_w, case_l, case_h], center=true);
    
    // Hollow out for sensors
    translate([9, -18, -case_h/2 - 1])
        sensors();
        
    // Mounting Holes (M3 Inserts)
    translate([case_w/2 - heatsink_bh_from_edge, case_l/2 - heatsink_bh_from_edge, -case_h/2])
        m3_insert_thru();
    translate([-case_w/2 + heatsink_bh_from_edge, case_l/2 - heatsink_bh_from_edge, -case_h/2])
        m3_insert_thru();
    translate([case_w/2 - heatsink_bh_from_edge, -case_l/2 + heatsink_bh_from_edge, -case_h/2])
        m3_insert_thru();
    translate([-case_w/2 + heatsink_bh_from_edge, -case_l/2 + heatsink_bh_from_edge, -case_h/2])
        m3_insert_thru();
}