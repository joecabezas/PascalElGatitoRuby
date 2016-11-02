Dir.chdir(File.dirname(__FILE__)) do
	require './TwitterSender.rb'

	puts "#{File.dirname(__FILE__)}: Checking pending jobs"
	TwitterSender.check
end
