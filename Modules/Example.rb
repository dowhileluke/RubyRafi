require_relative 'IRCModule'

class Example < IRCModule
	def initialize
		@filter = /\bdemo\b/i
	end

	def process message
		'I respond to the word demo!'
	end
end
