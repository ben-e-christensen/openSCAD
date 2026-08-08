$fn=100;
ID=29.2;
OD=38.7;
h=2;

hubcap=33.5;

wire_gap=2.5;

w=57;

$fn=100;
n_w=57;
bh=47/2;
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
        cylinder(h*3,ID/2,ID/2);
            }
        for(i=[0:1])
    translate([0,(-1)^i*(w/2+7.5),0])
difference(){
    
    cube([15,15,height],center=true);
    translate([0,0,-4])
    cylinder(10,2.6,2.6);
    
}
}
}
translate([0,0,5])
holder(1);
