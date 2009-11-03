require File.dirname(__FILE__) + '/../test_helper'

class FollerMeTest < Test::Unit::TestCase
  include Twitterland
  
  context "When hitting the API" do
    
    should "should display all terms for a user" do
      stub_get('http://api.foller.me/pengwynn/all.json', 'foller_me_all.json')
      result = Twitterland::FollerMe.terms('pengwynn')
      result.topics.keys.size.should == 51
      result.topics.keys.first.should == 'saints'
      result.topics.values.first.popularity.should == 2
    end
    
    should "should allow options" do
      stub_get('http://api.foller.me/pengwynn/all.json?font_max=40&exclude=ruby%2Crails&font_min=20', 'foller_me_all.json')
      result = Twitterland::FollerMe.terms('pengwynn', {:exclude => 'ruby,rails', :font_min => 20, :font_max => 40})
      result.should_not == nil
    end
    
    should "should display topics for a user" do
      stub_get('http://api.foller.me/pengwynn/topics.json', 'foller_me_topics.json')
      result = Twitterland::FollerMe.topics('pengwynn')
      result.topics.keys.size.should == 51
      result.topics.keys.first.should == 'saints'
      result.topics.values.first.popularity.should == 2
    end
    
    should "should display mentions for a user" do
      stub_get('http://api.foller.me/pengwynn/mentions.json', 'foller_me_mentions.json')
      result = Twitterland::FollerMe.mentions('pengwynn')
      result.mentions.keys.size.should == 103
      result.mentions.keys.first.should == '@wdperson'
      result.mentions.values.first.popularity.should == 1
    end
    
    should "should display hashtags for a user" do
      stub_get('http://api.foller.me/pengwynn/hashtags.json', 'foller_me_hashtags.json')
      result = Twitterland::FollerMe.hashtags('pengwynn')
      result.hashtags.keys.size.should == 25
      result.hashtags.keys.first.should == '#typos'
      result.hashtags.values.first.popularity.should == 1
    end
  end
  
end