extends Control
@onready var score_label: Label = $VBoxContainer/ScoreLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var exitButton: Button = $VBoxContainer/Exit

#const SPACE_SHOOTER = preload("res://Scenes/space_shooter.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_label.text = "Score : "+str(SS.get_score())
	if SS.IS_WEB:
		exitButton.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	#var game = SPACE_SHOOTER.instantiate()
	#get_parent().add_child(game)	
	get_parent().get_tree().change_scene_to_file("res://Scenes/space_shooter.tscn")


func _on_exit_button_down() -> void:
	animation_player.play("ExitButton")



func exit()-> void:
	get_tree().quit()
