var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if !instance_exists(obj_create_ui) {
	draw_sprite_ext(spr_createbutton, 0, 50, 50, 3, 3, 0, c_white, 1);
}
if point_in_rectangle(mx, my, 50, 50, 50 + sprite_get_width(spr_createbutton) * 3, 50 + sprite_get_height(spr_createbutton) * 3) {
	toolTipTimerCreate--;
	if mouse_check_button_pressed(mb_left) {
		if !instance_exists(obj_create_ui) {
			instance_create_depth(x, y, depth, obj_create_ui)
		}
		toolTipTimerCreate = 500;
	} 
}

if toolTipTimerCreate < 0 {
	var dropDownText = scribble("[fa_middle]Creates a new quest and places it at your cursor.");
	
	draw_set_alpha(0.8)
	
	draw_rectangle_color(mx, my, mx+dropDownText.get_width() + 15, my+dropDownText.get_height() + 15, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false)
	
	draw_set_alpha(1);
	
	dropDownText.blend(c_white, 1)
	dropDownText.draw(mx+15, my+15);
}	