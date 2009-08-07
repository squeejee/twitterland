require File.dirname(__FILE__) + '/../test_helper'

class FollowCostTest < Test::Unit::TestCase
  include Twitterland
  
  context "Getting follow cost" do
    should "work" do
      stub_get 'http://followcost.com:80/jnunemaker.json', 'follow_cost.json'
      follow_cost = Twitterland::FollowCost.show('jnunemaker')
      
      follow_cost.username.should == 'jnunemaker'
      follow_cost.milliscobles_all_time.should == 240.75
      follow_cost.average_tweets_per_day.should == 5.10626
      follow_cost.at_reply_index.should == 49.0
      follow_cost.statuses_count.should == 5382
      follow_cost.political_index.should == 0.0
    end
  end
end