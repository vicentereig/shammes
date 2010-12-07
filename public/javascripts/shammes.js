$(document).ready( function() {
  $('body').append('<img src="http://radiant-earth-22.heroku.com/hit/push/?' + jQuery.param({ hit: { url: document.URL, referrer: document.referrer } }) + '"/>');
});

