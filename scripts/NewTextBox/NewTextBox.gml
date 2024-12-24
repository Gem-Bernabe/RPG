
function NewTextBox(){
	var _obj;
	if (instance_exists(oText)){
		_obj = oTextQueued;
	}else{
		_obj = oText;
	}
	with (instance_create_layer(0,0,"Instances",_obj)) {
		message = argument[0];
		audio_play_sound(mText,8,false);
		if (instance_exists(other)) {
			originInstance = other.id
		}else{
			originInstance = noone;
		}
		if (argument_count > 1) {
			background = argument[1];
		}else{
			background = 1;
		}
		if (argument_count > 2) {
			responses = [];
			array_copy(responses,0,argument[2],0,array_length_1d(argument[2]));
			for (var i = 0; i < array_length(responses); i++) {
				var _makertPosition = string_pos(":",responses[i]);
				responseScripts[i] = string_copy(responses[i],1,_makertPosition-1);
				responseScripts[i] = real(responseScripts[i]);
				responses[i] = string_delete(responses[i],1,_makertPosition);
				breakpoint = 10;
			}
		}else{
			responses = [-1];
			responseScripts = [-1];
		}
		if (argument_count > 3) {
			responses = [];
			array_copy(responses,0,argument[3],0,array_length(argument[3]));
		}
		if (argument_count > 4) {
			responseSrcipts = [];
			array_copy(responseScripts,0,argument[4],0,array_length(argument[4]));
		}
	}
	with (oPlayer) {
		if (state != PlayerStateLocked){
			lastState = state;
			state = PlayerStateLocked;
		}
	}

}