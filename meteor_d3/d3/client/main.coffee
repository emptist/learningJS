###
http://bost.ocks.org/mike/bar/#selecting
###
### this also works:

Meteor.startup ->
  data = [12, 22, 32, 42]
  d3.select(".chart")
      .selectAll("div")
        .data(data)
      .enter().append("div")
        .style("width", (d)->  d * 10 + "px" )
        .text((d)-> d )

###
  
data = share.Data?.findOne().data
  


Template.chart.rendered = ->
#x is a function:
  x = d3.scale.linear()
      .domain([0, d3.max(data)])
      .range([0, 420])

  d3.select(".chart")
      .selectAll("div")
        .data(data)
      .enter().append("div")
        .style("width", (d)->  ( x d ) + "px" )
        .text((d)-> d )
