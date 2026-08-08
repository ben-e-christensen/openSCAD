$fn=100;
in = 25.4;

w=(8 + 7/16) *in;
x=67/2;
y=50/2;
m25=2.7/2;
m5=2.6;

difference(){
    cube([w,y*3,2.5],center=true);
    
    for(i=[0:1]){
        for(j=[0:1]){
        translate([(-1)^i*x,(-1)^j*y,-5])
        cylinder(10,m25,m25);
    }
    translate([(-1)^i*(w/2-10),0,-5])
        cylinder(10,m5,m5);
    }
}
