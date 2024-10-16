extends Node2D

var transleft = false
var transright = false

func _ready() -> void:
	$Camera2D/ColorRect.modulate = "ffffff"
	$Camera2D/AnimationPlayer.play("FadeIn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("movecamright"):
		get_tree().paused = true
		movecamright()
	if Input.is_action_just_pressed("movecamleft"):
		$Camera2D/AnimationPlayer.play("FadeIn")
	if transright == true:
		if !$Camera2D.position.x >= 1152:
			$Camera2D.position.x += 3
		else:
			$Camera2D.position.x = 1152
			transright = false
			PlayerVarsRoom.CamFadingIn = true
			PlayerVarsRoom.PlayerPosition = $Player.global_position
			get_tree().change_scene_to_file("res://test_room_2.tscn")

func movecamright():
	$Camera2D/AnimationPlayer.play("FadeOut")
	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "FadeOut":
		transright = true
	elif anim_name == "FadeIn":
		get_tree().paused = false
