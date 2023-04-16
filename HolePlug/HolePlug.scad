include <BOSL2/std.scad>

// use these two variables to make
// objects have smooth edges
/* [Hidden] */
$fa=0.1;
$fs=0.1;
/* [Options] */

// the diameter of the hole you're trying to plug
holeDiameter=43;
// the diameter of the plugs cap
plugCapDiameter=holeDiameter + 5;
// the size of the hole walls
wallThickness=2;
// the height of the top of the plug
baseHeight=2.5;
// the height of the plugs seal
sealHeight=4.0;
// the height of the inner tube
topHeight=baseHeight + 6;
// include the size text in the model?
includeSizeText=false;

// the plugs outer cap
cylinder(d=plugCapDiameter, h=baseHeight)
{
	// the size text
	if (includeSizeText)
	{
		attach(TOP)
		text3d(text=str(holeDiameter), h=1.5, center=true);
	};

	// the seal tube
	attach(TOP)
	tube(h=sealHeight, od=holeDiameter, wall=wallThickness, anchor=BOTTOM)
	{
		// the sloped tube
		attach(TOP)
		tube(h=topHeight, od1=holeDiameter, od2=holeDiameter/1.5, wall=wallThickness, anchor=BOTTOM);
	};
};
