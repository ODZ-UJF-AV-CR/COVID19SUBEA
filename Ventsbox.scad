//// 
$fn = 100;

// Partition parameters
Wall_in_thickness = 1.4;   // Thickness of inner walls
Dist_in_walls = 18.2; // Outer distance of inner walls
R_out = 13; // Radius of outer circless (corresponds with outer wall thickness)

// Frame parameters

T_box = 2*R_out; // Thickness of the box
W_box = 145;   // Width of the box
H_box = 102;    // Height of the box

Wall_frame_thick = 6;  // Thickness of the frame wall
Frame_transl = 1.5; // Translate of the frame


// Valve plane parameters
zsize = 5;
line_fn = 4;
min_line_width = 1.0;
line_width_scale = 1.0;
function min_line_mm(w) = max(min_line_width, w * line_width_scale) * 96/25.4;

// Dividing planes parameters
Div_thick = 2;
tanalpha = (T_box)/(W_box/2-Dist_in_walls/2-Wall_frame_thick);

// (T_box-Div_thick)/sqrt((H_box-2*Wall_frame_thick)*(H_box-2*Wall_frame_thick)+(W_box/2-Dist_in_walls/2-Wall_frame_thick)*(W_box/2-Dist_in_walls/2-Wall_frame_thick));
alpha = atan(tanalpha);

tanbeta = (H_box-2*Wall_frame_thick)/(W_box/2-Dist_in_walls/2-Wall_frame_thick);
beta = atan(tanbeta);

/// Side protrution for screws

    bolt_diameter = 3.2;
 
    protrution_thickness = 11;
    protrution_length = 10;
    protrution_height = 5;
    
// Balcony
Balc_height = 25;


module Partition(Dist_in_walls, Wall_in_thickness, R_out, H_tube){
    
    translate([-Dist_in_walls/2 - 0, -R_out, 0])
        cube([Wall_in_thickness, 2*R_out, H_tube]);
    
    translate([Dist_in_walls/2 - Wall_in_thickness,  -R_out, 0])
        cube([Wall_in_thickness, 2*R_out, H_tube]);
    
}  



///// Part corresponding to valve plate
path3803_0_center = [1.068299,-47.024898];
path3803_0_points = [[-77.616789,-8.699061],[79.753387,-8.699061],[79.753387,-50.955756],[79.628776,-54.845115],[79.120737,-58.543871],[78.239715,-62.042288],[76.996151,-65.330624],[75.400490,-68.399141],[73.463172,-71.238100],[71.194643,-73.837762],[68.605343,-76.188388],[65.705717,-78.280237],[62.506207,-80.103573],[59.017255,-81.648654],[55.249306,-82.905742],[51.212801,-83.865098],[46.918183,-84.516983],[42.375895,-84.851657],[37.596381,-84.859381],[-34.980648,-85.350735],[-40.234440,-85.203377],[-45.125692,-84.684321],[-49.657692,-83.816008],[-53.833726,-82.620877],[-57.657081,-81.121370],[-61.131045,-79.339924],[-64.258904,-77.298982],[-67.043944,-75.020983],[-69.489454,-72.528367],[-71.598720,-69.843574],[-73.375028,-66.989045],[-74.821667,-63.987219],[-75.941922,-60.860537],[-76.739081,-57.631438],[-77.216431,-54.322363],[-77.377258,-50.955753],[-77.616789,-8.699061]];
module poly_path3803(h, w, s, res=line_fn)
{
  scale([25.4/96, -25.4/96, 1]) union()
  {
    translate (path3803_0_center) linear_extrude(height=h, convexity=10, scale=0.01*s)
      translate (-path3803_0_center) polygon(path3803_0_points);
  }
}

