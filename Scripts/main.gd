class_name Main

extends Node2D
var unit = preload("res://Scenes/unit.tscn");
var dummy = preload("res://Scenes/dummy.tscn");

func _ready():
	for i in range(GameGrid.size.x * GameGrid.size.y):
		
		var positionpo : Vector2 = GameGrid.calculate_map_position(GameGrid.clamp(GameGrid.convert_from_index(i)));
		if i % 7 == 0 and randf_range(0.0, 10.0) < 6.0:
			var dumdum : Dummy = dummy.instantiate() as Dummy;
			add_child(dumdum);
			dumdum.global_position = positionpo;
			dumdum.index = i;
			GameGrid.grid[i] = dumdum;
		else:
			var unitunit : Unit = unit.instantiate() as Unit;		
			add_child(unitunit);
			unitunit.index = i;
			unitunit.global_position = positionpo;
			GameGrid.grid[i] = unitunit;
		


			

		
		
		
	


