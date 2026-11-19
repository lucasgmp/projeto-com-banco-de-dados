
from fastapi import FastAPI,HTTPException
from pydantic import BaseModel  
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

class LoginData(BaseModel):
    email: str
    senha: str
@app.post("/login")
def login(dados: LoginData):
    email = dados.email
    senha = dados.senha

    email_correto = "test@email.com"
    senha_correta = "123456"
    if email != email_correto or senha != senha_correta:
        raise HTTPException(status_code=404, detail="Credenciais inválidas")
    return {"message": "Login bem-sucedido!"}  
@app.get("/texto")
def texto():
    return {"message": "Olá, mundo!"}

 
