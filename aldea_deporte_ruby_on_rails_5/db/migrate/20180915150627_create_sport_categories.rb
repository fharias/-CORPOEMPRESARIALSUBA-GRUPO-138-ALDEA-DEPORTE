class CreateSportCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :sport_categories do |t|
      t.string :description,                   null: false, default: "", limit: 50
      t.timestamps null: false
    end

    add_index :sport_categories, :description,            unique: true
  end
end
