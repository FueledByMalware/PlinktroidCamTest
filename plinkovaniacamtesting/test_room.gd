extends Node2D

var Transleft = 0
var Transright = 0
var LastCameraPosition = null

func _ready() -> void:
	$Camera2D/ColorRect.visible = false

func TransitionLeft():
	LastCameraPosition = $Camera2D.position.x - 1152
	$Camera2D/ColorRect.visible = true
	$Camera2D/AnimationPlayer.play("FadeOut")
	Transleft = 1
	get_tree().paused = true

func TransitionRight():
	LastCameraPosition = $Camera2D.position.x + 1152
	$Camera2D/ColorRect.visible = true
	$Camera2D/AnimationPlayer.play("FadeOut")
	Transright = 1
	get_tree().paused = true

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("movecamleft"):
		TransitionLeft()
	if Input.is_action_just_pressed("movecamright"):
		TransitionRight()
	if Transleft == 2:
		if !$Camera2D.position.x <= LastCameraPosition:
			$Camera2D.position.x -= 3
		else:
			$Camera2D.position.x = LastCameraPosition
			$Camera2D/AnimationPlayer.play("FadeIn")
	if Transright == 2:
		if !$Camera2D.position.x >= LastCameraPosition:
			$Camera2D.position.x += 3
		else:
			$Camera2D.position.x = LastCameraPosition
			$Camera2D/AnimationPlayer.play("FadeIn")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "FadeOut":
		print("FadeOut")
		if Transleft == 1:
			Transleft = 2
		elif Transright == 1:
			Transright = 2
	if anim_name == "FadeIn":
		print("FadeIn")
		$Camera2D/ColorRect.visible = false
		Transleft = 0
		Transright = 0
		LastCameraPosition = null
		get_tree().paused = false
