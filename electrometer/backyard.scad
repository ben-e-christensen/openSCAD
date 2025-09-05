$fn=300;

r = 4 * 25.4;
d=7.5;
rim_width = 20;
h=3;

module backyard() {
difference() {
    cylinder(h,r,r);
    
    translate([0,0,-2])
    cylinder(h+5,r - rim_width,r - rim_width);
    

//translate([0,0,-h*2])
//cube(four_in);
    
    translate([r-d,0,-h*2])
    cylinder(h*5,2.6,2.6);
    
    translate([0,r-d,-h*2])
    cylinder(h*5,2.6,2.6);
    
    translate([-(r-d),0,-h*2])
    cylinder(h*5,2.6,2.6);

    translate([0,-(r-d),-h*2])
    cylinder(h*5,2.6,2.6);
   
}
}


