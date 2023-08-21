@tool
extends EditorPlugin

var signal_emitter_inspector


func _enter_tree():
	signal_emitter_inspector = preload("res://addons/signal_nodes/core/signal_manager_inspector.gd").new()
	add_inspector_plugin(signal_emitter_inspector)


func _exit_tree():
	remove_inspector_plugin(signal_emitter_inspector)
