class CreateImagesHeadquarters < ActiveRecord::Migration[5.1]
  def change
    create_table :images_headquarters do |t|
      t.references :image, foreign_key: true
      t.references :headquarter, foreign_key: true

      t.timestamps
    end
  end
end
