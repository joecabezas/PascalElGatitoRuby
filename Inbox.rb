require 'yaml'

class Inbox

	FILE_NAME = 'inbox.yaml'
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
		File.write(FILE_NAME, data.to_yaml)
		data.to_yaml
	end

	def self.data
		return @data unless @data.nil?

		@data = if File.exists? (FILE_NAME)
			YAML.load_file(FILE_NAME)
		else
			[]
		end
	end

end
