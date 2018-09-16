class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :description,              null: false, default: ""
      t.string :url,                      null: false, default: ""
      t.timestamps
    end
  end
end
