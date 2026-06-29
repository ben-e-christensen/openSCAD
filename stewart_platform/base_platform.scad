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
    
    // NEMA 23 Base Mount
    for (x = [-nema23_hole_spacing/2, nema23_hole_spacing/2]) {
        for (y = [-nema23_hole_spacing/2, nema23_hole_spacing/2]) {
            translate([x, y]) circle(r=m5_clearance);
        }
    }
    
    // Face Plate M5 Bracket Holes
    for (a = angles) {
        rotate([0, 0, a]) {
            translate([0, center_radius - 3.175 - latch_hole_height]) {
                circle(r=m5_clearance);
                translate([-(nema_width + motor_gap/2 + side_padding/2), 0]) circle(r=m5_clearance);
                translate([(nema_width + motor_gap/2 + side_padding/2), 0]) circle(r=m5_clearance);
            }
        }
    }
    
    // Wall Slat M5 Bracket Holes
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
                translate([3.175 + latch_hole_height, slat_length_adjusted/4]) circle(r=m5_clearance);
                translate([3.175 + latch_hole_height, -slat_length_adjusted/4]) circle(r=m5_clearance);
            }
        }
    }
    
    circle(r=15); // Center wire hole
}