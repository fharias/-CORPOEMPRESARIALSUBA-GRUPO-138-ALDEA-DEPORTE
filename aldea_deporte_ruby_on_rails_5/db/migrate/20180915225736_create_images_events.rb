class CreateImagesEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :images_events do |t|
      t.references :image, foreign_key: true
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
