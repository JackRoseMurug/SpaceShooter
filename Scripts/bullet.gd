class_name Bullet
extends Node2D

var speed  = SS.BULLET_SPEED
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= speed * delta
		
	if(position.y < 0):
		queue_free()
