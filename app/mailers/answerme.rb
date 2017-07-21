class Answerme < ApplicationMailer
	def answer_me user
		@user=user
		mail(to:@user.email,subject:'Your Question has get respond')
	end
end
