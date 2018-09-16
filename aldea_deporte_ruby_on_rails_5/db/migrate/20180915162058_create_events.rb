class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :description,              null: false, default: "",limit: 255
      t.date :date,                       null: false, default: ""
      t.string :age_limit,                null: false, default: "",limit: 50
      t.string :status,                   null: false, default: "",limit: 50

      t.references :user,                 null: false, foreign_key: true
      t.references :headquarter,          null: false, foreign_key: true
      t.references :sport_category,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
