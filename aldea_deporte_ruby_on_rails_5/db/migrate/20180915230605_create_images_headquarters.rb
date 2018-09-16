class CreateImagesHeadquarters < ActiveRecord::Migration[5.1]
  def change
    create_table :images_headquarters do |t|
      t.references :image,       null: false, foreign_key: true
      t.references :headquarter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
