require 'daemons'
require './Trigger.rb'

class Main
	def initialize
		setup
	end

	def setup
		#setup GPIO here
	end

	def gpio_activated
		Trigger.trigger
	end
end

options =
{
	log_output: true,
	backtrace: true,
	monitor: true,
	multiple: false,
}

Daemons.run_proc('Main.rb', options) do
	main = Main.new
	loop do
		sleep(0.1)
	end
end
