// Parameters

module pins() {
$fn=100;
pin_count = 7;
pin_pitch = 2.54;       // mm, standard header pitch
pin_diameter = 1;    // mm, approx pin diameter
pin_length = 10;        // mm, length of each pin
actual_diameter = 0.7;
row_distance = 8 - (actual_diameter/2);

module row(){
module pin() {
    cylinder(h = pin_length, d = pin_diameter, center = false);
}

for (i = [0 : pin_count - 1]) {
    translate([i * pin_pitch, 0, 0])
        pin();
}}

translate([0,row_distance,0])
row();

translate([0,-row_distance,0])
row();

}

// 2D Version of pins()

module pins2D() {
    $fn = 100;
    pin_count = 7;
    pin_pitch = 2.54;       // mm
    pin_diameter = 1;       // mm
    actual_diameter = 0.7;
    row_distance = 8 - (actual_diameter / 2);  // center-to-center vertical spacing

    module row(y_offset) {
        for (i = [0 : pin_count - 1]) {
            translate([i * pin_pitch, y_offset])
                circle(d = pin_diameter);
        }
    }

    row(+row_distance);
    row(-row_distance);
}





