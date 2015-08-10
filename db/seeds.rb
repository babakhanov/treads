require 'seeder'
Tread.destroy_all
User.destroy_all
Seeder.many_users
Seeder.add_user
Seeder.create_treads

