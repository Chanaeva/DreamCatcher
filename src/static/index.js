// pull in desired CSS/SASS files
require( './styles/main.scss' );
var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );           // <--- remove if jQuery not needed
require( '../../node_modules/bootstrap-sass/assets/javascripts/bootstrap.js' );   // <--- remove if Bootstrap's JS not needed

// inject bundled Elm app into div#main

var Elm = require( '../elm/Main' );
var app = Elm.Main.embed( document.getElementById( 'main' ) );

// var signup = Elm.Signup.embed( document.getElementById( 'signup' ) );

console.log(app);

var speak = require('../static/speak');
var toggleStartStop = speak.toggleStartStop
speak.init(app.ports.listening)

console.log(toggleStartStop);

const API_URL = getHostUrl();

function getHostUrl(){
  if (window.location.host.indexOf('localhost') != -1) {
    return 'http://localhost:3000'
  } else {
    return 'https://dreamshit.herokuapp.com'
  }
}

function getDreamInfo(){
  return $.get(`${API_URL}/api/dreamers`)

}

$('#button').click(toggleStartStop);


  $('#save').click(function(){
    console.log("hello");
     var dream = $('input').val();
     console.log(dream);
      return $.post(`${API_URL}/api/dreamer`, {dream: dream} ).then(function(){
      window.location = "/static/d3.html#5"
      })

  console.log($('input').val());
})
