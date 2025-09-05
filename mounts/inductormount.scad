w=20;
w2=10;
w3=40;
l=70;
h=3;
$fn=100;
r=4.2;

module slot() {
    rotate([0,0,90])
    cube([w3,r*2,r*2],center=true);
    
    translate([0,w3/2,0])
    cylinder(r,r,r);
    
        translate([0,-w3/2,0])
    cylinder(r,r,r);
}

difference() {
    cube([w,w,3], center=true);
    translate([0,0,-h])
    cylinder(h*2,2.6,2.6);
}

rotate([90,0,0])
translate([0,3.5,w/2])
cube([w,w2,h], center=true);


rotate([180,0,0])
translate([0,(l+w+w+2*h)/2 +.5,-w2])
difference(){
    cube([w,l+30,h],center=true);
    translate([0,10,-2])
    //rotate([0,0,90])
    slot();
}




