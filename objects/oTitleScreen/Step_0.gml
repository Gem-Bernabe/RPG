if (!keyPressed) {
	
	titleVisible = min(1, titleVisible + 0.01);
	

}else {
	
	titleVisible = max(0, titleVisible - 0.01);
	slotsVisible = min(1, slotsVisible + 0.01);
}

if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
	
	slotSelected -= 1;
	if (slotSelected < 0) slotSelected = 2;
	audio_play_sound(mMenu,10,false);
	
}
if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
	
	slotSelected += 1;
	if (slotSelected > 2) slotSelected = 0;
	audio_play_sound(mMenu,10,false);
}

if ((keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space))) && (keyPressed) && (!loadingStarted) {
	
	global.gameSaveSlot = slotSelected;
	if (!LoadGame(global.gameSaveSlot)) {
		RoomTransition(TRANS_TYPE.SLIDE,rVillage);
	}
	audio_play_sound(mMenu,10,false);
	loadingStarted = true;
}





if (keyboard_check_pressed(vk_anykey)) keyPressed = true;
