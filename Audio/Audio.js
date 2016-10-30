
function audio_play__unit(elem__id) {
  document.getElementById(elem__id).play();
}

function audio_pause__unit(elem__id) {
  document.getElementById(elem__id).pause();
}

function audio_position__unit(elem__id, time__int) {
  document.getElementById(elem__id).currentTime = time__int;
}
