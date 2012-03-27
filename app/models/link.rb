class Link < ActiveRecord::Base
	def self.todays_links
		Link.find(:all, :conditions => [" created_at between ? AND ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day])
	end
end
