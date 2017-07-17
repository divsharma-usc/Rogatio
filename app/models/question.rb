class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answer,dependent: :destroy
	has_many :upvote, as: :upvoteable,dependent: :destroy
	validates :question,presence: true
end
