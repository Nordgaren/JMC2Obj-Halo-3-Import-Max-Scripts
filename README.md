# JMC2Obj Halo 3 Import Scripts  
Scripts for importing JMC2Obj objects to Halo 3  
  
# Usage  
Run these scripts in order.  

The first script will rename your materials. The material names we used weren't the same as the JMC2Obj material names, so this  
You can put custom filters by adding an if statement and useing the hasString function   
and check sourceMat.names[i] for what you want to filter   

The second script is used if you left torches in. They will be multiple planes, and this script goes through them and tries to place the torch   
the best it can. You may have to mess with the script or nudge all the torches at once.  You want to make sure you do this before porting,   
as it deletes those bad torch planes, as well, and you probably don't want them ported to your material.   

The third script will do the actual porting of materials. This script will also check for new materials, but it won't filte if you have custom names. It just makes sure that things are not names  incorrectly, which is important for the transfer. It edits the material names to have no prefix and no underscores, as well.   

Open an issue if you have any problems! The first script might have some bugs, because I had to recreate it after the fact, because I oofed it.   
