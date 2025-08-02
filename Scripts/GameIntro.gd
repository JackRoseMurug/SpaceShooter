extends Control

const SPACE_SHOOTER = preload("res://Scenes/space_shooter.tscn")

func _ready() -> void:
	pass

func _on_start_pressed() -> void:
	get_parent().get_tree().change_scene_to_file("res://Scenes/space_shooter.tscn")


func _on_options_pressed() -> void:
	get_parent().get_tree().change_scene_to_file("res://Scenes/options.tscn")