path3799_0_center = [1.115394,32.882403];
path3799_0_points = [[-28.646307,32.882403],[-28.384580,36.824626],[-27.616092,40.647756],[-26.365883,44.308422],[-24.658995,47.763253],[-22.520468,50.968877],[-19.975342,53.881923],[-17.048658,56.459018],[-13.765457,58.656792],[-10.220528,60.401241],[-6.525356,61.647276],[-2.730022,62.394897],[1.115394,62.644104],[4.960809,62.394897],[8.756144,61.647276],[12.451316,60.401241],[15.996244,58.656792],[19.279446,56.459018],[22.206130,53.881923],[24.751256,50.968877],[26.889783,47.763253],[28.596671,44.308422],[29.846879,40.647756],[30.615367,36.824626],[30.877094,32.882403],[30.615367,28.940180],[29.846879,25.117050],[28.596671,21.456383],[26.889782,18.001552],[24.751255,14.795929],[22.206129,11.882883],[19.279445,9.305788],[15.996244,7.108014],[12.451315,5.363565],[8.756143,4.117530],[4.960809,3.369909],[1.115394,3.120702],[-2.730022,3.369909],[-6.525356,4.117530],[-10.220528,5.363565],[-13.765456,7.108014],[-17.048658,9.305788],[-19.975342,11.882883],[-22.520468,14.795929],[-24.658995,18.001552],[-26.365883,21.456383],[-27.616091,25.117050],[-28.384579,28.940180],[-28.646307,32.882403]];
module poly_path3799(h, w, s, res=line_fn)
{
  scale([25.4/96, -25.4/96, 1]) union()
  {
    translate (path3799_0_center) linear_extrude(height=h, convexity=10, scale=0.01*s)
      translate (-path3799_0_center) polygon(path3799_0_points);
  }
}

path3807_0_center = [0.000000,0.000000];
path3807_0_points = [[-88.621312,65.217482],[-50.538104,88.718489],[-37.522510,91.287597],[-24.551825,93.168205],[-11.615263,94.315915],[1.297962,94.686332],[14.198637,94.235056],[27.097546,92.917690],[40.005477,90.689838],[52.933214,87.507101],[90.776910,62.067850],[93.919708,59.867563],[96.766004,57.398288],[99.352967,54.550739],[101.717769,51.215632],[103.897581,47.283681],[105.929572,42.645604],[107.850914,37.192114],[109.698776,30.813927],[111.063123,21.660403],[112.010704,12.383506],[112.520779,2.994079],[112.572607,-6.497035],[112.145447,-16.078995],[111.218558,-25.740957],[109.771200,-35.472080],[107.782631,-45.261520],[106.593562,-49.943869],[105.043484,-54.286763],[103.183373,-58.323168],[101.064204,-62.086054],[96.252594,-68.923142],[91.016456,-75.061775],[84.528482,-80.184030],[77.879887,-84.418029],[71.072718,-87.826589],[64.109023,-90.472524],[56.990851,-92.418651],[49.720249,-93.727784],[42.299266,-94.462739],[34.729949,-94.686332],[-36.406589,-94.444064],[-44.919606,-94.085056],[-52.935908,-93.040787],[-60.471439,-91.337431],[-67.542141,-89.001160],[-74.163956,-86.058148],[-80.352828,-82.534567],[-86.124699,-78.456590],[-91.495511,-73.850391],[-94.328302,-70.870875],[-96.895929,-67.623137],[-99.217132,-64.126132],[-101.310649,-60.398818],[-104.889588,-52.329082],[-107.782665,-43.565577],[-109.714306,-34.308318],[-111.162077,-24.964685],[-112.117628,-15.533188],[-112.572607,-6.012337],[-112.518662,3.599360],[-111.947441,13.303392],[-110.850595,23.101252],[-109.219770,32.994428],[-106.064250,42.843609],[-104.241445,47.005294],[-102.120088,50.826137],[-99.598788,54.431957],[-96.576153,57.948575],[-92.950792,61.501813],[-88.621312,65.217489],[-88.621312,65.217482]];
module poly_path3807(h, w, s, res=line_fn)
{
  scale([25.4/96, -25.4/96, 1]) union()
  {
    translate (path3807_0_center) linear_extrude(height=h, convexity=10, scale=0.01*s)
      translate (-path3807_0_center) polygon(path3807_0_points);
  }
}

module valve(h)
{
  difference()
  {
    union()
    {
      translate ([0,0,0]) poly_path3807(h, min_line_mm(0.0704034289583), 100.0);
    }
    union()
    {
      translate ([0,0,-1]) poly_path3803(h+2, min_line_mm(0.0708973663542), 100.0);
      translate ([0,11.5-22.5+1.6,-1]) cylinder(h = 100, r = 1.6);
    }
  }
}


module Frame(W_box, T_box, H_box, Wall_frame_thick){
    difference(){
        cube([W_box, T_box, H_box], center = true);
        translate([0,-1,0])
        cube([W_box - 2*Wall_frame_thick, T_box + 3 , H_box - 2*Wall_frame_thick], center = true);
        }
    
    }

module Paw(h){
    translate([12.4, -2.7,0])
    difference(){
        minkowski(){
            cube([14,14,h-2]);
            cylinder(2, r = 1.8);
        }
     rotate(136)
     translate([-19,-12,-1])
     cube([35,30,20]);
     
     translate([12.5,12.5,-1])   
     cylinder(h = 100, r = 1.6);
    }
}  

