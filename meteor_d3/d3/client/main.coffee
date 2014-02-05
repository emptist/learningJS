###
http://bost.ocks.org/mike/bar/#selecting
###
mdata = -> share.Data?.findOne(idx:1)?.data
    
d3fill = ->
  #x is a function:
  x = d3.scale.linear()
      .domain([0, d3.max(mdata())])
      .range([0, 420])
  
  #return a function like x
  fx = (md)-> 
    d3.scale.linear()
      .domain([0, d3.max(md)])
      .range([0, 420])
  
  d3.select(".chart")
      .selectAll("div")
        .data(mdata())
      .enter().append("div")
        .style("width", (d)->  ( fx(mdata()) d ) + "px" )
        .text((d)-> d )


Template.chart.mdata = ->  
  d3fill()  
  
Template.chart.rendered = ->
  d3fill()

### 
this also works
###

  
