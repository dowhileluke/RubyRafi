require 'socket'

class IRCConnection
	def initialize settings 
		defaults = {
			:server => 'irc.freenode.net',
			:port => 6667,
		}

		@settings = defaults.merge settings
		@connection = TCPSocket.new(@settings[:server], @settings[:port])

		send "NICK #{@settings[:nickname]}"
		send "USER #{@settings[:nickname]} 0 * :#{@settings[:nickname]}"
		send "JOIN #{@settings[:channel]}"
	end

	def send message 
		@connection.puts message

		puts "<< #{message}" # debug
	end

	def get
		loop {
			message = @connection.gets

			if message =~ /^PING/i
				send "PONG #{message.split(' ')[1]}"
			else
				return message
			end
		}
	end
end