class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :description,              null: false, default: ""
      t.date :date,                       null: false, default: ""
      t.string :age_limit,                null: false, default: ""
      t.string :status,                   null: false, default: ""

      t.references :user,                 foreign_key: true
      t.references :headquarter,          foreign_key: true
      t.references :sport_category,        foreign_key: true

      t.timestamps
    end
  end
end