module Screw_protrution(protrution_length, protrution_height, protrution_thickness, bolt_diameter){
    
 difference(){
cube([protrution_length, protrution_height, protrution_thickness]);
     
    translate([protrution_length/2, 0, protrution_thickness/2])
    rotate([90,0,0]) {
        
    translate([0,0,- protrution_height/2])
    cylinder(r = bolt_diameter/2, h = protrution_height + 1, center = true);
     
    }
    
    }   
    
    }
    
module Balcony(W_box, T_box, Balc_height, Wall_frame_thick){
 difference(){
    cube([W_box, T_box, Balc_height + 2* Wall_frame_thick], center = true);
    
     translate([0, T_box/2+2, -Wall_frame_thick +1])
        rotate([-37,0,0])
        cube([W_box, T_box, 3*(Balc_height + 2* Wall_frame_thick)], center = true);
    }
    
    }
//
//
    
/// Part with valves
rotate([0,180,0])    
translate([-0.3, -11.5, -zsize])
valve(zsize);

/// Middle partition
translate([0,Frame_transl,-0])
difference(){
Partition(Dist_in_walls, Wall_in_thickness, R_out, H_box); 
  
  hull(){
      translate([-Dist_in_walls/2-1, T_box/2 - 0.0, Wall_frame_thick+0.0])
      cube([Dist_in_walls+3,0.5,0.5]);
      
      translate([-Dist_in_walls/2-1, - T_box/2, H_box - Wall_frame_thick-0.0])
      cube([Dist_in_walls+3,T_box,0.5]);
      }  
} 

// Side of inlet pipe
translate([ -Dist_in_walls/2, -T_box/2 + Frame_transl , 0])
   cube([Dist_in_walls, 2, H_box]);

// Mesh
FIRST_ROW = 30;
MESH_HEIGHT = 10;
MESH_WIDTH = 2.5;
MESH_DIST = 7;

difference()
{
    translate([ -W_box/2, -T_box/2 + Frame_transl , 0]) 
        cube([W_box, 2, H_box]);
    for (x = [Dist_in_walls/2:MESH_DIST:W_box/2 - 10] )
        for (z = [FIRST_ROW:12:H_box-20] )
            translate([x, -T_box/2 + Frame_transl - 0.1, z]) 
                cube([MESH_WIDTH,2.1,MESH_HEIGHT]);
    for (x = [Dist_in_walls/2:-MESH_DIST:-W_box/2 + 10] )
        for (z = [FIRST_ROW:12:H_box-20] )
            translate([x, -T_box/2 + Frame_transl - 0.1, z]) 
                cube([MESH_WIDTH,2.1,MESH_HEIGHT]);
}

/// Frame
difference(){
translate([0,1.5,  H_box/2])
Frame(W_box, T_box, H_box, Wall_frame_thick);  

  // Holes in the frame
rotate([0,180,0])
translate([-0.3, -11.5,-7])
    poly_path3803(6+2, min_line_mm(0.0708973663542), 100.0);
  // Holes for screws 
    translate([12.4, -3,0])
   translate([14,11.4,-1])     
   cylinder(h = 10, r = 1.6);
    
    mirror([1,0,0]){
   translate([12.4, -3,0])
   translate([14,11.4,-1])     
   cylinder(h = 10, r = 1.6);
        }
    

    }

 /// Dividing planes
difference(){
intersection(){ 
union(){    
    rotate([-1.5,0,0])   
 translate([-W_box/2,  T_box/2-0.1, Wall_frame_thick])
 linear_extrude(height = H_box-Wall_frame_thick-1, twist = alpha, slices = 120) {   
 
      square([W_box/2-Dist_in_walls/2+7,1.5]);
 }

   mirror([1,0,0]){    
    rotate([-1.5,0,0])   
 translate([-W_box/2,  T_box/2-0.1, Wall_frame_thick])
 linear_extrude(height = H_box-Wall_frame_thick-1, twist = alpha, slices = 120) {   
 
      square([W_box/2-Dist_in_walls/2+7,1.5]);
 }
 }
 }
 translate([0,Frame_transl, H_box/2])
 cube([W_box, T_box, H_box], center = true);
 
 }
translate([0,0,  H_box/2])
 cube([Dist_in_walls-2*Wall_in_thickness, T_box+5, H_box], center = true);
 }
 
 
/// Holders for nuts 
NUTS_DIAMETER = 6.6;
 
