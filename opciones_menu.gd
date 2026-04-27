# opciones_menu.gd
extends Control

signal opcion_elegida(opcion)

@onready var label_pregunta = $Panel/VBoxContainer/LabelPregunta
@onready var contenedor = $Panel/VBoxContainer

func _ready():
	visible = false

# ── Menú normal (ya no se usa en este flujo pero se mantiene) ──
func iniciar():
	_limpiar_botones()
	label_pregunta.text = "¿Cómo quieres continuar? "
	_agregar_boton("📝 Quiero que me hagas una pregunta ", "pregunta")
	_agregar_boton("💻 Quiero probar la terminal ", "terminal")
	_agregar_boton("🤔 No entendí bien, explícame de nuevo ", "explicar")
	visible = true

# ── Menú de repaso ─────────────────────────────────────────────
func iniciar_repaso():
	_limpiar_botones()
	label_pregunta.text = "¿Qué tema quieres repasar? "
	_agregar_boton("📦 Variables ", "repaso_variables")
	_agregar_boton("➕ Operadores ", "repaso_operadores")
	_agregar_boton("🔀 Condicionales ", "repaso_condicionales")
	_agregar_boton("🔁 Ciclos ", "repaso_ciclos")
	_agregar_boton("📋 Listas ", "repaso_listas")
	_agregar_boton("⚙️ Funciones ", "repaso_funciones")
	_agregar_boton("✅ Ya entendí todo, ir a ejercicios ", "todo_claro")
	visible = true

# ── Helpers ────────────────────────────────────────────────────
func _limpiar_botones():
	for child in contenedor.get_children():
		if child is Button:
			child.queue_free()

func _agregar_boton(texto: String, opcion: String):
	var btn = Button.new()
	btn.text = texto
	btn.pressed.connect(func(): _on_boton_presionado(opcion))
	contenedor.add_child(btn)

func _on_boton_presionado(opcion: String):
	visible = false
	emit_signal("opcion_elegida", opcion)
