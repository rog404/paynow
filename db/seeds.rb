# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Payment.create(description: 'Pix :D', fee: 0.2, max_money_fee: 5, payment_type: :pix)
Payment.create(description: 'Boleto do Roxinho', fee: 1.2, max_money_fee: 7, payment_type: :boleto)
Payment.create(description: 'Cartão do Laranjinha', fee: 3.2, max_money_fee: 12, payment_type: :card)

company = Company.create(cnpj: '87470788000188', name: 'Codeplay cursos online LTDA', email: 'faturamento@codeplay.com.br', address: 'Av. Dutra, 4563, São Paulo - SP')

Pix.create(payment: Payment.first, key: '12hjk12312j3h', bank_code: '132', company: company)
CreditCard.create(payment: Payment.find(3), code: '12321312')
