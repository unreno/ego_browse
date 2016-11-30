# Load the Rails application.
require_relative 'application'



Rails.application.configure do
	config.active_record.time_zone_aware_types = [:datetime, :time]
end



# Initialize the Rails application.
Rails.application.initialize!
