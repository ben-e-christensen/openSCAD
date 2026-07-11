// door hinge

$fn=64;

right=9;
left=10.5;
r=7/2;
w=26.5;
l=64;

ed=7;
shift = w/2-right-r;

module circle_pack(){
    translate([shift,l/2-ed])
    circle(r);
    
    translate([shift,-(l/2-ed)])
    circle(r);
    
    translate([w/2 - ed,0])
    circle(r);
}


difference(){
    square([w,l],center=true);
    circle_pack();
}
