require 'yaml'

class Config

	CONFIG_FILE = 'config/config.yaml'

	@data = nil

	def self.data
		return @data unless @data.nil?

		@data = if File.exists? (CONFIG_FILE)
			YAML.load_file(CONFIG_FILE)
		else
			{}
		end
	end
end
