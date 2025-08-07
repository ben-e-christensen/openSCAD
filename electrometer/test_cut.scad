$fn=100;

r1=1.5;
r2=2;
r3=3;
r4=26/4;
use <pins_module.scad>;
difference(){
    square([40,20],center=true);
    
    translate([r2*2,0,0])
    circle(r1);
    
    circle(r2);
    
    translate([-(r3*2),0,0])
    circle(3);

    translate([r4*2,0,0])
    circle(r4);


    
    translate([-8,0,0])
    pins2D();

}


    

