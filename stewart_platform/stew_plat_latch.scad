$fn=64;
m5=2.6;
m3=1.6;
latch=35;
bhd_from_edge=21.5+2.6-latch/2;



difference(){
    cube([latch,20,4],center=true);
    
    translate([bhd_from_edge,0,-4])
    cylinder(100,m5,m5);
}

translate([-latch/2+2,0,-10])
rotate([0,90,0])
difference(){
    cube([20,20,4],center=true);
    
    translate([0,0,-4])
    cylinder(100,m3,m3);
}
