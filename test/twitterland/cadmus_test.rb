require File.dirname(__FILE__) + '/../test_helper'

class CadmusTest < Test::Unit::TestCase
  
  context "Hitting the Cadmus API" do
    should "return the stream for an authenticated user" do
      stub_get 'http://thecadmus.com/api/posts?key=OU812&count=5&timespan=3&page=2', 'cadmus.json'
      posts = Twitterland::Cadmus.posts(:key => 'OU812', :count => 5, :timespan => 3, :page => 2)
      posts.first['type'].should == 'twitter'
      posts.first.user.screen_name.should == 'chrisbrogan'
      posts.first.comments.size.should == 13
      posts.first.related.should be_empty
    end
  end
end