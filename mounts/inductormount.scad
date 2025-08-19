w=20;
l=60;
h=3;
$fn=100;
r=4.2;

module slot() {
    rotate([0,0,90])
    cube([w,r*2,r*2],center=true);
    
    translate([0,w/2,0])
    cylinder(r,r,r);
    
        translate([0,-w/2,0])
    cylinder(r,r,r);
}

difference() {
    cube([w,w,3], center=true);
    translate([0,0,-h])
    cylinder(h*2,2.6,2.6);
}

rotate([90,0,0])
translate([0,l/2 - h/2,w/2])
difference(){
    cube([w,l,h],center=true);
    translate([0,10,-2])
    //rotate([0,0,90])
    slot();
}




