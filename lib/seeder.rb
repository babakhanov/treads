module Seeder extend self

  def add_user
    user = User.find_by(email: "test@mail.com")
    FactoryGirl.create(:user, email: "test@mail.com", password: "password", password_confirmation: 'password') if user.nil?
  end


  def many_users(amount = 100)
    (1..amount).each do |i|
      FactoryGirl.create(:user, email: "test#{i}@mail.com", password: "password", password_confirmation: 'password')
    end
  end
    
end
