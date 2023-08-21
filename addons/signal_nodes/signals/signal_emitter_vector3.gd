@tool
extends SignalEmitterBase

class_name SignalEmitterVector3

signal emit_signal(arg : Vector3)

func _init():
	color = Color.GOLD

func _connect(receiver_node : SignalReceiverVector3):
	emit_signal.connect(func(arg : Vector3): receiver_node.receive_signal.emit(arg))
	

func emit(arg : Vector3):
	emit_signal.emit(arg)
