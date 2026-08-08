$fn=64;

in=25.4;

h=(5+9/16)*in;

w=160;

t=100;

z=3;

m3=1.6;
m5=2.6;

difference(){
    union(){
    cube([w+5,t+5,z],center=true);
    cube([60,h,z],center=true);
    }
    translate([(w/2-5),(t/2-5),-z])
    cylinder(10,m3,m3);
    translate([-(w/2-5),(t/2-5),-z])
    cylinder(10,m3,m3);
    translate([(w/2-5),-(t/2-5),-z])
    cylinder(10,m3,m3);
    translate([-(w/2-5),-(t/2-5),-z])
    cylinder(10,m3,m3);
    
    translate([(20),(h/2-10),-z])
    cylinder(10,m5,m5);
    translate([-(20),(h/2-10),-z])
    cylinder(10,m5,m5);
    translate([-(20),-(h/2-10),-z])
    cylinder(10,m5,m5);
    translate([(20),-(h/2-10),-z])
    cylinder(10,m5,m5);
    
}