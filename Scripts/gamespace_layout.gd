extends HBoxContainer

@onready var content_panel = $ContentPanel

func _ready():
	_switch_tab("Workshop")

func _switch_tab(tab_name: String):
	for child in content_panel.get_children():
		child.visible = false
	content_panel.get_node(tab_name).visible = true
