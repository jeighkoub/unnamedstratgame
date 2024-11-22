extends Polygon2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_mouse_entered() -> void:
	modulate = Color(0.8,0.8,0.8) # highlight hex


func _on_area_2d_mouse_exited() -> void:
	modulate = Color(1,1,1) # reset highlight, = og
