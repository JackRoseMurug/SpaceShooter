extends Node2D

var direction:int = 0
var speed := 300
var shootCount :float = 0.0
var shootLimit :float = 0.25
var bulletScene = preload("res://Scenes/bullet.tscn")
@onready var audioPlayer: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_parent().get_node("Enemies") != null:
		shootCount += delta
		if Input.is_action_pressed("move_left"):
			direction = -1
		elif Input.is_action_pressed("move_right"):
			direction = 1
		else:
			direction=0
			
		if Input.is_action_pressed("fire_bullet") and shootCount>=shootLimit:
			shootCount = 0
			var bullet = bulletScene.instantiate();
			bullet.position = Vector2(position.x,position.y-32);
			get_parent().get_node("Bullets").add_child(bullet)
			if SS.SFX_ENABLED:
				audioPlayer.play(0)
		
		position.x += direction * speed * delta
		position.x = clamp(position.x,32,368)
