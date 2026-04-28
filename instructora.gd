# instructora.gd
extends Control

var nombre_jugador = ""
var esperando_respuesta := false 
var pregunta_realizada := false
var ruta_elegida = ""

# Puntaje de ejercicios
var puntaje = 0
var total_ejercicios = 0
var en_ejercicios = false

var dialogo = []
var indice = 0
var velocidad = 0.03

@onready var sonido_texto = get_node("/root/Cap_1/SonidoTexto")
@onready var sonido_escribir = get_node("/root/Cap_1/SonidoEscribir")
@onready var consola = get_node("/root/Cap_1/ConsolaPython")
@onready var opciones_menu = get_node("/root/Cap_1/OpcionesMenu")

func _ready():
	dialogo = DialogosData.cap_1()
	consola.visible = false
	opciones_menu.visible = false
	opciones_menu.connect("opcion_elegida", _on_opcion_elegida)
	consola.ejercicio_completado.connect(_on_consola_completada)
	$"../Nombre/LineEditNombre".visible = false
	$"../Nombre/LineEditNombre".connect("text_changed", _on_texto_cambiado) 
	_mostrar_dialogo()


func _on_texto_cambiado(texto_nuevo: String):
	sonido_escribir.play()

func _mostrar_dialogo():
	var nombre_label = $"../Nombre/Cnombre"
	var texto_label = $Saludo
	var sprite_node = $"../../Personajes/Instrutora"
	var entrada = dialogo[indice]
	var personaje = entrada[0]
	var texto = entrada[1]
	var expresion = entrada[2]

	# ── CASOS ESPECIALES ──────────────────────────────────────
	if personaje == "INPUT":
		_mostrar_entrada_nombre()
		return

	if personaje == "OPCIONES":
		opciones_menu.iniciar()
		return

	if personaje == "REPASO":
		_mostrar_menu_repaso()
		return

	if personaje == "FIN_REPASO":
		# Vuelve al menú de repaso
		indice = _buscar_indice("REPASO")
		_mostrar_dialogo()
		return

	if personaje == "INICIO_EJERCICIOS":
		en_ejercicios = true
		puntaje = 0
		total_ejercicios = 0
		_siguiente_dialogo()
		return

	if personaje == "EJERCICIO_PREGUNTA":
		total_ejercicios += 1
		_mostrar_ejercicio_pregunta(texto)
		return

	if personaje == "EJERCICIO_CONSOLA":
		total_ejercicios += 1
		var codigo_esperado = entrada[1]  # ← toma directo del array
		consola.iniciar(codigo_esperado)
		return

	if personaje == "RESULTADO_FINAL":
		_siguiente_dialogo()
		return

	if personaje == "MOSTRAR_PUNTAJE":
		_mostrar_puntaje()
		return

	if personaje == "RUTA_PREGUNTA" or personaje == "RUTA_TERMINAL" or personaje == "RUTA_EXPLICAR":
		_siguiente_dialogo()
		return

	if personaje == "FIN_RUTA":
		indice = _buscar_indice("DIALOGO_FINAL") if _buscar_indice("DIALOGO_FINAL") != -1 else indice
		_siguiente_dialogo()
		return

	if personaje == "REPASO_VARIABLES" or personaje == "REPASO_OPERADORES" or \
	   personaje == "REPASO_CONDICIONALES" or personaje == "REPASO_CICLOS" or \
	   personaje == "REPASO_LISTAS" or personaje == "REPASO_FUNCIONES":
		_siguiente_dialogo()
		return

	# ── DIÁLOGO NORMAL ────────────────────────────────────────
	texto = texto.replace("{nombre}", nombre_jugador)
	nombre_label.text = personaje
	_aplicar_expresion(sprite_node, expresion)
	texto_label.bbcode_enabled = true
	texto_label.clear()
	texto_label.append_text(texto)
	texto_label.visible_characters = 0
	_mostrar_letra_por_letra(texto_label)


func _mostrar_entrada_nombre():
	var label = $Saludo
	var line = $"../Nombre/LineEditNombre"
	var nombre_label = $"../Nombre/Cnombre"
	nombre_label.text = "Ins. Marcela"
	label.visible_characters = -1
	label.clear()
	label.append_text("Escribe tu nombre abajo y presiona ENTER: ")
	line.visible = true
	line.text = ""
	line.grab_focus()



func _mostrar_menu_repaso():
	# Reutiliza opciones_menu pero con opciones de repaso
	opciones_menu.iniciar_repaso()


func _mostrar_ejercicio_pregunta(respuesta_esperada: String):
	var label = $Saludo
	var line = $"../Nombre/LineEditNombre"
	var nombre_label = $"../Nombre/Cnombre"
	nombre_label.text = "Ins. Marcela"
	label.clear()
	label.append_text("Escribe tu respuesta y presiona ENTER. ")
	label.visible_characters = -1
	line.visible = true
	line.text = ""
	line.grab_focus()
	esperando_respuesta = true
	pregunta_realizada = true


