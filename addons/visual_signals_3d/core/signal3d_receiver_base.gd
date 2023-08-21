@tool
@icon("res://addons/visual_signals_3d/icons/signal3d_receiver.svg")
extends Node3D

class_name Signal3DReceiverBase

var color : Color = Color.WHITE
var emitter_class : String

func _ready():
	if Engine.is_editor_hint():
		var box = Signal3DUtils.create_box_node(color)
		add_child(box)
