extends Node

class_name CharacterStateMachine

@export var current_state : State


var states : Array[State]

# Called when the node enters the scene tree for the first time.
func _ready():
	# Grabs all of the Character states
	for child in get_children():
		if(child is State):
			states.append(child)
			
			# Set the states up with what they need to function
			
		else:
			push_warning("Child " + child.name + " is not a State for CharacterStateMachine")

func check_if_can_move():
	return current_state.can_move
