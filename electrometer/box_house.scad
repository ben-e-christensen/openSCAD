use <backyard.scad>;
use <cable_slot.scad>;

$fn=64;

l=60;
l2=40;
w=22;
h=3;
r = 4 * 25.4-20-w;
lip = 1;



// wire holes = 1.1 diameter
// 13mm to first hole from screw hole
// 2.8mm apart


module condos(){
    
    module box1() {
        difference(){
            cube([l,w,l2], center=true);

            translate([0,h,0])
            cube([l-h,w,l2-h], center=true);
        
            rotate([90,0,0])
            translate([(20.35+25.4/8)/2,0,-100])
        
            cylinder(1000,1.45,1.45);
        
            rotate([90,0,0])
            translate([-(29/2-25.4/8),0,-100])
            cylinder(1000,26/4,26/4);
        }
         rotate([0,-90,0])
        translate([l2/2+1,0,16])
        cable_slot(28);
        
         rotate([0,0,0])
        translate([-(l/2+1),0,0])
        cable_slot(l2,1.5,.75,0,0,180);
}

    module box2() {
        difference(){
            cube([l,w,l2], center=true);

            translate([0,h,0])
            cube([l-h,w,l2-h], center=true);
        
            rotate([90,0,0])
            translate([-29/2,0,-100])
            cylinder(1000,1.45,1.45);
        
            rotate([90,0,0])
            translate([20.35/2,0,-100])
            cylinder(1000,26/4,26/4);
        }
        rotate([0,90,0])
        translate([l2/2+1,0,14])
        cable_slot(32);
        
        translate([l/2+1,0,0])
        cable_slot(l2);
    }


    module house1(){
        translate([0,0,w/2])
        rotate([90,0,0])
        difference(){
            box1();
                    rotate([0,0,90])
                    translate([0,0,0])
                    cylinder(100,2,2);
            }
    }

    module house2(){
        translate([0,0,w/2])
        rotate([90,0,0])
        difference(){
            box2();
                rotate([0,180,0])
                translate([5,0,0])
                cylinder(100,2,2);
        }
    }

    rotate([0,0,45])
    translate([r-2,0,0])
    house1();

    rotate([0,0,45])
    translate([-(r-2),0,0])
    house2();

    backyard();
}


