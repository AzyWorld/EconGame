extends Control

func _on_Button_pressed():
	GlobalS.get_node("ButtonSound").playing = true
	#get_tree().change_scene("res://Scenes/Main.tscn")
	$Tween.interpolate_property($Doxods_rasxods, "anchor_left", 0.5, 0.8, 0.2, Tween.TRANS_BACK, Tween.EASE_IN)
	$Tween.interpolate_property($Doxods_rasxods, "anchor_bottom", 0.5, 0.35, 0.2, Tween.TRANS_BACK, Tween.EASE_IN)
	$Tween.interpolate_property($Rasxods_rasxods, "anchor_left", 0.5, 0.85, 0.2, Tween.TRANS_BACK, Tween.EASE_IN)
	$Tween.interpolate_property($Budjets, "anchor_left", 0.5, 0.8, 0.2, Tween.TRANS_BACK, Tween.EASE_IN)
	$Tween.interpolate_property($Budjets, "anchor_top", 0.5, 0.65, 0.2, Tween.TRANS_BACK, Tween.EASE_IN)
	$Tween.start()
	
func _process(delta):
	if $Doxods_rasxods.pressed:
		GlobalS.get_node("ButtonSound").playing = true
		Global.mode = "DR"
		get_tree().change_scene("res://Scenes/Main.tscn")
	if $Rasxods_rasxods.pressed:
		GlobalS.get_node("ButtonSound").playing = true
		Global.mode = "RR"
		get_tree().change_scene("res://Scenes/Main.tscn")
	if $Budjets.pressed:
		GlobalS.get_node("ButtonSound").playing = true
		get_tree().change_scene("res://Scenes/Budjets.tscn")
