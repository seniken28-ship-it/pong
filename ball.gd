extends CharacterBody2D

#Parameters
const speed = 1200 #starting speed (px/s)

var screen_bounds = Vector2i(1600, 900)

func _ready():
	launch()

func launch():
	#called at start, and when the ball gets past a paddle
	self.global_position = Vector2(800, 450)
	self.velocity = speed * Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func _process(delta: float) -> void:
	#NOTE: The way the game handles physics causes the ball to slow down over time. 
	#print(self.velocity)
	
	#Bounce off walls
	'''
	if self.global_position.x <= 30 and self.velocity.x <0:
		self.velocity.x *= -1
	elif self.global_position.x >= 1570 and self.velocity.x >0:
		self.velocity.x *= -1
	elif self.global_position.y <= 30 and self.velocity.y <0:
		self.velocity.y *= -1
	elif self.global_position.y >= 870 and self.velocity.y >0:
		self.velocity.y *= -1'''

	var collision_info = move_and_collide(self.velocity*delta, true)
	if collision_info:

		self.velocity = self.get_real_velocity().bounce(collision_info.get_normal())
		
		#reset velocity back
		if self.velocity.length() <= 300:
			self.velocity *= 1200.0 / self.velocity.length()
		
	print(self.velocity.length())
	move_and_slide()

func _on_body_entered(body: Node) -> void:
	pass # Replace with function body.
