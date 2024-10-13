DropDownOptions = ds_list_create();

function dropDownOption() constructor {
	//Dropdown Option Name
	name = "";
	
	//Shortcut, Array of inputs: [vk_shift, ord("V")]
	shortcut = [];
	
	//Shortcut Description
	shortcut_description = "";

	//The function that gets executed (noone if none.)
	func = noone;
	
	//Arguments for the function!
	arguments = noone;
}

var createNewFunction = new dropDownOption();
createNewFunction.name = "Create New..."
createNewFunction.shortcut = [vk_shift, ord("N")]
createNewFunction.shortcut_description = "Shift+N"
createNewFunction.func = function() {
	if !instance_exists(obj_create_ui) {
		instance_create_depth(x, y, depth, obj_create_ui)
	}
}

ds_list_add(DropDownOptions, createNewFunction)


#region mouse variables
	mx_start = device_mouse_x_to_gui(0);
	my_start = device_mouse_y_to_gui(0);
#endregion

#region control variables
	isGettingCreated = true;
#endregion

#region visual
	alpha = 0;
	alphaTo = 1;
#endregion