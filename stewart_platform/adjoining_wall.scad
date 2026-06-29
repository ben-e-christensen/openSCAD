// wall_slat.scad - Rotary Stewart Platform (DXF Export)
$fn = 60;

nema_width = 42.0;                
motor_gap = 20;                   
side_padding = 20;                
pair_width = (nema_width * 2) + motor_gap + (side_padding * 2); 
pair_height = 42;                 

m5_clearance = 2.6;               
latch_hole_height = 9.5;          
side_hole_offset = 10.0;          
center_radius = 90;               
angles = [270, 30, 150];          

function get_x(local_x, local_y, a) = local_x * cos(a) - local_y * sin(a);
function get_y(local_x, local_y, a) = local_x * sin(a) + local_y * cos(a);

p1x = get_x(-pair_width/2, center_radius, angles[0]);
p1y = get_y(-pair_width/2, center_radius, angles[0]);
p2x = get_x(pair_width/2, center_radius, angles[1]);
p2y = get_y(pair_width/2, center_radius, angles[1]);

slat_length_adjusted = norm([p2x - p1x, p2y - p1y]) - 12;
echo(slat_length_adjusted);
difference() {
    square([83, pair_height], center=true);
    
    // Bottom Latch Holes
    translate([slat_length_adjusted/4, -pair_height/2 + latch_hole_height]) circle(r=m5_clearance);
    translate([-slat_length_adjusted/4, -pair_height/2 + latch_hole_height]) circle(r=m5_clearance);
    
    // 120-Degree Corner Tie Holes
    translate([83/2 - side_hole_offset, 10]) circle(r=m5_clearance);
    translate([-83/2 + side_hole_offset, 10]) circle(r=m5_clearance);
}