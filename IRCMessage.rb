class IRCMessage
	attr_reader :sender, :command, :body

	def from_raw message
		sender, @command, @channel, @body = message.split(' ', 4).collect{|arg| arg.gsub(/^:/, '').strip}
		@sender = sender.split('!')[0] if sender.include? '!'
		@channel = @sender unless @channel.include? '#'

		return self
	end

	def reply response
		"PRIVMSG #{@channel} :#{response}" unless @channel.nil? or response.empty?
	end
end
