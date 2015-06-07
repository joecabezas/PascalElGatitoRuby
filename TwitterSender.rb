require 'twitter'
require './Inbox.rb'

class TwitterSender

	def check
		#get job from inbox
		job = Inbox.peek or return

		
	end
end
