class TweetMemeTest < Test::Unit::TestCase

  context "When hitting the Core API" do

    should "display details for a url" do
      stub_get('http://api.tweetmeme.com/url_info.json?url=http%3A%2F%2Ftweetcongress.org', 'tweet_meme_url_info.json')
      info = Twitterland::TweetMeme.url_info('http://tweetcongress.org')
      info.story.title.should == 'Tweet Congress'
      info.story.url_count.should == 1469
      info.story.excerpt.should == 'Awesome site- keep track of your reps and congress [wo]men: http://tweetcongress.com/'
    end
  end
  
  context "when hitting the Stories API" do
    
    should "should return popular stories" do
      stub_get('http://api.tweetmeme.com/stories/popular.json', 'tweet_meme_popular.json')
      stories = Twitterland::TweetMeme::Stories.popular.stories
      stories.count.should == 10
      stories.last.title.should == 'Best Books of 2009: Business & Investing Top 10'
    end
    
    should "should return recent stories" do
      stub_get('http://api.tweetmeme.com/stories/recent.json', 'tweet_meme_popular.json')
      stories = Twitterland::TweetMeme::Stories.recent.stories
      stories.count.should == 10
      stories.last.title.should == 'Best Books of 2009: Business & Investing Top 10'
    end
    
    should "should return categories" do
      stub_get('http://api.tweetmeme.com/stories/categories.json', 'tweet_meme_categories.json')
      categories = Twitterland::TweetMeme::Stories.categories.categories
      categories.count.should == 8
      categories.last.name.should == 'worldbusiness'
    end
    
    should "should return tweets for a given url" do
      stub_get('http://api.tweetmeme.com/stories/tweets.json?url=http%3A%2F%2Ftweetcongress.org&from_id=0', 'tweet_meme_tweets.json')
      tweets = Twitterland::TweetMeme::Stories.tweets('http://tweetcongress.org').tweets
      tweets.count.should == 10
      tweets.first.user.tweeter.should == 'irun131'
    end
  end
  
  context "when hitting the Comments API" do

    should "should return the most recent comments along with url info" do
      stub_get('http://api.tweetmeme.com/comments/firehose.json', 'tweet_meme_comments.json')
      comments = Twitterland::TweetMeme::Comments.firehose.comments
      comments.count.should == 100
      comments.first.user.tweeter.should == 'alfro2004'
    end
    
    should "should return comments for a given url" do
      stub_get('http://api.tweetmeme.com/comments/get_url.json?url=http%3A%2F%2Ftweetcongress.org', 'tweet_meme_comments.json')
      comments = Twitterland::TweetMeme::Comments.get_url('http://tweetcongress.org').comments
      comments.count.should == 100
      comments.first.user.tweeter.should == 'alfro2004'
    end
  end
  
  context "when hitting the Analytics API" do

    should "should return a uid" do
      stub_get('http://api.tweetmeme.com/analytics/build.json?appid=1234&apikey=OU812&url=http%3A%2F%2Ftweetcongress.org', 'tweet_meme_analytics_build.json')
      uid = Twitterland::TweetMeme::Analytics.build(1234, 'OU812', 'http://tweetcongress.org')
      uid.should == '94496fd8227104a06bbb1a07a6ea9e3c'
    end
    
    should "should return a list of built analytics" do
      stub_get('http://api.tweetmeme.com/analytics/built.json?appid=1234&apikey=OU812', 'tweet_meme_analytics_built.json')
      built = Twitterland::TweetMeme::Analytics.built(1234, 'OU812')
      built.builtURLs.size.should == 1
      built.builtURLs.first.name.should == 'tweetcongress.org'
    end
    

  end
  
  
  
end