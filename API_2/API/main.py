from models import *
from sqlalchemy import create_engine
from sqlalchemy.orm import Session

engine = create_engine("mysql+pymysql://root:avmb123@localhost/poc")

objetos = {
    "Jogos": {
        "FPS": {
            "Doom": {
                "instalador": "doom.exe",
                "thumbnail": "doom.jpg",
                "icone": "doom.ico"
            },
            "007 - GoldenEye":{
                "instalador": "goldeneyen64.exe",
                "thumbnail": "goldeneye.jpg",
                "icone": "goldeneye.ico"
            }
        },
        "Soulslike": {
            "The Surge": {
                "instalador": "thesurge.exe",
                "thumbnail": "thesurge.png",
                "icone": "thesurge.ico"
            },
            "Elden Ring":{
                "instalador": "eldenring.exe",
                "thumbnail": "eldenring.png",
                "icone": "eldenring.ico"
            }
        }
    },
    "Animes": {
        "Shonen": {
            "Naruto": {
                "trailer": "naruto.mp4",
                "wallpapper": "naruto.gif",
                "thumbnail" : "naruto.png"
            },
            "One Piece":{
                "trailer": "weare.mp4",
                "wallpapper": "nami.gif",
                "thumbnail": "goingMerry.png"
            }
        },
    },
    "Filmes": {
        "Terror": {
            "Marcas da maldição": {
                "trailer": "marcas.mp4",
                "fichaTecnica": "marcas.txt",
                "thumbnail": "marcas.png"
            },
            "Mestre dos desejos": {
                "trailer": "mestreDosDesejos.mp4",
                "fichaTecnica": "mestreDosDesejos.html",
                "thumbnail": "mestreDosDesejos.png"
            }
        },
        "Comédia": {
            "Borat": {
                "trailer": "borat.mxf",
                "fichaTecnica": "borat.html",
                "thumbnail": "borat.jpg"
            }
        }
    }
}

with Session(engine) as session:
    for comunidade in objetos:
        comunidadeTmp = Comunidades(nome = comunidade)
        for colecao in objetos[comunidade]:
            comunidadeTmp.colecoes.append(Colecoes(nome = colecao))
            for item in objetos[comunidade][colecao]:
                comunidadeTmp.colecoes[-1].itens.append(Itens(nome = item))
                for bitstream in objetos[comunidade][colecao][item]:
                    comunidadeTmp.colecoes[-1].itens[-1].bitstreams.append(Bitstreams(nomeArquivo = objetos[comunidade][colecao][item][bitstream], pacote = bitstream))
        session.add(comunidadeTmp)
        session.commit()
    