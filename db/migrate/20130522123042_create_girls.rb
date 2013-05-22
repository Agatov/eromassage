class CreateGirls < ActiveRecord::Migration
  def change
    create_table :girls do |t|
      t.string :name
      t.string :avatar
      t.integer :age
      t.integer :bubs
      t.integer :height
      t.integer :weight
      t.text :about

      t.timestamps
    end
  end
end
