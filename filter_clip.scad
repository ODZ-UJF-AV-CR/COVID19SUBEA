translate([-0,-4.5,4]) cube([10,3,6.3], center = true);
//translate([0,-10,0]) cube([10,12,4], center = true);
difference(){
        cube([10,12,3], center = true);
        translate([0,0,-10]) cylinder(h = 20, r = 1.6, $fn=100);

    }
