require File.dirname(__FILE__) + '/../test_helper'

class MrtweetTest < Test::Unit::TestCase
  include Twitterland
  
  context "Getting mrtweet info" do
    setup do
      stub_get 'http://api.mrtweet.com:80/v1/is_user/bradleyjoyce/OU812.json', 'mrtweet_is_user.json'
      @mrtweet = Twitterland::Mrtweet.new('OU812','bradleyjoyce') 
    end
    should "validate mrtweet user" do
      
      @mrtweet.is_user.should == true
    end
    
    should "return fetch user profile" do
      stub_get 'http://api.mrtweet.com:80/v1/profile/bradleyjoyce/OU812.json', 'mrtweet_profile.json'
      @mrtweet.profile.conversation.should == 0.225
      @mrtweet.profile.links.should == 0.53
      @mrtweet.profile.recommendations.should == 1
    end
    
    should "return user recommendations" do
      stub_get 'http://api.mrtweet.com:80/v1/recommendations/bradleyjoyce/OU812.json', 'mrtweet_recommendations.json'
      @mrtweet.recommendations.first.name.should == 'billtrammel'
      @mrtweet.recommendations.size.should == 1
    end
    
    should "return twitter ids that user pays most attention towards" do
      stub_get 'http://api.mrtweet.com:80/v1/most_attention_towards/bradleyjoyce/OU812.json', 'mrtweet_most_attention_towards.json'
      @mrtweet.most_attention_towards.should == [15049040,17993906,22286046]
    end
    
    should "recommend a user" do
      stub_post 'http://api.mrtweet.com:80/v1/recommend/bradleyjoyce/OU812.json', 'mrtweet_success.json'
      @mrtweet.recommend("pengwynnn", "Wynn is the man!").should == true
    end
    
  end
end