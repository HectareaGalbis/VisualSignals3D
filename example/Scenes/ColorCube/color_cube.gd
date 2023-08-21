@tool
extends Node3D

@export var start_on : bool = false
@export var color_off : Color = Color.RED
@export var color_on : Color = Color.GREEN

func _ready():
	if Engine.is_editor_hint():
		$Cube.mesh.material.albedo_color = color_on if start_on else color_off

func _on_change_color_receive_signal(arg : bool):
	$Cube.mesh.material.albedo_color = color_on if arg else color_off
