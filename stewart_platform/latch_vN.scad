$fn = 64;
in = 25.4;

// --- Parameters ---
ball_radius = 100;         // ball joint distance from center (KINEMATICS-critical)
bolt_radius = 115;         // M5 bolt holes - outboard, near the edge
plate_thickness = 6.35;    // 1/4" acrylic
m5_clearance = 2.6;        // 5.2mm holes for M5 hardware
bolt_pair_spacing = 25;    // tangential spacing between the 2 bolts at each station
edge_margin = 12;          // plate material past the bolt holes


difference(){
    
    cube([bolt_pair_spacing+10,20,4],center=true);
    translate([bolt_pair_spacing/2,0,-5]) 
    cylinder(10,m5_clearance,m5_clearance);
    translate([-bolt_pair_spacing/2,0,-5]) 
    cylinder(10,m5_clearance,m5_clearance);
}

translate([0,5,-12])
rotate([90,0,0])
difference(){
    cube([19,20,4],center=true);
    translate([0,0,-5]) 
    cylinder(10,m5_clearance,m5_clearance);
}