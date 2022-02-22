require 'rubygems'
require 'bundler/setup'
require 'split'
require 'split/helper'
require 'split/analytics'
require 'ostruct'

module GlobalSharedContext
  extend RSpec::SharedContext
  let(:ab_user){ Split::User.new(double(session: {})) }

  before(:each) do
    Split.configuration = Split::Configuration.new
    Split.redis = Redis.new(db: 10)
    Split.redis.flushall
    @ab_user = ab_user
    params = nil
  end
end

RSpec.configure do |config|
  config.order = 'random'
  config.include GlobalSharedContext
end

def session
  @session ||= {}
end

def params
  @params ||= {}
end

def request(ua = 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; de-de) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27')
  @request ||= begin
    r = OpenStruct.new
    r.user_agent = ua
    r.ip = '192.168.1.1'
    r
  end
end