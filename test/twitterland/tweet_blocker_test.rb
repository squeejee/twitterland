require File.dirname(__FILE__) + '/../test_helper'

class TweetBlockerTest < Test::Unit::TestCase
  include Twitterland
  
  context "Getting TweetBlocker info" do
    should "get grade results" do
      stub_get 'http://tweetblocker.com:80/api/username/bradleyjoyce.json', 'tweet_blocker_grade.json'
      Twitterland::TweetBlocker.user("bradleyjoyce").score.should == 100
      Twitterland::TweetBlocker.user("bradleyjoyce").grade.should == 'a'
      Twitterland::TweetBlocker.user("bradleyjoyce").username.should =="Bradley Joyce"
    end
    
    should "report user as spammer" do
      stub_get 'http://tweetblocker.com:80/api/spam/test.json', 'tweet_blocker_spam.json'
      Twitterland::TweetBlocker.report_spam("test").status.should == "user reported as spam"
    end
    
    should "get rate limit status" do
      stub_get 'http://tweetblocker.com:80/api/user/rate_limit_status.json', 'tweet_blocker_rate_limit_status.json'
      Twitterland::TweetBlocker.rate_limit.reset_time_in_seconds.should == 2885
      Twitterland::TweetBlocker.rate_limit.remaining_hits.should == 98
    end
  end
end