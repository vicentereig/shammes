/* DO NOT MODIFY. This file was compiled Fri, 19 Aug 2011 16:48:55 GMT from
 * /home/vicente/Workspaces/shammes/app/coffeescripts/app/pageviews_graph.coffee
 */

(function() {
  jQuery(function($) {
    var data, options, weekendAreas;
    console.log("HELLO");
    data = [[1196463600000, 0], [1196550000000, 0], [1196636400000, 0], [1196722800000, 77], [1196809200000, 3636], [1196895600000, 3575], [1196982000000, 2736], [1197068400000, 1086], [1197154800000, 676], [1197241200000, 1205], [1197327600000, 906], [1197414000000, 710], [1197500400000, 639], [1197586800000, 540], [1197673200000, 435], [1197759600000, 301], [1197846000000, 575], [1197932400000, 481], [1198018800000, 591], [1198105200000, 608]];
    weekendAreas = function(axes) {
      var d, markings, saturday, _i, _ref, _ref2, _ref3, _ref4, _ref5, _results;
      console.log(axes);
      markings = [];
      d = new Date(axes.xaxis.min);
      d.setUTCDate(d.getUTCDate() - ((d.getUTCDay() + 1) % 7));
      d.setUTCSeconds(0);
      d.setUTCMinutes(0);
      d.setUTCHours(0);
      console.log((function() {
        _results = [];
        for (var _i = _ref = d.getTime(), _ref2 = axes.xaxis.max; _ref <= _ref2 ? _i <= _ref2 : _i >= _ref2; _ref <= _ref2 ? _i++ : _i--){ _results.push(_i); }
        return _results;
      }).apply(this));
      for (saturday = _ref3 = d.getTime(), _ref4 = axes.xaxis.max, _ref5 = 2 * 24 * 60 * 60 * 1000; _ref3 <= _ref4 ? saturday <= _ref4 : saturday >= _ref4; saturday += _ref5) {
        markings.push({
          xaxis: {
            from: saturday,
            to: saturday(2 * 24 * 60 * 60 * 1000)
          }
        });
      }
      return markings;
    };
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
      console.log(options);
      pageViews = [];
      for (_i = 0, _len = data.length; _i < _len; _i++) {
        pageView = data[_i];
        pageViews.push([pageView['_id'].day, pageView['value'].count]);
      }
      return $.plot($('#placeholder'), [pageViews], options);
    });
  });
}).call(this);
