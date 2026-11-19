from sqlalchemy import Column, Integer, String, boolean
from connection import base

class Produto(base):
    _tablename_ = "produtos"

    id = Column(Integer,primary_key=True,index=True)
    name = Column(String,unique=True,nullable=False)
    description = Column(String,nullable=False)
    price = Column(Integer,nullable=False)
    status = Column(boolean,default=True,nullable=False)