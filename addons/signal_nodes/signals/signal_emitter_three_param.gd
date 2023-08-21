@tool
extends SignalEmitterBase

class_name SignalEmitterThreeParam

signal emit_signal(arg1, arg2, arg3)

func _init():
	color = Color(0.2,0.2,0.2)

func _connect(receiver_node : SignalReceiverThreeParam):
	emit_signal.connect(func(arg1, arg2, arg3): receiver_node.receive_signal.emit(arg1, arg2, arg3))
	

func emit(arg1, arg2, arg3):
	emit_signal.emit(arg1, arg2, arg3)
