class AddActionIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :action_id, :integer
  end
end
