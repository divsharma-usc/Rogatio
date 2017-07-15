class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answer
	validates :question,presence: true
end
