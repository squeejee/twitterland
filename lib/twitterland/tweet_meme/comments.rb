module Twitterland
  module  TweetMeme
    class Comments
      include HTTParty
      base_uri 'api.tweetmeme.com/comments'
      format :json
      
      # Returns the most recent comments posted on TweetMeme, along with information on which URL they were posted on.
      #
      #   Twitterland::TweetMeme::Comments.firehose
      def self.firehose(options={})
        Hashie::Mash.new get("/firehose.json")
      end
      
      # Returns comments posted on a particular URL
      # 
      #   Twitterland::TweetMeme.get_url('http://squeejee.com')
      def self.get_url(url)
        Hashie::Mash.new get("/get_url.json", :query => {:url => url})
      end
      
    end
  end
end