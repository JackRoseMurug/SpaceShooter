extends Node

var enemyScene := preload("res://Scenes/enemy.tscn")
var endScene = preload("res://Scenes/End.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$EnSpawnTimer.start()


func _on_timer_timeout() -> void:
	var enemy = enemyScene.instantiate()
	randomize();
	enemy.position = Vector2(randi_range(0,400),0);
	get_parent().get_node("Enemies").add_child(enemy)
	
	
	
	
