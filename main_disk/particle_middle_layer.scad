// Parameters
R = 203/2;
radius = R-20;
teeth_count = 225;
amplitude = 0.315;
points_per_tooth = 20;

$fn=300;



total_points = teeth_count * points_per_tooth;

function sine_wave_point(i, total_points, radius, amplitude, teeth_count) =
    let (
        angle = 360 * i / total_points,
        offset = amplitude * sin(360 * teeth_count * i / total_points),
        r = radius - offset
    )
    [r * cos(angle), r * sin(angle)];

module sine_wave_circle(total_points=6000, radius=150, amplitude=0.3, teeth_count=300) {
    total_points = teeth_count * points_per_tooth;
    pts = [for (i = [0:total_points]) sine_wave_point(i, total_points, radius, amplitude, teeth_count)];
    polygon(pts);
}


difference() {
    circle(R);

    sine_wave_circle(total_points, radius, amplitude, teeth_count);
    
    translate([0, R-10])
    circle(d=5);
    rotate([0,0,45])
    translate([0, R-10])
    circle(d=5);
    
    translate([0, -(R-10)])
    circle(d=5);
    rotate([0,0,45])
    translate([0, -(R-10)])
    circle(d=5);
    
    translate([R-10, 0])
    circle(d=5);
    rotate([0,0,45])
    translate([R-10, 0])
    circle(d=5);
    
    translate([-(R-10), 0])
    circle(d=5);
    rotate([0,0,45])
    translate([-(R-10), 0])
    circle(d=5);
    
    //translate([cos(45)*129, sin(45)*129])
    //rotate(45)
    //square([200,5.7]);
}

translate([radius - 10,0])
circle(r=3);

translate([-(radius - 10),0])
circle(r=3);

translate([0,-(radius - 10)])
circle(r=3);

translate([0,radius - 10])
circle(r=3);
