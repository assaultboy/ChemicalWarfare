/*
	Author: Assaultboy

	Description:
		Checks if the given addon is loaded
	
	Remark(s):

	Parameter(s):
	0 - Addon Name: The name of the addon to check for

	Returns:
		Boolean - Is the addon loaded?
*/

(isClass (configFile >> "CfgPatches" >> _this));