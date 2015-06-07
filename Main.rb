require 'daemons'
require './Trigger.rb'

require 'pi_piper'
include PiPiper

class Main

	att_reader :pin_sensor, :pin_buzzer

	def initialize
		setup
	end

	def setup
		#setup GPIO here
		@pin_sensor = PiPiper::Pin.new(:pin => 17, :direction => :in, :pull => :up)
		@pin_buzzer = PiPiper::Pin.new(:pin => 18, :direction => :out)

		
		after {pin: @pin_sensor.pin, goes: :high} do
			sensor_activated
		end
	end

	def sensor_activated
		Trigger.trigger
	end

	def wait
		PiPiper.wait
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
	main.wait
end
