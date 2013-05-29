class AddAvailableTodayToGirl < ActiveRecord::Migration
  def change
    add_column :girls, :available_today, :boolean
  end
end
