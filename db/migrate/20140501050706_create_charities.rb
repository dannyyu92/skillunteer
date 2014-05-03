class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name
      t.string :link
      t.text :mission

      t.timestamps
    end
  end
end
