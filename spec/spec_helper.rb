require 'rubygems'
require 'bundler/setup'
require 'split'
require 'split/helper'
require 'split/analytics'
require 'ostruct'

RSpec.configure do |config|
  config.order = 'random'
  config.before(:each) do
    Split.configuration = Split::Configuration.new
    Split.redis.flushall
    @ab_user = {}
  end
end
