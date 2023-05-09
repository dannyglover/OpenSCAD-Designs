include <BOSL2/std.scad>

// use these two variables to make
// objects have smooth edges
/* [Hidden] */
$fa=0.1;
$fs=0.1;
/* [Options] */

cuboid([50,17.2,10], except=BOTTOM, rounding=2);