$fn=300;

r = 4 * 25.4;
d=7.5;
rim_width = 22;
h=3;
// dimensions for altoid box
a_l = 90;
a_w = 60;

module altoids_box() {
    cylinder(h*2, 3.1,3.1);
    translate([2/3*a_w,0,0])
    cylinder(h*2, 3.1,3.1);
    translate([0,2/3*a_l,0])
    cylinder(h*2, 3.1,3.1);
    translate([2/3*a_w,2/3*a_l,0])
    cylinder(h*2, 3.1,3.1);
}

difference() {
    cylinder(h,r,r);
    
    translate([0,0,-2])
    cylinder(h+5,rim_width,rim_width);
    

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
