require 'date'
module Twitterland
  class TwitterCounter
    include HTTParty
    base_uri 'http://twittercounter.com/api'
    format :json
  
    def self.show(username, results=365)
      stats =  get("/", :query => {:username => username, :output => 'json', :results => results})
      totals = stats.delete('followersperdate')
      stats = Mash.new stats
      # map values to integers because strings are a PIA for stats
      [
        "tomorrow_2w", 
        "followers_2w_ago", 
        "followers_yesterday", 
        "followers_current", 
        "friends_current", 
        "next_month", 
        "growth_since_2w",  
        "started_followers", 
        "rank", 
        "user_id", 
        "growth_since", 
        "follow_days", 
        "tomorrow", 
        "next_month_2w", 
        "average_growth", 
        "average_growth_2w"
      ].each do |field|
        stats[field] = stats[field].to_i
      end
      # alias user_name because it's named funky
      stats.username = stats.screen_name = stats.user_name
      stats.totals = totals.map{|key, value| [key.gsub('date', ''), value.to_i]}.sort_by{|date, total| Date.parse(date)}.reverse
      stats
    end
  
  end
end