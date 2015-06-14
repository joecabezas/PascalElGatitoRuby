require 'yaml'
require 'fileutils'
require './Configuration.rb'
require './TwitterJob.rb'

class Inbox

	@data = nil

	def self.enqueue(message, media_url)
		data.push( TwitterJob.new(message, media_url) )
		flush
		data
	end

	def self.dequeue
		result = data.shift
		flush

		#remove image
		FileUtils.rm(result.media_url)

		result
	end

	def self.peek
		data.first	
	end

	private

	def self.flush
		File.write(Configuration.data[:files][:inbox], data.to_yaml)
		data.to_yaml
	end

	def self.data
		return @data unless @data.nil?

		@data = if File.exists? (Configuration.data[:files][:inbox])
			YAML.load_file(Configuration.data[:files][:inbox])
		else
			[]
		end
	end

end
