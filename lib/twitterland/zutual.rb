module Twitterland
  class Zutual
    include HTTParty
    base_uri 'http://api.zutual.com/v/1'
    format :json
  
    def self.match(first_user, second_user)
      Mash.new(get("/twitter/match/#{first_user}+#{second_user}.json")).matches
    end
  end
end