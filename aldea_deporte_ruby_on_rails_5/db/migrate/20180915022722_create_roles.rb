class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name,                   null: false, default: "", limit: 45
      t.timestamps null: false
    end

    add_index :roles, :name,            unique: true
  end
end
