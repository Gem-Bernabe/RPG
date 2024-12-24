function SlimeWander(){
	
	sprite_index = sprMove;
	
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed) {
		
		hSpeed = 0;
		vSpeed = 0;
		
		if (image_index < 1) {
			
			image_speed = 0;
			image_index = 0;
		
		}
		
		
		if (++wait >= waitDuration) {
			
			wait = 0;
			timePassed  = 0;
			
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45,45);
			xTo = x  +  lengthdir_x(enemyWanderDistance, dir);
			yTo = y  +  lengthdir_y(enemyWanderDistance, dir);
		}
		
		
	}else{
		
		timePassed++;
		image_speed = 1.0;
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed) {
			_speedThisFrame = _distanceToGo;
		}
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_speedThisFrame,dir);
		vSpeed = lengthdir_y(_speedThisFrame,dir);
		if (hSpeed != 0) {
			image_xscale = sign(hSpeed);
		}
		
		
		
		var _collided =	EnemyTileCollision();
	}
	
	//
	if (++aggroCheck >= aggroCheckDuration) {
		
		
		aggroCheck = 0;
		if (instance_exists(oPlayer)) && (point_distance(x,y,oPlayer.x,oPlayer.y) <= enemyAggroRadius) {
			
			state = ENEMYSTATE.CHASE;
			audio_play_sound(mSlime,8,false);
			if (audio_is_paused(mSlime)) {
	
					audio_resume_sound(mSlime);
	
			}else {
	
					audio_pause_sound(mSlime);
			}
			target = oPlayer;
		}
		
	}
	

}


function SlimeChase(){
	
	sprite_index = sprMove;
	if (instance_exists(target)) {
		
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		image_speed = 1.0;
		dir = point_direction(x,y,xTo,yTo);
		if (_distanceToGo > enemySpeed) {
			
			hSpeed = lengthdir_x(enemySpeed,dir);
			vSpeed = lengthdir_y(enemySpeed,dir);
			
		}else{
			
			hSpeed = lengthdir_x(_distanceToGo,dir);
			vSpeed = lengthdir_y(_distanceToGo,dir);
			
		}
		if (hSpeed != 0) {
			image_xscale = sign(hSpeed);
		}
		EnemyTileCollision();
		
	}
	
	
	if (instance_exists(target)) && (point_distance(x,y,target.x,target.y) <= enemyAttackRadius) {
		
		state = ENEMYSTATE.ATTACK;
		audio_play_sound(mSlime,8,false);
		if (audio_is_paused(mSlime)) {
	
					audio_resume_sound(mSlime);
	
			}else {
	
					audio_pause_sound(mSlime);
			}
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0;
		xTo += lengthdir_x(8,dir);
		yTo += lengthdir_y(8,dir);
	}
}


function SlimeAttack(){
	
	var _spd = enemySpeed;
	
	if (image_index < 2) {
		_spd = 0;
	}
	
	if (floor(image_index) == 3) || (floor(image_index) == 5) {
		image_speed = 0;
	}
	
	
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	
	
	if (_distanceToGo < 4) && (image_index < 5) {
		image_speed = 1.0;
	}
	
	if (_distanceToGo > _spd) {
		
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(_spd,dir);
		vSpeed = lengthdir_y(_spd,dir);
		if (hSpeed != 0) {
			
			image_xscale = sign(hSpeed);
		}
		
		if (EnemyTileCollision() == true) {
			
			xTo = x;
			yTo = y;
		}
		
	}else{
		
		xTo = x;
		yTo = y;
		if (floor(image_index) < 5) {
			
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = 15;
			state = ENEMYSTATE.WAIT;
			audio_play_sound(mSlime,8,false);
			if (audio_is_paused(mSlime)) {
	
					audio_resume_sound(mSlime);
	
			}else {
	
					audio_pause_sound(mSlime);
			}
		}
	}

}


function SlimeHurt() {
    // Set hurt sprite
    sprite_index = sprHurt;

    // Calculate distance to target
    var _distanceToGo = point_distance(x, y, xTo, yTo);
    if (_distanceToGo > enemySpeed) {
        // Move towards target
        image_speed = 1.0;
        dir = point_direction(x, y, xTo, yTo);
        hSpeed = lengthdir_x(enemySpeed, dir);
        vSpeed = lengthdir_y(enemySpeed, dir);

        // Adjust sprite direction based on horizontal speed
        if (hSpeed != 0) {
            image_xscale = -sign(hSpeed);
        }

        // Check for collision
        if (EnemyTileCollision()) {
            // Stop movement if collision detected
            xTo = x;
            yTo = y;
        } else {
            // Move towards the target
            x += hSpeed;
            y += vSpeed;
        }
    } else {
        // Target reached
        xTo = x;
        yTo = y;

        // Return to previous state or chase if previously attacking
        if (statePrevious != ENEMYSTATE.ATTACK) {
            state = statePrevious;
			audio_play_sound(mSlime,1000,false);
			
        } else {
            state = ENEMYSTATE.CHASE;
			audio_play_sound(mSlime,8,false);
			if (audio_is_paused(mSlime)) {
	
					audio_resume_sound(mSlime);
	
			}else {
	
					audio_pause_sound(mSlime);
			}
			
        }
    }
}


function SlimeDie() {
	
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distannceToGO = point_distance(x,y,xTo,yTo);
	if (_distannceToGO > enemySpeed) {
		
		dir = point_direction(x,y,xTo,yTo);
		hSpeed = lengthdir_x(enemySpeed,dir);
		vSpeed = lengthdir_x(enemySpeed,dir);
		if (hSpeed != 0) {
			image_xscale = -sign(hSpeed);
		}
		
		EnemyTileCollision();
	}else {
		
		x = xTo;
		y = yTo;
	}
	
	if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number) {
		instance_destroy();
	}
}