var questTextSeperation = 0;
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

for (var i = 0; i < ds_list_size(quests); ++i) {
	var _f = ds_list_find_value(quests, i);
	
	var questname = scribble(_f.name);
		//Draw Quest Name
		questname.draw(15, 15+questTextSeperation+mouseScroll);
		
		var editQuestButtonX = 30+questname.get_width()+16
		var editQuestButtonY = 15+questTextSeperation+mouseScroll+questname.get_height()/2
			
		draw_sprite(spr_editButtons, 1, editQuestButtonX, editQuestButtonY)
		draw_sprite(spr_editButtons, 0, editQuestButtonX+32, editQuestButtonY)
		
		if (point_in_rectangle(mx, my, editQuestButtonX-16, editQuestButtonY-16, editQuestButtonX+16, editQuestButtonY+16)) {
			if mouse_check_button(mb_left) {
				var setQuestName = get_string("Enter a new name for the quest", _f.name)
				_f.name = setQuestName;
			}
		}
			
		if (point_in_rectangle(mx, my, editQuestButtonX+32-16, editQuestButtonY-16, editQuestButtonX+32+16, editQuestButtonY+16)) {
			if mouse_check_button(mb_left) {
				ds_list_delete(quests, i)
			}
		}
		
		questTextSeperation += questname.get_height();
	
	//Draw Quest Step Names
	for (var j = 0; j < array_length(_f.steps); ++j) {
		var _a = _f.steps[j]
		switch(_a.state) {
			case QUESTSTEPSTATES.NEUTRAL:
				var questStepName = scribble($"({j}) {_a.name}");
			break;
			case QUESTSTEPSTATES.FAILED:
				var questStepName = scribble($"[c_red](FAILED) {_a.name}");
			break;
			case QUESTSTEPSTATES.FINISHED:
				var questStepName = scribble($"[c_green]({j}) {_a.name}");
			break;
		}
	    
			questStepName.draw(30, 15+questTextSeperation+mouseScroll);
			
			if (point_in_rectangle(mx, my, 30, 15+questTextSeperation+mouseScroll, 30+questStepName.get_width(), 15+questTextSeperation+mouseScroll+questStepName.get_height())) {
				if mouse_check_button_pressed(mb_right) {
					_a.state++;
					if _a.state > 2 {
						_a.state = 0;	
					}
				}
			}
			
		var editStepButtonX = 30+questStepName.get_width()+16
		var editStepButtonY = 15+questTextSeperation+mouseScroll+questStepName.get_height()/2
			
		draw_sprite(spr_editButtons, 1, editStepButtonX, editStepButtonY)
		draw_sprite(spr_editButtons, 0, editStepButtonX+32, editStepButtonY)
			
		if (point_in_rectangle(mx, my, editStepButtonX-16, editStepButtonY-16, editStepButtonX+16, editStepButtonY+16)) {
			if mouse_check_button(mb_left) {
				var setQuestStep = get_string("Enter a new name for the quest step", _a.name)
				_a.name = setQuestStep;
			}
		}
			
		if (point_in_rectangle(mx, my, editStepButtonX+32-16, editStepButtonY-16, editStepButtonX+32+16, editStepButtonY+16)) {
			if mouse_check_button(mb_left) {
				array_delete(_f.steps, j, 1)
			}
		}
			
		questTextSeperation += questStepName.get_height();
	}
	
	var addQuestStepButton = scribble($"Add New Step");
		addQuestStepButton.draw(30, 15+questTextSeperation+mouseScroll);
		
		if (point_in_rectangle(mx, my, 30, 15+questTextSeperation+mouseScroll, 30+addQuestStepButton.get_width(), 15+addQuestStepButton.get_height()+questTextSeperation+mouseScroll)) {
			if mouse_check_button(mb_left) {
				var setQuestStep = get_string("Enter a name for the quest step", "defo")
				array_push(_f.steps, new questStep(setQuestStep))
			}
		}
		
	questTextSeperation += addQuestStepButton.get_height();
	questTextSeperation += 20;
}
var addQuestButton = scribble("Add Quest");
	//Draw Quest Add Button
	addQuestButton.draw(15, 15+questTextSeperation+mouseScroll);
	if (point_in_rectangle(mx, my, 15, 15+questTextSeperation+mouseScroll, 15+addQuestButton.get_width(), 15+addQuestButton.get_height()+questTextSeperation+mouseScroll)) {
		if mouse_check_button(mb_left) {
			var setQuestName = get_string("Enter a name for the new quest", "defo")
			var setQuestDescription = get_string("Enter a description for the new quest", "defo")
			addQuest(setQuestName, setQuestDescription)
		}
	}
	
	questTextSeperation += addQuestButton.get_height();
	
mouseScrollMax = (questTextSeperation + 30) - window_get_height();
