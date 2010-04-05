module Twitterland
  class Twinfluence
    include HTTParty
    base_uri 'twinfluence.com'
    format :xml
    
    def initialize(username, password)
      @username = username
      @password = password
    end
  
    # Get Twinfluence analysis of a user
    #
    #   Twitterland::Twinfluence.new(username,password)
    def user(id, cacheonly=true)
      Hashie::Mash.new Twinfluence.post("/api_user.php", :body => {:id => id, :user => @username, :pwd => @password, :cacheonly => cacheonly})
    end
    
    # Search Twinfluence users
    #
    # possible options:
    #  des: description
    #  loc: location
    #  sort, limit, minfollows
    #
    #   Twitterland::Twinfluence.search(username,password)
    def search(id, options={})
      Hashie::Mash.new Twinfluence.post("/api_search.php", :body => {:user => @username, :pwd => @password}.merge(options))
    end
  
  end
end