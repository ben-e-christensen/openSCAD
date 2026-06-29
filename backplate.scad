$fn=64;

// --- Carriage Variables ---
carriage_width = 51.5;
w = 43.5;
heatsink_bh_from_edge = 5;

// --- Alignment & Spacing ---
h_x = 68;
heatsink_bh_from_top = 7.5;
heatsink_bh_from_bottom = 9.5;
hole_spacing = 15;

// --- Pivot & Slot Math ---
pivot_drop = 30;     // Z-distance from holes down to the pivot point
pivot_a = 20;        // Total degrees the slot will allow 
slot_bolt_r = 1.7;   // M3 clearance radius

bolt_x = w/2 - heatsink_bh_from_edge;
true_radius = sqrt(pow(bolt_x, 2) + pow(pivot_drop, 2));
bolt_angle = atan(bolt_x / pivot_drop); // Angle from vertical Z-axis

// --- Modules ---
module backplate(w=51.5) {
    difference() {
        // Main body
        cube([w, 8, 100], center=true);
        
        // Loop for the Kinematic Slots (Replacing standard holes)
        translate([0,0,10])
        for(z_offset = [h_x/2 - heatsink_bh_from_top : -hole_spacing : -h_x/2 + heatsink_bh_from_bottom]) {
            
            // Translate down to the shared pivot point for this set of holes
            translate([0, 0, z_offset - pivot_drop]) {
                
                // Right slot: Tilted by bolt_angle to perfectly hit [bolt_x, 0, z_offset]
                rotate([0, bolt_angle, 0]) 
                    kinematic_slot(bolt_radius=slot_bolt_r, radius=true_radius, angle=pivot_a, depth=20);
                
                // Left slot: Tilted negative to perfectly hit [-bolt_x, 0, z_offset]
                rotate([0, -bolt_angle, 0]) 
                    kinematic_slot(bolt_radius=slot_bolt_r, radius=true_radius, angle=pivot_a, depth=20);
            }
        }
    }
}

module kinematic_slot(bolt_radius, radius, angle, depth) {
    // 3. Rotate 90deg on X so it cuts cleanly through the Y axis (front-to-back)
    rotate([90, 0, 0])
    // 2. Offset the rotation so the arc is perfectly centered on the vertical axis
    rotate([0, 0, 90 - angle/2]) { 
        union() {
            // 1. Generate the curved slot body in XY plane
            rotate_extrude(angle=angle)
                translate([radius, 0, 0])
                square([bolt_radius * 2, depth], center=true);
                
            // Endcap 1 (Bottom of travel)
            translate([radius, 0, 0])
                cylinder(h=depth, r=bolt_radius, center=true);
                
            // Endcap 2 (Top of travel)
            rotate([0, 0, angle])
                translate([radius, 0, 0])
                cylinder(h=depth, r=bolt_radius, center=true);
        }
    }
}

