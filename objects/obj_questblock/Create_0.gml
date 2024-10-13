#region quest properties
	containedQuest = new quest("Very epic quest", "Here are some fellas", QUESTTYPE.MAIN, 
		[new questStep("Meet the fellas"), 
		new questStep("Slay the fellas"),
		new questStep("collect de cash"),]
	);
	deletionProgress = 0;
	deletionProgressMax = 100;
#endregion

#region window_properties
	window = new windowProperties();
	obtainedMousePosition = false;
	obtainedMousePositionDrag = false;
	obtainedCurrentWindow = false;
	isDraggingWindowPosition = false;
	isDraggingWindowHeightBottom = false;
	isDraggingWindowWidthRight = false;
	isOnTop = false;
	firstplace = false
#endregion

#region shader properties
	shader_Base = new color(171, 81, 48);
	shader_SoftLight = new color(shader_Base.R + 36, shader_Base.G + 36, shader_Base.B -5);
	shader_HardLight = new color(shader_Base.R + 69, shader_Base.G + 100, shader_Base.B + 27);
	shader_Shadow = new color(shader_Base.R -26, shader_Base.G -26, shader_Base.B +3);
	shader_Outline = new color(shader_Base.R - 138, shader_Base.G - 57, shader_Base.B - 21);
#endregion

function InitQuestBlock() {
	var questName = scribble("[f_main]" + containedQuest.name);
	window.minWidth = questName.get_width();
	window.minHeight = questName.get_height();
	
	var questDescription = scribble("[f_main]" + containedQuest.description);
	questDescription.wrap(250);
	window.minWidth += questDescription.get_width();
	window.minHeight += questDescription.get_height();
	
	window.minWidth += window.border * 2;
	window.minHeight += window.border * 2;
	
	window.minWidth += window.border * 2;
	window.minHeight += window.border * 5;

	
	window.minWidth = max(window.minWidth, 128);
	window.minHeight = max(window.minHeight, 128);
	
	window.width = window.minWidth;
	window.height = window.minHeight;
	
	with (obj_questblock_manage) {
		ds_list_add(blocks, other);	
	}
}

function isUnobstructed() {
	with(obj_questblock_manage) {
		for (var i = 0; i < ds_list_size(blocks); ++i) {
		    var _f = ds_list_find_value(blocks, i);
			if (_f == other) {
				return true	
			} else {
				with(_f) {
					if point_in_rectangle(mouse_x, mouse_y, x, y, x+window.width, y+window.height) {
						return false	
					}
				}
			}
		}
	}
}

function resetColor() {
	shader_Base = new color(171, 81, 48);
	shader_SoftLight = new color(shader_Base.R + 36, shader_Base.G + 36, shader_Base.B -5);
	shader_HardLight = new color(shader_Base.R + 69, shader_Base.G + 100, shader_Base.B + 27);
	shader_Shadow = new color(shader_Base.R -26, shader_Base.G -26, shader_Base.B +3);
	shader_Outline = new color(shader_Base.R - 138, shader_Base.G - 57, shader_Base.B - 21);
}	

function readjustColor() {
	shader_SoftLight = new color(shader_Base.R + 36, shader_Base.G + 36, shader_Base.B -5);
	shader_HardLight = new color(shader_Base.R + 69, shader_Base.G + 100, shader_Base.B + 27);
	shader_Shadow = new color(shader_Base.R -26, shader_Base.G -26, shader_Base.B +3);
	shader_Outline = new color(shader_Base.R - 138, shader_Base.G - 57, shader_Base.B - 21);
}

function isBeingHoveredOver() {
	if !isUnobstructed() {
		return false
	}
	if point_in_rectangle(mouse_x, mouse_y, x, y, x+window.width, y+window.height) {
		return true	
	}
	return false	
}

init = false;

image_alpha = 0;

anchorLeft = noone;
anchorRight = noone;
anchorTop = noone;
anchorBottom = noone;

enum QUESTSTEPSTATES {
	NEUTRAL,
	FAILED,
	INFO,
	COMPLETE
}

enum QUESTTYPE {
	MAIN,
	SIDE
}