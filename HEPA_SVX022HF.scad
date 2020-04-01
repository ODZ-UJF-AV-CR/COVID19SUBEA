// FILTER ADAPTER FOR MASK EASYBREATH - TYPE 2
$fn = 100;

// Tube parameters

R_in_small = 9.65;  // Radius of small circles
R_in_big = 100;    // Radius of big circle

Dist_center = 45 - 2*R_in_small;  // Distance of centers of small circles

Wall_out_thickness =  2;  // Minimal thickness of outer walls (in the thinnest place)

Wall_in_thickness = 1.4;   // Thickness of inner walls
Dist_in_walls = 18.2; // Outer distance of inner walls
Det_in_walls = 15.2;  // Detachment of the inner walls from upper base (mask entrance)

Dist_big_center = sqrt(R_in_big* R_in_big - (Dist_center/2)*(Dist_center/2)); // Distance of the center of the big circle

R_out_small = R_in_small + Wall_out_thickness + R_in_big - Dist_big_center; // Outer radius of small circless

H_tube = 122; // Height of the tube

// Zaslepeni vydechovych otvoru
H_prep = 2; // Tloustka zaslepovacich prepazek

// Frame parameters

T_box = 2*R_out_small; // Thickness of the box
W_box = 145;   // Width of the box
H_box = 102;    // Height of the box

Wall_frame_thick = 6;  // Thickness of the frame wall

// Balcony
Balc_height = 25;



module Outer_coat(Dist_center, R_out_small, H_tube){
  
  hull(){
    translate([-Dist_center/2,0,0])
        cylinder(r = R_out_small, h = H_tube, center = true);
    translate([Dist_center/2,0,0])
        cylinder(r = R_out_small, h = H_tube, center = true);
  }
}


module Inner_coat(Dist_center, Dist_big_center, R_in_small, R_in_big, H_tube){
 hull(){
    union(){
        
    translate([0,Dist_big_center - R_in_small, 0])
        difference(){
            cylinder(r = R_in_big, h = H_tube, center = true);
            
        translate([0,1,0])    
            cube([2*R_in_big+2, 2*Dist_big_center+2, H_tube+2], center = true);
           
            }
        
    translate([-Dist_center/2,0,0])
        cylinder(r = R_in_small, h = H_tube, center = true);
    translate([Dist_center/2,0,0])
        cylinder(r = R_in_small, h = H_tube, center = true);
    }
  }
}

module Partition(Dist_in_walls, Det_in_walls, Wall_in_thickness, R_in_small, R_in_big, Dist_big_center, H_tube){
    
    translate([-(Dist_in_walls - Wall_in_thickness)/2, 0, -Det_in_walls/2])
        cube([Wall_in_thickness, 2*(R_in_small + R_in_big - Dist_big_center), H_tube-  Det_in_walls], center = true);
    
    translate([(Dist_in_walls - Wall_in_thickness)/2, 0, -Det_in_walls/2])
        cube([Wall_in_thickness, 2*(R_in_small + R_in_big - Dist_big_center), H_tube-Det_in_walls], center = true);
    }

module Zaslepeni(Dist_center, Dist_big_center, R_in_small, R_in_big, H_prep, Dist_in_walls, R_out_small){
    difference(){
        Inner_coat(Dist_center, Dist_big_center, R_in_small, R_in_big, H_prep);
        cube([Dist_in_walls, 2*R_out_small, H_prep + 2], center = true);
    }
    }
    
module Frame(W_box, T_box, H_box, Wall_frame_thick, Wall_out_thickness){
    difference(){
        cube([W_box, T_box, H_box], center = true);
        translate([0,10,0])
        cube([W_box - 2*Wall_frame_thick, T_box - 2*Wall_out_thickness  + 10, H_box - 2*Wall_frame_thick], center = true);
        }
    
    }    
    
module Row_of_Holes(W_region, H_region, W_hole, H_hole, T_wall, Hole_depth){
       
   A = floor(W_region/(W_hole+T_wall));

 for (i = [0 : A]) {
     translate([i * (W_hole + T_wall) - W_region/2, 0, 0])
     cube([W_hole, Hole_depth, H_hole]);
  }
  }
  
module Holes(W_region, H_region, W_hole, H_hole, T_wall, Hole_depth){
    
    B = floor((H_region - H_hole)/(H_hole+T_wall));
    
