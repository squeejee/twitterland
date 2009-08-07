module Twitterland
  class Mrtweet
    include HTTParty
    base_uri 'api.mrtweet.com/v1'
    format :json
    
    attr_reader :is_user
    
    def initialize(api_key, username)
      @username = username
      @api_key = api_key
      @is_user = self.is_user
    end
  
    def is_user
      Mash.new(self.class.get("/is_user/#{@username}/#{@api_key}.json")).is_user
    end
    
    def is_user?
      @is_user
    end
    
    def profile
      if is_user?
        Mash.new(self.class.get("/profile/#{@username}/#{@api_key}.json")).profile
      end
    end
    
    def recommendations
      if is_user?
        Mash.new(self.class.get("/recommendations/#{@username}/#{@api_key}.json")).recommendations
      end
    end
    
    def most_attention_towards
      if is_user?
        Mash.new(self.class.get("/most_attention_towards/#{@username}/#{@api_key}.json")).most_attention_towards
      end
    end
    
    def recommend(reason, friend_name)
      if is_user?
        Mash.new(self.class.post("/recommend/#{@username}/#{@api_key}.json", :body => { :reason => reason, :friend_name => friend_name})).status == "success"
      end
    end
   
  end
end