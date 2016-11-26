class CreateStudTs < ActiveRecord::Migration[5.0]
  def change
    create_table :stud_ts do |t|
      t.integer :test_id
      t.integer :user_id
      t.integer :mark
      t.integer :option
      t.string :answer

      t.timestamps
    end
  end
end
