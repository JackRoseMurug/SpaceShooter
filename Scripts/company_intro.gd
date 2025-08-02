extends Control

@onready var animation_player: AnimationPlayer = $Company/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("Zoom")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_company_screen_timer_timeout() -> void:
	get_parent().get_tree().change_scene_to_file("res://Scenes/GameIntro.tscn")
