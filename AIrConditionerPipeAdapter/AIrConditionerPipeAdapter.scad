include <BOSL2/std.scad>

// use these two variables to make
// objects have smooth edges
/* [Hidden] */
$fa=0.1;
$fs=0.1;
/* [Options] */

smallPipeDiameter=43;
// the diameter of the smallest pipe's  cap
smallPipeCapDiameter=smallPipeDiameter + 5;
// the diameter of the largest pipe
largePipeDiameter=43;
// the diameter of the largest pipe's  cap
largePipeCapDiameter=largePipeDiameter + 5;
// the diameter of the smallest pipe
// the size of the hole walls
wallThickness=2;
// the height of the base of the plug
baseHeight=2.5;
// the height of the plugs seal
sealHeight=8.0;
// the height of the inner tube
topHeight=baseHeight + 6;
// include the size text in the model?
includeSizeText=false;

// the largest pipe 
difference()
{
	cylinder(d=smallPipeCapDiameter, h=baseHeight)
	{
		// the size text
		if (includeSizeText)
		{
			attach(TOP)
			text3d(text=str(smallPipeDiameter), h=1.5, center=true);
		};

		// the seal tube
		attach(TOP)
		tube(h=sealHeight, od=smallPipeDiameter, wall=wallThickness, anchor=BOTTOM)
		{
			// the sloped tube
			attach(TOP)
			tube(h=topHeight, od1=smallPipeDiameter, od2=smallPipeDiameter/1.5, wall=wallThickness, anchor=BOTTOM);
		};
		
		attach(BOTTOM)
		// the smallest pipe
		cylinder(d=largePipeCapDiameter, h=baseHeight)
		{
			// the size text
			if (includeSizeText)
			{
				attach(TOP)
				text3d(text=str(largePipeDiameter), h=1.5, center=true);
			};

			// the seal tube
			attach(TOP)
			tube(h=sealHeight, od=largePipeDiameter, wall=wallThickness, anchor=BOTTOM)
			{
				// the sloped tube
				attach(TOP)
				tube(h=topHeight, od1=largePipeDiameter, od2=largePipeDiameter/1.5, wall=wallThickness, anchor=BOTTOM);
			};
		};
	};

	// cut out a hole from the caps
	cylinder(h=(baseHeight * 2) + 1, d=smallPipeDiameter / 1.1, center=true);
};
