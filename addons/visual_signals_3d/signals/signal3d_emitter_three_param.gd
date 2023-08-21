@tool
extends Signal3DEmitterBase

class_name Signal3DEmitterThreeParam

signal emit_signal(arg1, arg2, arg3)

func _init():
	color = Color(0.2,0.2,0.2)

func _connect(receiver_node : Signal3DReceiverThreeParam):
	emit_signal.connect(func(arg1, arg2, arg3): receiver_node.receive_signal.emit(arg1, arg2, arg3))
	

func emit(arg1, arg2, arg3):
	emit_signal.emit(arg1, arg2, arg3)
