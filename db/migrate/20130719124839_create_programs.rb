class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :title
      t.text :description
      t.text :preview_description
      t.integer :duration_cd
      t.integer :price, default: 0
      t.integer :girls_count, default: 0
      t.string :image

      t.timestamps
    end
  end
end
