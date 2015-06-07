require 'twitter'
require './Inbox.rb'
require './TwitterJob.rb'
require './Config.rb'

class TwitterSender

	def self.check
		#get job from inbox
		job = Inbox.peek or return

		#try to send	
		begin
			client.update_with_media(job.message, open(job.media_url))
		rescue
			#could not send twitter
			puts "failed: #{$!}"
			return
		end

		#twitter sent, delete from pending jobs
		Inbox.dequeue
	end
	
	private

	@client = nil
	def self.client
		if @client.nil?
			@client = Twitter::REST::Client.new do |config|
				config.consumer_key        = Config.data[:twitter][:consumer_key]
				config.consumer_secret     = Config.data[:twitter][:consumer_secret]
				config.access_token        = Config.data[:twitter][:access_token]
				config.access_token_secret = Config.data[:twitter][:access_token_secret]
			end
		else
			@client
		end
	end
end
