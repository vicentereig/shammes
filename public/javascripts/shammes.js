/* DO NOT MODIFY. This file was compiled Thu, 18 Aug 2011 19:00:20 GMT from
 * /home/vicente/Workspaces/shammes/app/coffeescripts/shammes.coffee
 */

(function() {
  $(document).ready(function() {
    return $('body').append('<img src="http://shammes.heroku.com/hit/push/?' + jQuery.param({
      hit: {
        url: document.URL,
        referrer: document.referrer
      }
    }) + '"/>');
  });
}).call(this);
