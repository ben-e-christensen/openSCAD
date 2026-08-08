// shaft_clamp_33_5.scad
// Split (band) clamp — ring with a slot cut at the top, two ears either side
// of the slot for a bolt to draw them together and clamp down on the shaft.
$fn=100;
ID=29.2;
OD=38.7;
h=2;

hubcap=33.5;

wire_gap=2.5;

w=45;

n_w=57;
bh=36/2;
br=2.6;

module holder(height=4) {
    union(){
        difference(){
cube([w,w,height],center=true);
            translate([bh,bh,-25])
    cylinder(100,br,br);
        translate([-bh,bh,-25])
    cylinder(100,br,br);
        translate([bh,-bh,-25])
    cylinder(100,br,br);
        translate([-bh,-bh,-25])
    cylinder(100,br,br);
            translate([0,0,-h])
        cylinder(h*3,hubcap/2,hubcap/2);
        translate([0,hubcap/2+1,0])
        cube([5,10,10],center=true);
            }
            
        
}
}

/* ------------------ Parameters ------------------ */
id            = 33.7;   // inner diameter (fits over the shaft/rod)   <-- fixed per spec
wall          = 5;      // ring wall thickness [mm]

height        = 12;     // <<< EASILY TOGGLE THIS — clamp height / extrusion depth [mm]

slot_width    = 2;      // gap width of the cut that lets the clamp close  [mm]
ear_length    = 14;     // how far each ear tab sticks out radially [mm]
ear_thickness = wall;   // ear tab thickness (defaults to same as ring wall)

bolt_dia      = 5.2;    // bolt clearance hole, ~M4 clearance
bolt_margin   = 7;      // distance from ear tip to hole center [mm]

$fn = 100;              // curve resolution

/* ------------------ Derived ------------------ */
r_i = id / 2;
r_o = r_i + wall;

/* ------------------ 3D body ------------------ */
module ring_3d() {
    difference() {
        cylinder(h = height, r = r_o);
        translate([0, 0, -1])
            cylinder(h = height + 2, r = r_i);
    }
}

module slot_cut_3d() {
    // vertical slot through the top of the ring, opens the C shape
    translate([-slot_width/2, 0, -1])
        cube([slot_width, r_o * 1.5, height + 2]);
}

module ear_3d(mirror_side) {
    x0 = slot_width/2;
    // ear tab, extending outward (in +Y) from the ring OD
    x  = mirror_side ? -(x0 + ear_thickness) : x0;
    translate([x, r_o - 1, 0])   // slight overlap into the ring for a clean union
        cube([ear_thickness, ear_length + 1, height]);
}
module bolt_hole_3d() {
    span      = slot_width + 2 * ear_thickness;  // full width across both ears
    overshoot = 4;                                // clean cut through both faces
    y = r_o + ear_length - bolt_margin;
    z = height / 2;                                // through the vertical middle

    translate([0, y, z])
        rotate([0, 90, 0])
            cylinder(h = span + overshoot, d = bolt_dia, center = true);
}

difference() {
    union() {
        difference() {
            ring_3d();
            slot_cut_3d();
        }
        ear_3d(false);
        ear_3d(true);
    }
    bolt_hole_3d();
}

translate([0,0,10.5])
difference(){
    

ID=29.2;
OD=38.7;
h=2;

hubcap=33.5;

wire_gap=2.5;

w=45;


n_w=57;
bh=36/2;
br=2.6;

holder(3);
}
