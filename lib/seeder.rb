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

  def create_treads
    current_user = User.find_by(email: "test@mail.com")
    users = User.where.not(email: "test@mail.com")
    users.each do |user|
      tread = Tread.create
      tread.users << current_user
      tread.users << user
      tread.save
      6.times do
        tread.messages.create user_id: current_user.id, text: Faker::Lorem.sentence
        tread.messages.create user_id: user.id, text: Faker::Lorem.sentence
      end
    end
  end
    
end
