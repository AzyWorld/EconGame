extends Node

var mistakes
var card_amount = 6

var CardsInPlus = []
var CardsInMinus = []

var mode = "RR"

func _on_SoundTrack1_finished():
	$SoundTrack2.play()


func _on_SoundTrack2_finished():
	$SoundTrack3.play()


func _on_SoundTrack3_finished():
	$SoundTrack1.play()
