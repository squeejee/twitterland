require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'
require 'fakeweb'

gem 'jnunemaker-matchy', '0.4.0'
require 'matchy'

FakeWeb.allow_net_connect = false

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'twitterland'

class Test::Unit::TestCase
  custom_matcher :be_nil do |receiver, matcher, args|
    matcher.positive_failure_message = "Expected #{receiver} to be nil but it wasn't"
    matcher.negative_failure_message = "Expected #{receiver} not to be nil but it was"
    receiver.nil?
  end
  
  custom_matcher :be_true do |receiver, matcher, args|
    matcher.positive_failure_message = "Expected #{receiver} to be true but it wasn't"
    matcher.negative_failure_message = "Expected #{receiver} not to be true but it was"
    receiver.eql?(true)
  end
  
  custom_matcher :be_false do |receiver, matcher, args|
    matcher.positive_failure_message = "Expected #{receiver} to be false but it wasn't"
    matcher.negative_failure_message = "Expected #{receiver} not to be false but it was"
    receiver.eql?(false)
  end
end

def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end

def twitter_url(url)
  url =~ /^http/ ? url : "http://twitter.com:80#{url}"
end

def stub_get(url, filename, status=nil)
  options = {:body => fixture_file(filename)}
  options.merge!({:status => status}) unless status.nil?
  
  FakeWeb.register_uri(:get, twitter_url(url), options)
end

def stub_post(url, filename)
  FakeWeb.register_uri(:post, twitter_url(url), :body => fixture_file(filename))
end
