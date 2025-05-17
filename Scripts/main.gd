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

@onready var box = $Cube


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(box.rotation_degrees.x)
	print(box.get("rotation"))

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
func _on_reset_pressed() -> void:
	xangle.value = 0
	yangle.value = 0
	zangle.value = 0
	angleStep.value = 1
	
	xscale.value = 1
	yscale.value = 1
	zscale.value = 1
	
