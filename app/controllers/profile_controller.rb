class ProfileController < ApplicationController
  
  
  def profile
    
    @profile_owner = User.find_by_url(params[:url])
    
    
  end
  
end
