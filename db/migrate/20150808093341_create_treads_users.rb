class CreateTreadsUsers < ActiveRecord::Migration
  def change
    create_table :treads_users, :id => false do |t|
      t.references :tread, :user
    end

    add_index :treads_users, [:tread_id, :user_id],
      name: "treads_users_index",
      unique: true
  end
end
