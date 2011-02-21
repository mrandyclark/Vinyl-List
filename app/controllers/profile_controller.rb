require 'digest/md5'

class ProfileController < ApplicationController
  
  
  def profile
    
    @profile_owner = User.find_by_url(params[:url])
    
    # let's use the gravatar system for icons
    gravatar_hash = Digest::MD5.hexdigest(@profile_owner.email)
    @gravatar_src = "http://www.gravatar.com/avatar/#{gravatar_hash}"
    
    @owned_albums = @profile_owner.owned_albums
    @wanted_albums = @profile_owner.wanted_albums
  end
  
end
