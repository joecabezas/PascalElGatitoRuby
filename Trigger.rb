require './RandomPhrases.rb'
require './Inbox.rb'
require './TwitterSender.rb'

class Trigger

	def self.trigger
		Inbox.enqueue(message, media_url)
		TwitterSender.check
	end

	private
	def self.message
		RandomPhrases.get
	end

	def self.media_url
		'image.gif'
	end
end
