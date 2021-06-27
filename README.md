
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

#### Get all clients

```http
  GET /api/v1/clients
```

#### Create client

```http
  POST /api/v1/clients
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `name`      | `string` | **Required**. Name of client |
| `cpf`      | `string` | **Required**. Cpf of client (must be unique) |
  
  
  
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

  
