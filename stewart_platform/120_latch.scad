// corner_bracket_120.scad - 3D Printable Inner Tie Bracket with Slotted Holes (STL Export)
$fn = 60;

// --- Parameters ---
thickness = 6.0;          // Thick enough to withstand heavy torque
height = 20.0;            // Matches the vertical footprint of the wall
leg_length = 20.0;        // Reaches the 10mm inset holes perfectly
hole_offset = 10.0;       // Distance from the corner to the center of the slot

// --- User's Custom Bolt Slot Module ---
module bolt_slat(){
    translate([0,1.3,0])
    cylinder(100,2.6,2.6);
    
    translate([0,0,50])
    cube([5.2,4,100],center=true);
    
    translate([0,-1.3,0])
    cylinder(100,2.6,2.6);
}

// Wrapper to center and orient the slot horizontally through the bracket wall
module horizontal_bolt_slot() {
    // 1. translate Z by -50 to center the 100mm cylinders on the origin
    // 2. rotate [0, 90, 90] points the 100mm punch depth along the Y axis 
    //    and orientates the slot's wiggle room along the X axis.
    rotate([0, 90, 90]) translate([0, 0, -50]) bolt_slat();
}

// --- Main Bracket Geometry ---
difference() {
    union() {
        // Leg 1 (Right Side)
        translate([leg_length/2, thickness/2, 0]) 
            cube([leg_length, thickness, height], center=true);
            
        // Leg 2 (Left Side, angled at 120 degrees)
        // Shifted by -thickness/2 so it sits cleanly on the inside of the corner
        rotate([0, 0, 120]) 
            translate([leg_length/2, -thickness/2, 0]) 
            cube([leg_length, thickness, height], center=true);
            
        // Cleanly fills the small outer V-notch where the two rectangles meet
        hull() {
            translate([thickness/2, thickness/2, 0]) 
                cube([thickness, thickness, height], center=true);
            rotate([0, 0, 120]) 
                translate([thickness/2, -thickness/2, 0]) 
                cube([thickness, thickness, height], center=true);
        }
    }
    
    // Inner corner relief cut
    // Removes the absolute sharp tip so the bracket doesn't bottom out on the acrylic seam
    cylinder(r=1.0, h=height+2, center=true);

    // Slotted Bolt Hole - Leg 1
    translate([hole_offset, 0, 0]) 
        horizontal_bolt_slot();
        
    // Slotted Bolt Hole - Leg 2
    rotate([0, 0, 120]) 
        translate([hole_offset, 0, 0]) 
        horizontal_bolt_slot();
}