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

module plate(){
difference(){
    cube([w,w,h],center=true);
     translate([0,0,-h])
    cylinder(3*h,d=5.2);
    }
    translate([(w)/2+h/2,0,l/2-h/2])
    cube([h,w,l],center=true);
}

module bridge(){
    difference(){
        rotate([0,0,90])
        translate([0,-w-10,0])
        cube([d,w,h]);
        
        translate([x1,y1,-h])
        cylinder(3*h, d=3.1);
        
        translate([x4,y4,-h])
        cylinder(3*h, d=3.1);
    }
}
    
module backplate(){
    translate([w/2,w/2-h,-h/2])
    cube([d+2*h,h,l]);
} 
    
plate();
rotate([0,0,180])
translate([-d-w-2*h,0,0])
plate();

translate([w/2+h,w,l-1.5*h])
rotate([0,0,-90])
bridge();
    
 backplate();
