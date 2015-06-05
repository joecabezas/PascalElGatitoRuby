require './RandomPhrases.rb'

class Trigger

	def trigger
		message = get_message
		media_url = get_media_url
	end

	private
	def get_message
		RandomPhrases.get
	end

	def get_media_url
		'image.gif'
	end
end
