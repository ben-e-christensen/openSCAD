$fn = 100;

bolt_d = 3.1;
w=20;
l=80;
h=3;

d=60;

x1=74.8 - 51.9-6.2;
y1=3.3;

x2=x1+51.9;
y2=y1+4.7;

x3=x2;
y3=y2+27.9;
x4=x1+1.1;
y4=y3+15.2;


    difference(){
        rotate([0,0,90])
        translate([0,-w-10,0])
        cube([d,w,h]);
        
        translate([x1,y1,-h])
        cylinder(3*h, d=3.1);
        
        translate([x4,y4,-h])
        cylinder(3*h, d=3.1);
    }
