module Twitterland
  class FollerMe
    include HTTParty
    base_uri 'api.foller.me'
    format :json
  
    
    # Get hashtags for a specific user
    #
    #   Twitterland::FollerMe.hashtags('pengwynn', options)
    #      options: 
    #         exclude   => 'rails,ruby'
    #         render    =>  true|false
    #         font_min  =>  12
    #         font_max  =>  20
    def self.hashtags(username, options={})
      terms(username, {:terms => 'hashtags'}.merge(options))
    end
    
    # Get topics for a specific user
    #
    #   Twitterland::FollerMe.topics('pengwynn', options)
    #      options: 
    #         exclude   => 'rails,ruby'
    #         render    =>  true|false
    #         font_min  =>  12
    #         font_max  =>  20
    def self.topics(username, options={})
      terms(username, {:terms => 'topics'}.merge(options))
    end
    
    # Get mentions for a specific user
    #
    #   Twitterland::FollerMe.mentions('pengwynn', options)
    #      options: 
    #         exclude   => 'mully,jdirt'
    #         render    =>  true|false
    #         font_min  =>  12
    #         font_max  =>  20
    def self.mentions(username, options={})
      terms(username, {:terms => 'mentions'}.merge(options))
    end
    
    # Get terms for a specific user
    #
    #   Twitterland::FollerMe.terms('pengwynn', options)
    #      options: 
    #         terms      => 'all|hashtags|topics|mentions}
    #         exclude   => 'rails,ruby'
    #         render    =>  true|false
    #         font_min  =>  12
    #         font_max  =>  20
    def self.terms(username, options={})
      options = options.to_hash.to_mash
      terms = options.delete('terms')
      terms ||= 'all'
      result = Hashie::Mash.new get("/#{username}/#{terms}.json", :query => options)
      case terms
      when 'all'
        result.topics ||= result.delete('terms_topics')
        result.mentions ||= result.delete('terms_mentions')
        result.hashtags ||= result.delete('terms_hashtags')
      when 'hashtags'
        result.hashtags ||= result.delete('terms')
      when 'topics'
        result.topics ||= result.delete('terms')
      when 'mentions'
        result.mentions ||= result.delete('terms')
      end
      result
    end
    
  end
end