extends Sprite

var rng = RandomNumberGenerator.new()
var rng2 = RandomNumberGenerator.new()

func _on_Timer_timeout():
	rng.randomize()
	var choice = rng.randi_range(0,4)
	if choice == 2:
		rng.randomize()
		var yesorno = rng.randi_range(0,3)
		if yesorno == 0:
			self.frame = choice
			rng.randomize()
			self.get_node("Timer").wait_time = rng.randf_range(0.1, 0.25)
		else:
			if choice == 0:
				self.frame = 1
			elif choice == 1:
				self.frame = 0
			elif choice == 2:
				self.frame = 1
			
	elif choice != 2:
		self.frame = choice
		rng.randomize()
		self.get_node("Timer").wait_time = rng.randi_range(1, 3)
	
	self.get_node("Timer").start()

func _on_TouchScreenButton_released():
	print("play")


func _on_Static_timeout():
	rng2.randomize()
	var e = self.get_parent().get_node("static")
	var choice = rng2.randi_range(1,3)
	if choice == 1:
		if e.flip_h == true:
			e.flip_h = false
		else:
			e.flip_h = true
	elif choice == 2:
		if e.flip_v == true:
			e.flip_v = false
		else:
			e.flip_v = true
	elif choice == 3:
		if e.flip_h == true:
			e.flip_h = false
		else:
			e.flip_h = true
			
		if e.flip_v == true:
			e.flip_v = false
		else:
			e.flip_v = true
	self.get_node("Static").start()


func _on_TouchScreenButton2_pressed():
	if OS.window_fullscreen == true:
		OS.window_fullscreen = false
	elif OS.window_fullscreen == false:
		OS.window_fullscreen = true


func _on_TouchScreenButton3_pressed():
	get_tree().quit()
