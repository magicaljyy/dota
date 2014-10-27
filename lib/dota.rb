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


player = {
  'account_id' => 110286334,
  'matches_requested' => 20
}
#profile = Dota.profiles(110286334+76561197960265728)
#puts profile[0].raw_profile
=begin
history = Dota.history(player)
if history
  matches = history.matches
  matches.each do |basic_match|
    match = Dota.match(basic_match.id)
    match.players.each do |player|
      profile = Dota.profiles(player.id + 76561197960265728)
      if profile[0].nil?
        identity = player.id
      else
        identity =  profile[0].person_name
      end
      puts '%s: %s' % [identity, player.hero]
      puts player.items
    end
  end
else
  puts 'No Data'
end
=end
history = Dota.history(player)
if history
  matches = history.matches
  total_damage = 0
  my_damage = 0
  matches.each do |basic_match|
    match = Dota.match(basic_match.id)
    match.players.each do |player|
      if player.id == 110286334
        my_damage = player.hero_damage
      end
      if player.slot >= 128
        total_damage += player.hero_damage
      end
    end
  end
end
puts total_damage
puts my_damage
puts my_damage.to_f/total_damage


