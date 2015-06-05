require './RandomPhrases.rb'
require './Inbox.rb'

class Trigger

	def self.trigger
		message = get_message
		media_url = get_media_url

		Inbox.enqueue(message, media_url)
	end

	private
	def self.get_message
		RandomPhrases.get
	end

	def self.get_media_url
		'image.gif'
	end
end
