class AddCountOfCommentsToGirl < ActiveRecord::Migration
  def change
    add_column :girls, :count_of_comments, :integer
  end
end
