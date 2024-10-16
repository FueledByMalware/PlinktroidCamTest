extends Node2D

var transleft

func _ready() -> void:
	$Camera2D/ColorRect.modulate = "ffffff"
	$Camera2D/AnimationPlayer.play("FadeIn")

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("movecamleft"):
		get_tree().paused = true
		movecamleft()
	
	if transleft == true:
		if !$Camera2D.position.x <= 1152:
			$Camera2D.position.x -= 3
		else:
			$Camera2D.position.x = 1152
			transleft = false
			PlayerVarsRoom.CamFadingIn = true
			PlayerVarsRoom.PlayerPosition = $Player.global_position
			get_tree().change_scene_to_file("res://test_room_1.tscn")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "FadeOut":
		pass
	elif anim_name == "FadeIn":
		get_tree().paused = false
