for (var i = 0; i < ds_list_size(blocks); ++i) {
    var _f = ds_list_find_value(blocks, i);
	_f.depth = i * 20;
}