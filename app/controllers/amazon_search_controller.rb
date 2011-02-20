# http://blog.nofail.de/2010/07/asin-vs-ruby-aaws/
require 'amazon/aws'
require 'amazon/aws/search'
include Amazon::AWS
include Amazon::AWS::Search

class AmazonSearchController < ApplicationController

  def index
    is = ItemSearch.new('Books', {'Keywords' => 'Ruby Programming'})
    req = Request.new
    rg = ResponseGroup.new( 'Large' )
    
    @item = req.search( is, rg )
  end
end





