
function audio_play__unit(elem__id) {
  var a = document.getElementById(elem__id);
  if(a.clearEvents) a.clearEvents();
  a.play();
}

function audio_pause__unit(elem__id) {
  document.getElementById(elem__id).pause();
}

function audio_setPosition__unit(elem__id, time__int) {
  var a = document.getElementById(elem__id);
  if(a.clearEvents) a.clearEvents();
  a.currentTime = time__int;
}

function audio_getPosition__int(elem__id) {
  return document.getElementById(elem__id).currentTime;
}

function audio_playInterval__unit(elem__id, tstart__int, tstop__int) {
  var a = document.getElementById(elem__id);

  var handler = function(event) {
    if (a.currentTime >= tstop__int) {
      a.pause();
    }
  }

  a.clearEvents = function() {
    a.removeEventListener('timeupdate', handler);
  }

  a.addEventListener('timeupdate', handler);
  a.currentTime = tstart__int;
  a.play();
}
