require 'forwardable'
require 'rubygems'

gem 'mash', '0.0.3'
require 'mash'

gem 'httparty', '0.4.5'
require 'httparty'

module Twitterland
  class TwitterError < StandardError
    attr_reader :data
    
    def initialize(data)
      @data = data
      super
    end
  end
  
  class RateLimitExceeded < TwitterError; end
  class Unauthorized      < TwitterError; end
  class General           < TwitterError; end
  
  class Unavailable   < StandardError; end
  class InformTwitter < StandardError; end
  class NotFound      < StandardError; end
  
  module TweetMeme
    include HTTParty
    base_uri 'api.tweetmeme.com'
    format :json
  
    # Takes any URL posted to Twitter and resolves it to its original URL as well as details about that webpage, such as the title.
    # 
    #   Twitterland::TweetMeme.url_info('http://squeejee.com')
    def self.url_info(url)
      Mash.new get("/url_info.json", :query => {:url => url})
    end
    
  end
  
end

directory = File.expand_path(File.dirname(__FILE__))

require File.join(directory, 'twitterland', 'zutual')
require File.join(directory, 'twitterland', 'autoff')
require File.join(directory, 'twitterland', 'foller_me')
require File.join(directory, 'twitterland', 'follow_cost')
require File.join(directory, 'twitterland', 'twitter_counter')
require File.join(directory, 'twitterland', 'twinfluence')
require File.join(directory, 'twitterland', 'mrtweet')
require File.join(directory, 'twitterland', 'twitter_grader')
require File.join(directory, 'twitterland', 'tweet_blocker')
require File.join(directory, 'twitterland', 'back_tweets')
require File.join(directory, 'twitterland', 'thumbfight')
require File.join(directory, 'twitterland', 'tweet_meme', 'stories')
require File.join(directory, 'twitterland', 'tweet_meme', 'comments')
require File.join(directory, 'twitterland', 'tweet_meme', 'analytics')