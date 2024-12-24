
function PlayerStateBonk(){
	hSpeed = lengthdir_x(speedBonk,direction-180);
	vSpeed = lengthdir_y(speedBonk,direction-180);
	
	moveDistanceRemaining = max(0,0, moveDistanceRemaining - speedBonk);
	var _collided = PlayerCollision();
	
	//
	sprite_index = sPlayerHurt;
	image_index = CARDINAL_DIR + 2;
	
	//
	z = sin(((moveDistanceRemaining / distanceBonk)* pi)) * distanceBonkHeight;
	//
	if (moveDistanceRemaining <= 0) {
		state = PlayerStateFree;
	}
	

}