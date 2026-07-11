$fn=64;
m5=2.6;
m3=1.6;
latch=35;
bhd_from_edge=21.5+2.6-latch/2;
bh=62;



module latch(){



translate([0,0,-10])
rotate([0,90,0])
difference(){
    cube([20,20,4],center=true);
    
    translate([0,0,-4])
    cylinder(100,m5,m5);

}}

difference(){
    cube([20,bh+20+60,4],center=true);
    
    // this hole is for screwing into the top plate and lines up with a ball joint
    translate([-.9,bh/2+30,-4])
    cylinder(100,m5,m5);
    
    translate([-.9,-bh/2-30,-4])
    cylinder(100,m5,m5);
    
    // this hole is for screwing into the top plate and lines up with a ball joint
    translate([0,0,-4])
    cylinder(100,m5,m5);
    
}

// these latches are where the ball joints end up getting screwed in - remember the ball joint center to ball joint center is 140mm, so that is where the center of these holes on the latches must be
translate([0,-bh/2,0])
latch();

translate([0,bh/2,0])
latch();