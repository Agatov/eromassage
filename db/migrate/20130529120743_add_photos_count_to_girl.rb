class AddPhotosCountToGirl < ActiveRecord::Migration
  def change
    add_column :girls, :photos_count, :integer, default: 0
  end
end
