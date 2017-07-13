class HomeController < ApplicationController
  def index
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
end

