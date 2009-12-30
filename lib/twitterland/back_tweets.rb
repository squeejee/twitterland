module Twitterland
  class BackTweets
    include HTTParty
    base_uri 'backtweets.com'
    format :json
  
    # Return tweet referencing a URL
    # Get your api_key at http://www.backtype.com/developers
    # 
    #   Twitterland::BackTweets.search('http://squeejee.com', 'OU812')
    def self.search(q, api_key, items_per_page=25, page=1, since_id=0)
      rubyize_response(Mash.new(get("/search.json", :query => {:q => q, :key => api_key, :itemsperpage => items_per_page, :page => page, :since_id => since_id})))
    end
    
    
    # Scrubs the response from Back Tweets to rubyize keys
    def self.rubyize_response(response)
      results = Mash.new
      results.total_results = response['totalresults'].to_i
      results.start_index = response['startindex']
      results.items_per_page = response['itemsperpage']
      results.tweets = response['tweets'].map do |tweet|
        new_tweet = Mash.new
        tweet.each do |key, value|
          new_tweet[key.to_s.gsub('tweet_', '')] = value
        end
        new_tweet
      end
      results
    end
    private_class_method :rubyize_response
  end
end