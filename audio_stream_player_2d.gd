extends AudioStreamPlayer2D

func _ready():
	# Activar bucle en el stream
	stream.loop = true
	play()
