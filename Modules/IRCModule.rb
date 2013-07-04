class IRCModule
	def notify message
		if @filter.nil? or message.body =~ @filter
			process message
		end
	end

	def process message
	end
end
