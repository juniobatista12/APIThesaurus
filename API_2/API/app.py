from flask import Flask, request
from sqlalchemy import select,create_engine
from sqlalchemy.orm import Session
from models import *
import json

app = Flask(__name__)

def connectDb():
    engine = create_engine("mysql+pymysql://root:avmb123@database/poc")
    return Session(engine)

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
    
@app.route("/comunidades")
def getComunidades():
    id = request.args.get("id", default=-1, type=int)
    with connectDb() as session:
        if id == -1:
            comunidades = session.query(Comunidades)
            resposta = []
            for row in comunidades:
                resposta.append({"id": row.idcomunidades, "comunidade": row.nome})
        else:
            colecoes = session.query(Colecoes).join(Comunidades, Comunidades.idcomunidades == Colecoes.comunidades_idcomunidades).filter(Comunidades.idcomunidades == id)
            resposta = []
            for row in colecoes:
                resposta.append({"id": row.idcolecoes, "colecao": row.nome})
    return json.dumps(resposta)
    
if __name__ == "__main__":
    app.run(host="0.0.0.0")