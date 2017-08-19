/*
	Author: Assaultboy

	Description:
		Puts the given warning in the chat and RPT file
	
	Remark(s):

	Parameter(s):
	0 - String: The message in the warning

	Returns:
		Nothing
*/

private _full = format ["[CBRN] Warning: %1", _this];

systemChat _full;
diag_log _full;