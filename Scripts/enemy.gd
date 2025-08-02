class_name Enemy
extends Node2D

var speed = SS.ENEMY_SPEED
var endScene = preload("res://Scenes/End.tscn")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !SS.VFX_ENABLED:
		gpu_particles_2d.visible = false
	else:
		gpu_particles_2d.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if SS.SCORE - SS.PREV_SCORE >= 10:
		speed += speed *.1
		SS.ENEMY_SPEED = speed
		SS.PREV_SCORE = SS.SCORE 
	position.y += speed * delta


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "BulletArea":
		if SS.SFX_ENABLED:
			animation_player.play("Explosion")
		else:
			queue_free()
		area.get_parent().queue_free()
		#queue_free()
		SS.increment_score()
		#print("Score "+str(SS.get_score())+" PScore "+str(SS.PREV_SCORE)+" ES "+str(SS.ENEMY_SPEED)+" BS "+str(SS.BULLET_SPEED))
	
	if area.name == "Boundary":
		for i in get_parent().get_children():
			i.queue_free()
		var endNode = endScene.instantiate();
		get_parent().add_child(endNode)
		get_parent().get_parent().get_node("EnemySpawner").queue_free()
