extends Node2D

var hex_scene = preload("res://hex.tscn")
var player = preload("res://player_character.tscn")
@onready var camera: Camera2D = get_node("Camera2D")

func createMap() -> void:
	var centerCoordinates: Vector2 = camera.global_position
	#ASSUMING POINT TOP HEXAGONS
	#hexagon vertex directions
	const R: Vector2 = Vector2(0,1)	#south edge
	const Q: Vector2 = Vector2(cos(PI/6),-sin(PI/6))	#NE vertex
	const S: Vector2 = Vector2(-cos(PI/6),-sin(PI/6))	#NW vertex
	
	#hexagon adjacency directions
	const E: Vector2 = Q - S
	const W: Vector2 = S - Q
	const NE: Vector2 = Q - R
	const SW: Vector2 = -NE
	const NW: Vector2 = S - R
	const SE: Vector2 = -NW
	
	
	# Instantiate hexagons for each coordinate (r, s, q) in the range 0 to 3
	var exhex = hex_scene.instantiate()
	var hex_size = exhex.get_node("Polygon2D").polygon[0].length() * exhex.scale[0]
	exhex.queue_free()
	
	var map_size = 3
	

	for r in range(-map_size,map_size+1):
		var qstart = -map_size
		var qend = map_size
		if r > 0:
			qend -= r
		else:
			qstart -=r
		for q in range(qstart,qend+1):
			var s = -r - q
			var hex_instance = hex_scene.instantiate()
			var offset = r * R + s * S + q * Q
			hex_instance.position = centerCoordinates + offset * hex_size
			add_child(hex_instance)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	createMap() # Replace with function body.
	player.instantiate()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
