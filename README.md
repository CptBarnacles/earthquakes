

# README for the app name > #
Ruby 2.5.1  Rails 5.2.1
A live version is deployed on Heroku, and can be accessed using the following link:

https://sleepy-anchorage-64633.herokuapp.com/



## running the application locally ##
Run bundle installIf the sqlite3 database isn't already present, then seed the database using:
rake tables:seed (or other commands as required)
rake products:seed



Access the application using:http://localhost:3000
Group Members

Alex Whyatt (t05aw19)



## These are the parts that are not working correctly ##


I tried to integrate sessions helper for mobile users to provide a more responsive GUI:

> def mobile_device?
>  	if session[:mobile_param]
>  		session[:mobile_param] == "1"
>  	else
>  		request.user_agent =~ /Mobile|webOS/
>  	end
>  end

>  helper_method :mobile_device?

Unfortunately, recieved countless errors when I would try and place it into layouts/application.html.erb


I also tried to implement some kind of RSS feed but after trying many gems to get it to work, came up with only the first entry in the xml sheet:

>feed = Feedjira.parse(xml)
>	  feed.entries.first.title
