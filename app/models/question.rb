class Question < ActiveRecord::Base
	belongs_to :user
	validates :question,presence: true
end