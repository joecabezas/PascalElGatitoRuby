require './Trigger.rb'
require 'pi_piper'
include PiPiper

class Main

	PIN_SENSOR = 17
	PIN_BUZZER = 18

	att_reader :pin_sensor, :pin_buzzer

	def initialize
		setup
	end

	def setup
		#setup GPIO here
		@pin_sensor = PiPiper::Pin.new(:pin => PIN_SENSOR, :direction => :in, :pull => :up)
		@pin_buzzer = PiPiper::Pin.new(:pin => PIN_BUZZER, :direction => :out)

		after ({pin: @pin_sensor.pin, goes: :high}) do
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
