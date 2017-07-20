class CommentsController < ApplicationController
  before_action :authenticate_user!
  def docomment
  	@answerid=params[:answerid].to_i
  	respond_to do |format|
  		format.js{}
    end
  end
  def createcomment
  end
end