extends Control

onready var MustardHam = $feed/MustardHam
onready var BarbecueFish = $feed/BarbecueFish

func _ready():
	# set invisible
	MustardHam.visible = false

func _on_FeedButton_pressed():
	$feed/BarbecueFish.visible = false
	if $feed/MustardHam.visible == false:
		$feed/MustardHam.visible = true
		var MustardTimer = get_tree().create_timer(2)
		print('feed should be invisible')
		yield(MustardTimer, "timeout")
		$feed/MustardHam.visible = false

		

		
	#TODO:
	# - make it so hunger decreases every time you press feed button
	# - do not worry at this point about negative numbers or greater than 100 for percent
