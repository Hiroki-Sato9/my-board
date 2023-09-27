class AddActivatedToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :activated, :boolean, default: true
  end
end
