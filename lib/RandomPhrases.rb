require 'yaml'

class RandomPhrases

	FILE_NAME = 'random_phrases.yaml'
	@phrases = YAML.load_file(FILE_NAME)

	def self.get
		@phrases.sample
	end
end
