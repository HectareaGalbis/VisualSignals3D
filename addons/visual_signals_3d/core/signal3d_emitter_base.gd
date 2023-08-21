@tool
@icon("res://addons/visual_signals_3d/icons/signal3d_emitter.svg")
extends Node3D

class_name Signal3DEmitterBase

var color : Color = Color.WHITE

func _ready():
	if Engine.is_editor_hint():
		var sphere = Signal3DUtils.create_sphere_node(color)
		add_child(sphere)

func _connect(receiver_node):
	pass
