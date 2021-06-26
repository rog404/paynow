module LoginMacros
    def user_login(user = User.create!(name: 'Rogerio', email: 'rogerio@paynow.com.br', password: '123456'))
        login_as user
        user
    end
    
    def admin_login(user = User.create!(name: 'Rogerio', email: 'rogerio@paynow.com.br', password: '123456'))
        login_as user
        user
    end
end