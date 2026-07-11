$fn=64;
in=25.4;

l1=(14 + 3/8) * in;
w1=(9 + 9/16) * in;

w2=4*in;

// roughly 17.5 inches. width of whole box (just under acrylic sheet dimensions)
w3=w1+2*w2;
l3=in*3;

l4=in*6;

l5=l1+l3+l4;

latch_height=(l1+l3)/2;

m5=2.6;
edge_dist=16.5;
hinge=14;

module top_plate(){
nema_width    = 42.0;
motor_gap     = 20;
side_padding  = 20;
pair_width    = (nema_width * 2) + motor_gap + (side_padding * 2);

m5_clearance      = 2.6;
latch_hole_height = 9.5;
bracket_offset    = 3.175; // standoff from slat edge to hole row

center_radius = 90; // expanded to clear NEMA 23 base mounts
angles = [270, 30, 150];

// Rotate a local 2D point by angle a, return [x, y]
function rot(p, a) = [
    p.x * cos(a) - p.y * sin(a),
    p.x * sin(a) + p.y * cos(a)
];

// Slat length is the same for all 3 sides (equilateral layout),
// so compute it once from any adjacent pair.
p1 = rot([-pair_width/2, center_radius], angles[0]);
p2 = rot([ pair_width/2, center_radius], angles[1]);
slat_length_adjusted = norm(p2 - p1) - 12;

// Wall Slat M5 Bracket Holes
for (i = [0:2]) {
    a1 = angles[i];
    a2 = angles[(i + 1) % 3];

    w_p1 = rot([-pair_width/2, center_radius], a1);
    w_p2 = rot([ pair_width/2, center_radius], a2);

    slat_m = (w_p1 + w_p2) / 2;
    angle_to_origin = atan2(-slat_m.y, -slat_m.x);

    translate(slat_m) {
        rotate([0, 0, angle_to_origin]) {
            translate([bracket_offset + latch_hole_height,  slat_length_adjusted/4]) circle(r = m5_clearance);
            translate([bracket_offset + latch_hole_height, -slat_length_adjusted/4]) circle(r = m5_clearance);
        }
    }
}}


module square20(){
    square(20.2,center=true);
}

module square20x40() {
    square([20.2,40.2],center=true);
}

module main_square(){
    difference(){
    square([w1,l1],center=true);
    
    for(i=[0:1]){
        for(j=[0:1]){
        translate([(-1)^j*(w1/2-10),0,0])
            translate([0,l1/4 - (i * l1/2)])
            circle(m5);
        }
    }
    
    for(i=[0:1]){
        translate([(-1)^i*(w1/2-10),l1/2-20])
        square20x40();
    }
    
    for(i=[0:1]){
        translate([(-1)^i*(w1/2-10),-l1/2+10])
        square20();        
    }
    
    for(i=[0:1]){
        translate([(-1)^i*(w1/2-10-in-20),l1/2-10])
        square20();
    }
    
    translate([0,-in])
    circle(d=21.5);
    translate([0,-in])
    rotate([0,0,-90])
    top_plate();
}}

module side_square(){
    difference(){
    square([w2,l1],center=true);
        
    translate([-w2/2+10,-l1/2+10])
    square20();
    for(i=[0:1]){
            translate([0,l1/3 - (i * 2*l1/3)])
            circle(m5);
    }
}}

module back_square(){
    difference(){
        square([w3,l3],center=true);
        
        for(i=[0:1]){
        translate([(-1)^i*(w1/2-10-in-20),-l3/2+10])
        square20();
        }
        
        for(i=[0:3]){
            translate([w3/4 + w3/8 - w3/4 * i, l3/2-edge_dist])
            circle(m5);
        }
    }
}

module front_square() {
    difference(){
        square([w3,l4],center=true);
    }
}

module hinge_circle_pack(){
    right=9;
    left=10.5;
    r=7/2;
    w=26.5;
    l=64;
    ed=7;
    shift = w/2-right-r;
    rotate([0,0,90]){
    translate([shift,l/2-ed])
    circle(r);
    
    translate([shift,-(l/2-ed)])
    circle(r);
    
    translate([w/2 - ed,0])
    circle(r);
    }
}

difference(){
    union(){
main_square();

translate([w1/2+w2/2,0])
side_square();

translate([-(w1/2+w2/2),0])
rotate([0,180,0])
side_square();

translate([0,(l1+l3)/2])
back_square();

translate([0,-l1/2-l4/2])
front_square();
    }
    
        for(i=[0:3]){
            for(j=[0:1]){
        translate([(-1)^j * (w3/2-edge_dist),(l1/2+l3)-(l5)/8-l5/4*i])
        circle(m5);
    }}
    
    translate([w1/2,-(l1/2+l4)+hinge])
    hinge_circle_pack();
    
    translate([-w1/2,-(l1/2+l4)+hinge])
    hinge_circle_pack();
}

