$fn = 100;

bolt_d = 3.1;
w=75;
l=60;
h=3;

x1=74.8 - 51.9 - 6.2;
y1=3.3;

x2=x1+51.9;
y2=y1+4.7;

x3=x2;
y3=y2+27.9;

x4=x1+1.1;
y4=y3+15.2;
difference(){
    translate([10,-2.5])
cube([w,l,h]);
    
    translate([x1,y1, -h])
    cylinder(h*3,d=bolt_d);
    
    translate([x2,y2, -h])
    cylinder(h*3,d=bolt_d);
    
    translate([x3,y3, -h])
    cylinder(h*3,d=bolt_d);
    
    translate([x4,y4, -h])
    cylinder(h*3,d=bolt_d);
    
}
