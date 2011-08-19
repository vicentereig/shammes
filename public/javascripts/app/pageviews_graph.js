/* DO NOT MODIFY. This file was compiled Fri, 19 Aug 2011 17:17:22 GMT from
 * /home/vicente/Workspaces/shammes/app/coffeescripts/app/pageviews_graph.coffee
 */

(function() {
  jQuery(function($) {
    var options;
    options = {
      xaxis: {
        mode: "time",
        tickLength: 5
      },
      selection: {
        mode: "x"
      }
    };
    $.plot($("#placeholder"), [], options);
    return $.get('/page_views/', function(data) {
      var pageView, pageViews, _i, _len;
      pageViews = [];
      for (_i = 0, _len = data.length; _i < _len; _i++) {
        pageView = data[_i];
        pageViews.push([pageView['_id'].day, pageView['value'].count]);
      }
      return $.plot($('#placeholder'), [pageViews], options);
    });
  });
}).call(this);
