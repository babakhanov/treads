require 'seeder'
User.destroy_all
Seeder.many_users
Seeder.add_user

