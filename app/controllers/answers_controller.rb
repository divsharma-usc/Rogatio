class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]
  def newans
    @answer=Answer.new
  end
  def ans
    respond_to do |format|
      format.js{
        @questionid=params["question"].to_i
      }
    end
  end 
  def answers_show
    @answers=Answer.where(question_id:params["question_id"].to_i)
  end
  def readextra
       respond_to do |format|
       format.html{}
       format.js{
         @ans_id=params["answer_id"]
         @answertext=Answer.where(id:params["answer_id"].to_i).first
        }
     end
  end
  def create
    @answer = Answer.new(answer_params)
        respond_to do |format|
      if @answer.save
        Answerme.answer_me(@answer.question.user).deliver
        format.html { redirect_to '/newquestions', notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to '/home/profile', notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:ans, :question_id,:user_id,:answer_id)
    end
end
