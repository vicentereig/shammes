$(document).ready () ->
  $('body').append '<img src="http://shammes.heroku.com/hit/push/?' + jQuery.param({ hit: { url: document.URL, referrer: document.referrer } }) + '"/>'

