class_name SelectableComponent
extends Node2D

@onready var selectable_area : Area2D = $Area2D;
@onready var select_sprite : Sprite2D = $Sprite2D;
@onready var animation_player : AnimationPlayer = $AnimationPlayer;

var selected : bool: get = is_selected, set = set_is_selected;

var secondary_selected : bool: get = is_secondary_selected, set = set_is_secondary_selected; 

signal select;
signal secondary_select;

signal just_selected;
signal just_unselected;

signal just_secondary_selected;
signal just_secondary_unselected;

func _ready():
	selected = false;
	pass;

func _on_area_2d_input_event(viewport, event : InputEvent, shape_idx):
	if Input.is_action_just_pressed("click") and not animation_player.is_playing():
		emit_signal("select");
	elif Input.is_action_just_pressed("right_click") and not animation_player.is_playing():
		emit_signal("secondary_select");

func is_selected() -> bool:
	return selected;

func set_is_selected(new_is_selected : bool):
	selected = new_is_selected;
	
func go_select():
	selected = !selected;
	if selected:
		emit_signal("just_selected");
		animation_player.play("select")
	elif not selected:
		emit_signal("just_unselected");
		animation_player.play("unselect");

func go_secondary_select():
	secondary_selected = !secondary_selected;
	if secondary_selected:
		emit_signal("just_secondary_selected");
		animation_player.play("secondary_select")
	elif not secondary_selected:
		emit_signal("just_secondary_unselected");
		animation_player.play("unselect");
		
func is_secondary_selected() -> bool:
	return secondary_selected;

func set_is_secondary_selected(new_is_secondary_selected : bool):
	secondary_selected = new_is_secondary_selected;
	
