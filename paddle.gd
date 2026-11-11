extends RigidBody2D

var enabled = true

func _ready():
	if not self.get_meta('player_control'):
		enabled = false

func _physics_process(delta: float) -> void:
	if enabled:
		if Input.is_action_pressed("down"):
			self.global_position.y += 700 * delta
		if Input.is_action_pressed("up"):
			self.global_position.y -= 700 * delta
