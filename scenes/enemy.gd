extends CharacterBody2D

@export var speed = 350
var ball: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if ball == null:
		ball = get_parent().get_node_or_null("Ball")
		return
		
		
	var distance = abs(ball.global_position.y - global_position.y)
	var direction = sign(ball.global_position.y - global_position.y)
	
	if distance > 10:
		velocity.x = 0
		velocity.y = direction * speed
	else:
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
	global_position.y = clamp(global_position.y, 60, 648 - 60)
