module Twitterland
  class TweetBlocker
    include HTTParty
    base_uri 'http://tweetblocker.com/api'
    format :json

    # Get grade for user
    #
    #   Twitterland::TweetBlocker.user('bradleyjoyce')
    def self.user(username)
      Hashie::Mash.new(self.get("/username/#{username}.json")).user
    end
    
    # Report user as spammer
    #
    #   Twitterland::TweetBlocker.spam('leetspeeker39203959230390235')
    def self.report_spam(username)
      status = Hashie::Mash.new(self.get("/spam/#{username}.json"))
      status['error'].blank? ? status : status['error']
    end
    
    
    # Check API rate limiting
    #
    #   Twitterland::TweetBlocker.rate_limit
    def self.rate_limit
      @rate_limit = Hashie::Mash.new(self.get("/user/rate_limit_status.json"))
    end
  end
end