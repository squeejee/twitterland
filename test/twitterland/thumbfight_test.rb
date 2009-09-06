require File.dirname(__FILE__) + '/../test_helper'

class ThumbfightTest < Test::Unit::TestCase
  include Twitterland
  
  context "With no valid terms" do
    should "return error" do
      stub_get 'http://thumbfight.com:80/fight.json', 'thumbfight_error.json'
      tf = Twitterland::Thumbfight.fight()
      tf.challenger1.should be_nil
      tf.error.should == "Invalid parameters"      
    end
  end
  
  context "Getting one term" do
    should "work" do
      stub_get 'http://thumbfight.com:80/fight.json?challenger1=deadprogram', 'thumbfight.json'
      tf = Twitterland::Thumbfight.fight('deadprogram')
      tf.challenger1.title.should == 'deadprogram'
      tf.challenger1.score.should == '3 thumbs up'      
    end
  end

  context "Getting two terms" do
    should "work if two valid terms" do
      stub_get 'http://thumbfight.com:80/fight.json?challenger1=apple&challenger2=microsoft', 'thumbfight2.json'
      tf = Twitterland::Thumbfight.fight('apple', 'microsoft')
      tf.challenger1.title.should == 'apple'
      tf.challenger1.score.should == '3 thumbs up'      
      tf.challenger2.title.should == 'microsoft'
      tf.challenger2.score.should == '1 thumb up'      
    end

    should "work for a single valid term" do
      stub_get 'http://thumbfight.com:80/fight.json?challenger1=apple&challenger2=', 'thumbfight2_invalid.json'
      tf = Twitterland::Thumbfight.fight('apple', '')
      tf.challenger1.title.should == 'apple'
      tf.challenger1.score.should == '3 thumbs up'      
      tf.challenger2.should be_nil
    end
  end
end