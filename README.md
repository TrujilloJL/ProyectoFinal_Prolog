# Proyecto Final Prolog - Recomendar Videojuegos

# ¿Cómo funciona el programa?

1. El usuario escribe una descripción del tipo de juego que quiere.
2. Python recibe el texto desde una página web.
3. CLISP analiza el texto y detecta la palabra clave de una categoría.
4. Python envía la categoría a Prolog.
5. Prolog recomienda un videojuego usando las reglas.
6. Python muestra el resultado en la página web.

---

# Estructura del Proyecto

La carpeta del proyecto debe quedar organizada exactamente así:

```text
proyecto_final/
│
├── app.py
├── categorias.lisp
├── juegos.pl
├── requirements.txt
├── Dockerfile
│
├── templates/
│   └── index.html
│
├── static/
│   └── img/
```

---

# Programas Necesarios

Antes de ejecutar el proyecto instala lo siguiente:

## 1. Python

Agrega Python al PATH

Para comprobar instalación:

```bash
python --version
```

---

## 2. CLISP
Para comprobar instalación:

```bash
clisp
```

---

## 3. SWI-Prolog

Para comprobar instalación:

```bash
swipl
```

---

# Instalar librerias de Python

Abrir la terminal dentro de la carpeta del proyecto y ejecutar:

```bash
python -m pip install flask
```
---

# Verificar funcionamiento de CLISP

Ejecutar:

```bash
clisp categorias.lisp "Quiero juegos de terror"
```

Resultado esperado:

```text
terror
```

---

# Verificar funcionamiento de Prolog

Ejecutar:

```bash
swipl -s juegos.pl -g "recomienda(terror, X), write(X)" -t halt
```

Resultado esperado:

```text
resident_evil
```

---
# Aplicación en línea
Link:
https://proyectofinal-prolog.onrender.com/
# Ejecutar proyecto localmente

Dentro de la carpeta del proyecto ejecutar:

```bash
python app.py
```

Resultado esperado:

```text
Running on http://127.0.0.1:5000
```

---

# Abrir la aplicación

Abrir el navegador y entrar a:

```text
http://127.0.0.1:5000
```

---

# Ejemplo de uso

## Entrada

```text
Quiero juegos de terror
```

## Resultado

```text
resident_evil
```

---

## Entrada

```text
Quiero juegos difíciles
```

## Resultado

```text
elden_ring
```

---

# Explicación de cada archivo

## app. py

Archivo principal del proyecto.

Funciones:
- Crear servidor web con Flask
- Ejecutar CLISP
- Ejecutar Prolog
- Mostrar resultados

---

## categorias.lisp

Función:
- Analizar el texto del usuario
- Detectar categorías de videojuegos

Ejemplo:
- terror
- aventura
- rpg
- soulslike

---

## juegos. pl

Archivo desarrollado en Prolog.

Función:
- Contener reglas de recomendación

---

## index.html

Interfaz del sistema.

---

## requirements.txt

Contiene las dependencias de Python necesarias para ejecutar el proyecto.

---

## Dockerfile

Archivo utilizado para desplegar el proyecto usando Docker y Render.

---
