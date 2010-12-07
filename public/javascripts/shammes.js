$(document).ready( function() {
  $('body').append('<img src="<%=APP_HOST%>/hit/push/?' + jQuery.param({ hit: { url: document.URL, referrer: document.referrer } }) + '"/>');
});

