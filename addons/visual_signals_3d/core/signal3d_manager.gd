@tool
extends Node

class_name Signal3DManager

@export var signal_dict : Dictionary


var lines : MeshInstance3D
var white_material : ORMMaterial3D
var red_material : ORMMaterial3D
var green_material : ORMMaterial3D
var draw_preview_line : bool = false
var preview_start : Node3D
var preview_end : Node3D

func _ready():
	if not Engine.is_editor_hint():
		for path_to_emitter in signal_dict:
			var emitter_node = get_node_or_null(path_to_emitter)
			if emitter_node:
				for path_to_receiver in signal_dict[path_to_emitter]:
					var receiver_node = get_node_or_null(NodePath(path_to_receiver))
					if receiver_node:
						emitter_node._connect(receiver_node)

func _process(delta):
	if Engine.is_editor_hint():
		_update_lines()


func add_or_update_link(emitter_node : Node3D, receiver_node : Node3D):
	var path_to_emitter = StringName(get_path_to(emitter_node))
	var path_to_receiver = StringName(get_path_to(receiver_node))
	if signal_dict.has(path_to_emitter):
		if !signal_dict[path_to_emitter].has(path_to_receiver):
			signal_dict[path_to_emitter].push_back(path_to_receiver)
	else:
		signal_dict[path_to_emitter] = [path_to_receiver]

func remove_link(emitter_node : Node3D, receiver_node : Node3D):
	var path_to_emitter = StringName(get_path_to(emitter_node))
	var path_to_receiver = StringName(get_path_to(receiver_node))
	if signal_dict.has(path_to_emitter) and signal_dict[path_to_emitter].has(path_to_receiver):
		signal_dict[path_to_emitter].erase(path_to_receiver)
		if signal_dict[path_to_emitter].is_empty():
			signal_dict.erase(path_to_emitter)

func remove_receiver(receiver_node):
	var path_to_receiver = StringName(get_path_to(receiver_node))
	for path_to_emitter in signal_dict:
		if signal_dict[path_to_emitter].has(path_to_receiver):
			signal_dict[path_to_emitter].erase(path_to_receiver)
			return
	
func remove_emitter(emitter_node):
	var path_to_emitter = StringName(get_path_to(emitter_node))
	if signal_dict.has(path_to_emitter):
		signal_dict.erase(path_to_emitter)

func find_signal_emitter(receiver_node):
	var path_to_receiver = StringName(get_path_to(receiver_node))
	for path_to_emitter in signal_dict:
		if signal_dict[path_to_emitter].has(path_to_receiver):
			return get_node_or_null(NodePath(path_to_emitter))
	return null

func set_draw_preview_line(draw_preview : bool, emitter_node : Node3D, receiver_node : Node3D):
	draw_preview_line = draw_preview
	preview_start = emitter_node
	preview_end = receiver_node

func _update_lines():
	if not lines:
		lines = Signal3DUtils.create_line_node()
		white_material = Signal3DUtils.create_color_material(Color.WHITE)
		red_material = Signal3DUtils.create_color_material(Color.RED)
		green_material = Signal3DUtils.create_color_material(Color.GREEN)
		add_child(lines)
	if Signal3DUtils.is_this_my_scene(self):
		_remove_invalid_nodes()
	_update_position_of_lines()

func _remove_invalid_nodes():
	for signal_emitter_path in signal_dict:
		var signal_emitter_node = get_node_or_null(signal_emitter_path)
		if signal_emitter_node:
			for signal_receiver_node_path in signal_dict[signal_emitter_path]:
				var signal_receiver_node = get_node_or_null(NodePath(signal_receiver_node_path))
				if not signal_receiver_node:
					signal_dict[signal_emitter_path].erase(signal_receiver_node_path)
					if signal_dict[signal_emitter_path].is_empty():
						signal_dict.erase(signal_emitter_path)
		else:
			signal_dict.erase(signal_emitter_path)


func _update_position_of_lines():
	lines.mesh.clear_surfaces()
	if not signal_dict.is_empty() or draw_preview_line:
		for signal_emitter_path in signal_dict:
			var signal_emitter_node = get_node_or_null(signal_emitter_path)
			if signal_emitter_node:
				var preview_end_inside = draw_preview_line and signal_dict[signal_emitter_path].has(StringName(get_path_to(preview_end)))
				for signal_receiver_node_path in signal_dict[signal_emitter_path]:
					var signal_receiver_node = get_node_or_null(NodePath(signal_receiver_node_path))
					if signal_receiver_node:
						if draw_preview_line and preview_end_inside and signal_receiver_node == preview_end:
							lines.mesh.surface_begin(Mesh.PRIMITIVE_LINES, red_material)
							lines.mesh.surface_add_vertex(signal_emitter_node.global_position-lines.global_position)
							lines.mesh.surface_add_vertex(signal_receiver_node.global_position-lines.global_position)
							lines.mesh.surface_end()
						else:
							lines.mesh.surface_begin(Mesh.PRIMITIVE_LINES, white_material)
							lines.mesh.surface_add_vertex(signal_emitter_node.global_position-lines.global_position)
							lines.mesh.surface_add_vertex(signal_receiver_node.global_position-lines.global_position)
							lines.mesh.surface_end()
		if draw_preview_line and preview_start and preview_end:
			lines.mesh.surface_begin(Mesh.PRIMITIVE_LINES, green_material)
			lines.mesh.surface_add_vertex(preview_start.global_position-lines.global_position)
			lines.mesh.surface_add_vertex(preview_end.global_position-lines.global_position)
			lines.mesh.surface_end()


