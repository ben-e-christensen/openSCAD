// face_plate.scad - Rotary Stewart Platform (DXF Export)
$fn = 60;

nema_width = 42.0;                
nema_hole_spacing = 31.0;         
nema_boss_radius = 11.5;          
m3_clearance = 1.6;               
m5_clearance = 2.6;               

motor_gap = 20;                   
side_padding = 20;                
pair_width = (nema_width * 2) + motor_gap + (side_padding * 2); 
pair_height = 42;                 

latch_hole_height = 9.5;          
side_hole_offset = 10.0;          

difference() {
    square([pair_width, pair_height], center=true);
    
    motor_z_offset = -pair_height/2 + (nema_width/2);
    
    // Left & Right Motor Cutouts
    for (offset_x = [-(nema_width + motor_gap)/2, (nema_width + motor_gap)/2]) {
        translate([offset_x, motor_z_offset]) {
            circle(r=nema_boss_radius);
            for (x = [-nema_hole_spacing/2, nema_hole_spacing/2]) {
                for (y = [-nema_hole_spacing/2, nema_hole_spacing/2]) {
                    translate([x, y]) circle(r=m3_clearance); 
                }
            }
        }
    }
    
    // Bottom Latch Holes
    translate([0, -pair_height/2 + latch_hole_height]) {
        circle(r=m5_clearance);
        translate([-(nema_width + motor_gap/2 + side_padding/2), 0]) circle(r=m5_clearance);
        translate([(nema_width + motor_gap/2 + side_padding/2), 0]) circle(r=m5_clearance);
    }
    
    // 120-Degree Corner Tie Holes
    translate([pair_width/2 - side_hole_offset, 10]) circle(r=m5_clearance);
    translate([-pair_width/2 + side_hole_offset, 10]) circle(r=m5_clearance);
}