
const API_URL = getHostUrl();

function getHostUrl() {
    if (window.location.host.indexOf('localhost') != -1) {
        return 'http://localhost:3000'
    } else {
        return 'https://dreamshit.herokuapp.com'
    }
}

$.get(`${API_URL}/api/dreamer/:id`).then(function(response) {
 console.log(response);
    let dream = response.data.map(function (dreamer){
      return dreamer.dream
    }).join(" ").split(" ")
       console.log(dream);
    let frequency_list = []
    for (let i = 0; i < dream.length; i++) {
        var counter = 0;
        var found = false;
        while (!found && counter < frequency_list.length - 1) {
            if (frequency_list[counter].text === dream[i]) {
                frequency_list[counter].size++;
                found = true;
            }
            counter++
        }
        if (!found) {
            frequency_list.push({
                text: dream[i],
                size: 1
            })
        }
    }
    console.log(frequency_list);
    createCloud(frequency_list);
})


function createCloud(frequency_list) {


    var fill = d3.scale.ordinal()
        .domain([0, 1, 2, 3, 4, 5, 6, 10, 15, 20, 100])
        .range(["#FFFFFF", "#fc8d62", "#8da0cb", "#e78ac3", "#a6d854"]);


        var layout = d3.layout.cloud()
            .size([2050, 950])
            .words(frequency_list)
            .padding(15)
            // .rotate(function() { return ~~(Math.random() * 2) * 90; })
            .font("Impact")
            .fontSize(function(d) { return d.size; })
            .on("end", draw);

        layout.start();


        function draw(words) {
          d3.select("body").append("svg")
              .attr("width", layout.size()[0])
              .attr("height", layout.size()[1])
              .append("g")
              .attr("transform", "translate(" + layout.size()[0] / 2 + "," + layout.size()[1] / 2 + ")")
              .selectAll("text")
              .data(words)
             .enter().append("text")
              .style("font-size", function(d) { return d.size * 15 + "px"; })
              .style("font-family", "Impact")
              .style("fill", function(d, i) { return fill(i); })
              .attr("text-anchor", "middle")
              .attr("transform", function(d) {
                return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
              })
              .text(function(d) { return d.text; });
        }
 }
