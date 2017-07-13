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
    if current_user.can_follow followee_id
        CreateFollowMapping.create(:followee_id=>followee_id,:follower_id=>current_user.id)
    else
    end
    return redirect_to '/user'
  end
  def unfollow
    followee_id=params[:followee_id]
    if current_user.can_un_follow followee_id
        mapping=CreateFollowMapping.where(:followee_id=>followee_id,:follower_id=>current_user.id).first
        mapping.destroy;
    else
    end
    return redirect_to '/user'
  end
end

