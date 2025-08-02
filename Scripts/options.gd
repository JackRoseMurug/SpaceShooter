extends Control

@onready var bgm_check_button: CheckButton = $VBoxContainer/HBoxContainer/BGM_CheckButton

@onready var sfx_check_button: CheckButton = $VBoxContainer/HBoxContainer2/SFX_CheckButton

@onready var vfx_check_button: CheckButton = $VBoxContainer/HBoxContainer3/VFX_CheckButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print("Option ready")
	bgm_check_button.button_pressed = SS.BGM_ENABLED
	sfx_check_button.button_pressed = SS.SFX_ENABLED
	vfx_check_button.button_pressed = SS.VFX_ENABLED


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_bgm_check_button_toggled(toggled_on: bool) -> void:
	#print("Toggled "+str(toggled_on))
	if !toggled_on:
		SS.BGM_ENABLED = false 
		SpaceBgm.stop()
	else:
		SS.BGM_ENABLED = true
		SpaceBgm.play()


func _on_sfx_check_button_toggled(toggled_on: bool) -> void:
	#print("Toggled "+str(toggled_on))
	if !toggled_on:
		SS.SFX_ENABLED = false
	else:
		SS.SFX_ENABLED = true


func _on_vfx_check_button_toggled(toggled_on: bool) -> void:
	print("Toggled "+str(toggled_on))
	if !toggled_on:
		SS.VFX_ENABLED = false
	else:
		SS.VFX_ENABLED = true


func _on_back_pressed() -> void:
	bgm_check_button.button_pressed = SS.BGM_ENABLED
	sfx_check_button.button_pressed = SS.SFX_ENABLED
	vfx_check_button.button_pressed = SS.VFX_ENABLED
	get_parent().get_tree().change_scene_to_file("res://Scenes/GameIntro.tscn")
