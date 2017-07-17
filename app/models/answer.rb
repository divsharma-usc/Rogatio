class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :upvote, as: :upvoteable,dependent: :destroy
end
