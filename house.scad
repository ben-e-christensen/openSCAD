$fn=100;

alpha=31.5;

stat_x=55;
stat_y=50;
stat_z=14;

stat_bolt_dist1=17.5;
stat_bolt_dist2=-12;
// assuming m3 bolt holes
stat_bolt_r=1.6;
stat_cable_r=8;
// dimensions of where the actual reed is 
sensor_head=7.5;

m3_screw_head=3.5;

pad=2.5;

box_w=70;
box_l=alpha+stat_z+pad*5;
box_h=25;

back_w=4;
back_l=53.5;
back_h=70;
bhd=33.5;

tilt      = 15;     // total travel, deg
bolt_sp   = 33.5;     // center-to-center of the two bolts
bolt_clr  = 3.2;    // M3 slot width
plate_t   = 6;
pivot_off = -45;    // tilt axis, measured from the bolt line.
                    // negative = below the bolts. nothing physical goes here.

module arc_slot_2d(r, a_mid, sweep, w, steps=24){
    a0 = a_mid - sweep/2;
    for (i=[0:steps-1])
        hull(){
            rotate(a0 + sweep*i/steps)     translate([r,0]) circle(d=w);
            rotate(a0 + sweep*(i+1)/steps) translate([r,0]) circle(d=w);
        }
}

// two mirrored slots, both struck from [0, py]
module eyebrow_slots(sp, py, sweep, w, h){
    r = norm([sp/2, -py]);
    translate([0, py, 0])
        linear_extrude(h, center=true)
            for (s = [-1, 1])
                arc_slot_2d(r, atan2(-py, s*sp/2), sweep, w);
}
    

module heat_insert(total_depth=10, insert_depth=4.5, height=25) {
    // Top: heat insert pocket
    cylinder(d=4.6, h=insert_depth);
    // Bottom: clearance hole for bolt to pass through
    cylinder(d=3.2, h=height);
}

module alpha_probe(){
    cylinder(50,d=alpha,center=true);
    rotate([-90,0,0])
    translate([0,0,-alpha/2-4.5])
    heat_insert(); 
}

module statiron(){
        cube([stat_x,stat_y,stat_z],center=true);
        //cube([sensor_head,stat_y+5,sensor_head],center=true);
    for(i=[0:2]){
        rotate([180,0,0])
        translate([stat_x/2+stat_bolt_dist2,12.5-4-8*i,-(stat_z/2+4.5)])
        heat_insert();  
        rotate([180,0,0])
        translate([-stat_x/2+stat_bolt_dist1,12.5-4-8*i,-(stat_z/2+4.5)])
        heat_insert();
    }    
}

module sensors() {
    translate([-(stat_x/2-sensor_head),pad+.1,0])
    rotate([-90,0,0])
    statiron();
    translate([0,-(alpha/2+stat_z/2+pad),0])
    alpha_probe();
    
    // cube is just to eliminate unnecessary zone from sensor box
    translate([-alpha-pad*2,-stat_y/2-pad*2,0])
    cube([alpha,alpha,100],center=true);
}

module sensor_box(w=box_w,l=box_l,h=box_h){
    difference(){
        cube([w,l,h],center=true);
        // take actual measurement of screw head!!!!!
        translate([box_w/2-alpha/2-m3_screw_head-back_w,15,0])
        sensors();
    }
}

module backplate(){
    difference(){
        cube([back_w,back_l,back_h],center=true);
        
        translate([0,0,back_h/2])
        for(i=[0:3]) {
            translate([0,0,i*-15-11])
            rotate([90,0,90])
            eyebrow_slots(bolt_sp, pivot_off, tilt, bolt_clr, plate_t+1);
        }
    }
}
translate([box_w/2-back_w/2,0,back_h/2+box_h/2])
backplate();
sensor_box();