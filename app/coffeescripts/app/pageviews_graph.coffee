data = [[1196463600000, 0], [1196550000000, 0], [1196636400000, 0], [1196722800000, 77],
    [1196809200000, 3636], [1196895600000, 3575], [1196982000000, 2736], [1197068400000, 1086],
    [1197154800000, 676], [1197241200000, 1205], [1197327600000, 906], [1197414000000, 710],
    [1197500400000, 639], [1197586800000, 540], [1197673200000, 435], [1197759600000, 301],
    [1197846000000, 575], [1197932400000, 481], [1198018800000, 591], [1198105200000, 608]]

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
  # grid:      { markings: weekendAreas }

# plot = $.plot("#placeholder", [data], options);

# overview = $.plot($("#overview"), [d], {
  #     series: {
  #         lines: { show: true, lineWidth: 1 },
  #         shadowSize: 0
  #     },
  #     xaxis: { ticks: [], mode: "time" },
  #     yaxis: { ticks: [], min: 0, autoscaleMargin: 0.1 },
  #     selection: { mode: "x" }
  # });
