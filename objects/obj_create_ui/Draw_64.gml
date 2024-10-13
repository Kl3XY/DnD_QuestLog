var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

draw_set_alpha(blackout_alpha);
draw_rectangle_color(0, 0, 2000, 2000, c_black, c_black, c_black, c_black, false)
draw_set_alpha(1);

var title = scribble("[scale, 1][f_title]Create new quest");
title.draw(100, 50);


draw_rectangle_color(100, 150, 450, 200, c_white, c_white, c_white, c_white, false);
if (isInputingName) draw_rectangle_color(100, 150, 450, 200, c_red, c_red, c_red, c_red, true);
var inputName = scribble("[scale, 1][c_black][f_main][fa_middle]" + name);
inputName.draw(125, 175)

if point_in_rectangle(mx, my, 100, 150, 450, 200) {
	if mouse_check_button_pressed(mb_left) {
		isInputingDescription = false;
		isInputingName = true;
		keyboard_string = "";
	}
}


draw_rectangle_color(100, 250, 450, 500, c_white, c_white, c_white, c_white, false);
if (isInputingDescription) draw_rectangle_color(100, 250, 450, 500, c_red, c_red, c_red, c_red, true);
var inputDesc = scribble("[scale, 1][c_black][f_main][fa_top]" + desc);
inputDesc.wrap(325, 150)
inputDesc.draw(125, 275)

if point_in_rectangle(mx, my, 100, 250, 450, 500) {
	if mouse_check_button_pressed(mb_left) {
		isInputingDescription = true;
		isInputingName = false;
		keyboard_string = "";
	}
}
