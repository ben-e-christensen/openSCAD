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
        // 1. The main solid shape
        plate_outline(); 
        
        // 2. Subtract the bolt holes
        for(i=[0:2]){ 
            rotate([0,0,120 * i]) 
            for(j=[0:1]){ 
                translate([bolt_radius, 31.5 - (63 * j)]) { 
                    translate([0,  bolt_pair_spacing/2]) circle(r=m5_clearance); 
                    translate([0, -bolt_pair_spacing/2]) circle(r=m5_clearance);            
                } 
            } 
        }
        
        // 3. Subtract the central cutout
        difference() {
            offset(r=-82.5) plate_outline();
            
            // Protect the bolt areas by hullling across the pairs.
            // This forces a straight edge across the "valley" you highlighted.
            for (angle = [0, 120, 240]) {
                rotate([0, 0, angle]) {
                    hull() {
                        // First half of the pair (+15 degrees)
                        rotate([0, 0, 15]) {
                            translate([bolt_radius + edge_margin, 0]) circle(r=25);
                            translate([bolt_radius - 7.5, 0]) circle(r=0);
                        }
                        // Second half of the pair (-15 degrees)
                        rotate([0, 0, -15]) {
                            translate([bolt_radius + edge_margin, 0]) circle(r=25);
                            translate([bolt_radius - 7.5, 0]) circle(r=0);
                        }
                    }
                }
            }
        }
        
        circle(d=8*25.4);
        translate([-100-2,0,0])
        square(25.4*3/16,center=true);
    } 
} 

top_plate_2d();