 for (i = [0 : B]) {
     translate([0, 0, i * (H_hole + T_wall) - H_region/2])
     Row_of_Holes(W_region, H_region, W_hole, H_hole, T_wall, Hole_depth);
                        }    
    }

module Balcony(W_box, T_box, Balc_height, Wall_frame_thick){
 difference(){
    cube([W_box, T_box, Balc_height + 2* Wall_frame_thick], center = true);
    
     translate([0, T_box/2+2, -Wall_frame_thick])
        rotate([-37,0,0])
        cube([W_box, T_box, 3*(Balc_height + 2* Wall_frame_thick)], center = true);
    }
    
    }

difference(){  
union(){
    
/// Tube
difference(){    
difference(){
Outer_coat(Dist_center, R_out_small, H_tube);

Inner_coat(Dist_center, Dist_big_center, R_in_small, R_in_big, H_tube);

translate([0,0,H_tube - 5])
    Inner_coat(Dist_center, Dist_big_center, R_in_small + 0.7, R_in_big, H_tube);
}

}



/// Inside of the tube
difference(){  // Proderaveni prepazek!!! POZDEJI SMAZAT TENTO RADEK
    
Partition(Dist_in_walls, Det_in_walls, Wall_in_thickness, R_in_small, R_in_big, Dist_big_center, H_tube); // Pricky NEMAZAT
  
  cube([Dist_in_walls + Wall_in_thickness + 1, 2*R_out_small, H_tube - 2*Det_in_walls -22], center = true); // Proderaveni prepazek!!! POZDEJI SMAZAT TENTO RADEK
}  // Proderaveni prepazek!!! POZDEJI SMAZAT TENTO RADEK

translate([0, 0, H_tube/2 - Det_in_walls - 10])  // Zaslepeni vydechovych otvoru!!! POZDEJI SMAZAT TENTO RADEK
Zaslepeni(Dist_center, Dist_big_center, R_in_small, R_in_big, H_prep, Dist_in_walls, R_out_small);   // Zaslepeni vydechovych otvoru!!! POZDEJI SMAZAT TENTO RADEK

/// Part for the filter
difference(){
translate([0,0,- H_tube/2 + H_box/2])
Frame(W_box, T_box, H_box, Wall_frame_thick, Wall_out_thickness);

Inner_coat(Dist_center, Dist_big_center, R_in_small, R_in_big, H_tube - 2*Wall_frame_thick);
}



}



/* /// Holes in the filter part
translate([0,  T_box/2 - 5 + 1, - H_tube/2 + H_box/2])
Holes(W_box - 2*Wall_frame_thick, H_box - 2*Wall_frame_thick, W_hole = 3, H_hole = 20.8, T_wall = 1.6, Hole_depth = 5); */

/// Empty inside
translate([0,+5,- H_tube/2 + H_box/2 ])
cube([W_box - 2*Wall_frame_thick, T_box - 2*Wall_out_thickness  + 10 /**/, H_box - 2*Wall_frame_thick ], center = true); 
    
}
difference() {
/// Balcony
translate([0, 0, H_tube/2  - (Balc_height + 2* Wall_frame_thick +1)])
Balcony(W_box, T_box, Balc_height, Wall_frame_thick);
    
translate([0, 0, 10])
     cube([Dist_in_walls - 2*Wall_in_thickness, 2*R_out_small, 80], center = true);   
}
/// Side protrution for screws

translate([W_box/2, T_box/2 - 2, - H_tube/2]){
difference(){
cube([15,2,15]); 
     
    translate([15/2, 0, 15/2])
    rotate([90,0,0])
    cylinder(r = 3, h = 10, center = true);
    }
}

translate([W_box/2, T_box/2 - 2, - H_tube/2 + H_box - 15]){
difference(){
cube([15,2,15]); 
     
    translate([15/2, 0, 15/2])
    rotate([90,0,0])
    cylinder(r = 3, h = 10, center = true);
    }
}

translate([- W_box/2 -15, T_box/2 - 2, - H_tube/2]){
difference(){
cube([15,2,15]); 
     
    translate([15/2, 0, 15/2])
    rotate([90,0,0])
    cylinder(r = 3, h = 10, center = true);
    }
}

translate([- W_box/2 -15, T_box/2 - 2, - H_tube/2 + H_box - 15]){
difference(){
cube([15,2,15]); 
     
    translate([15/2, 0, 15/2])
    rotate([90,0,0])
    cylinder(r = 3, h = 10, center = true);
    }
}

