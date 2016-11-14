class CreateUses < ActiveRecord::Migration[5.0]
  def change
    create_table :uses do |t|
      t.string :db_base
      t.string :db_shadow
      t.timestamps
    end
  end
end
