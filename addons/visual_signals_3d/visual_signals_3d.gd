@tool
extends EditorPlugin

var signal_emitter_inspector


func _enter_tree():
	signal_emitter_inspector = preload("res://addons/visual_signals_3d/core/signal3d_manager_inspector.gd").new()
	add_inspector_plugin(signal_emitter_inspector)


func _exit_tree():
	remove_inspector_plugin(signal_emitter_inspector)
