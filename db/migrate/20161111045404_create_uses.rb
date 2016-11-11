class CreateUses < ActiveRecord::Migration[5.0]
  def change
    create_table :uses do |t|
      t.string :secret
      t.string :dbuse

      t.timestamps
    end
  end
end
