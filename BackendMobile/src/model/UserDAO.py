from model.user import User

class UserDAO:
    def _init__(self, db):
        self.db = db

    def create_user(self, user: User):
        self.db.add(user)
        self.db.commit()
        self.db.refresh(user)
        return (user)
    def read_user_by_id(self, id:int):
        return self.db.query(User).filter(User.id == id).first()
    def read_user_by_name(self, name:str):
        return self.db.query(User).filter(User.name == name).first()
    def update(self, id: int, user: User):
        user_bd = self.get_user_by_id(id)
        if user_bd is None:
            return None
        user_bd.name = user.name
        user_bd.password = user.password
        user_bd.role = user.role
        user_bd.status = user.status

        self.db.commit()
        
        self.db.refresh(user_bd)
        return user_bd
    def delete(self, id: int):
        user = self.get.user_by_id(id)
        if user is None:
            return None
        self.db.delete(user)
        self.db.commit()
        return True
    
