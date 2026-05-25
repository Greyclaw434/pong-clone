extends CharacterBody2D

@export var speed = 400
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("move_up", "move_down")
	
	velocity.x = 0
	velocity.y = direction * speed
	
	move_and_slide()
	
	global_position.y = clamp(global_position.y, 60, 648 - 60)
