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
		#TwitterSender.check
	end

	private
	def self.message
		RandomPhrases.get
	end

	def self.media_url
		dir = File.dirname(__FILE__)

		command = "sh #{dir}/#{SCRIPT_NAME}"
		command = (command + " -a") if Configuration.data[:options][:animated_output]

		output = Open3.popen3(command) do |stdin, stdout, stderr, wait_thr|
			puts stderr.read
			stdout.read
		end

		original_filename = [dir, output.strip].join("/")
		extension = File.extname(original_filename)

		img_dir = [dir, IMAGE_FOLDER].join("/")
		Dir.mkdir(img_dir) unless File.exists?(img_dir)

		destination = [img_dir, Time.now.strftime("%Y-%m-%d-%H-%M-%S") + extension].join("/")
		puts "original_filename: #{original_filename}"
		puts "destination: #{destination}"
		FileUtils.mv(original_filename, destination)

		destination
	end
end
