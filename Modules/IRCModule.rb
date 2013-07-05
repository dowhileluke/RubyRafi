class IRCModule
	def notify message
		process message if @filter.nil? or message.body =~ @filter
	end

	def process message
	end
end
