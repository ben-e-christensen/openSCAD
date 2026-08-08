$fn=100;

w=20;
l=20;
w2=10.5;
h=40 + w2/2;
in=25.4;
r=25.4/4+1;

difference(){
    
    cube([w,l,h],center=true);
    
    translate([0,0,h/2])
    rotate([90,0,0])
    translate([0,0,-h/2])
    cylinder(h,r,r);  }

translate([0,0,-(h/2-2)])
    
difference(){
    cube([w,l*3,4],center=true);
    translate([0,-l,-5])
    cylinder(20,2.6,2.6);
    translate([0,l,-5])
    cylinder(20,2.6,2.6);
    
}
translate([0,0,(h/2-1)])
rotate([0,0,90])
difference(){
    cube([l,l*3,2],center=true);
    rotate([0,90,0])
    translate([0,0,-h/2])
    cylinder(h,r,r);    
    translate([0,l,-5])
    cylinder(20,2.6,2.6);
    translate([0,-l,-5])
    cylinder(20,2.6,2.6);
}



