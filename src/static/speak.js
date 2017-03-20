var $ = jQuery = require( '../../node_modules/jquery/dist/jquery.js' );

function init(pub){
 elmPub = pub;
}
var elmPub = null;
var recognizing;
var recognition = new webkitSpeechRecognition();
recognition.continuous = true;
reset();
recognition.onend = reset();

recognition.onresult = function (event) {
var result = "";
  for (var i = event.resultIndex; i < event.results.length; ++i) {
    if (event.results[i].isFinal) {
      result += event.results[i][0].transcript;
    }
  }
  elmPub.send(result);
}

function reset() {
  recognizing = false;
  button.innerHTML = "Record Dream";
}

 function toggleStartStop(){
  if (recognizing) {
    recognition.stop();
    reset();
  } else {
    recognition.start();
    recognizing = true;
    button.innerHTML = "Click to Stop";
  }
}

module.exports = {toggleStartStop, init };
