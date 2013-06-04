class AddEyesToGirl < ActiveRecord::Migration
  def change
    add_column :girls, :eyes, :string
  end
end
