blocks = ds_list_create();

enum sides {
	top,
	bottom,
	right,
	left
}

isSelectingAnchor = noone;
isSelectingAnchor_side = sides.top;

function setBlockTop(block) {
	var _f_index = ds_list_find_index(blocks, block);
	var _f = ds_list_find_value(blocks, _f_index);
	ds_list_delete(blocks, _f_index);
	ds_list_insert(blocks, 0, _f);
}

function isBlockOnTop(block) {
	var _f_index = ds_list_find_index(blocks, block);
	var _f = ds_list_find_value(blocks, _f_index);
	if _f_index == 0 {
		return true;	
	} else {
		return false;	
	}
}