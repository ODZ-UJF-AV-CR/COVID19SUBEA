// FILTER ADAPTER FOR MASK EASYBREATH - TYPE 2
$fn = 100;

// Tube parameters

R_in_small = 9.55;  // Radius of small circles
R_in_big = 100;    // Radius of big circle

Dist_center = 45 - 2*R_in_small;  // Distance of centers of small circles

Wall_out_thickness =  2;  // Minimal thickness of outer walls (in the thinnest place)

Wall_in_thickness = 1.4;   // Thickness of inner walls
Dist_in_walls = 18.2; // Outer distance of inner walls
Det_in_walls = 15.2;  // Detachment of the inner walls from upper base (mask entrance)

Dist_big_center = sqrt(R_in_big* R_in_big - (Dist_center/2)*(Dist_center/2)); // Distance of the center of the big circle

R_out_small = R_in_small + Wall_out_thickness + R_in_big - Dist_big_center; // Outer radius of small circless

H_tube = 142; // Height of the tube

// Zaslepeni vydechovych otvoru
H_prep = 2; // Tloustka zaslepovacich prepazek

// Frame parameters

T_box = 2*R_out_small; // Thickness of the box
W_box = 145;   // Width of the box
H_box = 102;    // Height of the box

Wall_frame_thick = 6;  // Thickness of the frame wall

// Balcony
Balc_height = 25;

/// Side protrution for screws

    bolt_diameter = 3.2;
    head_height   = 3;
    head_diameter = 6.6;
    nut_height    = 0; // 2.7;
    nut_diameter  = 0;  // 6.6;
    nut_pocket    = 0;  // 6.6;
    
    length = 35;
    pocket_size = 0;  // 35;
    global_clearance = 0.2;
 
    protrution_thickness = 11;
    protrution_length = 10;
    protrution_height = 5;

// Snorkel - better model of the inner tube    
fudge = 0.1;
zsize = 5;
line_fn = 4;
min_line_width = 1.0;
line_width_scale = 1.0;
function min_line_mm(w) = max(min_line_width, w * line_width_scale) * 96/25.4;



module Outer_coat(Dist_center, R_out_small, H_tube){
  
  hull(){
    translate([-Dist_center/2,0,0])
        cylinder(r = R_out_small, h = H_tube, center = true);
    translate([Dist_center/2,0,0])
        cylinder(r = R_out_small, h = H_tube, center = true);
  }
}


//------------------------- Gumicka
path41003_0_center = [0.000000,0.000000];
path41003_0_points = [[-56.980741,38.102673],[-60.174962,37.548269],[-63.436396,36.635739],[-66.590567,35.422882],[-69.463002,33.967499],[-73.905528,30.939423],[-77.751113,27.385686],[-80.979055,23.328560],[-83.568654,18.790317],[-85.248428,14.622913],[-86.517860,10.104830],[-87.352562,5.343640],[-87.728142,0.446918],[-87.474660,-4.765085],[-86.338765,-9.697751],[-85.070884,-13.054464],[-83.494422,-16.144110],[-81.582215,-19.013085],[-79.307100,-21.707783],[-76.901557,-24.034976],[-74.340061,-25.989346],[-71.337464,-27.761893],[-67.608618,-29.543610],[-59.877223,-32.446672],[-51.297540,-34.646413],[-41.538248,-36.210840],[-30.268023,-37.207956],[-18.547990,-37.786220],[-9.094559,-38.195358],[24.407056,-38.207453],[36.093753,-37.478226],[45.953606,-36.383149],[54.383043,-34.865594],[61.778496,-32.868934],[65.983642,-31.364682],[69.801150,-29.680302],[73.236800,-27.811463],[76.296367,-25.753837],[78.985630,-23.503093],[81.310366,-21.054902],[83.276353,-18.404933],[84.889369,-15.548857],[86.095481,-12.546367],[86.979433,-9.039539],[87.471434,-5.802703],[87.728142,-1.518482],[87.670204,4.505993],[86.820394,9.589592],[84.902987,15.303206],[82.097491,20.589468],[78.515231,25.354948],[74.267534,29.506215],[69.465725,32.949837],[64.221129,35.592384],[58.645071,37.340426],[52.848877,38.100530],[-2.128882,38.207453],[-56.980741,38.102231],[-56.980741,38.102673]];
module poly_path41003(h, w, s, res=line_fn)
{
  scale([25.4/96, -25.4/96, 1]) union()
  {
    translate (path41003_0_center) linear_extrude(height=h, convexity=10, scale=0.01*s)
      translate (-path41003_0_center) polygon(path41003_0_points);
  }
}

