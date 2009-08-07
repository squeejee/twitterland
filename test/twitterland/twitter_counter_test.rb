require File.dirname(__FILE__) + '/../test_helper'

class TwitterCounterTest < Test::Unit::TestCase
  include Twitterland
  
  context "Getting twitter counter numbers" do
    should "work" do
      stub_get 'http://twittercounter.com:80/api/?username=jnunemaker&output=json&results=365', 'twitter_counter.json'
      counter_stats = Twitterland::TwitterCounter.show('jnunemaker')
      
      counter_stats.user_name.should == 'jnunemaker'
      counter_stats.followers_yesterday.should == 1481
      counter_stats.tomorrow.should == 1485
      counter_stats.next_month.should == 1572
      counter_stats.rank.should == 33172
      
      counter_stats.totals.size.should == 238
      counter_stats.totals.find{|total| total == '2008-11-07'} == 630
    end
  end
end