from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI()
class conexao(BaseModel):
    info: str
    info: str
@app.get("")
def recebemento_dados_get():
    return
@app.post("")
def envio_dados_post(  ):
    return