class Earthquake < ApplicationRecord
	paginates_per 10
	#This is the kaminari gem which allows scrolling through large quantities of data
end
