// battery dimensions

// 10 tall
// 38 long
// 17 wide
$fn=100;

l = 41;
w=17;
h=10;

inc=2;

module battery_house(){
    module box(){
    translate([0,0,(h+inc)/2])
    difference() {
        cube([w+inc,l+inc,h+inc],center=true);
        translate([0,-inc,-inc])
        cube([w,l,h+inc],center=true);
    }}

    module garage_door() {
        difference(){
            cube([w,inc,h+inc*2],center=true);
            
            rotate([90,0,0])
            translate([0,0,-inc])
            cylinder(10,1.6,1.6);
            
            rotate([90,0,0])
            translate([5,-((h+inc*2)/2),-inc])
            cylinder(10,1.5,1.5);
        }
    }


    difference(){
        box();
        translate([0,-l/2 + inc,(h+inc*2)/2])
        garage_door();
    }
}
