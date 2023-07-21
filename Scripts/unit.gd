class_name Unit

extends Node2D

@onready var health_component : HealthComponent = $HealthComponent;
@onready var selectable_component : SelectableComponent = $SelectableComponent;
@onready var unit_sprite : Sprite2D = $UnitSprite;
@export var unit_animation : AnimationPlayer;

var is_dead : bool = false;

var index : int;

enum Types {UNIT, DUMMY};

@export var type : Types = Types.UNIT;

func damage(amount : float):
	if not is_dead:
		health_component.set_current_health(health_component.get_current_health() - amount);
		unit_animation.play("damage");
	pass;

func action(action_type : int):
	if action_type == 1:
		damage(1);

func _on_health_component_health_changed(new_health):
	match type:
		0:
			print("i am unit");
		1: 
			print("i am dummy");
	print("health is now " + str(new_health));


func _on_health_component_died():
	is_dead = true;
	await unit_animation.animation_finished
	unit_animation.play("death", 1., .8);
	selectable_component.animation_player.play("unselect");
	print("just died");


func _on_health_component_max_health_changed(new_max_health):
	pass;#print("max health is now "+ str(new_max_health));


func _on_selectable_component_just_selected():
	for i in range(GameGrid.size.x * GameGrid.size.y):
		if i != index:
			var possibly_selected : Unit = GameGrid.grid.get(i) as Unit;
			if possibly_selected.selectable_component.is_selected():
				possibly_selected.selectable_component.set_is_selected(false);
				possibly_selected.selectable_component.animation_player.play("unselect");
				break;
	
func _on_selectable_component_just_unselected():
	pass;

func _on_selectable_component_just_secondary_selected():
	selectable_component.animation_player.queue("unselect");

