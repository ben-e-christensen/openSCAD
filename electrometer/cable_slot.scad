// Parameters


$fn = 100;  // Smoothness


module cable_slot(length = 15, outer_radius =1.5,inner_radius=0.75,x=0,y=0,z=0){
rotate([x,y,z])
difference() {
    
    rotate([0,90,0])
    cube([length,outer_radius+1,outer_radius+1], center = true);
    
    translate([0,0,-(length+2)])
    cylinder(length*3,inner_radius,inner_radius);
    
    translate([outer_radius,0,0])
cube([outer_radius*2,inner_radius,length*2],center=true);
    
}
}
