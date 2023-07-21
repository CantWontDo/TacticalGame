class_name Action
extends Node2D

var action_chosen : bool: get = get_action_chosen;

signal action_just_chosen(index : int);

@export var action_index : int = 0;

func get_action_chosen() -> bool:
	return action_chosen;

func _on_button_pressed():
	emit_signal("action_just_chosen", action_index);