module snorkel_model_gumicka(h)
{
  difference()
  {
    union()
    {
      translate ([0,0,0]) poly_path41003(h, min_line_mm(0.02974246), 100.0);
    }
    union()
    {
    }
  }
}


//---------------------- Inner
path4100_0_center = [0.000000,0.000000];
path4100_0_points = [[-56.186721,36.347465],[-59.336433,35.818595],[-62.552419,34.948092],[-65.662636,33.791093],[-68.495042,32.402734],[-72.875662,29.514118],[-76.667659,26.124045],[-79.850620,22.253764],[-82.404134,17.924523],[-84.060502,13.949045],[-85.312246,9.639037],[-86.135317,5.097120],[-86.505664,0.425909],[-86.255706,-4.546063],[-85.135644,-9.251557],[-83.885431,-12.453679],[-82.330937,-15.401034],[-80.445376,-18.137881],[-78.201963,-20.708478],[-75.829941,-22.928493],[-73.304139,-24.792857],[-70.343383,-26.483771],[-66.666502,-28.183434],[-59.042840,-30.952801],[-50.582713,-33.051236],[-40.959414,-34.543613],[-29.846238,-35.494805],[-18.289527,-36.046442],[-8.967826,-36.436725],[24.066948,-36.447845],[35.590795,-35.752199],[45.313252,-34.707555],[53.625226,-33.259890],[60.917621,-31.355182],[68.828482,-28.313401],[72.216257,-26.530630],[75.233190,-24.567766],[77.884980,-22.420677],[80.177322,-20.085234],[82.115915,-17.557307],[83.706454,-14.832765],[84.895754,-11.968554],[85.767384,-8.623223],[86.252534,-5.535465],[86.505664,-1.448546],[86.448673,4.298480],[85.610564,9.147960],[83.719876,14.598438],[80.953474,19.641248],[77.421132,24.187259],[73.232626,28.147344],[68.497730,31.432374],[63.326217,33.953222],[57.827862,35.620758],[52.112440,36.345855],[-2.099215,36.447845],[-56.186721,36.347465],[-56.186721,36.347465]];
module poly_path4100(h, w, s, res=line_fn)
{
  scale([25.4/96, -25.4/96, 1]) union()
  {
    translate (path4100_0_center) linear_extrude(height=h, convexity=10, scale=0.01*s)
      translate (-path4100_0_center) polygon(path4100_0_points);
  }
}

module snorkel_model_inner(h)
{
  difference()
  {
    union()
    {
      translate ([0,0,0]) poly_path4100(h, min_line_mm(0.10902565), 100.0);
    }
    union()
    {
    }
  }
}





module Partition(Dist_in_walls, Det_in_walls, Wall_in_thickness, R_in_small, R_in_big, Dist_big_center, H_tube){
    
    translate([-(Dist_in_walls - Wall_in_thickness)/2, 0, -Det_in_walls/2])
        cube([Wall_in_thickness, 2*(R_in_small + R_in_big - Dist_big_center), H_tube-  Det_in_walls], center = true);
    
    translate([(Dist_in_walls - Wall_in_thickness)/2, 0, -Det_in_walls/2])
        cube([Wall_in_thickness, 2*(R_in_small + R_in_big - Dist_big_center), H_tube-Det_in_walls], center = true);
    }

 /* module Zaslepeni(Dist_center, Dist_big_center, R_in_small, R_in_big, H_prep, Dist_in_walls, R_out_small, H_tube){
    difference(){
        
        rotate(180)
        translate ([0,0,0]) snorkel_model_inner(H_prep);
        
        cube([Dist_in_walls, 2*R_out_small, H_prep + 3], center = true);
    }
    } */
    