func _mostrar_puntaje():
	var label = $Saludo
	var nombre_label = $"../Nombre/Cnombre"
	var sprite_node = $"../../Personajes/Instrutora"
	nombre_label.text = "Ins. Marcela"
	_aplicar_expresion(sprite_node, "feliz")
	label.clear()
	label.append_text("Tu puntaje: " + str(puntaje) + "/" + str(total_ejercicios) + " respuestas correctas. ")
	label.visible_characters = -1


func _aplicar_expresion(sprite_node, exp):
	for e in ["Normal", "Indiferente", "Feliz"]:
		sprite_node.get_node(e).visible = false
	match exp:
		"normal": sprite_node.get_node("Normal").visible = true
		"indiferente": sprite_node.get_node("Indiferente").visible = true
		"feliz": sprite_node.get_node("Feliz").visible = true


func _mostrar_letra_por_letra(label):
	for i in range(label.get_total_character_count()):
		label.visible_characters = i
		if i % 3 == 0:  # cada 3 letras para que no sature
			sonido_texto.play()
		await get_tree().create_timer(velocidad).timeout


func _input(event):
	if event.is_action_pressed("ui_accept"):
		# Verificar que no sea el espacio
		if Input.is_key_pressed(KEY_SPACE):
			return
			
		var entrada = dialogo[indice]
		if entrada[0] == "INPUT":
			_guardar_nombre()
			return
		if entrada[0] == "EJERCICIO_PREGUNTA":
			if esperando_respuesta:
				_procesar_ejercicio_pregunta(entrada[1])
				return
			else:
				_siguiente_dialogo()
				return
		_siguiente_dialogo()


func _guardar_nombre():
	var line = $"../Nombre/LineEditNombre"
	nombre_jugador = line.text.strip_edges()
	if nombre_jugador == "":
		return
	line.visible = false
	_siguiente_dialogo()


func _procesar_ejercicio_pregunta(respuesta_esperada: String):
	var line = $"../Nombre/LineEditNombre"
	var respuesta = line.text.to_lower().strip_edges()
	line.visible = false
	esperando_respuesta = false  # ← ahora el siguiente ENTER avanzará

	var label = $Saludo
	var nombre_label = $"../Nombre/Cnombre"
	var sprite_node = $"../../Personajes/Instrutora"
	nombre_label.text = "Ins. Marcela"

	if respuesta.find(respuesta_esperada.to_lower()) != -1:
		puntaje += 1
		_aplicar_expresion(sprite_node, "feliz")
		label.clear()
		label.append_text("¡Correcto, " + nombre_jugador + "! La respuesta es: " + respuesta_esperada + ". ")
	else:
		_aplicar_expresion(sprite_node, "indiferente")
		label.clear()
		label.append_text("No exactamente. La respuesta era: " + respuesta_esperada + ". ¡Sigue adelante! ")

	label.visible_characters = -1
	# No llama _siguiente_dialogo() aquí
	# El jugador presiona ENTER para continuar


func _on_consola_completada(fue_correcto: bool):
	if en_ejercicios and fue_correcto:
		puntaje += 1
	_siguiente_dialogo()


func _on_opcion_elegida(opcion: String):
	ruta_elegida = opcion
	match opcion:
		# Opciones del menú normal (ya no se usan en este flujo)
		"pregunta":
			indice = _buscar_indice("RUTA_PREGUNTA")
			indice += 1
		"terminal":
			indice = _buscar_indice("RUTA_TERMINAL")
			indice += 1
		"explicar":
			indice = _buscar_indice("RUTA_EXPLICAR")
			indice += 1
		# Opciones del menú de repaso
		"repaso_variables":
			indice = _buscar_indice("REPASO_VARIABLES")
			indice += 1
		"repaso_operadores":
			indice = _buscar_indice("REPASO_OPERADORES")
			indice += 1
		"repaso_condicionales":
			indice = _buscar_indice("REPASO_CONDICIONALES")
			indice += 1
		"repaso_ciclos":
			indice = _buscar_indice("REPASO_CICLOS")
			indice += 1
		"repaso_listas":
			indice = _buscar_indice("REPASO_LISTAS")
			indice += 1
		"repaso_funciones":
			indice = _buscar_indice("REPASO_FUNCIONES")
			indice += 1
		"todo_claro":
			indice = _buscar_indice("INICIO_EJERCICIOS")
			indice += 1
	_mostrar_dialogo()


func _buscar_indice(tipo):
	for i in range(dialogo.size()):
		if dialogo[i][0] == tipo:
			return i
	return dialogo.size() - 1


func _siguiente_dialogo():
	indice += 1
	if indice >= dialogo.size():
		get_tree().quit()
		return
	var entrada = dialogo[indice]
	if entrada[0] == "RUTA_PREGUNTA" or entrada[0] == "RUTA_TERMINAL" or entrada[0] == "RUTA_EXPLICAR":
		indice += 1
		if indice >= dialogo.size():
			get_tree().quit()
			return
	_mostrar_dialogo()
