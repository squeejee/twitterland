require File.dirname(__FILE__) + '/../test_helper'

class ZutualTest < Test::Unit::TestCase
  include Twitterland
  
  context "Hitting the Zutual API" do
    should "return a list of topic matches between users" do
      stub_get 'http://api.zutual.com/v/1/twitter/match/pengwynn+adamstac.json', 'zutual.json'
      matches = Twitterland::Zutual.match('pengwynn', 'adamstac')
      matches.first.topic.should == 'google'
      matches.first.strength.should == 87
      
    end
  end
end