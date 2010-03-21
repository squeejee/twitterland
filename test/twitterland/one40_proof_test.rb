require File.dirname(__FILE__) + '/../test_helper'

class One40ProofTest < Test::Unit::TestCase
  include Twitterland
  
  context "One40Proof gem" do
    should "give access to test API call" do
      assert defined?(One40Proof::Test)
    end
    
    should "give access to the User API call" do
      assert defined?(One40Proof::User)
    end
    
    should "give access to the Search API call" do
      assert defined?(One40Proof::Search)
    end
  end
end