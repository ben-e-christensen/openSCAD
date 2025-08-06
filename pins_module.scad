// Parameters
// Parameters
module row_of_pins() {
$fn=100;
pin_count = 7;
pin_pitch = 2.54;       // mm, standard header pitch
pin_diameter = 0.85;    // mm, approx pin diameter
pin_length = 10;        // mm, length of each pin

module pin() {
    cylinder(h = pin_length, d = pin_diameter, center = false);
}

for (i = [0 : pin_count - 1]) {
    translate([i * pin_pitch, 0, 0])
        pin();
}
}


