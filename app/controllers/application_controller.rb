class ApplicationController < ActionController::Base

   def feed# This is my method for creation of a relevant rss feed
	  require 'feedjira'
	  require 'httparty'

	  url = "http://earthquakes.bgs.ac.uk/feeds/WorldSeismology.xml"
	    
	  xml = HTTParty.get(url).body

	  feed = Feedjira.parse(xml)
	  feed.entries.first.title #this parses the most recent earthquake but I would have liked it to show the first several
   end

  helper_method :feed


  private

#This was my partial attempt at mobile user sessions for a more responsive GUI.
#I left it in because it wasn't hurting anybody
  def mobile_device?
  	if session[:mobile_param]
  		session[:mobile_param] == "1"
  	else
  		request.user_agent =~ /Mobile|webOS/
  	end
  end

  helper_method :mobile_device?

end
