module Twitterland
  class FollowCost
    include HTTParty
    base_uri 'followcost.com'
    format :json
  
    def self.show(username)
      Mash.new get("/#{username}.json")
    end
  
  end
end