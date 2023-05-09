include <BOSL2/std.scad>

// use these two variables to make
// objects have smooth edges
/* [Hidden] */
$fa=0.1;
$fs=0.1;
/* [Options] */

bottomWidth=28;
bottomHeight=22;
bottomDepth=2;
wallWidth=4;
wallHeight=6;
totalWidth=bottomWidth + (wallWidth * 2);

// the middle cube (between the legs and the top
cuboid([totalWidth, bottomHeight, bottomDepth], chamfer=0.2, edges=["Z"])
{   
    // front legs
    attach(BOTTOM)
    position(FRONT)
    cuboid([totalWidth, wallWidth, wallHeight], chamfer=0.2, edges=["Z"], anchor=BOTTOM+FRONT);
    
    // back legs
    attach(BOTTOM)
    position(BACK)
    cuboid([totalWidth, wallWidth, wallHeight], chamfer=0.2, edges=["Z"], anchor=BOTTOM+BACK);
    
    // the top section
    attach(TOP)
    position(CENTER)
    difference()
    {
        // the slot for the USB stick
        rect_tube(size=[totalWidth, bottomHeight], wall=wallWidth, h=30, chamfer=0.2);
        
        // the cutout for the USB cable
        position(CENTER+FRONT)
        cube([10, wallWidth * 2.5, 31], anchor=BOTTOM+CENTER);
    };
};