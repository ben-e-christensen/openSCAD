$fn=100;

w=20;
l=20;
w2=10.5;

in=25.4;

r=in/4 + .2;
h=40 + w2/2;
h_top=95+r;
echo(r);

flip=false;
top_tube=true;

    if(top_tube){
        difference(){
    cube([w,l,h_top],center=true);
        translate([0,0,h_top/2])
    rotate([90,0,0])
    translate([0,0,-h_top/2])
    cylinder(h_top,r,r);  
    
            
            }
            
            translate([0,0,(h_top/2-1)])
rotate([0,0,90])
difference(){
    cube([l,l*3,2],center=true);
    rotate([0,90,0])
    translate([0,0,-h_top/2])
    cylinder(h_top,r,r);    
    translate([0,l,-5])
    cylinder(20,2.6,2.6);
    translate([0,-l,-5])
    cylinder(20,2.6,2.6);
}

translate([0,0,-(h_top/2-2)])   { 
if(flip){
    difference(){
    translate([0,l,0])
    cube([w,l,4],center=true);
    translate([0,l,-5])
    cylinder(20,2.6,2.6);
    }
} else {
    difference(){
    translate([0,-l,0])
    cube([w,l,4],center=true);
    translate([0,-l,-5])
    cylinder(20,2.6,2.6);
    }
}

    difference(){
    translate([l,0,0])
    cube([w,l,4],center=true);
    translate([l,0,-5])
    cylinder(20,2.6,2.6);
    }}} 
    
    
    else {
        difference(){
    cube([w,l,h],center=true);
        translate([0,0,h/2])
    rotate([90,0,0])
    translate([0,0,-h/2])
    cylinder(h,r,r);  
    }
    
    translate([0,0,(h/2-1)])
rotate([0,0,90])
difference(){
    cube([l,l*3,2],center=true);
    rotate([0,90,0])
    translate([0,0,-h/2])
    cylinder(h,r,r);    
    translate([0,l,-5])
    cylinder(20,2.6,2.6);
    translate([0,-l,-5])
    cylinder(20,2.6,2.6);
}

translate([0,0,-(h/2-2)])   { 
if(flip){
    difference(){
    translate([0,l,0])
    cube([w,l,4],center=true);
    translate([0,l,-5])
    cylinder(20,2.6,2.6);
    }
} else {
    difference(){
    translate([0,-l,0])
    cube([w,l,4],center=true);
    translate([0,-l,-5])
    cylinder(20,2.6,2.6);
    }
}

    difference(){
    translate([l,0,0])
    cube([w,l,4],center=true);
    translate([l,0,-5])
    cylinder(20,2.6,2.6);
    }}
    }



    

