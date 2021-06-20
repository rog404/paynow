
# Paynow

Plataforma de pagamento básica apenas para estudos.

Atualmente o sistema contem:

* Login de Usuário (Admin/Employeer)
* Cadastro de Empresas
* Cadastro de Modelo de Pagamento
* Cadastro de Métodos de Pagamento para Empresas cadastradas
* Cadastro de Produtos
* Vizualização de Clientes
* Vizualização de Pagamentos Pendentes

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
## Como usar?



  
## Gems utilizadas

 [rspec](https://github.com/rspec/rspec-rails) & [capybara](https://github.com/teamcapybara/capybara) - para testes;
 
 [device](https://github.com/heartcombo/devise) - para autenticação
 

  
## API (não implementado)

#### Get all items



  
## Roadmap (Próximas Features)

- Adicionar API de consultas

- Auditoria de edições

- Autorização por role nos controllers
## Contribuições

Contribuições são sempre bem vindas!

Entre em contato para saber como ajudar.

  
## FAQ

#### O projeto está finalizado?

Não. ainda estamos em desenvolvimento

#### Onde aprendeu a desenvolver esse software?

Aprendi no [TreinaDev](https://treinadev.com.br)

  
## Autor

- [@roger404](https://github.com/rog404)

  
