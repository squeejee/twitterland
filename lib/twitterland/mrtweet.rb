module Twitterland
  class Mrtweet
    include HTTParty
    base_uri 'api.mrtweet.com/v1'
    format :json
    
    attr_reader :is_user, :profile, :recommendations, :most_attention_towards
    
    # get your api key at http://api.mrtweet.com/newapi
    def initialize(api_key, username)
      @username = username
      @api_key = api_key
      @is_user = self.is_user
    end
  
    # Check whether the given user is a MrTweet user (always call API)
    #
    #   Twitterland::Mrtweet.new(api_key,'bradleyjoyce').is_user
    def is_user
      Hashie::Mash.new(self.class.get("/is_user/#{@username}/#{@api_key}.json")).is_user
    end
    
    # Check whether the given user is a MrTweet user (caches first request)
    #
    #   Twitterland::Mrtweet.new(api_key,'bradleyjoyce').is_user?
    def is_user?
      @is_user ||= self.is_user
    end
    
    # Returns MrTweet statistics of the given user
    #
    #   Twitterland::Mrtweet.new(api_key,'bradleyjoyce').profile
    def profile
      if is_user?
        @profile ||= Hashie::Mash.new(self.class.get("/profile/#{@username}/#{@api_key}.json")).profile
      end
    end
    
    # Returns the latest recommendations the given user received on MrTweet
    #
    #   Twitterland::Mrtweet.new(api_key,'bradleyjoyce').recommendations
    def recommendations
      if is_user?
        @recommendations ||= Hashie::Mash.new(self.class.get("/recommendations/#{@username}/#{@api_key}.json")).recommendations
      end
    end
    
    
    # Most attention towards
    #
    #   Twitterland::Mrtweet.new(api_key,'bradleyjoyce').most_attention_towards
    def most_attention_towards
      if is_user?
        @most_attention_towards ||= Hashie::Mash.new(self.class.get("/most_attention_towards/#{@username}/#{@api_key}.json")).most_attention_towards
      end
    end
    
    # Recommend a user
    #
    #   reason = "Wynn is an awesome entrepreneur, rubyist, designer and friend! Follow him for his useful and entertaining tweets!"
    #   friend_name = "pengwynn"    
    #   Twitterland::Mrtweet.new(api_key,'bradleyjoyce').recommend(reason,friend_name)
    def recommend(reason, friend_name)
      if is_user?
        Hashie::Mash.new(self.class.post("/recommend/#{@username}/#{@api_key}.json", :body => { :reason => reason, :friend_name => friend_name})).status == "success"
      end
    end
   
  end
end