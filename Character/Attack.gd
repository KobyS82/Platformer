extends State

@export var return_state : State
@export var return_animation_node : String = "move"
@export var punch1_name : String = "punch1"
@export var punch2_name : String = "punch2"
@export var punch2_node : String = "punch2"
@export var swipe_name : String = "swipe"
@export var swipe_node : String = "swipe"


@onready var timer : Timer = $Timer


func state_input(event : InputEvent):
	if(event.is_action_pressed("attack")):
		timer.start()

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == punch1_name):
		if(timer.is_stopped()):
			next_state = return_state
			playback.travel(return_animation_node)
		else:
			playback.travel(punch2_node)
	
	if(anim_name == punch2_name):
		if(timer.is_stopped()):
			next_state = return_state
			playback.travel(return_animation_node)
		else:
			playback.travel(swipe_node)
	
	if(anim_name == swipe_name):
		next_state = return_state
		playback.travel(return_animation_node)
