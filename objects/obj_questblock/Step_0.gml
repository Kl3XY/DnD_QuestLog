if isDraggingWindowPosition || firstplace {
	isDraggingWindowWidthRight = false;
	isDraggingWindowHeightBottom = false;
	isDraggingWindowPosition = mouse_check_button(mb_left);
	var x_diff = obtainedMousePosition[0] - obtainedCurrentWindow[0]
	var y_diff = obtainedMousePosition[1] - obtainedCurrentWindow[1]
			
	x = mouse_x - x_diff;
	y = mouse_y - y_diff;
	
	with(obj_questblock_manage) {
		setBlockTop(other);
	}
	if mouse_check_button_pressed(mb_left) {
		firstplace = false	
	}
}	

if isBeingHoveredOver() {
	with(obj_dropdown_ui) {
		if isGettingCreated == true {
			var cqb = new dropDownOption();
			cqb.name = "Copy..."
			cqb.shortcut = [vk_control, ord("C")]
			cqb.shortcut_description = "CTRL+C"

			ds_list_add(DropDownOptions, cqb)	
			
			var cqb = new dropDownOption();
			cqb.name = "Delete..."
			cqb.shortcut = [vk_control, ord("C")]
			cqb.arguments = other;
			cqb.shortcut_description = "CTRL+C"
			cqb.func = function(inst) {
				instance_destroy(inst);	
			}

			ds_list_add(DropDownOptions, cqb)	
			
			var cqb = new dropDownOption();
			cqb.name = "Edit..."
			cqb.shortcut = [vk_control, ord("C")]
			cqb.shortcut_description = "CTRL+C"

			ds_list_add(DropDownOptions, cqb)	
		}
	}
}

if isDraggingWindowHeightBottom {
	isDraggingWindowHeightBottom = mouse_check_button(mb_left);
	var diff = obtainedMousePositionDrag[1] - mouse_y;
	
	if (window.height - diff > window.minHeight) {
		window.height -= diff;
	}
	
	with(obj_questblock_manage) {
		setBlockTop(other);
	}
}	

if isDraggingWindowWidthRight {
	isDraggingWindowWidthRight = mouse_check_button(mb_left);
	var diff = obtainedMousePositionDrag[0] - mouse_x;
	
	if (window.width - diff > window.minWidth) {
		window.width -= diff;
	}
	
	with(obj_questblock_manage) {
		setBlockTop(other);
	}
}	

deletionProgress--;
deletionProgress = clamp(deletionProgress, 0, 100)

if deletionProgress == deletionProgressMax {
	instance_destroy();	
}

obtainedMousePositionDrag = [mouse_x, mouse_y];
isOnTop = obj_questblock_manage.isBlockOnTop(self);


var redSwitch = keyboard_check(ord("Z")) - keyboard_check(ord("U"));
var greenSwitch = keyboard_check(ord("H")) - keyboard_check(ord("J"));
var blueSwitch = keyboard_check(ord("N")) - keyboard_check(ord("M"));

