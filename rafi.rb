require_relative 'IRCBot'
require_relative 'Modules/Example'

rafi = IRCBot.new(:nickname => 'RubyRafi', :channel => '#RubyRafi')

rafi.attach(Example.new)
rafi.run
