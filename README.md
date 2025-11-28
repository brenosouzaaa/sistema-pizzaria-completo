# Pizzaria Delivery - Sistema de Controle Completo

Sistema full-stack para gerenciamento de pedidos de pizzaria, desenvolvido com **Node.js** + **TypeScript**, **Express**, **PostgreSQL**, **Docker**, além de um front-end simples em **HTML**, **CSS** e **JavaScript**.
Inclui cadastro de clientes e produtos, carrinho, emissão de pedidos, comprovante, histórico, e relatórios completos.

---

# Autores

* Breno Miguel de Souza Afonso	2500998
* Nathalia Batista Munhoz	2501617
* Vanessa da Silva Santos	2520743
* Winley Jaeanty	2525564

## Tecnologias utilizadas

### Back-end

* **Node.js** (com TypeScript)
* **Express** (API REST)
* **PostgreSQL**
* **Docker & Docker Compose**

### Front-end

* **HTML**
* **CSS**
* **JavaScript**

---

## 🔹 Pré-requisitos

Instale antes de rodar o projeto:

* Node.js (v18+)
* Docker
* Docker Compose
* Git (opcional)

---

## 🔹 Como rodar o projeto

### **1. Entrar na pasta do projeto**

```bash
git clone https://github.com/brenosouzaaa/sistema-pizzaria-completo.git

cd sistema-pizzaria-completo

code .
```

### **2. Criar o arquivo `.env`**

Crie um arquivo na raiz com:

```
PGHOST=localhost
PGUSER=postgres
PGPASSWORD=senha
PGDATABASE=pizzaria
PGPORT=5432

```

O conteúdo deve corresponder ao `docker-compose.yml`.

---

### **3. Subir o banco de dados (Docker)**

```bash
docker-compose up -d
```

Verificar se está rodando:

```bash
docker ps
```

Como tem que aparecer:

```bash
CONTAINER ID   IMAGE         COMMAND                  CREATED          STATUS          PORTS    
                                     NAMES
77c4bdb712ae   postgres:15   "docker-entrypoint.s…"   34 seconds ago   Up 17 seconds   0.0.0.0:5432->5432/tcp, [::]:5432->5432/tcp   postgres_pizzaria
```
Iniciar o banco de dados com tabelas e produtos padrão:

```bash
docker exec -i postgres_pizzaria psql -U postgres -d pizzaria < init_db.sql
```

---

### **4. Instalar dependências**

```bash
npm install
```

---

### **5. Rodar o servidor (back-end)**

Como o projeto usa TypeScript, execute:

```bash
npx ts-node server.ts
```

Ou, se usar um script no package.json:

```bash
npm start
```

Se tudo estiver certo, aparecerá:

```
Servidor rodando em http://localhost:3000
```

---

### **6. Abrir o front-end**

O servidor já entrega os arquivos HTML automaticamente.

Abra no navegador:

```
http://localhost:3000/pizza.html
```

Ou:

* /produtos.html
* /carrinho.html
* /pedidos.html
* /relatorios.html

---

## 🔹Funcionalidades

👥 Clientes

* Cadastrar clientes
* Editar e excluir
* Buscar cliente
* Listar todos

🍕 Produtos

* Cadastrar produtos
* Editar e excluir
* Listar todos
* Categorias (Pizzas, Bebidas, Outros)

🛒 Carrinho & Pedidos

* Adicionar itens
* Editar quantidades
* Remover itens
* Finalizar pedido
* Formas de pagamento
* Troco
* Emissão de comprovante

📁 Relatórios

* Vendas por período
* Produtos mais vendidos
* Clientes que mais compraram
* Histórico completo de pedidos

---

## 🔹 Dicas úteis

### Reiniciar banco do zero:

```bash
docker-compose down -v
docker-compose up -d
```

### Acessar o banco via terminal:

```bash
docker exec -it <nome_do_container> psql -U postgres -d pizzaria
```

### Build do TypeScript:

```bash
npm run build
npm start
```

---

## 📂 Estrutura do projeto (real)

```
sistema-pizzaria-main/
├─ frontend/
│  ├─ pizza.html
│  ├─ produtos.html
│  ├─ carrinho.html
│  ├─ pedidos.html
│  ├─ relatorios.html
│  └─ styles.css
│
├─ ts/
│  └─ db.ts
│
├─ server.ts
├─ docker-compose.yml
├─ dockerfile



├─ init_db.sql
├─ package.json
├─ tsconfig.json
└─ .env
```
