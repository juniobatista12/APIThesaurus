from flask import Flask
from sqlalchemy import select
from models import *

app = Flask(__name__)

@app.route("/")
def index():
    return """
        <b>(GET) /comunidades: </b>Retorna uma lista com todas as comunidades<br />
        <b>(GET) /comunidades?id=<i>&lt;id&gt;</i>: </b>Retorna uma lista com todos as coleçôes da comunidade de id <i>id</i><br />
        <b>(GET) /colecoes: </b>Retorna todas as coleções<br />
        <b>(GET) /colecoes?id=<i>&lt;id&gt;</i>: </b>Retorna uma lista com todos os itens da coleção de id <i>id</i><br />
        <b>(GET) /itens: </b>Retorna uma lista com todos os itens<br />
        <b>(GET) /itens?id=<i>&lt;id&gt;</i>: </b>Retorna uma lista com todos os bitstreams do item de id <i>id</i><br />
        <b>(GET) /bitstreams: </b>Retorna uma lista com todos os bitstreams<br />
        <b>(GET) /bitstreams?id=<i>&lt;id&gt;</i>: </b>Retorna todas as informações do bitstream de id <i>id</i><br />
        <b>(DELETE) /bitstreams?id=<i>&lt;id&gt;</i>: </b>Remove o bitstream de id <i>id</i> do banco de dados
    """
    
if __name__ == "__main__":
    app.run(host="0.0.0.0")