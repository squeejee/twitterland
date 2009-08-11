# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{twitterland}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wynn Netherland", "Bradley Joyce"]
  s.date = %q{2009-08-11}
  s.email = %q{info@squeejee.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "History",
     "License",
     "README.markdown",
     "Rakefile",
     "VERSION.yml",
     "lib/twitterland.rb",
     "lib/twitterland/follow_cost.rb",
     "lib/twitterland/mrtweet.rb",
     "lib/twitterland/tweet_blocker.rb",
     "lib/twitterland/twinfluence.rb",
     "lib/twitterland/twitter_counter.rb",
     "lib/twitterland/twitter_grader.rb",
     "test/fixtures/follow_cost.json",
     "test/fixtures/mrtweet_is_user.json",
     "test/fixtures/mrtweet_most_attention_towards.json",
     "test/fixtures/mrtweet_profile.json",
     "test/fixtures/mrtweet_recommendations.json",
     "test/fixtures/mrtweet_success.json",
     "test/fixtures/tweet_blocker_grade.json",
     "test/fixtures/tweet_blocker_rate_limit_status.json",
     "test/fixtures/tweet_blocker_spam.json",
     "test/fixtures/twitter_counter.json",
     "test/fixtures/twitter_grader.json",
     "test/test_helper.rb",
     "test/twitterland/follow_cost_test.rb",
     "test/twitterland/mrtweet_test.rb",
     "test/twitterland/tweet_blocker_test.rb",
     "test/twitterland/twitter_counter_test.rb",
     "test/twitterland/twitter_grader_test.rb"
  ]
  s.homepage = %q{http://github.com/squeejee/twitterland}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{twitterland}
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{wrappers for various twitter apis}
  s.test_files = [
    "test/test_helper.rb",
     "test/twitterland/follow_cost_test.rb",
     "test/twitterland/mrtweet_test.rb",
     "test/twitterland/tweet_blocker_test.rb",
     "test/twitterland/twitter_counter_test.rb",
     "test/twitterland/twitter_grader_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mash>, ["= 0.0.3"])
      s.add_runtime_dependency(%q<httparty>, ["= 0.4.3"])
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_development_dependency(%q<jeremymcanally-matchy>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
      s.add_development_dependency(%q<mash>, [">= 0"])
    else
      s.add_dependency(%q<mash>, ["= 0.0.3"])
      s.add_dependency(%q<httparty>, ["= 0.4.3"])
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<jeremymcanally-matchy>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
      s.add_dependency(%q<mash>, [">= 0"])
    end
  else
    s.add_dependency(%q<mash>, ["= 0.0.3"])
    s.add_dependency(%q<httparty>, ["= 0.4.3"])
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<jeremymcanally-matchy>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
    s.add_dependency(%q<mash>, [">= 0"])
  end
end
