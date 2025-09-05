$fn=64;

face = 20;
height= 30;
cut_out_height=30;
cut_out_width=12;
cut_out_start=26;

thickness = 3;
bridge_length = 63;




rotate([90,0,0])
translate([0,face/2,0])
difference() {
    cube([face,face,thickness],center=true);
    translate([0,0,-3])
    cylinder(100,2.5,2.5);
}
//rotate([0,0,90])
difference(){
    rotate([0,0,90])
    translate([(bridge_length + thickness)/2,0,thickness/2])

cube([bridge_length,face,thickness],center=true);
    
    translate([face/2-cut_out_width,cut_out_start,-2])

cube([face,cut_out_height,thickness*5]);
}

rotate([90,0,0])
translate([0,height/2,-(bridge_length + thickness)])
difference() {
    cube([face,height,thickness],center=true);
    translate([0,2.5,-thickness])
    cylinder(100,5,5);
}