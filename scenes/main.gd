extends Node2D

var player_score = 0
var enemy_score = 0
@onready var labelplayer_score: Label = $UI/PlayerScore
@onready var labelenemy_score: Label = $UI/EnemyScore


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_left_goal_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		enemy_score += 1
		labelenemy_score.text = str(enemy_score)
		check_win_or_reset()


func _on_right_goal_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		player_score += 1
		labelplayer_score.text = str(player_score)
		check_win_or_reset()
		
func check_win_or_reset():
	if player_score == 5 or enemy_score == 5:
		get_tree().reload_current_scene()
	else:
		$Ball.reset()
