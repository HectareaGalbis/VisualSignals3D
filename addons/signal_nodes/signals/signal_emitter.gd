@tool
extends SignalEmitterBase

class_name SignalEmitter


signal emit_signal

func _init():
	color = Color(1,1,1)

func _connect(receiver_node : SignalReceiver):
	emit_signal.connect(func(): receiver_node.receive_signal.emit())
	

func emit():
	emit_signal.emit()
