var mx = mouse_x;
var my = mouse_y;

if point_in_rectangle(mx, my, x, y, x+window.width, y+window.height) {
	if mouse_check_button(mb_left) && isUnobstructed() {
		with(obj_questblock_manage) {
			setBlockTop(other);
		}
		
		isOnTop = obj_questblock_manage.isBlockOnTop(self);
	} 
}





shader_set(sh_recolor)

var uni_Base = shader_get_uniform(sh_recolor, "c_cBase");
shader_set_uniform_f_array(uni_Base, shader_Base.convert().toArray());

var uni_SoftLight = shader_get_uniform(sh_recolor, "c_cSoftLight");
shader_set_uniform_f_array(uni_SoftLight, shader_SoftLight.convert().toArray());

var uni_HardLight = shader_get_uniform(sh_recolor, "c_cHardLight");
shader_set_uniform_f_array(uni_HardLight, shader_HardLight.convert().toArray());

var uni_Shadow = shader_get_uniform(sh_recolor, "c_cShadow");
shader_set_uniform_f_array(uni_Shadow, shader_Shadow.convert().toArray());

var uni_Outline = shader_get_uniform(sh_recolor, "c_cOutline");
shader_set_uniform_f_array(uni_Outline, shader_Outline.convert().toArray());

draw_sprite_stretched_ext(spr_mainquest_backdrop, 0, x, y, window.width, window.height, c_white, 1);
shader_reset()

draw_sprite_stretched(spr_mainquest_button, 0, x + window.border, y + window.height - window.border - 45, (window.width - window.border * 2) / 2, window.border * 4);
var deleteButton = scribble("[f_main][fa_middle][fa_center]Complete!")
deleteButton.draw(x + window.border + ((window.width - window.border * 2) / 2) / 2, y + window.height - window.border - 30)

draw_set_alpha(0.25);

draw_healthbar(x + window.border, y + window.height - window.border - 45, x + window.border +  (window.width - window.border * 2) / 2, y + window.height - window.border - 45 + window.border * 2, deletionProgress / deletionProgressMax * 100, c_white, c_white, c_white, 0, false, false)

draw_set_alpha(1);

if point_in_rectangle(mx, my, x + window.border, y + window.height - window.border - 45, x + window.border +  (window.width - window.border * 2) / 2, y + window.height - window.border - 45 + window.border * 2) {
	if mouse_check_button(mb_left) && isOnTop && !instance_exists(obj_create_ui) {
		deletionProgress += 2;
	} 
}

draw_sprite_stretched(spr_mainquest_button, 0, x + window.border + (window.width - window.border * 2) / 2, y + window.height - window.border -45, (window.width - window.border * 2) / 2, window.border * 4);
if point_in_rectangle(mx, my, x, y, x + window.width, y + window.border) {
	if mouse_check_button_pressed(mb_left) && isOnTop && !instance_exists(obj_create_ui) {
		isDraggingWindowPosition = true;
		obtainedMousePosition = [mouse_x, mouse_y];
		obtainedCurrentWindow = [x, y]
	}
}
if point_in_rectangle(mx, my, x, y + window.height - window.border, x + window.width, y + window.height) {
	if mouse_check_button_pressed(mb_left) && isOnTop && !instance_exists(obj_create_ui) {
		isDraggingWindowHeightBottom = true;
		obtainedMousePositionDrag = [mouse_x, mouse_y];
		obtainedCurrentWindow = [x, y]
	}
}
if point_in_rectangle(mx, my, x + window.width - window.border, y, x  + window.width, y + window.height) {
	if mouse_check_button_pressed(mb_left) && isOnTop && !instance_exists(obj_create_ui) {
		isDraggingWindowWidthRight = true;
		obtainedMousePositionDrag = [mouse_x, mouse_y];
		obtainedCurrentWindow = [x, y]
	}
}


var questName = scribble("[f_main]" + containedQuest.name)
questName.draw(x + window.border, y + window.border);

draw_set_alpha(0.25);

var questDescription = scribble("[f_main]" + containedQuest.description);

questDescription.wrap(window.width-50, window.height)

draw_rectangle_color(x + window.border, y + window.border * 2 + questName.get_height(), x + window.width - window.border, y + window.height - window.border - 60, c_dkgray, c_dkgray, c_dkgray, c_dkgray, false)

var x_start = x + window.border, y_start =  (y + window.border * 2 + questName.get_height()) + questDescription.get_height()

