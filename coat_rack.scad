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
nema_23();




