extends Node

class_name HealthComponent

signal health_changed(new_health : int);

signal max_health_changed(new_max_health : int);

signal died;

@export var _current_health : float = 5.0: 
	get = get_current_health, set = set_current_health;

@export var _max_health : float = 5.0: 
	get = get_max_health, set = set_max_health;

func get_max_health() -> float:
	return _max_health;

func set_max_health(new_max_health : float):
	if new_max_health != _max_health:
		emit_signal("max_health_changed", new_max_health);
	_max_health = new_max_health;
	
func get_current_health() -> float:
	return _current_health;

func set_current_health(new_current_health : float):
	if new_current_health != _current_health:
		emit_signal("health_changed", new_current_health);
	_current_health = new_current_health;
	if _current_health <= 0:
		emit_signal("died");

