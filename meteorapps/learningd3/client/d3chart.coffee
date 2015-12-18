Template.chart.rendered = ->
  data = [4, 8, 15, 16, 23, 42]

  x = d3.scale.linear()
        .domain([0, d3.max(data)])
        .range([0, 420])

  d3.select(".chart")
    .selectAll("div")
      .data(data) # () is needed here
    .enter().append("div")
      .style( "width", (d)-> x(d) + "px") 
      .text((data)-> data)  
