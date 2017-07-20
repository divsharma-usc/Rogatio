class CreateCreateFollowMappings < ActiveRecord::Migration
  def change
    create_table :create_follow_mappings do |t|
      t.integer :follower_id
      t.integer :followee_id
      t.timestamps null: false
    end
  end
end
