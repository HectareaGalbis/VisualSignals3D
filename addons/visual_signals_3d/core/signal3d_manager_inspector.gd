extends EditorInspectorPlugin

var signal_manager_editor_res = preload("res://addons/visual_signals_3d/core/signal3d_manager_editor.gd")


static func _find_child_receivers(node : Node, root : Node):
	var receivers : Array[Signal3DReceiverBase] = []
	var children = node.get_children()
	for child in children:
		if child.owner == root:
			if child is Signal3DReceiverBase:
				receivers.push_back(child)
			receivers.append_array(_find_child_receivers(child, root))
	return receivers


func _can_handle(object):
	var is_its_scene = Signal3DUtils.is_this_my_scene(object as Node) # not sure this is needed
	var has_receivers = !_find_child_receivers(object , object).is_empty()
	return is_its_scene and has_receivers


func _parse_begin(object):
	var root_node = object as Node
	var signal_receivers = _find_child_receivers(root_node, root_node)
	for signal_receiver in signal_receivers:
		if signal_receiver.owner == object:
			var signal_manager_editor = signal_manager_editor_res.new(signal_receiver)
			add_custom_control(signal_manager_editor)
