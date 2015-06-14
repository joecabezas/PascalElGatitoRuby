require 'fileutils'
require 'open3'
require './RandomPhrases.rb'
require './Inbox.rb'
require './TwitterSender.rb'
require './Configuration.rb'

class Trigger

	IMAGE_FOLDER = "img"

	def self.trigger
		Inbox.enqueue(message, media_url)
		#TwitterSender.check
	end

	private
	def self.message
		RandomPhrases.get
	end

	def self.media_url
		command = "sh take_picture.sh"
		(command + " -a") if Configuration.data[:options][:animated_output]
		output = Open3.popen3(command) { |stdin, stdout, stderr, wait_thr| stdout.read }

		original_filename = output.strip
		extension = File.extname(original_filename)

		Dir.mkdir(IMAGE_FOLDER) unless File.exists?(IMAGE_FOLDER)

		destination = "#{IMAGE_FOLDER}/#{Time.now.strftime("%Y-%m-%d-%H-%M-%S")}#{extension}"
		FileUtils.mv(original_filename, destination)
	end
end

Trigger.media_url