questDescription.draw(x + window.border*2, y + window.border * 2 + questName.get_height());

draw_set_alpha(1);

if (anchorRight != noone) {
	draw_line_width_color(	x + window.width, y + window.height / 2, 
							anchorRight.x + anchorRight.window.width, anchorRight.y + anchorRight.window.height / 2, 2.5, c_red, c_red);
}	

if (anchorLeft != noone) {
	draw_line_width_color(	x, y +window.height / 2, 
							anchorLeft.x, anchorLeft.y + anchorLeft.window.height / 2, 2.5, c_red, c_red);
}	

var anchor_Top = new vector(x + window.width / 2, y);
var anchor_Bottom = new vector(x + window.width / 2, y + window.height);
var anchor_Left = new vector(x, y + window.height / 2);
var anchor_Right = new vector(x + window.width, y + window.height / 2);

if (obj_questblock_manage.isSelectingAnchor == self) {
	var obj = obj_questblock_manage.isSelectingAnchor_side
	switch(obj) {
		case sides.top:
			draw_line_width_color(anchor_Top.x, anchor_Top.y, mouse_x, mouse_y, 2.5, c_red, c_red)
		break;
		case sides.bottom:
			draw_line_width_color(anchor_Bottom.x, anchor_Bottom.y, mouse_x, mouse_y, 2.5, c_red, c_red)
		break;
		case sides.left:
			draw_line_width_color(anchor_Left.x, anchor_Left.y, mouse_x, mouse_y, 2.5, c_red, c_red)
		break;
		case sides.right:
			draw_line_width_color(anchor_Right.x, anchor_Right.y, mouse_x, mouse_y, 2.5, c_red, c_red)
		break;
	}
}


if mouse_check_button_pressed(mb_right) {
	obj_questblock_manage.isSelectingAnchor = noone;	
}

if point_distance(mouse_x, mouse_y, anchor_Right.x, anchor_Right.y) < 50 {
	draw_circle(anchor_Right.x, anchor_Right.y,5,true)
	if point_in_circle(mx, my, anchor_Right.x, anchor_Right.y,5) {
		draw_circle_color(anchor_Right.x, anchor_Right.y,4, c_red, c_red, false)
		if mouse_check_button_pressed(mb_left) {
			if (obj_questblock_manage.isSelectingAnchor == noone) {
				obj_questblock_manage.isSelectingAnchor = self;
				obj_questblock_manage.isSelectingAnchor_side = sides.right;
			}
		}
	}
}

if point_distance(mouse_x, mouse_y, anchor_Left.x, anchor_Left.y) < 50 {
	draw_circle(anchor_Left.x, anchor_Left.y,5,true)
	if point_in_circle(mx, my, anchor_Left.x, anchor_Left.y,5) {
		draw_circle_color(anchor_Left.x, anchor_Left.y,4, c_red, c_red, false)
		if mouse_check_button_pressed(mb_left) {
			if (obj_questblock_manage.isSelectingAnchor == noone) {
				obj_questblock_manage.isSelectingAnchor = self;
				obj_questblock_manage.isSelectingAnchor_side = sides.left;
			}
		}
	}
}

if point_distance(mouse_x, mouse_y, anchor_Top.x, anchor_Top.y) < 50 {
	draw_circle(anchor_Top.x, anchor_Top.y, 5,true)
	if point_in_circle(mx, my, anchor_Top.x, anchor_Top.y,5) {
		draw_circle_color(anchor_Top.x, anchor_Top.y,4, c_red, c_red, false)
		if mouse_check_button_pressed(mb_left) {
			if (obj_questblock_manage.isSelectingAnchor == noone) {
				obj_questblock_manage.isSelectingAnchor = self;
				obj_questblock_manage.isSelectingAnchor_side = sides.top;
			}
		}
	}
}

if point_distance(mouse_x, mouse_y, anchor_Bottom.x, anchor_Bottom.y) < 50 {
	draw_circle(anchor_Bottom.x, anchor_Bottom.y,5,true)
	if point_in_circle(mx, my, anchor_Bottom.x, anchor_Bottom.y,5) {
		draw_circle_color(anchor_Bottom.x, anchor_Bottom.y,4, c_red, c_red, false)
		if mouse_check_button_pressed(mb_left) {
			if (obj_questblock_manage.isSelectingAnchor == noone) {
				obj_questblock_manage.isSelectingAnchor = self;
				obj_questblock_manage.isSelectingAnchor_side = sides.bottom;
			}
		}
	}
}