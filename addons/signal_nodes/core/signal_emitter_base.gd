@tool
@icon("res://addons/signal_nodes/icons/signal_emitter.svg")
extends Node3D

class_name SignalEmitterBase

var color : Color = Color.WHITE

func _ready():
	if Engine.is_editor_hint():
		var sphere = SignalNodesHelper.create_sphere_node(color)
		add_child(sphere)

func _connect(receiver_node):
	pass
