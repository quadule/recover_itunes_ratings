# recover_itunes_ratings

Reads the song ratings from an iTunes library XML file and applies them to your current iTunes library via AppleScript. This may be useful to restore song ratings that were lost due to a bug in iTunes, Apple Music, or iCloud Music Library.

## Installation

    $ gem install recover_itunes_ratings

## Usage

    $ recover_itunes_ratings "iTunes Music Library.xml" [options]

    By default, only prints the ratings that will be changed.

    -a, --albums                     Reset all user-supplied album ratings
    -r, --run                        Run instead of only printing changes

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec recover_itunes_ratings` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/quadule/recover_itunes_ratings.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
