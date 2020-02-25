class ApplicationController < ActionController::Base

   def feed
	  require 'feedjira'
	  require 'httparty'

	  url = "http://earthquakes.bgs.ac.uk/feeds/WorldSeismology.xml"
	    
	  xml = HTTParty.get(url).body

	  feed = Feedjira.parse(xml)
	  feed.entries.first.title
   end

  helper_method :feed


  private

=begin
  def mobile_device?
  	if session[:mobile_param]
  		session[:mobile_param] == "1"
  	else
  		request.user_agent =~ /Mobile|webOS/
  	end
  end

  helper_method :mobile_device?
=end
end
