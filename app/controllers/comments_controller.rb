class CommentsController < ApplicationController
  before_action :authenticate_user!
  def docomment
  	@answerid=params[:answerid].to_i
    @comments=Comment.where(answer_id: params[:answerid].to_i).limit(2)
    @more=Comment.where(answer_id: params[:answerid].to_i).length>2
  	respond_to do |format|
  		format.js{}
    end
  end
  def createcomment
  	  comment=Comment.new
  	  comment.content=params[:comment]
  	  comment.user=current_user
  	  comment.answer_id=params["answer_id"].to_i
  	  comment.save!
  end
  def loadmore
      @comments=Comment.where(answer_id: params["answerid"].to_i).offset(2)
      @answerid=params["answerid"].to_i
      respond_to do |format|
        format.js{}
      end
  end
end