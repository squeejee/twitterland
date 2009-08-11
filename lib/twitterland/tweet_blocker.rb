module Twitterland
  class TweetBlocker
    include HTTParty
    base_uri 'http://tweetblocker.com/api'
    format :json

    def self.user(username)
      @result ||= Mash.new(self.get("/username/#{username}.json")).user
    end
    
    def self.report_spam(username)
      status = Mash.new(self.get("/spam/#{username}.json"))
      status['error'].blank? ? status : status['error']
    end
    
    def self.rate_limit
      @rate_limit = Mash.new(self.get("/user/rate_limit_status.json"))
    end
  end
end