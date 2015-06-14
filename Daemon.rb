require 'daemons'
require './Main.rb'

options =
{
	log_output: true,
	backtrace: true,
	monitor: true,
	multiple: false,
}

Daemons.run_proc('Daemon.rb', options) do
	puts "Daemon started"
	Dir.chdir(File.dirname(__FILE__)) do
		main = Main.new
		main.wait
	end
end
