-- Tries to automate replacing torch on torch posts. Sometimes is off a bit, and you either can adjust the position below or just select all the torches and nudge them into place
-- (they will all be at the same place relative to the torch post) You need a %torch instance for this to work. you MUST NOT use optimize mesh in JMC2Obj for this to work. You might
-- have to tinker with it

torchName = "%torch"

function ReplaceTorches = (
	
	if $ == undefined do (
		return "Select Something"
	)
	
	sourceObj = $
	sourceMat = sourceObj.material
	torch = getNodeByName (torchName)
	last = 1
	torchLast = getNodeByName (torchName + formattedPrint last format:"3.3d")
	
	while torchLast != undefined do (
		last += 1
		torchLast = getNodeByName (torchName + formattedPrint last format:"3.3d")
	)
	
	if torch == undefined do (
		return "%torch is undefined"
	)
	
	torchID = 0
	for i = 1 to sourceMat.count do (
		if sourceMat.names[i] == "torch" then (
			torchID = i
			break
		)
	)
	
	if torchID == 0 do (
		return "No Torch Material found."
	)

	
	delArray = #()
	
	index = 1
	while index <= getNumFaces sourceObj do (
		local id = getFaceMatID sourceObj index
		-- these are all grouped together in a group of 12 faces, so once we reach the first one we can manipulate the index to get to the desired face.  
		if id == torchID do (
			--go up two faces, as that is the face with the best position to insert a torch with.  
			index +=2
			local ins = instance torch
			ins.pos = meshop.getFaceCenter sourceObj index
			-- these are the floating point numbers you wanna change if the torches are off from where they should be.  
			ins.pos.y -= 1.3
			ins.pos.x += 1.2
			ins.pos.z += 12
			--skip the rest of the faces. Only skip 9 because the index will be incrimented again by the loop.  
			index += 9
		)
		index += 1
	)
	
	-- now delete all of them! 
	del = getNumFaces sourceObj
	while del > 0 do (
		local id = getFaceMatID sourceObj del 
		if id == torchID do (
			deleteFace sourceObj del 
		)
		del  -= 1
	)
	
)

ReplaceTorches()
