extends Node2D


onready var current_level = 0

onready var egg = preload("res://sprites/egg.png")
onready var creature = preload("res://sprites/creature.png")

onready var life_in_seconds = 30/2
onready var stage_in_seconds = 10/2

func _ready():
	var life_timer = $LifeTimer
	var stage_timer = $StageTimer
	
	stage_timer.start(stage_in_seconds)
	life_timer.start(life_in_seconds)
	
func _process(_delta):
	pass

func handle_stage(current_level):
	if current_level == 0:
		print('egg')
		$Sprite.set_texture(egg)
	elif current_level == 1:
		$Sprite.set_texture(creature)
	else: 
		print('_')

# signal emission for the stage timer (when it ends)
func _on_StageTimer_timeout():
	current_level += 1
	print(current_level)
	handle_stage(current_level)


func _on_LifeTimer_timeout():
	current_level = 0
	print('old age: ', current_level)
	handle_stage(current_level)
