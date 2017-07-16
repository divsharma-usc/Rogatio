class UpvoteController<ApplicationController
	before_action :authenticate_user!
	def upvote
		 @upvote=Upvote.where(upvoteable_id:Question.find(params[:question]).id,user_id:current_user.id,upvoteable_type:"question").first
		 if @upvote
			 @upvote.destroy!
			 @is_upvoted=false
	     else
	    	 Upvote.create(upvoteable_id:Question.find(params[:question]).id,user_id:current_user.id,upvoteable_type:"question")
	    	 @is_upvoted=true
	    end
	     @question_id=params[:question].to_i
		respond_to do |format|
		format.js{
	    }
	    end
	end
	def upvote_answer
		 @upvote=Upvote.where(upvoteable_id:Answer.find(params[:answer]).id,user_id:current_user.id,upvoteable_type:"answer").first
		 if @upvote
			 @upvote.destroy!
			 @is_upvoted=false
			 answer=Answer.where(id:params[:answer].to_i).first
	    	 answer.upvotecount=answer.upvotecount.to_i-1;
	    	 answer.save!
	     else
	    	 Upvote.create(upvoteable_id:Answer.find(params[:answer]).id,user_id:current_user.id,upvoteable_type:"answer")
	    	 @is_upvoted=true
	    	 answer=Answer.where(id:params[:answer].to_i).first
	    	 answer.upvotecount=answer.upvotecount.to_i+1;
	    	 answer.save!
	    end
	    @answer_id=params[:answer].to_i
		respond_to do |format|
		format.js{
	    }
	    end
	end
end