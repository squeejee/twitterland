module Twitterland
  module  TweetMeme
    class Analytics
      include HTTParty
      base_uri 'api.tweetmeme.com/analytics'
      format :json
      
      # API Docs: http://help.tweetmeme.com/2009/10/12/analytics-api/
      
      # Sends a request to the Analytics system top build a report for the specified URL. Accessible to anyone with an App ID and App Key.
      #
      #   Twitterland::TweetMeme::Analytics.build(1234, 'OU812', 'http://tweetcongress.org')
      def self.build(app_id, api_key, url)
        Mash.new(get("/build.json", :query => {:appid => app_id, :apikey => api_key, :url => url})).uid
      end
      
      # Returns a list of all Analytics that you have built, optionally filtered by domain. Accessible to anyone with an App ID and App Key.
      # 
      #   Twitterland::TweetMeme::Analytics.built(1234, 'OU812', 'http://tweetcongress.org')
      def self.built(app_id, api_key, url=nil)
        options = {:appid => app_id, :apikey => api_key}
        options.merge({:url => url}) unless url.blank?
        Mash.new get("/built.json", :query => options)
      end
      
      # Returns the HTML to display the built Analytics to the user. 
      #  Access to this API call is only available to those with elevated permissions to do so. 
      #  In order to get permission, please contact analytics@tweetmeme.com.
      #
      #   Twitterland::TweetMeme::Analytics.get(1234, 'OU812', '37758bd44025edb222022dcd1491c29g')
      def self.get_data(app_id, api_key, uid)
         Mash.new get("/get.json", :query => {:appid => app_id, :apikey => api_key, :uid => uid})
      end
      
    end
  end
end