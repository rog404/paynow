pix_payment = Payment.create!(description: 'Pix :D', fee: 0.2, max_money_fee: 5, payment_type: :pix)
pix_payment_disabled = Payment.create!(description: 'Pix Desativado', fee: 0.2, max_money_fee: 5, payment_type: :pix, state: :disabled)
boleto_payment = Payment.create!(description: 'Boleto do Roxinho', fee: 1.2, max_money_fee: 7, payment_type: :boleto)
Payment.create!(description: 'Boleto Desativado', fee: 1.2, max_money_fee: 7, payment_type: :boleto, :disabled)
credit_card_payment = Payment.create!(description: 'Cartão do Laranjinha', fee: 3.2, max_money_fee: 12, payment_type: :card)
Payment.create!(description: 'Cartão Desativado', fee: 3.2, max_money_fee: 12, payment_type: :card, :disabled)

company = Company.create!(cnpj: '28348439000129', name: 'CAMPUS CODE SERVICOS E CONSULTORIA DE INFORMATICA LTDA', email: 'contato@campuscode.com.br', address: 'Alameda Santos, 1293. Jardim paulista, São Paulo - SP')
company2 = Company.create!(cnpj: '29030862000149', name: 'UDEMY, INC', email: 'bizdev@udemy.com', address: 'Rua Capitão Antonio Rosa, 409. Vila Madalena, São Paulo - SP')

method_pix = Pix.create!(payment: pix_payment, key: '12hjk12312j3h', bank_code: '132', company: company)
Pix.create!(payment: pix_payment_disabled, key: '12hjk12j3213h', bank_code: '103', company: company)
method_boleto = Boleto.create!(payment: boleto_payment, bank_code: '132', bank_agency: '31081', bank_account: '554352', company: company)
CreditCard.create!(payment: credit_card_payment, code: '12321312', company: company)
Boleto.create!(payment: boleto_payment, bank_code: '102', bank_agency: '3131', bank_account: '4215', company: company2)

client = Client.create!(name: 'Rogerio Bordignon', cpf: '01770967214')
