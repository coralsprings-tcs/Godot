extends Control

onready var MustardHam = $feed/MustardHam
onready var BarbecueFish = $feed/BarbecueFish
onready var RelishLobster = $feed/RelishLobster

func _ready():
	$feed/MustardHam.visible = false
	$feed/BarbecueFish.visible = false
	$feed/RelishLobster.visible = false

func _on_MustardHamButton_pressed():
	if $feed/MustardHam.visible == false:
		$feed/MustardHam.visible = true
		var MustardHamTimer = get_tree().create_timer(2)
		print('MUSTARD HAM')
		yield(MustardHamTimer, "timeout")
		$feed/MustardHam.visible = false
		
func _on_BarbecueFishButton_pressed():
	if $feed/BarbecueFish.visible == false:
		$feed/BarbecueFish.visible = true
		var BarbecueFishTimer = get_tree().create_timer(3)
		print('BARBECUE FISH')
		yield(BarbecueFishTimer, "timeout")
		$feed/BarbecueFish.visible = false
		
func _on_RelishLobsterButton_pressed():
	if $feed/RelishLobster.visible == false:
		$feed/RelishLobster.visible = true
		var RelishLobsterTimer = get_tree().create_timer(4)
		print('RELISH LOBSTER')
		yield(RelishLobsterTimer, "timeout")
		$feed/RelishLobster.visible = false

	#TODO:
	# - make it so hunger decreases every time you press feed button
	# - do not worry at this point about negative numbers or greater than 100 for percent
