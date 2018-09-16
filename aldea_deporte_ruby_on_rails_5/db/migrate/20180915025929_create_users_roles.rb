class CreateUsersRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :users_roles do |t|
      t.references :user, foreign_key: true, null: false 
      t.references :role, foreign_key: true, null: false 

      t.timestamps
    end
  end
end
