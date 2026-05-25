extends CharacterBody2D

@export var base_speed = 400
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2(-base_speed, base_speed / 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		
		var collider = collision.get_collider()
		
		if collider.name == "Player" or collider.name == "Enemy":
			velocity *= 1.05
			var hit_point = global_position.y - collider.global_position.y
			velocity.y += hit_point * 5.0
		
