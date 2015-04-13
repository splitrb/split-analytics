require 'rubygems'
require 'bundler/setup'
require 'split'
require 'split/helper'
require 'split/analytics'
require 'ostruct'

def session
  @ab_user ||= {}
end

RSpec.configure do |config|
  config.order = 'random'
  config.before(:each) do
    Split.configuration = Split::Configuration.new
    Split.redis.flushall
    @ab_user = {}
  end
end
