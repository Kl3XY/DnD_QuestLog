blackout_alpha = lerp(blackout_alpha, blackout_alphaTo, 0.2);


if isInputingName = false and isInputingDescription = false {
	if keyboard_check_pressed(vk_tab) {
		isInputingName = true;
		keyboard_string = "";
		alarm[0] = 5;
	}	
}

if isInputingName = true {
	name = keyboard_string;
	if keyboard_check_pressed(vk_tab) && alarm[0] == -1 {
		isInputingName = false;
		isInputingDescription = true;
		keyboard_string = "";
	}
}

if isInputingDescription = true {
	desc = keyboard_string;
	if keyboard_check_pressed(vk_enter) {
		var newquest = new quest(name, desc, QUESTTYPE.MAIN)
		w = instance_create_depth(mouse_x, mouse_y, depth, obj_questblock);
		with w {
			containedQuest = newquest;
			firstplace = true;
			obtainedMousePosition = [mouse_x, mouse_y];
			obtainedCurrentWindow = [x, y]
		}
		instance_destroy();
	}
}