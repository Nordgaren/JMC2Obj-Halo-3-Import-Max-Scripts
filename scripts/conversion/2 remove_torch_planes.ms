-- Removes the 

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
