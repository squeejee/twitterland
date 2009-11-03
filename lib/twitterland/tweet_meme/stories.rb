module Twitterland
  module  TweetMeme
    class Stories
      include HTTParty
      base_uri 'api.tweetmeme.com/stories'
      format :json
      
      # Returns the most popular stories in the last 24 hours.
      #   parameters:
      #     (optional) count: int how many results to return per page, in the range 1-100, default 10
      #     (optional) category: string an optional category to filter results by, default none
      #     (optional) media: string a filter of media type (news/video/image) with default of all
      #     (optional) page: int the page of results you would like, in the range 1-100 with default 1
      # 
      #   Twitterland::TweetMeme::Stories.popular(options)
      def self.popular(options={})
        Mash.new get("/popular.json", :query => options)
      end
      
      # Returns the most recent stories found by TweetMeme.
      #   parameters:
      #     (optional) count: int how many results to return per page, in the range 1-100, default 10
      #     (optional) category: string an optional category to filter results by, default none
      #     (optional) media: string a filter of media type (news/video/image) with default of all
      #     (optional) page: int the page of results you would like, in the range 1-100 with default 1
      # 
      #   Twitterland::TweetMeme::Stories.recent(options)
      def self.recent(options={})
        Mash.new get("/recent.json", :query => options)
      end
      
      # Returns a list of categories down to the specified depth, optionally filtered by a parent category.
      #   parameters:
      #     (optional) filter: string a string to filter the categories by (default is empty string)
      #     (optional) depth: int the depth of categories to return (range 1-10, default 1)
      # 
      #   Twitterland::TweetMeme::Stories.categories(options)
      def self.categories(options={})
        Mash.new get("/categories.json", :query => options)
      end
      
      # Returns 10 tweets for the specified URL.
      #   parameters:
      #     url: string the URL of the page you want tweets for
      #     from_id: int the last Tweet ID you have (it will return tweets after but not including this Tweet ID)
      # 
      #   Twitterland::TweetMeme::Stories.tweets(url, from_id)
      def self.tweets(url, from_id=0)
        Mash.new get("/tweets.json", :query => {:url => url, :from_id => from_id})
      end
      
    end
  end
end