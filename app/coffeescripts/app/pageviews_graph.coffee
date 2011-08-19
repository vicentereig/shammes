jQuery ($) ->
  options =
    xaxis:     { mode: "time", tickLength: 5 }
    selection: { mode: "x" }

  $.plot $("#placeholder"), [], options
  $.get '/page_views/', (data) ->
    pageViews = []
    for pageView in data
      pageViews.push [pageView['_id'].day, pageView['value'].count]
    $.plot $('#placeholder'), [pageViews], options
