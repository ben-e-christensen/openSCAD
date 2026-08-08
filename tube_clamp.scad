// half_inch_tube_clamp.scad
// Split clamp for 12.7 mm (1/2") OD tube. M3 bolt, captive nut.

$fa = 1;
$fs = 0.4;

// --- Parameters ---
tube_d     = 13;   // 1/2" tube OD
wall       = 4.0;    // clamp wall thickness
h1     = 20.0;   // clamp width along tube axis
gap        = 2.0;    // slit width when open

ear_len    = 8.0;   // how far ears project past the body
ear_thick  = 6.0;    // thickness of each ear

bolt_d     = 3.4;    // M3 clearance
nut_af     = 5.5;    // M3 nut across flats
nut_depth  = 2.8;    // nut pocket depth

eps = 0.01;

// --- Derived ---
body_d  = tube_d + 2*wall;
ear_x   = body_d/2 + ear_len;          // outer face of ears
ear_y   = gap/2 + ear_thick;           // outer face of each ear
bolt_x  = body_d/2 + ear_len/2;        // bolt sits mid-ear


module clamp(height=h1) {
    difference() {
        bolt_z  = height/2;
        // --- solid ---
        union() {
            cylinder(d = body_d, h = height);

            translate([0, -ear_y, 0])
                cube([ear_x, 2*ear_y, height]);
        }

        // --- tube bore ---
        translate([0, 0, -eps])
            cylinder(d = tube_d, h = height + 2*eps);

        // --- slit ---
        translate([0, -gap/2, -eps])
            cube([ear_x + eps, gap, height + 2*eps]);

        // --- bolt through both ears ---
        translate([bolt_x, -ear_y - eps, bolt_z])
            rotate([-90, 0, 0])
                cylinder(d = bolt_d, h = 2*ear_y + 2*eps);

        // --- captive nut pocket, -Y side ---
        translate([bolt_x, -ear_y - eps, bolt_z])
            rotate([-90, 0, 0])
                cylinder(d = nut_af / cos(30), h = nut_depth + eps, $fn = 6);
    }
}

