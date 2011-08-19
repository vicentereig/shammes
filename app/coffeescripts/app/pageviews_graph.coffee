jQuery ($) ->
  # plot draws in UTC!
  weekendAreas = (axes) ->
    console.log axes
    markings = []
    d = new Date(axes.xaxis.min)
    d.setUTCDate(d.getUTCDate() - ((d.getUTCDay() + 1) % 7))
    d.setUTCSeconds(0)
    d.setUTCMinutes(0)
    d.setUTCHours(0)
    console.log [d.getTime()..axes.xaxis.max]
    for saturday in [d.getTime()..axes.xaxis.max] by 2*24*60*60*1000
      markings.push( xaxis: { from: saturday, to: saturday 2 * 24 * 60 * 60 * 1000} )
    return markings

  options =
    xaxis:     { mode: "time", tickLength: 5 }
    selection: { mode: "x" }
    #grid:      { markings: weekendAreas }

  $.plot $("#placeholder"), [], options
  $.get '/page_views/', (data) ->
    console.log options
    pageViews = []
    for pageView in data
      pageViews.push [pageView['_id'].day, pageView['value'].count]
    $.plot $('#placeholder'), [pageViews], options
