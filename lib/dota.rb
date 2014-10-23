require_relative 'dota/version'
require_relative 'dota/client'

module Dota
  extend SingleForwardable

  def_delegators :client, :configure, :match, :history, :leagues, :live_leagues, :profiles, :bans, :friends

  def self.client
    @client ||= Client.new
  end
    
end

Dota.configure do |config|
  config.api_key = '4071DAA91D8719B6D7C0EA6DF5DF413E'
end


player = {player_name: 'magicaljyy'}

history = Dota.history(player)
if history
  match = history.matches[0]
  puts match
else
  puts 'No Data'
end



