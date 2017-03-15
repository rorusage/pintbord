class AddLikeAmountToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :like_amount, :integer, default: 0
  end
end
