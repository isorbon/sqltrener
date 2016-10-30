class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :login
      t.string :password
      t.string :img
      t.integer :typ

      t.timestamps
    end
  end
end
