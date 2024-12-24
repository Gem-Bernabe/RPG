function AttackSlash() {
    if (sprite_index != sPlayerAttackSlash) {
        // Set up attack animation
        sprite_index = sPlayerAttackSlash;
        localFrame = 0;
        image_index = 0;

        // Initialize or clear hit list
        if (!ds_exists(hitByAttack, ds_type_list)) {
            hitByAttack = ds_list_create();
			
        }
        ds_list_clear(hitByAttack);
    }

    // Calculate attack hits
    CalcAttack(sPlayerAttackSlashHB);

    // Handle player animation
    PlayerAnimateSprite();

    // End attack if animation finishes
    if (animationEnd) {
        state = PlayerStateFree;
		audio_play_sound(mSwing,8,false);
        animationEnd = false;
    }
}

function AttackSpin() {
    // Example spin attack logic (you can expand this based on your requirements)
    
}

function CalcAttack(argument0) {
    // Temporarily set mask to attack hitbox
    mask_index = argument0;

    var hitByAttackNow = ds_list_create();
    var hits = instance_place_list(x, y, pEntity, hitByAttackNow, false);

    if (hits > 0) {
        for (var i = 0; i < hits; i++) {
            var hitID = hitByAttackNow[| i];
            if (ds_list_find_index(hitByAttack, hitID) == -1) {
                ds_list_add(hitByAttack, hitID);
                with (hitID) {
                    if (object_is_ancestor(object_index, pEnemy)) {
                        HurtEnemy(id, 5, other.id, 10);
                    } else if (entityHitScript != -1) {
                        script_execute(entityHitScript);
                    }
                }
            }
        }
    }

    // Destroy temporary hit list
    ds_list_destroy(hitByAttackNow);

    // Reset player mask
    mask_index = sPlayer;
}

function HurtEnemy(_enemy, _damage, _source, _knockback) {
    with (_enemy) {
        if (state != ENEMYSTATE.DIE) {
            enemyHP -= _damage;
            flash = 1;

            if (enemyHP <= 0) {
                state = ENEMYSTATE.DIE;
            } else {
                if (state != ENEMYSTATE.HURT) {
                    statePrevious = state;
                }
                state = ENEMYSTATE.HURT;
            }

            image_index = 0;
            if (_knockback != 0) {
                var _knockbackDirection = point_direction(x, y, _source.x, _source.y);
                xTo = x - lengthdir_x(_knockback, _knockbackDirection);
                yTo = y - lengthdir_y(_knockback, _knockbackDirection);
            }
        }
    }
}

