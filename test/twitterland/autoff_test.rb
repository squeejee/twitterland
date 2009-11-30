require File.dirname(__FILE__) + '/../test_helper'

class AutoffTest < Test::Unit::TestCase
  include Twitterland
  
  context "Hitting the AutoFF API" do
    should "return a list of most tweeted-to users" do
      stub_get 'http://autoff.com/api/pengwynn', 'autoff.json'
      results = Twitterland::Autoff.user('pengwynn')
      results.should include('adamstac')
      
    end
  end
end