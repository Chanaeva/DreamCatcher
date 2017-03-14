var recognizing;
var recognition = new webkitSpeechRecognition();
recognition.continuous = true;
reset();
recognition.onend = reset();

recognition.onresult = function (event) {
  for (var i = event.resultIndex; i < event.results.length; ++i) {
    if (event.results[i].isFinal) {
      textarea.value += event.results[i][0].transcript;
    }
  }
}

function reset() {
  recognizing = false;
  button.innerHTML = "Record Dream";
}

function toggleStartStop() {
  if (recognizing) {
    recognition.stop();
    reset();
  } else {
    recognition.start();
    recognizing = true;
    button.innerHTML = "Click to Stop";
  }
}
