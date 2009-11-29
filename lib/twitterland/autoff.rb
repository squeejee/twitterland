module Twitterland
  class Autoff
    include HTTParty
    base_uri 'autoff.com/api'
    format :json
  
    def self.user(username)
      get("/#{username}").map{|u| u.gsub('@', '')}
    end
    
  end
end