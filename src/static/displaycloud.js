
const API_URL = getHostUrl();

function getHostUrl() {
    if (window.location.host.indexOf('localhost') != -1) {
        return 'http://localhost:3000'
    } else {
        return 'https://dreamshit.herokuapp.com'
    }
}


$.get(`${API_URL}/api/dreamers`).then(function(response) {
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


    var color = d3.scale.ordinal()
        .domain([0, 1, 2, 3, 4, 5, 6, 10, 15, 20, 100])
        .range(["#FFFFFF", "#fc8d62", "#8da0cb", "#e78ac3", "#a6d854"]);



    d3.layout.cloud()
        .size([960, 500])
        .words(frequency_list)
        .padding(5)
        .rotate(function() { return ~~(Math.random() * 2) * 90; })
        .fontSize(function(d) { return d.size; })
        .on("end", draw)
        .start();

    function draw(words) {
        d3.select("body").append("svg")
            .attr("width", 350)
            .attr("height", 350)
            .attr("class", "wordcloud")
            .append("g")
            .attr("transform", "translate(150,150)")
            .selectAll("text")
            .data(words)
            .enter().append("text")
            .style("font-size", function(d) {
                return d.size * 20 + "px";
            })
            .style("fill", function(d, i) {
                return color(i);
            })
            .attr("text-anchor", "middle")
            .attr("transform", function(d) {
                return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
            })
            .text(function(d) {
                return d.text;
            });
    }
}