translate([12.4, -3,0])
translate([14,11.4,Wall_frame_thick])     
{
    difference(){
        translate([0,0,1]) cube([10,10,2], center = true);
        translate([0,0,-0.01]) cylinder(4, NUTS_DIAMETER/2, NUTS_DIAMETER/2, $fn=6);
    }
}
mirror([1,0,0]){
    translate([12.4, -3,0])
    translate([14,11.4,Wall_frame_thick])     
    difference(){
        translate([0,0,1]) cube([10,10,2], center = true);
        translate([0,0,-0.01]) cylinder(4, NUTS_DIAMETER/2, NUTS_DIAMETER/2, $fn=6);
    }
}
 
 
 
 /// Side protrutions for screws

translate([W_box/2, T_box/2- protrution_height +Frame_transl, 0])
Screw_protrution(protrution_length, protrution_height, protrution_thickness, bolt_diameter);
 
translate([W_box/2, T_box/2- protrution_height+Frame_transl,  H_box - protrution_thickness]){
Screw_protrution(protrution_length, protrution_height, protrution_thickness, bolt_diameter);

translate([protrution_length/2, protrution_height/2, -14/2])
rotate(-90)
Balcony(protrution_height, protrution_length, 14, 0);
    }

mirror([1,0,0]){
 translate([W_box/2, T_box/2- protrution_height +Frame_transl, 0])
Screw_protrution(protrution_length, protrution_height, protrution_thickness, bolt_diameter);
 
translate([W_box/2, T_box/2- protrution_height+Frame_transl,  H_box - protrution_thickness]){
Screw_protrution(protrution_length, protrution_height, protrution_thickness, bolt_diameter);

translate([protrution_length/2, protrution_height/2, -14/2])
rotate(-90)
Balcony(protrution_height, protrution_length, 14, 0);
    }    
    
    }
    
/// Balcony
  
 difference(){
translate([0, Frame_transl, H_box  - (Balc_height -  Wall_frame_thick)-1])
Balcony(W_box, T_box, Balc_height, Wall_frame_thick);

X = W_box-Dist_in_walls/2;
Y = T_box+10;
Z = Balc_height+15;
 
 difference(){  
  translate([Dist_in_walls/2, -T_box/2 + Frame_transl-Y-0.5, H_box  -   2*Wall_frame_thick - Z])
  rotate([17,0,0])
    translate([0,9.8,0])
    rotate(21)
  cube([W_box-Dist_in_walls/2,Y, Z]);  
    
     translate([0,0,  H_box/2])
 cube([Dist_in_walls-2*Wall_in_thickness, T_box+5, H_box], center = true);
     
    }
   
mirror([1,0,0]){
   difference(){  
  translate([Dist_in_walls/2, -T_box/2 + Frame_transl-Y, H_box  -   2*Wall_frame_thick - Z])
  rotate([17,0,0])
    translate([0,9.8,0])
    rotate(20)
  cube([W_box-Dist_in_walls/2,Y, Z]);  
    
     translate([0,0,  H_box/2])
 cube([Dist_in_walls-2*Wall_in_thickness, T_box+5, H_box], center = true);
     
    } 
} 

}


intersection(){
rotate(180)    
translate([0, -Frame_transl, H_box  - (Balc_height -  Wall_frame_thick)-1])
Balcony(W_box, T_box, Balc_height, Wall_frame_thick);

X = W_box-Dist_in_walls/2;
Y = T_box+15;
Z = Balc_height+15;

union(){ 
 difference(){  
  translate([Dist_in_walls/2, -T_box/2 + Frame_transl-Y-5, H_box  -   2*Wall_frame_thick - Z+9])
  rotate([1,0,0])
    translate([0,9.8,0])
    rotate(18)
  cube([W_box-Dist_in_walls/2,Y, Z]);  
    
     translate([0,0,  H_box/2])
 cube([Dist_in_walls-2*Wall_in_thickness, T_box+5, H_box], center = true);
     
    }
   
mirror([1,0,0]){
 difference(){  
  translate([Dist_in_walls/2, -T_box/2 + Frame_transl-Y-5, H_box  -   2*Wall_frame_thick - Z+9])
  rotate([1,0,0])
    translate([0,9.8,0])
    rotate(18)
  cube([W_box-Dist_in_walls/2,Y, Z]);  
    
     translate([0,0,  H_box/2])
 cube([Dist_in_walls-2*Wall_in_thickness, T_box+5, H_box], center = true);
     
    }
} 
}
}

/*
*/

