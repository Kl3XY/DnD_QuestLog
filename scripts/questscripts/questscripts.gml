function quest(quest_name, quest_description, quest_type, step_array = []) constructor {
	name = quest_name;
	questtype = quest_type
	description = quest_description;
	steps = step_array;
}

function questStep(questStep_name, questStep_state = QUESTSTEPSTATES.NEUTRAL) constructor {
	name = questStep_name;
	state = questStep_state;
}


function addQuest(name, desc, step_array) {
	ds_list_add(quests, new quest(name, desc, step_array))
}