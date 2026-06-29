// clamping_motor_horn.scad - 3D Printable Motor Horn (STL Export)
// Features a friction-clamp design with an integrated M3 nut trap for zero-slip torque.

$fn = 60;

// --- User Parameters ---
throw_length = 20.0;      // Distance from motor shaft center to the Traxxas rod end
horn_thickness = 8.0;     // Overall thickness of the horn

hub_dia = 14.0;           // Outer diameter of the central hub
tip_dia = 10.0;           // Outer diameter of the tip (where the rod end attaches)

shaft_dia = 5.2;          // 5mm motor shaft + 0.2mm 3D printing tolerance
flat_depth = 0.6;         // Depth of the NEMA 17 D-shaft flat
m3_clearance = 1.7;       // 3.4mm diameter for M3 bolts to pass through freely


// --- Cutout Modules ---

// The D-Shaft profile
module d_shaft_cutout() {
    difference() {
        cylinder(r=shaft_dia/2, h=horn_thickness + 2, center=true);
        // Slices off the top edge to create the flat for the D-shaft
        translate([0, (shaft_dia/2) - flat_depth + 2.5, 0])
            cube([shaft_dia+2, 5, horn_thickness + 4], center=true);
    }
}

// --- Main Horn Geometry ---

difference() {
    // 1. --- MAIN SOLID BODY ---
    union() {
        // The lever arm
        hull() {
            cylinder(r=hub_dia/2, h=horn_thickness, center=true);
            translate([throw_length, 0, 0]) 
                cylinder(r=tip_dia/2, h=horn_thickness, center=true);
        }
        
        // The clamping block (extends backwards from the shaft)
        translate([-7, 0, 0]) 
            cube([12, 12, horn_thickness], center=true);
    }
    
    // 2. --- NEGATIVE CUTOUTS ---
    
    // Motor Shaft
    d_shaft_cutout();
    
    // Linkage Hole (For attaching the Traxxas rod end with an M3 bolt)
    translate([throw_length, 0, 0]) 
        cylinder(r=m3_clearance, h=horn_thickness + 2, center=true);
        
    // Clamping Slit (Allows the plastic to flex and grip the shaft)
    translate([-10, 0, 0]) 
        cube([20, 1.5, horn_thickness + 2], center=true);
        
    // Clamping Bolt Hole (Passes perpendicularly through the slit)
    translate([-7, 0, 0]) 
        rotate([90, 0, 0]) 
        cylinder(r=m3_clearance, h=20, center=true);
        
    // M3 Hex Nut Trap
    // Fits a standard M3 nut. Drop the nut in here, it locks in place so you can tighten from the other side.
    translate([-7, 4.5, 0]) 
        rotate([90, 30, 0]) 
        cylinder(r=3.3, h=4, $fn=6, center=true);
        
    // Bolt Head Recess
    // Sinks the head of the M3 cap screw into the plastic so it looks clean.
    translate([-7, -4.5, 0]) 
        rotate([90, 0, 0]) 
        cylinder(r=3.2, h=4, center=true);
}