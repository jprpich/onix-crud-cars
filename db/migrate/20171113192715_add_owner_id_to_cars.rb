class AddOwnerIdToCars < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :owner_id, :integer
  end
end
