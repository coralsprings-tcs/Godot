extends KinematicBody2D

var movement = Vector2()
var speed = 50
var canAttack = true
var attack_radius = 200

onready var player = get_node("/root/Node2D/MechCharacter")
onready var screen_size = get_viewport_rect().size
# warning-ignore:unused_argument

func map_input():
	movement = Vector2()
	if Input. is_key_pressed(KEY_A):
		movement.x -= 1
	if Input. is_key_pressed(KEY_D):
		movement.x += 1
		
	if Input. is_key_pressed(KEY_W):
		movement.y -= 1
	if Input. is_key_pressed(KEY_S):
		movement.y += 1
	movement = movement.normalized() * speed
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		map_attacks()

func map_attacks():
	if canAttack:
		$cooldown.start()
		do_click_for_attack()
		# below is getting position of where you clicked }:(
		canAttack = false	

func do_click_for_attack():
	var click_pos = get_viewport().get_mouse_position()
	var player_pos = player.get_global_transform_with_canvas().get_origin()
	
	# distance squared = (change in x) squared + (change in y) squared
	var change_in_x2 = pow(player_pos.x - click_pos.x, 2)
	var change_in_y2 = pow(player_pos.y - click_pos.y, 2)
	var distance = pow(change_in_x2 + change_in_y2, 0.5)
	
	if distance <= attack_radius:
		print('attack')

func _physics_process(delta):
	map_input()
	movement = move_and_slide(movement)
	screen_wrap()

func screen_wrap():
	# get your position
	if position.y > screen_size.y:
		position.y = 0
	if position.y < 0:
		position.y = screen_size.y
	if position.x > screen_size.x:
		position.x = 0
	if position.x < 0:
		position.x = screen_size.x






# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_cooldown_timeout():
	canAttack = true
	$cooldown.stop()
