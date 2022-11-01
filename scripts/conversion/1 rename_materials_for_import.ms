-- Source material gets matched with existing materials on dest mat and
-- appends missing materials to the end of the dest mat.
destMatName = "Facade"
function hasString string word  = (
	s = DotNetObject "System.String" string
	return s.contains word
)

sourceObj = $
if sourceObj != undefined then (
	sourceMat = sourceObj.material
	destMat = null

	print(sourceObj.name)
	print(sourceMat.name)

	-- no idea how to get a material by name, so...
	for mat in sceneMaterials  do (
	   	if mat.name == destMatName then (
	   		destMat = mat
	   		break
	 	)
	)

	indexArray = #()
	for i = 1 to sourceMat.count do append indexArray -1

	for i = 1 to sourceMat.count do (
		-- if the multi material material name is blank and sourceMat name contains "minecraft_block_"
		-- Set the source multi material's material name to the name we will be searching for.  
		if ( sourceMat.names[i] == "" and hasString sourceMat[i].name "minecraft_block_") then (
			local ss = subString sourceMat[i].name 17 sourceMat[i].name.count
			sourceMat.names[i] = substituteString ss "_" " "
		)

		if ( sourceMat.names[i] == "" and hasString sourceMat[i].name "minecraft_entity_") then (
			local ss = subString sourceMat[i].name 18 sourceMat[i].name.count
			sourceMat.names[i] = substituteString ss "_" " "
		)
		
		if ( sourceMat.names[i] == "" and hasString sourceMat[i].name "jmc2obj_banner") then (
			sourceMat.names[i] = "skip"
		)

		indexArray[i] = sourceMat.names[i]

	   	print(sourceMat.names[i])
	)

	-- Go through and append any materials to the destination material that aren't there and
	-- aren't marked for skip
	for i = 1 to sourceMat.count do (
	   	if (indexArray[i] == -1 and not hasString sourceMat[i].name "skip" and sourceMat.names[i] != "skip") then (
			destMat.numsubs = destMat.count + 1
	   		destMat[destMat.count] = sourceMat[i]
			indexarray[i] = destMat.count
			destMat[destMat.count].name = "minecraft " + (substituteString sourceMat.names[i] " " "_")
			destMat.names[destMat.count] = sourceMat.names[i]
			print("new material: " + destMat.names[destMat.count])
	   	)
	)


) else (
	
	-- anti oof code
	print ("Select Something")
)


