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
end