class HomeController < ApplicationController
  before_action :authenticate_user!
  def index   
        @question=Question.new
  end
  def profile
  end
  def upload_image
  	upload_file=params[:image];
  	filename=SecureRandom.hex+"."+upload_file.original_filename.split('.')[1]
  	filepath=Dir.pwd+"/public/uploads/"+filename
  	File.open(filepath,'wb')do |file|
  	  file.write(upload_file.read())
  	end
  	current_user.profilepicture=filename
  	current_user.save!
  	return redirect_to '/home/profile'
  end
  def user
    @users=User.all
  end
  def follow
    followee_id=params[:followee_id]
    followee_id=followee_id.to_i
    @followee=User.where(:id=>followee_id).first
    @follow=current_user.can_follow followee_id
    if current_user.can_follow followee_id
        CreateFollowMapping.create(:followee_id=>followee_id,:follower_id=>current_user.id)
    elsif followee_id != current_user.id
        mapping=CreateFollowMapping.where(:followee_id=>followee_id,:follower_id=>current_user.id).first
        mapping.destroy!
    end
     respond_to do |format|
       format.js{ }
     end
  end
end
