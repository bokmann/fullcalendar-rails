# Fullcalendar::Rails

This gem for Ruby on Rails adds the content of the jQuery FullCalendar plugin from Adam Shaw (found here http://arshaw.com/fullcalendar/) within your RoR application such that you do not have to download and install all the FullCalendar assets yourself.

## Installation
In order to install the fullcalendar-rails gem and get FullCalendar working within your application, do the following steps:

1. Add to `gemfile`
    ```ruby
    gem 'fullcalendar-rails'
    gem 'momentjs-rails'
    ```
    
1. Bundle install and restart rails server.

1. Add to `application.js`
    ```jquery
    //= require moment 
    //= require fullcalendar
    
    $('#calendar').fullCalendar({});
    ```

1. Add to `application.css`
    ```css
    *= require fullcalendar
    ```
    
1. In view, include the following html:
    ```html
    <div id="calendar"></div>
    ```
    Now if you go to that view you should see the FullCalendar.

1. Reference the Using FullCalendar section for details on populating FullCalendar.

### Installing Google Calendar support
FullCalendar comes with Google calendar support, which can be implemented within your application with the following step:

* Using `gem fullcalendar-rails >= 2.1.1`, add `//= require fullcalendar/gcal` to `application.js`
* Using `gem fullcalendar-rails < 2.1.1`, add `//= require gcal` to `application.js`

### Installing a specific version:
If you want a specific version of FullCalendar, use the following line in your Gemfile:

    gem 'fullcalendar-rails', '~> X.Y.Z.0'
    
where **X.Y.Z** is the specific version of FullCalendar you wish to install (**Note: the last number "0" in the line above indicates the version of the fullcalendar-rails gem and may be something other than "0", but will still provide the FullCalendar version specified by X.Y.Z**).

### Install for fullcalendar-print
After following the above instalations steps, you may choose to use the `fullcalendar-print` file within your application to better customize the appearance of FullCalendar. To do so, follow these steps:

+ Option 1: Add to `application.css`
    ```css
    *= require fullcalendar.print
    ```
    *Note: This method causes issues with changing the color of events within FullCalendar, pointed out in issue #11.*
    
+ Option 2:
  1. Create `application-print.css.scss`.
  2. Add to `application-print.css.scss`
    ```
    @import 'fullcalendar.print';
    ```
    
  3. Add to `config/application.rb`
    ```
    config.assets.precompile += ['application-print.css']
    ```
    
  4. Add to `layouts`
    ```ruby
    <%= stylesheet_link_tag "application-print", :media => "print" %>
    ```

## Using FullCalendar
A quite aged step by step tutorial for creating events for FullCalendar in rails may be followed here:
https://web.archive.org/web/20160531044930/http://blog.crowdint.com/2014/02/18/fancy-calendars-for-your-web-application-with-fullcalendar.html
The instructions in the documentation doesn't work as expected at one point:
```
$('#calendar').fullCalendar(
    events: '/events.json'
);
```

Does not work. Instead, wrapping the events parameter in an object like this does:

```
$('#calendar').fullCalendar({
    events: '/events.json'
});
``` 
Thanks @sgelliott for pointing this out in issue #71!

*Newer step-by-step instructions needed! If you have newer explanations or want to write one, please open a pull request or an issue.*

And general documentation for FullCalendar may be found here:
http://fullcalendar.io/docs/

### Usage together with TurboLinks (version 5)

Using turbolinks requires special care for loading and unloading FullCalendar. You have to load your calendars in a good manner, with Turbolinks 5 you need to remove Fullcalendar from a before_cache tag.

Example:
```
function eventCalendar() {
  return $('#event_calendar').fullCalendar({ ***your FullCalendar config***});
};
function clearCalendar() {
  $('#event_calendar').fullCalendar('delete'); // In case delete doesn't work.
  $('#event_calendar').html('');
};
$(document).on('turbolinks:load', eventCalendar);
$(document).on('turbolinks:before-cache', clearCalendar)
```
Link to Turbolinks regarding idempotent scripts:
https://github.com/turbolinks/turbolinks#making-transformations-idempotent

Thanks @davidwessman for hinting this in issue #78!

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
