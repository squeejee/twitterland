# Twitterland

Twitterland is a Ruby gem that bundles various Twitter-related APIs

Including:

* [Follow Cost](http://followcost.com/)
* [Twitter Grader](http://twitter.grader.com/)
* [Mr. Tweet](http://mrtweet.com/)
* [Twinfluence](http://twinfluence.com/) 
* [Twitter Counter](http://twittercounter.com)
* [TweetBlocker](http://tweetblocker.com)
* [Thumbfight](http://thumbfight.com)
* [TweetMeme](http://tweetmeme.com)
* [FollerMe](http://foller.me)
* [Zutual](http://www.zutual.com/)
* [140Proof](http://140proof.com/)
* [Cadmus](http://thecadmus.com)

### Install
     sudo gem install twitterland

### Follow Cost Usage
    # Get follow cost for specified user
    Twitterland::FollowCost.show('bradleyjoyce')

    => <Mash at_reply_index=24.0 average_tweets_per_day=6.87254901960784 average_tweets_per_day_recently=19.6396220282001 golden_index=3.0 milliscobles_all_time=324.02 milliscobles_recently=925.96 political_index=1.0 profile_image_url="http://s3.amazonaws.com/twitter_production/profile_images/179927752/bradley_normal.png" statuses_count=3505 twitter_created_at="2008/03/14 18:26:52 -0700" username="bradleyjoyce">

### Twitter Grader Usage
    # request your api key at [http://twitter.grader.com/accessrequestform](http://twitter.grader.com/accessrequestform)
    # get twitter grade for user
    api_key = "OU812"
    Twitterland::TwitterGrader.grade('bradleyjoyce', api_key)

    => 98.4183

### Mr.Tweet Usage
##### get your api key at [http://api.mrtweet.com/newapi](http://api.mrtweet.com/newapi)
#### Initialize Mrtweet
    api_key = 'OU812'
    mt = Twitterland::Mrtweet.new(api_key,'bradleyjoyce')
#### Is user
    # Check whether the given user is a MrTweet user.
    mt.is_user
    
    => true

#### Profile
    # Returns MrTweet statistics of the given user
    mt.profile

    => <Mash conversation=0.225 conversation_percentile=53 frequency=8.98621 frequency_percentile=90 links=0.53 links_percentile=87 recommendations=1>

    mt.profile.links

    => 0.53

#### Recommendations
    # Returns the latest recommendations the given user received on MrTweet
    mt.recommendations
   
    => [<Mash date=Thu Aug 06 01:02:54 -0500 2009 name="billtrammel" text="he is an entrepreneur, and one of the developers of TweetCongress.org, award-winning site promoting government transparency. Plus, he's a good friend.">]

    mt.recommendations.first.name

    => "billtrammel"

#### Most attention towards
    # Returns the twitter_id's of 3 users that for the given user pays the most attention to
    mt.most_attenion_towards

    => [15049040, 17993906, 22286046]

#### Recommend
    # Creates a recommendation from the given user, to another user (aka "friend_name")
    reason = "Wynn is an awesome entrepreneur, rubyist, designer and friend! Follow him for his useful and entertaining tweets!"

    friend_name = "pengwynn"
    
    mt.recommend(reason,friend_name)

    => true

### Twinfluence

#### Initialize Twinfluence
    username = 'bradleyjoyce'
    password = 'mypassword'
    t = Twitterland::Twinfluence.new(username,password)

    => #<Twitterland::Twinfluence:0x317ecf8 @username="bradleyjoyce", @password="mypassword">

#### User
    # gets twinfluence data for user
    t.user('bradleyjoyce')

    t.user('bradleyjoyce')
    
    => <Mash user=<Mash adrider=<Mash script=[<Mash type="text/javascript">, <Mash src="http://pagead2.googlesyndication.com/pagead/show_ads.js" type="text/javascript">]> centralization="24.224443556856" centralization_grade="0.0 Average - Resilient" description="Entrepreneur and Web Developer -- Floxee.com, TweetCongress.org, Sherflock.com, Squeejee.com" followers_count="1315" friends_count="1278" id="14688076" location=nil name="Bradley Joyce" screen_name="bradleyjoyce" second_order="7936664" second_order_grade="Rank: <b>#10,185</b> (93%)" social_capital="6035.4859315589" social_capital_grade="+1.4 High" statuses_count="3511" unix_timestamp="1249683954" url="http://bradleyjoyce.me" velocity="15535.453112211" velocity_grade="+0.1 Fast Average">>

### Twitter Counter

#### Show
    tc = Twitterland::TwitterCounter.show('bradleyjoyce')

    tc.rank
    
    => 37194
    
    # available methods
    tomorrow_2w 
    followers_2w_ago 
    followers_yesterday 
    followers_current 
    friends_current 
    next_month 
    growth_since_2w  
    started_followers 
    rank 
    user_id 
    growth_since 
    follow_days 
    tomorrow 
    next_month_2w 
    average_growth 
    average_growth_2w


### TweetBlocker

#### User
    # get grade for user
    result = Twitterland::TweetBlocker.user('bradleyjoyce')

    => <Mash grade="a" score=100 url="http://twitter.com/bradleyjoyce" username="Bradley Joyce">

#### Spam
    # report a user as spammer
    Twitterland::TweetBlocker.report_spam('spamtest')

#### Rate Limit Status
    # check your rate limit status
    Twitterland::TweetBlocker.rate_limit

    => <Mash hourly_limit=100 remaining_hits=100 reset_time="2009-08-11 23:12:41 UTC" reset_time_in_seconds=2746>
    
### BackTweets

Get your api_key at [http://www.backtype.com/developers](http://www.backtype.com/developers)

#### Search
    # Return tweet referencing a URL
    results = Twitterland::BackTweets.search('http://squeejee.com', 'OU812')
    results.tweets.size
    => 25
    results.tweets.first.from_user
    => "euromarianne"
    results.items_per_page
    => 25
    results.total_results
    => 3301
    
### Thumbfight

#### Usage
    # Get follow cost for single search term
    Twitterland::Thumbfight.fight('apple')
    => <Mash challenger1=<Mash score="3 thumbs up" title="apple">>
    
    # Get follow cost for two search terms
    Twitterland::Thumbfight.fight('apple', 'microsoft')
    => <Mash challenger1=<Mash score="3 thumbs up" title="apple"> challenger2=<Mash score="2 thumbs up" title="microsoft">>
    
### TweetMeme

#### Usage

    # Get comments for a given url
    details = Twitterland::TweetMeme.url_info('http://tweetcongress.org')
    
    # Get recent comments
    comments = Twitterland::TweetMeme::Comments.firehose
    
    # Get popular stories
    popular = Twitterland::TweetMeme::Stories.popular
    
### Auto Follow Friday

    # get the 10 most recent tweeted-to for #followfriday
    Twitterland::Autoff.user('mrspengwynn')
    => ["treefrogstudios", "legalzoom", "pengwynn", "str8photography", "kriscolvin", "focalpop", "ahhphotography", "digitalps", "mully", "curvezilla"]
    
### Zutual

You can compare what topics any two Twitter users have in common:

    Twitterland::Zutual.match('pengwynn', 'adamstac')
    => [<Mash strength=87 topic="google">, <Mash strength=87 topic="interview">, <Mash strength=67 topic="google chrome">, <Mash strength=60 topic="sass">, <Mash strength=52 topic="rsync">, <Mash strength=52 topic="rake">, <Mash strength=47 topic="gemcutter">, <Mash strength=45 topic="facebook">, <Mash strength=42 topic="wordpress deployment">, <Mash strength=42 topic="haml">, <Mash strength=42 topic="github">, <Mash strength=35 topic="dallas">, <Mash strength=32 topic="logo">, <Mash strength=32 topic="village church">, <Mash strength=32 topic="css">, <Mash strength=32 topic="mac">, <Mash strength=22 topic="tv">, <Mash strength=22 topic="fix-me">, <Mash strength=22 topic="dns">, <Mash strength=22 topic="lord">]

### 140 Proof

#### Usage

Testing ad placement while in development

    ad = Twitterland::One40Proof::Test.new

    # The Ad
    ad.image_url
    ad.byline
    ad.text

    # User
    ad.user.screen_name
    ad.user.user_id
    ad.user.profile_image_url
    ad.user.name

    # Action URLS
    ad.action_urls.click_url
    ad.action_urls.favorite_url   # Or ad.action_urls.favourite_url for the English
    ad.action_urls.impression_url
    ad.action_urls.friendship_url
    ad.action_urls.reply_url
    ad.action_urls.retweet_url

    # Status
    ad.status.id

To get an ad for a specific user

    ad = Twitterland::One40Proof::UserAd.new(:user_id => 'reddavis', :app_id => 'your app_id')

To get an ad for a specific query

    ad = Twitterland::One40Proof::Search.new(:user_id => 'reddavis', :app_id => 'your app_id', :q => 'magic hats')
    
### Cadmus

    # get posts in a user's stream including related tweets and comments
    posts = Twitterland::Cadmus.posts(:key => 'OU812', :count => 30, :page => 2)

### Source
[http://github.com/squeejee/twitterland/](http://github.com/squeejee/twitterland/)

### Documentation
[http://rdoc.info/projects/squeejee/twitterland](http://rdoc.info/projects/squeejee/twitterland)

### Copyright
Copyright (c) 2009 Squeejee. See LICENSE for details.

