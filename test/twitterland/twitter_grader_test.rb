require File.dirname(__FILE__) + '/../test_helper'

class TwitterGraderTest < Test::Unit::TestCase
  include Twitterland
  
  context "Getting twitter grade" do
    should "work" do
      stub_get 'http://api.twittergrader.com:80/api/grade/bradleyjoyce.json?APIKey=OU812', 'twitter_grader.json'
      Twitterland::TwitterGrader.grade("bradleyjoyce", "OU812").should == 98.4183
    end
  end
end