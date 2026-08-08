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

module nema_23(){
    difference(){
        
    cube([n_w,n_w,3],center=true);
    translate([bh,bh,-25])
    cylinder(100,br,br);
        translate([-bh,bh,-25])
    cylinder(100,br,br);
        translate([bh,-bh,-25])
    cylinder(100,br,br);
        translate([-bh,-bh,-25])
    cylinder(100,br,br);
        translate([0,0,-25])
        cylinder(100,35/2,35/2);
        
        
    }
}







module inductor(){
    difference(){
        cylinder(h,OD/2,OD/2);
        translate([0,0,-h])
        cylinder(h*3,ID/2,ID/2);
        
    }
}


difference(){
    union(){
cube([w,w,3],center=true);
        for(i=[0:1])
    translate([0,(-1)^i*(w/2+7.5),0])
difference(){
    
    cube([15,15,3],center=true);
    translate([0,0,-4])
    cylinder(10,2.6,2.6);
}
}
    translate([0,0,.1])
inductor();
    translate([-w/2,wire_gap,1.1])
    cube([25,2,2],center=true);
    translate([-w/2,-wire_gap,1.1])
    cube([25,2,2],center=true);

translate([bh,bh,-25])
    cylinder(100,br,br);
        translate([-bh,bh,-25])
    cylinder(100,br,br);
        translate([bh,-bh,-25])
    cylinder(100,br,br);
        translate([-bh,-bh,-25])
    cylinder(100,br,br);
        translate([0,0,-25])
        cylinder(100,ID/2-3,ID/2-3);
}
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
    cylinder(100,br,br);}
        for(i=[0:1])
    translate([0,(-1)^i*(w/2+7.5),0])
difference(){
    
    cube([15,15,height],center=true);
    translate([0,0,-4])
    cylinder(10,2.6,2.6);
    
}
}
}
//translate([0,0,5])
//holder(1);

translate([0,0,-h])
        cylinder(h*3,ID/2,ID/2);
