$fn=64;

l=60;
w=5;
h = 42;

difference(){
    rotate([90,0,0])
cube([l,w,h],center=true);
    translate([0,0,-5])
    cylinder(100,2.5,2.5);
}

rotate([90,0,90])
translate([0,l/2,h/2 + (w+1.5)])
cube([h-15,l,w],center=true);

rotate([90,0,-90])
translate([0,l/2,h/2 + (w+1.5)])
cube([h-15,l,w],center=true);

translate([0,0,l])
difference(){
    rotate([90,0,0])
cube([l,w,h],center=true);
    translate([0,0,-5])
    cylinder(100,3.5,3.5);
}