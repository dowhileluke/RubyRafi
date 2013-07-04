require_relative 'IRCConnection'
require_relative 'IRCMessage'

class IRCBot
	def initialize settings
		@settings = settings
		@modules = []
	end

	def attach observer
		@modules.push observer
	end

	def run
		connection = IRCConnection.new @settings

		loop {
			activity = connection.get
			# puts ">> #{activity}" # debug
			message = IRCMessage.new.from_raw(activity)

			puts "<#{message.sender}> #{message.body}" if message.sender and message.body.length > 0 # debug

			@modules.each do |observer|
				response = observer.notify(message)

				connection.send(message.reply(response)) if response
			end
		}
	end
end
