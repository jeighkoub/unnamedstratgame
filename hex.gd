extends Node2D

func showIsSelected():
	get_node("Polygon2D").modulate = Color(0,1,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
