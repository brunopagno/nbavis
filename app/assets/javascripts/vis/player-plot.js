var margin = {
  top: 32,
  right: 50,
  bottom: 20,
  left: 50
};
var width = 240 - margin.left - margin.right;
var height = 240 - margin.top - margin.bottom;
var labelMargin = 8;


function get_player_star(player) {
  var star = d3.starPlot()
    .width(width)
    .properties(['asts', 'turnover', 'blk', 'reb', 'stl', 'pts'])
    .scales(d3.scale.linear().domain([0, 100]).range([0, 100]))
    .labels(['Assists', 'Turnovers', 'Blocks', 'Rebounds', 'Steals', 'Points'])
    .title(function(p) { return player.firstname + ' ' + player.lastname; })
    .margin(margin)
    .labelMargin(labelMargin);

  star.includeLabels(true);

  var wrapper = d3.select('.body-content').append('div')
    .attr('class', 'col-lg-3 col-md-3 col-sm-4 col-xs-6');

  var svg = d3.select('.body-content').append('svg')
    .attr('class', 'chart')
    .attr('width', width + margin.left + margin.right)
    .attr('height', width + margin.top + margin.bottom);

  var starG = svg.append('g')
    .datum(player)
    .call(star)
    .call(star.interaction);
}

// p = {'asts':4, 'turnover':3, 'blk':1, 'reb':2, 'stl':2, 'pts':21, 'firstname':'Mike', 'lastname':'Elliot'}