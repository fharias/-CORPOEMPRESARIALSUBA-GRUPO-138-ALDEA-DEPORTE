class CreateLocalities < ActiveRecord::Migration[5.1]
  def change
    create_table :localities do |t|
      t.string :description,                   null: false, default: "", limit: 100
      t.timestamps null: false
    end

    add_index :localities, :description,            unique: true
  end
end
