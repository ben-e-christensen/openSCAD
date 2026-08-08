module base_plate_mock_up(){

// Rotary Stewart Platform - Flush Motor Base Assembly w/ Perimeter Walls
// Configuration: M5 latches (19mm brackets), 120-degree corner ties, NEMA 23 Base Mount

$fn = 60;

// --- User Parameters ---
// Toggle this! (false = 3D Preview, true = 2D Layout for Laser Cutting)
export_2d = false; 

// --- Stepper & Hardware Dimensions ---
nema_width = 42.0;                
nema_length = 48.0;               
nema_hole_spacing = 31.0;         // M3 NEMA 17 Face Pattern
nema_boss_radius = 11.5;          
m3_clearance = 1.6;               

nema23_hole_spacing = 47.14;      // Standard NEMA 23 hole spacing for the base mount

m5_clearance = 2.6;               // 5.2mm diameter hole for structural M5 bolts
latch_hole_height = 9.5;          // Dead center of a 19mm tall L-bracket
side_hole_offset = 10.0;          // Distance from edge for the 120-degree corner ties

// --- Plate Layout Params ---
plate_thickness = 6.35;           // 1/4" Acrylic
motor_gap = 20;                   // Gap between motors for the center latch
side_padding = 20;                // Space on the far left/right for outer latches

pair_width = (nema_width * 2) + motor_gap + (side_padding * 2); 
pair_height = 42;                 // Clears the top NEMA bolt hole

center_radius = 85;               // Clears the inward-facing motor butts
angles = [270, 30, 150];          // 120-degree symmetry


// --- Dynamic Slat Math ---
function get_x(local_x, local_y, a) = local_x * cos(a) - local_y * sin(a);
function get_y(local_x, local_y, a) = local_x * sin(a) + local_y * cos(a);

p1x = get_x(-pair_width/2, center_radius, angles[0]);
p1y = get_y(-pair_width/2, center_radius, angles[0]);
p2x = get_x(pair_width/2, center_radius, angles[1]);
p2y = get_y(pair_width/2, center_radius, angles[1]);

// Subtract 12mm total to ensure slats drop in without colliding with faceplates
slat_length_adjusted = norm([p2x - p1x, p2y - p1y]) - 12;


// --- 2D Modules (For DXF Export) ---

module nema17_cutout() {
    circle(r=nema_boss_radius);
    for (x = [-nema_hole_spacing/2, nema_hole_spacing/2]) {
        for (y = [-nema_hole_spacing/2, nema_hole_spacing/2]) {
            translate([x, y]) circle(r=m3_clearance); 
        }
    }
}

// 3x M5 holes for the bottom latches on the faceplate
module faceplate_latch_holes_2d() {
    latch_offset_x = (nema_width + motor_gap/2 + side_padding/2);
    circle(r=m5_clearance); // Center
    translate([-latch_offset_x, 0]) circle(r=m5_clearance); // Left
    translate([latch_offset_x, 0]) circle(r=m5_clearance);  // Right
}

module motor_face_plate() {
    difference() {
        square([pair_width, pair_height], center=true);
        
        motor_z_offset = -pair_height/2 + (nema_width/2);
        
        // Left & Right Motor Cutouts
        translate([-(nema_width + motor_gap)/2, motor_z_offset]) nema17_cutout();
        translate([(nema_width + motor_gap)/2, motor_z_offset]) nema17_cutout();
        
        // Bottom Edge Latch Holes (Raised 9.5mm)
        translate([0, -pair_height/2 + latch_hole_height]) faceplate_latch_holes_2d();
        
        // 120-Degree Corner Tie Holes (Centered vertically, 10mm from left/right edges)
        translate([pair_width/2 - side_hole_offset, 0]) circle(r=m5_clearance);
        translate([-pair_width/2 + side_hole_offset, 0]) circle(r=m5_clearance);
    }
}

module wall_slat_2d() {
    difference() {
        square([slat_length_adjusted, pair_height], center=true);
        
        // Bottom Edge Latch Holes (Raised 9.5mm)
        translate([slat_length_adjusted/4, -pair_height/2 + latch_hole_height]) circle(r=m5_clearance);
        translate([-slat_length_adjusted/4, -pair_height/2 + latch_hole_height]) circle(r=m5_clearance);
        
        // 120-Degree Corner Tie Holes (Centered vertically, 10mm from left/right edges)
        translate([slat_length_adjusted/2 - side_hole_offset, 0]) circle(r=m5_clearance);
        translate([-slat_length_adjusted/2 + side_hole_offset, 0]) circle(r=m5_clearance);
    }
}

module outer_base_shape() {
    hull() {
        for (a = angles) {
            rotate([0, 0, a]) {
                translate([0, center_radius]) {
                    translate([pair_width/2 + 5, 10]) circle(r=2);
                    translate([-pair_width/2 - 5, 10]) circle(r=2);
                }
            }
        }
    }
}

module base_plate_2d() {
    difference() {
        outer_base_shape();
        
        // 1. Base mount holes for NEMA 23
        rotate([0,0,0])
        for (x = [-nema23_hole_spacing/2, nema23_hole_spacing/2]) {
            for (y = [-nema23_hole_spacing/2, nema23_hole_spacing/2]) {
                translate([x, y]) circle(r=m5_clearance);
            }
        }
        
        // 2. M5 Bracket holes for the Motor Face Plates (Inset 9.5mm from plate)
        for (a = angles) {
            rotate([0, 0, a]) {
                translate([0, center_radius - plate_thickness/2 - latch_hole_height]) {
                    faceplate_latch_holes_2d();
                }
            }
        }
        
        // 3. M5 Bracket holes for the Wall Slats
        for (i = [0:2]) {
            a1 = angles[i];
            a2 = angles[(i+1)%3];
            
            w_p1_x = get_x(-pair_width/2, center_radius, a1);
            w_p1_y = get_y(-pair_width/2, center_radius, a1);
            w_p2_x = get_x(pair_width/2, center_radius, a2);
            w_p2_y = get_y(pair_width/2, center_radius, a2);
            
            slat_mx = (w_p1_x + w_p2_x) / 2;
            slat_my = (w_p1_y + w_p2_y) / 2;
            
            angle_to_origin = atan2(-slat_my, -slat_mx);
            
            translate([slat_mx, slat_my]) {
                rotate([0, 0, angle_to_origin]) {
                    // Offset inward by plate thickness/2 + 9.5mm latch depth
                    bracket_inward_offset = plate_thickness/2 + latch_hole_height;
                    
                    translate([bracket_inward_offset, slat_length_adjusted/4]) circle(r=m5_clearance);
                    translate([bracket_inward_offset, -slat_length_adjusted/4]) circle(r=m5_clearance);
                }
            }
        }
        
        circle(r=15); // Central wire pass-through
    }
}


// --- 3D Modules (For Visualization) ---

module nema17_3d() {
    color("DimGray") translate([0, 0, -nema_length/2]) cube([42, 42, nema_length], center=true);
    color("Silver") translate([0, 0, 0]) cylinder(r=11, h=2, $fn=30);
    color("Silver") translate([0, 0, 0]) cylinder(r=2.5, h=24, $fn=30);
}

module assembly_3d() {
    color("LightBlue", 0.6) linear_extrude(plate_thickness) base_plate_2d();
    
    for (a = angles) {
        rotate([0, 0, a]) {
            translate([0, center_radius, plate_thickness + pair_height/2])
                rotate([90, 0, 0])
                color("LightBlue", 0.6) 
                linear_extrude(plate_thickness, center=true) 
                motor_face_plate();
                
            translate([0, center_radius - plate_thickness/2, plate_thickness + nema_width/2]) {
                translate([-(nema_width + motor_gap)/2, 0, 0]) rotate([-90, 0, 0]) nema17_3d();
                translate([(nema_width + motor_gap)/2, 0, 0]) rotate([-90, 0, 0]) nema17_3d();
            }
        }
    }
    
    for (i = [0:2]) {
        a1 = angles[i];
        a2 = angles[(i+1)%3];
        
        slat_p1_x = get_x(-pair_width/2, center_radius, a1);
        slat_p1_y = get_y(-pair_width/2, center_radius, a1);
        slat_p2_x = get_x(pair_width/2, center_radius, a2);
        slat_p2_y = get_y(pair_width/2, center_radius, a2);
        
        slat_angle = atan2(slat_p2_y - slat_p1_y, slat_p2_x - slat_p1_x);
        slat_mx = (slat_p1_x + slat_p2_x) / 2;
        slat_my = (slat_p1_y + slat_p2_y) / 2;
        
        translate([slat_mx, slat_my, plate_thickness + pair_height/2])
            rotate([0, 0, slat_angle])
            rotate([90, 0, 0])
            color("LightBlue", 0.6)
            linear_extrude(plate_thickness, center=true)
            wall_slat_2d();
    }
}

module top_plate() {
// base_plate.scad - Rotary Stewart Platform (DXF Export)
$fn = 60;

nema_width = 42.0;                
motor_gap = 20;                   
side_padding = 20;                
pair_width = (nema_width * 2) + motor_gap + (side_padding * 2); 

nema23_hole_spacing = 47.14;      
m5_clearance = 2.6;               
latch_hole_height = 9.5;          
bracket_depth = 15;               

center_radius = 90; // Expanded to 90mm to clear the NEMA 23 base mounts
angles = [270, 30, 150];          

function get_x(local_x, local_y, a) = local_x * cos(a) - local_y * sin(a);
function get_y(local_x, local_y, a) = local_x * sin(a) + local_y * cos(a);

p1x = get_x(-pair_width/2, center_radius, angles[0]);
p1y = get_y(-pair_width/2, center_radius, angles[0]);
p2x = get_x(pair_width/2, center_radius, angles[1]);
p2y = get_y(pair_width/2, center_radius, angles[1]);
slat_length_adjusted = norm([p2x - p1x, p2y - p1y]) - 12;

difference() {
    hull() {
        for (a = angles) {
            rotate([0, 0, a]) {
                translate([0, center_radius]) {
                    translate([pair_width/2 + 5, 10]) circle(r=2);
                    translate([-pair_width/2 - 5, 10]) circle(r=2);
                }
            }
        }
    }
    

    
    // Face Plate M5 Bracket Holes
    for (a = angles) {
        rotate([0, 0, a]) {
            translate([0, center_radius - 3.175 - latch_hole_height]) {
                
                
    // these are the holes that the ball joints line up with !!
                translate([-(nema_width + motor_gap/2 + side_padding/2)/2, 0]) circle(r=m5_clearance);
                translate([(nema_width + motor_gap/2 + side_padding/2)/2, 0]) circle(r=m5_clearance);
                
                
            }
        }
    }
    

    
    circle(r=15); // Center wire hole
}
}





// --- Main Execution Logic ---

if (export_2d) {
    translate([0, 0]) base_plate_2d();
    
    translate([-80, 160]) motor_face_plate();
    translate([80, 160]) motor_face_plate();
    translate([0, 220]) motor_face_plate();
    
    translate([-80, 280]) wall_slat_2d();
    translate([80, 280]) wall_slat_2d();
    translate([0, 340]) wall_slat_2d();
} else {
    assembly_3d();
}


}

