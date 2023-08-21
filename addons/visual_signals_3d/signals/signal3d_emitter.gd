@tool
extends Signal3DEmitterBase

class_name Signal3DEmitter


signal emit_signal

func _init():
	color = Color(1,1,1)

func _connect(receiver_node : Signal3DReceiver):
	emit_signal.connect(func(): receiver_node.receive_signal.emit())
	

func emit():
	emit_signal.emit()
