require 'pi_piper'
require './Trigger.rb'
require './Configuration.rb'

include PiPiper

class Main

	PIN_SENSOR = 4
	PIN_BUZZER = 18

	@last = nil
	@now = nil
	
	attr_reader :pin_sensor, :pin_buzzer

	def initialize
		setup
		buzz
	end

	def setup
		@pin_sensor = PiPiper::Pin.new(:pin => PIN_SENSOR, :direction => :in, :pull => :down)
		@pin_buzzer = PiPiper::Pin.new(:pin => PIN_BUZZER, :direction => :out)

		after ({pin: @pin_sensor.pin, goes: :high}) do |pin|
			sensor_activated
		end
	end

	def sensor_activated
		puts "sensor activated"
	
	        if @last.nil?
	                @last = @now = Time.now
			go
	                return
	        end
	
	        @now = Time.now
	
		delta = @now - @last
	        if delta > Configuration.data[:options][:minimum_activation_time]
			@last = @now
			go
	        else
			puts "ignoring, delta: #{delta}"
	        end
	end

	def wait
		PiPiper.wait
	end

	def buzz
		15.times do
			@pin_buzzer.on
			sleep 0.005
			@pin_buzzer.off
		end
	end

	def go
		puts "go!"
		buzz
		#Trigger.trigger
	end
end
