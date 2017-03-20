// pull in desired CSS/SASS files
require( './styles/main.scss' );
var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );           // <--- remove if jQuery not needed
require( '../../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js' );   // <--- remove if Bootstrap's JS not needed

// inject bundled Elm app into div#main

var Elm = require( '../elm/Main' );
var app = Elm.Main.embed( document.getElementById( 'main' ) );

console.log(app);

var speak = require('../static/speak');
var toggleStartStop = speak.toggleStartStop
speak.init(app.ports.listening)

console.log(toggleStartStop);

$('button').click(toggleStartStop);

// app.ports.toggleStartStop.subscribe(function (result) {
//
//       app.ports.listening.send(result);
//
//     });

    // function toggleStartStop(){
    //
    //   app.ports.listening.send(result);
    //
    // }
