from sqlalchemy import Column, Integer, String, boolean
from connection import base

class User(base):
    _tablename_ = "users"

    id = Column(Integer,primary_key=True,index=True)
    name = Column(String,unique=True,nullable=False)
    password = Column(String,nullable=False)
    role = Column(String,nullable=False)
    status = Column(boolean,default=True,nullable=False)
