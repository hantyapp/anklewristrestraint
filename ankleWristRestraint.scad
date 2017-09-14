// Ankle to wrist retraint
$fa=3;
// All values in MM
// Hole sizes in Diameter
// Variables
ankleSize = 70; //Size of the ankle Holes
wristSize = 60; // Size of the wrist holes
ankleSpacing = 20; // Space between the ankles
wristToAnkleSpacing = 20; // Space between the wrists and ankles
screwDia = 5; // Screw hole diameter
collarWidth = 30; // Width of the cuffs

totalHeight = ankleSize + wristSize + collarWidth*2 + wristToAnkleSpacing;
totalWidth = ankleSize + collarWidth*2 + ankleSpacing;
intRemHeight = ankleSize + wristSize + wristToAnkleSpacing;

//leftSideTabs();
//rightSideTabs();
rightFill();
//baseMid();

module rightFill()
{
    union()
    {
        difference()
        {
            baseShape();
            union()
            {
                translate([0,-ankleSize/2,0])
                {
                    translate([-intRemHeight,0,0])
                    {
                        square(totalHeight);
                    }
                }
                translate([-((ankleSize/2)+collarWidth),-(ankleSize/2+collarWidth/2),0])
                {
                    square([ankleSize+ankleSpacing/2+collarWidth,totalHeight]);
                }
            }
        }
        //hingeTab();
        //lockTab();
    }
}

module midTabs()
{
    difference()
    {
        baseMid();
        union()
        {
            translate([0,-(ankleSize/2+collarWidth),0])
            {
                square([ankleSize/2,ankleSize/2+collarWidth]);
            }
            translate([ankleSize/2+ankleSpacing,-(ankleSize/2+collarWidth),0])
            {
                square([ankleSize/2,ankleSize/2+collarWidth]);
            }
            translate([0,ankleSize/2+wristToAnkleSpacing+wristSize/2,0])
            {
                square([wristSize/2,wristSize/2+collarWidth]);
            }
            wristToAnkleDiff = wristSize - ankleSize;
            translate([
            wristSize/2+ankleSpacing-wristToAnkleDiff,
            ankleSize/2+wristToAnkleSpacing+wristSize/2,0])
            {
                square([ankleSize/2,ankleSize/2+collarWidth]);
            }
        }
    }
}


module leftSideTabs()
{
    union()
    {
        difference()
        {
            baseShape();
            union()
            {
                translate([0,-ankleSize/2,0])
                {
                    square(intRemHeight);
                }
                translate([ankleSize/2+ankleSpacing/2,-(ankleSize/2+collarWidth/2),0])
                {
                    square([totalWidth,totalHeight]);
                }
            }
        }
        hingeTab();
        lockTab();
    }
}

module baseMid()
{
    union()
    {
        difference()
        {
            baseShape();
            union()
            {
                translate([-totalWidth,-(ankleSize/2+collarWidth/2),0])
                {
                    square([totalWidth,totalHeight]);
                }
                translate([ankleSize+ankleSpacing,-(ankleSize/2+collarWidth/2),0])
                {
                    square([totalWidth,totalHeight]);
                }
            }
        }
    }
}

module rightSideTabs()
{
    union()
    {
        difference()
        {
            baseShape();
            union()
            {
                translate([0,-ankleSize/2,0])
                {
                    translate([-intRemHeight/2.5,0,0])
                    {
                        square(intRemHeight);
                    }
                }
                translate([-((ankleSize/2)+collarWidth),-(ankleSize/2+collarWidth/2),0])
                {
                    square([ankleSize+ankleSpacing/2+collarWidth,totalHeight]);
                }
            }
        }
        hingeTab();
        lockTab();
    }
}

module lockTab()
{
    translate([(ankleSize+wristToAnkleSpacing/2+collarWidth/2)-((ankleSize/2)+collarWidth/2),ankleSize/2+wristSize+wristToAnkleSpacing+(collarWidth*.25),0])
    {
        circle(d=collarWidth/2);
    }
}

module hingeTab()
{
    translate([(ankleSize+wristToAnkleSpacing/2+collarWidth/2)-((ankleSize/2)+collarWidth/2),-((collarWidth*.25)+(ankleSize/2)),0])
    {
        circle(d=collarWidth/2);
    }
}

module baseShape()
{
    difference()
    {
        hull()
        {
            ankleCuffs();
            translate([0,((ankleSize+wristSize)/2)+wristToAnkleSpacing,0])
            {
                wristCuffs();
            }
        }
        union()
        {
            ankleHoles();
            translate([0,((ankleSize+wristSize)/2)+wristToAnkleSpacing,0])
            {
                wristHoles();
            }
        }
    }
}

module ankleCuffs()
{
    circle(d=ankleSize+collarWidth);
    translate([ankleSpacing+ankleSize,0,0])
    {
        circle(d=ankleSize+collarWidth);
    }
}

module ankleHoles()
    {
    circle(d=ankleSize);
    translate([ankleSpacing+ankleSize,0,0])
    {
        circle(d=ankleSize);
    }
}

module wristCuffs()
    {
    circle(d=wristSize+collarWidth);
    translate([ankleSpacing+ankleSize,0,0])
    {
        circle(d=wristSize+collarWidth);
    }
}

module wristHoles()
    {
    circle(d=wristSize);
    translate([ankleSpacing+ankleSize,0,0])
    {
        circle(d=wristSize);
    }
}