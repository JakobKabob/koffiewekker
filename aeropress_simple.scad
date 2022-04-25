
module simple_base() {
    translate([0, 40, 0]) minkowski() {
        cube([300, 240, 25], center=true);
        cylinder(r=20);
    }
}

module base(width, height, show_props=false){
    difference() {
        hull() {
            cylinder(h=height, d=width);
            translate([width/2, width/2, 0]) cylinder(h=height, d=width*0.7);
            translate([-width/2, width/2, 0]) cylinder(h=height, d=width*0.7);
        }
        translate([-width/2, width/2, 16]) cylinder(h=10, d=70);
    }
    translate([-135, 30, 0]) cylinder(h=height, d=80);

    // mockup watertank and cup
    if (show_props == true) {
        difference() {
            translate([-135, 30, height]) color("LightSkyBlue") cylinder(h=200, d=70);
            translate([-135, 30, height+1]) color("LightSkyBlue") cylinder(h=200, d=65);
        }
        color("DarkKhaki") translate([width/2+25, width/2, 25]) import("CoffeeMug_02_Mug.stl", convexity=3, center=true);
    }

}


module tower(width, height) {
    translate([0,0,25]) difference() {
        cylinder(h=height, r1=(width-20)/2, r2=40);
        translate([-width/2, 0, height*0.02]) cube([width, width/2, height*0.981]);
    }
}

module hand() {
    translate([190, -300, 260]) scale([7,7,7]) mirror([0,1,0]) mirror([0,0,1]) import("HAND_9.stl", convexity=3);
}

common_base_diameter = 160;
tower(common_base_diameter, 250);
base(common_base_diameter, 25, show_props=true);
hand();
