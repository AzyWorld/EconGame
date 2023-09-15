extends Control


var Names = ["Еда" , "Поход в кино", "Чипсы", "Оплата обучения", "Квартплата", "Коммунальные услуги", "Аренда жилья", "Оплата кредита", "Поездка в Италию", "Поездка во Францию", "Поездка в Англию", "Поездка в Турцию", "Поход в ресторан", "Поход в кафе", "На спортивную секцию", 
"На репетитора по математике","Оплата услуг связи", "Плата за химчистку", "Репетитор по информатике", "Покупка тетрадей и учебников", "Новый телефон", "Покупка телевизора", "Новые шторы", "Новый компьютер", "Школьная форма", "Зимние ботинки", 
"Новогодняя елка", "Оплата проезда на месяц", "Сладости на праздник", "Новые кроссовки", "Физкультурная форма", "Оплата интернета", "Канцтовары для детей" , "Косметика" , "Бумага для принтера" , "Папина командировка в Германию", "Новая колонка"," Обои для будущего ремонта" , 
"Игрушки для дочери" , "Новая клавиатура" , "Еда для кошки" , "Бензин для папиного автомобиля" , "Страховка" , "Оплата налогов" , "Диван" , "Подарок для друга" , "Цветы для клумбы" , "Iphone 13 pro max", "Билет на поезд для отпуска" , "Гантели для занятий" , "Елочные украшения" , "Коврик для мышки" , "Лыжный костюм" , "Сноуборд" , "Футбольный мяч" , 
"Лекарства для дедушки" , "Дрель" , "Материалы для ремонта" , "Робот пылесос" , "Стиральная машина" , "Новая шапка", "Новый монитор" , "Лампочки", "Видеокарта" , "Блакнот" , "Симпл-димпл ", "Гирлянда" , " Письменный стол" , " Карманные деньги ребенку" , " Возврат долга" , "Оплата за садик" , "Аренда земли " , "Кофеварка" , "Набор наклеек" , 
"Репетитор по экономике" , "Коньки" , "Лыжи" , "Перчатки", "Новые книги" , "Журнал"]

var True_names = ["Еда", "Оплата обучения", "Коммунальные услуги", "Квартплата", "Аренда жилья", "Оплата кредита", 
"Оплата услуг связи", "Покупка тетрадей и учебников", "Школьная форма", "Зимние ботинки", "Оплата проезда на месяц", "Физкультурная форма", "Оплата интернета", "Канцтовары для детей", "Папина командировка в Германию", 
"Еда для кошки", "Бензин для папиного автомобиля", "Страховка", "Оплата налогов", "Лекарства для дедушки", "Возврат долга", "Оплата за садик", "Аренда земли"]

var Doxods = ["Зарплата папы", "Стипендия", "Зарплата мамы", "Выплата по нетрудоспособности", "Квартплата", "Накопления", "Коммунальные услуги", "Еда", "Аренда жилья", "Прибыль от бизнеса", "Дивиденды от акций", "Проценты от вклада", "Оплата налогов"]
var TrueDoxods = ["Зарплата папы", "Стипендия", "Зарплата мамы", "Выплата по нетрудоспособности", "Коммунальные услуги", "Прибыль от бизнеса", "Дивиденды от акций", "Проценты от вклада"]

var Used_names = []
var mistakes : int = 0

var card = preload("res://Scenes/Card.tscn").instance()
var cardPosY = 0

var r = RandomNumberGenerator.new()

func randomizeName(obj):
	if Global.mode == "RR":
		r.randomize()
		obj.MyName = Names[r.randi_range(0, len(Names)-1)]
		while obj.MyName in Used_names:
			r.randomize()
			obj.MyName = Names[r.randi_range(0, len(Names)-1)]
		Used_names.append(obj.MyName)
	elif Global.mode == "DR":
		r.randomize()
		obj.MyName = Doxods[r.randi_range(0, len(Doxods)-1)]
		while obj.MyName in Used_names:
			r.randomize()
			obj.MyName = Doxods[r.randi_range(0, len(Doxods)-1)]
		Used_names.append(obj.MyName)

func _ready():
	if Global.mode == "RR":
		$MarginContainer/Label.text = "Семье ивановых срочно понадобились деньги на операцию. От каких расходов стоит отказаться?"
		$"+".text = "оставить"
		$"-".text = "отказаться"
	elif Global.mode == "DR":
		$MarginContainer/Label.text = "Семье ивановых нужно составить бюджет. Что из этого доходы, а что расходы?"
		$"+".text = "доходы"
		$"-".text = "расходы"
	OS.screen_orientation = 1
	$MarginContainer2/Button/Not_Area/CollisionShape2D.position = $MarginContainer2.rect_size/2
	$MarginContainer3/Button2/Yes_area/CollisionShape2D.position = $MarginContainer3.rect_size/2
	$MarginContainer2/Button/Not_Area/CollisionShape2D.scale = $MarginContainer2.rect_size/2/Vector2(120, 328)
	$MarginContainer3/Button2/Yes_area/CollisionShape2D.scale = $MarginContainer3.rect_size/2/Vector2(120, 328)
	for i in range(Global.card_amount):
		card = preload("res://Scenes/Card.tscn").instance()
		card.rect_position = OS.get_screen_size()/2
		card.rect_position.y -= OS.get_screen_size().y/3
		card.rect_position.y += cardPosY
		card.rect_position.x -= card.rect_size.x/2
		cardPosY += card.rect_size.y/1.5 + 5
		randomizeName(card)
		add_child(card)


func _on_Button_pressed():
	mistakes = 0
	if (len($MarginContainer3/Button2/Yes_area.get_overlapping_areas()) + len($MarginContainer2/Button/Not_Area.get_overlapping_areas())) < Global.card_amount:
		$MarginContainer/Label.text = "Не все карточки установлены!"
	else:
		if Global.mode == "RR":
			for i in $MarginContainer3/Button2/Yes_area.get_overlapping_areas():
				if not (i.get_parent().MyName in True_names):
					mistakes += 1
			for i in $MarginContainer2/Button/Not_Area.get_overlapping_areas():
				if i.get_parent().MyName in True_names:
					mistakes += 1
			Global.mistakes = mistakes
			get_tree().change_scene("res://Scenes/result.tscn")
		if Global.mode == "DR":
			for i in $MarginContainer3/Button2/Yes_area.get_overlapping_areas():
				if not (i.get_parent().MyName in TrueDoxods):
					mistakes += 1
			for i in $MarginContainer2/Button/Not_Area.get_overlapping_areas():
				if i.get_parent().MyName in TrueDoxods:
					mistakes += 1
			Global.mistakes = mistakes
			get_tree().change_scene("res://Scenes/result.tscn")


func _on_Not_Area_area_entered(area):
	Global.CardsInMinus.append(area)


func _on_Yes_area_area_entered(area):
	Global.CardsInPlus.append(area)
