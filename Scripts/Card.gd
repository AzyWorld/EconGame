extends Button

var is_pressed : bool = false
var input_position = rect_position
var pos_rel
var Need : bool
var MyName = "Hi"

func _ready():
	text = MyName
	get_font("font").resource_local_to_scene = true
	get_font('font').size = 50 - len(text)*1.1
	

func _process(_delta):
	$Area2D/CollisionShape2D.position.x = (rect_size.x - rect_min_size.x)/2
	$Area2D/CollisionShape2D.scale.x = rect_size.x / rect_min_size.x
	if pressed:
		if is_pressed == true:
			rect_position.x = input_position.x + pos_rel.x
			rect_position.y = input_position.y + pos_rel.y
		else:
			rect_position.x = get_global_mouse_position().x + pos_rel.x
			rect_position.y = get_global_mouse_position().y + pos_rel.y
	
func _input(event):
	if (event is InputEventScreenDrag) and pressed:
		input_position = event.position
		if event.is_pressed():
			is_pressed = true
		else:
			is_pressed = false


func _on_Card_button_down():
	pos_rel = get_global_rect().position - get_global_mouse_position()
	#$AnimationPlayer.play("ScalePlus")
	$Tween.interpolate_property(self, "rect_scale", rect_scale, Vector2(1.1, 1.1), 0.15, Tween.TRANS_BACK, Tween.EASE_IN)
	$Tween.start()

func _on_Card_button_up():
	$Tween.interpolate_property(self, "rect_scale", rect_scale, Vector2(1, 1), 0.15, Tween.TRANS_BACK, Tween.EASE_IN)
	$Tween.start()
			
