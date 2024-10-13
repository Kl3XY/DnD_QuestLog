
var haxis = gamepad_axis_value(0, gp_axisrh);
var vaxis = gamepad_axis_value(0, gp_axisrv);

addDis = lerp(addDis, 0, 0.1);

if instance_exists(obj_create_ui) exit;

if mouse_check_button_pressed(mb_middle) {
	mouse_old = [mouse_x, mouse_y]
}
if mouse_check_button(mb_middle) {
	var x_diff = mouse_old[0] - mouse_x;
	var y_diff = mouse_old[1] - mouse_y;
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + x_diff, camera_get_view_y(view_camera[0]) + y_diff)
	mouse_old = [mouse_x, mouse_y]
}
surface_resize(application_surface, window_get_width(), window_get_height())
var mw = mouse_wheel_up() - mouse_wheel_down();
if (mw != 0) {
    // find difference between mouse and view's top-left corner (in GMS2, use camera_ functions instead of view_)
    var mx = mouse_x, my = mouse_y;
    var cx = (mx - camera_get_view_x(view_camera[0])) / zoom;
    var cy = (my - camera_get_view_y(view_camera[0])) / zoom;
    // adjust zoom:
    if (mw < 0) {
        zoom *= sqrt(2);
    } else zoom /= sqrt(2);
    // position view as per previously calculated difference at new zoom:
	camera_set_view_pos(view_camera[0], mx - cx * zoom, my - cy * zoom)
}
camera_set_view_size(camera, window_get_width() * zoom, window_get_height() * zoom)
camera_apply(camera)
view_set_camera(view_current, camera)