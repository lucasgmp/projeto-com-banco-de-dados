from main import BaseModel
from fastapi import FastAPI, HTTPException

app = FastAPI()
class LoginUser(BaseModel):
    email: str
    senha: str
@app.post("/user/login")

def login_user(user: LoginUser):
        email = user.email
        senha = user.senha

        email_correto = "test@email.com"
        senha_correta = "123456"
        if email != email_correto or senha != senha_correta:
            raise HTTPException(status_code=404, detail="Credenciais inválidas")
        return {"message": "Login bem-sucedido!"}