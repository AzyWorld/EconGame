extends Control


func _ready():
	$Tween.interpolate_property($CenterContainer/Percents_bar, "value", 0, 100-(100/(Global.card_amount))*Global.mistakes, 3, Tween.TRANS_CUBIC, Tween.EASE_IN_OUT)
	$Tween.start()

func _process(_delta): 
	$Percent_Label.text = str($CenterContainer/Percents_bar.value) + ' %'


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_ToMenu_pressed():
	get_tree().change_scene("res://Scenes/StartScene.tscn")
