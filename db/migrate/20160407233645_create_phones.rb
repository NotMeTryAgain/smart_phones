class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :manufacturer, null: false
      t.string :screen_size, null: false
      t.string :charging_port, null: false
      t.string :phone_name, null: false
      t.integer :quantity, null: false
      t.belongs_to :operating_system, null: false
    end
  end
end
