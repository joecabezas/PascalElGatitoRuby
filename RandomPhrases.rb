require 'yaml'
require './Configuration.rb'

class RandomPhrases

	@phrases = YAML.load_file(Configuration.data[:files][:random_phrases])

	def self.get
		@phrases.sample
	end
end
