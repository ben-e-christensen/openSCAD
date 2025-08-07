// Parameters
outer_radius = 3/2;
inner_radius = 1.5/2;

$fn = 100;  // Smoothness

module cable_slot(length = 15){
difference() {
    // Outer cylinder (the tunnel body)
    cylinder(h = length, r = outer_radius, center = true);
    
    // Inner cylinder (the hollow part)
    cylinder(h = length + 2, r = inner_radius, center = true);
    
    translate([outer_radius,0,0])
cube([outer_radius*2,inner_radius,length*2],center=true);
    
}
}


