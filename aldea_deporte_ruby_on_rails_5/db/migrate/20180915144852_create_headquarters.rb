class CreateHeadquarters < ActiveRecord::Migration[5.1]
  def change
    create_table :headquarters do |t|
      t.string :description,             null: false, default: "", limit: 255
      t.string :status,                  null: false, default: "", limit: 50
      t.string :address,                 null: false, default: "", limit: 255
      t.string :latitude,                null: false, default: "", limit: 45
      t.string :longitude,               null: false, default: "", limit: 45
      t.references :localities,          null: false, foreign_key: true
      t.timestamps null: false
    end

    add_index :headquarters, :description,            unique: true
  end
end