module Frame(W_box, T_box, H_box, Wall_frame_thick, Wall_out_thickness){
    difference(){
        cube([W_box, T_box, H_box], center = true);
        translate([0,10,0])
        cube([W_box - 2*Wall_frame_thick, T_box - 2*Wall_out_thickness  + 10, H_box - 2*Wall_frame_thick], center = true);
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
    
module Screw_protrution(protrution_length, protrution_height, protrution_thickness, bolt_diameter, nut_height, nut_diameter, nut_pocket, pocket_size, global_clearance){
    
 difference(){
cube([protrution_length, protrution_height, protrution_thickness]);
     
    translate([protrution_length/2, 0, protrution_thickness/2])
    rotate([90,0,0]) {
        
    translate([0,0,- protrution_height/2])
    cylinder(r = bolt_diameter/2, h = protrution_height + 1, center = true);
    
    // nut pocket
    translate([0,0,- protrution_height/2 - (nut_height + global_clearance)/2])
    cylinder(h = nut_height + global_clearance , d = nut_diameter+0.6, $fn=6);   
    }
    
    translate([pocket_size/2+protrution_length/2,protrution_height/2, protrution_thickness/2])
    rotate([90,0,0])
    
  cube([pocket_size, nut_pocket-0.4, nut_height + global_clearance], center = true);
    }   
    
    }




difference(){  
union(){
    
/// Tube
difference(){    
difference(){
Outer_coat(Dist_center, R_out_small, H_tube);

rotate(180)
translate ([0,0,-H_tube/2-1]) snorkel_model_inner(H_tube + 10);

rotate(180)
translate ([0,0,H_tube/2-5]) snorkel_model_gumicka(10);
}

}



/// Inside of the tube
difference(){  // Proderaveni prepazek
    
Partition(Dist_in_walls, Det_in_walls, Wall_in_thickness, R_in_small, R_in_big, Dist_big_center, H_tube); // Pricky 
  
    translate([0,0, H_tube/2 - H_box])
  cube([Dist_in_walls + Wall_in_thickness + 1, 2*R_out_small, H_box], center = true); // Proderaveni prepazek
}  // Proderaveni prepazek

/* translate([0, 0, H_tube/2 - Det_in_walls - 15])  // Zaslepeni vydechovych otvoru
Zaslepeni(Dist_center, Dist_big_center, R_in_small, R_in_big, H_prep, Dist_in_walls, R_out_small, H_tube);   // Zaslepeni vydechovych otvoru  */

/// Part for the filter
difference(){
translate([0,0,- H_tube/2 + H_box/2])
Frame(W_box, T_box, H_box, Wall_frame_thick, Wall_out_thickness);

rotate(180)
translate ([0,0,-H_tube/2+Wall_frame_thick]) snorkel_model_inner(H_tube - 2*Wall_frame_thick);
    
}

}


/// Empty inside
translate([0,+5,- H_tube/2 + H_box/2 ])
cube([W_box - 2*Wall_frame_thick, T_box - 2*Wall_out_thickness  + 10 /**/, H_box - 2*Wall_frame_thick ], center = true); 
    
}
difference() {
/// Balcony
translate([0, 0, H_tube/2  - (Balc_height + 2* Wall_frame_thick +H_tube - 120)])
Balcony(W_box, T_box, Balc_height, Wall_frame_thick);
    
translate([0, 0, 10])
     cube([Dist_in_walls - 2*Wall_in_thickness, 2*R_out_small, 80], center = true);   
}


/// Side protrutions for screws

translate([W_box/2, T_box/2- protrution_height, - H_tube/2])
Screw_protrution(protrution_length, protrution_height, protrution_thickness, bolt_diameter, nut_height, nut_diameter, nut_pocket, pocket_size, global_clearance);

mirror([1,0,0])
translate([W_box/2, T_box/2- protrution_height, - H_tube/2])
Screw_protrution(protrution_length, protrution_height, protrution_thickness, bolt_diameter, nut_height, nut_diameter, nut_pocket, pocket_size, global_clearance);

translate([W_box/2, T_box/2- protrution_height, - H_tube/2 + H_box - protrution_thickness]){
Screw_protrution(protrution_length, protrution_height, protrution_thickness, bolt_diameter, nut_height, nut_diameter, nut_pocket, pocket_size, global_clearance);

translate([protrution_length/2, protrution_height/2, -14/2])
rotate(-90)
Balcony(protrution_height, protrution_length, 14, 0);}

mirror([1,0,0]){
translate([W_box/2, T_box/2- protrution_height, - H_tube/2 + H_box - protrution_thickness]){
Screw_protrution(protrution_length, protrution_height, protrution_thickness, bolt_diameter, nut_height, nut_diameter, nut_pocket, pocket_size, global_clearance);

translate([protrution_length/2, protrution_height/2, -14/2])
rotate(-90)
Balcony(protrution_height, protrution_length, 14, 0);}
}
