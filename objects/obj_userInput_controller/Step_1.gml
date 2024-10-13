if mouse_check_button_pressed(mb_right) && obj_questblock_manage.isSelectingAnchor = noone {
	instance_destroy(obj_dropdown_ui);
	instance_create_depth(mouse_x, mouse_y, 0, obj_dropdown_ui)
}
if keyboard_check(vk_control) {
	if keyboard_check_pressed(ord("N")) {
		if !instance_exists(obj_create_ui) {
			instance_create_depth(mouse_x, mouse_y, 0, obj_create_ui)
		}
	}
}