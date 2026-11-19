from model.produto import Produto

class ProdutoDAO:
    def __init__(self, db):
        self.db = db

    def create_produto(self, produto: Produto):
        self.db.add(produto)
        self.db.commit()
        self.db.refresh(produto)
        return produto

    def read_produto_by_id(self, id: int):
        return self.db.query(Produto).filter(Produto.id == id).first()

    def read_produto_by_name(self, name: str):
        return self.db.query(Produto).filter(Produto.name == name).first()

    def update(self, id: int, produto: Produto):
        produto_bd = self.read_produto_by_id(id)
        if produto_bd is None:
            return None
        produto_bd.name = produto.name
        produto_bd.description = produto.description
        produto_bd.price = produto.price
        produto_bd.status = produto.status

        self.db.commit()
        
        self.db.refresh(produto_bd)
        return produto_bd

    def delete(self, id: int):
        produto = self.read_produto_by_id(id)
        if produto is None:
            return None
        self.db.delete(produto)
        self.db.commit()
        return True