module top_plate(){
    $fn = 64;
in = 25.4;

// --- Parameters ---
ball_radius = 100;         // ball joint distance from center (KINEMATICS-critical)
bolt_radius = 115;         // M5 bolt holes - outboard, near the edge
plate_thickness = 6.35;    // 1/4" acrylic
m5_clearance = 2.6;        // 5.2mm holes for M5 hardware
bolt_pair_spacing = 25;    // tangential spacing between the 2 bolts at each station
edge_margin = 20;          // plate material past the bolt holes

// True-symmetric ball-joint azimuths (deg): three identical pairs, 120deg
// apart, each pair spanning 30deg. Legs 0-5 in order.
ball_az = [15.00, 345.00, 255.00, 225.00, 135.00, 105.00];

// Bolt-hole azimuths sit at the SAME angles as their ball joints (each bolt
// station is radially outboard of its ball joint).
module bolt_pair_at(a) {
    rotate([0,0,a])
        translate([bolt_radius, 0]) {
            translate([0,  bolt_pair_spacing/2]) circle(r=m5_clearance);
            translate([0, -bolt_pair_spacing/2]) circle(r=m5_clearance);
            
            
        }
}

// Plate outline reaches just past the bolt holes at each station.
module plate_outline() {
    hull() {
        for (a = ball_az)
            rotate([0, 0, a])
                translate([bolt_radius + edge_margin, 0]) circle(r=8);
    }
}

module top_plate_2d() {
    difference() {
        plate_outline();
        for(i=[0:2]){
            rotate([0,0,120 * i])
            for(j=[0:1]){
                translate([bolt_radius, 31.5 - (63 * j)]) {
            translate([0,  bolt_pair_spacing/2]) circle(r=m5_clearance);
            translate([0, -bolt_pair_spacing/2]) circle(r=m5_clearance);            
        }
                }
                
        
    }
}}

module top_plate_3d() {
    color("Gold", 0.7) linear_extrude(plate_thickness) top_plate_2d();
    // red markers = ball-joint centers (radius 100, inboard of the bolts)
    for (a = ball_az)
        rotate([0, 0, a])
            translate([ball_radius, 0, plate_thickness/2])
                color("Red") sphere(d = 10);
    // faint 8" disk footprint, for clearance reference
    color("Blue", 0.12) translate([0,0,plate_thickness])
        linear_extrude(0.5) circle(r = 8*in/2);
}

// Toggle: true for a clean 2D DXF export (laser cutting), false for 3D preview.
export_2d = true;

if (export_2d) top_plate_2d();
else top_plate_3d();
    

}

top_plate();

base_plate_mock_up();


