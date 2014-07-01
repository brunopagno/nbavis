function draw_player_star(element_id, player) {
  var margin = { top: 32, right: 50, bottom: 20, left: 50 };
  var width = 240 - margin.left - margin.right;
  var height = 240 - margin.top - margin.bottom;
  var labelMargin = 8;

  var star = d3.starPlot()
    .width(width)
    .properties(['assists', 'turnovers', 'blocks', 'rebounds', 'steals', 'points'])
    .scales([
          d3.scale.linear().domain([0, gon.max_assists]).range([0, 100]),
          d3.scale.linear().domain([0, gon.max_turnovers]).range([0, 100]),
          d3.scale.linear().domain([0, gon.max_blocks]).range([0, 100]),
          d3.scale.linear().domain([0, gon.max_rebounds]).range([0, 100]),
          d3.scale.linear().domain([0, gon.max_steals]).range([0, 100]),
          d3.scale.linear().domain([0, gon.max_points]).range([0, 100])
        ])
    .labels(['Assists', 'Turnovers', 'Blocks', 'Rebounds', 'Steals', 'Points'])
    .title(function(p) { return player.firstname + ' ' + player.lastname + ' - ' + player.year; })
    .margin(margin)
    .labelMargin(labelMargin);

  star.includeLabels(true);

  var wrapper = d3.select('#' + element_id).append('div')
    .attr('class', 'star-wrapper');

  var svg = wrapper.append('svg')
    .attr('class', 'chart star-' + player.year)
    .attr('width', width + margin.left + margin.right)
    .attr('height', width + margin.top + margin.bottom);

  var starG = svg.append('g')
    .datum(player)
    .call(star)
    .call(star.interaction);

  var interactionLabel = wrapper.append('div')
    .attr('class', 'interaction interaction-label');

  var circle = svg.append('circle')
    .attr('class', 'interaction interaction-circle')
    .attr('r', 5);

  var interaction = wrapper.selectAll('.interaction')
    .style('display', 'none');

  svg.selectAll('.star-interaction')
    .on('mouseover', function(d) {
      svg.selectAll('.star-label')
        .style('display', 'none');

      interaction
        .style('display', 'block');

      circle
        .attr('cx', d.x)
        .attr('cy', d.y);

      $interactionLabel = $(interactionLabel.node());
      leftoye = (d.xExtent - String($interactionLabel.width() / 2)) + 'px';
      topoye = (d.yExtent - String($interactionLabel.height() / 2)) + 'px';
      interactionLabel
        .text(d.key + ': ' + d.datum[d.key])
        .style('left', leftoye)
        .style('top', topoye);
    })
    .on('mouseout', function(d) {
      interaction
        .style('display', 'none')

      svg.selectAll('.star-label')
        .style('display', 'block')
    });
}
