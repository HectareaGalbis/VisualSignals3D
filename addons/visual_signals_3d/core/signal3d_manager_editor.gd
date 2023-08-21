extends HBoxContainer

var label = Label.new()
var option_button = OptionButton.new()

var emitter_node_dictionary : Dictionary = {}
var emitter_nodes : Array = []
var signal_receiver : Signal3DReceiverBase = null
var popup_opened : bool = false


func _init(_signal_receiver):
	signal_receiver = _signal_receiver
	add_child(label)
	label.size_flags_horizontal = Control.SIZE_EXPAND
	label.text = signal_receiver.name
	add_child(option_button)
	option_button.size_flags_horizontal = Control.SIZE_EXPAND
	option_button.item_selected.connect(_on_item_selected)
	_populate_option_button()
	_select_right_option()

func _process(delta):
	var manager = Signal3DUtils.get_signal_manager(signal_receiver)
	if manager:
		if option_button.get_popup().visible:
			var focused_item_index = option_button.get_popup().get_focused_item()
			if focused_item_index > -1 and focused_item_index != option_button.selected:
				if focused_item_index > 0:
					var emitter_node = emitter_nodes[option_button.get_item_id(focused_item_index)]
					manager.set_draw_preview_line(true, emitter_node, signal_receiver)
				else:
					manager.set_draw_preview_line(true, null, signal_receiver)
			else:
				manager.set_draw_preview_line(false, null, null)
		else:
			manager.set_draw_preview_line(false, null, null)

static func _get_owner_path(node : Node):
	var path : String = node.owner.name
	var next_owner = node.owner.owner
	while next_owner and next_owner.owner:
		path = next_owner.name + "/" + path
		next_owner = next_owner.owner
	return path

func _populate_option_button():
	var root = signal_receiver.get_tree().edited_scene_root
	emitter_nodes = root.find_children("*",signal_receiver.emitter_class)
	var next_id = 0
	for emitter_node in emitter_nodes:
		if emitter_node.owner != root and emitter_node.owner != signal_receiver.owner:
			var owner_path = _get_owner_path(emitter_node) 
			#var owner_path = emitter_node.owner.get_name()
			print(owner_path)
			if emitter_node_dictionary.has(owner_path):
				emitter_node_dictionary[owner_path].push_back([next_id,emitter_node])
			else:
				emitter_node_dictionary[owner_path] = [[next_id,emitter_node]]
			next_id += 1
	option_button.add_item("None",emitter_nodes.size())
	for parent_node_name in emitter_node_dictionary:
		option_button.add_separator(parent_node_name)
		for emitter_node_arr in emitter_node_dictionary[parent_node_name]:
			option_button.add_item(emitter_node_arr[1].get_name(),emitter_node_arr[0])

func _on_item_selected(index):
	if !Signal3DUtils.is_this_my_scene(signal_receiver.owner):
		return
	var manager = Signal3DUtils.ensure_signal_manager(signal_receiver)
	if manager:
		var signal_emitter = manager.find_signal_emitter(signal_receiver)
		if signal_emitter:
			manager.remove_link(signal_emitter,signal_receiver)
		var id = option_button.get_item_id(index)
		if id < emitter_nodes.size():
			signal_emitter = emitter_nodes[id]
			manager.add_or_update_link(signal_emitter,signal_receiver)

func _select_right_option():
	if !Signal3DUtils.is_this_my_scene(signal_receiver.owner):
		return
	var manager = Signal3DUtils.ensure_signal_manager(signal_receiver)
	if manager:
		var new_value = manager.find_signal_emitter(signal_receiver)
		if !new_value:
			option_button.select(option_button.get_item_index(emitter_nodes.size()))
		else:
			var id = emitter_nodes.find(new_value)
			if (id != -1):
				var index = option_button.get_item_index(id)
				option_button.select(index)
			else:
				option_button.select(option_button.get_item_index(emitter_nodes.size()))
