@tool
extends Signal3DEmitterBase

class_name Signal3DEmitterTwoParam

signal emit_signal(arg1, arg2)

func _init():
	color = Color(0.4,0.4,0.4)

func _connect(receiver_node : Signal3DReceiverTwoParam):
	emit_signal.connect(func(arg1, arg2): receiver_node.receive_signal.emit(arg1, arg2))
	

func emit(arg1, arg2):
	emit_signal.emit(arg1, arg2)
