$fn=64;

bhd=132.5;
bhr=2.75;

difference(){
    square(bhd+15,center=true);
    
    square(bhd-7.5,center=true);
    
    translate([bhd/2,bhd/2])
    circle(bhr);
    
    translate([-bhd/2,bhd/2])
    circle(bhr);
    
    translate([bhd/2,-bhd/2])
    circle(bhr);
    
    translate([-bhd/2,-bhd/2])
    circle(bhr);
}