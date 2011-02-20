class User < ActiveRecord::Base
  include Clearance::User
  
  # gotta make those extra fields accessible, yo!
  attr_accessible :email,
                  :password,
                  :url
  
  
  validates_presence_of   :url
  validates_format_of     :url,
    :with => /^[A-Za-z0-9-]+$/,
    :message => 'The profile url can only contain alphanumeric characters and dashes.',
    :allow_blank => true
  validates_uniqueness_of :url, 
    :case_sensitive => false
  validates_exclusion_of  :url, 
    :in => %w(  home  ),
    :message => "The profile url <strong>{{value}}</strong> is reserved and unavailable."
    
    
  has_and_belongs_to_many :albums
  
  def wanted_albums
    return self.albums.find(:all, :conditions => "wanted = true")
  end
      
  def owned_albums
    return self.albums.find(:all, :conditions => "owned = true")
  end
end
