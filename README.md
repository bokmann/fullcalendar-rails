# Fullcalendar::Rails

This gem for Ruby on Rails is a simple rebundlingof the contents of the jQuery FullCalendar plugin from Adam Shaw:

http://arshaw.com/fullcalendar/

I had created an earlier version of a demonstration of using FullCalendar in a Rails app.  That code is available at:

https://github.com/bokmann/fullcalendar_assets

But I have always disliked finding random files and copying them into a public directory.  So I made an asset gem for use with the asset pipeline.


## Installation

Add this line to your application's Gemfile:

    gem 'fullcalendar-rails'

If you need a specific version of FullCalendar (e.g X.Y.Z), you can explicitly require it like this:

    gem 'fullcalendar-rails', '~> X.Y.Z.0'

(Note that the last number ("0" in the line above) indicates the release of this gem, so it may change for the same version of FullCalender, see Versioning section below)

Since version 2.1.1.0 of this gem, the gems `jquery-rails` and `momentjs-rails` are included as dependencies. If you copied moment.js manually into your project, you have to delete the file so it doesn't clash with the required version from the gem. You have to also add

    gem 'momentjs-rails'
    
to your Gemfile and

    //= require moment

to your application.js manifest (before requiring fullcalendar).

Finally execute:

    $ bundle

Or install it yourself as:

    $ gem install fullcalendar-rails

At this point, the files from the FullCalendar project are in your asset pipeline's path... all you have to do is require them in the appropriate places.  For instance, in your application.css.scss:

    *= require fullcalendar

And in your application.js:

    //= require fullcalendar

You can also include the fullcalendar.print file in your css manifest like this:

    *= require fullcalendar.print

but as Ray Zane pointed out in issue #11, this will cause a problem if you try to change the colors of events.

An ideal solution, if you need a print stylesheet, is to create an application-print.css.scss file and include this (and other print-related css) in it.  You'll then need to add it to to the precompile array in config/application.rb:

    config.assets.precompile += ['application-print.css']

and then in your layouts where you need it, add:

    <%= stylesheet_link_tag "application-print", :media => "print" %>


While its not needed for this library, the original javascript library's author also includes an adapter for integrating google calendars as an event source. For pre-2.1.1-versions of this gem, use:

    //= require gcal

Since version 2.1.1 of this gem, gcal and all other related javascript files (lang-all.js and individual language files) have been relocated to a subdirectory as requested in issue #24:

    //= require fullcalendar/gcal

## Usage

See the website of the original project for the usage, or my original Rails 3 example I point to above.  This gem just saves you from having to locate and copy the javascript and stylesheet into place.

http://arshaw.com/fullcalendar/

## Motivations

I hate finding random versions of javscript and css out on the web and then just downloading, or copy/pasting into files in my asset pipeline... I like some kind of accountability as to the source of the files, and I especially like it when bundle can tell me when those versioned assets are out of date.  Therefore, I tend to take the few extra minutes to package these things up as versioned gems.

As such, these are primarily for my own use, and may occasionally fall out of date as the project I created them for goes in and out of maintenance cycles.  If thats the case, I will gladly accept pullup requests, or even be willing to talk to someone who wants to take over ownership for the repo and the gem on rubygems.  As with all open source, I hope you find this useful, but if you don't, your right to complain starts with a pullup request.

## Versioning

I am going to version this gem with the version of the FullCalendar code I use, adding an extra digit if I need to release any maintenance versions of the gem itself.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

If the original library I'm basing this off of has tests, I'd like to integrate that into the gem as well; but if it doesn't, its not the end of the world... as this is just a 'shrinkwrap' of someone else's work, I don't take on any testing responsibility within the scope of packaging.
