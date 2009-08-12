module Twitterland
  class FollowCost
    include HTTParty
    base_uri 'followcost.com'
    format :json
  
    # Get follow cost for specified user
    #
    #   Twitterland::FollowCost.show('bradleyjoyce')
    def self.show(username)
      Mash.new get("/#{username}.json")
    end
  
  end
end