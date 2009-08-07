module Twitterland
  class Twinfluence
    include HTTParty
    base_uri 'twinfluence.com'
    format :xml
    
    def initialize(username, password)
      @username = username
      @password = password
    end
  
    def user(id, cacheonly=true)
      Mash.new Twinfluence.post("/api_user.php", :body => {:id => id, :user => @username, :pwd => @password, :cacheonly => cacheonly})
    end
    
    # possible options:
    #  des: description
    #  loc: location
    #  sort, limit, minfollows
    def search(id, options={})
      Mash.new Twinfluence.post("/api_search.php", :body => {:user => @username, :pwd => @password}.merge(options))
    end
  
  end
end