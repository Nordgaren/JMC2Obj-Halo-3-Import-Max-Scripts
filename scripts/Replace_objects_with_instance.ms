-- Set the target to a value higher than your highest instance value
-- This allows the script to make sure everything is sequential after patch
-- This script replaces anything that starts with `%` and ends with a number 
-- with an instance of the base object that starts with `%` and 
-- does NOT end with a number.
target = 100

for obj in objects do (
	local sStart = substring obj.name 1 1
	local sEnd = substring obj.name obj.name.count obj.name.count
	
	if sStart == "%" and sEnd > "9" then (
		local mObj = obj.name
		local last = 1
		local iter = 1
		local insName = mObj + formattedPrint iter format:"3.3d"
		local node = getNodeByName (insName)
		print(mObj)
		while iter <= target do (
			if node != undefined then (
				instanceReplace node obj
 				node.name = mObj + formattedPrint last format:"3.3d"
				last += 1
				print(insName)
			)
			iter += 1
			insName = mObj + formattedPrint iter format:"3.3d"
			node = getNodeByName (insName)
		)
	)
)
