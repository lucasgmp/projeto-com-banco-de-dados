create table usuario(
id SERIAL primary key,
login VARCHAR(50),
senha VARCHAR(30),
status BOOLEAN DEFAULT TRUE
);
insert into usuario(login,senha,status)
values('lgmp','47','nulo');
select * from usuario;
create table produto(
id serial Primary key,
nome char(50),
descricao char(50),
preco int(50),
);
insert into produto(nome,descricao,preco)
values ();
select * from produto;

