require 'fileutils'
require 'open3'
require './RandomPhrases.rb'
require './Inbox.rb'
require './TwitterSender.rb'
require './Configuration.rb'

class Trigger

	IMAGE_FOLDER = "img"
	SCRIPT_NAME = "take_picture.sh"

	def self.trigger
		Inbox.enqueue(message, media_url)
		TwitterSender.check
	end

	private
	def self.message
		RandomPhrases.get
	end

	def self.media_url
		command = "sh #{SCRIPT_NAME}"
		command = (command + " -a") if Configuration.data[:options][:animated_output]

		output = Open3.popen3(command) do |stdin, stdout, stderr, wait_thr|
			puts stderr.read
			stdout.read
		end

		original_filename = output.strip
		extension = File.extname(original_filename)

		Dir.mkdir(IMAGE_FOLDER) unless File.exists?(IMAGE_FOLDER)

		destination = [IMAGE_FOLDER, Time.now.strftime("%Y-%m-%d-%H-%M-%S") + extension].join("/")
		puts "original_filename: #{original_filename}"
		puts "destination: #{destination}"
		FileUtils.mv(original_filename, destination)

		destination
	end
end
