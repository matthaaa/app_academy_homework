class CreateHousesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :name
    end
  end
end
