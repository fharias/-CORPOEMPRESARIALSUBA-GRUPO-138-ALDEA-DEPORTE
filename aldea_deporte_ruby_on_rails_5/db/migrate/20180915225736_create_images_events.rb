class CreateImagesEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :images_events do |t|
      t.references :image, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
