# FullCalendar for Rails

FullCalendar packaged for the Rails 3.1+ asset pipeline.
Check [FullCalendar project home page](http://arshaw.com/fullcalendar/) and [GitHub page](https://github.com/arshaw/fullcalendar).

This gem is forked from https://github.com/bokmann/fullcalendar-rails which does not include gcal.js and has not been updated to the latest version.
You can read more about the reasons behind this fork [here](https://github.com/bokmann/fullcalendar-rails/commit/0b1b3506ce81cab733fb840749852eafc626e593#commitcomment-1416352) and check the [pull request to the original fullcalendar-rails repository](https://github.com/bokmann/fullcalendar-rails/pull/3).

There is another gem at https://github.com/mankind/fullcalendar-rails but [the implementation is lacking](https://github.com/mankind/fullcalendar-rails/issues/3).

## Installation

Add this line to your application's Gemfile:

    gem 'fullcalendar-rails', github: 'tkrotoff/fullcalendar-rails'

And then execute:

    $ bundle

## Usage

Add the following JavaScript file to `app/assets/javascripts/application.js`:

    //= require fullcalendar/fullcalendar.js
    //= require fullcalendar/gcal.js <--- In case you need Google Calendar support

Add the following stylesheet file to `app/assets/stylesheets/application.css`:

    *= require fullcalendar/fullcalendar.css

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
