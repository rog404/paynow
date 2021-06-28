
# Paynow 
![Badge](https://img.shields.io/github/languages/top/rog404/paynow)


Plataforma de pagamento básica apenas para estudos.

Atualmente o sistema contem:

* [x] Login de Usuário (Admin/Employeer)
* [x] Cadastro de Empresas
* [x] Cadastro de Modelo de Pagamento
* [x] Cadastro de Métodos de Pagamento para Empresas cadastradas
* [x] Cadastro de Produtos
* [x] Vizualização de Clientes
* [x] Vizualização de Pagamentos Pendentes
* [x] Vizualização de Pagamentos Pendentes
* [x] API de Criação de Clientes
* [x] API Consulta Cobranças Pendentes/Aprovadas
* [x] API Emissão de Cobrança  
## Instalação 

- Requisitos: ruby 3.0.1 & rails 6.1.3.2

Use comando bundle & yarn dentro da pasta raíz

```bash 
  cd paynow
  bundle
  yarn
```
Use os comandos para a criação do banco de dados

```bash
rails db:create db:migrate
```

Caso queira gerar dados para melhor vizualização

```bash
rails db:seed
```


  
## Gems utilizadas

 [rspec](https://github.com/rspec/rspec-rails) & [capybara](https://github.com/teamcapybara/capybara) - para testes;
 
 [device](https://github.com/heartcombo/devise) - para autenticação
 

  
## API Reference

#### Mostrar todos os clientes

```http
  GET /api/v1/clients
```
- 200 - OK (retorna array json com clientes `retorna vazio se não tiver clientes`)
 
#### Criar clientes

```http
  POST /api/v1/clients
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `name`      | `string` | **Required**. Nome do Cliente |
| `cpf`      | `string` | **Required**. CPF do Cliente (único) |
  
  - 201 - Criado (retorna json com token do cliente criado)
  - 412 / 422 (retorna array json com erros)
  
 #### Ligar Cliente a determinada Empresa

```http
  POST /api/v1/company_clients
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `cpf`  | `string` | **Required**. CPF do Cliente (único) |
| `nome`  | `string` | **Required**. Nome do Cliente |
| `company_token` | `string` | **Required**. Token da Empresa |
  
  - 201 - Criado (retorna json com token do cliente criado `caso o cliente ainda não for gerado ele cria o cliente e faz a ligação com a empresa`)
  - 412 / 422 (retorna array json com erros)
  
  #### Visualizar Cobreça pelo Token

```http
  POST /api/v1/payment_orders/#{token}
```
  
  - 200 - OK (retorna json com informações da cobrança)
  - 404 (se não encontrar)
  
   #### Emissão de Cobrança

```http
  POST /api/v1/payment_orders
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `company_token`  | `string` | **Required**. Token da Empresa |
| `payment_method_token`  | `string` | **Required**. Token do Método de pagamento |
| `product_token` | `string` | **Required**. Token da Produto |
| `client_token` | `string` | **Required**. Token da Cliente |
  
  - 201 - Criado (retorna json com a cobrança criada)
  - 412 / 422 (retorna array json com erros)
  
## Roadmap (Próximas Features)

- Auditoria de edições



## Contribuições

Contribuições são sempre bem vindas!

Entre em contato para saber como ajudar.

  
  
## FAQ

#### O projeto está finalizado?

Não. ainda está em desenvolvimento

#### Onde aprendeu a desenvolver esse software?

Aprendi no [TreinaDev](https://treinadev.com.br)

  
## Autor

- [@roger404](https://github.com/rog404)

  
