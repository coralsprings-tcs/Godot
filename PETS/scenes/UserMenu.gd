extends Control

onready var MustardHam = $feed/MustardHam

func _ready():
	$feed/MustardHam.visible = false

func _on_FeedButton_pressed():
	if $feed/MustardHam.visible == false:
		$feed/MustardHam.visible = true
		var timer = get_tree().create_timer(2)
		print('feed should be invisible')
		yield(timer, "timeout")
		$feed/MustardHam.visible = false
		
	
	#TODO:
	# - make it so hunger decreases every time you press feed button
	# - do not worry at this point about negative numbers or greater than 100 for percent
