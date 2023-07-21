class_name Grid
extends Node

@export var size : Vector2 = Vector2(10, 10);

@export var cell_size : Vector2 = Vector2(4, 4) * 8.0;

var selected_cell_index : int;

var secondary_selected_cell_index : int;

var grid : Dictionary = {};

var half_cell_size = cell_size / 2;

## returns position of center of cell in pixels
func calculate_map_position(grid_position : Vector2) -> Vector2:
	return grid_position * cell_size + half_cell_size;
	
func calculate_grid_coordinates(position : Vector2) -> Vector2:
	return (position / cell_size).floor();
	
func is_within_bounds(cell_coordinates : Vector2) -> bool:
	return cell_coordinates.x >= 0 and cell_coordinates.x <= size.x and cell_coordinates.y >= 0 and cell_coordinates.y <= size.y;

func clamp(grid_position : Vector2) -> Vector2:
	var out : Vector2 = grid_position;
	out.x = clamp(out.x, 0.0, size.x - 1.0);
	out.y = clamp(out.y, 0.0, size.y - 1.0);
	return out;
	
func convert_to_index(cell : Vector2) -> int:
	return int(cell.x + size.x * cell.y);

func convert_from_index(index : int) -> Vector2:
	var cell : Vector2i;
	cell.x = index / size.x;
	cell.y = index % (int)(size.y);
	return cell;

func search(todo : Callable, include_caller : bool = false, index : int = 0):
	for i in range(GameGrid.size.x * GameGrid.size.y):
		var possibly_selected : Unit = GameGrid.grid.get(i) as Unit;
		if not include_caller:	
			if i != index:
				todo.call();
		todo.call();
		

	
	

