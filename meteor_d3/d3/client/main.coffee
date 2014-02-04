###
http://bost.ocks.org/mike/bar/#selecting
###

  
mdata = -> share.Data?.findOne(idx:1)?.data
  
d3fill = ->
  #x is a function:
  x = d3.scale.linear()
      .domain([0, d3.max(mdata())])
      .range([0, 420])
  
  d3.select(".chart")
      .selectAll("div")
        .data(mdata())
      .enter().append("div")
        .style("width", (d)->  ( x d ) + "px" )
        .text((d)-> d )

###
Template.chart.rendered = ->
  d3fill()
 
this also works
###

Meteor.startup -> 
  d3fill()
