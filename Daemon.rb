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
	main = Main.new
	main.wait
end
