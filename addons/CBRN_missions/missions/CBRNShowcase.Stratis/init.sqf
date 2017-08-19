showcase_step = 0;
showcase_disableInv = false;

player addEventHandler ["InventoryOpened", {
	showcase_disableInv;
}];