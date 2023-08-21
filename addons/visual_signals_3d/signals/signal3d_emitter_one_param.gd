@tool
extends Signal3DEmitterBase

class_name Signal3DEmitterOneParam

signal emit_signal(arg)

func _init():
	color = Color(0.6,0.6,0.6)

func _connect(receiver_node : Signal3DReceiverOneParam):
	emit_signal.connect(func(arg): receiver_node.receive_signal.emit(arg))
	

func emit(arg):
	emit_signal.emit(arg)
