from flask import Flask, render_template, request
import subprocess
import os

app = Flask(__name__)

# CLISP
def analizar_texto(texto):

    resultado = subprocess.run(
        ["clisp", "categorias.lisp", texto],
        capture_output=True,
        text=True
    )

    categoria = resultado.stdout.strip().replace('"', '')

    return categoria

# PROLOG
def recomendar_juegos(categoria, plataforma):

    consulta = f"""
    juego({categoria}, Nombre, {plataforma}, Imagen),
    write(Nombre),
    write('|'),
    write(Imagen),
    nl,
    fail.
    """

    resultado = subprocess.run(
        [
            "swipl", "-s", "juegos.pl", "-g", consulta, "-t", "halt"
        ],
        capture_output=True,
        text=True
    )

    lineas = resultado.stdout.strip().split("\n")

    juegos = []

    for linea in lineas:
        if "|" in linea:
            nombre, imagen = linea.split("|")
            nombre = nombre.replace("_", " ").title()

            juegos.append({"nombre": nombre, "imagen": imagen})
    return juegos

# PAGINA
@app.route("/", methods=["GET", "POST"])
def inicio():

    juegos = []

    if request.method == "POST":
        texto = request.form["texto"]
        plataforma = request.form["plataforma"]
        categoria = analizar_texto(texto)
        juegos = recomendar_juegos(categoria, plataforma)

    return render_template(
        "index.html",
        juegos=juegos,
        texto=texto if request.method == "POST" else "",
        plataforma=plataforma if request.method == "POST" else ""
    )


# INICIAR SERVIDOR
if __name__ == "__main__":

    app.run(
        host="0.0.0.0",
        port=int(os.environ.get("PORT", 10000))
    )
