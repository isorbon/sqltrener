class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.string :name
      t.string :description
      t.string :password
      t.timestamps :start_t
      t.timestamps
    end
  end
end
