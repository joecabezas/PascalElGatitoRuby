class TwitterJob

	attr_reader :message, :media_url

	def initialize(message, media_url)
		@message = message
		@media_url = media_url
	end
end
