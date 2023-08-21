@tool
@icon("res://addons/signal_nodes/icons/signal_receiver.svg")
extends Node3D

class_name SignalReceiverBase

var color : Color = Color.WHITE
var emitter_class : String

func _ready():
	if Engine.is_editor_hint():
		var box = SignalNodesHelper.create_box_node(color)
		add_child(box)
