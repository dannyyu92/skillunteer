class AddZipcodeToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :zipcode, :integer
  end
end
