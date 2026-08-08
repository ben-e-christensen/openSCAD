$fn=100;

w=61;
l=94;

p_w=119;
p_l=32;
p_b1=5;
p_b2=53.5;
p_bh=8;

bw=40;
bl=51.4;

probe_w=12.4;
probe_l=30.4;

module altoids(flip=true,just_bolts=false){
    if(just_bolts){
        for(i=[0:1]){
            for(j=[0:1]){
                translate([(-1)^i*bw/2,(-1)^j*bl/2])
                circle(d=2.7);
            }
        }
        
        if(flip){
            translate([(bw/2-probe_w),(-bl/2+probe_l)])
            circle(d=3.2);
        } else {
            translate([-(bw/2-probe_w),(-bl/2+probe_l)])
            circle(d=3.2);
        }
    }
    else{
    difference(){
        square([w,l],center=true);
        
        for(i=[0:1]){
            for(j=[0:1]){
                translate([(-1)^i*bw/2,(-1)^j*bl/2])
                circle(d=2.7);
            }
        }
        
        if(flip){
            translate([(bw/2-probe_w),(-bl/2+probe_l)])
            circle(d=3.2);
        } else {
            translate([-(bw/2-probe_w),(-bl/2+probe_l)])
            circle(d=3.2);
        }
    }
}}

module power_board(just_bolts=false){
    if(just_bolts){
        translate([(p_w/2-p_b1),-(p_l/2-5)])
        circle(d=2.7);
        translate([-(p_w/2-p_b1),(p_l/2-5)])
        circle(d=2.7);
        
        for(i=[0:2]){
            translate([(p_w/2-p_b2),p_bh-p_bh*i])
            circle(d=2.7);
            translate([-(p_w/2-p_b2),p_bh-p_bh*i])
            circle(d=2.7);
        }
    } else {
    difference(){
        square([p_w,p_l],center=true);
        translate([(p_w/2-p_b1),-(p_l/2-5)])
        circle(d=2.7);
        translate([-(p_w/2-p_b1),(p_l/2-5)])
        circle(d=2.7);
        
        for(i=[0:2]){
            translate([(p_w/2-p_b2),p_bh-p_bh*i])
            circle(d=2.7);
            translate([-(p_w/2-p_b2),p_bh-p_bh*i])
            circle(d=2.7);
        }
    }}
}
power_board();