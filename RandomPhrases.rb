require 'yaml'
require './Config.rb'

class RandomPhrases

	@phrases = YAML.load_file(Config.data[:files][:random_phrases])

	def self.get
		@phrases.sample
	end
end
