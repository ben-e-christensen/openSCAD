$fn=64;

w_b=50;
l_b=150;

m3=1.75;
m5=2.6;

bracket=16.5;

in=25.4;

w=100;

l=(9 + 9/16)*in;

difference(){
    square([w,l],center=true);
    
    translate([0,l/2-bracket/2+.1])
    square(bracket,center=true);
    
    translate([w/2-20,l/2-10])
    circle(m5);
    
    translate([-(w/2-20),(l/2-10)])
    circle(m5);
    
    translate([(w/2-20),-(l/2-10)])
    circle(m5);
    
    translate([-(w/2-20),-(l/2-10)])
    circle(m5);
    
    translate([(w_b/2),(l_b/2)])
    circle(m3);
    translate([-(w_b/2),(l_b/2)])
    circle(m3);
    translate([-(w_b/2),-(l_b/2)])
    circle(m3);
    translate([(w_b/2),-(l_b/2)])
    circle(m3);
}