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

  var svg = d3.select(element_id).append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
    .append("text")
      .attr("class", "label")
      .attr("x", width)
      .attr("y", -6)
      .style("text-anchor", "end")
      .text("Year");

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("class", "label")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Wins");

  svg.selectAll(".dot")
      .data(teams)
    .enter().append("image")
      .attr("class", "dot")
      .attr("xlink:href", function(team) { return '/assets/logos/'+team.img+'.gif'; })
      .attr("x", function(team) { return x(team.year - 0.5); })
      .attr("y", function(team) { return y(team.wins); })
      .attr("height", 20)
      .attr("width", 30)
      .style("fill", function(team) { return color(team.species); });
}