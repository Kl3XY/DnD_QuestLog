/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if tooltiptimer < 0 {
	var dropDownText = scribble("[fa_middle]Creates a new quest and places it at your cursor.");
	
	draw_set_alpha(0.8)
	
	draw_rectangle_color(mx, my, mx+dropDownText.get_width() + 15, my+dropDownText.get_height() + 15, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false)
	
	draw_set_alpha(1);
	
	dropDownText.blend(c_white, 1)
	dropDownText.draw(mx+15, my+15);
}