class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :year_of_birth
      t.boolean :alive
      t.jsonb :other_info

      t.timestamps
    end
  end
end
