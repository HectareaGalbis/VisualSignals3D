extends Node

class_name Signal3DUtils

static func is_this_my_scene(node : Node) -> bool:
	if node:
		var root_node = node.get_tree().edited_scene_root
		return root_node == node.owner
	return false


static func ensure_signal_manager(node : Node) -> Signal3DManager:
	var root_node = node.get_tree().edited_scene_root
	var children_list = root_node.get_children(true)
	var manager = null
	for child in children_list:
		if child is Signal3DManager:
			manager = child
	if not manager:
		manager = Signal3DManager.new()
		manager.name = "_Signal3DManager(not touch)"
		root_node.add_child(manager)
		manager.set_owner(root_node)
	return manager


static func get_signal_manager(node : Node) -> Signal3DManager:
	var root_node = node.get_tree().edited_scene_root
	var children_list = root_node.get_children(true)
	var manager = null
	for child in children_list:
		if child is Signal3DManager:
			manager = child
	return manager


static func create_sphere_node(color : Color):
	var material = ORMMaterial3D.new()
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = color
	
	var sphere_mesh = SphereMesh.new()
	sphere_mesh.radius = 0.1
	sphere_mesh.height = sphere_mesh.radius*2
	sphere_mesh.material = material
	
	var sphere = MeshInstance3D.new()
	sphere.mesh = sphere_mesh
	sphere.cast_shadow = false
	
	return sphere


static func create_box_node(color : Color):
	var material = ORMMaterial3D.new()
	material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	material.albedo_color = color
	
	var box_mesh = BoxMesh.new()
	box_mesh.size = Vector3(0.13,0.13,0.13)
	box_mesh.material = material
	
	var box = MeshInstance3D.new()
	box.mesh = box_mesh
	box.cast_shadow = false
	
	return box


static func create_line_node():	
	var line_node = MeshInstance3D.new()
	line_node.mesh = ImmediateMesh.new()
	line_node.cast_shadow = false
	
	return line_node


static func create_color_material(color : Color):
	var color_material = ORMMaterial3D.new()
	color_material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	color_material.albedo_color = color
	
	return color_material
