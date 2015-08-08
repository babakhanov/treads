class CreateTreads < ActiveRecord::Migration
  def change
    create_table :treads do |t|

      t.timestamps null: false
    end
  end
end
