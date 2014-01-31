# Pushr

Pushr is a proof of concept application demonstrating the usage of the History API in a way Twitter has [implemented it](https://blog.twitter.com/2012/implementing-pushstate-for-twittercom).

## Install

1. `git clone git@github.com:adammiribyan/pushr.git`;
2. `cd pushr/`;
3. `bundle install`;


## Run

1. `rackup`.
2. Go to `http://localhost:9292`.


## Custom Events

### uiNavigate

Triggered whenever the `a.js-nav` or the back button is clicked. Calls `Pushr.navigateUsingPushState()` method which makes an AJAX GET request to the given url. That url could be the clicked link `href` attribute or the previous page's url in case the back button was clicked. 

### dataPageRefresh
Triggered after `Pushr.navigateUsingPushState()`'s AJAX request is complete. Calls `Pushr.updatePage()` method which updates the page content.

### uiPageChanged
Triggered after the page is updated with the new content.

## Don't fancy Coffeescript?
You can get the plain Javascript version by visiting `http://localhost:9292/assets/application.js` after you `rackup` the server. You might need to scroll down a little bit. 
