$fn=64;
x1=71.8846;
x=47;
y=19;
z=4;
echo(x/2-x1/4-2.6);

module bolt_slat(){
    translate([0,3,0])
    cylinder(100,2.6,2.6);
    translate([0,0,50])
    cube([5.2,6,100],center=true);
    translate([0,-3,0])
    cylinder(100,2.6,2.6);
}


difference(){
    cube([x,y,z],center=true);
    translate([-x1/4,2.5,-10]) 
    bolt_slat();
    
    translate([x1/4,2.5,-10]) 
    bolt_slat();
}




rotate([90,0,0])
translate([0,y/2,y/2-z/2])
difference(){
    cube([x,y,z],center=true);
    translate([-x1/4,0,-10]) 
    bolt_slat();
    
    translate([x1/4,0,-10]) 
    bolt_slat();
}



