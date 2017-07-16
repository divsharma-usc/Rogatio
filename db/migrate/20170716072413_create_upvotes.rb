class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :count
      t.references :upvoteable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
