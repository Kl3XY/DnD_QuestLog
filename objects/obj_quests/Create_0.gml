quests = ds_list_create();

mouseScroll = 0;
mouseScrollMax = 0;
mouseScroolMin = 0;

function quest(quest_name, quest_description, step_array = []) constructor {
	name = quest_name;
	description = quest_description;
	steps = step_array;
}

enum QUESTSTEPSTATES {
	FAILED,
	NEUTRAL,
	FINISHED
}

function questStep(questStep_name, questStep_state = QUESTSTEPSTATES.NEUTRAL) constructor {
	name = questStep_name;
	state = questStep_state;
}


function addQuest(name, desc, step_array) {
	ds_list_add(quests, new quest(name, desc, step_array))
}

addQuest("Rumble in the Alleyways", "Defeat the Hooligans", [new questStep("Find the Hooligans", QUESTSTEPSTATES.NEUTRAL), new questStep("Fight em", QUESTSTEPSTATES.NEUTRAL), new questStep("Payday", QUESTSTEPSTATES.NEUTRAL)])
