class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :description,              null: false, default: "",limit: 100
      t.string :url,                      null: false, default: "",limit: 255
      t.timestamps
    end
  end
end
