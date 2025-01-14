function PurchaseItem(_item, _amount, _cost){
	
	if (global.playerMoney >= _cost) {
		
		global.playerHasAnyItems = true;
		global.playerItemUnlocked[_item] = true;
		global.playerAmmo[_item] += _amount;
		global.playerMoney -= _cost;
		global.playerEquipped = _item;
		instance_destroy(activate);
		
		var _desc = "";
		switch (_item) {
			
			case ITEM.BOW: _desc = "The bow!\nFire with the activate key to damage enemies, \nfind ammo in the world!"; break;
			case ITEM.BOMB:	_desc = "Bombs!\nActivate to light the fuse, then agin to throw.\nBlow apart enemies, pots\nand certain large cave blocking boulders!";	break;
			case ITEM.HOOK:	_desc = "The grappling hook!\nActivate to hook things towards you,\n nor you towards things!\nUse with care!"; break;
			default: _desc = "No item description found!"; break;
		}
		NewTextBox(_desc,1);
	}else {
		NewTextBox("Not enough money...",1);
	}

}