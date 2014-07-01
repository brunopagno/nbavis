function draw_player_scaterplot(element_id, player_datas) {
  var margin = {top: 20, right: 20, bottom: 30, left: 40};
  var width = $(element_id).innerWidth() - margin.left - margin.right;
  var height = 400 - margin.top - margin.bottom;

  var x = d3.scale.linear().range([0, width]);
  var y = d3.scale.linear().range([height, 0]);
  x.domain([1998, 2010]);
  y.domain([-1.5, 3.5]);

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

  var rect = svg.append("rect")
      .attr("width", width)
      .attr("height", height)
      .style("fill", "none")
      .style("pointer-events", "all")
      .on("click", function(data) {
        $('')
        container.selectAll(".dot").style("fill", "blue");
        container.select('#playerinfodata')
            .text('');
        d3.selectAll('.player-star')
            .style("display", "none");
      });

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
      .text("Relevance");

  var color = d3.scale.category10();

  container.append("text")
      .attr("id", "playerinfodata")
      .attr("x", width / 2)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "middle");

  container.selectAll(".dot")
      .data(player_datas)
    .enter().append("circle")
      .attr("class", "dot")
      .attr("r", 5)
      .attr("cx", function(data) { return x(data.year); })
      .attr("cy", function(data) { return y(data.relevance); })
      .style("fill", "blue")
      .on("click",
        function(data) {
          container.selectAll(".dot").style("fill", "blue");
          d3.select(d3.event.target)
            .style("fill", "red");
          container.select('#playerinfodata')
            .text(data.relevance);

          d3.selectAll('.player-star')
            .style("display", "none");
          d3.select('#player-data-' + data.ident)
            .style("display", "block");
        });
}