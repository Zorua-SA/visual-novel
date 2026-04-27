# dialogos_data.gd

class_name DialogosData

static func cap_1() -> Array:
	return [
		# ── INTRODUCCIÓN ─────────────────────────────────────────
		["Ins. Marcela", "¡Hola! Bienvenido a la clase de Python. Me alegra verte por aquí. ", "feliz"],
		["Ins. Marcela", "Mi nombre es la Instructora Marcela y seré tu guía en este viaje. ", "normal"],
		["Ins. Marcela", "Antes de comenzar, necesito saber tu nombre. ", "normal"],
		["Ins. Marcela", "Por favor, escribe cómo quieres que te llame: ", "indiferente"],
		["INPUT", "", "normal"],

		# ── INTRODUCCIÓN A PYTHON ─────────────────────────────────
		["Ins. Marcela", "¡Qué bonito nombre, {nombre}! Empecemos desde el principio. ", "feliz"],
		["Ins. Marcela", "Python es uno de los lenguajes de programación más populares del mundo. ", "normal"],
		["Ins. Marcela", "Fue creado por Guido van Rossum en 1991 y su filosofía es ser simple y legible. ", "normal"],
		["Ins. Marcela", "Es usado en inteligencia artificial, ciencia de datos, desarrollo web y mucho más. ", "normal"],
		["Ins. Marcela", "Para mostrar un mensaje en pantalla simplemente escribes: ", "normal"],
		["Ins. Marcela", "[code]print('Hola Mundo')[/code] ", "normal"],

		# ── TEMA 1: VARIABLES ─────────────────────────────────────
		["Ins. Marcela", "El primer concepto son las *variables*. ", "normal"],
		["Ins. Marcela", "Imagina que una variable es como una caja con una etiqueta. ", "normal"],
		["Ins. Marcela", "La etiqueta es el nombre y dentro guardas información. ", "normal"],
		["Ins. Marcela", "En Python puedes guardar distintos tipos de datos: ", "normal"],
		["Ins. Marcela", "Números enteros:\n[code]edad = 20[/code] ", "normal"],
		["Ins. Marcela", "Números decimales:\n[code]precio = 9.99[/code] ", "normal"],
		["Ins. Marcela", "Texto o strings:\n[code]nombre = 'Ana'[/code] ", "normal"],
		["Ins. Marcela", "Booleanos verdadero o falso:\n[code]aprobado = True[/code] ", "normal"],
		["Ins. Marcela", "Los nombres de variables no pueden tener espacios, usa guion bajo: ", "indiferente"],
		["Ins. Marcela", "[code]nombre_completo = 'Ana López'[/code] ", "normal"],

		# ── TEMA 2: OPERADORES ────────────────────────────────────
		["Ins. Marcela", "El siguiente tema son los *operadores*. ", "feliz"],
		["Ins. Marcela", "Los operadores nos permiten hacer cálculos y comparaciones. ", "normal"],
		["Ins. Marcela", "Suma y resta:\n[code]resultado = 5 + 3\nresultado = 10 - 4[/code] ", "normal"],
		["Ins. Marcela", "Multiplicación y división:\n[code]resultado = 6 * 7\nresultado = 15 / 3[/code] ", "normal"],
		["Ins. Marcela", "División entera y módulo:\n[code]resultado = 17 // 3\nresiduo = 17 % 3[/code] ", "normal"],
		["Ins. Marcela", "Potencia:\n[code]resultado = 2 ** 8[/code] ", "normal"],
		["Ins. Marcela", "Los operadores de comparación devuelven True o False: ", "normal"],
		["Ins. Marcela", "[code]5 == 5\n5 != 3\n10 > 5\n4 <= 4[/code] ", "normal"],

		# ── TEMA 3: CONDICIONALES ─────────────────────────────────
		["Ins. Marcela", "Ahora hablemos de las *condicionales*, {nombre}. ", "feliz"],
		["Ins. Marcela", "Las condicionales permiten que tu programa tome decisiones. ", "normal"],
		["Ins. Marcela", "La estructura básica usa if, elif y else: ", "normal"],
		["Ins. Marcela", "[code]edad = 18\nif edad >= 18:\n    print('Mayor de edad')\nelse:\n    print('Menor de edad')[/code] ", "normal"],
		["Ins. Marcela", "El elif nos permite verificar múltiples condiciones: ", "normal"],
		["Ins. Marcela", "[code]nota = 75\nif nota >= 90:\n    print('Excelente')\nelif nota >= 70:\n    print('Aprobado')\nelse:\n    print('Reprobado')[/code] ", "normal"],
		["Ins. Marcela", "Recuerda: en Python la indentación es obligatoria. Los espacios importan. ", "indiferente"],

		# ── TEMA 4: CICLOS ────────────────────────────────────────
		["Ins. Marcela", "Sigamos con los *ciclos* o bucles, {nombre}. ", "feliz"],
		["Ins. Marcela", "Un ciclo repite una acción muchas veces sin escribirla múltiples veces. ", "normal"],
		["Ins. Marcela", "El ciclo for repite un número determinado de veces: ", "normal"],
		["Ins. Marcela", "[code]for i in range(5):\n    print('Hola')[/code] ", "normal"],
		["Ins. Marcela", "También puedes recorrer una lista con for: ", "normal"],
		["Ins. Marcela", "[code]frutas = ['manzana', 'pera', 'uva']\nfor fruta in frutas:\n    print(fruta)[/code] ", "normal"],
		["Ins. Marcela", "El ciclo while repite mientras una condición sea verdadera: ", "normal"],
		["Ins. Marcela", "[code]contador = 0\nwhile contador < 5:\n    print(contador)\n    contador += 1[/code] ", "normal"],
		["Ins. Marcela", "Cuidado: si la condición del while nunca se vuelve falsa, el ciclo no termina. ", "indiferente"],

		# ── TEMA 5: LISTAS ────────────────────────────────────────
		["Ins. Marcela", "Ahora veamos las *listas*, {nombre}. Son muy usadas en Python. ", "feliz"],
		["Ins. Marcela", "Una lista es una colección ordenada de elementos que puedes modificar. ", "normal"],
		["Ins. Marcela", "Se crean con corchetes:\n[code]numeros = [1, 2, 3, 4, 5][/code] ", "normal"],
		["Ins. Marcela", "Accedes a cada elemento por su posición, que empieza en 0: ", "normal"],
		["Ins. Marcela", "[code]frutas = ['manzana', 'pera', 'uva']\nprint(frutas[0])[/code] ", "normal"],
		["Ins. Marcela", "Eso imprimiría 'manzana' porque está en la posición 0. ", "normal"],
		["Ins. Marcela", "Puedes agregar, eliminar y contar elementos: ", "normal"],
		["Ins. Marcela", "[code]frutas.append('naranja')\nfrutas.remove('pera')\nprint(len(frutas))[/code] ", "normal"],

		# ── TEMA 6: FUNCIONES ─────────────────────────────────────
		["Ins. Marcela", "El último tema de hoy son las *funciones*, {nombre}. ", "feliz"],
		["Ins. Marcela", "Una función es un bloque de código reutilizable que realiza una tarea específica. ", "normal"],
		["Ins. Marcela", "Se definen con def seguido del nombre y paréntesis: ", "normal"],
		["Ins. Marcela", "[code]def saludar():\n    print('Hola, bienvenido!')[/code] ", "normal"],
		["Ins. Marcela", "Las funciones pueden recibir parámetros y devolver resultados con return: ", "normal"],
		["Ins. Marcela", "[code]def sumar(a, b):\n    return a + b\n\nresultado = sumar(5, 3)\nprint(resultado)[/code] ", "normal"],
		["Ins. Marcela", "Las funciones hacen tu código más ordenado, legible y reutilizable. ", "feliz"],

		# ── MENÚ DE REPASO ────────────────────────────────────────
		["Ins. Marcela", "¡Hemos cubierto todos los temas fundamentales, {nombre}! ", "feliz"],
		["Ins. Marcela", "Antes de los ejercicios, ¿quedó todo claro o quieres repasar algo? ", "normal"],
		["REPASO", "", "normal"],

		# ── REPASOS POR TEMA ──────────────────────────────────────
		["REPASO_VARIABLES", "", "normal"],
		["Ins. Marcela", "Claro, repasemos las *variables*. ", "feliz"],
		["Ins. Marcela", "Una variable es un espacio en memoria donde guardamos información. ", "normal"],
		["Ins. Marcela", "Puedes guardar números, texto, decimales o booleanos: ", "normal"],
		["Ins. Marcela", "[code]edad = 20\nnombre = 'Ana'\nprecio = 9.99\naprobado = True[/code] ", "normal"],
		["Ins. Marcela", "El nombre va a la izquierda y el valor a la derecha del signo igual. ", "normal"],
		["FIN_REPASO", "", "normal"],

		["REPASO_OPERADORES", "", "normal"],
		["Ins. Marcela", "Repasemos los *operadores*. ", "feliz"],
		["Ins. Marcela", "Los aritméticos son: + suma, - resta, * multiplicación, / división. ", "normal"],
		["Ins. Marcela", "También tenemos // división entera, % residuo y ** potencia. ", "normal"],
		["Ins. Marcela", "Los de comparación como ==, !=, >, < devuelven True o False. ", "normal"],
		["FIN_REPASO", "", "normal"],

		["REPASO_CONDICIONALES", "", "normal"],
		["Ins. Marcela", "Repasemos las *condicionales*. ", "feliz"],
		["Ins. Marcela", "El if ejecuta código solo si la condición es verdadera. ", "normal"],
		["Ins. Marcela", "El else se ejecuta cuando la condición del if es falsa. ", "normal"],
		["Ins. Marcela", "El elif permite verificar múltiples condiciones en orden. ", "normal"],
		["Ins. Marcela", "Recuerda siempre indentar el código dentro de cada bloque. ", "indiferente"],
		["FIN_REPASO", "", "normal"],

		["REPASO_CICLOS", "", "normal"],
		["Ins. Marcela", "Repasemos los *ciclos*. ", "feliz"],
		["Ins. Marcela", "El for repite un bloque un número fijo de veces usando range(). ", "normal"],
		["Ins. Marcela", "El while repite mientras una condición sea verdadera. ", "normal"],
		["Ins. Marcela", "Siempre asegúrate que el while tenga una condición que eventualmente sea falsa. ", "indiferente"],
		["FIN_REPASO", "", "normal"],

		["REPASO_LISTAS", "", "normal"],
		["Ins. Marcela", "Repasemos las *listas*. ", "feliz"],
		["Ins. Marcela", "Una lista guarda múltiples elementos entre corchetes separados por comas. ", "normal"],
		["Ins. Marcela", "Los índices empiezan en 0, así que el primer elemento es lista[0]. ", "normal"],
		["Ins. Marcela", "Usa append para agregar, remove para eliminar y len para contar elementos. ", "normal"],
		["FIN_REPASO", "", "normal"],

		["REPASO_FUNCIONES", "", "normal"],
		["Ins. Marcela", "Repasemos las *funciones*. ", "feliz"],
		["Ins. Marcela", "Se definen con def, un nombre y paréntesis con los parámetros que necesite. ", "normal"],
		["Ins. Marcela", "Usa return para que la función devuelva un resultado. ", "normal"],
		["Ins. Marcela", "Llamar una función es escribir su nombre seguido de paréntesis. ", "normal"],
		["FIN_REPASO", "", "normal"],

		# ── EJERCICIOS ────────────────────────────────────────────
		["INICIO_EJERCICIOS", "", "normal"],
		["Ins. Marcela", "¡Perfecto, {nombre}! Ahora pon a prueba lo que aprendiste. ", "feliz"],
		["Ins. Marcela", "Responde con atención, cada respuesta cuenta. ¡Tú puedes! ", "normal"],

		["Ins. Marcela", "Pregunta 1 de 6: ¿Cómo se llama el espacio en memoria donde guardamos información en Python? ", "indiferente"],
		["EJERCICIO_PREGUNTA", "variable", "normal"],

		["Ins. Marcela", "Pregunta 2 de 6: ¿Qué función usamos para mostrar texto en pantalla? ", "indiferente"],
		["EJERCICIO_PREGUNTA", "print", "normal"],

		["Ins. Marcela", "Pregunta 3 de 6: ¿Qué palabra clave usamos para crear una condición en Python? ", "indiferente"],
		["EJERCICIO_PREGUNTA", "if", "normal"],

		["Ins. Marcela", "Pregunta 4 de 6: ¿Qué ciclo usamos cuando sabemos cuántas veces repetir algo? ", "indiferente"],
		["EJERCICIO_PREGUNTA", "for", "normal"],

		["Ins. Marcela", "Ejercicio 5 de 6: Crea una variable llamada edad con el valor 25. ", "indiferente"],
		["EJERCICIO_CONSOLA", "edad = 25", "normal"],

		["Ins. Marcela", "Ejercicio 6 de 6: Usa print para mostrar el mensaje Hola Mundo. ", "indiferente"],
		["EJERCICIO_CONSOLA", "print('Hola Mundo')", "normal"],

		# ── RESULTADO FINAL ───────────────────────────────────────
		["RESULTADO_FINAL", "", "normal"],
		["Ins. Marcela", "¡Has completado todos los ejercicios, {nombre}! ", "feliz"],
		["Ins. Marcela", "Aquí está tu resultado final: ", "normal"],
		["MOSTRAR_PUNTAJE", "", "normal"],
		["Ins. Marcela", "Aprendiste los pilares fundamentales de Python. ¡Excelente trabajo! ", "feliz"],
		["Ins. Marcela", "En la próxima lección veremos diccionarios, clases y manejo de archivos. ", "normal"],
		["Ins. Marcela", "Esta ha sido la DEMO v1 del juego interactivo. ¡Hasta la próxima, {nombre}! ", "feliz"],
	]
