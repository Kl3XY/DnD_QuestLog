for (var i = 0; i < ds_list_size(DropDownOptions); ++i) {
    var _f = ds_list_find_value(DropDownOptions, i);
	draw_set_alpha(alpha/1.25)
	
	draw_rectangle_color(mx_start, my_start + i * 25, mx_start+400, my_start+25 + i * 25, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false)
	
	draw_set_alpha(1);
	
	var dropDownText = scribble("[fa_middle]" + _f.name);
	dropDownText.fit_to_box(350, 25);
	dropDownText.blend(c_white, alpha)
	dropDownText.draw(mx_start+15, my_start+12.5 + i * 25);
	
	if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), mx_start, my_start + i * 25, mx_start+400, my_start+25 + i * 25) 
	{
		if mouse_check_button_pressed(mb_left) {
			instance_destroy();
			_f.func(_f.arguments);
		}
	}
}

if !point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), mx_start, my_start, mx_start+400, my_start+25 + (ds_list_size(DropDownOptions)-1) * 25) 
{
	if mouse_check_button_pressed(mb_any) {
		instance_destroy();
	}
}