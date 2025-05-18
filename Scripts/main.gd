extends Node3D

##Rotation
@onready var xangle = $"Control Panel/GridContainer/Rotation Container/x-angle"
@onready var yangle = $"Control Panel/GridContainer/Rotation Container/y-angle"
@onready var zangle = $"Control Panel/GridContainer/Rotation Container/z-angle"

@onready var angleText = [$"Control Panel/GridContainer/Rotation Container/x-angle-text", $"Control Panel/GridContainer/Rotation Container/y-angle-text", $"Control Panel/GridContainer/Rotation Container/z-angle-text"]
@onready var stepText = $"Control Panel/GridContainer/Rotation Container/step-text"
@onready var angleStep = $"Control Panel/GridContainer/Rotation Container/step"

##Scale
@onready var xscale = $"Control Panel/GridContainer/Rotation Container/x-angle"
@onready var yscale = $"Control Panel/GridContainer/Rotation Container/y-angle"
@onready var zscale = $"Control Panel/GridContainer/Rotation Container/z-angle"

@onready var scaleText = [$"Control Panel/GridContainer/Scale Container/x-scale-text", $"Control Panel/GridContainer/Scale Container/y-scale-text", $"Control Panel/GridContainer/Scale Container/z-scale-text"]

@onready var zoomText = $"Control Panel/GridContainer/Scale Container2/zoom-text"
@onready var cam = $Camera3D

@onready var box = $Cube

@onready var animations = $AnimationPlayer

var hidden = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#print(box.rotation_degrees.x)
	#print(box.get("rotation"))

##Rotation
func _on_angle_value_changed(value: float, index: int) -> void:
	box.rotation_degrees[index] = value
	angleText[index].text = str(value) + "°"

func _on_angle_step_value_changed(value: float) -> void:
	if value > 0:
		xangle.step = value
		yangle.step = value
		zangle.step = value
		stepText.text = str(value)
	else:
		xangle.step = 1
		yangle.step = 1
		zangle.step = 1
		stepText.text = str(1)

##Scale
func _on_scale_value_changed(value: float, index: int) -> void:
	box.scale[index] = value
	scaleText[index].text = str(value) + "x"

##MISC
func _on_zoom_value_changed(value: float) -> void:
	zoomText.text = str(5/value) + "x"
	cam.position.z = value

func _on_reset_pressed() -> void:
	get_tree().reload_current_scene()
	


func _on_remove_pressed() -> void:
	print(hidden)
	if hidden:
		animations.play("remove", -1, -1, hidden)
	else:
		animations.play("remove")
	hidden = not hidden
