module Twitterland

  class BackTweets
    include HTTParty
    base_uri 'backtweets.com'
    format :json

    # Return tweet referencing a URL
    # Get your api_key at http://www.backtype.com/developers
    #
    #   Twitterland::BackTweets.search('http://squeejee.com', 'OU812')
    def self.search(q, api_key, options={})
      options['itemsperpage'] = options.delete(:items_per_page) if options[:items_per_page]
      rubyize_response(Hashie::Mash.new(get("/search.json", :query => {:q => q, :key => api_key}.merge(options))))
    end


    # Scrubs the response from Back Tweets to rubyize keys
    def self.rubyize_response(response)
      results = Hashie::Mash.new
      raise BackTweets::Unauthenticated.new if response.has_key?('error')
      results.total_results = response['totalresults'].to_i
      results.start_index = response['startindex']
      results.items_per_page = response['itemsperpage']
      results.tweets = response['tweets'].map do |tweet|
        new_tweet = Hashie::Mash.new
        tweet.each do |key, value|
          new_tweet[key.to_s.gsub('tweet_', '')] = value
        end
        new_tweet
      end
      results
    end
    private_class_method :rubyize_response
  end

  class BackTweets::Unauthenticated < Exception
  end
end
