class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answer
	has_many :upvote, as: :upvoteable
	validates :question,presence: true
end
