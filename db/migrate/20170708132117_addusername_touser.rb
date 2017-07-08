class AddusernameTouser < ActiveRecord::Migration
  def change
  	add_column: user, :username, :string, null: false
  end
end
