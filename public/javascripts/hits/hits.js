/* DO NOT MODIFY. This file was compiled Thu, 18 Aug 2011 18:57:56 GMT from
 * /home/vicente/Workspaces/shammes/app/coffeescripts/hits/hits.coffee
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
