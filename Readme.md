# [Split Analytics](http://libraries.io/rubygems/split-analytics)

> 📊 An extension to [Split](http://github.com/splitrb/split) to push test data to Google Analytics

[![Build Status](https://secure.travis-ci.org/splitrb/split-analytics.svg?branch=master)](http://travis-ci.org/andrew/split-analytics)
[![Gem Version](https://badge.fury.io/rb/split-analytics.svg)](http://badge.fury.io/rb/split-analytics)
[![Dependency Status](https://gemnasium.com/splitrb/split-analytics.svg)](https://gemnasium.com/andrew/split-analytics)

## Install

### Requirements

The split gem and its dependencies.

### Setup

If you are using bundler add split to your Gemfile:

```ruby
gem 'split-analytics', require: 'split/analytics'
```

Then run:

```bash
bundle install
```

Otherwise install the gem:

```bash
gem install split-analytics
```

and require it in your project:

```ruby
require 'split/analytics'
```

## Usage

Use in your application layout template

erb example:

```erb
<%= tracking_code(account: 'UA-12345-6') %>
```

haml example:

```haml
= tracking_code(account: 'UA-12345-6')
```

### With Tracking Methods

See [Google Analytics Tracking Methods](https://developers.google.com/analytics/devguides/collection/gajs/methods/) for available options.

```ruby
tracker_methods = {
  setDomainName: "example.com", # String argument
  setAllowLinker: true, # Boolean argument
  require: ['inpage_linkid', '//www.google-analytics.com/plugins/ga/inpage_linkid.js'] # Array argument (will be splattered)
  clearOrganic: "" # No argument
}
```

erb example:

```erb
<%= tracking_code(account: 'UA-12345-6', tracker_methods: tracker_methods) %>
```

haml example:

```haml
= tracking_code(account: 'UA-12345-6', tracker_methods: tracker_methods)
```
### Other Tracking URLs

You can use other Tracking URLs with the option tracker_url and ssl_tracker_url.

erb example:

```erb
<%= tracking_code(account: 'UA-12345-6', tracker_url: 'stats.g.doubleclick.net/dc.js', ssl_tracker_url: 'stats.g.doubleclick.net/dc.js') %>
```

haml example:

```haml
= tracking_code(account: 'UA-12345-6', tracker_url: 'stats.g.doubleclick.net/dc.js', ssl_tracker_url: 'stats.g.doubleclick.net/dc.js')
```

## Contributing

Source hosted at [GitHub](http://github.com/splitrb/split-analytics).
Report Issues/Feature requests on [GitHub Issues](http://github.com/splitrb/split-analytics/issues).

Please follow the [Code of Conduct](CODE_OF_CONDUCT.md).

### Note on Patches/Pull Requests

 * Fork the project.
 * Make your feature addition or bug fix.
 * Add tests for it. This is important so I don't break it in a
   future version unintentionally.
 * Commit, do not mess with rakefile, version, or history.
   (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
 * Send me a pull request. Bonus points for topic branches.

### Testing

Tests can be ran with `rake spec`.

## License

Copyright (c) 2015-2018 Andrew Nesbitt. See [LICENSE](LICENSE) for details.
