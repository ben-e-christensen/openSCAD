$fn=100;

// height up to the nubbon (circle the motor head sits in)
h1=22.7;

// height to where the TOP of the little tabs are
h2_top=18.4;
// height to where the BOTTOM of the little tabs are
h2_bottom=15.9;

w=22.5;
tab=4.7;
// width of motor + both tabs
full_w=w+tab*2;
echo(full_w);

l=11.8;

m2=1.1;

shift=2.3;

shaft=32;
inc=4;
c_h=7.2;

// clip on dimensions:
diam=7;
height=5.5;
rod_x=5;
rod_y=13.5;

in=25.4;



module motor_bracket() {
    difference(){
        union(){
        cube([full_w,l+4,4],center=true);
        translate([-full_w/2-2,0,0])
            cube([4,l+4,4],center=true);
            }
        translate([-full_w/2+tab+l/2,0,-4]){
            cylinder(100,d=l+.5);
            translate([(l+.5)/2+2.55,0,-4])        
            cylinder(100,d=5+.1);
            translate([l/2,0,0])
            cube([5.1,5.1,100],center=true);
        }
        
        translate([-full_w/2+shift,0,-5])
        cylinder(100,r=1.1);
        translate([full_w/2-shift,0,-5])
        cylinder(100,r=1.1);
        
    }
    
//    translate([-full_w/2+tab+l/2,0,-4])
//    rotate([0,0,30])
//    cube([2,shaft,2],center=true);
}

module motor(rotation=0) {
    rotate([0,0,rotation])
    union(){
        cylinder(c_h,d=4.6);
        cylinder(inc,d=l);
        translate([0,l/2+2.5,0])
        cylinder(inc,d=5);
        translate([0,l/2,(inc)/2])
        cube([5,5,inc],center=true);
        
        // rod attachment
        translate([0,0,inc])
        union(){
            cylinder(height,d=diam);
            translate([in/2-1+diam/2,0,height-1])
            cube([in-2,in,2],center=true);
        }
        
    }
}

translate([-full_w/2+tab+l/2,0,0])
motor(-90);

motor_bracket();