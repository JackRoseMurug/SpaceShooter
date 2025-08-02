class_name SS
extends Node

static var SCORE
static var ENEMY_SPEED : float
static var BULLET_SPEED: float
static var PREV_SCORE := 0
static var SFX_ENABLED := true
static var BGM_ENABLED := true
static var VFX_ENABLED := true
static var IS_WEB: bool


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SCORE = 0
	ENEMY_SPEED = 100
	BULLET_SPEED = 500
	PREV_SCORE = 0
	IS_WEB = OS.has_feature("web")
	

static func get_score():
	return SCORE
	
static func increment_score():
	SCORE += 1
