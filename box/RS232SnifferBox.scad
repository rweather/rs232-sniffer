$fn = 200;

// Diameter of screw holes in the mounting posts.  Intended for 4G metal screws.
holedia = 2.2;

// Set 'cutaway' to true to cut away the side of the box to see the detail.
//cutaway = true;
cutaway = false;

// Set this to true to show the PCB inside the box.
//showpcb = true;
showpcb = false;

module RS232Connector() {
    translate([0, 0, 7]) cube([31, 17, 12], center=true);
}

module PCB() {
    difference() {
        cube([99.06, 54.61, 2], center=true);
        translate([45.5, 23.25, 0]) cube([8.2, 8.2, 4], center=true);
        translate([45.5, -23.25, 0]) cube([8.2, 8.2, 4], center=true);
        translate([-45.5, 23.25, 0]) cube([8.2, 8.2, 4], center=true);
        translate([-45.5, -23.25, 0]) cube([8.2, 8.2, 4], center=true);
        translate([37.845, 23.62, 0]) cylinder(h=4, d=3, center=true);
        translate([37.845, -23.62, 0]) cylinder(h=4, d=3, center=true);
        translate([-37.845, 23.62, 0]) cylinder(h=4, d=3, center=true);
        translate([-37.845, -23.62, 0]) cylinder(h=4, d=3, center=true);
    }
    translate([0, 26, 0]) RS232Connector();
    translate([17.5, -26, 0]) rotate([0, 0, 180]) RS232Connector();
    translate([-17.5, -26, 0]) rotate([0, 0, 180]) RS232Connector();
    translate([-48, 0, 0]) rotate([0, 0, 90]) RS232Connector();
    translate([48, 0, 0]) rotate([0, 0, -90]) RS232Connector();
}

module BoxShape(adjust) {
    linear_extrude(height=24) {
        hull() {
            translate([50.5 - adjust, 28.5 - adjust]) circle(3);
            translate([50.5 - adjust, -28.5 + adjust]) circle(3);
            translate([-50.5 + adjust, 28.5 - adjust]) circle(3);
            translate([-50.5 + adjust, -28.5 + adjust]) circle(3);
        }
    }
}

module OuterHull() {
    difference() {
        BoxShape(0);
        translate([0, 0, 3]) BoxShape(3);
        translate([0, 30, 17]) cube([34, 5, 16], center=true);
        translate([0, -30, 17]) cube([69, 5, 16], center=true);
        translate([-52, 0, 17]) rotate([0, 0, 90]) cube([34, 5, 16], center=true);
        translate([52, 0, 17]) rotate([0, 0, 90]) cube([34, 5, 16], center=true);
        if (cutaway)
            translate([0, -30, 0]) cube([110, 20, 50], center=true);
    }
}

module MountingPost() {
    difference() {
        //cylinder(h=6, d=6);
        cylinder(h=6, r1=5, r2=3);
        translate([0, 0, -1.5]) cylinder(h=20, d=holedia);
    }
}

module CornerPost() {
    difference() {
        cylinder(h=22, d=8);
        translate([0, 0, 3]) cylinder(h=20, d=holedia);
    }
}

module Box() {
    OuterHull();
    translate([48, 25, 2]) CornerPost();
    translate([48, -25, 2]) CornerPost();
    translate([-48, 25, 2]) CornerPost();
    translate([-48, -25, 2]) CornerPost();
    translate([37.845, 23.62, 2]) MountingPost();
    translate([37.845, -23.62, 2]) MountingPost();
    translate([-37.845, 23.62, 2]) MountingPost();
    translate([-37.845, -23.62, 2]) MountingPost();
}

if (showpcb)
    color([0, 0.5, 0, 1]) translate([0, 0, 9]) PCB();
Box();