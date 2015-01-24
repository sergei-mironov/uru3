
structure B = Bootstrap
structure BM = BootstrapMisc

fun main {} : transaction page =
  let
  Uru.run (
  JQuery.add (
  Bootstrap.add (
  BootstrapMisc.add (
  Uru.withStylesheet (BSM1_css.geturl) (
  Uru.withBody (fn _ =>
    let
      val data = data_attr data_kind
    in
      i <- fresh;

      s <- source "15";

      return
      <xml>
        <div class={B.container}>

          <h1>Slider demo</h1>
          <br/>

          <ctextbox id={i}/>

          <active code={
            BM.slider_add i
              { Min = 0, Max = 20, Step = 1, Value = 2, Label = "Current value",
                OnSlide = (fn v => set s (show v)) 
              };
            return <xml/>
          }/>

          <br/>
          <dyn signal={v <- signal s; return <xml>Value: {[v]}</xml>}/>

          <a href={bless "https://github.com/grwlf/uru3"}>
            <img style="position:absolute; top:0; right:0; border:0;" src={bless "https://camo.githubusercontent.com/365986a132ccd6a44c23a9169022c0b5c890c387/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f7265645f6161303030302e706e67"} alt="Fork me on GitHub" data={data_attr data_kind "canonical-src" "https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png"}/>
          </a>

        </div> <!-- /container -->
      </xml>
    end
    ))))))
  where
  end
