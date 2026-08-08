$fn=64;

b_d=5.5;

m5=2.6;

w_b=76+b_d;

l_b=89+b_d;

in=25.4;

w=100;

l=(9 + 9/16)*in;
bracket=16.5;

difference() {
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
    
    translate([(w_b/2),0])
    circle(d=b_d);
    
    translate([-(w_b/2),0])
    circle(d=b_d);
    
    translate([-(w_b/2),(l_b)])
    circle(d=b_d);
    translate([-(w_b/2),-(l_b)])
    circle(d=b_d);
    translate([(w_b/2),-(l_b)])
    circle(d=b_d);
    translate([(w_b/2),(l_b)])
    circle(d=b_d);
}

