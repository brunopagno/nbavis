function draw_team_scaterplot(element_id) {
  teams = gon.teams
  var margin = {top: 20, right: 20, bottom: 30, left: 40};
  var width = $(element_id).innerWidth() - margin.left - margin.right;
  var height = 500 - margin.top - margin.bottom;

  var x = d3.scale.linear().range([0, width]);
  var y = d3.scale.linear().range([height, 0]);
  x.domain([1979, 2010]);
  y.domain([0, 90]);

  var color = d3.scale.category10();

  var xAxis = d3.svg.axis()
      .scale(x)
      .orient("bottom")
      .ticks(20)
      .tickFormat(d3.format('d'));

  var yAxis = d3.svg.axis()
      .scale(y)
      .orient("left");

  var zoom = d3.behavior.zoom()
      .scaleExtent([1, 10])
      .on("zoom", zoom);

  var svg = d3.select(element_id).append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
      .call(zoom);

  var rect = svg.append("rect")
      .attr("width", width)
      .attr("height", height)
      .style("fill", "none")
      .style("pointer-events", "all");

  var container = svg.append("g");

  container.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
    .append("text")
      .attr("class", "label")
      .attr("x", width)
      .attr("y", -6)
      .style("text-anchor", "end")
      .text("Year");

  container.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("class", "label")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Wins");

  container.selectAll(".dot")
      .data(teams)
    .enter().append("image")
      .attr("class", function(team) { return "dot " + team.img })
      .attr("xlink:href", function(team) { return team.imgp; })
      .attr("x", function(team) { return x(team.year); })
      .attr("y", function(team) { return y(team.wins); })
      .attr("height", 10)
      .attr("width", 15)
      .style("fill", function(team) { return color(team.species); })
      .on("mouseover",
        function(team) {
          container.selectAll('.dot')
            .style('opacity', 0.1);
          container.selectAll('.' + team.img)
            .style('opacity', 1);
        })
      .on("mouseout",
        function(team) {
          container.selectAll('.dot')
            .style('opacity', 1);
        });

  var legend = svg.selectAll(".legend")
      .data(color.domain())
    .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

  legend.append("rect")
      .attr("x", width - 18)
      .attr("width", 18)
      .attr("height", 18)
      .style("fill", color);

  legend.append("text")
      .attr("x", width - 24)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "end")
      .text(function(d) { return d; });

  function zoom() {
    container.attr("transform", "translate(" + d3.event.translate + ")scale(" + d3.event.scale + ")");
  }
}