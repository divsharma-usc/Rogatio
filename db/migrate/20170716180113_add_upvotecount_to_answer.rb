class AddUpvotecountToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :upvotecount, :integer
  end
end
