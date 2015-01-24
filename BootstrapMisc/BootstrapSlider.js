
function bootstrap_slider_add__unit (
  /* id */ i,
  /* { Label : string,
       Min : int,
       Max : int,
       Step : int,
       Value : int,
       Tooltip : string,
       OnSlide : (int -> transaction {})
     }
   */ o) {

  $('#'+i).slider({
    min : o._Min,
    max : o._Max,
    step : o._Step,
    value : o._Value,
    tooltip : o._Tooltip,
    formatter: function(value) {
      return o._Label + ': ' + value;
    }
  });

  $('#'+i).on("slide", function(slideEvt) {
    execF(execF(o._OnSlide, slideEvt.value));
  });

  execF(execF(o._OnSlide, o._Value));
}
