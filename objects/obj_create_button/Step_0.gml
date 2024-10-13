if mouseIsHoveringOver() {
	tooltiptimer--;
	if mouse_check_button_pressed(mb_left) {
		if !instance_exists(obj_create_ui) {
			instance_create_depth(x, y, depth, obj_create_ui)
		}
		tooltiptimer = 500;
	}
} else {
	tooltiptimer = 100;	
}
