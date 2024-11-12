* __CREATE__  para criar 'Banco de dados' ou 'Tabelas'
* __ALTER__ para adicionar ou modificar colunas
* __DROP__ para remover 'Banco de dados' ou 'Tabelas'
* __INSERT__ para adicionar registros na tabela
* __UPDATE__ para atualizar os registros
* __DELETE__ para remover os registros 
* __SELECT__ para consultar e visualizar dados 


``` SQL
CREATE DATABASE biblioteca ;
USE biblioteca;
```

```SQL
CREATE TABLE editora(
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(100) NOT NULL,
    pais VARCHAR(50)
);
```

```SQL
CREATE TABLE autor(
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(200),
    data_nascimento DATE
);
```

```SQL
CREATE TABLE assunto(
    id_assunto INT PRIMARY KEY AUTO_INCREMENT,
    descricao_assunto VARCHAR (500) NOT NULL
);
```


```SQL
CREATE TABLE livro(
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL, 
    ano_publicacao INT(4),
    editora INT,
    autor INT,
    assunto INT, 
    FOREIGN KEY (editora) REFERENCES editora(id_editora),
    FOREIGN KEY (autor) REFERENCES autor(id_autor),
    FOREIGN KEY (assunto) REFERENCES assunto(id_assunto)
);
```

```SQL
CREATE TABLE extra(
    id INT PRIMARY KEY AUTO_INCREMENT,
    produtos VARCHAR(50) NOT NULL,
    quantidade INT(20) NOT NULL,
    preco DOUBLE NOT NULL
);
```


``` SQL
ALTER TABLE autor
ADD COLUMN email VARCHAR(100);
```

```SQL
DROP TABLE extra;
```


```SQL
INSERT INTO editora(nome_editora, pais)
VALUES 
('Editora Alfa', 'Brasil'),
('Editora Beta', 'Portugual'),
('Editora Bertrand Brasil', 'Brasil')
```

``` SQL
INSERT INTO autor (nome_autor, data_nascimento, email)
VALUES
('Jorge Amado', '1912-08-10' ,'jorginho@gmail.com'),
('Machado de Assis', '1839-06-21' ,'machadinho@gmail.com'),
('Matt Haig', '1975-06-03' ,'matt@gmail.com');
```

```SQL
INSERT INTO assunto(descricao_assunto)
VALUES 
('Ficção'),
('Mistério'),
('Terror'),
('Romance');
```

```SQL
INSERT INTO livro(titulo, ano_publicacao, editora, autor, assunto)
VALUES 
('Capitães de Areia',1937,1,1,4),
('DOM Casmurro',1899,2,2,4)
('A Biblioteca da Meia-Noite',2020,3,3,2 )
('Memórias Póstumas de Brás Cubas',1881,1,2,4);
```
 'Capitães de Areia'

```SQL
UPDATE livro
SET ano_publicacao= 1938
WHERE titulo = 'Capitães de Areia';
```

```SQL
DELETE FROM livro
WHERE id_livro = 8;
```

```SQL
SELECT  livro.titulo AS nome,
        editora.nome_editora AS editora,
        autor.nome_autor AS autor,
        assunto.descricao_assunto AS tema,
        livro.ano_publicacao AS ano
FROM livro
JOIN editora ON livro.id_editora = editora.id_editora
JOIN autor ON livro.id_autor = autor.id_autor
JOIN assunto ON livro.id_assunto = assunto.id_assunto;
```

```SQL
SELECT  livro.titulo AS titulo,
        assunto.descricao_assunto AS tema
FROM livro
JOIN assunto ON livro.assunto = assunto.id_assunto
WHERE assunto.descricao_assunto = 'Romance';
```
