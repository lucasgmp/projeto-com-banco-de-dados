from model.connection import base,engine
from model.user import User

tables = [User._table_,]
base.metadata.drop_all(bind=engine, tables=tables)
base.metadata.create_all(bind=engine)
print("Tables created successfully.")