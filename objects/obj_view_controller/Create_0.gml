//camera = camera_create();
alpha = 1;
zoom = 1

//vm = matrix_build_lookat(x,y,-900,x,y,0,0,1,0);
//pm = matrix_build_projection_ortho(256,144,1,10000);

globalvar gameSpeed;
gameSpeed = 60;
//camera_set_view_mat(camera, vm);
//camera_set_proj_mat(camera, pm);
addDis = 0;
//view_camera[0] = camera;
//view_visible[0] = 1;

mouse_old = [mouse_x, mouse_y]


camera = camera_create();
camera_set_view_size(camera, browser_width * zoom, browser_height * zoom)