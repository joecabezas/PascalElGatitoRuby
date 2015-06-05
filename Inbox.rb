require 'yaml'
require './Config.rb'

class Inbox

	@data = nil

	def self.enqueue(message, media_url)
		data.push({message: message, media_url: media_url})
		flush
		data
	end

	def self.dequeue
		result = data.shift
		flush
		result
	end

	private

	def self.flush
		File.write(Config.data[:files][:inbox], data.to_yaml)
		data.to_yaml
	end

	def self.data
		return @data unless @data.nil?

		@data = if File.exists? (Config.data[:files][:inbox])
			YAML.load_file(Config.data[:files][:inbox])
		else
			[]
		end
	end

end
