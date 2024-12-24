
function PlayerStateFree(){
	//
hSpeed = lengthdir_x(inputMagnitude * speedWalk,inputDirection);
vSpeed = lengthdir_y(inputMagnitude * speedWalk,inputDirection);

PlayerCollision();

//
var _oldSprite = sprite_index;
if (inputMagnitude != 0) {
	direction = inputDirection
	sprite_index = spriteRun;
}else {
	sprite_index = spriteIdle;
}
if (_oldSprite != sprite_index){
	localFrame = 0;
}

PlayerAnimateSprite();

if (keyAttack) {
	state = PlayerStateAttack;
	stateAttack = AttackSlash;
	
}




if (keyActivate) {
	
	
	var _activateX = x +  lengthdir_x(10,direction);
	var _activateY = y + lengthdir_y(10,direction);
	var _activateSize = 4;
	var _activateList = ds_list_create();
	activate = noone;
	var _entitiesFound = collision_rectangle_list(
		_activateX - _activateSize,
		_activateY - _activateSize,
		_activateX + _activateSize,
		_activateY + _activateSize,
		pEntity,
		false,
		true,
		_activateList,
		true
	);
	while (_entitiesFound > 0) {
		
		var _check = _activateList[| --_entitiesFound];
		if (_check != global.iLifted) && (_check.entityActivateScript != -1) {
			activate = _check;
			break;
		}
	}
	
	ds_list_destroy(_activateList);
	
	if (activate == noone){
			
			if (global.iLifted != noone) {
				PlayerThrow();
			}else{
				state = PlayerStateRoll;
				moveDistanceRemaining = distanceRoll;
				
			}
	}else{
		ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
		
		//
		if (activate.entityNPC) {
			with (activate) {
				direction = point_direction(x,y,other.x,other.y);
				image_index = CARDINAL_DIR
			}
		}
		
		
	}
	
}

if (keyItem) &&  (global.playerHasAnyItems) && (global.playerEquipped != ITEM.NONE) {
	
	switch (global.playerEquipped) {
		case ITEM.BOMB: UseItemBomb();break;
		case ITEM.BOW: UseItemBow();break;
		case ITEM.HOOK: UseItemHook();break;
		default: break;
	}
	
	
}

if (global.playerHasAnyItems) {
	var _cycleDirection = keyItemSelectUp - keyItemSelectDown;
	if (_cycleDirection != 0) {
		do {
			global.playerEquipped += _cycleDirection;
			if (global.playerEquipped < 1) global.playerEquipped = ITEM.TYPE_COUNT-1;
			if (global.playerEquipped >= ITEM.TYPE_COUNT) global.playerEquipped = 1;
		}
		until (global.playerItemUnlocked[global.playerEquipped]);
	}
}

}