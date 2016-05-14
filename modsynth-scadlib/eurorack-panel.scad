mm = 1;
hp1 = 5.08*mm;
u3 = 133.35*mm;
eu3 = u3 - 5*mm;
m3_clearance = 3.30*mm;
d=0.001;

module panel(hp_width) {
    realwidth = (hp1 * hp_width) - ((hp1 * hp_width) * 0.006);
    difference() {
        cube([realwidth, eu3, 2*mm]);
        if (hp_width <= 10) { // two holes
            translate([7.5*mm, eu3-3.0*mm, -d]) cylinder(h=(2+2*d)*mm, d=m3_clearance);
            translate([7.5*mm, 3.0*mm, -d]) cylinder(h=(2+2*d)*mm, d=m3_clearance);
        } else { // four holes
            nh = hp_width-3;
            // top
            translate([7.5*mm, eu3-3.0*mm, -d]) cylinder(h=(2+2*d)*mm, d=m3_clearance);
            translate([7.5*mm + (nh*5.08*mm), eu3-3.0*mm, -d]) cylinder(h=(2+2*d)*mm, d=m3_clearance);
            // bottom
            translate([7.5*mm, 3.0*mm, -d]) cylinder(h=(2+2*d)*mm, d=m3_clearance);
            translate([7.5*mm + (nh*5.08*mm), 3.0*mm, -d]) cylinder(h=(2+2*d)*mm, d=m3_clearance);
        }
    }
}

panel(10);
//projection() panel(10);