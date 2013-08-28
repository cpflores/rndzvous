class AddBDayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bday, :string
  end
end
